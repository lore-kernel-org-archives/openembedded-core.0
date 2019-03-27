Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 1256 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 27 Mar 2019 10:24:48 UTC
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 6D59C6B11A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 10:24:48 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x2RA3r9B029044
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 11:03:53 +0100
Received: from dev.vm6.ccp.siemens.com ([167.87.3.133])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id x2RA3qph000943;
	Wed, 27 Mar 2019 11:03:52 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 2056E10D47A8;
	Wed, 27 Mar 2019 11:03:52 +0100 (CET)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 11:02:52 +0100
Message-Id: <20190327100252.6493-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] cmake: 3.13.4 -> 3.14.0
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
X-List-Received-Date: Wed, 27 Mar 2019 10:24:48 -0000

The copyright date changed in the license file, thus the hash change.

CMake 3.14 fixes some issues with implicit include path that lead to
errors with gcc not finding "stdlib.h" etc in include_next.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 ...ake-native_3.13.4.bb => cmake-native_3.14.0.bb} |  0
 meta/recipes-devtools/cmake/cmake.inc              |  6 ++--
 ...ineSystem-use-oe-environment-vars-to-load.patch |  2 +-
 .../0002-cmake-Prevent-the-detection-of-Qt5.patch  | 39 +++++++++++-----------
 ...upport-OpenEmbedded-Qt4-tool-binary-names.patch |  4 +--
 ...ently-if-system-Qt-installation-is-broken.patch |  2 +-
 .../cmake/{cmake_3.13.4.bb => cmake_3.14.0.bb}     |  0
 7 files changed, 27 insertions(+), 26 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.13.4.bb => cmake-native_3.14.0.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.13.4.bb => cmake_3.14.0.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.13.4.bb b/meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.13.4.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.14.0.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 68a71e9139..f787851e2d 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://Copyright.txt;md5=f61f5f859bc5ddba2b050eb10335e013 \
+LIC_FILES_CHKSUM = "file://Copyright.txt;md5=622747147b46f22e1953876a7cba3323 \
                     file://Source/cmake.h;md5=4494dee184212fc89c469c3acd555a14;beginline=1;endline=3 \
                     "
 
@@ -18,7 +18,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[md5sum] = "b5a544ffc73f6922a6cf371fcb6bae22"
-SRC_URI[sha256sum] = "fdd928fee35f472920071d1c7f1a6a2b72c9b25e04f7a37b409349aef3f20e9b"
+SRC_URI[md5sum] = "7504e4f3e05b59e083f2127e07059d5d"
+SRC_URI[sha256sum] = "aa76ba67b3c2af1946701f847073f4652af5cbd9f141f221c97af99127e75502"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
index f690720870..cdeea647fe 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
@@ -28,7 +28,7 @@ diff --git a/Modules/CMakeDetermineSystem.cmake b/Modules/CMakeDetermineSystem.c
 index 600d5580e..32d7f1945 100644
 --- a/Modules/CMakeDetermineSystem.cmake
 +++ b/Modules/CMakeDetermineSystem.cmake
-@@ -82,6 +82,13 @@ else()
+@@ -81,6 +81,13 @@ else()
    endif()
  endif()
  
diff --git a/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch b/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
index 3bea6935b7..8d2dc10ce5 100644
--- a/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
+++ b/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
@@ -1,4 +1,4 @@
-From 7a1f4e724f9c68498f401244c2938e784a2e6fbd Mon Sep 17 00:00:00 2001
+From b4b6e9b1be33213ede3f612e87840c0045824d9e Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Wed, 17 Jan 2018 10:02:14 -0200
 Subject: [PATCH 2/5] cmake: Prevent the detection of Qt5
@@ -16,14 +16,14 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  Source/QtDialog/CMakeLists.txt                     | 2 +-
  Tests/CMakeLists.txt                               | 2 +-
  Tests/Qt4And5Automoc/CMakeLists.txt                | 4 ++--
- Tests/QtAutogen/AutogenTest.cmake                  | 2 +-
+ Tests/QtAutogen/AutogenGuiTest.cmake               | 3 +--
  Tests/QtAutogen/MacOsFW/CMakeLists.txt             | 2 +-
  Tests/RunCMake/CMakeLists.txt                      | 2 +-
  Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake | 2 +-
