Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0EA076612C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 12:03:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Nov 2015 04:03:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,312,1444719600"; d="scan'208";a="853800114"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 18 Nov 2015 04:03:44 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 14:07:05 +0200
Message-Id: <ba3dce9cd1cb3bd1558a6f13a77f7efe86747b88.1447847724.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <25d92033bc37e480de35f031f12e0515fc942068.1447847724.git.jussi.kukkonen@intel.com>
References: <25d92033bc37e480de35f031f12e0515fc942068.1447847724.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447847724.git.jussi.kukkonen@intel.com>
References: <cover.1447847724.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/2] runqemu-internal: Replace wacom-tablet with tablet for usbdevice
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
X-List-Received-Date: Wed, 18 Nov 2015 12:03:45 -0000

From: Khem Raj <raj.khem@gmail.com>

When booting weston-core-image with latest wayland/weston/libinput
mouse/touchpad would not work on qemux86, this fixes the issue

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 scripts/runqemu-internal | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 3b0e54c..c2787c3 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -119,7 +119,7 @@ ORIG_STTY=$(stty -g)
 if [ "$SLIRP_ENABLED" = "yes" ]; then
     KERNEL_NETWORK_CMD="ip=dhcp"
     QEMU_TAP_CMD=""
-    QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice wacom-tablet"
+    QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice tablet"
     QEMU_NETWORK_CMD=""
     DROOT="/dev/vda"
     ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio,format=raw"
@@ -268,7 +268,7 @@ else
         ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio,format=raw"
 
         KERNCMDLINE="mem=$QEMU_MEMORY"
-        QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice wacom-tablet"
+        QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice tablet"
 
         NFS_INSTANCE=`echo $TAP | sed 's/tap//'`
         export NFS_INSTANCE
-- 
2.1.4


