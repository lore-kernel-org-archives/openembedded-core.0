Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QKkcz-0001t9-5U
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 07:09:29 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2011 22:06:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,362,1301900400"; 
   d="scan'208";a="1664268"
Received: from unknown (HELO localhost) ([10.255.12.88])
	by fmsmga001.fm.intel.com with ESMTP; 12 May 2011 22:06:40 -0700
Message-Id: <6c49b8e881bc811386c5f1ebac95829d44ad9bb3.1305263078.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305263078.git.sgw@linux.intel.com>
References: <cover.1305263078.git.sgw@linux.intel.com>
Old-Date: Wed, 27 Apr 2011 14:53:51 +0800
Date: Thu, 12 May 2011 22:06:39 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Ilya Yanok <yanok@emcraft.com>, Jingdong Lu <jingdong.lu@windriver.com>
Subject: [PATCH 2/8] recipes: Add Upstream-Status for multiple recipes
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
X-List-Received-Date: Fri, 13 May 2011 05:09:29 -0000

From: Yu Ke <ke.yu@intel.com>

iputils: update patch Upstream-Status
mktemp: update patch Upstream-Status
xinetd: update Upstream-Status
libdrm: update patch Upstream-Status
qemugl: update patch Upstream-Status
x11-common: update patch Upstream-Status
xorg-app: update patch Upstream-Status
xorg-driver: update patch Upstream-Status

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../files/debian/add-icmp-return-codes.diff        |    2 ++
 .../iputils/files/debian/fix-arping-timeouts.diff  |    2 ++
 .../files/debian/fix-dead-host-ping-stats.diff     |    2 ++
 .../iputils/files/debian/targets.diff              |    2 ++
 .../iputils/files/debian/use_gethostbyname2.diff   |    2 ++
 .../mktemp/files/disable-strip.patch               |    2 ++
 ...vices-from-inetd.conf-if-a-service-with-t.patch |    2 ++
 ...arious-fixes-from-the-previous-maintainer.patch |    2 ++
 ...uld-be-able-to-listen-on-IPv6-even-in-ine.patch |    2 ++
 .../drm/libdrm-2.4.25/installtests.patch           |    2 +-
 .../mesa/qemugl/remove-x11r6-lib-dir.patch         |    2 ++
 meta/recipes-graphics/mesa/qemugl/versionfix.patch |    2 ++
 .../x11-common/x11-common/gplv2-license.patch      |    2 ++
 .../xserver-nodm-init/gplv2-license.patch          |    2 ++
 .../xorg-app/xdpyinfo/disable-xkb.patch            |    2 ++
 .../xorg-app/xset/disable-xkb.patch                |    2 ++
 .../xf86-video-omapfb/omap-blacklist-tv-out.patch  |    4 +++-
 .../xf86-video-omapfb/omap-force-plain-mode.patch  |    2 ++
 .../omap-revert-set-CRTC-limit.patch               |    2 ++
 .../omap-revert-set-virtual-size.patch             |    2 ++
 .../xorg-driver/xf86-video-omapfb/omapfb-neon.diff |    2 ++
 21 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/iputils/files/debian/add-icmp-return-codes.diff b/meta/recipes-extended/iputils/files/debian/add-icmp-return-codes.diff
index 86bbf0d..40070c3 100644
--- a/meta/recipes-extended/iputils/files/debian/add-icmp-return-codes.diff
+++ b/meta/recipes-extended/iputils/files/debian/add-icmp-return-codes.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Pending [from other distro Debian]
+
 Index: trunk/ping.c
 ===================================================================
 --- trunk.orig/ping.c	2010-05-07 23:13:54.000000000 -0700
diff --git a/meta/recipes-extended/iputils/files/debian/fix-arping-timeouts.diff b/meta/recipes-extended/iputils/files/debian/fix-arping-timeouts.diff
index 9f05769..3e34788 100644
--- a/meta/recipes-extended/iputils/files/debian/fix-arping-timeouts.diff
+++ b/meta/recipes-extended/iputils/files/debian/fix-arping-timeouts.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Pending [from other distro Debian]
+
 Index: trunk/arping.c
 ===================================================================
 --- trunk.orig/arping.c	2010-05-07 23:13:52.000000000 -0700
