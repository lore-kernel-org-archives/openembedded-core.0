Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D01156A432
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 00:40:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 May 2013 17:40:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,717,1363158000"; d="scan'208";a="341405597"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.171])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2013 17:40:29 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 17:40:25 -0700
Message-Id: <70e21b5f16cb4a509adc3652bc0b2f14a9c621e7.1369183108.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1369183108.git.sgw@linux.intel.com>
References: <cover.1369183108.git.sgw@linux.intel.com>
In-Reply-To: <cover.1369183108.git.sgw@linux.intel.com>
References: <cover.1369183108.git.sgw@linux.intel.com>
Subject: [PATCH 7/7] cmake: Update to 2.8.11
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
X-List-Received-Date: Wed, 22 May 2013 00:40:39 -0000

Rebased support-oe-qt4-tools-names as some of the changes where

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../cmake/cmake-native_2.8.10.2.bb                 |  7 ---
 meta/recipes-devtools/cmake/cmake-native_2.8.11.bb |  5 ++
 meta/recipes-devtools/cmake/cmake.inc              |  2 -
 .../cmake/cmake/support-oe-qt4-tools-names.patch   | 70 +++++-----------------
 .../cmake/{cmake_2.8.10.2.bb => cmake_2.8.11.bb}   |  6 +-
 5 files changed, 21 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.10.2.bb
 create mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.11.bb
 rename meta/recipes-devtools/cmake/{cmake_2.8.10.2.bb => cmake_2.8.11.bb} (86%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.10.2.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.10.2.bb
deleted file mode 100644
index 01860a7..0000000
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.10.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require cmake.inc
-inherit native
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "097278785da7182ec0aea8769d06860c"
-SRC_URI[sha256sum] = "ce524fb39da06ee6d47534bbcec6e0b50422e18b62abc4781a4ba72ea2910eb1"
diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.11.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.11.bb
new file mode 100644
index 0000000..dfe103f
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake-native_2.8.11.bb
@@ -0,0 +1,5 @@
+require cmake.inc
+inherit native
+
+SRC_URI[md5sum] = "be6008f2299613d23fe82ab53ef7472e"
+SRC_URI[sha256sum] = "20d0d3661797fa82c19e7a75c7315c640e001cb3238331ca170bb0fae27feee5"
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index b2cba5e..6144d51 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -9,8 +9,6 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://Copyright.txt;md5=bb2fa3a08736b842556f6171bb9e8ae1 \
                     file://Source/cmake.h;beginline=1;endline=10;md5=341736dae83c9e344b53eeb1bc7d7bc2"
 
-INC_PR = "r1"
-
 CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
 
 SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
diff --git a/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch b/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
index 258971b..0e311f7 100644
--- a/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
+++ b/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
@@ -11,36 +11,20 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 
-Index: cmake-2.8.10.1/Modules/FindQt4.cmake
+Index: cmake-2.8.11/Modules/FindQt4.cmake
 ===================================================================
---- cmake-2.8.10.1.orig/Modules/FindQt4.cmake
-+++ cmake-2.8.10.1/Modules/FindQt4.cmake
-@@ -497,7 +497,7 @@ get_filename_component(qt_install_versio
- # check for qmake
- # Debian uses qmake-qt4
- # macports' Qt uses qmake-mac
--find_program(QT_QMAKE_EXECUTABLE NAMES qmake qmake4 qmake-qt4 qmake-mac
-+find_program(QT_QMAKE_EXECUTABLE NAMES qmake qmake2 qmake4 qmake-qt4 qmake-mac
-   PATHS
-     ENV QTDIR
-     "[HKEY_CURRENT_USER\\Software\\Trolltech\\Versions\\${qt_install_version};InstallDir]"
-@@ -982,13 +982,13 @@ if (QT_QMAKE_EXECUTABLE AND QTVERSION)
-   endif()
+--- cmake-2.8.11.orig/Modules/FindQt4.cmake
++++ cmake-2.8.11/Modules/FindQt4.cmake
+@@ -569,7 +569,7 @@ endfunction()
  
-   find_program(QT_MOC_EXECUTABLE
--    NAMES moc-qt4 moc
-+    NAMES moc-qt4 moc4 moc
-     PATHS ${QT_BINARY_DIR}
-     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
-     )
+ set(QT4_INSTALLED_VERSION_TOO_OLD FALSE)
  
-   find_program(QT_UIC_EXECUTABLE
--    NAMES uic-qt4 uic
-+    NAMES uic-qt4 uic4 uic
-     PATHS ${QT_BINARY_DIR}
-     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
-     )
-@@ -1000,49 +1000,49 @@ if (QT_QMAKE_EXECUTABLE AND QTVERSION)
+-set(_QT4_QMAKE_NAMES qmake qmake4 qmake-qt4 qmake-mac)
++set(_QT4_QMAKE_NAMES qmake qmake2 qmake4 qmake-qt4 qmake-mac)
+ _qt4_find_qmake("${_QT4_QMAKE_NAMES}" QT_QMAKE_EXECUTABLE QTVERSION)
+ 
+ if (QT_QMAKE_EXECUTABLE AND QTVERSION)
+@@ -1157,19 +1157,19 @@ if (QT_QMAKE_EXECUTABLE AND QTVERSION)
      )
  
    find_program(QT_RCC_EXECUTABLE
@@ -59,42 +43,16 @@ Index: cmake-2.8.10.1/Modules/FindQt4.cmake
  
    find_program(QT_DBUSXML2CPP_EXECUTABLE
 -    NAMES qdbusxml2cpp
-+    NAMES qdbusxml2cpp4 qdbusxml2cpp
-     PATHS ${QT_BINARY_DIR}
-     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
-     )
- 
-   find_program(QT_LUPDATE_EXECUTABLE
--    NAMES lupdate-qt4 lupdate
-+    NAMES lupdate-qt4 lupdate4 lupdate
++    NAMES qdbusxml2cp4 qdbusxml2cpp
      PATHS ${QT_BINARY_DIR}
      NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
- 
-   find_program(QT_LRELEASE_EXECUTABLE
--    NAMES lrelease-qt4 lrelease
-+    NAMES lrelease-qt4 lrelease4 lrelease
-     PATHS ${QT_BINARY_DIR}
-     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
+@@ -1187,7 +1187,7 @@ if (QT_QMAKE_EXECUTABLE AND QTVERSION)
      )
  
    find_program(QT_QCOLLECTIONGENERATOR_EXECUTABLE
 -    NAMES qcollectiongenerator-qt4 qcollectiongenerator
-+    NAMES qcollectiongenerator-qt4 qcollectiongenerator4 qcollectiongenerator
-     PATHS ${QT_BINARY_DIR}
-     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
-     )
- 
-   find_program(QT_DESIGNER_EXECUTABLE
--    NAMES designer-qt4 designer
-+    NAMES designer-qt4 designer4 designer
-     PATHS ${QT_BINARY_DIR}
-     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
-     )
- 
-   find_program(QT_LINGUIST_EXECUTABLE
--    NAMES linguist-qt4 linguist
-+    NAMES linguist-qt4 linguist4 linguist
++    NAMES qcollectiongenerator-qt4 qcollectiongenerator qcollectiongenerator4
      PATHS ${QT_BINARY_DIR}
      NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
diff --git a/meta/recipes-devtools/cmake/cmake_2.8.10.2.bb b/meta/recipes-devtools/cmake/cmake_2.8.11.bb
similarity index 86%
rename from meta/recipes-devtools/cmake/cmake_2.8.10.2.bb
rename to meta/recipes-devtools/cmake/cmake_2.8.11.bb
index 65f75b4..bc07155 100644
--- a/meta/recipes-devtools/cmake/cmake_2.8.10.2.bb
+++ b/meta/recipes-devtools/cmake/cmake_2.8.11.bb
@@ -4,12 +4,10 @@ inherit cmake
 
 DEPENDS += "curl expat zlib libarchive ncurses"
 
-PR = "${INC_PR}.0"
-
 SRC_URI += "file://dont-run-cross-binaries.patch"
 
-SRC_URI[md5sum] = "097278785da7182ec0aea8769d06860c"
-SRC_URI[sha256sum] = "ce524fb39da06ee6d47534bbcec6e0b50422e18b62abc4781a4ba72ea2910eb1"
+SRC_URI[md5sum] = "be6008f2299613d23fe82ab53ef7472e"
+SRC_URI[sha256sum] = "20d0d3661797fa82c19e7a75c7315c640e001cb3238331ca170bb0fae27feee5"
 
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
 python () {
-- 
1.8.1.4


