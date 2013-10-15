Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C28006D169
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 12:46:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Oct 2013 05:46:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,498,1378882800"; d="scan'208";a="417091238"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 15 Oct 2013 05:46:21 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2013 15:46:07 +0300
Message-Id: <d74fa6f783fce2dc14e140a831f6d6b418caca2c.1381841061.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1381841061.git.laurentiu.palcu@intel.com>
References: <cover.1381841061.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1381841061.git.laurentiu.palcu@intel.com>
References: <cover.1381841061.git.laurentiu.palcu@intel.com>
Subject: [PATCH 10/10] xf86-video-fbdev: upgrade to 0.4.4
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
X-List-Received-Date: Tue, 15 Oct 2013 12:46:21 -0000

Removed the following backported patch(es):
 * Remove-mibstore.h.patch

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xf86-video-fbdev/Remove-mibstore.h.patch       |   35 --------------------
 ...eo-fbdev_0.4.3.bb => xf86-video-fbdev_0.4.4.bb} |    6 ++--
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-fbdev/Remove-mibstore.h.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-fbdev_0.4.3.bb => xf86-video-fbdev_0.4.4.bb} (44%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-fbdev/Remove-mibstore.h.patch b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev/Remove-mibstore.h.patch
deleted file mode 100644
index 225ff01..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-fbdev/Remove-mibstore.h.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Backported
-
-From ac293412a01d87f87eb61f4adb9db7486a75d3fc Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Tue, 25 Sep 2012 08:54:37 -0400
-Subject: [PATCH] Remove mibstore.h
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
----
- src/fbdev.c |    2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/src/fbdev.c b/src/fbdev.c
-index cd7ebc5..f5a7378 100644
---- a/src/fbdev.c
-+++ b/src/fbdev.c
-@@ -14,7 +14,6 @@
- #include "xf86_OSproc.h"
- 
- #include "mipointer.h"
--#include "mibstore.h"
- #include "micmap.h"
- #include "colormapst.h"
- #include "xf86cmap.h"
-@@ -845,7 +844,6 @@ FBDevScreenInit(SCREEN_INIT_ARGS_DECL)
- 	}
- 
- 	xf86SetBlackWhitePixels(pScreen);
--	miInitializeBackingStore(pScreen);
- 	xf86SetBackingStore(pScreen);
- 
- 	/* software cursor */
--- 
-1.7.9.5
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.3.bb b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.4.bb
similarity index 44%
rename from meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.3.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.4.bb
index 51c5144..5d33854 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.3.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.4.bb
@@ -2,9 +2,7 @@ require xorg-driver-video.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
 
 DESCRIPTION = "X.Org X server -- fbdev display driver"
-PR = "${INC_PR}.0"
 
-SRC_URI += "file://Remove-mibstore.h.patch"
 
-SRC_URI[md5sum] = "1d99f1dfb3f0fea077b6b61caa3dc85a"
-SRC_URI[sha256sum] = "ff7b037ad110040a4e2db5c84e9741125dbbaf3a08107db47760f3e11f9c4831"
+SRC_URI[md5sum] = "3931c0e19d441cc576dc088f9eb9fd73"
+SRC_URI[sha256sum] = "9dd4b326498223abbfdf786089a46ea3db4fa6bbd341308eb48a9e00bc3fd51b"
-- 
1.7.9.5


