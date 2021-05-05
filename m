Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.972.1620239723005126889
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 11:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TWFLvMy5;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id q127so2547689qkb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 11:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3L4hTp0AQrv6KpUbDAgUln7fQg6C/oJkabLcRcXMzCA=;
        b=TWFLvMy5M0AtTSEH04K/WfGCOVujs8m6FIZ08VHn3nZRSn3r6GXkAXv+7Fip1oA3yD
         taLmBEN30HVoQc4NlEUlW17iBQRaNny9PvEaNU6QqlPLA+LBUC5xvmoOwm2gXvTVqTi2
         ou+AfZISy9nIAiUiNM5DNaHnYLsEnxR/tphHeMssSWwFb7LoE8+Hd1xG+kFwxAO9Ikyr
         P48xiauPqDe5PjZXd8iEUQ+c4A0El84SfMiXbbBZdszr1bWa7B6Ln+CqxSNp7lm7pJop
         4l2W4Sx4eVzFF7wEZy9T2XHXmgVexdC0a4pmUh+VNK0prcCXhBYWte/nPEY6dQdyEOvN
         XrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3L4hTp0AQrv6KpUbDAgUln7fQg6C/oJkabLcRcXMzCA=;
        b=ArK6LbZ1+Nr5x872quwyi9qNaRNm9LzCAxpFAy/PDqePwrsXiMKdUpMpRvFZ9tuJRj
         cqtveKGEMuCyXdqSnS1rNj/hIBs0//+nCdpSKdCcSARlVLQ1lhP6eRROwZLAVrlEv496
         Xhu48TM8gX+h8ZloLSLaHvnfR2GuiHatDIe8OXFwf0p2WJz1LzuMRSrjvnDriaeRnmFJ
         DGtAxoghfCsJ8OL3k/LtXMM0LrDlLeEOywBsPNFmQf/LHCrYMnSN7cftNgl0+sUN5G87
         8N1MhnRstNpyAaYw2EhSrchIWLmL9Ya9rghTR6W4UhYnAhvQJZs4n8aJDCyq0+xe/KDr
         RDew==
X-Gm-Message-State: AOAM532K+/it44RAlIjD2o2+ZlYqaa7Qg70mDoEzt71iUPLrlMRvzrlm
	iE5UiAvoPFr15xMjXsPX/1QtRIDqpqUgv7Xw058=
X-Google-Smtp-Source: ABdhPJxCtY9uw8uRBzJQsEXij4+bNcZV3xhoimRNkubbuXxOJgjyOqGbFWfMatFxL+KOASZ6CBEz+sZMHt7v7lWMwI0=
X-Received: by 2002:a37:994:: with SMTP id 142mr104359qkj.119.1620239722066;
 Wed, 05 May 2021 11:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com> <20210505151850.660512-10-alex.kanavin@gmail.com>
In-Reply-To: <20210505151850.660512-10-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 5 May 2021 11:34:55 -0700
Message-ID: <CAMKF1sr=EyGjLS3U0VfujRXsmOGQzuLC56foz-TpFnWnRD5WVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/61] cmake: update 3.19.5 -> 3.20.1
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

before we remove it, lets hear a Review from Otavio and perhaps he has
better history with this patch

