Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QlbmO-0000lQ-6P
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 09:10:15 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Jul 2011 00:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,267,1309762800"; d="scan'208";a="31983683"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.157])
	by orsmga001.jf.intel.com with ESMTP; 26 Jul 2011 00:05:37 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org,
	sgw@linux.intel.com
Date: Tue, 26 Jul 2011 15:12:58 +0800
Message-Id: <2aed395afe3732615610806e513d991aeef6f9d5.1311664242.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311664242.git.ke.yu@intel.com>
References: <cover.1311664242.git.ke.yu@intel.com>
In-Reply-To: <cover.1311664242.git.ke.yu@intel.com>
References: <cover.1311664242.git.ke.yu@intel.com>
Subject: [PATCH 1/1] upstream status: add for libsdl and xserver patches
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
X-List-Received-Date: Tue, 26 Jul 2011 07:10:15 -0000

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../libsdl/files/directfb_obsolete_calls.patch     |    2 ++
 .../recipes-graphics/libsdl/files/extra-keys.patch |    2 ++
 .../libsdl/files/kernel-asm-page.patch             |    2 ++
 meta/recipes-graphics/mesa/mesa-dri/uclibc.patch   |    2 ++
 .../xorg-xserver/files/macro_tweak.patch           |    2 ++
 .../xserver-kdrive/fbdev_xrandr_ioctl.patch        |    2 ++
 6 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/files/directfb_obsolete_calls.patch b/meta/recipes-graphics/libsdl/files/directfb_obsolete_calls.patch
index f3f422c..3c526a6 100644
--- a/meta/recipes-graphics/libsdl/files/directfb_obsolete_calls.patch
+++ b/meta/recipes-graphics/libsdl/files/directfb_obsolete_calls.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- tmp/work/armv5te-angstrom-linux-gnueabi/libsdl-directfb-1.2.9-r1/SDL-1.2.9/src/video/directfb/SDL_DirectFB_video.c	2007-02-18 11:40:38.000000000 -0500
 +++ SDL/src/video/directfb/SDL_DirectFB_video.c	2007-02-18 11:00:07.000000000 -0500
 @@ -376,7 +376,7 @@
diff --git a/meta/recipes-graphics/libsdl/files/extra-keys.patch b/meta/recipes-graphics/libsdl/files/extra-keys.patch
index f12f0c7..745b04e 100644
--- a/meta/recipes-graphics/libsdl/files/extra-keys.patch
+++ b/meta/recipes-graphics/libsdl/files/extra-keys.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -upr --exclude=configure --exclude=Makefile --exclude=Makefile.in libsdl1.2-1.2.4/include/SDL_keysym.h libsdl1.2-1.2.4-arm/include/SDL_keysym.h
 --- libsdl1.2-1.2.4/include/SDL_keysym.h	2002-03-06 11:23:01.000000000 +0000
 +++ libsdl1.2-1.2.4-arm/include/SDL_keysym.h	2002-11-08 20:43:09.000000000 +0000
diff --git a/meta/recipes-graphics/libsdl/files/kernel-asm-page.patch b/meta/recipes-graphics/libsdl/files/kernel-asm-page.patch
index 42bcead..e698167 100644
--- a/meta/recipes-graphics/libsdl/files/kernel-asm-page.patch
+++ b/meta/recipes-graphics/libsdl/files/kernel-asm-page.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff --git a/src/video/Xext/Xxf86dga/XF86DGA.c b/src/video/Xext/Xxf86dga/XF86DGA.c
 index 4e3d662..de38a3c 100644
 --- a/src/video/Xext/Xxf86dga/XF86DGA.c
diff --git a/meta/recipes-graphics/mesa/mesa-dri/uclibc.patch b/meta/recipes-graphics/mesa/mesa-dri/uclibc.patch
index bb5af44..49d0234 100644
--- a/meta/recipes-graphics/mesa/mesa-dri/uclibc.patch
+++ b/meta/recipes-graphics/mesa/mesa-dri/uclibc.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: Mesa-7.10.2/src/mesa/main/imports.c
 ===================================================================
 --- Mesa-7.10.2.orig/src/mesa/main/imports.c	2011-03-01 12:57:29.000000000 -0800
diff --git a/meta/recipes-graphics/xorg-xserver/files/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/files/macro_tweak.patch
index 6998adf..c4af228 100644
--- a/meta/recipes-graphics/xorg-xserver/files/macro_tweak.patch
+++ b/meta/recipes-graphics/xorg-xserver/files/macro_tweak.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: xorg-server-1.5.0/xorg-server.m4
 ===================================================================
 --- xorg-server-1.5.0.orig/xorg-server.m4	2007-05-29 20:36:51.000000000 +0100
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive/fbdev_xrandr_ioctl.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive/fbdev_xrandr_ioctl.patch
index a5c22a5..07348dc 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive/fbdev_xrandr_ioctl.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive/fbdev_xrandr_ioctl.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: xorg-server-1.3.0.0/hw/kdrive/fbdev/fbdev.c
 ===================================================================
 --- xorg-server-1.3.0.0.orig/hw/kdrive/fbdev/fbdev.c	2008-09-25 21:55:12.000000000 +0100
-- 
1.7.0.4



