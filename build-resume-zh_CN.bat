@echo off
setlocal

REM Always run from this script's directory
cd /d "%~dp0" || exit /b 1

REM Build resume (XeLaTeX via latexmk)
latexmk -xelatex -file-line-error -interaction=nonstopmode "resume-zh_CN.tex"
set "EXITCODE=%ERRORLEVEL%"

if not "%EXITCODE%"=="0" (
    echo.
    echo Build failed with exit code %EXITCODE%.
    echo.
    pause
)

exit /b %EXITCODE%
