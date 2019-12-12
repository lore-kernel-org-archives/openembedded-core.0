Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 513 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 12 Dec 2019 08:34:02 UTC
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id A9E717F8B5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 08:34:02 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id xBC8PTnu008299
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 09:25:29 +0100
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.79.241])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id xBC8PRMN027862;
	Thu, 12 Dec 2019 09:25:27 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 828379857FE;
	Thu, 12 Dec 2019 09:25:27 +0100 (CET)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 09:25:07 +0100
Message-Id: <20191212082507.26704-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] cmake: 3.15.5 -> 3.16.1
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
X-List-Received-Date: Thu, 12 Dec 2019 08:34:04 -0000
Content-Transfer-Encoding: 8bit

Patches have been refreshed and all of meta-oe and oe-core was sucessfully built.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 ...cmake-native_3.15.5.bb => cmake-native_3.16.1.bb} |  0
 meta/recipes-devtools/cmake/cmake.inc                |  4 ++--
 ...rmineSystem-use-oe-environment-vars-to-load.patch |  2 +-
 .../0002-cmake-Prevent-the-detection-of-Qt5.patch    | 12 ++++++------
 ...-support-OpenEmbedded-Qt4-tool-binary-names.patch |  4 ++--
 ...ilently-if-system-Qt-installation-is-broken.patch |  4 ++--
 .../cmake/{cmake_3.15.5.bb => cmake_3.16.1.bb}       |  0
 7 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.15.5.bb => cmake-native_3.16.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.15.5.bb => cmake_3.16.1.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.15.5.bb b/meta/recipes-devtools/cmake/cmake-native_3.16.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.15.5.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.16.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 24190dec02..9d14c14b54 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[md5sum] = "5fe3ebca627b4c3dcc2f127fbcfbceba"
-SRC_URI[sha256sum] = "fbdd7cef15c0ced06bb13024bfda0ecc0dedbcaaaa6b8a5d368c75255243beb4"
+SRC_URI[md5sum] = "142cf11cd9a7c298cf875604cee96434"
+SRC_URI[sha256sum] = "a275b3168fa8626eca4465da7bb159ff07c8c6cb0fb7179be59e12cbdfa725fd"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
index 3720833d3e..e2a58d25e2 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
@@ -1,4 +1,4 @@
-From 1e67c3fe52c6c51c00cf1ebb0bfc30c7a5ef9fdb Mon Sep 17 00:00:00 2001
+From ab272d703ce77f323aa1285526559c9efbf85834 Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 27 Apr 2017 11:35:05 -0400
 Subject: [PATCH] CMakeDetermineSystem: use oe environment vars to load default
diff --git a/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch b/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
index db229e63e2..61c8f27cd6 100644
--- a/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
+++ b/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
@@ -1,4 +1,4 @@
-From 5cb6c86696f842274043e7d406f84b3ead1c36e0 Mon Sep 17 00:00:00 2001
+From 5a86c7fa987bd407f228176df2abeffd015be9ea Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Wed, 17 Jan 2018 10:02:14 -0200
 Subject: [PATCH] cmake: Prevent the detection of Qt5
@@ -38,10 +38,10 @@ index cb89d19..9e68981 100644
    include_directories(${Qt5Widgets_INCLUDE_DIRS})
    add_definitions(${Qt5Widgets_DEFINITONS})
 diff --git a/Tests/CMakeLists.txt b/Tests/CMakeLists.txt
-index e73b277..91b8b67 100644
+index 57fa7fc..d50c146 100644
 --- a/Tests/CMakeLists.txt
 +++ b/Tests/CMakeLists.txt
-@@ -1348,7 +1348,7 @@ ${CMake_SOURCE_DIR}/Utilities/Release/push.bash --dir dev -- '${CMake_BUILD_NIGH
+@@ -1329,7 +1329,7 @@ ${CMake_SOURCE_DIR}/Utilities/Release/push.bash --dir dev -- '${CMake_BUILD_NIGH
      set(CMake_TEST_Qt5 1)
    endif()
    if(CMake_TEST_Qt5)
@@ -96,11 +96,11 @@ index c08efc4..87e25d9 100644
  set(CMAKE_CXX_STANDARD 11)
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/output/bin)
 diff --git a/Tests/RunCMake/CMakeLists.txt b/Tests/RunCMake/CMakeLists.txt
-index 69f8162..f389523 100644
+index 6b2f117..1002005 100644
 --- a/Tests/RunCMake/CMakeLists.txt
 +++ b/Tests/RunCMake/CMakeLists.txt
-@@ -334,7 +334,7 @@ add_RunCMake_test(configure_file)
- add_RunCMake_test(CTestTimeoutAfterMatch)
+@@ -376,7 +376,7 @@ else()
+ endif()
  
  find_package(Qt4 QUIET)
 -find_package(Qt5Core QUIET)
diff --git a/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch b/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
index d7d87a5256..e30dc51e4a 100644
--- a/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
+++ b/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
@@ -1,4 +1,4 @@
-From b003857d3481105c473e2e75bad4e9e2c6e70004 Mon Sep 17 00:00:00 2001
+From e528861023bf69df0ad061a59fd4e527c9dde1ce Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 12 May 2011 15:36:03 +0000
 Subject: [PATCH] cmake: support OpenEmbedded Qt4 tool binary names
@@ -25,7 +25,7 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
-index a145b46..7e18243 100644
+index 3993968..b2a8585 100644
 --- a/Modules/FindQt4.cmake
 +++ b/Modules/FindQt4.cmake
 @@ -518,7 +518,7 @@ endfunction()
diff --git a/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch b/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch
index 676e2857d7..48f43be837 100644
--- a/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch
+++ b/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch
@@ -1,4 +1,4 @@
-From d4a78e8739e845c2963666f7ef6a6c7a89827988 Mon Sep 17 00:00:00 2001
+From b0aeca35187983e22ec256a439cff4702dbde331 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:26:48 -0300
 Subject: [PATCH] Fail silently if system Qt installation is broken
@@ -28,7 +28,7 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 20 insertions(+), 19 deletions(-)
 
 diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
-index 7e18243..497d5c3 100644
+index b2a8585..77c89aa 100644
 --- a/Modules/FindQt4.cmake
 +++ b/Modules/FindQt4.cmake
 @@ -988,25 +988,26 @@ if (QT_QMAKE_EXECUTABLE AND
diff --git a/meta/recipes-devtools/cmake/cmake_3.15.5.bb b/meta/recipes-devtools/cmake/cmake_3.16.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.15.5.bb
rename to meta/recipes-devtools/cmake/cmake_3.16.1.bb
-- 
2.20.1