On Wed, May 5, 2021 at 8:19 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Remove 0002-cmake-Prevent-the-detection-of-Qt5.patch
> (patch purpose and failing scenarios unclear; disabling
> is better done through configuration options which
> are available for all of these items).
>
> License-Update: copyright years
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...ative_3.19.5.bb => cmake-native_3.20.1.bb} |   0
>  meta/recipes-devtools/cmake/cmake.inc         |   5 +-
>  ...stem-use-oe-environment-vars-to-load.patch |   2 +-
>  ...2-cmake-Prevent-the-detection-of-Qt5.patch | 122 ------------------
>  .../{cmake_3.19.5.bb => cmake_3.20.1.bb}      |   0
>  5 files changed, 3 insertions(+), 126 deletions(-)
>  rename meta/recipes-devtools/cmake/{cmake-native_3.19.5.bb => cmake-native_3.20.1.bb} (100%)
>  delete mode 100644 meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
>  rename meta/recipes-devtools/cmake/{cmake_3.19.5.bb => cmake_3.20.1.bb} (100%)
>
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.19.5.bb b/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/cmake/cmake-native_3.19.5.bb
> rename to meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
> index e0f59a6c67..2e6059f980 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -10,19 +10,18 @@ HOMEPAGE = "http://www.cmake.org/"
>  BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
>  SECTION = "console/utils"
>  LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://Copyright.txt;md5=c721f56fce89ba2eadc2fdd8ba1f4d83 \
> +LIC_FILES_CHKSUM = "file://Copyright.txt;md5=31023e1d3f51ca90a58f55bcee8e2339 \
>                      file://Source/cmake.h;beginline=1;endline=2;md5=a5f70e1fef8614734eae0d62b4f5891b \
>                      "
>
>  CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
>
>  SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
> -           file://0002-cmake-Prevent-the-detection-of-Qt5.patch \
>             file://0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch \
>             file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
>  "
>
> -SRC_URI[sha256sum] = "c432296eb5dec6d71eae15d140f6297d63df44e9ffe3e453628d1dc8fc4201ce"
> +SRC_URI[sha256sum] = "3f1808b9b00281df06c91dd7a021d7f52f724101000da7985a401678dfe035b0"
>
>  UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
> index 8181510324..06e10bf861 100644
> --- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
> +++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
> @@ -1,4 +1,4 @@
> -From 66d5b27dc37ef6243f6549e16d0285ba6c064a6e Mon Sep 17 00:00:00 2001
> +From ac9b8d316ff3e013bc9d3c063db99aa1f064ce6a Mon Sep 17 00:00:00 2001
>  From: Cody P Schafer <dev@codyps.com>
>  Date: Thu, 27 Apr 2017 11:35:05 -0400
>  Subject: [PATCH] CMakeDetermineSystem: use oe environment vars to load default
> diff --git a/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch b/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
> deleted file mode 100644
> index 33db07ccf0..0000000000
> --- a/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
> +++ /dev/null
> @@ -1,122 +0,0 @@
> -From 98abade8cc119e076e4c5f1461c5188f6d49c1d8 Mon Sep 17 00:00:00 2001
> -From: Otavio Salvador <otavio@ossystems.com.br>
> -Date: Wed, 17 Jan 2018 10:02:14 -0200
> -Subject: [PATCH] cmake: Prevent the detection of Qt5
> -
> -Organization: O.S. Systems Software LTDA.
> -
> -CMake doesn't have dependency on qt4/qt5, so these tests usually fail
> -but still can cause undeterministic results or build failures (when
> -OE_QMAKE_PATH_EXTERNAL_HOST_BINS is undefined or native qmake removed
> -while running the test in cmake)
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> -
> ----
> - Source/QtDialog/CMakeLists.txt                     | 2 +-
> - Tests/CMakeLists.txt                               | 2 +-
> - Tests/Qt4And5Automoc/CMakeLists.txt                | 4 ++--
> - Tests/QtAutogen/AutogenGuiTest.cmake               | 3 +--
> - Tests/QtAutogen/MacOsFW/CMakeLists.txt             | 2 +-
> - Tests/RunCMake/CMakeLists.txt                      | 2 +-
> - Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake | 2 +-
> - 7 files changed, 8 insertions(+), 9 deletions(-)
> -
> -diff --git a/Source/QtDialog/CMakeLists.txt b/Source/QtDialog/CMakeLists.txt
> -index 452a303..d0a9fb4 100644
> ---- a/Source/QtDialog/CMakeLists.txt
> -+++ b/Source/QtDialog/CMakeLists.txt
> -@@ -3,7 +3,7 @@
> -
> - project(QtDialog)
> - CMake_OPTIONAL_COMPONENT(cmake-gui)
> --find_package(Qt5Widgets REQUIRED)
> -+#find_package(Qt5Widgets REQUIRED)
> -
> - set(CMake_QT_EXTRA_LIBRARIES)
> -
> -diff --git a/Tests/CMakeLists.txt b/Tests/CMakeLists.txt
> -index 1fb47cb..e022229 100644
> ---- a/Tests/CMakeLists.txt
> -+++ b/Tests/CMakeLists.txt
> -@@ -251,7 +251,7 @@ if(BUILD_TESTING)
> -     set(CMake_TEST_Qt5 1)
> -   endif()
> -   if(CMake_TEST_Qt5)
> --    find_package(Qt5Widgets QUIET NO_MODULE)
> -+    #find_package(Qt5Widgets QUIET NO_MODULE)
> -   endif()
> -
> -   if(NOT CMake_TEST_EXTERNAL_CMAKE)
> -diff --git a/Tests/Qt4And5Automoc/CMakeLists.txt b/Tests/Qt4And5Automoc/CMakeLists.txt
> -index ad74961..a9dd74b 100644
> ---- a/Tests/Qt4And5Automoc/CMakeLists.txt
> -+++ b/Tests/Qt4And5Automoc/CMakeLists.txt
> -@@ -3,11 +3,11 @@ cmake_minimum_required(VERSION 2.8.12)
> - project(Qt4And5Automoc)
> -
> - if (QT_REVERSE_FIND_ORDER)
> --  find_package(Qt5Core REQUIRED)
> -+  #find_package(Qt5Core REQUIRED)
> -   find_package(Qt4 REQUIRED)
> - else()
> -   find_package(Qt4 REQUIRED)
> --  find_package(Qt5Core REQUIRED)
> -+  #find_package(Qt5Core REQUIRED)
> - endif()
> -
> - set(CMAKE_AUTOMOC ON)
> -diff --git a/Tests/QtAutogen/AutogenGuiTest.cmake b/Tests/QtAutogen/AutogenGuiTest.cmake
> -index b76d341..a6e0acb 100644
> ---- a/Tests/QtAutogen/AutogenGuiTest.cmake
> -+++ b/Tests/QtAutogen/AutogenGuiTest.cmake
> -@@ -22,8 +22,7 @@ if (QT_TEST_VERSION EQUAL 4)
> -   endmacro()
> -
> - elseif(QT_TEST_VERSION EQUAL 5)
> --
> --  find_package(Qt5Widgets REQUIRED)
> -+  #find_package(Qt5Widgets REQUIRED)
> -
> -   set(QT_QTCORE_TARGET Qt5::Core)
> -   set(QT_LIBRARIES Qt5::Widgets)
> -diff --git a/Tests/QtAutogen/MacOsFW/CMakeLists.txt b/Tests/QtAutogen/MacOsFW/CMakeLists.txt
> -index c08efc4..87e25d9 100644
> ---- a/Tests/QtAutogen/MacOsFW/CMakeLists.txt
> -+++ b/Tests/QtAutogen/MacOsFW/CMakeLists.txt
> -@@ -2,7 +2,7 @@ cmake_minimum_required(VERSION 3.10)
> - project(MacOsFW)
> - include("../AutogenGuiTest.cmake")
> -
> --find_package(Qt5Test REQUIRED)
> -+#find_package(Qt5Test REQUIRED)
> -
> - set(CMAKE_CXX_STANDARD 11)
> - set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/output/bin)
> -diff --git a/Tests/RunCMake/CMakeLists.txt b/Tests/RunCMake/CMakeLists.txt
> -index 370dd76..6bacbff 100644
> ---- a/Tests/RunCMake/CMakeLists.txt
> -+++ b/Tests/RunCMake/CMakeLists.txt
> -@@ -473,7 +473,7 @@ if(NOT WIN32)
> - endif ()
> -
> - find_package(Qt4 QUIET)
> --find_package(Qt5Core QUIET)
> -+#find_package(Qt5Core QUIET)
> - if (QT4_FOUND AND Qt5Core_FOUND AND NOT Qt5Core_VERSION VERSION_LESS 5.1.0)
> -   add_RunCMake_test(IncompatibleQt)
> - endif()
> -diff --git a/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake b/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
> -index 4fccdc4..b76e1e5 100644
> ---- a/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
> -+++ b/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
> -@@ -1,6 +1,6 @@
> -
> - find_package(Qt4 REQUIRED)
> --find_package(Qt5Core REQUIRED)
> -+#find_package(Qt5Core REQUIRED)
> -
> - add_executable(mainexe main.cpp)
> - target_link_libraries(mainexe Qt4::QtCore Qt5::Core)
> diff --git a/meta/recipes-devtools/cmake/cmake_3.19.5.bb b/meta/recipes-devtools/cmake/cmake_3.20.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/cmake/cmake_3.19.5.bb
> rename to meta/recipes-devtools/cmake/cmake_3.20.1.bb
> --
> 2.31.1
>
>
> 
>
