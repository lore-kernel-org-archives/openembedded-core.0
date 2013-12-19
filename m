Return-Path: <valentin.popa@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 6544A60DFD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 14:19:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 19 Dec 2013 06:19:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,512,1384329600"; d="scan'208";a="446990705"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.47])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2013 06:19:29 -0800
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2013 16:20:12 +0200
Message-Id: <1387462812-23194-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] weston: for fbdev enabled distro feature, change WESTON_NATIVE_BACKEND
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
X-List-Received-Date: Thu, 19 Dec 2013 14:19:29 -0000

For builds with fbdev (no drm/kms), set
WESTON_NATIVE_BACKEND to "fbdev-backend.so"; doing this,
weston-launch will be able to know what backend to use.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/recipes-graphics/wayland/weston_1.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.3.1.bb b/meta/recipes-graphics/wayland/weston_1.3.1.bb
index d97f6af..4ab2776 100644
--- a/meta/recipes-graphics/wayland/weston_1.3.1.bb
+++ b/meta/recipes-graphics/wayland/weston_1.3.1.bb
@@ -45,7 +45,7 @@ PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/l
 # Headless Weston
 PACKAGECONFIG[headless] = "--enable-headless-compositor,--disable-headless-compositor"
 # Weston on framebuffer
-PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
+PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 # weston-launch
 PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,libpam"
 # VA-API desktop recorder
-- 
1.8.3.2


