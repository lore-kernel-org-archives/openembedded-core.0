Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 312CE758DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 12:36:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 18 Jun 2015 05:36:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,638,1427785200"; d="scan'208";a="745804210"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2015 05:36:08 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jun 2015 15:35:53 +0300
Message-Id: <64b6c4ca00ff1ce353ae957722f1b7b1a95ad1a5.1434630758.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <6ef0af09f1d738f8f447f286ccefb0b74c4511de.1434630758.git.alexander.kanavin@linux.intel.com>
References: <6ef0af09f1d738f8f447f286ccefb0b74c4511de.1434630758.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1434630758.git.alexander.kanavin@linux.intel.com>
References: <cover.1434630758.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 15/21] libwnck3: add a recipe from meta-gnome
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
X-List-Received-Date: Thu, 18 Jun 2015 12:36:08 -0000

libwnck is a dependency of epiphany

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb

diff --git a/meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb b/meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb
new file mode 100644
index 0000000..6bc625a
--- /dev/null
+++ b/meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Window navigation construction toolkit"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
+
+BPN = "libwnck"
+
+SECTION = "x11/libs"
+DEPENDS = "gobject-introspection-stub gtk+3 gdk-pixbuf-native libxres"
+
+PR = "r1"
+
+PACKAGECONFIG ??= "startup-notification"
+PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
+
+inherit gnomebase
+SRC_URI[archive.md5sum] = "4538672e0d775fadedf10abeb8020047"
+SRC_URI[archive.sha256sum] = "f5080076346609b4c36394b879f3a86b92ced3b90a37cb54c8e9a14f00e7921c"
-- 
2.1.4


