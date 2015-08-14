Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6BF8C766D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 10:55:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2015 03:55:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,677,1432623600"; d="scan'208";a="768726399"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2015 03:55:13 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Aug 2015 13:55:34 +0300
Message-Id: <1b0885ef5ddc0c9caa947f2a444dc83d55591d3c.1439549437.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 15/22] libwnck3: add a recipe from meta-gnome
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
X-List-Received-Date: Fri, 14 Aug 2015 10:55:13 -0000

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