diff --git a/meta/recipes-extended/iputils/files/debian/fix-dead-host-ping-stats.diff b/meta/recipes-extended/iputils/files/debian/fix-dead-host-ping-stats.diff
index 2a92425..fda42bf 100644
--- a/meta/recipes-extended/iputils/files/debian/fix-dead-host-ping-stats.diff
+++ b/meta/recipes-extended/iputils/files/debian/fix-dead-host-ping-stats.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Pending [from other distro Debian]
+
 Index: trunk/ping_common.c
 ===================================================================
 --- trunk.orig/ping_common.c	2010-05-07 23:13:51.000000000 -0700
diff --git a/meta/recipes-extended/iputils/files/debian/targets.diff b/meta/recipes-extended/iputils/files/debian/targets.diff
index b5e907a..6b899cb 100644
--- a/meta/recipes-extended/iputils/files/debian/targets.diff
+++ b/meta/recipes-extended/iputils/files/debian/targets.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [disable feature]
+
 Index: trunk/Makefile
 ===================================================================
 --- trunk.orig/Makefile	2010-05-07 23:43:00.000000000 -0700
diff --git a/meta/recipes-extended/iputils/files/debian/use_gethostbyname2.diff b/meta/recipes-extended/iputils/files/debian/use_gethostbyname2.diff
index 7e6c97c..1d01e15 100644
--- a/meta/recipes-extended/iputils/files/debian/use_gethostbyname2.diff
+++ b/meta/recipes-extended/iputils/files/debian/use_gethostbyname2.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Pending [from other distro Debian]
+
 Index: trunk/tracepath.c
 ===================================================================
 --- trunk.orig/tracepath.c	2010-05-07 23:13:52.000000000 -0700
diff --git a/meta/recipes-extended/mktemp/files/disable-strip.patch b/meta/recipes-extended/mktemp/files/disable-strip.patch
index d6bc528..e06869e 100644
--- a/meta/recipes-extended/mktemp/files/disable-strip.patch
+++ b/meta/recipes-extended/mktemp/files/disable-strip.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff --git a/Makefile.in b/Makefile.in
 index 37b3cc9..f1026f3 100644
 --- a/Makefile.in
diff --git a/meta/recipes-extended/xinetd/xinetd/Disable-services-from-inetd.conf-if-a-service-with-t.patch b/meta/recipes-extended/xinetd/xinetd/Disable-services-from-inetd.conf-if-a-service-with-t.patch
index 8602a88..cd6e6c1 100644
--- a/meta/recipes-extended/xinetd/xinetd/Disable-services-from-inetd.conf-if-a-service-with-t.patch
+++ b/meta/recipes-extended/xinetd/xinetd/Disable-services-from-inetd.conf-if-a-service-with-t.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending [from other distro Debian]
+
 From d588b6530e1382a624898b3f4307f636c72c80a9 Mon Sep 17 00:00:00 2001
 From: Pierre Habouzit <madcoder@debian.org>
 Date: Wed, 28 Nov 2007 10:13:08 +0100
diff --git a/meta/recipes-extended/xinetd/xinetd/Various-fixes-from-the-previous-maintainer.patch b/meta/recipes-extended/xinetd/xinetd/Various-fixes-from-the-previous-maintainer.patch
index d243692..8e59cdc 100644
--- a/meta/recipes-extended/xinetd/xinetd/Various-fixes-from-the-previous-maintainer.patch
+++ b/meta/recipes-extended/xinetd/xinetd/Various-fixes-from-the-previous-maintainer.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending [from other distro Debian]
+
 From a3410b0bc81ab03a889d9ffc14e351badf8372f1 Mon Sep 17 00:00:00 2001
 From: Pierre Habouzit <madcoder@debian.org>
 Date: Mon, 26 Nov 2007 16:02:04 +0100
