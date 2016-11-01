Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8217A71A23
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 15:27:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 01 Nov 2016 08:27:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,580,1473145200"; d="scan'208";a="780876213"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Nov 2016 08:27:58 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 17:25:15 +0200
Message-Id: <92f01e2216e1e9ad1d38222ca6977442bd4d6512.1478013702.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/13] libwnck3: remove the recipe
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
X-List-Received-Date: Tue, 01 Nov 2016 15:27:56 -0000

Nothing requires it in oe-core now, so it will be re-added to meta-openembedded.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb

diff --git a/meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb b/meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb
deleted file mode 100644
index fd4ef69..0000000
--- a/meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Window navigation construction toolkit"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-
-BPN = "libwnck"
-
-SECTION = "x11/libs"
-DEPENDS = "intltool-native gtk+3 gdk-pixbuf-native libxres"
-
-PACKAGECONFIG ??= "startup-notification"
-PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
-
-inherit gnomebase gobject-introspection gtk-doc
-SRC_URI[archive.md5sum] = "487938d65d4bfae1f2501052b1bd7492"
-SRC_URI[archive.sha256sum] = "1cb03716bc477058dfdf3ebfa4f534de3b13b1aa067fcd064d0b7813291cba72"
-
-inherit distro_features_check
-# libxres means x11 only
-REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.10.1


