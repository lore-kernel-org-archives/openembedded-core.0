Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 21BD674E1F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 14:18:43 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id t79-v6so4537612qke.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 07:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=1Ev9X3ODPA95U0TJXRWoZI+EyuCunbPmH+tbZF27Zx4=;
	b=iwcjPcdydg5+uoIcUrWzELlAMDAqkNbbx/twJPf3h/U2BPvpmYKvvXkyFpMt0itc/C
	z+5hSlQVgA2XcCUzqtQzIJ8Tpe5H61B+LkPUTs7QJqz66f7rm5FWIJuCt2Gbn0UaLth4
	QInO3KUxRxEdkhOWo/jl8K3B4BvZ2RhOqHLv7ynbnFPS2P/ZldK3u1FhW6GIedrCbpDM
	OsYh67QCFg03deI9G0gXECBtEuB4Fi21nR1rnvdYZPrwb/CnD6cwBMcpx863+qHRoGlx
	4j5uj9ZqWNSc8VdGg5n/DCARWAY7tlF1UAHcG2py4DH3XBHTDVe2gqMBu6MNlEOqh9Rl
	978Q==
X-Gm-Message-State: APt69E2C4B1FPbbHRr9uAGU8syLTSHvjY4mHvhCBcMD45S5Jta0uWE1I
	VpovxBfQJg8DL0O6v5YSdH3+RQ==
X-Google-Smtp-Source: AAOMgpd1yoOVA7E61EogLsJts7U3FTBZ5ImomzVRtmDrSNnctWA3MAxx+8pa4XF39/3YwZXynC+VRg==
X-Received: by 2002:a37:5142:: with SMTP id
	f63-v6mr5141466qkb.369.1530800323126; 
	Thu, 05 Jul 2018 07:18:43 -0700 (PDT)
Received: from localhost.localdomain ([177.194.218.61])
	by smtp.gmail.com with ESMTPSA id
	c80-v6sm4188684qkj.54.2018.07.05.07.18.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 05 Jul 2018 07:18:42 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 05 Jul 2018 11:18:34 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu,  5 Jul 2018 11:18:33 -0300
Message-Id: <20180705141833.5399-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.18.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] cmake: Update 3.10.3 -> 3.11.4
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
X-List-Received-Date: Thu, 05 Jul 2018 14:18:44 -0000

