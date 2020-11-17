class ArticlesController < ApplicationController
  before_action :find_article, except: [:index, :new, :create]

  def index
    @articles = Aritcle.all
  end

  def show; end

  def new
    @article = Aritcle.new
  end

  def create
    @article = Aritcle.create(article_params)
    redirect_to article_path(article)
  end

  def edit; end

  def update
    @article.update(article_params)
    redirect_to article_path(article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def find_article
    @article = Aritcle.find(params[:id])
  end

  def article_params
    params.require(article).permit(:title, :content)
  end
end
