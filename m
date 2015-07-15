Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9E36D6AC95
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 13:17:15 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jul 2015 06:17:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,480,1432623600"; d="scan'208";a="606677323"
Received: from sentry.rb.intel.com ([10.237.105.63])
	by orsmga003.jf.intel.com with ESMTP; 15 Jul 2015 06:17:16 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jul 2015 16:17:01 +0300
Message-Id: <861013e3a73d1c87c6f86b1f28daf4677feaefe4.1436965937.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1436965937.git.cristian.iorga@intel.com>
References: <cover.1436965937.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1436965937.git.cristian.iorga@intel.com>
References: <cover.1436965937.git.cristian.iorga@intel.com>
Subject: [PATCH 2/3] runqemu-internal: add temporary disk interface to qemuarm64
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
X-List-Received-Date: Wed, 15 Jul 2015 13:17:15 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 scripts/runqemu-internal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 6878251..03b40d8 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -270,7 +270,7 @@ else
         if [ "$MACHINE" = "qemuarm64" ]; then
             QEMU_NETWORK_CMD="-netdev tap,id=net0,ifname=$TAP,script=no,downscript=no -device virtio-net-device,netdev=net0 "
             DROOT="/dev/vda"
-            ROOTFS_OPTIONS="-drive id=disk0,file=$ROOTFS,format=raw -device virtio-blk-device,drive=disk0"
+            ROOTFS_OPTIONS="-drive id=disk0,file=$ROOTFS,if=none,format=raw -device virtio-blk-device,drive=disk0"
         fi
 
         KERNCMDLINE="mem=$QEMU_MEMORY"
-- 
2.1.4


