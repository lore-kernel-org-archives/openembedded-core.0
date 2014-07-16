Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 672147018F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 21:16:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 Jul 2014 14:16:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,673,1400050800"; d="scan'208";a="574300355"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga002.jf.intel.com with ESMTP; 16 Jul 2014 14:16:13 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 14:15:57 +0000
Message-Id: <0638ee88bb8bd469244e77b0961d2f3f2e59f47f.1405520111.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <cover.1405520111.git.dvhart@linux.intel.com>
References: <cover.1405520111.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1405520111.git.dvhart@linux.intel.com>
References: <cover.1405520111.git.dvhart@linux.intel.com>
Subject: [PATCH 1/8] mkefidisk.sh: Use all caps for volume names
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
X-List-Received-Date: Wed, 16 Jul 2014 21:16:17 -0000

Avoid some mkfs warnings by using all caps in the volume names.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/contrib/mkefidisk.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 1992d6c..959307a 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -208,14 +208,14 @@ unmount_device
 echo ""
 echo "Formatting $BOOTFS as vfat..."
 if [ ! "${DEVICE#/dev/loop}" = "${DEVICE}" ]; then
-	mkfs.vfat -I $BOOTFS -n "efi"
+	mkfs.vfat -I $BOOTFS -n "EFI"
 else
-	mkfs.vfat $BOOTFS -n "efi"
+	mkfs.vfat $BOOTFS -n "EFI"
 
 fi
 
 echo "Formatting $ROOTFS as ext3..."
-mkfs.ext3 $ROOTFS -L "root"
+mkfs.ext3 -F $ROOTFS -L "ROOT"
 
 echo "Formatting swap partition...($SWAP)"
 mkswap $SWAP
-- 
2.0.0