This updates CMake to the current stable release and drop many
backported patches in the process.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...ative_3.10.3.bb => cmake-native_3.11.4.bb} |   4 +-
 meta/recipes-devtools/cmake/cmake.inc         |  21 +-
 ...1.66.0-dependency-and-release-update.patch |  52 ---
 ...correct-alphabetisation-of-headers-l.patch |  29 --
 ...1-cmake-Prevent-the-detection-of-Qt5.patch | 122 ++++++++
 ...ent-Architecture-and-Address-Model-t.patch | 132 --------
 ...-OpenEmbedded-Qt4-tool-binary-names.patch} |  15 +-
 ...if-system-Qt-installation-is-broken.patch} |  13 +-
 ...-for-upstream-packaged-libs-next-to-.patch |  31 --
 ...t2fs-ext2_fs.h-by-cmake-s-internal-.patch} |  18 +-
 ...te-imported-targets-for-future-Boost.patch |  35 ---
 ...indBoost-support-OPTIONAL_COMPONENTS.patch |  42 ---
 ...pport-for-Boost-1.67-with-Python-ver.patch | 296 ------------------
 .../cmake-Prevent-the-detection-of-Qt5.patch  | 215 -------------
 .../{cmake_3.10.3.bb => cmake_3.11.4.bb}      |   0
 15 files changed, 163 insertions(+), 862 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.10.3.bb => cmake-native_3.11.4.bb} (90%)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-FindBoost-Boost-1.66.0-dependency-and-release-update.patch
 delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-FindBoost-Fix-incorrect-alphabetisation-of-headers-l.patch
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-cmake-Prevent-the-detection-of-Qt5.patch
 delete mode 100644 meta/recipes-devtools/cmake/cmake/0002-FindBoost-Implement-Architecture-and-Address-Model-t.patch
 rename meta/recipes-devtools/cmake/cmake/{support-oe-qt4-tools-names.patch => 0002-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch} (87%)
 rename meta/recipes-devtools/cmake/cmake/{qt4-fail-silent.patch => 0003-Fail-silently-if-system-Qt-installation-is-broken.patch} (84%)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/0003-FindBoost-Search-for-upstream-packaged-libs-next-to-.patch
 rename meta/recipes-devtools/cmake/cmake/{cmlibarchive-disable-ext2fs.patch => 0004-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch} (58%)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/0004-FindBoost-Generate-imported-targets-for-future-Boost.patch
 delete mode 100644 meta/recipes-devtools/cmake/cmake/0005-FindBoost-support-OPTIONAL_COMPONENTS.patch
 delete mode 100644 meta/recipes-devtools/cmake/cmake/0006-FindBoost-Add-support-for-Boost-1.67-with-Python-ver.patch
 delete mode 100644 meta/recipes-devtools/cmake/cmake/cmake-Prevent-the-detection-of-Qt5.patch
 rename meta/recipes-devtools/cmake/{cmake_3.10.3.bb => cmake_3.11.4.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.10.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.11.4.bb
similarity index 90%
rename from meta/recipes-devtools/cmake/cmake-native_3.10.3.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.11.4.bb
index e55e8b1cf6..9f371e9b0c 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.10.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.11.4.bb
@@ -3,9 +3,7 @@ inherit native
 
 DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native curl-native"
 
-SRC_URI += "\
-    file://cmlibarchive-disable-ext2fs.patch \
-"
+SRC_URI += "file://0004-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch"
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 533db6ae86..436363e4e3 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -6,26 +6,19 @@ HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://Copyright.txt;md5=79b5b78197c74d5c5f9c7ccadeee4e8c \
+LIC_FILES_CHKSUM = "file://Copyright.txt;md5=891b81f415fb25fbad03e41f87fd5dfb \
                     file://Source/cmake.h;md5=4494dee184212fc89c469c3acd555a14;beginline=1;endline=3 \
                     "
 
 CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
-           file://support-oe-qt4-tools-names.patch \
-           file://qt4-fail-silent.patch \
-           file://cmake-Prevent-the-detection-of-Qt5.patch \
-           file://0001-FindBoost-Boost-1.66.0-dependency-and-release-update.patch \
-           file://0001-FindBoost-Fix-incorrect-alphabetisation-of-headers-l.patch \
-           file://0002-FindBoost-Implement-Architecture-and-Address-Model-t.patch \
-           file://0003-FindBoost-Search-for-upstream-packaged-libs-next-to-.patch \
-           file://0004-FindBoost-Generate-imported-targets-for-future-Boost.patch \
-           file://0005-FindBoost-support-OPTIONAL_COMPONENTS.patch \
-           file://0006-FindBoost-Add-support-for-Boost-1.67-with-Python-ver.patch \
-           "
+           file://0001-cmake-Prevent-the-detection-of-Qt5.patch \
+           file://0002-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch \
+           file://0003-Fail-silently-if-system-Qt-installation-is-broken.patch \
+"
 
-SRC_URI[md5sum] = "1c38c67295ca696aeafd8c059d748b38"
-SRC_URI[sha256sum] = "0c3a1dcf0be03e40cf4f341dda79c96ffb6c35ae35f2f911845b72dab3559cf8"
+SRC_URI[md5sum] = "72e168b3bad2f9c34dcebbad7af56ff0"
+SRC_URI[sha256sum] = "8f864e9f78917de3e1483e256270daabc4a321741592c5b36af028e72bff87f5"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/cmake/cmake/0001-FindBoost-Boost-1.66.0-dependency-and-release-update.patch b/meta/recipes-devtools/cmake/cmake/0001-FindBoost-Boost-1.66.0-dependency-and-release-update.patch
deleted file mode 100644
index fda60e3f1f..0000000000
--- a/meta/recipes-devtools/cmake/cmake/0001-FindBoost-Boost-1.66.0-dependency-and-release-update.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 433a2d495a2481c63b82c11a30f7c642d6abe63f Mon Sep 17 00:00:00 2001
-From: "Paul \"TBBle\" Hampson" <Paul.Hampson@Pobox.com>
-Date: Fri, 29 Dec 2017 19:55:49 +1100
-Subject: [PATCH] FindBoost: Boost 1.66.0 dependency and release update
-
-Release notes: http://www.boost.org/users/history/version_1_66_0.html
-
-* All new libraries are header-only.
-* _Boost_COMPONENT_DEPENDENCIES is unchanged from 1.65.1
-* _Boost_FIBER_COMPILER_FEATURES is unchanged from 1.64.0
-
-Upstream-Status: Backport
-[Yocto 12762]
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
-
----
- Modules/FindBoost.cmake | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-Index: cmake-3.10.3/Modules/FindBoost.cmake
-===================================================================
---- cmake-3.10.3.orig/Modules/FindBoost.cmake
-+++ cmake-3.10.3/Modules/FindBoost.cmake
-@@ -797,7 +797,7 @@ function(_Boost_COMPONENT_DEPENDENCIES c
-       set(_Boost_WAVE_DEPENDENCIES filesystem system serialization thread chrono date_time atomic)
-       set(_Boost_WSERIALIZATION_DEPENDENCIES serialization)
-     endif()
--    if(NOT Boost_VERSION VERSION_LESS 106600)
-+    if(NOT Boost_VERSION VERSION_LESS 106700)
-       message(WARNING "New Boost version may have incorrect or missing dependencies and imported targets")
-       set(_Boost_IMPORTED_TARGETS FALSE)
-     endif()
-@@ -931,8 +931,8 @@ endfunction()
- # `${Boost_ROOT}/libs/fiber/build/Jamfile.v2`.
- #
- function(_Boost_COMPILER_FEATURES component _ret)
--  # Boost >= 1.62 and < 1.65
--  if(NOT Boost_VERSION VERSION_LESS 106200 AND Boost_VERSION VERSION_LESS 106500)
-+  # Boost >= 1.62 and < 1.67
-+  if(NOT Boost_VERSION VERSION_LESS 106200 AND Boost_VERSION VERSION_LESS 106700)
-     set(_Boost_FIBER_COMPILER_FEATURES
-         cxx_alias_templates
-         cxx_auto_type
-@@ -1038,7 +1038,7 @@ else()
-   # _Boost_COMPONENT_HEADERS.  See the instructions at the top of
-   # _Boost_COMPONENT_DEPENDENCIES.
-   set(_Boost_KNOWN_VERSIONS ${Boost_ADDITIONAL_VERSIONS}
--    "1.65.1" "1.65.0" "1.65"
-+    "1.66.0" "1.66" "1.65.1" "1.65.0" "1.65"
-     "1.64.0" "1.64" "1.63.0" "1.63" "1.62.0" "1.62" "1.61.0" "1.61" "1.60.0" "1.60"
-     "1.59.0" "1.59" "1.58.0" "1.58" "1.57.0" "1.57" "1.56.0" "1.56" "1.55.0" "1.55"
-     "1.54.0" "1.54" "1.53.0" "1.53" "1.52.0" "1.52" "1.51.0" "1.51"
diff --git a/meta/recipes-devtools/cmake/cmake/0001-FindBoost-Fix-incorrect-alphabetisation-of-headers-l.patch b/meta/recipes-devtools/cmake/cmake/0001-FindBoost-Fix-incorrect-alphabetisation-of-headers-l.patch
deleted file mode 100644
index b3a75206f7..0000000000
--- a/meta/recipes-devtools/cmake/cmake/0001-FindBoost-Fix-incorrect-alphabetisation-of-headers-l.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From b1e9f67137733bc109d355450fcd06edda4784c5 Mon Sep 17 00:00:00 2001
-From: "Paul \"TBBle\" Hampson" <Paul.Hampson@Pobox.com>
-Date: Fri, 29 Dec 2017 20:07:31 +1100
-Subject: [PATCH 1/6] FindBoost: Fix incorrect alphabetisation of headers list
-
-Affects cmake < 3.11.0
-
-Upstream-Status: Backport
-[Yocto 12762]
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
-
----
- Modules/FindBoost.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: cmake-3.10.3/Modules/FindBoost.cmake
-===================================================================
---- cmake-3.10.3.orig/Modules/FindBoost.cmake
-+++ cmake-3.10.3/Modules/FindBoost.cmake
-@@ -831,8 +831,8 @@ function(_Boost_COMPONENT_HEADERS compon
-   set(_Boost_CONTAINER_HEADERS           "boost/container/container_fwd.hpp")
-   set(_Boost_CONTEXT_HEADERS             "boost/context/all.hpp")
-   set(_Boost_COROUTINE_HEADERS           "boost/coroutine/all.hpp")
--  set(_Boost_EXCEPTION_HEADERS           "boost/exception/exception.hpp")
-   set(_Boost_DATE_TIME_HEADERS           "boost/date_time/date.hpp")
-+  set(_Boost_EXCEPTION_HEADERS           "boost/exception/exception.hpp")
-   set(_Boost_FIBER_HEADERS               "boost/fiber/all.hpp")
-   set(_Boost_FILESYSTEM_HEADERS          "boost/filesystem/path.hpp")
-   set(_Boost_GRAPH_HEADERS               "boost/graph/adjacency_list.hpp")
diff --git a/meta/recipes-devtools/cmake/cmake/0001-cmake-Prevent-the-detection-of-Qt5.patch b/meta/recipes-devtools/cmake/cmake/0001-cmake-Prevent-the-detection-of-Qt5.patch
new file mode 100644
index 0000000000..b4976e918b
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-cmake-Prevent-the-detection-of-Qt5.patch
@@ -0,0 +1,122 @@
+From 0f60f3922bc85994fcde5079ce5a52f9b51f6915 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Wed, 17 Jan 2018 10:02:14 -0200
+Subject: [PATCH 1/4] cmake: Prevent the detection of Qt5
+Organization: O.S. Systems Software LTDA.
+
+CMake doesn't have dependency on qt4/qt5, so these tests usually fail
+but still can cause undeterministic results or build failures (when
+OE_QMAKE_PATH_EXTERNAL_HOST_BINS is undefined or native qmake removed
+while running the test in cmake)
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ Source/QtDialog/CMakeLists.txt                     | 2 +-
+ Tests/CMakeLists.txt                               | 2 +-
+ Tests/Qt4And5Automoc/CMakeLists.txt                | 4 ++--
+ Tests/QtAutogen/AutogenTest.cmake                  | 2 +-
+ Tests/QtAutogen/MacOsFW/CMakeLists.txt             | 2 +-
+ Tests/RunCMake/CMakeLists.txt                      | 2 +-
+ Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake | 2 +-
+ 7 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/Source/QtDialog/CMakeLists.txt b/Source/QtDialog/CMakeLists.txt
+index 330b74729..e7709dee6 100644
+--- a/Source/QtDialog/CMakeLists.txt
++++ b/Source/QtDialog/CMakeLists.txt
+@@ -6,7 +6,7 @@ if(POLICY CMP0020)
+   cmake_policy(SET CMP0020 NEW) # Drop when CMake >= 2.8.11 required
+ endif()
+ CMake_OPTIONAL_COMPONENT(cmake-gui)
+-find_package(Qt5Widgets QUIET)
++#find_package(Qt5Widgets QUIET)
+ if (Qt5Widgets_FOUND)
+   include_directories(${Qt5Widgets_INCLUDE_DIRS})
+   add_definitions(${Qt5Widgets_DEFINITONS})
+diff --git a/Tests/CMakeLists.txt b/Tests/CMakeLists.txt
+index 08bfebe0e..dd4d7f4fb 100644
+--- a/Tests/CMakeLists.txt
++++ b/Tests/CMakeLists.txt
+@@ -1260,7 +1260,7 @@ ${CMake_BINARY_DIR}/bin/cmake -DDIR=dev -P ${CMake_SOURCE_DIR}/Utilities/Release
+     set(CMake_TEST_Qt5 1)
+   endif()
+   if(CMake_TEST_Qt5)
+-    find_package(Qt5Widgets QUIET NO_MODULE)
++    #find_package(Qt5Widgets QUIET NO_MODULE)
+   endif()
+   if(CMake_TEST_Qt5 AND Qt5Widgets_FOUND)
+     add_subdirectory(Qt5Autogen)
+diff --git a/Tests/Qt4And5Automoc/CMakeLists.txt b/Tests/Qt4And5Automoc/CMakeLists.txt
+index ad74961d9..a9dd74b15 100644
+--- a/Tests/Qt4And5Automoc/CMakeLists.txt
++++ b/Tests/Qt4And5Automoc/CMakeLists.txt
+@@ -3,11 +3,11 @@ cmake_minimum_required(VERSION 2.8.12)
+ project(Qt4And5Automoc)
+ 
+ if (QT_REVERSE_FIND_ORDER)
+-  find_package(Qt5Core REQUIRED)
++  #find_package(Qt5Core REQUIRED)
+   find_package(Qt4 REQUIRED)
+ else()
+   find_package(Qt4 REQUIRED)
+-  find_package(Qt5Core REQUIRED)
++  #find_package(Qt5Core REQUIRED)
+ endif()
+ 
+ set(CMAKE_AUTOMOC ON)
+diff --git a/Tests/QtAutogen/AutogenTest.cmake b/Tests/QtAutogen/AutogenTest.cmake
+index 8c0a14fca..e9923b21a 100644
+--- a/Tests/QtAutogen/AutogenTest.cmake
++++ b/Tests/QtAutogen/AutogenTest.cmake
+@@ -22,7 +22,7 @@ if (QT_TEST_VERSION STREQUAL 4)
+   endmacro()
+ 
+ elseif(QT_TEST_VERSION STREQUAL 5)
+-  find_package(Qt5Widgets REQUIRED)
++  #find_package(Qt5Widgets REQUIRED)
+ 
+   set(QT_QTCORE_TARGET Qt5::Core)
+   set(QT_QTGUI_TARGET Qt5::Widgets)
+diff --git a/Tests/QtAutogen/MacOsFW/CMakeLists.txt b/Tests/QtAutogen/MacOsFW/CMakeLists.txt
+index 26d201926..e48e1c8de 100644
+--- a/Tests/QtAutogen/MacOsFW/CMakeLists.txt
++++ b/Tests/QtAutogen/MacOsFW/CMakeLists.txt
+@@ -2,7 +2,7 @@ cmake_minimum_required(VERSION 3.10)
+ project(MacOsFW)
+ include("../AutogenTest.cmake")
+ 
+-find_package(Qt5Test REQUIRED)
++#find_package(Qt5Test REQUIRED)
+ 
+ set(CMAKE_CXX_STANDARD 11)
+ set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/output/bin)
+diff --git a/Tests/RunCMake/CMakeLists.txt b/Tests/RunCMake/CMakeLists.txt
+index c52f44ece..d39cd8828 100644
+--- a/Tests/RunCMake/CMakeLists.txt
++++ b/Tests/RunCMake/CMakeLists.txt
+@@ -285,7 +285,7 @@ add_RunCMake_test(configure_file)
+ add_RunCMake_test(CTestTimeoutAfterMatch)
+ 
+ find_package(Qt4 QUIET)
+-find_package(Qt5Core QUIET)
++#find_package(Qt5Core QUIET)
+ if (QT4_FOUND AND Qt5Core_FOUND AND NOT Qt5Core_VERSION VERSION_LESS 5.1.0)
+   add_RunCMake_test(IncompatibleQt)
+ endif()
+diff --git a/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake b/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
+index 4fccdc418..b76e1e531 100644
+--- a/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
++++ b/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
+@@ -1,6 +1,6 @@
+ 
+ find_package(Qt4 REQUIRED)
+-find_package(Qt5Core REQUIRED)
++#find_package(Qt5Core REQUIRED)
+ 
+ add_executable(mainexe main.cpp)
+ target_link_libraries(mainexe Qt4::QtCore Qt5::Core)
+-- 
+2.18.0
+
diff --git a/meta/recipes-devtools/cmake/cmake/0002-FindBoost-Implement-Architecture-and-Address-Model-t.patch b/meta/recipes-devtools/cmake/cmake/0002-FindBoost-Implement-Architecture-and-Address-Model-t.patch
deleted file mode 100644
index d5d442a519..0000000000
--- a/meta/recipes-devtools/cmake/cmake/0002-FindBoost-Implement-Architecture-and-Address-Model-t.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From b044f69a413123f15a05034c00a8e3763764a1e5 Mon Sep 17 00:00:00 2001
-From: "Paul \"TBBle\" Hampson" <Paul.Hampson@Pobox.com>
-Date: Fri, 29 Dec 2017 21:50:54 +1100
-Subject: [PATCH 2/6] FindBoost: Implement "Architecture and Address Model" tag
-
-This tag is new in Boost 1.66.0, and is present in the 'versioned'
-library file name layout.
-
-Affects cmake < 3.11.0
-
-Upstream-Status: Backport
-[Yocto 12762]
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
-
----
- Modules/FindBoost.cmake | 52 +++++++++++++++++++++++++++++++++++++++----------
- 1 file changed, 42 insertions(+), 10 deletions(-)
-
-Index: cmake-3.10.3/Modules/FindBoost.cmake
-===================================================================
---- cmake-3.10.3.orig/Modules/FindBoost.cmake
-+++ cmake-3.10.3/Modules/FindBoost.cmake
-@@ -1385,8 +1385,11 @@ if(Boost_DEBUG)
- endif()
- 
- #======================
--# Systematically build up the Boost ABI tag
--# http://boost.org/doc/libs/1_41_0/more/getting_started/windows.html#library-naming
-+# Systematically build up the Boost ABI tag for the 'tagged' and 'versioned' layouts
-+# http://boost.org/doc/libs/1_66_0/more/getting_started/windows.html#library-naming
-+# http://boost.org/doc/libs/1_66_0/boost/config/auto_link.hpp
-+# http://boost.org/doc/libs/1_66_0/tools/build/src/tools/common.jam
-+# http://boost.org/doc/libs/1_66_0/boostcpp.jam
- set( _boost_RELEASE_ABI_TAG "-")
- set( _boost_DEBUG_ABI_TAG   "-")
- # Key       Use this library when:
-@@ -1418,11 +1421,40 @@ if(Boost_USE_STLPORT)
-   string(APPEND _boost_DEBUG_ABI_TAG "p")
- endif()
- #  n        using the STLport deprecated "native iostreams" feature
-+#           removed from the documentation in 1.43.0 but still present in
-+#           boost/config/auto_link.hpp
- if(Boost_USE_STLPORT_DEPRECATED_NATIVE_IOSTREAMS)
-   string(APPEND _boost_RELEASE_ABI_TAG "n")
-   string(APPEND _boost_DEBUG_ABI_TAG "n")
- endif()
- 
-+#  -x86     Architecture and address model tag
-+#           First character is the architecture, then word-size, either 32 or 64
-+#           Only used in 'versioned' layout, added in Boost 1.66.0
-+set(_boost_ARCHITECTURE_TAG "")
-+# {CMAKE_CXX_COMPILER_ARCHITECTURE_ID} is not currently set for all compilers
-+if(NOT "x${CMAKE_CXX_COMPILER_ARCHITECTURE_ID}" STREQUAL "x" AND NOT Boost_VERSION VERSION_LESS 106600)
-+  string(APPEND _boost_ARCHITECTURE_TAG "-")
-+  # This needs to be kept in-sync with the section of CMakePlatformId.h.in
-+  # inside 'defined(_WIN32) && defined(_MSC_VER)'
-+  if(${CMAKE_CXX_COMPILER_ARCHITECTURE_ID} STREQUAL "IA64")
-+    string(APPEND _boost_ARCHITECTURE_TAG "i")
-+  elseif(${CMAKE_CXX_COMPILER_ARCHITECTURE_ID} STREQUAL "X86"
-+            OR ${CMAKE_CXX_COMPILER_ARCHITECTURE_ID} STREQUAL "x64")
-+    string(APPEND _boost_ARCHITECTURE_TAG "x")
-+  elseif(${CMAKE_CXX_COMPILER_ARCHITECTURE_ID} MATCHES "^ARM")
-+    string(APPEND _boost_ARCHITECTURE_TAG "a")
-+  elseif(${CMAKE_CXX_COMPILER_ARCHITECTURE_ID} STREQUAL "MIPS")
-+    string(APPEND _boost_ARCHITECTURE_TAG "m")
-+  endif()
-+
-+  if(CMAKE_SIZEOF_VOID_P EQUAL 8)
-+    string(APPEND _boost_ARCHITECTURE_TAG "64")
-+  else()
-+    string(APPEND _boost_ARCHITECTURE_TAG "32")
-+  endif()
-+endif()
-+
- if(Boost_DEBUG)
-   message(STATUS "[ ${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE} ] "
-     "_boost_RELEASE_ABI_TAG = ${_boost_RELEASE_ABI_TAG}")
-@@ -1616,22 +1648,22 @@ foreach(COMPONENT ${Boost_FIND_COMPONENT
-   unset(_boost_RELEASE_NAMES)
-   foreach(compiler IN LISTS _boost_COMPILER)
-     list(APPEND _boost_RELEASE_NAMES
--      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG}-${Boost_LIB_VERSION}
-+      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
-       ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG} )
-   endforeach()
-   list(APPEND _boost_RELEASE_NAMES
--    ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG}-${Boost_LIB_VERSION}
-+    ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
-     ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG}
-     ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT} )
-   if(_boost_STATIC_RUNTIME_WORKAROUND)
-     set(_boost_RELEASE_STATIC_ABI_TAG "-s${_boost_RELEASE_ABI_TAG}")
-     foreach(compiler IN LISTS _boost_COMPILER)
-       list(APPEND _boost_RELEASE_NAMES
--        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG}-${Boost_LIB_VERSION}
-+        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
-         ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG} )
-     endforeach()
-     list(APPEND _boost_RELEASE_NAMES
--      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG}-${Boost_LIB_VERSION}
-+      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
-       ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG} )
-   endif()
-   if(Boost_THREADAPI AND ${COMPONENT} STREQUAL "thread")
-@@ -1666,11 +1698,11 @@ foreach(COMPONENT ${Boost_FIND_COMPONENT
-   unset(_boost_DEBUG_NAMES)
-   foreach(compiler IN LISTS _boost_COMPILER)
-     list(APPEND _boost_DEBUG_NAMES
--      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG}-${Boost_LIB_VERSION}
-+      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
-       ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG} )
-   endforeach()
-   list(APPEND _boost_DEBUG_NAMES
--    ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG}-${Boost_LIB_VERSION}
-+    ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
-     ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG}
-     ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}
-     ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT} )
-@@ -1678,11 +1710,11 @@ foreach(COMPONENT ${Boost_FIND_COMPONENT
-     set(_boost_DEBUG_STATIC_ABI_TAG "-s${_boost_DEBUG_ABI_TAG}")
-     foreach(compiler IN LISTS _boost_COMPILER)
-       list(APPEND _boost_DEBUG_NAMES
--        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG}-${Boost_LIB_VERSION}
-+        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
-         ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG} )
-     endforeach()
-     list(APPEND _boost_DEBUG_NAMES
--      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG}-${Boost_LIB_VERSION}
-+      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
-       ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG} )
-   endif()
-   if(Boost_THREADAPI AND ${COMPONENT} STREQUAL "thread")
diff --git a/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch b/meta/recipes-devtools/cmake/cmake/0002-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
similarity index 87%
rename from meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
rename to meta/recipes-devtools/cmake/cmake/0002-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
index 6841554763..acbe961c64 100644
--- a/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
+++ b/meta/recipes-devtools/cmake/cmake/0002-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
@@ -1,7 +1,8 @@
-From 10b8b523869124d2fc8cd98d9e028c0bcffd61b1 Mon Sep 17 00:00:00 2001
+From 5fc9c33a7d6781008877b19dfdf0a526a50524f2 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 12 May 2011 15:36:03 +0000
-Subject: [PATCH 1/2] cmake: support OpenEmbedded Qt4 tool binary names
+Subject: [PATCH 2/4] cmake: support OpenEmbedded Qt4 tool binary names
+Organization: O.S. Systems Software LTDA.
 
 The FindQt4 module looks for Qt4 binaries to be able to gather the
 paths used for compilation and also to be using during other processes
