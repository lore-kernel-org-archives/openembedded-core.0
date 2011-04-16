Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzRt-0006Ih-2q
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:57:41 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Apr 2011 23:55:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="420320212"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by azsmga001.ch.intel.com with ESMTP; 15 Apr 2011 23:55:13 -0700
Message-Id: <bbe5b42d7cb314a30ac35e19db1478475eb53aa5.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Sat, 9 Apr 2011 21:26:45 +0800
Date: Fri, 15 Apr 2011 23:55:12 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 41/58] xf86-input-mouse: upgrade from 1.6 to 1.7
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
X-List-Received-Date: Sat, 16 Apr 2011 06:57:41 -0000

From: Yu Ke <ke.yu@intel.com>

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../distro/include/preferred-xorg-versions.inc     |    2 +-
 .../xorg-driver/xf86-input-mouse/unbreak.patch     |    2 ++
 ...ut-mouse_1.6.0.bb => xf86-input-mouse_1.7.0.bb} |    4 ++--
 3 files changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-mouse_1.6.0.bb => xf86-input-mouse_1.7.0.bb} (76%)

diff --git a/meta/conf/distro/include/preferred-xorg-versions.inc b/meta/conf/distro/include/preferred-xorg-versions.inc
index 109491f..23eaace 100644
--- a/meta/conf/distro/include/preferred-xorg-versions.inc
+++ b/meta/conf/distro/include/preferred-xorg-versions.inc
@@ -142,7 +142,7 @@ PREFERRED_VERSION_libxcb ?= "1.7"
 PREFERRED_VERSION_libxcb-nativesdk ?= "1.7"
 PREFERRED_VERSION_libpciaccess ?= "0.12.1"
 PREFERRED_VERSION_xf86-input-evdev ?= "2.6.0"
-PREFERRED_VERSION_xf86-input-mouse ?= "1.6.0"
+PREFERRED_VERSION_xf86-input-mouse ?= "1.7.0"
 PREFERRED_VERSION_xf86-input-keyboard ?= "1.6.0"
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
1.7.1.1