- 7 files changed, 8 insertions(+), 8 deletions(-)
+ 7 files changed, 8 insertions(+), 9 deletions(-)
 
 diff --git a/Source/QtDialog/CMakeLists.txt b/Source/QtDialog/CMakeLists.txt
-index 330b74729..e7709dee6 100644
+index 9ce0323844..06c86d63eb 100644
 --- a/Source/QtDialog/CMakeLists.txt
 +++ b/Source/QtDialog/CMakeLists.txt
 @@ -6,7 +6,7 @@ if(POLICY CMP0020)
@@ -36,10 +36,10 @@ index 330b74729..e7709dee6 100644
    include_directories(${Qt5Widgets_INCLUDE_DIRS})
    add_definitions(${Qt5Widgets_DEFINITONS})
 diff --git a/Tests/CMakeLists.txt b/Tests/CMakeLists.txt
-index b8b724ed8..63f6bb6d2 100644
+index ed98d974b0..7adfbc301b 100644
 --- a/Tests/CMakeLists.txt
 +++ b/Tests/CMakeLists.txt
-@@ -1297,7 +1297,7 @@ ${CMake_BINARY_DIR}/bin/cmake -DDIR=dev -P ${CMake_SOURCE_DIR}/Utilities/Release
+@@ -1342,7 +1342,7 @@ ${CMake_BINARY_DIR}/bin/cmake -DDIR=dev -P ${CMake_SOURCE_DIR}/Utilities/Release
      set(CMake_TEST_Qt5 1)
    endif()
    if(CMake_TEST_Qt5)
@@ -49,7 +49,7 @@ index b8b724ed8..63f6bb6d2 100644
    if(CMake_TEST_Qt5 AND Qt5Widgets_FOUND)
      add_subdirectory(Qt5Autogen)
 diff --git a/Tests/Qt4And5Automoc/CMakeLists.txt b/Tests/Qt4And5Automoc/CMakeLists.txt
-index ad74961d9..a9dd74b15 100644
+index ad74961d9f..a9dd74b151 100644
 --- a/Tests/Qt4And5Automoc/CMakeLists.txt
 +++ b/Tests/Qt4And5Automoc/CMakeLists.txt
 @@ -3,11 +3,11 @@ cmake_minimum_required(VERSION 2.8.12)
@@ -66,26 +66,27 @@ index ad74961d9..a9dd74b15 100644
  endif()
  
  set(CMAKE_AUTOMOC ON)
-diff --git a/Tests/QtAutogen/AutogenTest.cmake b/Tests/QtAutogen/AutogenTest.cmake
-index 8c0a14fca..e9923b21a 100644
---- a/Tests/QtAutogen/AutogenTest.cmake
-+++ b/Tests/QtAutogen/AutogenTest.cmake
-@@ -22,7 +22,7 @@ if (QT_TEST_VERSION EQUAL 4)
+diff --git a/Tests/QtAutogen/AutogenGuiTest.cmake b/Tests/QtAutogen/AutogenGuiTest.cmake
+index b76d341a45..a6e0acbafa 100644
+--- a/Tests/QtAutogen/AutogenGuiTest.cmake
++++ b/Tests/QtAutogen/AutogenGuiTest.cmake
+@@ -22,8 +22,7 @@ if (QT_TEST_VERSION EQUAL 4)
    endmacro()
  
  elseif(QT_TEST_VERSION EQUAL 5)
+-
 -  find_package(Qt5Widgets REQUIRED)
 +  #find_package(Qt5Widgets REQUIRED)
  
    set(QT_QTCORE_TARGET Qt5::Core)
-   set(QT_QTGUI_TARGET Qt5::Widgets)
+   set(QT_LIBRARIES Qt5::Widgets)
 diff --git a/Tests/QtAutogen/MacOsFW/CMakeLists.txt b/Tests/QtAutogen/MacOsFW/CMakeLists.txt
