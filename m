Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QLQEl-00068M-NS
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 03:35:16 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 May 2011 18:32:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,368,1301900400"; d="scan'208";a="642792471"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by orsmga002.jf.intel.com with ESMTP; 14 May 2011 18:32:23 -0700
Message-Id: <9a2fd8a99d904c16b28557d88aa0aedde70de721.1305422996.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305422996.git.sgw@linux.intel.com>
References: <cover.1305422996.git.sgw@linux.intel.com>
Old-Date: Thu, 12 May 2011 15:11:16 +0100
Date: Sat, 14 May 2011 18:32:23 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 04/15] qt4: update from 4.7.2 to 4.7.3
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
X-List-Received-Date: Sun, 15 May 2011 01:35:16 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

The Comodo certificates patch has been merged upstream so it no longer
needs to be applied. Some PR values were reset and SRC_URI checksums
updated but other than this there are no recipe changes.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/{qt-4.7.2.inc => qt-4.7.3.inc} |    5 ++---
 .../0001-Added-Openembedded-crossarch-option.patch |    0
 .../recipes-qt/qt4/{qt-4.7.2 => qt-4.7.3}/g++.conf |    0
 .../hack-out-pg2-4.7.0.patch                       |    0
 .../qt4/{qt-4.7.2 => qt-4.7.3}/linux.conf          |    0
 ...qt4-embedded_4.7.2.bb => qt4-embedded_4.7.3.bb} |    2 +-
 ...s-native_4.7.2.bb => qt4-tools-native_4.7.3.bb} |    4 ++--
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb   |    6 ------
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb   |    6 ++++++
 ...qt4-x11-free_4.7.2.bb => qt4-x11-free_4.7.3.bb} |    2 +-
 10 files changed, 12 insertions(+), 13 deletions(-)
 rename meta/recipes-qt/qt4/{qt-4.7.2.inc => qt-4.7.3.inc} (89%)
 rename meta/recipes-qt/qt4/{qt-4.7.2 => qt-4.7.3}/0001-Added-Openembedded-crossarch-option.patch (100%)
 rename meta/recipes-qt/qt4/{qt-4.7.2 => qt-4.7.3}/g++.conf (100%)
 rename meta/recipes-qt/qt4/{qt-4.7.2 => qt-4.7.3}/hack-out-pg2-4.7.0.patch (100%)
 rename meta/recipes-qt/qt4/{qt-4.7.2 => qt-4.7.3}/linux.conf (100%)
 rename meta/recipes-qt/qt4/{qt4-embedded_4.7.2.bb => qt4-embedded_4.7.3.bb} (87%)
 rename meta/recipes-qt/qt4/{qt4-tools-native_4.7.2.bb => qt4-tools-native_4.7.3.bb} (61%)
 delete mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb
 rename meta/recipes-qt/qt4/{qt4-x11-free_4.7.2.bb => qt4-x11-free_4.7.3.bb} (88%)

diff --git a/meta/recipes-qt/qt4/qt-4.7.2.inc b/meta/recipes-qt/qt4/qt-4.7.3.inc
similarity index 89%
rename from meta/recipes-qt/qt4/qt-4.7.2.inc
rename to meta/recipes-qt/qt4/qt-4.7.3.inc
index 0f75a46..7f26b9b 100644
--- a/meta/recipes-qt/qt4/qt-4.7.2.inc
+++ b/meta/recipes-qt/qt4/qt-4.7.3.inc
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
 FILESPATH =. "${FILE_DIRNAME}/qt-${PV}:"
 
 SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
-           file://blacklist-fraudulent-comodo-certificates-patch.diff \
            file://0004-no-qmake.patch \
            file://hack-out-pg2-4.7.0.patch \
            file://0006-freetype-host-includes.patch \
@@ -15,8 +14,8 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://linux.conf \
            "
 
-SRC_URI[md5sum] = "66b992f5c21145df08c99d21847f4fdb"
-SRC_URI[sha256sum] = "d4783b524b90bcd270ccf6e7a30d5fb51696c47eb5de49ebc2d553cd3eb49336"
+SRC_URI[md5sum] = "49b96eefb1224cc529af6fe5608654fe"
+SRC_URI[sha256sum] = "d02b6fd69d089c01f4a787aa18175d074ccaecf8980a5956e328c2991905937e"
 
 S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 
