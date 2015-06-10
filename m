Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6A2DA7573C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 16:49:30 +0000 (UTC)
Received: by qkhq76 with SMTP id q76so28155043qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 09:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ETlteTlxKhLPnIoxiFXu6LBLMbjXPc7MN/vhHt40Q9Y=;
	b=JiokTKB/u9Xsl9b8oXehxiHj5jHT/KfOZXwf0vnFhy2wP4jFJJ49Ct/dAMTx2SXdla
	XUENQPpU0Jb3q/700hu12S9fR5NaO7VkpEK0YfKg6HPjlfrSS18BpL6mh4fgU6s1nCJl
	AmnRaN8eMQzHKHcHLk0qgmI63ooKXUyt1N6SwJ30yjf/Amtr1+g+zteAoaGehKCB3u6C
	1+9WeLYR6MUQtACCsl0G25mSpQPN3TSPlMXDfjp95BxDUvjrKwaWmLBvlP/W4ahx+WvB
	RyRfD0tPTsOtKDi4jq70od2GpvitHoM6Gu70IQOUqZvNatMSCjoUzl15/5HcfvtUKS3h
	ncxQ==
X-Gm-Message-State: ALoCoQlR0I4qv3xM11K6FkdJbrObuYdclqpv30uaNXMn4ZK+ijBq5Q27uXefGGDZtBI8z5UeLEEr
X-Received: by 10.140.235.19 with SMTP id g19mr5477141qhc.52.1433954971038;
	Wed, 10 Jun 2015 09:49:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 10 Jun 2015 09:49:10 -0700 (PDT)
In-Reply-To: <1433921778-1835-2-git-send-email-moritz.blume@bmw-carit.de>
References: <1433921778-1835-1-git-send-email-moritz.blume@bmw-carit.de>
	<1433921778-1835-2-git-send-email-moritz.blume@bmw-carit.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Jun 2015 17:49:10 +0100
Message-ID: <CAJTo0LYZY_8ZC2pLBL6YKg+Da+6TS5h0d+2gmsLRmJxWwzfGZQ@mail.gmail.com>
To: Moritz Blume <moritz.blume@bmw-carit.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/2] cmake: Upgrade 2.8.12.2 -> 3.2.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Jun 2015 16:49:31 -0000
Content-Type: multipart/alternative; boundary=001a11376dacac5de405182ca809

--001a11376dacac5de405182ca809
Content-Type: text/plain; charset=UTF-8

I see this causes piglit to fail to build, which is a problem if we want
this in oe-core.   I'm having a quick look to see if upgrading piglit helps
but right now this is blocking merging.

Ross

On 10 June 2015 at 08:36, Moritz Blume <moritz.blume@bmw-carit.de> wrote:

