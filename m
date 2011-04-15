Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QAbko-0004j8-Cd
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Apr 2011 07:39:38 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Apr 2011 22:37:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,216,1301900400"; d="scan'208";a="679366892"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.102])
	by fmsmga002.fm.intel.com with ESMTP; 14 Apr 2011 22:37:08 -0700
Message-Id: <1197834cd1cc8cb84bb9f8d5f6fd93fdd7d7a9da.1302846043.git.ke.yu@intel.com>
In-Reply-To: <cover.1302846043.git.ke.yu@intel.com>
References: <cover.1302846043.git.ke.yu@intel.com>
Old-Date: Sat, 9 Apr 2011 21:26:45 +0800
Date: Fri, 15 Apr 2011 13:44:30 +0800
To: openembedded-core@lists.openembedded.org
CC: 
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
X-List-Received-Date: Fri, 15 Apr 2011 05:39:38 -0000

From: Yu Ke <ke.yu@intel.com>

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../distro/include/preferred-xorg-versions.inc     |    2 +-
 .../xorg-driver/xf86-input-mouse/unbreak.patch     |    2 ++
 ...ut-mouse_1.6.0.bb => xf86-input-mouse_1.7.0.bb} |    4 ++--
 3 files changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-mouse_1.6.0.bb => xf86-input-mouse_1.7.0.bb} (76%)

diff --git a/meta/conf/distro/include/preferred-xorg-versions.inc b/meta/conf/distro/include/preferred-xorg-versions.inc
index 1230693..658b2e3 100644
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
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse/unbreak.patch b/meta/recipes-graphics/xorg-driver/xf86-input-mouse/unbreak.patch
index 665b320..6930864 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse/unbreak.patch
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse/unbreak.patch
@@ -2,6 +2,8 @@ Unbreak the linux mouse driver by using config.h
 
 RP - 4/11/07
 
+Upstream-Status: Pending
+
 Index: git/src/lnx_mouse.c
 ===================================================================
 --- git.orig/src/lnx_mouse.c	2008-11-04 23:46:05.000000000 +0000
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



