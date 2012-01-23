Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RpOrL-0004vA-Sc
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 19:43:16 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Jan 2012 10:34:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="59212142"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.82])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Jan 2012 10:34:30 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 10:34:06 -0800
Message-Id: <bf9b76444fdc8cdff2d4ff059f2d6c0c15beb828.1327343524.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
Subject: [PATCH v2 01/21] Fix Upstream-Status entries
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
X-List-Received-Date: Mon, 23 Jan 2012 18:43:16 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../busybox-1.19.3/busybox-1.19.3-getty.patch      |    2 +-
 .../libtool/libtool/fix-rpath.patch                |    2 +-
 .../qemu/qemu-0.14.0/arm-bgr.patch                 |    2 +-
 .../qemu/qemu-0.15.1/arm-bgr.patch                 |    2 +-
 .../libzypp/libzypp/libzypp-compatargs.patch       |    2 +-
 .../error-address-work-around.patch                |    2 ++
 ...-t-let-systemd-unit-restore-the-volume-wh.patch |    2 +-
 .../dprintf_conflict_with_eglibc.patch             |    2 ++
 .../shared-mime-info/parallelmake.patch            |    2 +-
 9 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-1.19.3/busybox-1.19.3-getty.patch b/meta/recipes-core/busybox/busybox-1.19.3/busybox-1.19.3-getty.patch
index 137d095..0578d78 100644
--- a/meta/recipes-core/busybox/busybox-1.19.3/busybox-1.19.3-getty.patch
+++ b/meta/recipes-core/busybox/busybox-1.19.3/busybox-1.19.3-getty.patch
@@ -1,4 +1,4 @@
-Upstream-status: Backport
+Upstream-Status: Backport
 
 Patch is taken from upstream 
 http://busybox.net/downloads/fixes-1.19.3/busybox-1.19.3-getty.patch
diff --git a/meta/recipes-devtools/libtool/libtool/fix-rpath.patch b/meta/recipes-devtools/libtool/libtool/fix-rpath.patch
index d35bac0..1571178 100644
--- a/meta/recipes-devtools/libtool/libtool/fix-rpath.patch
+++ b/meta/recipes-devtools/libtool/libtool/fix-rpath.patch
@@ -4,7 +4,7 @@ filters libtools list and removes the ones we don't need.
 
 RP 23/9/2011
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
 ===================================================================
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/arm-bgr.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/arm-bgr.patch
index 3b460d0..a8fe65a 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/arm-bgr.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/arm-bgr.patch
@@ -9,7 +9,7 @@ doesn't support the BGR bit.
 
 RP 16/9/2011
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Index: qemu-0.14.0/hw/pl110.c
 ===================================================================
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/arm-bgr.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/arm-bgr.patch
index 3b460d0..a8fe65a 100644
--- a/meta/recipes-devtools/qemu/qemu-0.15.1/arm-bgr.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.15.1/arm-bgr.patch
@@ -9,7 +9,7 @@ doesn't support the BGR bit.
 
 RP 16/9/2011
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Index: qemu-0.14.0/hw/pl110.c
 ===================================================================
diff --git a/meta/recipes-extended/libzypp/libzypp/libzypp-compatargs.patch b/meta/recipes-extended/libzypp/libzypp/libzypp-compatargs.patch
index 9cd7a36..8d24ab0 100644
--- a/meta/recipes-extended/libzypp/libzypp/libzypp-compatargs.patch
+++ b/meta/recipes-extended/libzypp/libzypp/libzypp-compatargs.patch
@@ -1,6 +1,6 @@
 zypp/Arch.cc: Add room for additional architecture compatibilities
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Increase the size of the compatibility table from 9 to 30.  There are already
 existing checks within libzypp to ensure that we don't overflow the 64-bit
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/error-address-work-around.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/error-address-work-around.patch
index 3052372..98a946a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/error-address-work-around.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/error-address-work-around.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate
+
 diff -ur --exclude='*.lo' --exclude='config*' --exclude='Make*' --exclude='ac*' xorg-server-1.7.99.2.ORIG/dix/window.c xorg-server-1.7.99.2/dix/window.c
 --- xorg-server-1.7.99.2.ORIG/dix/window.c	2012-01-04 13:12:40.417640130 -0700
 +++ xorg-server-1.7.99.2/dix/window.c	2012-01-04 12:13:20.678605493 -0700
diff --git a/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch b/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
index 334c94e..55e180a 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
+++ b/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
@@ -10,7 +10,7 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 
 Filed as https://bugtrack.alsa-project.org/alsa-bug/view.php?id=5459
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
  alsactl/Makefile.am             |    2 +-
  alsactl/alsa-restore.service.in |    1 +
diff --git a/meta/recipes-support/libsoup/libsoup-2.2.105/dprintf_conflict_with_eglibc.patch b/meta/recipes-support/libsoup/libsoup-2.2.105/dprintf_conflict_with_eglibc.patch
index ad13bbd..79e2ab8 100644
--- a/meta/recipes-support/libsoup/libsoup-2.2.105/dprintf_conflict_with_eglibc.patch
+++ b/meta/recipes-support/libsoup/libsoup-2.2.105/dprintf_conflict_with_eglibc.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -rupN libsoup-2.2.105/tests/auth-test.c libsoup-2.2.105.new//tests/auth-test.c
 --- libsoup-2.2.105/tests/auth-test.c	2007-12-05 00:13:27.000000000 +0200
 +++ libsoup-2.2.105.new//tests/auth-test.c	2012-01-16 20:12:09.000000000 +0200
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch b/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch
index 9e86a71..8b6f9e5 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch
@@ -8,7 +8,7 @@ dependencies and stop itself racing itself.
 
 RP 10/10/2011
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Index: shared-mime-info-0.91/Makefile.am
 ===================================================================
-- 
1.7.6.5



