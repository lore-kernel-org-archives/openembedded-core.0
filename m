Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C397F758DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 12:35:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 18 Jun 2015 05:35:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,638,1427785200"; d="scan'208";a="745804074"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2015 05:35:55 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jun 2015 15:35:43 +0300
Message-Id: <11c3038e3bc2ac37c313f1a101a95291a873de02.1434630758.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <6ef0af09f1d738f8f447f286ccefb0b74c4511de.1434630758.git.alexander.kanavin@linux.intel.com>
References: <6ef0af09f1d738f8f447f286ccefb0b74c4511de.1434630758.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1434630758.git.alexander.kanavin@linux.intel.com>
References: <cover.1434630758.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 05/21] libnotify: update to version 0.7.6
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
X-List-Received-Date: Thu, 18 Jun 2015 12:35:54 -0000

New webkit requires at least version 0.7

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/libnotify/libnotify_0.6.0.bb | 21 ---------------------
 meta/recipes-gnome/libnotify/libnotify_0.7.6.bb | 12 ++++++++++++
 2 files changed, 12 insertions(+), 21 deletions(-)
 delete mode 100644 meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
 create mode 100644 meta/recipes-gnome/libnotify/libnotify_0.7.6.bb

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb b/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
deleted file mode 100644
index e6ee89b..0000000
--- a/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Library for sending desktop notifications to a notification daemon"
-SECTION = "libs"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-
-PR = "r1"
-
-DEPENDS = "dbus gtk+ dbus-glib"
-
-inherit gnomebase distro_features_check
-
-# Requires gdk/gdkx.h which is provided by gtk when x11 in DISTRO_FEATURES
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI[archive.md5sum] = "732c9d2cd5eb6a9069264a319d330516"
-SRC_URI[archive.sha256sum] = "73b16a79bb2fed62dcf146b11c4405776cb96a09dce66379ca541da7dbd64210"
-
-do_configure_prepend() {
-    sed -i /GTK3/d ${S}/configure.ac
-    sed -i -e /test-gtk3/d -e 's/test-xy-stress \\/test-xy-stress/' ${S}/tests/Makefile.am
-}
diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
new file mode 100644
index 0000000..5d7b4ce
--- /dev/null
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Library for sending desktop notifications to a notification daemon"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+DEPENDS = "dbus gtk+3 dbus-glib"
+
+inherit gnomebase distro_features_check gtk-doc
+
+SRC_URI[archive.md5sum] = "a4997019d08f46f3bf57b78e6f795a59"
+SRC_URI[archive.sha256sum] = "0ef61ca400d30e28217979bfa0e73a7406b19c32dd76150654ec5b2bdf47d837"
+
-- 
2.1.4


