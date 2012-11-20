Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tact6-0005Xz-Ir
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 02:44:33 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Nov 2012 17:30:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,282,1352102400"; d="scan'208";a="244596740"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.202])
	by orsmga002.jf.intel.com with ESMTP; 19 Nov 2012 17:30:26 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2012 17:30:20 -0800
Message-Id: <bd25d2bc1fd42d04a60d496c4056e9f319e75994.1353374801.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1353374801.git.sgw@linux.intel.com>
References: <cover.1353374801.git.sgw@linux.intel.com>
In-Reply-To: <cover.1353374801.git.sgw@linux.intel.com>
References: <cover.1353374801.git.sgw@linux.intel.com>
Subject: [PATCH 12/13] cmake: Update to 2.8.10.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Nov 2012 01:44:33 -0000

Rebase the patches due to macro name changes.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../cmake/cmake-native_2.8.10.1.bb                 |    7 +++
 meta/recipes-devtools/cmake/cmake-native_2.8.8.bb  |    8 ---
 .../cmake/cmake/dont-run-cross-binaries.patch      |   19 ++++----
 .../cmake/cmake/support-oe-qt4-tools-names.patch   |   46 ++++++++++----------
 .../cmake/{cmake_2.8.8.bb => cmake_2.8.10.1.bb}    |    4 +-
 5 files changed, 42 insertions(+), 42 deletions(-)
 create mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.10.1.bb
 delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.8.bb
 rename meta/recipes-devtools/cmake/{cmake_2.8.8.bb => cmake_2.8.10.1.bb} (88%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.10.1.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.10.1.bb
new file mode 100644
index 0000000..3f09ae7
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake-native_2.8.10.1.bb
@@ -0,0 +1,7 @@
+require cmake.inc
+inherit native
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "aabf16d8e957f99921a0095885381373"
+SRC_URI[sha256sum] = "dbfb9d609e8fdb6f0947993246c11e2ee5d47944d6e7bd9314463b31e420e6e0"
diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.8.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.8.bb
deleted file mode 100644
index 03d57d1..0000000
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.8.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require cmake.inc
-inherit native
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "ba74b22c788a0c8547976b880cd02b17"
-SRC_URI[sha256sum] = "2b59897864d6220ff20aa8eac64cac8994e004898a1c0f899c8cb4d7b7570b46"
-
diff --git a/meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch b/meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch
index 4eb1794..0c059f1 100644
--- a/meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch
+++ b/meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch
@@ -7,16 +7,17 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 
-diff -ru cmake-2.8.2.orig/CMakeLists.txt cmake-2.8.2/CMakeLists.txt
---- cmake-2.8.2.orig/CMakeLists.txt	2010-07-28 00:48:42.000000000 +0200
-+++ cmake-2.8.2/CMakeLists.txt	2010-07-28 01:05:17.000000000 +0200
-@@ -518,7 +518,8 @@
+Index: cmake-2.8.10.1/CMakeLists.txt
+===================================================================
+--- cmake-2.8.10.1.orig/CMakeLists.txt
++++ cmake-2.8.10.1/CMakeLists.txt
+@@ -588,7 +588,8 @@ mark_as_advanced(CMAKE_STRICT)
  
  # build the remaining subdirectories
- ADD_SUBDIRECTORY(Source)
--ADD_SUBDIRECTORY(Utilities)
+ add_subdirectory(Source)
+-add_subdirectory(Utilities)
 +# Come on! Running the cross-binaries on host is not a good idea.
-+#ADD_SUBDIRECTORY(Utilities)
- ADD_SUBDIRECTORY(Tests)
++#add_subdirectory(Utilities)
+ add_subdirectory(Tests)
  
- # add a test
+ if(BUILD_TESTING)
diff --git a/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch b/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
index 147c249..258971b 100644
--- a/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
+++ b/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
@@ -11,88 +11,88 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 
-Index: cmake-2.8.5-rc3/Modules/FindQt4.cmake
+Index: cmake-2.8.10.1/Modules/FindQt4.cmake
 ===================================================================
---- cmake-2.8.5-rc3.orig/Modules/FindQt4.cmake	2011-06-27 14:41:05.000000000 +0000
-+++ cmake-2.8.5-rc3/Modules/FindQt4.cmake	2011-07-08 15:31:58.057170949 +0000
-@@ -473,7 +473,7 @@
+--- cmake-2.8.10.1.orig/Modules/FindQt4.cmake
++++ cmake-2.8.10.1/Modules/FindQt4.cmake
+@@ -497,7 +497,7 @@ get_filename_component(qt_install_versio
  # check for qmake
  # Debian uses qmake-qt4
  # macports' Qt uses qmake-mac
--FIND_PROGRAM(QT_QMAKE_EXECUTABLE NAMES qmake qmake4 qmake-qt4 qmake-mac PATHS
-+FIND_PROGRAM(QT_QMAKE_EXECUTABLE NAMES qmake qmake2 qmake4 qmake-qt4 qmake-mac PATHS
-   "[HKEY_CURRENT_USER\\Software\\Trolltech\\Qt3Versions\\4.0.0;InstallDir]/bin"
-   "[HKEY_CURRENT_USER\\Software\\Trolltech\\Versions\\4.0.0;InstallDir]/bin"
-   "[HKEY_CURRENT_USER\\Software\\Trolltech\\Versions\\${qt_install_version};InstallDir]/bin"
-@@ -944,13 +944,13 @@
-   ENDIF(QT_QMAKE_CHANGED)
-   
-   FIND_PROGRAM(QT_MOC_EXECUTABLE
+-find_program(QT_QMAKE_EXECUTABLE NAMES qmake qmake4 qmake-qt4 qmake-mac
++find_program(QT_QMAKE_EXECUTABLE NAMES qmake qmake2 qmake4 qmake-qt4 qmake-mac
+   PATHS
+     ENV QTDIR
+     "[HKEY_CURRENT_USER\\Software\\Trolltech\\Versions\\${qt_install_version};InstallDir]"
+@@ -982,13 +982,13 @@ if (QT_QMAKE_EXECUTABLE AND QTVERSION)
+   endif()
+ 
+   find_program(QT_MOC_EXECUTABLE
 -    NAMES moc-qt4 moc
 +    NAMES moc-qt4 moc4 moc
      PATHS ${QT_BINARY_DIR}
      NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
  
-   FIND_PROGRAM(QT_UIC_EXECUTABLE
+   find_program(QT_UIC_EXECUTABLE
 -    NAMES uic-qt4 uic
 +    NAMES uic-qt4 uic4 uic
      PATHS ${QT_BINARY_DIR}
      NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
-@@ -962,49 +962,49 @@
+@@ -1000,49 +1000,49 @@ if (QT_QMAKE_EXECUTABLE AND QTVERSION)
      )
  
-   FIND_PROGRAM(QT_RCC_EXECUTABLE 
+   find_program(QT_RCC_EXECUTABLE
 -    NAMES rcc
 +    NAMES rcc4 rcc
      PATHS ${QT_BINARY_DIR}
      NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
  
-   FIND_PROGRAM(QT_DBUSCPP2XML_EXECUTABLE 
+   find_program(QT_DBUSCPP2XML_EXECUTABLE
 -    NAMES qdbuscpp2xml
 +    NAMES qdbuscpp2xml4 qdbuscpp2xml
      PATHS ${QT_BINARY_DIR}
      NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
  
-   FIND_PROGRAM(QT_DBUSXML2CPP_EXECUTABLE 
+   find_program(QT_DBUSXML2CPP_EXECUTABLE
 -    NAMES qdbusxml2cpp
 +    NAMES qdbusxml2cpp4 qdbusxml2cpp
      PATHS ${QT_BINARY_DIR}
      NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
  
-   FIND_PROGRAM(QT_LUPDATE_EXECUTABLE
+   find_program(QT_LUPDATE_EXECUTABLE
 -    NAMES lupdate-qt4 lupdate
 +    NAMES lupdate-qt4 lupdate4 lupdate
      PATHS ${QT_BINARY_DIR}
      NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
  
-   FIND_PROGRAM(QT_LRELEASE_EXECUTABLE
+   find_program(QT_LRELEASE_EXECUTABLE
 -    NAMES lrelease-qt4 lrelease
 +    NAMES lrelease-qt4 lrelease4 lrelease
      PATHS ${QT_BINARY_DIR}
      NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
  
-   FIND_PROGRAM(QT_QCOLLECTIONGENERATOR_EXECUTABLE
+   find_program(QT_QCOLLECTIONGENERATOR_EXECUTABLE
 -    NAMES qcollectiongenerator-qt4 qcollectiongenerator
 +    NAMES qcollectiongenerator-qt4 qcollectiongenerator4 qcollectiongenerator
      PATHS ${QT_BINARY_DIR}
      NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
  
-   FIND_PROGRAM(QT_DESIGNER_EXECUTABLE
+   find_program(QT_DESIGNER_EXECUTABLE
 -    NAMES designer-qt4 designer
 +    NAMES designer-qt4 designer4 designer
      PATHS ${QT_BINARY_DIR}
      NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
  
-   FIND_PROGRAM(QT_LINGUIST_EXECUTABLE
+   find_program(QT_LINGUIST_EXECUTABLE
 -    NAMES linguist-qt4 linguist
 +    NAMES linguist-qt4 linguist4 linguist
      PATHS ${QT_BINARY_DIR}
diff --git a/meta/recipes-devtools/cmake/cmake_2.8.8.bb b/meta/recipes-devtools/cmake/cmake_2.8.10.1.bb
similarity index 88%
rename from meta/recipes-devtools/cmake/cmake_2.8.8.bb
rename to meta/recipes-devtools/cmake/cmake_2.8.10.1.bb
index 8665dc3..adc9aaa 100644
--- a/meta/recipes-devtools/cmake/cmake_2.8.8.bb
+++ b/meta/recipes-devtools/cmake/cmake_2.8.10.1.bb
@@ -8,8 +8,8 @@ PR = "${INC_PR}.0"
 
 SRC_URI += "file://dont-run-cross-binaries.patch"
 
-SRC_URI[md5sum] = "ba74b22c788a0c8547976b880cd02b17"
-SRC_URI[sha256sum] = "2b59897864d6220ff20aa8eac64cac8994e004898a1c0f899c8cb4d7b7570b46"
+SRC_URI[md5sum] = "aabf16d8e957f99921a0095885381373"
+SRC_URI[sha256sum] = "dbfb9d609e8fdb6f0947993246c11e2ee5d47944d6e7bd9314463b31e420e6e0"
 
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
 python () {
-- 
1.7.7.6



