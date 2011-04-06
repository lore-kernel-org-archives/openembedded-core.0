Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Q7UCV-0004xi-9C
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 16:59:19 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Apr 2011 07:57:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,310,1299484800"; d="scan'208";a="906301639"
Received: from unknown (HELO helios) ([10.255.12.249])
	by fmsmga001.fm.intel.com with SMTP; 06 Apr 2011 07:57:09 -0700
Received: by helios (sSMTP sendmail emulation); Wed, 06 Apr 2011 15:57:07 +0100
Message-Id: <0471301531ca9cf1fb3af47517dfd730e2a34de1.1302101718.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1302101718.git.paul.eggleton@linux.intel.com>
References: <cover.1302101718.git.paul.eggleton@linux.intel.com>
Old-Date: Tue, 5 Apr 2011 10:42:52 +0100
Date: Wed, 06 Apr 2011 15:57:07 +0100
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] qt4: replace 4.7.1 with version 4.7.2
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
X-List-Received-Date: Wed, 06 Apr 2011 14:59:19 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Qt 4.7.2 is a bugfix release for the 4.7 series - more details here:

  http://qt.nokia.com/developer/changes/changes-4.7.2/

This was prompted by the equivalent change in OE, however the change was
redone by hand. There are no changes to the recipes themselves other than
updating SRC_URI checksums and resetting PR.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/{qt-4.7.1.inc => qt-4.7.2.inc} |    4 ++--
 .../0001-Added-Openembedded-crossarch-option.patch |    0
 .../recipes-qt/qt4/{qt-4.7.1 => qt-4.7.2}/g++.conf |    0
 .../hack-out-pg2-4.7.0.patch                       |    0
 .../qt4/{qt-4.7.1 => qt-4.7.2}/linux.conf          |    0
 ...qt4-embedded_4.7.1.bb => qt4-embedded_4.7.2.bb} |    2 +-
 ...s-native_4.7.1.bb => qt4-tools-native_4.7.2.bb} |    4 ++--
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.1.bb   |    6 ------
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb   |    6 ++++++
 ...qt4-x11-free_4.7.1.bb => qt4-x11-free_4.7.2.bb} |    2 +-
 10 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-qt/qt4/{qt-4.7.1.inc => qt-4.7.2.inc} (93%)
 rename meta/recipes-qt/qt4/{qt-4.7.1 => qt-4.7.2}/0001-Added-Openembedded-crossarch-option.patch (100%)
 rename meta/recipes-qt/qt4/{qt-4.7.1 => qt-4.7.2}/g++.conf (100%)
 rename meta/recipes-qt/qt4/{qt-4.7.1 => qt-4.7.2}/hack-out-pg2-4.7.0.patch (100%)
 rename meta/recipes-qt/qt4/{qt-4.7.1 => qt-4.7.2}/linux.conf (100%)
 rename meta/recipes-qt/qt4/{qt4-embedded_4.7.1.bb => qt4-embedded_4.7.2.bb} (87%)
 rename meta/recipes-qt/qt4/{qt4-tools-native_4.7.1.bb => qt4-tools-native_4.7.2.bb} (61%)
 delete mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.1.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb
 rename meta/recipes-qt/qt4/{qt4-x11-free_4.7.1.bb => qt4-x11-free_4.7.2.bb} (88%)

diff --git a/meta/recipes-qt/qt4/qt-4.7.1.inc b/meta/recipes-qt/qt4/qt-4.7.2.inc
similarity index 93%
rename from meta/recipes-qt/qt4/qt-4.7.1.inc
rename to meta/recipes-qt/qt4/qt-4.7.2.inc
index 70ee596..ed62bd3 100644
--- a/meta/recipes-qt/qt4/qt-4.7.1.inc
+++ b/meta/recipes-qt/qt4/qt-4.7.2.inc
@@ -14,8 +14,8 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://linux.conf \
            "
 
-SRC_URI[md5sum] = "6f88d96507c84e9fea5bf3a71ebeb6d7"
-SRC_URI[sha256sum] = "8cb5277c41f824cfc6dcee0e95e0bf23a9ad2c8d18d245105137481d092b124a"
+SRC_URI[md5sum] = "66b992f5c21145df08c99d21847f4fdb"
+SRC_URI[sha256sum] = "d4783b524b90bcd270ccf6e7a30d5fb51696c47eb5de49ebc2d553cd3eb49336"
 
 S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 