> Patches "qt4-fail-silent.patch" and "support-oe-qt4-tools-names.patch"
> were adapted in order to fit to CMake 3.2.2 (refer to the commit
> message in the respective patch for details).
> Patch "cmake-2.8.11.2-FindFreetype.patch" was dropped since it was
> rejected upstream and its functionality otherwise implemented in the
> meantime.
>
> Note that CMake 3 needs to have the full compiler path in the toolchain
> file (see cmake.bbclass).
>
> Signed-off-by: Moritz Blume <moritz.blume@bmw-carit.de>
> ---
>  meta/classes/cmake.bbclass                         |  8 ++-
>  .../cmake/cmake-native_2.8.12.2.bb                 | 19 ------
>  meta/recipes-devtools/cmake/cmake-native_3.2.2.bb  | 19 ++++++
>  meta/recipes-devtools/cmake/cmake.inc              | 12 ++--
>  .../cmake/cmake/cmake-2.8.11.2-FindFreetype.patch  | 47 ---------------
>  .../cmake/cmake/qt4-fail-silent.patch              | 30 ++++++++--
>  .../cmake/cmake/support-oe-qt4-tools-names.patch   | 70
> ++++++++++------------
>  meta/recipes-devtools/cmake/cmake_2.8.12.2.bb      | 52 ----------------
>  meta/recipes-devtools/cmake/cmake_3.2.2.bb         | 56 +++++++++++++++++
>  9 files changed, 144 insertions(+), 169 deletions(-)
>  delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
>  create mode 100644 meta/recipes-devtools/cmake/cmake-native_3.2.2.bb
>  delete mode 100644
> meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-FindFreetype.patch
>  delete mode 100644 meta/recipes-devtools/cmake/cmake_2.8.12.2.bb
>  create mode 100644 meta/recipes-devtools/cmake/cmake_3.2.2.bb
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index 1ebb936..c97fd02 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -10,9 +10,11 @@ CCACHE = ""
>  # We want the staging and installing functions from autotools
>  inherit autotools
>
> -# C/C++ Compiler (without cpu arch/tune arguments)
> -OECMAKE_C_COMPILER ?= "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
> -OECMAKE_CXX_COMPILER ?= "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
> +# Full path to C/C++ Compiler (without cpu arch/tune arguments)
> +C_COMPILER = "$(echo ${CC} | sed 's/^\([^ ]*\).*/\1/')"
> +CXX_COMPILER = "$(echo ${CXX} | sed 's/^\([^ ]*\).*/\1/')"
> +OECMAKE_C_COMPILER ?= "$(which ${C_COMPILER})"
> +OECMAKE_CXX_COMPILER ?= "$(which ${CXX_COMPILER})"
>  OECMAKE_AR ?= "${AR}"
>
>  # Compiler flags
> diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
> b/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
> deleted file mode 100644
> index e40dfdd..0000000
> --- a/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -require cmake.inc
> -inherit native
> -
> -# Using cmake's internal libarchive, so some dependencies are needed
> -DEPENDS += "bzip2-native zlib-native"
> -
> -SRC_URI += "\
> -    file://cmlibarchive-disable-ext2fs.patch \
> -"
> -
> -SRC_URI[md5sum] = "17c6513483d23590cbce6957ec6d1e66"
> -SRC_URI[sha256sum] =
> "8c6574e9afabcb9fc66f463bb1f2f051958d86c85c37fccf067eb1a44a120e5e"
> -
> -# Disable ccmake since we don't depend on ncurses
> -CMAKE_EXTRACONF = "\
> -    -DBUILD_CursesDialog=0 \
> -    -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
> -    -DHAVE_SYS_ACL_H=0 \
> -"
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.2.2.bb
> b/meta/recipes-devtools/cmake/cmake-native_3.2.2.bb
> new file mode 100644
> index 0000000..17e9e2c
> --- /dev/null
> +++ b/meta/recipes-devtools/cmake/cmake-native_3.2.2.bb
> @@ -0,0 +1,19 @@
> +require cmake.inc
> +inherit native
> +
> +# Using cmake's internal libarchive, so some dependencies are needed
> +DEPENDS += "bzip2-native zlib-native"
> +
> +SRC_URI += "\
> +    file://cmlibarchive-disable-ext2fs.patch \
> +"
> +
> +SRC_URI[md5sum] = "2da57308071ea98b10253a87d2419281"
> +SRC_URI[sha256sum] =
> "ade94e6e36038774565f2aed8866415443444fb7a362eb0ea5096e40d5407c78"
> +
> +# Disable ccmake since we don't depend on ncurses
> +CMAKE_EXTRACONF = "\
> +    -DBUILD_CursesDialog=0 \
> +    -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
> +    -DHAVE_SYS_ACL_H=0 \
> +"
> diff --git a/meta/recipes-devtools/cmake/cmake.inc
> b/meta/recipes-devtools/cmake/cmake.inc
> index 28b7f2d..d1cb7ab 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -6,7 +6,7 @@ HOMEPAGE = "http://www.cmake.org/"
>  BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
>  SECTION = "console/utils"
>  LICENSE = "BSD"
> -LIC_FILES_CHKSUM =
> "file://Copyright.txt;md5=bb2fa3a08736b842556f6171bb9e8ae1 \
> +LIC_FILES_CHKSUM =
> "file://Copyright.txt;md5=3ba5a6c34481652ce573e5c4e1d707e4 \
>
>  file://Source/cmake.h;beginline=1;endline=10;md5=341736dae83c9e344b53eeb1bc7d7bc2"
>
>  CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
> @@ -14,11 +14,8 @@ CMAKE_MAJOR_VERSION =
> "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
>  SRC_URI = "
> http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
>             file://support-oe-qt4-tools-names.patch \
>             file://qt4-fail-silent.patch \
> -           file://cmake-2.8.11.2-FindFreetype.patch \
>             "
>
> -PR = "r1"
> -
>  inherit autotools
>
>  # Ugly hack to work around undefined OE_QMAKE_PATH_EXTERNAL_HOST_BINS
> variable
> @@ -36,11 +33,12 @@ inherit autotools
>
>  do_configure_prepend() {
>         sed -i 's/^find_package(Qt5Core QUIET)$/#find_package(Qt5Core
> QUIET)/g' ${S}/Tests/RunCMake/CMakeLists.txt
> -       sed -i 's/^find_package(Qt5Core REQUIRED)/#find_package(Qt5Core
> REQUIRED)/g' ${S}/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
> -       sed -i 's/^  find_package(Qt5Widgets REQUIRED)/#
> find_package(Qt5Widgets REQUIRED)/g' ${S}/Tests/QtAutomoc/CMakeLists.txt
> -       sed -i 's/^find_package(Qt5Core REQUIRED)/#find_package(Qt5Core
> REQUIRED)/g' ${S}/Tests/Qt4And5Automoc/CMakeLists.txt
> +       sed -i 's/^  find_package(Qt5Core REQUIRED)/#
> find_package(Qt5Core REQUIRED)/g' ${S}/Tests/Qt4And5Automoc/CMakeLists.txt
>         sed -i 's/^  find_package(Qt5Widgets QUIET NO_MODULE)/#
> find_package(Qt5Widgets QUIET NO_MODULE)/g' ${S}/Tests/CMakeLists.txt
>         sed -i 's/^find_package(Qt5Widgets QUIET)/#find_package(Qt5Widgets
> QUIET)/g' ${S}/Source/QtDialog/CMakeLists.txt
> +       sed -i 's/^  find_package(Qt5Widgets REQUIRED)/#
> find_package(Qt5Widgets REQUIRED)/g'
> ${S}/Tests/QtAutoUicInterface/CMakeLists.txt
> +       sed -i 's/^  find_package(Qt5Widgets REQUIRED)/#
> find_package(Qt5Widgets REQUIRED)/g' ${S}/Tests/QtAutogen/CMakeLists.txt
> +       sed -i 's/^  find_package(Qt5Core REQUIRED)/#
> find_package(Qt5Core REQUIRED)/g'
> ${S}/Tests/QtAutogen/autorcc_depends/CMakeLists.txt
>  }
>
>  # Extra flags to pass to cmake invoked by bootstrap
> diff --git
> a/meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-FindFreetype.patch
> b/meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-FindFreetype.patch
> deleted file mode 100644
> index 1b523c0..0000000
> --- a/meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-FindFreetype.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From: Julian Ospald <hasufell@gentoo.org>
> -Date: Sun Dec  8 13:38:06 UTC 2013
> -Subject: fix check for freetype-2.5.1
> -
> -Upstream-Status: Submitted http://www.cmake.org/Bug/view.php?id=14601
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> -
> ---- old/Modules/FindFreetype.cmake
> -+++ new/Modules/FindFreetype.cmake
> -@@ -64,6 +64,19 @@
> -   PATH_SUFFIXES include/freetype2 include
> - )
> -
> -+if(NOT FREETYPE_INCLUDE_DIR_freetype2)
> -+  find_path(FREETYPE_INCLUDE_DIR_freetype2 config/ftheader.h
> -+    HINTS
> -+      ENV FREETYPE_DIR
> -+    PATHS
> -+      /usr/X11R6
> -+      /usr/local/X11R6
> -+      /usr/local/X11
> -+      /usr/freeware
> -+    PATH_SUFFIXES include/freetype2 include
> -+  )
> -+endif()
> -+
> - find_library(FREETYPE_LIBRARY
> -   NAMES freetype libfreetype freetype219
> -   HINTS
> -@@ -82,8 +95,14 @@
> - endif()
> - set(FREETYPE_LIBRARIES "${FREETYPE_LIBRARY}")
> -
> --if(FREETYPE_INCLUDE_DIR_freetype2 AND EXISTS
> "${FREETYPE_INCLUDE_DIR_freetype2}/freetype/freetype.h")
> --    file(STRINGS "${FREETYPE_INCLUDE_DIR_freetype2}/freetype/freetype.h"
> freetype_version_str
> -+if(EXISTS "${FREETYPE_INCLUDE_DIR_freetype2}/freetype/freetype.h")
> -+  set(FREETYPE_H "${FREETYPE_INCLUDE_DIR_freetype2}/freetype/freetype.h")
> -+elseif(EXISTS "${FREETYPE_INCLUDE_DIR_freetype2}/freetype.h")
> -+  set(FREETYPE_H "${FREETYPE_INCLUDE_DIR_freetype2}/freetype.h")
> -+endif()
> -+
> -+if(FREETYPE_INCLUDE_DIR_freetype2 AND FREETYPE_H)
> -+    file(STRINGS "${FREETYPE_H}" freetype_version_str
> -          REGEX "^#[\t ]*define[\t ]+FREETYPE_(MAJOR|MINOR|PATCH)[\t
> ]+[0-9]+$")
> -
> -     unset(FREETYPE_VERSION_STRING)
> diff --git a/meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch
> b/meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch
> index fd39f3f..80fc277 100644
> --- a/meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch
> +++ b/meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch
> @@ -13,10 +13,21 @@ Upstream-Status: Pending
>
>  Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>
> ---- cmake-2.8.11/Modules/FindQt4.cmake 2013-07-04 10:20:42.092848274 +0100
> -+++ cmake-2.8.11/Modules/FindQt4.cmake 2013-07-04 10:52:15.693380555 +0100
> -@@ -1025,21 +1025,22 @@
> -     set(_configs)
> +The patch was slightly adapted in order to match cmake 3.2.2:
> +Another set_property was introduced which had to be included
> +within the if(QT_QTCORE_FOUND) statement.
> +
> +Signed-off-by: Moritz Blume <moritz.blume@bmw-carit.de>
> +---
> + Modules/FindQt4.cmake | 39 ++++++++++++++++++++-------------------
> + 1 file changed, 20 insertions(+), 19 deletions(-)
> +
> +diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
> +index 6704769..9048e35 100644
> +--- a/Modules/FindQt4.cmake
> ++++ b/Modules/FindQt4.cmake
> +@@ -1000,25 +1000,26 @@ if (QT_QMAKE_EXECUTABLE AND
> +     endif()
>     endmacro()
>
>  -
> @@ -28,6 +39,10 @@ Signed-off-by: Paul Eggleton <
> paul.eggleton@linux.intel.com>
>  -      "${QT_MKSPECS_DIR}/default"
>  -      ${QT_INCLUDE_DIR}
>  -  )
> +-  set_property(TARGET Qt4::QtCore APPEND PROPERTY
> +-    INTERFACE_COMPILE_DEFINITIONS
> +-      $<$<NOT:$<CONFIG:Debug>>:QT_NO_DEBUG>
> +-  )
>  -  set_property(TARGET Qt4::QtCore PROPERTY
>  -    INTERFACE_QT_MAJOR_VERSION 4
>  -  )
> @@ -43,6 +58,10 @@ Signed-off-by: Paul Eggleton <
> paul.eggleton@linux.intel.com>
>  +        "${QT_MKSPECS_DIR}/default"
>  +        ${QT_INCLUDE_DIR}
>  +    )
> ++    set_property(TARGET Qt4::QtCore APPEND PROPERTY
> ++      INTERFACE_COMPILE_DEFINITIONS
> ++        $<$<NOT:$<CONFIG:Debug>>:QT_NO_DEBUG>
> ++    )
>  +    set_property(TARGET Qt4::QtCore PROPERTY
>  +      INTERFACE_QT_MAJOR_VERSION 4
>  +    )
> @@ -53,3 +72,6 @@ Signed-off-by: Paul Eggleton <
> paul.eggleton@linux.intel.com>
>
>     foreach(QT_MODULE ${QT_MODULES})
>       _QT4_ADJUST_LIB_VARS(${QT_MODULE})
> +--
> +1.9.1
> +
> diff --git
> a/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
> b/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
> index 0e311f7..15cbca8 100644
> --- a/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
> +++ b/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
> @@ -11,11 +11,19 @@ Upstream-Status: Inappropriate [embedded specific]
>
>  Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> -Index: cmake-2.8.11/Modules/FindQt4.cmake
> -===================================================================
> ---- cmake-2.8.11.orig/Modules/FindQt4.cmake
> -+++ cmake-2.8.11/Modules/FindQt4.cmake
> -@@ -569,7 +569,7 @@ endfunction()
> +The patch was slightly adapted in order to match cmake 3.2.2:
> +Instead of find_program, _find_qt4_program is now used.
> +
> +Signed-off-by: Moritz Blume <moritz.blume@bmw-carit.de>
> +---
> + Modules/FindQt4.cmake | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
> +index 11091b5..6704769 100644
> +--- a/Modules/FindQt4.cmake
> ++++ b/Modules/FindQt4.cmake
> +@@ -522,7 +522,7 @@ endfunction()
>
>   set(QT4_INSTALLED_VERSION_TOO_OLD FALSE)
>
> @@ -23,36 +31,24 @@ Index: cmake-2.8.11/Modules/FindQt4.cmake
>  +set(_QT4_QMAKE_NAMES qmake qmake2 qmake4 qmake-qt4 qmake-mac)
>   _qt4_find_qmake("${_QT4_QMAKE_NAMES}" QT_QMAKE_EXECUTABLE QTVERSION)
>
> - if (QT_QMAKE_EXECUTABLE AND QTVERSION)
> -@@ -1157,19 +1157,19 @@ if (QT_QMAKE_EXECUTABLE AND QTVERSION)
> -     )
> -
> -   find_program(QT_RCC_EXECUTABLE
> --    NAMES rcc
> -+    NAMES rcc4 rcc
> -     PATHS ${QT_BINARY_DIR}
> -     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
> -     )
> + if (QT_QMAKE_EXECUTABLE AND
> +@@ -1148,12 +1148,12 @@ if (QT_QMAKE_EXECUTABLE AND
> +   _find_qt4_program(QT_MOC_EXECUTABLE Qt4::moc moc-qt4 moc4 moc)
> +   _find_qt4_program(QT_UIC_EXECUTABLE Qt4::uic uic-qt4 uic4 uic)
> +   _find_qt4_program(QT_UIC3_EXECUTABLE Qt4::uic3 uic3)
> +-  _find_qt4_program(QT_RCC_EXECUTABLE Qt4::rcc rcc)
> +-  _find_qt4_program(QT_DBUSCPP2XML_EXECUTABLE Qt4::qdbuscpp2xml
> qdbuscpp2xml)
> +-  _find_qt4_program(QT_DBUSXML2CPP_EXECUTABLE Qt4::qdbusxml2cpp
> qdbusxml2cpp)
> ++  _find_qt4_program(QT_RCC_EXECUTABLE Qt4::rcc rcc4 rcc)
> ++  _find_qt4_program(QT_DBUSCPP2XML_EXECUTABLE Qt4::qdbuscpp2xml
> qdbuscpp2xml4 qdbuscpp2xml)
> ++  _find_qt4_program(QT_DBUSXML2CPP_EXECUTABLE Qt4::qdbusxml2cpp
> qdbusxml2cpp4 qdbusxml2cpp)
> +   _find_qt4_program(QT_LUPDATE_EXECUTABLE Qt4::lupdate lupdate-qt4
> lupdate4 lupdate)
> +   _find_qt4_program(QT_LRELEASE_EXECUTABLE Qt4::lrelease lrelease-qt4
> lrelease4 lrelease)
> +-  _find_qt4_program(QT_QCOLLECTIONGENERATOR_EXECUTABLE
> Qt4::qcollectiongenerator qcollectiongenerator-qt4 qcollectiongenerator)
> ++  _find_qt4_program(QT_QCOLLECTIONGENERATOR_EXECUTABLE
> Qt4::qcollectiongenerator qcollectiongenerator-qt4 qcollectiongenerator
> qcollectiongenerator4)
> +   _find_qt4_program(QT_DESIGNER_EXECUTABLE Qt4::designer designer-qt4
> designer4 designer)
> +   _find_qt4_program(QT_LINGUIST_EXECUTABLE Qt4::linguist linguist-qt4
> linguist4 linguist)
>
> -   find_program(QT_DBUSCPP2XML_EXECUTABLE
> --    NAMES qdbuscpp2xml
> -+    NAMES qdbuscpp2xml4 qdbuscpp2xml
> -     PATHS ${QT_BINARY_DIR}
> -     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
> -     )
> -
> -   find_program(QT_DBUSXML2CPP_EXECUTABLE
> --    NAMES qdbusxml2cpp
> -+    NAMES qdbusxml2cp4 qdbusxml2cpp
> -     PATHS ${QT_BINARY_DIR}
> -     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
> -     )
> -@@ -1187,7 +1187,7 @@ if (QT_QMAKE_EXECUTABLE AND QTVERSION)
> -     )
> -
> -   find_program(QT_QCOLLECTIONGENERATOR_EXECUTABLE
> --    NAMES qcollectiongenerator-qt4 qcollectiongenerator
> -+    NAMES qcollectiongenerator-qt4 qcollectiongenerator
> qcollectiongenerator4
> -     PATHS ${QT_BINARY_DIR}
> -     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
> -     )
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-devtools/cmake/cmake_2.8.12.2.bb
> b/meta/recipes-devtools/cmake/cmake_2.8.12.2.bb
> deleted file mode 100644
> index 66a6af6..0000000
> --- a/meta/recipes-devtools/cmake/cmake_2.8.12.2.bb
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -require cmake.inc
> -
> -inherit cmake
> -
> -DEPENDS += "curl expat zlib libarchive"
> -
> -SRC_URI += "file://dont-run-cross-binaries.patch"
> -
> -SRC_URI_append_class-nativesdk = " \
> -    file://OEToolchainConfig.cmake \
> -    file://environment.d-cmake.sh"
> -
> -SRC_URI[md5sum] = "17c6513483d23590cbce6957ec6d1e66"
> -SRC_URI[sha256sum] =
> "8c6574e9afabcb9fc66f463bb1f2f051958d86c85c37fccf067eb1a44a120e5e"
> -
> -# Strip ${prefix} from ${docdir}, set result into docdir_stripped
> -python () {
> -    prefix=d.getVar("prefix", True)
> -    docdir=d.getVar("docdir", True)
> -
> -    if not docdir.startswith(prefix):
> -        raise bb.build.FuncFailed('docdir must contain prefix as its
> prefix')
> -
> -    docdir_stripped = docdir[len(prefix):]
> -    if len(docdir_stripped) > 0 and docdir_stripped[0] == '/':
> -        docdir_stripped = docdir_stripped[1:]
> -
> -    d.setVar("docdir_stripped", docdir_stripped)
> -}
> -
> -EXTRA_OECMAKE=" \
> -    -DCMAKE_DOC_DIR=${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
> -    -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
> -    -DKWSYS_CHAR_IS_SIGNED=1 \
> -    -DBUILD_CursesDialog=0 \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'largefile',
> '-DKWSYS_LFS_WORKS=1', '-DKWSYS_LFS_DISABLE=1', d)} \
> -"
> -
> -do_install_append_class-nativesdk() {
> -    mkdir -p ${D}${datadir}/cmake
> -    install -m 644 ${WORKDIR}/OEToolchainConfig.cmake
> ${D}${datadir}/cmake/
> -
> -    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
> -    install -m 644 ${WORKDIR}/environment.d-cmake.sh
> ${D}${SDKPATHNATIVE}/environment-setup.d/cmake.sh
> -}
> -
> -FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}"
> -
> -FILES_${PN} += "${datadir}/cmake-${CMAKE_MAJOR_VERSION}"
> -FILES_${PN}-doc += "${docdir}/cmake-${CMAKE_MAJOR_VERSION}"
> -
> -BBCLASSEXTEND = "nativesdk"
> diff --git a/meta/recipes-devtools/cmake/cmake_3.2.2.bb
> b/meta/recipes-devtools/cmake/cmake_3.2.2.bb
> new file mode 100644
> index 0000000..4765f6c
> --- /dev/null
> +++ b/meta/recipes-devtools/cmake/cmake_3.2.2.bb
> @@ -0,0 +1,56 @@
> +require cmake.inc
> +
> +inherit cmake
> +
> +DEPENDS += "curl expat zlib libarchive xz ncurses bzip2"
> +
> +SRC_URI_append_class-nativesdk = " \
> +    file://OEToolchainConfig.cmake \
> +    file://environment.d-cmake.sh"
> +
> +SRC_URI[md5sum] = "2da57308071ea98b10253a87d2419281"
> +SRC_URI[sha256sum] =
> "ade94e6e36038774565f2aed8866415443444fb7a362eb0ea5096e40d5407c78"
> +
> +# Strip ${prefix} from ${docdir}, set result into docdir_stripped
> +python () {
> +    prefix=d.getVar("prefix", True)
> +    docdir=d.getVar("docdir", True)
> +
> +    if not docdir.startswith(prefix):
> +        raise bb.build.FuncFailed('docdir must contain prefix as its
> prefix')
> +
> +    docdir_stripped = docdir[len(prefix):]
> +    if len(docdir_stripped) > 0 and docdir_stripped[0] == '/':
> +        docdir_stripped = docdir_stripped[1:]
> +
> +    d.setVar("docdir_stripped", docdir_stripped)
> +}
> +
> +EXTRA_OECMAKE=" \
> +    -DCMAKE_DOC_DIR=${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
> +    -DCMAKE_USE_SYSTEM_LIBRARY_BZIP2=1 \
> +    -DCMAKE_USE_SYSTEM_LIBRARY_CURL=1 \
> +    -DCMAKE_USE_SYSTEM_LIBRARY_EXPAT=1 \
> +    -DCMAKE_USE_SYSTEM_LIBRARY_FORM=1 \
> +    -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=1 \
> +    -DCMAKE_USE_SYSTEM_LIBRARY_LIBLZMA=1 \
> +    -DCMAKE_USE_SYSTEM_LIBRARY_ZLIB=1 \
> +    -DKWSYS_CHAR_IS_SIGNED=1 \
> +    -DBUILD_CursesDialog=0 \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'largefile',
> '-DKWSYS_LFS_WORKS=1', '-DKWSYS_LFS_DISABLE=1', d)} \
> +"
> +
> +do_install_append_class-nativesdk() {
> +    mkdir -p ${D}${datadir}/cmake
> +    install -m 644 ${WORKDIR}/OEToolchainConfig.cmake
> ${D}${datadir}/cmake/
> +
> +    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
> +    install -m 644 ${WORKDIR}/environment.d-cmake.sh
> ${D}${SDKPATHNATIVE}/environment-setup.d/cmake.sh
> +}
> +
> +FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}"
> +
> +FILES_${PN} += "${datadir}/cmake-${CMAKE_MAJOR_VERSION}"
> +FILES_${PN}-doc += "${docdir}/cmake-${CMAKE_MAJOR_VERSION}"
> +
> +BBCLASSEXTEND = "nativesdk"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11376dacac5de405182ca809
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I see this causes piglit to fail to build, which is a prob=
lem if we want this in oe-core. =C2=A0 I&#39;m having a quick look to see i=
f upgrading piglit helps but right now this is blocking merging.<div><br></=
div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On 10 June 2015 at 08:36, Moritz Blume <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:moritz.blume@bmw-carit.de" target=3D"_blank">moritz.blume@bmw-c=
arit.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Patches &qu=
ot;qt4-fail-silent.patch&quot; and &quot;support-oe-qt4-tools-names.patch&q=
uot;<br>
were adapted in order to fit to CMake 3.2.2 (refer to the commit<br>
message in the respective patch for details).<br>
Patch &quot;cmake-2.8.11.2-FindFreetype.patch&quot; was dropped since it wa=
s<br>
rejected upstream and its functionality otherwise implemented in the<br>
meantime.<br>
<br>
Note that CMake 3 needs to have the full compiler path in the toolchain<br>
file (see cmake.bbclass).<br>
<br>
Signed-off-by: Moritz Blume &lt;<a href=3D"mailto:moritz.blume@bmw-carit.de=
">moritz.blume@bmw-carit.de</a>&gt;<br>
---<br>
=C2=A0meta/classes/cmake.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++-<br>
=C2=A0.../cmake/<a href=3D"http://cmake-native_2.8.12.2.bb" target=3D"_blan=
k">cmake-native_2.8.12.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 19 ------<br>
=C2=A0meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.2.2.bb" =
target=3D"_blank">cmake-native_3.2.2.bb</a>=C2=A0 | 19 ++++++<br>
=C2=A0meta/recipes-devtools/cmake/cmake.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 12 ++--<br>
=C2=A0.../cmake/cmake/cmake-2.8.11.2-FindFreetype.patch=C2=A0 | 47 --------=
-------<br>
=C2=A0.../cmake/cmake/qt4-fail-silent.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 30 ++++++++--<br>
=C2=A0.../cmake/cmake/support-oe-qt4-tools-names.patch=C2=A0 =C2=A0| 70 +++=
+++++++------------<br>
=C2=A0meta/recipes-devtools/cmake/<a href=3D"http://cmake_2.8.12.2.bb" targ=
et=3D"_blank">cmake_2.8.12.2.bb</a>=C2=A0 =C2=A0 =C2=A0 | 52 --------------=
--<br>
=C2=A0meta/recipes-devtools/cmake/<a href=3D"http://cmake_3.2.2.bb" target=
=3D"_blank">cmake_3.2.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 56 ++++++=
+++++++++++<br>
=C2=A09 files changed, 144 insertions(+), 169 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/cmake/<a href=3D"http://cmak=
e-native_2.8.12.2.bb" target=3D"_blank">cmake-native_2.8.12.2.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/cmake/<a href=3D"http://cmak=
e-native_3.2.2.bb" target=3D"_blank">cmake-native_3.2.2.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-F=
indFreetype.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/cmake/<a href=3D"http://cmak=
e_2.8.12.2.bb" target=3D"_blank">cmake_2.8.12.2.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/cmake/<a href=3D"http://cmak=
e_3.2.2.bb" target=3D"_blank">cmake_3.2.2.bb</a><br>
<br>
diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass<br>
index 1ebb936..c97fd02 100644<br>
--- a/meta/classes/cmake.bbclass<br>
+++ b/meta/classes/cmake.bbclass<br>
@@ -10,9 +10,11 @@ CCACHE =3D &quot;&quot;<br>
=C2=A0# We want the staging and installing functions from autotools<br>
=C2=A0inherit autotools<br>
<br>
-# C/C++ Compiler (without cpu arch/tune arguments)<br>
-OECMAKE_C_COMPILER ?=3D &quot;`echo ${CC} | sed &#39;s/^\([^ ]*\).*/\1/&#3=
9;`&quot;<br>
-OECMAKE_CXX_COMPILER ?=3D &quot;`echo ${CXX} | sed &#39;s/^\([^ ]*\).*/\1/=
&#39;`&quot;<br>
+# Full path to C/C++ Compiler (without cpu arch/tune arguments)<br>
+C_COMPILER =3D &quot;$(echo ${CC} | sed &#39;s/^\([^ ]*\).*/\1/&#39;)&quot=
;<br>
+CXX_COMPILER =3D &quot;$(echo ${CXX} | sed &#39;s/^\([^ ]*\).*/\1/&#39;)&q=
uot;<br>
+OECMAKE_C_COMPILER ?=3D &quot;$(which ${C_COMPILER})&quot;<br>
+OECMAKE_CXX_COMPILER ?=3D &quot;$(which ${CXX_COMPILER})&quot;<br>
=C2=A0OECMAKE_AR ?=3D &quot;${AR}&quot;<br>
<br>
=C2=A0# Compiler flags<br>
diff --git a/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_2.8=
.12.2.bb" target=3D"_blank">cmake-native_2.8.12.2.bb</a> b/meta/recipes-dev=
tools/cmake/<a href=3D"http://cmake-native_2.8.12.2.bb" target=3D"_blank">c=
make-native_2.8.12.2.bb</a><br>
deleted file mode 100644<br>
index e40dfdd..0000000<br>
--- a/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_2.8.12.2.b=
b" target=3D"_blank">cmake-native_2.8.12.2.bb</a><br>
+++ /dev/null<br>
@@ -1,19 +0,0 @@<br>
-require cmake.inc<br>
-inherit native<br>
-<br>
-# Using cmake&#39;s internal libarchive, so some dependencies are needed<b=
r>
-DEPENDS +=3D &quot;bzip2-native zlib-native&quot;<br>
-<br>
-SRC_URI +=3D &quot;\<br>
-=C2=A0 =C2=A0 file://cmlibarchive-disable-ext2fs.patch \<br>
-&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;17c6513483d23590cbce6957ec6d1e66&quot;<br>
-SRC_URI[sha256sum] =3D &quot;8c6574e9afabcb9fc66f463bb1f2f051958d86c85c37f=
ccf067eb1a44a120e5e&quot;<br>
-<br>
-# Disable ccmake since we don&#39;t depend on ncurses<br>
-CMAKE_EXTRACONF =3D &quot;\<br>
-=C2=A0 =C2=A0 -DBUILD_CursesDialog=3D0 \<br>
-=C2=A0 =C2=A0 -DENABLE_ACL=3D0 -DHAVE_ACL_LIBACL_H=3D0 \<br>
-=C2=A0 =C2=A0 -DHAVE_SYS_ACL_H=3D0 \<br>
-&quot;<br>
diff --git a/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.2=
.2.bb" target=3D"_blank">cmake-native_3.2.2.bb</a> b/meta/recipes-devtools/=
cmake/<a href=3D"http://cmake-native_3.2.2.bb" target=3D"_blank">cmake-nati=
ve_3.2.2.bb</a><br>
new file mode 100644<br>
index 0000000..17e9e2c<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.2.2.bb" =
target=3D"_blank">cmake-native_3.2.2.bb</a><br>
@@ -0,0 +1,19 @@<br>
+require cmake.inc<br>
+inherit native<br>
+<br>
+# Using cmake&#39;s internal libarchive, so some dependencies are needed<b=
r>
+DEPENDS +=3D &quot;bzip2-native zlib-native&quot;<br>
+<br>
+SRC_URI +=3D &quot;\<br>
+=C2=A0 =C2=A0 file://cmlibarchive-disable-ext2fs.patch \<br>
+&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;2da57308071ea98b10253a87d2419281&quot;<br>
+SRC_URI[sha256sum] =3D &quot;ade94e6e36038774565f2aed8866415443444fb7a362e=
b0ea5096e40d5407c78&quot;<br>
+<br>
+# Disable ccmake since we don&#39;t depend on ncurses<br>
+CMAKE_EXTRACONF =3D &quot;\<br>
+=C2=A0 =C2=A0 -DBUILD_CursesDialog=3D0 \<br>
+=C2=A0 =C2=A0 -DENABLE_ACL=3D0 -DHAVE_ACL_LIBACL_H=3D0 \<br>
+=C2=A0 =C2=A0 -DHAVE_SYS_ACL_H=3D0 \<br>
+&quot;<br>
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/=
cmake/cmake.inc<br>
index 28b7f2d..d1cb7ab 100644<br>
--- a/meta/recipes-devtools/cmake/cmake.inc<br>
+++ b/meta/recipes-devtools/cmake/cmake.inc<br>
@@ -6,7 +6,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.cmake.org/" target=
=3D"_blank">http://www.cmake.org/</a>&quot;<br>
=C2=A0BUGTRACKER =3D &quot;<a href=3D"http://public.kitware.com/Bug/my_view=
_page.php" target=3D"_blank">http://public.kitware.com/Bug/my_view_page.php=
</a>&quot;<br>
=C2=A0SECTION =3D &quot;console/utils&quot;<br>
=C2=A0LICENSE =3D &quot;BSD&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://Copyright.txt;md5=3Dbb2fa3a08736b842556f=
6171bb9e8ae1 \<br>
+LIC_FILES_CHKSUM =3D &quot;file://Copyright.txt;md5=3D3ba5a6c34481652ce573=
e5c4e1d707e4 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://Source/cmake.h;beginline=3D1;endline=3D10;md5=3D341736dae83c9e344=
b53eeb1bc7d7bc2&quot;<br>
<br>
=C2=A0CMAKE_MAJOR_VERSION =3D &quot;${@&#39;.&#39;.join(d.getVar(&#39;PV&#3=
9;,1).split(&#39;.&#39;)[0:2])}&quot;<br>
@@ -14,11 +14,8 @@ CMAKE_MAJOR_VERSION =3D &quot;${@&#39;.&#39;.join(d.getV=
ar(&#39;PV&#39;,1).split(&#39;.&#39;)[0:2])}&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://www.cmake.org/files/v${CMAKE_MAJO=
R_VERSION}/cmake-${PV}.tar.gz" target=3D"_blank">http://www.cmake.org/files=
/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://support-oe-qt4-tools-names=
.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://qt4-fail-silent.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cmake-2.8.11.2-FindFreetyp=
e.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-PR =3D &quot;r1&quot;<br>
-<br>
=C2=A0inherit autotools<br>
<br>
=C2=A0# Ugly hack to work around undefined OE_QMAKE_PATH_EXTERNAL_HOST_BINS=
 variable<br>
@@ -36,11 +33,12 @@ inherit autotools<br>
<br>
=C2=A0do_configure_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s/^find_package(Qt5Core QUIET)$/#fi=
nd_package(Qt5Core QUIET)/g&#39; ${S}/Tests/RunCMake/CMakeLists.txt<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s/^find_package(Qt5Core REQUIRED)/#=
find_package(Qt5Core REQUIRED)/g&#39; ${S}/Tests/RunCMake/IncompatibleQt/In=
compatibleQt.cmake<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s/^=C2=A0 find_package(Qt5Widgets R=
EQUIRED)/#=C2=A0 find_package(Qt5Widgets REQUIRED)/g&#39; ${S}/Tests/QtAuto=
moc/CMakeLists.txt<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s/^find_package(Qt5Core REQUIRED)/#=
find_package(Qt5Core REQUIRED)/g&#39; ${S}/Tests/Qt4And5Automoc/CMakeLists.=
txt<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s/^=C2=A0 find_package(Qt5Core REQU=
IRED)/#=C2=A0 find_package(Qt5Core REQUIRED)/g&#39; ${S}/Tests/Qt4And5Autom=
oc/CMakeLists.txt<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s/^=C2=A0 find_package(Qt5Widgets Q=
UIET NO_MODULE)/#=C2=A0 find_package(Qt5Widgets QUIET NO_MODULE)/g&#39; ${S=
}/Tests/CMakeLists.txt<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s/^find_package(Qt5Widgets QUIET)/#=
find_package(Qt5Widgets QUIET)/g&#39; ${S}/Source/QtDialog/CMakeLists.txt<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s/^=C2=A0 find_package(Qt5Widgets R=
EQUIRED)/#=C2=A0 find_package(Qt5Widgets REQUIRED)/g&#39; ${S}/Tests/QtAuto=
UicInterface/CMakeLists.txt<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s/^=C2=A0 find_package(Qt5Widgets R=
EQUIRED)/#=C2=A0 find_package(Qt5Widgets REQUIRED)/g&#39; ${S}/Tests/QtAuto=
gen/CMakeLists.txt<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s/^=C2=A0 find_package(Qt5Core REQU=
IRED)/#=C2=A0 find_package(Qt5Core REQUIRED)/g&#39; ${S}/Tests/QtAutogen/au=
torcc_depends/CMakeLists.txt<br>
=C2=A0}<br>
<br>
=C2=A0# Extra flags to pass to cmake invoked by bootstrap<br>
diff --git a/meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-FindFreetype.=
patch b/meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-FindFreetype.patch=
<br>
deleted file mode 100644<br>
index 1b523c0..0000000<br>
--- a/meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-FindFreetype.patch<b=
r>
+++ /dev/null<br>
@@ -1,47 +0,0 @@<br>
-From: Julian Ospald &lt;<a href=3D"mailto:hasufell@gentoo.org">hasufell@ge=
ntoo.org</a>&gt;<br>
-Date: Sun Dec=C2=A0 8 13:38:06 UTC 2013<br>
-Subject: fix check for freetype-2.5.1<br>
-<br>
-Upstream-Status: Submitted <a href=3D"http://www.cmake.org/Bug/view.php?id=
=3D14601" target=3D"_blank">http://www.cmake.org/Bug/view.php?id=3D14601</a=
><br>
-<br>
-Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">=
Martin.Jansa@gmail.com</a>&gt;<br>
-<br>
---- old/Modules/FindFreetype.cmake<br>
-+++ new/Modules/FindFreetype.cmake<br>
-@@ -64,6 +64,19 @@<br>
-=C2=A0 =C2=A0PATH_SUFFIXES include/freetype2 include<br>
- )<br>
-<br>
-+if(NOT FREETYPE_INCLUDE_DIR_freetype2)<br>
-+=C2=A0 find_path(FREETYPE_INCLUDE_DIR_freetype2 config/ftheader.h<br>
-+=C2=A0 =C2=A0 HINTS<br>
-+=C2=A0 =C2=A0 =C2=A0 ENV FREETYPE_DIR<br>
-+=C2=A0 =C2=A0 PATHS<br>
-+=C2=A0 =C2=A0 =C2=A0 /usr/X11R6<br>
-+=C2=A0 =C2=A0 =C2=A0 /usr/local/X11R6<br>
-+=C2=A0 =C2=A0 =C2=A0 /usr/local/X11<br>
-+=C2=A0 =C2=A0 =C2=A0 /usr/freeware<br>
-+=C2=A0 =C2=A0 PATH_SUFFIXES include/freetype2 include<br>
-+=C2=A0 )<br>
-+endif()<br>
-+<br>
- find_library(FREETYPE_LIBRARY<br>
-=C2=A0 =C2=A0NAMES freetype libfreetype freetype219<br>
-=C2=A0 =C2=A0HINTS<br>
-@@ -82,8 +95,14 @@<br>
- endif()<br>
- set(FREETYPE_LIBRARIES &quot;${FREETYPE_LIBRARY}&quot;)<br>
-<br>
--if(FREETYPE_INCLUDE_DIR_freetype2 AND EXISTS &quot;${FREETYPE_INCLUDE_DIR=
_freetype2}/freetype/freetype.h&quot;)<br>
--=C2=A0 =C2=A0 file(STRINGS &quot;${FREETYPE_INCLUDE_DIR_freetype2}/freety=
pe/freetype.h&quot; freetype_version_str<br>
-+if(EXISTS &quot;${FREETYPE_INCLUDE_DIR_freetype2}/freetype/freetype.h&quo=
t;)<br>
-+=C2=A0 set(FREETYPE_H &quot;${FREETYPE_INCLUDE_DIR_freetype2}/freetype/fr=
eetype.h&quot;)<br>
-+elseif(EXISTS &quot;${FREETYPE_INCLUDE_DIR_freetype2}/freetype.h&quot;)<b=
r>
-+=C2=A0 set(FREETYPE_H &quot;${FREETYPE_INCLUDE_DIR_freetype2}/freetype.h&=
quot;)<br>
-+endif()<br>
-+<br>
-+if(FREETYPE_INCLUDE_DIR_freetype2 AND FREETYPE_H)<br>
-+=C2=A0 =C2=A0 file(STRINGS &quot;${FREETYPE_H}&quot; freetype_version_str=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 REGEX &quot;^#[\t ]*define[\t ]+FREETYP=
E_(MAJOR|MINOR|PATCH)[\t ]+[0-9]+$&quot;)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0unset(FREETYPE_VERSION_STRING)<br>
diff --git a/meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch b/meta=
/recipes-devtools/cmake/cmake/qt4-fail-silent.patch<br>
index fd39f3f..80fc277 100644<br>
--- a/meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch<br>
+++ b/meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch<br>
@@ -13,10 +13,21 @@ Upstream-Status: Pending<br>
<br>
=C2=A0Signed-off-by: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@linu=
x.intel.com">paul.eggleton@linux.intel.com</a>&gt;<br>
<br>
---- cmake-2.8.11/Modules/FindQt4.cmake 2013-07-04 10:20:42.092848274 +0100=
<br>
-+++ cmake-2.8.11/Modules/FindQt4.cmake 2013-07-04 10:52:15.693380555 +0100=
<br>
-@@ -1025,21 +1025,22 @@<br>
-=C2=A0 =C2=A0 =C2=A0set(_configs)<br>
+The patch was slightly adapted in order to match cmake 3.2.2:<br>
+Another set_property was introduced which had to be included<br>
+within the if(QT_QTCORE_FOUND) statement.<br>
+<br>
+Signed-off-by: Moritz Blume &lt;<a href=3D"mailto:moritz.blume@bmw-carit.d=
e">moritz.blume@bmw-carit.de</a>&gt;<br>
+---<br>
+ Modules/FindQt4.cmake | 39 ++++++++++++++++++++-------------------<br>
+ 1 file changed, 20 insertions(+), 19 deletions(-)<br>
+<br>
+diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake<br>
+index 6704769..9048e35 100644<br>
+--- a/Modules/FindQt4.cmake<br>
++++ b/Modules/FindQt4.cmake<br>
+@@ -1000,25 +1000,26 @@ if (QT_QMAKE_EXECUTABLE AND<br>
+=C2=A0 =C2=A0 =C2=A0endif()<br>
=C2=A0 =C2=A0 endmacro()<br>
<br>
=C2=A0-<br>
@@ -28,6 +39,10 @@ Signed-off-by: Paul Eggleton &lt;<a href=3D"mailto:paul.=
eggleton@linux.intel.com">paul.eggleton@linux.intel.com</a>&gt;<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 &quot;${QT_MKSPECS_DIR}/default&quot;<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 ${QT_INCLUDE_DIR}<br>
=C2=A0-=C2=A0 )<br>
+-=C2=A0 set_property(TARGET Qt4::QtCore APPEND PROPERTY<br>
+-=C2=A0 =C2=A0 INTERFACE_COMPILE_DEFINITIONS<br>
+-=C2=A0 =C2=A0 =C2=A0 $&lt;$&lt;NOT:$&lt;CONFIG:Debug&gt;&gt;:QT_NO_DEBUG&=
gt;<br>
+-=C2=A0 )<br>
=C2=A0-=C2=A0 set_property(TARGET Qt4::QtCore PROPERTY<br>
=C2=A0-=C2=A0 =C2=A0 INTERFACE_QT_MAJOR_VERSION 4<br>
=C2=A0-=C2=A0 )<br>
@@ -43,6 +58,10 @@ Signed-off-by: Paul Eggleton &lt;<a href=3D"mailto:paul.=
eggleton@linux.intel.com">paul.eggleton@linux.intel.com</a>&gt;<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${QT_MKSPECS_DIR}/default&quot;<br=
>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${QT_INCLUDE_DIR}<br>
=C2=A0+=C2=A0 =C2=A0 )<br>
++=C2=A0 =C2=A0 set_property(TARGET Qt4::QtCore APPEND PROPERTY<br>
++=C2=A0 =C2=A0 =C2=A0 INTERFACE_COMPILE_DEFINITIONS<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 $&lt;$&lt;NOT:$&lt;CONFIG:Debug&gt;&gt;:QT_NO=
_DEBUG&gt;<br>
++=C2=A0 =C2=A0 )<br>
=C2=A0+=C2=A0 =C2=A0 set_property(TARGET Qt4::QtCore PROPERTY<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 INTERFACE_QT_MAJOR_VERSION 4<br>
=C2=A0+=C2=A0 =C2=A0 )<br>
@@ -53,3 +72,6 @@ Signed-off-by: Paul Eggleton &lt;<a href=3D"mailto:paul.e=
ggleton@linux.intel.com">paul.eggleton@linux.intel.com</a>&gt;<br>
<br>
=C2=A0 =C2=A0 foreach(QT_MODULE ${QT_MODULES})<br>
=C2=A0 =C2=A0 =C2=A0 _QT4_ADJUST_LIB_VARS(${QT_MODULE})<br>
+--<br>
+1.9.1<br>
+<br>
diff --git a/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.p=
atch b/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch<b=
r>
index 0e311f7..15cbca8 100644<br>
--- a/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch<br=
>
+++ b/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch<br=
>
@@ -11,11 +11,19 @@ Upstream-Status: Inappropriate [embedded specific]<br>
<br>
=C2=A0Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems=
.com.br">otavio@ossystems.com.br</a>&gt;<br>
<br>
-Index: cmake-2.8.11/Modules/FindQt4.cmake<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- cmake-2.8.11.orig/Modules/FindQt4.cmake<br>
-+++ cmake-2.8.11/Modules/FindQt4.cmake<br>
-@@ -569,7 +569,7 @@ endfunction()<br>
+The patch was slightly adapted in order to match cmake 3.2.2:<br>
+Instead of find_program, _find_qt4_program is now used.<br>
+<br>
+Signed-off-by: Moritz Blume &lt;<a href=3D"mailto:moritz.blume@bmw-carit.d=
e">moritz.blume@bmw-carit.de</a>&gt;<br>
+---<br>
+ Modules/FindQt4.cmake | 10 +++++-----<br>
+ 1 file changed, 5 insertions(+), 5 deletions(-)<br>
+<br>
+diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake<br>
+index 11091b5..6704769 100644<br>
+--- a/Modules/FindQt4.cmake<br>
++++ b/Modules/FindQt4.cmake<br>
+@@ -522,7 +522,7 @@ endfunction()<br>
<br>
=C2=A0 set(QT4_INSTALLED_VERSION_TOO_OLD FALSE)<br>
<br>
@@ -23,36 +31,24 @@ Index: cmake-2.8.11/Modules/FindQt4.cmake<br>
=C2=A0+set(_QT4_QMAKE_NAMES qmake qmake2 qmake4 qmake-qt4 qmake-mac)<br>
=C2=A0 _qt4_find_qmake(&quot;${_QT4_QMAKE_NAMES}&quot; QT_QMAKE_EXECUTABLE =
QTVERSION)<br>
<br>
- if (QT_QMAKE_EXECUTABLE AND QTVERSION)<br>
-@@ -1157,19 +1157,19 @@ if (QT_QMAKE_EXECUTABLE AND QTVERSION)<br>
-=C2=A0 =C2=A0 =C2=A0)<br>
-<br>
-=C2=A0 =C2=A0find_program(QT_RCC_EXECUTABLE<br>
--=C2=A0 =C2=A0 NAMES rcc<br>
-+=C2=A0 =C2=A0 NAMES rcc4 rcc<br>
-=C2=A0 =C2=A0 =C2=A0PATHS ${QT_BINARY_DIR}<br>
-=C2=A0 =C2=A0 =C2=A0NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH<br>
-=C2=A0 =C2=A0 =C2=A0)<br>
+ if (QT_QMAKE_EXECUTABLE AND<br>
+@@ -1148,12 +1148,12 @@ if (QT_QMAKE_EXECUTABLE AND<br>
+=C2=A0 =C2=A0_find_qt4_program(QT_MOC_EXECUTABLE Qt4::moc moc-qt4 moc4 moc=
)<br>
+=C2=A0 =C2=A0_find_qt4_program(QT_UIC_EXECUTABLE Qt4::uic uic-qt4 uic4 uic=
)<br>
+=C2=A0 =C2=A0_find_qt4_program(QT_UIC3_EXECUTABLE Qt4::uic3 uic3)<br>
+-=C2=A0 _find_qt4_program(QT_RCC_EXECUTABLE Qt4::rcc rcc)<br>
+-=C2=A0 _find_qt4_program(QT_DBUSCPP2XML_EXECUTABLE Qt4::qdbuscpp2xml qdbu=
scpp2xml)<br>
+-=C2=A0 _find_qt4_program(QT_DBUSXML2CPP_EXECUTABLE Qt4::qdbusxml2cpp qdbu=
sxml2cpp)<br>
++=C2=A0 _find_qt4_program(QT_RCC_EXECUTABLE Qt4::rcc rcc4 rcc)<br>
++=C2=A0 _find_qt4_program(QT_DBUSCPP2XML_EXECUTABLE Qt4::qdbuscpp2xml qdbu=
scpp2xml4 qdbuscpp2xml)<br>
++=C2=A0 _find_qt4_program(QT_DBUSXML2CPP_EXECUTABLE Qt4::qdbusxml2cpp qdbu=
sxml2cpp4 qdbusxml2cpp)<br>
+=C2=A0 =C2=A0_find_qt4_program(QT_LUPDATE_EXECUTABLE Qt4::lupdate lupdate-=
qt4 lupdate4 lupdate)<br>
+=C2=A0 =C2=A0_find_qt4_program(QT_LRELEASE_EXECUTABLE Qt4::lrelease lrelea=
se-qt4 lrelease4 lrelease)<br>
+-=C2=A0 _find_qt4_program(QT_QCOLLECTIONGENERATOR_EXECUTABLE Qt4::qcollect=
iongenerator qcollectiongenerator-qt4 qcollectiongenerator)<br>
++=C2=A0 _find_qt4_program(QT_QCOLLECTIONGENERATOR_EXECUTABLE Qt4::qcollect=
iongenerator qcollectiongenerator-qt4 qcollectiongenerator qcollectiongener=
ator4)<br>
+=C2=A0 =C2=A0_find_qt4_program(QT_DESIGNER_EXECUTABLE Qt4::designer design=
er-qt4 designer4 designer)<br>
+=C2=A0 =C2=A0_find_qt4_program(QT_LINGUIST_EXECUTABLE Qt4::linguist lingui=
st-qt4 linguist4 linguist)<br>
<br>
-=C2=A0 =C2=A0find_program(QT_DBUSCPP2XML_EXECUTABLE<br>
--=C2=A0 =C2=A0 NAMES qdbuscpp2xml<br>
-+=C2=A0 =C2=A0 NAMES qdbuscpp2xml4 qdbuscpp2xml<br>
-=C2=A0 =C2=A0 =C2=A0PATHS ${QT_BINARY_DIR}<br>
-=C2=A0 =C2=A0 =C2=A0NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH<br>
-=C2=A0 =C2=A0 =C2=A0)<br>
-<br>
-=C2=A0 =C2=A0find_program(QT_DBUSXML2CPP_EXECUTABLE<br>
--=C2=A0 =C2=A0 NAMES qdbusxml2cpp<br>
-+=C2=A0 =C2=A0 NAMES qdbusxml2cp4 qdbusxml2cpp<br>
-=C2=A0 =C2=A0 =C2=A0PATHS ${QT_BINARY_DIR}<br>
-=C2=A0 =C2=A0 =C2=A0NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH<br>
-=C2=A0 =C2=A0 =C2=A0)<br>
-@@ -1187,7 +1187,7 @@ if (QT_QMAKE_EXECUTABLE AND QTVERSION)<br>
-=C2=A0 =C2=A0 =C2=A0)<br>
-<br>
-=C2=A0 =C2=A0find_program(QT_QCOLLECTIONGENERATOR_EXECUTABLE<br>
--=C2=A0 =C2=A0 NAMES qcollectiongenerator-qt4 qcollectiongenerator<br>
-+=C2=A0 =C2=A0 NAMES qcollectiongenerator-qt4 qcollectiongenerator qcollec=
tiongenerator4<br>
-=C2=A0 =C2=A0 =C2=A0PATHS ${QT_BINARY_DIR}<br>
-=C2=A0 =C2=A0 =C2=A0NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH<br>
-=C2=A0 =C2=A0 =C2=A0)<br>
+--<br>
+1.9.1<br>
+<br>
diff --git a/meta/recipes-devtools/cmake/<a href=3D"http://cmake_2.8.12.2.b=
b" target=3D"_blank">cmake_2.8.12.2.bb</a> b/meta/recipes-devtools/cmake/<a=
 href=3D"http://cmake_2.8.12.2.bb" target=3D"_blank">cmake_2.8.12.2.bb</a><=
br>
deleted file mode 100644<br>
index 66a6af6..0000000<br>
--- a/meta/recipes-devtools/cmake/<a href=3D"http://cmake_2.8.12.2.bb" targ=
et=3D"_blank">cmake_2.8.12.2.bb</a><br>
+++ /dev/null<br>
@@ -1,52 +0,0 @@<br>
-require cmake.inc<br>
-<br>
-inherit cmake<br>
-<br>
-DEPENDS +=3D &quot;curl expat zlib libarchive&quot;<br>
-<br>
-SRC_URI +=3D &quot;file://dont-run-cross-binaries.patch&quot;<br>
-<br>
-SRC_URI_append_class-nativesdk =3D &quot; \<br>
-=C2=A0 =C2=A0 file://OEToolchainConfig.cmake \<br>
-=C2=A0 =C2=A0 file://<a href=3D"http://environment.d-cmake.sh" target=3D"_=
blank">environment.d-cmake.sh</a>&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;17c6513483d23590cbce6957ec6d1e66&quot;<br>
-SRC_URI[sha256sum] =3D &quot;8c6574e9afabcb9fc66f463bb1f2f051958d86c85c37f=
ccf067eb1a44a120e5e&quot;<br>
-<br>
-# Strip ${prefix} from ${docdir}, set result into docdir_stripped<br>
-python () {<br>
-=C2=A0 =C2=A0 prefix=3Dd.getVar(&quot;prefix&quot;, True)<br>
-=C2=A0 =C2=A0 docdir=3Dd.getVar(&quot;docdir&quot;, True)<br>
-<br>
-=C2=A0 =C2=A0 if not docdir.startswith(prefix):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.build.FuncFailed(&#39;docdir must con=
tain prefix as its prefix&#39;)<br>
-<br>
-=C2=A0 =C2=A0 docdir_stripped =3D docdir[len(prefix):]<br>
-=C2=A0 =C2=A0 if len(docdir_stripped) &gt; 0 and docdir_stripped[0] =3D=3D=
 &#39;/&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 docdir_stripped =3D docdir_stripped[1:]<br>
-<br>
-=C2=A0 =C2=A0 d.setVar(&quot;docdir_stripped&quot;, docdir_stripped)<br>
-}<br>
-<br>
-EXTRA_OECMAKE=3D&quot; \<br>
-=C2=A0 =C2=A0 -DCMAKE_DOC_DIR=3D${docdir_stripped}/cmake-${CMAKE_MAJOR_VER=
SION} \<br>
-=C2=A0 =C2=A0 -DCMAKE_USE_SYSTEM_LIBRARIES=3D1 \<br>
-=C2=A0 =C2=A0 -DKWSYS_CHAR_IS_SIGNED=3D1 \<br>
-=C2=A0 =C2=A0 -DBUILD_CursesDialog=3D0 \<br>
-=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;largefi=
le&#39;, &#39;-DKWSYS_LFS_WORKS=3D1&#39;, &#39;-DKWSYS_LFS_DISABLE=3D1&#39;=
, d)} \<br>
-&quot;<br>
-<br>
-do_install_append_class-nativesdk() {<br>
-=C2=A0 =C2=A0 mkdir -p ${D}${datadir}/cmake<br>
-=C2=A0 =C2=A0 install -m 644 ${WORKDIR}/OEToolchainConfig.cmake ${D}${data=
dir}/cmake/<br>
-<br>
-=C2=A0 =C2=A0 mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d<br>
-=C2=A0 =C2=A0 install -m 644 ${WORKDIR}/<a href=3D"http://environment.d-cm=
ake.sh" target=3D"_blank">environment.d-cmake.sh</a> ${D}${SDKPATHNATIVE}/e=
nvironment-setup.d/cmake.sh<br>
-}<br>
-<br>
-FILES_${PN}_append_class-nativesdk =3D &quot; ${SDKPATHNATIVE}&quot;<br>
-<br>
-FILES_${PN} +=3D &quot;${datadir}/cmake-${CMAKE_MAJOR_VERSION}&quot;<br>
-FILES_${PN}-doc +=3D &quot;${docdir}/cmake-${CMAKE_MAJOR_VERSION}&quot;<br=
>
-<br>
-BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
diff --git a/meta/recipes-devtools/cmake/<a href=3D"http://cmake_3.2.2.bb" =
target=3D"_blank">cmake_3.2.2.bb</a> b/meta/recipes-devtools/cmake/<a href=
=3D"http://cmake_3.2.2.bb" target=3D"_blank">cmake_3.2.2.bb</a><br>
new file mode 100644<br>
index 0000000..4765f6c<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/cmake/<a href=3D"http://cmake_3.2.2.bb" target=
=3D"_blank">cmake_3.2.2.bb</a><br>
@@ -0,0 +1,56 @@<br>
+require cmake.inc<br>
+<br>
+inherit cmake<br>
+<br>
+DEPENDS +=3D &quot;curl expat zlib libarchive xz ncurses bzip2&quot;<br>
+<br>
+SRC_URI_append_class-nativesdk =3D &quot; \<br>
+=C2=A0 =C2=A0 file://OEToolchainConfig.cmake \<br>
+=C2=A0 =C2=A0 file://<a href=3D"http://environment.d-cmake.sh" target=3D"_=
blank">environment.d-cmake.sh</a>&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;2da57308071ea98b10253a87d2419281&quot;<br>
+SRC_URI[sha256sum] =3D &quot;ade94e6e36038774565f2aed8866415443444fb7a362e=
b0ea5096e40d5407c78&quot;<br>
+<br>
+# Strip ${prefix} from ${docdir}, set result into docdir_stripped<br>
+python () {<br>
+=C2=A0 =C2=A0 prefix=3Dd.getVar(&quot;prefix&quot;, True)<br>
+=C2=A0 =C2=A0 docdir=3Dd.getVar(&quot;docdir&quot;, True)<br>
+<br>
+=C2=A0 =C2=A0 if not docdir.startswith(prefix):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.build.FuncFailed(&#39;docdir must con=
tain prefix as its prefix&#39;)<br>
+<br>
+=C2=A0 =C2=A0 docdir_stripped =3D docdir[len(prefix):]<br>
+=C2=A0 =C2=A0 if len(docdir_stripped) &gt; 0 and docdir_stripped[0] =3D=3D=
 &#39;/&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 docdir_stripped =3D docdir_stripped[1:]<br>
+<br>
+=C2=A0 =C2=A0 d.setVar(&quot;docdir_stripped&quot;, docdir_stripped)<br>
+}<br>
+<br>
+EXTRA_OECMAKE=3D&quot; \<br>
+=C2=A0 =C2=A0 -DCMAKE_DOC_DIR=3D${docdir_stripped}/cmake-${CMAKE_MAJOR_VER=
SION} \<br>
+=C2=A0 =C2=A0 -DCMAKE_USE_SYSTEM_LIBRARY_BZIP2=3D1 \<br>
+=C2=A0 =C2=A0 -DCMAKE_USE_SYSTEM_LIBRARY_CURL=3D1 \<br>
+=C2=A0 =C2=A0 -DCMAKE_USE_SYSTEM_LIBRARY_EXPAT=3D1 \<br>
+=C2=A0 =C2=A0 -DCMAKE_USE_SYSTEM_LIBRARY_FORM=3D1 \<br>
+=C2=A0 =C2=A0 -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=3D1 \<br>
+=C2=A0 =C2=A0 -DCMAKE_USE_SYSTEM_LIBRARY_LIBLZMA=3D1 \<br>
+=C2=A0 =C2=A0 -DCMAKE_USE_SYSTEM_LIBRARY_ZLIB=3D1 \<br>
+=C2=A0 =C2=A0 -DKWSYS_CHAR_IS_SIGNED=3D1 \<br>
+=C2=A0 =C2=A0 -DBUILD_CursesDialog=3D0 \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;largefi=
le&#39;, &#39;-DKWSYS_LFS_WORKS=3D1&#39;, &#39;-DKWSYS_LFS_DISABLE=3D1&#39;=
, d)} \<br>
+&quot;<br>
+<br>
+do_install_append_class-nativesdk() {<br>
+=C2=A0 =C2=A0 mkdir -p ${D}${datadir}/cmake<br>
+=C2=A0 =C2=A0 install -m 644 ${WORKDIR}/OEToolchainConfig.cmake ${D}${data=
dir}/cmake/<br>
+<br>
+=C2=A0 =C2=A0 mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d<br>
+=C2=A0 =C2=A0 install -m 644 ${WORKDIR}/<a href=3D"http://environment.d-cm=
ake.sh" target=3D"_blank">environment.d-cmake.sh</a> ${D}${SDKPATHNATIVE}/e=
nvironment-setup.d/cmake.sh<br>
+}<br>
+<br>
+FILES_${PN}_append_class-nativesdk =3D &quot; ${SDKPATHNATIVE}&quot;<br>
+<br>
+FILES_${PN} +=3D &quot;${datadir}/cmake-${CMAKE_MAJOR_VERSION}&quot;<br>
+FILES_${PN}-doc +=3D &quot;${docdir}/cmake-${CMAKE_MAJOR_VERSION}&quot;<br=
>
+<br>
+BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div>

--001a11376dacac5de405182ca809--
