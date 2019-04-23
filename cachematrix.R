## These function will use the scoping features of R to reduce cost of computing inverse matrices.
## The first function will create a special matrix which copies the object oriented programming factory idea
## to the scripting language.

## This function will store two matrices: the original one and the inverse one. set will create the inverse one and get will return its value
makeCacheMatrix <- function(x = matrix()) {
i<-NULL
  set<-function(y){
    x<<-y
    i<<-NULL
  }
  get<-function() x
  setinverse<-function(inverse) i<<-inverse
  getinverse<-function() i
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## This function is the 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i<-x$getinverse()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        } 
        data<-x$get()
        i<-solve(data)
        x$setinverse(i)
        i
}