diff --git a/meta/recipes-extended/xinetd/xinetd/xinetd-should-be-able-to-listen-on-IPv6-even-in-ine.patch b/meta/recipes-extended/xinetd/xinetd/xinetd-should-be-able-to-listen-on-IPv6-even-in-ine.patch
index 2b76fe3..2365ca1 100644
--- a/meta/recipes-extended/xinetd/xinetd/xinetd-should-be-able-to-listen-on-IPv6-even-in-ine.patch
+++ b/meta/recipes-extended/xinetd/xinetd/xinetd-should-be-able-to-listen-on-IPv6-even-in-ine.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending [from other distro Debian]
+
 From f44b218ccc779ab3f4aed072390ccf129d94b58d Mon Sep 17 00:00:00 2001
 From: David Madore <david@pleiades.stars>
 Date: Mon, 24 Mar 2008 12:45:36 +0100
diff --git a/meta/recipes-graphics/drm/libdrm-2.4.25/installtests.patch b/meta/recipes-graphics/drm/libdrm-2.4.25/installtests.patch
index 2704ee6..1f39719 100644
--- a/meta/recipes-graphics/drm/libdrm-2.4.25/installtests.patch
+++ b/meta/recipes-graphics/drm/libdrm-2.4.25/installtests.patch
@@ -1,6 +1,6 @@
 tests: also install tests app
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Yu Ke <ke.yu@intel.com>
 
diff --git a/meta/recipes-graphics/mesa/qemugl/remove-x11r6-lib-dir.patch b/meta/recipes-graphics/mesa/qemugl/remove-x11r6-lib-dir.patch
index d14ce89..d24d045 100644
--- a/meta/recipes-graphics/mesa/qemugl/remove-x11r6-lib-dir.patch
+++ b/meta/recipes-graphics/mesa/qemugl/remove-x11r6-lib-dir.patch
@@ -2,6 +2,8 @@ Remove X11R6 lib directory
 
 "-L/usr/X11R6/lib" is obsolate in poky. Poky currently use Xserver from X.org (X11R7.x), which puts lib in standard /usr/lib, so no need to specify the extra -L/usr/X11R6/lib. Meanwhile, the -L/usr/X11R6/lib will cause warning: library search path "/usr/X11R6/lib" is unsafe for cross-compilation. so better to remove it.
 
+Upstream-Status: Pending
+
 Signed-off-by: Yu Ke <ke.yu@intel.com>
 
 diff --git a/Makefile b/Makefile
diff --git a/meta/recipes-graphics/mesa/qemugl/versionfix.patch b/meta/recipes-graphics/mesa/qemugl/versionfix.patch
index a3d33e8..614b816 100644
--- a/meta/recipes-graphics/mesa/qemugl/versionfix.patch
+++ b/meta/recipes-graphics/mesa/qemugl/versionfix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: git/Makefile
 ===================================================================
 --- git.orig/Makefile	2009-01-19 23:37:36.000000000 +0000
diff --git a/meta/recipes-graphics/x11-common/x11-common/gplv2-license.patch b/meta/recipes-graphics/x11-common/x11-common/gplv2-license.patch
index ec93253..eff975e 100644
--- a/meta/recipes-graphics/x11-common/x11-common/gplv2-license.patch
+++ b/meta/recipes-graphics/x11-common/x11-common/gplv2-license.patch
@@ -4,6 +4,8 @@ this is a local file recipe and the license file is missing.In order
 to pass the license checksum checking, the license file is needed. So
 this patch add the GPLv2 license file.
 
+Upstream-Status: Inappropriate [licensing]
+
 Signed-off-by: Yu Ke <ke.yu@intel.com>
 
 diff --git a/COPYING b/COPYING
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/gplv2-license.patch b/meta/recipes-graphics/x11-common/xserver-nodm-init/gplv2-license.patch
index ec93253..eff975e 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/gplv2-license.patch
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/gplv2-license.patch
@@ -4,6 +4,8 @@ this is a local file recipe and the license file is missing.In order
 to pass the license checksum checking, the license file is needed. So
 this patch add the GPLv2 license file.
 