-index 26d201926..e48e1c8de 100644
+index c08efc47a2..87e25d9391 100644
 --- a/Tests/QtAutogen/MacOsFW/CMakeLists.txt
 +++ b/Tests/QtAutogen/MacOsFW/CMakeLists.txt
 @@ -2,7 +2,7 @@ cmake_minimum_required(VERSION 3.10)
  project(MacOsFW)
- include("../AutogenTest.cmake")
+ include("../AutogenGuiTest.cmake")
  
 -find_package(Qt5Test REQUIRED)
 +#find_package(Qt5Test REQUIRED)
@@ -93,10 +94,10 @@ index 26d201926..e48e1c8de 100644
  set(CMAKE_CXX_STANDARD 11)
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/output/bin)
 diff --git a/Tests/RunCMake/CMakeLists.txt b/Tests/RunCMake/CMakeLists.txt
-index 637c5c2cb..c0376effc 100644
+index 1f3e5c3006..8ed8d6ac54 100644
 --- a/Tests/RunCMake/CMakeLists.txt
 +++ b/Tests/RunCMake/CMakeLists.txt
-@@ -310,7 +310,7 @@ add_RunCMake_test(configure_file)
+@@ -326,7 +326,7 @@ add_RunCMake_test(configure_file)
  add_RunCMake_test(CTestTimeoutAfterMatch)
  
  find_package(Qt4 QUIET)
@@ -106,7 +107,7 @@ index 637c5c2cb..c0376effc 100644
    add_RunCMake_test(IncompatibleQt)
  endif()
 diff --git a/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake b/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
-index 4fccdc418..b76e1e531 100644
+index 4fccdc418f..b76e1e5313 100644
 --- a/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
 +++ b/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
 @@ -1,6 +1,6 @@
@@ -118,5 +119,5 @@ index 4fccdc418..b76e1e531 100644
  add_executable(mainexe main.cpp)
  target_link_libraries(mainexe Qt4::QtCore Qt5::Core)
 -- 
-2.18.0
+2.11.0
 
diff --git a/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch b/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
index 55cf47188a..4f2e84337e 100644
--- a/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
+++ b/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
@@ -28,7 +28,7 @@ diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
 index 847a798af..7ad981879 100644
 --- a/Modules/FindQt4.cmake
 +++ b/Modules/FindQt4.cmake
-@@ -517,7 +517,7 @@ endfunction()
+@@ -518,7 +518,7 @@ endfunction()
  
  set(QT4_INSTALLED_VERSION_TOO_OLD FALSE)
  
@@ -37,7 +37,7 @@ index 847a798af..7ad981879 100644
  _qt4_find_qmake("${_QT4_QMAKE_NAMES}" QT_QMAKE_EXECUTABLE QTVERSION)
  
  if (QT_QMAKE_EXECUTABLE AND
-@@ -1135,12 +1135,12 @@ if (QT_QMAKE_EXECUTABLE AND
+@@ -1136,12 +1136,12 @@ if (QT_QMAKE_EXECUTABLE AND
    _find_qt4_program(QT_MOC_EXECUTABLE Qt4::moc moc-qt4 moc4 moc)
    _find_qt4_program(QT_UIC_EXECUTABLE Qt4::uic uic-qt4 uic4 uic)
    _find_qt4_program(QT_UIC3_EXECUTABLE Qt4::uic3 uic3)
diff --git a/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch b/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch
index a59c680454..6c67dcf104 100644
--- a/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch
+++ b/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch
@@ -31,7 +31,7 @@ diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
 index 7ad981879..8b6f43cda 100644
 --- a/Modules/FindQt4.cmake
 +++ b/Modules/FindQt4.cmake
-@@ -987,25 +987,26 @@ if (QT_QMAKE_EXECUTABLE AND
+@@ -988,25 +988,26 @@ if (QT_QMAKE_EXECUTABLE AND
      endif()
    endmacro()
  
diff --git a/meta/recipes-devtools/cmake/cmake_3.13.4.bb b/meta/recipes-devtools/cmake/cmake_3.14.0.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.13.4.bb
rename to meta/recipes-devtools/cmake/cmake_3.14.0.bb
-- 
2.11.0


