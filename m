Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id E52CE7C1ED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 16:19:55 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x1CGJu3K003639
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 12 Feb 2019 17:19:56 +0100
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.77.77])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id x1CGJtxx005077;
	Tue, 12 Feb 2019 17:19:55 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id A768A10D47AA;
	Tue, 12 Feb 2019 17:19:55 +0100 (CET)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2019 17:19:49 +0100
Message-Id: <20190212161949.20399-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: [PATCHv2] cmake: update to 3.13.4
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
X-List-Received-Date: Tue, 12 Feb 2019 16:19:56 -0000

All patches have been rebased on top of the 3.13.4 release.

I successfully built all CMake recipes in oe-core and meta-oe.


Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
---
 .../cmake/{cmake-native_3.12.2.bb => cmake-native_3.13.4.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                             | 4 ++--
 .../cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch     | 8 ++++----
 ...005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch | 2 +-
 meta/recipes-devtools/cmake/{cmake_3.12.2.bb => cmake_3.13.4.bb}  | 0
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.12.2.bb => cmake-native_3.13.4.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.12.2.bb => cmake_3.13.4.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.12.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.13.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.12.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.13.4.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 09e28b73dd..68a71e9139 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -18,7 +18,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[md5sum] = "6e7c550cfa1c2e216b35903dc70d80af"
-SRC_URI[sha256sum] = "0f97485799e51a7070cc11494f3e02349b0fc3a24cc12b082e737bf67a0581a4"
+SRC_URI[md5sum] = "b5a544ffc73f6922a6cf371fcb6bae22"
+SRC_URI[sha256sum] = "fdd928fee35f472920071d1c7f1a6a2b72c9b25e04f7a37b409349aef3f20e9b"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch b/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
index 6f788ada00..3bea6935b7 100644
--- a/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
+++ b/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
@@ -39,7 +39,7 @@ diff --git a/Tests/CMakeLists.txt b/Tests/CMakeLists.txt
 index b8b724ed8..63f6bb6d2 100644
 --- a/Tests/CMakeLists.txt
 +++ b/Tests/CMakeLists.txt
-@@ -1322,7 +1322,7 @@ ${CMake_BINARY_DIR}/bin/cmake -DDIR=dev -P ${CMake_SOURCE_DIR}/Utilities/Release
+@@ -1297,7 +1297,7 @@ ${CMake_BINARY_DIR}/bin/cmake -DDIR=dev -P ${CMake_SOURCE_DIR}/Utilities/Release
      set(CMake_TEST_Qt5 1)
    endif()
    if(CMake_TEST_Qt5)
@@ -70,10 +70,10 @@ diff --git a/Tests/QtAutogen/AutogenTest.cmake b/Tests/QtAutogen/AutogenTest.cma
 index 8c0a14fca..e9923b21a 100644
 --- a/Tests/QtAutogen/AutogenTest.cmake
 +++ b/Tests/QtAutogen/AutogenTest.cmake
-@@ -22,7 +22,7 @@ if (QT_TEST_VERSION STREQUAL 4)
+@@ -22,7 +22,7 @@ if (QT_TEST_VERSION EQUAL 4)
    endmacro()
  
- elseif(QT_TEST_VERSION STREQUAL 5)
+ elseif(QT_TEST_VERSION EQUAL 5)
 -  find_package(Qt5Widgets REQUIRED)
 +  #find_package(Qt5Widgets REQUIRED)
  
@@ -96,7 +96,7 @@ diff --git a/Tests/RunCMake/CMakeLists.txt b/Tests/RunCMake/CMakeLists.txt
 index 637c5c2cb..c0376effc 100644
 --- a/Tests/RunCMake/CMakeLists.txt
 +++ b/Tests/RunCMake/CMakeLists.txt
-@@ -291,7 +291,7 @@ add_RunCMake_test(configure_file)
+@@ -310,7 +310,7 @@ add_RunCMake_test(configure_file)
  add_RunCMake_test(CTestTimeoutAfterMatch)
  
  find_package(Qt4 QUIET)
diff --git a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
index 23ce8e9e4a..ad42d409d9 100644
--- a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
+++ b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
@@ -20,7 +20,7 @@ diff --git a/Utilities/cmlibarchive/CMakeLists.txt b/Utilities/cmlibarchive/CMak
 index 206f3c6a5..642fb0dd9 100644
 --- a/Utilities/cmlibarchive/CMakeLists.txt
 +++ b/Utilities/cmlibarchive/CMakeLists.txt
-@@ -400,12 +400,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
+@@ -430,12 +430,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
  LA_CHECK_INCLUDE_FILE("direct.h" HAVE_DIRECT_H)
  LA_CHECK_INCLUDE_FILE("dlfcn.h" HAVE_DLFCN_H)
  LA_CHECK_INCLUDE_FILE("errno.h" HAVE_ERRNO_H)
diff --git a/meta/recipes-devtools/cmake/cmake_3.12.2.bb b/meta/recipes-devtools/cmake/cmake_3.13.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.12.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.13.4.bb
-- 
2.11.0


