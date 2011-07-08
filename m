Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QfBTW-0007Mu-D4
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 15:52:12 +0200
Received: by mail-gw0-f47.google.com with SMTP id 11so829616gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2011 06:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=i3KHCYW+X3EgkO/fyprnb6TJJ3hiVGci5ksiNcbSxYg=;
	b=mbCUPz/Dbb0s0J2pASlsMe+YF1sysqY/7ktQLsK/7vbQSuvt3crHNmkRYzf+qFfF5b
	MT7OaFWriWrDwelp1f5wGfpHwE3j9qd5z2jLiWV2bfem2b5XJZ86cBeHAwXlb7Z3mrVo
	U51iBwD2rnvwBILSbLQJgeOWVwnyEG0CJdbs4=
Received: by 10.236.108.43 with SMTP id p31mr2536167yhg.139.1310132899233;
	Fri, 08 Jul 2011 06:48:19 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id p50sm2650140yhj.0.2011.07.08.06.48.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jul 2011 06:48:18 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2011 13:47:46 +0000
Message-Id: <d851796fdf475882423cc97929d0242f7fcaf75e.1310132765.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1310132765.git.otavio@ossystems.com.br>
References: <cover.1310132765.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1310132765.git.otavio@ossystems.com.br>
References: <cover.1310132765.git.otavio@ossystems.com.br>
Subject: [PATCH 7/8] cmake: update to 2.8.5-rc3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jul 2011 13:52:12 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/cmake/cmake-native_2.8.3.bb  |    7 -------
 meta/recipes-devtools/cmake/cmake-native_2.8.5.bb  |   12 ++++++++++++
 .../cmake/cmake/support-oe-qt4-tools-names.patch   |   14 +++++++-------
 .../cmake/{cmake_2.8.3.bb => cmake_2.8.5.bb}       |    9 +++++++--
 4 files changed, 26 insertions(+), 16 deletions(-)
 delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.3.bb
 create mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
 rename meta/recipes-devtools/cmake/{cmake_2.8.3.bb => cmake_2.8.5.bb} (76%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.3.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.3.bb
deleted file mode 100644
index a68a25f..0000000
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require cmake.inc
-inherit native
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "a76a44b93acf5e3badda9de111385921"
-SRC_URI[sha256sum] = "689ed02786b5cefa5515c7716784ee82a82e8ece6be5a3d629ac3cc0c05fc288"
diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
new file mode 100644
index 0000000..c8da1cb
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
@@ -0,0 +1,12 @@
+require cmake.inc
+inherit native
+
+# This was need to keep version consistent - will be removed once 2.8.5 is released
+SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-2.8.5-rc3.tar.gz \
+           file://support-oe-qt4-tools-names.patch"
+S = "${WORKDIR}/cmake-2.8.5-rc3"
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "2d8018f8fa4c499e2c5b288d71660cba"
+SRC_URI[sha256sum] = "2987befc451f6404ea93bb99f00a38b80724fb655f121fed3bb0a08b65a771c8"
diff --git a/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch b/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
index 9bccd40..339199c 100644
--- a/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
+++ b/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
@@ -29,14 +29,14 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 -    NAMES moc-qt4 moc
 +    NAMES moc-qt4 moc4 moc
      PATHS ${QT_BINARY_DIR}
-     NO_DEFAULT_PATH
+     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
  
    FIND_PROGRAM(QT_UIC_EXECUTABLE
 -    NAMES uic-qt4 uic
 +    NAMES uic-qt4 uic4 uic
      PATHS ${QT_BINARY_DIR}
-     NO_DEFAULT_PATH
+     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
 @@ -1006,49 +1006,49 @@
      )
@@ -45,35 +45,35 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 -    NAMES rcc
 +    NAMES rcc4 rcc
      PATHS ${QT_BINARY_DIR}
-     NO_DEFAULT_PATH
+     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
  
    FIND_PROGRAM(QT_DBUSCPP2XML_EXECUTABLE 
 -    NAMES qdbuscpp2xml
 +    NAMES qdbuscpp2xml4 qdbuscpp2xml
      PATHS ${QT_BINARY_DIR}
-     NO_DEFAULT_PATH
+     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
  
    FIND_PROGRAM(QT_DBUSXML2CPP_EXECUTABLE 
 -    NAMES qdbusxml2cpp
 +    NAMES qdbusxml2cpp4 qdbusxml2cpp
      PATHS ${QT_BINARY_DIR}
-     NO_DEFAULT_PATH
+     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
  
    FIND_PROGRAM(QT_LUPDATE_EXECUTABLE
 -    NAMES lupdate-qt4 lupdate
 +    NAMES lupdate-qt4 lupdate4 lupdate
      PATHS ${QT_BINARY_DIR}
-     NO_DEFAULT_PATH
+     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
  
    FIND_PROGRAM(QT_LRELEASE_EXECUTABLE
 -    NAMES lrelease-qt4 lrelease
 +    NAMES lrelease-qt4 lrelease4 lrelease
      PATHS ${QT_BINARY_DIR}
-     NO_DEFAULT_PATH
+     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
      )
  
    FIND_PROGRAM(QT_QCOLLECTIONGENERATOR_EXECUTABLE
diff --git a/meta/recipes-devtools/cmake/cmake_2.8.3.bb b/meta/recipes-devtools/cmake/cmake_2.8.5.bb
similarity index 76%
rename from meta/recipes-devtools/cmake/cmake_2.8.3.bb
rename to meta/recipes-devtools/cmake/cmake_2.8.5.bb
index d1048ed..2a9a82c 100644
--- a/meta/recipes-devtools/cmake/cmake_2.8.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_2.8.5.bb
@@ -6,10 +6,15 @@ DEPENDS += "curl expat zlib libarchive ncurses"
 
 PR = "${INC_PR}.0"
 
+# This was need to keep version consistent - will be removed once 2.8.5 is released
+SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-2.8.5-rc3.tar.gz \
+           file://support-oe-qt4-tools-names.patch"
+S = "${WORKDIR}/cmake-2.8.5-rc3"
+
 SRC_URI += "file://dont-run-cross-binaries.patch"
 
-SRC_URI[md5sum] = "a76a44b93acf5e3badda9de111385921"
-SRC_URI[sha256sum] = "689ed02786b5cefa5515c7716784ee82a82e8ece6be5a3d629ac3cc0c05fc288"
+SRC_URI[md5sum] = "2d8018f8fa4c499e2c5b288d71660cba"
+SRC_URI[sha256sum] = "2987befc451f6404ea93bb99f00a38b80724fb655f121fed3bb0a08b65a771c8"
 
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
 python () {
-- 
1.7.2.5