@@ -18,16 +19,16 @@ The patch was slightly adapted in order to match cmake 3.2.2:
 Instead of find_program, _find_qt4_program is now used.
 
 Signed-off-by: Moritz Blume <moritz.blume@bmw-carit.de>
-
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 ---
  Modules/FindQt4.cmake | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
-index c67d0be..0cf169b 100644
+index 5a7eadb96..d48a5bfd1 100644
 --- a/Modules/FindQt4.cmake
 +++ b/Modules/FindQt4.cmake
-@@ -516,7 +516,7 @@ endfunction()
+@@ -517,7 +517,7 @@ endfunction()
  
  set(QT4_INSTALLED_VERSION_TOO_OLD FALSE)
  
@@ -36,7 +37,7 @@ index c67d0be..0cf169b 100644
  _qt4_find_qmake("${_QT4_QMAKE_NAMES}" QT_QMAKE_EXECUTABLE QTVERSION)
  
  if (QT_QMAKE_EXECUTABLE AND
-@@ -1142,12 +1142,12 @@ if (QT_QMAKE_EXECUTABLE AND
+@@ -1143,12 +1143,12 @@ if (QT_QMAKE_EXECUTABLE AND
    _find_qt4_program(QT_MOC_EXECUTABLE Qt4::moc moc-qt4 moc4 moc)
    _find_qt4_program(QT_UIC_EXECUTABLE Qt4::uic uic-qt4 uic4 uic)
    _find_qt4_program(QT_UIC3_EXECUTABLE Qt4::uic3 uic3)
@@ -54,5 +55,5 @@ index c67d0be..0cf169b 100644
    _find_qt4_program(QT_LINGUIST_EXECUTABLE Qt4::linguist linguist-qt4 linguist4 linguist)
  
 -- 
-2.7.4
+2.18.0
 
diff --git a/meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch b/meta/recipes-devtools/cmake/cmake/0003-Fail-silently-if-system-Qt-installation-is-broken.patch
similarity index 84%
rename from meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch
rename to meta/recipes-devtools/cmake/cmake/0003-Fail-silently-if-system-Qt-installation-is-broken.patch
index 80fc277fa2..301da0221d 100644
--- a/meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch
+++ b/meta/recipes-devtools/cmake/cmake/0003-Fail-silently-if-system-Qt-installation-is-broken.patch
@@ -1,4 +1,8 @@
-Fail silently if system Qt installation is broken
+From b30da754a32213b5a0b3698f88e1302e5b18518b Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Thu, 5 Jul 2018 10:26:48 -0300
+Subject: [PATCH 3/4] Fail silently if system Qt installation is broken
+Organization: O.S. Systems Software LTDA.
 
 Fixes a regression in behaviour from 2.8.10 to 2.8.11 resulting in the
 following error if the system Qt installation is broken:
@@ -18,15 +22,16 @@ Another set_property was introduced which had to be included
 within the if(QT_QTCORE_FOUND) statement.
 
 Signed-off-by: Moritz Blume <moritz.blume@bmw-carit.de>
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 ---
  Modules/FindQt4.cmake | 39 ++++++++++++++++++++-------------------
  1 file changed, 20 insertions(+), 19 deletions(-)
 
 diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
-index 6704769..9048e35 100644
+index d48a5bfd1..e6f22fe9b 100644
 --- a/Modules/FindQt4.cmake
 +++ b/Modules/FindQt4.cmake
-@@ -1000,25 +1000,26 @@ if (QT_QMAKE_EXECUTABLE AND
+@@ -995,25 +995,26 @@ if (QT_QMAKE_EXECUTABLE AND
      endif()
    endmacro()
  
@@ -73,5 +78,5 @@ index 6704769..9048e35 100644
    foreach(QT_MODULE ${QT_MODULES})
      _QT4_ADJUST_LIB_VARS(${QT_MODULE})
 -- 
-1.9.1
+2.18.0
 
diff --git a/meta/recipes-devtools/cmake/cmake/0003-FindBoost-Search-for-upstream-packaged-libs-next-to-.patch b/meta/recipes-devtools/cmake/cmake/0003-FindBoost-Search-for-upstream-packaged-libs-next-to-.patch
deleted file mode 100644
index a44fa3e366..0000000000
--- a/meta/recipes-devtools/cmake/cmake/0003-FindBoost-Search-for-upstream-packaged-libs-next-to-.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d56deff7d127b030739bd0034609d0046121d8cd Mon Sep 17 00:00:00 2001
-From: "Paul \"TBBle\" Hampson" <Paul.Hampson@Pobox.com>
-Date: Fri, 29 Dec 2017 22:38:36 +1100
-Subject: [PATCH 3/6] FindBoost: Search for upstream-packaged libs next to
- includes
-
-Upstream packages Boost binaries for Windows with the 'boost' directory
-(the INCLUDE_DIR) next to the lib-... directory (the LIBRARY_DIR).
-
-Affects cmake < 3.11.0
-
-Upstream-Status: Backport
-[Yocto 12762]
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
-
----
- Modules/FindBoost.cmake | 1 +
- 1 file changed, 1 insertion(+)
-
-Index: cmake-3.10.3/Modules/FindBoost.cmake
-===================================================================
---- cmake-3.10.3.orig/Modules/FindBoost.cmake
-+++ cmake-3.10.3/Modules/FindBoost.cmake
-@@ -1502,6 +1502,7 @@ foreach(c DEBUG RELEASE)
-       ${Boost_INCLUDE_DIR}/stage/lib
-       )
-     _Boost_UPDATE_WINDOWS_LIBRARY_SEARCH_DIRS_WITH_PREBUILT_PATHS(_boost_LIBRARY_SEARCH_DIRS_${c} "${Boost_INCLUDE_DIR}/..")
-+    _Boost_UPDATE_WINDOWS_LIBRARY_SEARCH_DIRS_WITH_PREBUILT_PATHS(_boost_LIBRARY_SEARCH_DIRS_${c} "${Boost_INCLUDE_DIR}")
-     if( Boost_NO_SYSTEM_PATHS )
-       list(APPEND _boost_LIBRARY_SEARCH_DIRS_${c} NO_CMAKE_SYSTEM_PATH NO_SYSTEM_ENVIRONMENT_PATH)
-     else()
diff --git a/meta/recipes-devtools/cmake/cmake/cmlibarchive-disable-ext2fs.patch b/meta/recipes-devtools/cmake/cmake/0004-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
similarity index 58%
rename from meta/recipes-devtools/cmake/cmake/cmlibarchive-disable-ext2fs.patch
rename to meta/recipes-devtools/cmake/cmake/0004-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
index bf3671259e..91dea4cbba 100644
--- a/meta/recipes-devtools/cmake/cmake/cmlibarchive-disable-ext2fs.patch
+++ b/meta/recipes-devtools/cmake/cmake/0004-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
@@ -1,4 +1,9 @@
-Disable use of ext2fs/ext2_fs.h by cmake's internal libarchive copy
+From d9aa3f7c075dbd0db386995a44a2240ecdbb2c56 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Thu, 5 Jul 2018 10:28:04 -0300
+Subject: [PATCH 4/4] Disable use of ext2fs/ext2_fs.h by cmake's internal
+ libarchive copy
+Organization: O.S. Systems Software LTDA.
 
 We don't want to add a dependency on e2fsprogs-native for cmake-native,
 and we don't use CPack so just disable this functionality.
@@ -6,10 +11,16 @@ and we don't use CPack so just disable this functionality.
 Upstream-Status: Inappropriate [config]
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ Utilities/cmlibarchive/CMakeLists.txt | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
 
+diff --git a/Utilities/cmlibarchive/CMakeLists.txt b/Utilities/cmlibarchive/CMakeLists.txt
+index 206f3c6a5..642fb0dd9 100644
 --- a/Utilities/cmlibarchive/CMakeLists.txt
 +++ b/Utilities/cmlibarchive/CMakeLists.txt
-@@ -237,12 +237,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
+@@ -400,12 +400,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
  LA_CHECK_INCLUDE_FILE("direct.h" HAVE_DIRECT_H)
  LA_CHECK_INCLUDE_FILE("dlfcn.h" HAVE_DLFCN_H)
  LA_CHECK_INCLUDE_FILE("errno.h" HAVE_ERRNO_H)
@@ -24,3 +35,6 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
  LA_CHECK_INCLUDE_FILE("fcntl.h" HAVE_FCNTL_H)
  LA_CHECK_INCLUDE_FILE("grp.h" HAVE_GRP_H)
  LA_CHECK_INCLUDE_FILE("inttypes.h" HAVE_INTTYPES_H)
+-- 
+2.18.0
+
diff --git a/meta/recipes-devtools/cmake/cmake/0004-FindBoost-Generate-imported-targets-for-future-Boost.patch b/meta/recipes-devtools/cmake/cmake/0004-FindBoost-Generate-imported-targets-for-future-Boost.patch
deleted file mode 100644
index 8101e8f479..0000000000
--- a/meta/recipes-devtools/cmake/cmake/0004-FindBoost-Generate-imported-targets-for-future-Boost.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 6297d6c7fd6f80dafe17c0aefeeb0439432aa4b0 Mon Sep 17 00:00:00 2001
-From: "Paul \"TBBle\" Hampson" <Paul.Hampson@Pobox.com>
-Date: Sat, 30 Dec 2017 16:00:29 +1100
-Subject: [PATCH 4/6] FindBoost: Generate imported targets for future Boost
- versions
-
-Per discussion on cmake/cmake#17575, this protection not particularly
-valuable, as the dependency information which the imported targets wrap
-is generated anyway.
-
-This removes a road-block for using `Boost_ADDITIONAL_VERSIONS` to
-support newly-released Boost versions pending a new CMake release.
-
-Affects cmake < 3.11.0
-
-Upstream-Status: Backport
-[Yocto 12762]
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
-
----
- Modules/FindBoost.cmake | 1 -
- 1 file changed, 1 deletion(-)
-
-Index: cmake-3.10.3/Modules/FindBoost.cmake
-===================================================================
---- cmake-3.10.3.orig/Modules/FindBoost.cmake
-+++ cmake-3.10.3/Modules/FindBoost.cmake
-@@ -799,7 +799,6 @@ function(_Boost_COMPONENT_DEPENDENCIES c
-     endif()
-     if(NOT Boost_VERSION VERSION_LESS 106700)
-       message(WARNING "New Boost version may have incorrect or missing dependencies and imported targets")
--      set(_Boost_IMPORTED_TARGETS FALSE)
-     endif()
-   endif()
- 
diff --git a/meta/recipes-devtools/cmake/cmake/0005-FindBoost-support-OPTIONAL_COMPONENTS.patch b/meta/recipes-devtools/cmake/cmake/0005-FindBoost-support-OPTIONAL_COMPONENTS.patch
deleted file mode 100644
index c0330fb335..0000000000
--- a/meta/recipes-devtools/cmake/cmake/0005-FindBoost-support-OPTIONAL_COMPONENTS.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 2557cad5ec5084f86d4bb56c82939a49fc9d3071 Mon Sep 17 00:00:00 2001
-From: Sergiu Deitsch <sergiu.deitsch@gmail.com>
-Date: Sun, 14 Jan 2018 11:42:48 +0100
-Subject: [PATCH 5/6] FindBoost: support OPTIONAL_COMPONENTS
-
-Affects cmake < 3.11.0
-
-Upstream-Status: Backport
-[Yocto 12762]
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
-
----
- Modules/FindBoost.cmake | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-Index: cmake-3.10.3/Modules/FindBoost.cmake
-===================================================================
---- cmake-3.10.3.orig/Modules/FindBoost.cmake
-+++ cmake-3.10.3/Modules/FindBoost.cmake
-@@ -13,6 +13,9 @@
- #     [version] [EXACT]      # Minimum or EXACT version e.g. 1.36.0
- #     [REQUIRED]             # Fail with error if Boost is not found
- #     [COMPONENTS <libs>...] # Boost libraries by their canonical name
-+#                            # e.g. "date_time" for "libboost_date_time"
-+#     [OPTIONAL_COMPONENTS <libs>...]
-+#                            # Optional Boost libraries by their canonical name)
- #     )                      # e.g. "date_time" for "libboost_date_time"
- #
- # This module finds headers and requested component libraries OR a CMake
-@@ -1783,10 +1786,9 @@ if(Boost_FOUND)
-   set(_boost_CHECKED_COMPONENT FALSE)
-   set(_Boost_MISSING_COMPONENTS "")
-   foreach(COMPONENT ${Boost_FIND_COMPONENTS})
--    string(TOUPPER ${COMPONENT} COMPONENT)
-+    string(TOUPPER ${COMPONENT} UPPERCOMPONENT)
-     set(_boost_CHECKED_COMPONENT TRUE)
--    if(NOT Boost_${COMPONENT}_FOUND)
--      string(TOLOWER ${COMPONENT} COMPONENT)
-+    if(NOT Boost_${UPPERCOMPONENT}_FOUND AND Boost_FIND_REQUIRED_${COMPONENT})
-       list(APPEND _Boost_MISSING_COMPONENTS ${COMPONENT})
-     endif()
-   endforeach()
diff --git a/meta/recipes-devtools/cmake/cmake/0006-FindBoost-Add-support-for-Boost-1.67-with-Python-ver.patch b/meta/recipes-devtools/cmake/cmake/0006-FindBoost-Add-support-for-Boost-1.67-with-Python-ver.patch
deleted file mode 100644
index edcfdbefa5..0000000000
--- a/meta/recipes-devtools/cmake/cmake/0006-FindBoost-Add-support-for-Boost-1.67-with-Python-ver.patch
+++ /dev/null
@@ -1,296 +0,0 @@
-From 1673923c303c6a4184904c4c5849911feddb87e7 Mon Sep 17 00:00:00 2001
-From: Roger Leigh <rleigh@codelibre.net>
-Date: Sun, 18 Mar 2018 13:05:35 +0000
-Subject: [PATCH 6/6] FindBoost: Add support for Boost 1.67 with Python version
- suffixes
-
-Fixes: #16612, #16335, #16391, #12955
-
-Affects cmake < 3.11.0
-
-Upstream-Status: Backport
-[Yocto 12762]
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
-
----
- Modules/FindBoost.cmake | 170 ++++++++++++++++++++++++++++++++++++------------
- 1 file changed, 129 insertions(+), 41 deletions(-)
-
-Index: cmake-3.10.3/Modules/FindBoost.cmake
-===================================================================
---- cmake-3.10.3.orig/Modules/FindBoost.cmake
-+++ cmake-3.10.3/Modules/FindBoost.cmake
-@@ -10,7 +10,7 @@
- # Use this module by invoking find_package with the form::
- #
- #   find_package(Boost
--#     [version] [EXACT]      # Minimum or EXACT version e.g. 1.36.0
-+#     [version] [EXACT]      # Minimum or EXACT version e.g. 1.67.0
- #     [REQUIRED]             # Fail with error if Boost is not found
- #     [COMPONENTS <libs>...] # Boost libraries by their canonical name
- #                            # e.g. "date_time" for "libboost_date_time"
-@@ -40,6 +40,15 @@
- #                            information about Boost's automatic linking
- #                            displayed during compilation
- #
-+# Note that Boost Python components require a Python version suffix
-+# (Boost 1.67 and later), e.g. ``python36`` or ``python27`` for the
-+# versions built against Python 3.6 and 2.7, respectively.  This also
-+# applies to additional components using Python including
-+# ``mpi_python`` and ``numpy``.  Earlier Boost releases may use
-+# distribution-specific suffixes such as ``2``, ``3`` or ``2.7``.
-+# These may also be used as suffixes, but note that they are not
-+# portable.
-+#
- # This module reads hints about search locations from variables::
- #
- #   BOOST_ROOT             - Preferred installation prefix
-@@ -156,7 +165,7 @@
- #   Boost_REALPATH           - Set to ON to resolve symlinks for discovered
- #                              libraries to assist with packaging.  For example,
- #                              the "system" component library may be resolved to
--#                              "/usr/lib/libboost_system.so.1.42.0" instead of
-+#                              "/usr/lib/libboost_system.so.1.67.0" instead of
- #                              "/usr/lib/libboost_system.so".  This does not
- #                              affect linking and should not be enabled unless
- #                              the user needs this information.
-@@ -190,6 +199,13 @@
- #   target_link_libraries(foo Boost::date_time Boost::filesystem
- #                             Boost::iostreams)
- #
-+# Example to find Boost Python 3.6 libraries and use imported targets::
-+#
-+#   find_package(Boost 1.67 REQUIRED COMPONENTS
-+#                python36 numpy36)
-+#   add_executable(foo foo.cc)
-+#   target_link_libraries(foo Boost::python36 Boost::numpy36)
-+#
- # Example to find Boost headers and some *static* (release only) libraries::
- #
- #   set(Boost_USE_STATIC_LIBS        ON)  # only find static libs
-@@ -197,7 +213,7 @@
- #   set(Boost_USE_RELEASE_LIBS       ON)  # only find release libs
- #   set(Boost_USE_MULTITHREADED      ON)
- #   set(Boost_USE_STATIC_RUNTIME    OFF)
--#   find_package(Boost 1.36.0 COMPONENTS date_time filesystem system ...)
-+#   find_package(Boost 1.66.0 COMPONENTS date_time filesystem system ...)
- #   if(Boost_FOUND)
- #     include_directories(${Boost_INCLUDE_DIRS})
- #     add_executable(foo foo.cc)
-@@ -565,6 +581,13 @@ function(_Boost_COMPONENT_DEPENDENCIES c
-   # required only if the BoostScanDeps.cmake script logic is changed.
-   # The addition of a new release should only require it to be run
-   # against the new release.
-+
-+  # Handle Python version suffixes
-+  if(component MATCHES "^(python|mpi_python|numpy)([0-9][0-9]?|[0-9]\\.[0-9])\$")
-+    set(component "${CMAKE_MATCH_1}")
-+    set(component_python_version "${CMAKE_MATCH_2}")
-+  endif()
-+
-   set(_Boost_IMPORTED_TARGETS TRUE)
-   if(Boost_VERSION VERSION_LESS 103300)
-     message(WARNING "Imported targets and dependency information not available for Boost version ${Boost_VERSION} (all versions older than 1.33)")
-@@ -782,8 +805,7 @@ function(_Boost_COMPONENT_DEPENDENCIES c
-     set(_Boost_THREAD_DEPENDENCIES chrono system date_time atomic)
-     set(_Boost_WAVE_DEPENDENCIES filesystem system serialization thread chrono date_time atomic)
-     set(_Boost_WSERIALIZATION_DEPENDENCIES serialization)
--  else()
--    if(NOT Boost_VERSION VERSION_LESS 106500)
-+  elseif(NOT Boost_VERSION VERSION_LESS 106500 AND Boost_VERSION VERSION_LESS 106700)
-       set(_Boost_CHRONO_DEPENDENCIES system)
-       set(_Boost_CONTEXT_DEPENDENCIES thread chrono system date_time)
-       set(_Boost_COROUTINE_DEPENDENCIES context system)
-@@ -797,10 +819,29 @@ function(_Boost_COMPONENT_DEPENDENCIES c
-       set(_Boost_NUMPY_DEPENDENCIES python)
-       set(_Boost_RANDOM_DEPENDENCIES system)
-       set(_Boost_THREAD_DEPENDENCIES chrono system date_time atomic)
-+      set(_Boost_TIMER_DEPENDENCIES chrono system)
-       set(_Boost_WAVE_DEPENDENCIES filesystem system serialization thread chrono date_time atomic)
-       set(_Boost_WSERIALIZATION_DEPENDENCIES serialization)
--    endif()
-+  else()
-     if(NOT Boost_VERSION VERSION_LESS 106700)
-+      set(_Boost_CHRONO_DEPENDENCIES system)
-+      set(_Boost_CONTEXT_DEPENDENCIES thread chrono system date_time)
-+      set(_Boost_COROUTINE_DEPENDENCIES context system)
-+      set(_Boost_FIBER_DEPENDENCIES context thread chrono system date_time)
-+      set(_Boost_FILESYSTEM_DEPENDENCIES system)
-+      set(_Boost_IOSTREAMS_DEPENDENCIES regex)
-+      set(_Boost_LOG_DEPENDENCIES date_time log_setup system filesystem thread regex chrono atomic)
-+      set(_Boost_MATH_DEPENDENCIES math_c99 math_c99f math_c99l math_tr1 math_tr1f math_tr1l atomic)
-+      set(_Boost_MPI_DEPENDENCIES serialization)
-+      set(_Boost_MPI_PYTHON_DEPENDENCIES python${component_python_version} mpi serialization)
-+      set(_Boost_NUMPY_DEPENDENCIES python${component_python_version})
-+      set(_Boost_RANDOM_DEPENDENCIES system)
-+      set(_Boost_THREAD_DEPENDENCIES chrono system date_time atomic)
-+      set(_Boost_TIMER_DEPENDENCIES chrono system)
-+      set(_Boost_WAVE_DEPENDENCIES filesystem system serialization thread chrono date_time atomic)
-+      set(_Boost_WSERIALIZATION_DEPENDENCIES serialization)
-+    endif()
-+    if(NOT Boost_VERSION VERSION_LESS 106800)
-       message(WARNING "New Boost version may have incorrect or missing dependencies and imported targets")
-     endif()
-   endif()
-@@ -826,6 +867,12 @@ endfunction()
- # _hdrs
- #
- function(_Boost_COMPONENT_HEADERS component _hdrs)
-+  # Handle Python version suffixes
-+  if(component MATCHES "^(python|mpi_python|numpy)([0-9][0-9]?|[0-9]\\.[0-9])\$")
-+    set(component "${CMAKE_MATCH_1}")
-+    set(component_python_version "${CMAKE_MATCH_2}")
-+  endif()
-+
-   # Note: new boost components will require adding here.  The header
-   # must be present in all versions of Boost providing a library.
-   set(_Boost_ATOMIC_HEADERS              "boost/atomic.hpp")
-@@ -1040,7 +1087,7 @@ else()
-   # _Boost_COMPONENT_HEADERS.  See the instructions at the top of
-   # _Boost_COMPONENT_DEPENDENCIES.
-   set(_Boost_KNOWN_VERSIONS ${Boost_ADDITIONAL_VERSIONS}
--    "1.66.0" "1.66" "1.65.1" "1.65.0" "1.65"
-+    "1.67.0" "1.67" "1.66.0" "1.66" "1.65.1" "1.65.0" "1.65"
-     "1.64.0" "1.64" "1.63.0" "1.63" "1.62.0" "1.62" "1.61.0" "1.61" "1.60.0" "1.60"
-     "1.59.0" "1.59" "1.58.0" "1.58" "1.57.0" "1.57" "1.56.0" "1.56" "1.55.0" "1.55"
-     "1.54.0" "1.54" "1.53.0" "1.53" "1.52.0" "1.52" "1.51.0" "1.51"
-@@ -1619,7 +1666,44 @@ foreach(COMPONENT ${Boost_FIND_COMPONENT
-     endforeach()
-   endif()
- 
-+  # Handle Python version suffixes
-+  unset(COMPONENT_PYTHON_VERSION_MAJOR)
-+  unset(COMPONENT_PYTHON_VERSION_MINOR)
-+  if(${COMPONENT} MATCHES "^(python|mpi_python|numpy)([0-9])\$")
-+    set(COMPONENT_UNVERSIONED "${CMAKE_MATCH_1}")
-+    set(COMPONENT_PYTHON_VERSION_MAJOR "${CMAKE_MATCH_2}")
-+  elseif(${COMPONENT} MATCHES "^(python|mpi_python|numpy)([0-9])\\.?([0-9])\$")
-+    set(COMPONENT_UNVERSIONED "${CMAKE_MATCH_1}")
-+    set(COMPONENT_PYTHON_VERSION_MAJOR "${CMAKE_MATCH_2}")
-+    set(COMPONENT_PYTHON_VERSION_MINOR "${CMAKE_MATCH_3}")
-+  endif()
-+
-+  unset(_Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME)
-+  if (COMPONENT_PYTHON_VERSION_MINOR)
-+    # Boost >= 1.67
-+    list(APPEND _Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME "${COMPONENT_UNVERSIONED}${COMPONENT_PYTHON_VERSION_MAJOR}${COMPONENT_PYTHON_VERSION_MINOR}")
-+    # Debian/Ubuntu (Some versions omit the 2 and/or 3 from the suffix)
-+    list(APPEND _Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME "${COMPONENT_UNVERSIONED}${COMPONENT_PYTHON_VERSION_MAJOR}-py${COMPONENT_PYTHON_VERSION_MAJOR}${COMPONENT_PYTHON_VERSION_MINOR}")
-+    list(APPEND _Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME "${COMPONENT_UNVERSIONED}-py${COMPONENT_PYTHON_VERSION_MAJOR}${COMPONENT_PYTHON_VERSION_MINOR}")
-+    # Gentoo
-+    list(APPEND _Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME "${COMPONENT_UNVERSIONED}-${COMPONENT_PYTHON_VERSION_MAJOR}${COMPONENT_PYTHON_VERSION_MINOR}")
-+    # RPMs
-+    list(APPEND _Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME "${COMPONENT_UNVERSIONED}-${COMPONENT_PYTHON_VERSION_MAJOR}${COMPONENT_PYTHON_VERSION_MINOR}")
-+  endif()
-+  if (COMPONENT_PYTHON_VERSION_MAJOR AND NOT COMPONENT_PYTHON_VERSION_MINOR)
-+    # Boost < 1.67
-+    list(APPEND _Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME "${COMPONENT_UNVERSIONED}${COMPONENT_PYTHON_VERSION_MAJOR}")
-+  endif()
-+
-   # Consolidate and report component-specific hints.
-+  if(_Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME)
-+    list(REMOVE_DUPLICATES _Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME)
-+    if(Boost_DEBUG)
-+      message(STATUS "[ ${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE} ] "
-+        "Component-specific library search names for ${COMPONENT_NAME}: "
-+        "${_Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME}")
-+    endif()
-+  endif()
-   if(_Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT)
-     list(REMOVE_DUPLICATES _Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT)
-     if(Boost_DEBUG)
-@@ -1649,28 +1733,30 @@ foreach(COMPONENT ${Boost_FIND_COMPONENT
-   # Find RELEASE libraries
-   #
-   unset(_boost_RELEASE_NAMES)
--  foreach(compiler IN LISTS _boost_COMPILER)
--    list(APPEND _boost_RELEASE_NAMES
--      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
--      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG} )
--  endforeach()
--  list(APPEND _boost_RELEASE_NAMES
--    ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
--    ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG}
--    ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT} )
--  if(_boost_STATIC_RUNTIME_WORKAROUND)
--    set(_boost_RELEASE_STATIC_ABI_TAG "-s${_boost_RELEASE_ABI_TAG}")
-+  foreach(component IN LISTS _Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME COMPONENT)
-     foreach(compiler IN LISTS _boost_COMPILER)
-       list(APPEND _boost_RELEASE_NAMES
--        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
--        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG} )
-+        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
-+        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG} )
-     endforeach()
-     list(APPEND _boost_RELEASE_NAMES
--      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
--      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG} )
--  endif()
-+      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
-+      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG}
-+      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component} )
-+    if(_boost_STATIC_RUNTIME_WORKAROUND)
-+      set(_boost_RELEASE_STATIC_ABI_TAG "-s${_boost_RELEASE_ABI_TAG}")
-+      foreach(compiler IN LISTS _boost_COMPILER)
-+        list(APPEND _boost_RELEASE_NAMES
-+          ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
-+          ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG} )
-+      endforeach()
-+      list(APPEND _boost_RELEASE_NAMES
-+        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
-+        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG} )
-+    endif()
-+  endforeach()
-   if(Boost_THREADAPI AND ${COMPONENT} STREQUAL "thread")
--     _Boost_PREPEND_LIST_WITH_THREADAPI(_boost_RELEASE_NAMES ${_boost_RELEASE_NAMES})
-+    _Boost_PREPEND_LIST_WITH_THREADAPI(_boost_RELEASE_NAMES ${_boost_RELEASE_NAMES})
-   endif()
-   if(Boost_DEBUG)
-     message(STATUS "[ ${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE} ] "
-@@ -1699,27 +1785,29 @@ foreach(COMPONENT ${Boost_FIND_COMPONENT
-   # Find DEBUG libraries
-   #
-   unset(_boost_DEBUG_NAMES)
--  foreach(compiler IN LISTS _boost_COMPILER)
--    list(APPEND _boost_DEBUG_NAMES
--      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
--      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG} )
--  endforeach()
--  list(APPEND _boost_DEBUG_NAMES
--    ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
--    ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG}
--    ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}
--    ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT} )
--  if(_boost_STATIC_RUNTIME_WORKAROUND)
--    set(_boost_DEBUG_STATIC_ABI_TAG "-s${_boost_DEBUG_ABI_TAG}")
-+  foreach(component IN LISTS _Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME COMPONENT)
-     foreach(compiler IN LISTS _boost_COMPILER)
-       list(APPEND _boost_DEBUG_NAMES
--        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
--        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG} )
-+        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
-+        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG} )
-     endforeach()
-     list(APPEND _boost_DEBUG_NAMES
--      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
--      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG} )
--  endif()
-+      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
-+      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG}
-+      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${_boost_MULTITHREADED}
-+      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component} )
-+    if(_boost_STATIC_RUNTIME_WORKAROUND)
-+      set(_boost_DEBUG_STATIC_ABI_TAG "-s${_boost_DEBUG_ABI_TAG}")
-+      foreach(compiler IN LISTS _boost_COMPILER)
-+        list(APPEND _boost_DEBUG_NAMES
-+          ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
-+          ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG} )
-+      endforeach()
-+      list(APPEND _boost_DEBUG_NAMES
-+        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
-+        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG} )
-+    endif()
-+  endforeach()
-   if(Boost_THREADAPI AND ${COMPONENT} STREQUAL "thread")
-      _Boost_PREPEND_LIST_WITH_THREADAPI(_boost_DEBUG_NAMES ${_boost_DEBUG_NAMES})
-   endif()
diff --git a/meta/recipes-devtools/cmake/cmake/cmake-Prevent-the-detection-of-Qt5.patch b/meta/recipes-devtools/cmake/cmake/cmake-Prevent-the-detection-of-Qt5.patch
deleted file mode 100644
index 88b7e94741..0000000000
--- a/meta/recipes-devtools/cmake/cmake/cmake-Prevent-the-detection-of-Qt5.patch
+++ /dev/null
@@ -1,215 +0,0 @@
-From 875c11dbf87d1258ad7d3697a40d605d503e5673 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Wed, 17 Jan 2018 10:02:14 -0200
-Subject: [PATCH] cmake: Prevent the detection of Qt5
-Organization: O.S. Systems Software LTDA.
-
-CMake doesn't have dependency on qt4/qt5, so these tests usually fail
-but still can cause undeterministic results or build failures (when
-OE_QMAKE_PATH_EXTERNAL_HOST_BINS is undefined or native qmake removed
-while running the test in cmake)
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- Source/QtDialog/CMakeLists.txt                     | 2 +-
- Tests/CMakeLists.txt                               | 2 +-
- Tests/Qt4And5Automoc/CMakeLists.txt                | 4 ++--
- Tests/QtAutoUicInterface/CMakeLists.txt            | 2 +-
- Tests/QtAutogen/CMakeLists.txt                     | 2 +-
- Tests/QtAutogen/macosFW/CMakeLists.txt             | 2 +-
- Tests/QtAutogen/mocDepends/CMakeLists.txt          | 2 +-
- Tests/QtAutogenRerun/CMakeLists.txt                | 4 ++--
- Tests/QtAutogenRerun/mocPlugin/CMakeLists.txt      | 2 +-
- Tests/QtAutogenRerun/mocRerun/CMakeLists.txt       | 2 +-
- Tests/QtAutogenRerun/rccDepends/CMakeLists.txt     | 2 +-
- Tests/RunCMake/CMakeLists.txt                      | 2 +-
- Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake | 2 +-
- 13 files changed, 15 insertions(+), 15 deletions(-)
-
-diff --git a/Source/QtDialog/CMakeLists.txt b/Source/QtDialog/CMakeLists.txt
-index b38797bca..b5fbfc5fa 100644
---- a/Source/QtDialog/CMakeLists.txt
-+++ b/Source/QtDialog/CMakeLists.txt
-@@ -6,7 +6,7 @@ if(POLICY CMP0020)
-   cmake_policy(SET CMP0020 NEW) # Drop when CMake >= 2.8.11 required
- endif()
- CMake_OPTIONAL_COMPONENT(cmake-gui)
--find_package(Qt5Widgets QUIET)
-+#find_package(Qt5Widgets QUIET)
- if (Qt5Widgets_FOUND)
-   include_directories(${Qt5Widgets_INCLUDE_DIRS})
-   add_definitions(${Qt5Widgets_DEFINITONS})
-diff --git a/Tests/CMakeLists.txt b/Tests/CMakeLists.txt
-index 533788a44..32ef03c55 100644
---- a/Tests/CMakeLists.txt
-+++ b/Tests/CMakeLists.txt
-@@ -1260,7 +1260,7 @@ ${CMake_BINARY_DIR}/bin/cmake -DDIR=dev -P ${CMake_SOURCE_DIR}/Utilities/Release
-     set(CMake_TEST_Qt5 1)
-   endif()
-   if(CMake_TEST_Qt5)
--    find_package(Qt5Widgets QUIET NO_MODULE)
-+    #find_package(Qt5Widgets QUIET NO_MODULE)
-   endif()
-   if(CMake_TEST_Qt5 AND Qt5Widgets_FOUND)
-     add_test(NAME Qt5Autogen COMMAND ${CMAKE_CTEST_COMMAND}
-diff --git a/Tests/Qt4And5Automoc/CMakeLists.txt b/Tests/Qt4And5Automoc/CMakeLists.txt
-index ad74961d9..a9dd74b15 100644
---- a/Tests/Qt4And5Automoc/CMakeLists.txt
-+++ b/Tests/Qt4And5Automoc/CMakeLists.txt
-@@ -3,11 +3,11 @@ cmake_minimum_required(VERSION 2.8.12)
- project(Qt4And5Automoc)
- 
- if (QT_REVERSE_FIND_ORDER)
--  find_package(Qt5Core REQUIRED)
-+  #find_package(Qt5Core REQUIRED)
-   find_package(Qt4 REQUIRED)
- else()
-   find_package(Qt4 REQUIRED)
--  find_package(Qt5Core REQUIRED)
-+  #find_package(Qt5Core REQUIRED)
- endif()
- 
- set(CMAKE_AUTOMOC ON)
-diff --git a/Tests/QtAutoUicInterface/CMakeLists.txt b/Tests/QtAutoUicInterface/CMakeLists.txt
-index a5c2d99b2..2d640e4a3 100644
---- a/Tests/QtAutoUicInterface/CMakeLists.txt
-+++ b/Tests/QtAutoUicInterface/CMakeLists.txt
-@@ -14,7 +14,7 @@ else()
-   if (NOT QT_TEST_VERSION STREQUAL 5)
-     message(SEND_ERROR "Invalid Qt version specified.")
-   endif()
--  find_package(Qt5Widgets REQUIRED)
-+  #find_package(Qt5Widgets REQUIRED)
- 
-   set(QT_CORE_TARGET Qt5::Core)
-   set(QT_GUI_TARGET Qt5::Widgets)
-diff --git a/Tests/QtAutogen/CMakeLists.txt b/Tests/QtAutogen/CMakeLists.txt
-index dff9d0c66..c6e8fc3f5 100644
---- a/Tests/QtAutogen/CMakeLists.txt
-+++ b/Tests/QtAutogen/CMakeLists.txt
-@@ -23,7 +23,7 @@ else()
-   if (NOT QT_TEST_VERSION STREQUAL 5)
-     message(SEND_ERROR "Invalid Qt version specified.")
-   endif()
--  find_package(Qt5Widgets REQUIRED)
-+  #find_package(Qt5Widgets REQUIRED)
- 
-   set(QT_QTCORE_TARGET Qt5::Core)
- 
-diff --git a/Tests/QtAutogen/macosFW/CMakeLists.txt b/Tests/QtAutogen/macosFW/CMakeLists.txt
-index 114d9bac0..157fe0aaa 100644
---- a/Tests/QtAutogen/macosFW/CMakeLists.txt
-+++ b/Tests/QtAutogen/macosFW/CMakeLists.txt
-@@ -1,7 +1,7 @@
- cmake_minimum_required(VERSION 3.8)
- project(macos-fw-test)
- 
--find_package(Qt5Test REQUIRED)
-+#find_package(Qt5Test REQUIRED)
- 
- set(CMAKE_CXX_STANDARD 11)
- set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/output/bin)
-diff --git a/Tests/QtAutogen/mocDepends/CMakeLists.txt b/Tests/QtAutogen/mocDepends/CMakeLists.txt
-index 8217b8dbf..86bb7bc7f 100644
---- a/Tests/QtAutogen/mocDepends/CMakeLists.txt
-+++ b/Tests/QtAutogen/mocDepends/CMakeLists.txt
-@@ -10,7 +10,7 @@ else()
-     message(SEND_ERROR "Invalid Qt version specified.")
-   endif()
- 
--  find_package(Qt5Core REQUIRED)
-+  #find_package(Qt5Core REQUIRED)
-   set(QT_CORE_TARGET Qt5::Core)
- endif()
- 
-diff --git a/Tests/QtAutogenRerun/CMakeLists.txt b/Tests/QtAutogenRerun/CMakeLists.txt
-index e72c1912e..d7e6884ce 100644
---- a/Tests/QtAutogenRerun/CMakeLists.txt
-+++ b/Tests/QtAutogenRerun/CMakeLists.txt
-@@ -2,7 +2,7 @@ cmake_minimum_required(VERSION 3.9)
- cmake_policy(SET CMP0071 NEW)
- project(QtAutogenRerun)
- 
--# Tell find_package(Qt5) where to find Qt.
-+# Tell #find_package(Qt5) where to find Qt.
- if(QT_QMAKE_EXECUTABLE)
-   get_filename_component(Qt_BIN_DIR "${QT_QMAKE_EXECUTABLE}" PATH)
-   get_filename_component(Qt_PREFIX_DIR "${Qt_BIN_DIR}" PATH)
-@@ -23,7 +23,7 @@ else()
-   if (NOT QT_TEST_VERSION STREQUAL 5)
-     message(SEND_ERROR "Invalid Qt version specified.")
-   endif()
--  find_package(Qt5Widgets REQUIRED)
-+  #find_package(Qt5Widgets REQUIRED)
- 
-   set(QT_QTCORE_TARGET Qt5::Core)
- 
-diff --git a/Tests/QtAutogenRerun/mocPlugin/CMakeLists.txt b/Tests/QtAutogenRerun/mocPlugin/CMakeLists.txt
-index b7cc5e9ff..e1d109953 100644
---- a/Tests/QtAutogenRerun/mocPlugin/CMakeLists.txt
-+++ b/Tests/QtAutogenRerun/mocPlugin/CMakeLists.txt
-@@ -9,7 +9,7 @@ set(CMAKE_AUTOMOC_DEPEND_FILTERS
- if (NOT QT_TEST_VERSION STREQUAL 5)
-   message(SEND_ERROR "Invalid Qt version specified.")
- endif()
--find_package(Qt5Widgets REQUIRED)
-+#find_package(Qt5Widgets REQUIRED)
- 
- if(Qt5_POSITION_INDEPENDENT_CODE AND CMAKE_CXX_COMPILE_OPTIONS_PIC)
-   add_definitions(${CMAKE_CXX_COMPILE_OPTIONS_PIC})
-diff --git a/Tests/QtAutogenRerun/mocRerun/CMakeLists.txt b/Tests/QtAutogenRerun/mocRerun/CMakeLists.txt
-index bafd9cf48..43ec933d2 100644
---- a/Tests/QtAutogenRerun/mocRerun/CMakeLists.txt
-+++ b/Tests/QtAutogenRerun/mocRerun/CMakeLists.txt
-@@ -10,7 +10,7 @@ else()
-     message(SEND_ERROR "Invalid Qt version specified.")
-   endif()
- 
--  find_package(Qt5Core REQUIRED)
-+  #find_package(Qt5Core REQUIRED)
-   set(QT_CORE_TARGET Qt5::Core)
- endif()
- 
-diff --git a/Tests/QtAutogenRerun/rccDepends/CMakeLists.txt b/Tests/QtAutogenRerun/rccDepends/CMakeLists.txt
-index 291592e7d..40cd52868 100644
---- a/Tests/QtAutogenRerun/rccDepends/CMakeLists.txt
-+++ b/Tests/QtAutogenRerun/rccDepends/CMakeLists.txt
-@@ -9,7 +9,7 @@ else()
-     message(SEND_ERROR "Invalid Qt version specified.")
-   endif()
- 
--  find_package(Qt5Core REQUIRED)
-+  #find_package(Qt5Core REQUIRED)
-   set(QT_CORE_TARGET Qt5::Core)
- endif()
- 
-diff --git a/Tests/RunCMake/CMakeLists.txt b/Tests/RunCMake/CMakeLists.txt
-index 29325ff0a..d30d01e78 100644
---- a/Tests/RunCMake/CMakeLists.txt
-+++ b/Tests/RunCMake/CMakeLists.txt
-@@ -274,7 +274,7 @@ add_RunCMake_test(configure_file)
- add_RunCMake_test(CTestTimeoutAfterMatch)
- 
- find_package(Qt4 QUIET)
--find_package(Qt5Core QUIET)
-+#find_package(Qt5Core QUIET)
- if (QT4_FOUND AND Qt5Core_FOUND AND NOT Qt5Core_VERSION VERSION_LESS 5.1.0)
-   add_RunCMake_test(IncompatibleQt)
- endif()
-diff --git a/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake b/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
-index 4fccdc418..b76e1e531 100644
---- a/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
-+++ b/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
-@@ -1,6 +1,6 @@
- 
- find_package(Qt4 REQUIRED)
--find_package(Qt5Core REQUIRED)
-+#find_package(Qt5Core REQUIRED)
- 
- add_executable(mainexe main.cpp)
- target_link_libraries(mainexe Qt4::QtCore Qt5::Core)
--- 
-2.15.1
-
diff --git a/meta/recipes-devtools/cmake/cmake_3.10.3.bb b/meta/recipes-devtools/cmake/cmake_3.11.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.10.3.bb
rename to meta/recipes-devtools/cmake/cmake_3.11.4.bb
-- 
2.18.0