+Upstream-Status: Inappropriate [licensing]
+
 Signed-off-by: Yu Ke <ke.yu@intel.com>
 
 diff --git a/COPYING b/COPYING
diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo/disable-xkb.patch b/meta/recipes-graphics/xorg-app/xdpyinfo/disable-xkb.patch
index 24af21f..b10143d 100644
--- a/meta/recipes-graphics/xorg-app/xdpyinfo/disable-xkb.patch
+++ b/meta/recipes-graphics/xorg-app/xdpyinfo/disable-xkb.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- xdpyinfo-1.0.1/configure.ac.orig	2006-03-08 16:33:05.000000000 +0100
 +++ xdpyinfo-1.0.1/configure.ac	2006-03-08 16:41:59.000000000 +0100
 @@ -45,11 +45,15 @@
diff --git a/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch b/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch
index 2e728cf..97d13a3 100644
--- a/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch
+++ b/meta/recipes-graphics/xorg-app/xset/disable-xkb.patch
@@ -1,5 +1,7 @@
 add "-disable-xkb" option
 
+Upstream-Status: Pending
+
 Rebase for 1.2.1 by: Yu Ke <ke.yu@intel.com>
 
 diff --git a/configure.ac b/configure.ac
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/omap-blacklist-tv-out.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/omap-blacklist-tv-out.patch
index 506e174..9b1ee06 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/omap-blacklist-tv-out.patch
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/omap-blacklist-tv-out.patch
@@ -5,7 +5,9 @@ Date:   Wed Jan 26 13:21:12 2011 +0100
     blacklist tv out
 
     The tv-out gets added last and the driver tries to reconfigure dvi to TV resolutions, which fails. so blacklist it
-    
+
+	Upstream-Status: Pending
+
     Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 
 diff --git a/src/omapfb-output-dss.c b/src/omapfb-output-dss.c
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/omap-force-plain-mode.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/omap-force-plain-mode.patch
index 201a8b9..bb298b0 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/omap-force-plain-mode.patch
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/omap-force-plain-mode.patch
@@ -6,6 +6,8 @@ Date:   Wed Jan 26 13:20:20 2011 +0100
 
     The new DSS mode breaks XV, so force plain mode
 
+	Upstream-Status: Pending
+
     Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 
 diff --git a/src/omapfb-driver.c b/src/omapfb-driver.c
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/omap-revert-set-CRTC-limit.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/omap-revert-set-CRTC-limit.patch
index 6a9e905..97bf022 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/omap-revert-set-CRTC-limit.patch
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/omap-revert-set-CRTC-limit.patch
@@ -8,6 +8,8 @@ Date:   Wed Jan 26 12:04:36 2011 +0100
 
     Virtual size too big, revert the commit 9c4d7592dcb7dc20a48a6f941d9d94bd73d34153.
 
+	Upstream-Status: Pending
+
 diff --git a/src/omapfb-crtc.c b/src/omapfb-crtc.c
 index 9aaa52f..cbeff35 100644
 --- a/src/omapfb-crtc.c
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/omap-revert-set-virtual-size.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/omap-revert-set-virtual-size.patch
index a3fd0d5..8a6eef5 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/omap-revert-set-virtual-size.patch
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/omap-revert-set-virtual-size.patch
@@ -8,6 +8,8 @@ Date:   Wed Jan 26 13:27:20 2011 +0100
 
     This reverts commit 2653ef07883fbd1a5e7025f9300cf89b79ba429a.
 
+	Upstream-Status: Pending
+
 diff --git a/src/omapfb-crtc.c b/src/omapfb-crtc.c
 index cbeff35..9655db2 100644
 --- a/src/omapfb-crtc.c
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/omapfb-neon.diff b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/omapfb-neon.diff
index 325ca66..fb3ac8c 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/omapfb-neon.diff
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/omapfb-neon.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- /tmp/image-format-conversions.h	2009-02-03 10:18:04.000000000 +0100
 +++ git/src/image-format-conversions.h	2009-02-03 10:19:18.000000000 +0100
 @@ -30,6 +30,8 @@
-- 
1.7.1.1



