class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    github = GithubService.new

    session[:token] = github.authenticate!(ENV['GITHUB_ID'], ENV['GITHUB_SECRET'], params[:code])
    session[:username] = github.get_username

    redirect_to '/'
  end
end
