Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1Q95r8-0005kZ-K4
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Apr 2011 03:23:54 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2011 18:21:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,336,1299484800"; d="scan'208";a="731535991"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.102])
	by orsmga001.jf.intel.com with ESMTP; 10 Apr 2011 18:21:40 -0700
Message-Id: <caa1d55c2151fe2da0a933c89c7fa790900a2059.1302485033.git.ke.yu@intel.com>
In-Reply-To: <cover.1302485033.git.ke.yu@intel.com>
References: <cover.1302485033.git.ke.yu@intel.com>
Old-Date: Sat, 9 Apr 2011 21:26:45 +0800
Date: Mon, 11 Apr 2011  9:28:51 +0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 6/9] xf86-input-mouse: upgrade from 1.6 to 1.7
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
X-List-Received-Date: Mon, 11 Apr 2011 01:23:54 -0000

From: Yu Ke <ke.yu@intel.com>

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../distro/include/preferred-xorg-versions.inc     |    2 +-
 ...ut-mouse_1.6.0.bb => xf86-input-mouse_1.7.0.bb} |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-mouse_1.6.0.bb => xf86-input-mouse_1.7.0.bb} (76%)

diff --git a/meta/conf/distro/include/preferred-xorg-versions.inc b/meta/conf/distro/include/preferred-xorg-versions.inc
index fabc0da..b2d7731 100644
--- a/meta/conf/distro/include/preferred-xorg-versions.inc
+++ b/meta/conf/distro/include/preferred-xorg-versions.inc
@@ -142,7 +142,7 @@ PREFERRED_VERSION_libxcb ?= "1.7"
 PREFERRED_VERSION_libxcb-nativesdk ?= "1.7"
 PREFERRED_VERSION_libpciaccess ?= "0.12.0"
 PREFERRED_VERSION_xf86-input-evdev ?= "2.6.0"
-PREFERRED_VERSION_xf86-input-mouse ?= "1.6.0"
+PREFERRED_VERSION_xf86-input-mouse ?= "1.7.0"
 PREFERRED_VERSION_xf86-input-keyboard ?= "1.5.0"
 PREFERRED_VERSION_xf86-input-synaptics ?= "1.4.0"
 PREFERRED_VERSION_xf86-video-intel ?= "2.14.0"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.6.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.0.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.6.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.0.bb
index 61d73e1..fbc2c66 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.6.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.0.bb
@@ -10,5 +10,5 @@ driver."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=237eb1d1a602d29ef2af62d8fba60f19"
 
-SRC_URI[md5sum] = "cef849b1a2743d2e84de98422f372974"
-SRC_URI[sha256sum] = "c7ae245e5168276346145f196d1d1faed618f41d5174a2031c71fab6e1a2fbdb"
+SRC_URI[md5sum] = "7f31472689c15b6de62eff04d0fb57d7"
+SRC_URI[sha256sum] = "4e989542b5e9e0c5f9087288b18e70de1064dd27c83a4bc6dce58f3ea9d74994"
-- 
1.7.0.4