diff --git a/meta/recipes-qt/qt4/qt-4.7.1/0001-Added-Openembedded-crossarch-option.patch b/meta/recipes-qt/qt4/qt-4.7.2/0001-Added-Openembedded-crossarch-option.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.7.1/0001-Added-Openembedded-crossarch-option.patch
rename to meta/recipes-qt/qt4/qt-4.7.2/0001-Added-Openembedded-crossarch-option.patch
diff --git a/meta/recipes-qt/qt4/qt-4.7.1/g++.conf b/meta/recipes-qt/qt4/qt-4.7.2/g++.conf
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.7.1/g++.conf
rename to meta/recipes-qt/qt4/qt-4.7.2/g++.conf
diff --git a/meta/recipes-qt/qt4/qt-4.7.1/hack-out-pg2-4.7.0.patch b/meta/recipes-qt/qt4/qt-4.7.2/hack-out-pg2-4.7.0.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.7.1/hack-out-pg2-4.7.0.patch
rename to meta/recipes-qt/qt4/qt-4.7.2/hack-out-pg2-4.7.0.patch
diff --git a/meta/recipes-qt/qt4/qt-4.7.1/linux.conf b/meta/recipes-qt/qt4/qt-4.7.2/linux.conf
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.7.1/linux.conf
rename to meta/recipes-qt/qt4/qt-4.7.2/linux.conf
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.7.1.bb b/meta/recipes-qt/qt4/qt4-embedded_4.7.2.bb
similarity index 87%
rename from meta/recipes-qt/qt4/qt4-embedded_4.7.1.bb
rename to meta/recipes-qt/qt4/qt4-embedded_4.7.2.bb
index c3f6713..b88b1e9 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.7.1.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.7.2.bb
@@ -1,7 +1,7 @@
 require qt-${PV}.inc
 require qt4-embedded.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
diff --git a/meta/recipes-qt/qt4/qt4-tools-native_4.7.1.bb b/meta/recipes-qt/qt4/qt4-tools-native_4.7.2.bb
similarity index 61%
rename from meta/recipes-qt/qt4/qt4-tools-native_4.7.1.bb
rename to meta/recipes-qt/qt4/qt4-tools-native_4.7.2.bb
index e9de510..d3c0eda 100644
--- a/meta/recipes-qt/qt4/qt4-tools-native_4.7.1.bb
+++ b/meta/recipes-qt/qt4/qt4-tools-native_4.7.2.bb
@@ -9,5 +9,5 @@ EXTRA_OECONF += " -no-fast -silent -no-rpath"
 
 TOBUILD := "src/tools/bootstrap ${TOBUILD}"
 
-SRC_URI[md5sum] = "6f88d96507c84e9fea5bf3a71ebeb6d7"
-SRC_URI[sha256sum] = "8cb5277c41f824cfc6dcee0e95e0bf23a9ad2c8d18d245105137481d092b124a"
+SRC_URI[md5sum] = "66b992f5c21145df08c99d21847f4fdb"
+SRC_URI[sha256sum] = "d4783b524b90bcd270ccf6e7a30d5fb51696c47eb5de49ebc2d553cd3eb49336"
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.1.bb b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.1.bb
deleted file mode 100644
index 091a539..0000000
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require qt4-tools-nativesdk.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "6f88d96507c84e9fea5bf3a71ebeb6d7"
-SRC_URI[sha256sum] = "8cb5277c41f824cfc6dcee0e95e0bf23a9ad2c8d18d245105137481d092b124a"
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb
new file mode 100644
index 0000000..a917ac4
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb
@@ -0,0 +1,6 @@
+require qt4-tools-nativesdk.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "66b992f5c21145df08c99d21847f4fdb"
+SRC_URI[sha256sum] = "d4783b524b90bcd270ccf6e7a30d5fb51696c47eb5de49ebc2d553cd3eb49336"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.7.1.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.7.2.bb
similarity index 88%
rename from meta/recipes-qt/qt4/qt4-x11-free_4.7.1.bb
rename to meta/recipes-qt/qt4/qt4-x11-free_4.7.2.bb
index 75c6314..359a756 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.7.1.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.7.2.bb
@@ -1,7 +1,7 @@
 require qt4-x11-free.inc
 require qt-${PV}.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
-- 
1.7.1