diff --git a/meta/recipes-qt/qt4/qt-4.7.2/0001-Added-Openembedded-crossarch-option.patch b/meta/recipes-qt/qt4/qt-4.7.3/0001-Added-Openembedded-crossarch-option.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.7.2/0001-Added-Openembedded-crossarch-option.patch
rename to meta/recipes-qt/qt4/qt-4.7.3/0001-Added-Openembedded-crossarch-option.patch
diff --git a/meta/recipes-qt/qt4/qt-4.7.2/g++.conf b/meta/recipes-qt/qt4/qt-4.7.3/g++.conf
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.7.2/g++.conf
rename to meta/recipes-qt/qt4/qt-4.7.3/g++.conf
diff --git a/meta/recipes-qt/qt4/qt-4.7.2/hack-out-pg2-4.7.0.patch b/meta/recipes-qt/qt4/qt-4.7.3/hack-out-pg2-4.7.0.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.7.2/hack-out-pg2-4.7.0.patch
rename to meta/recipes-qt/qt4/qt-4.7.3/hack-out-pg2-4.7.0.patch
diff --git a/meta/recipes-qt/qt4/qt-4.7.2/linux.conf b/meta/recipes-qt/qt4/qt-4.7.3/linux.conf
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.7.2/linux.conf
rename to meta/recipes-qt/qt4/qt-4.7.3/linux.conf
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.7.2.bb b/meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb
similarity index 87%
rename from meta/recipes-qt/qt4/qt4-embedded_4.7.2.bb
rename to meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb
index c3f6713..b88b1e9 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.7.2.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb
@@ -1,7 +1,7 @@
 require qt-${PV}.inc
 require qt4-embedded.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
diff --git a/meta/recipes-qt/qt4/qt4-tools-native_4.7.2.bb b/meta/recipes-qt/qt4/qt4-tools-native_4.7.3.bb
similarity index 61%
rename from meta/recipes-qt/qt4/qt4-tools-native_4.7.2.bb
rename to meta/recipes-qt/qt4/qt4-tools-native_4.7.3.bb
index d3c0eda..deb4231 100644
--- a/meta/recipes-qt/qt4/qt4-tools-native_4.7.2.bb
+++ b/meta/recipes-qt/qt4/qt4-tools-native_4.7.3.bb
@@ -9,5 +9,5 @@ EXTRA_OECONF += " -no-fast -silent -no-rpath"
 
 TOBUILD := "src/tools/bootstrap ${TOBUILD}"
 
-SRC_URI[md5sum] = "66b992f5c21145df08c99d21847f4fdb"
-SRC_URI[sha256sum] = "d4783b524b90bcd270ccf6e7a30d5fb51696c47eb5de49ebc2d553cd3eb49336"
+SRC_URI[md5sum] = "49b96eefb1224cc529af6fe5608654fe"
+SRC_URI[sha256sum] = "d02b6fd69d089c01f4a787aa18175d074ccaecf8980a5956e328c2991905937e"
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb
deleted file mode 100644
index a917ac4..0000000
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require qt4-tools-nativesdk.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "66b992f5c21145df08c99d21847f4fdb"
-SRC_URI[sha256sum] = "d4783b524b90bcd270ccf6e7a30d5fb51696c47eb5de49ebc2d553cd3eb49336"
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb
new file mode 100644
index 0000000..d61f312
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb
@@ -0,0 +1,6 @@
+require qt4-tools-nativesdk.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "49b96eefb1224cc529af6fe5608654fe"
+SRC_URI[sha256sum] = "d02b6fd69d089c01f4a787aa18175d074ccaecf8980a5956e328c2991905937e"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.7.2.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb
similarity index 88%
rename from meta/recipes-qt/qt4/qt4-x11-free_4.7.2.bb
rename to meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb
index 75c6314..359a756 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.7.2.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb
@@ -1,7 +1,7 @@
 require qt4-x11-free.inc
 require qt-${PV}.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
-- 
1.7.1.1



