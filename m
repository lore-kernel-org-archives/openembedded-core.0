Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4az-0006h6-Sj
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:46 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:33:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96632982"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:33:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:19 -0800
Message-Id: <9a1996e4251ca66eb982f8aa1534adac04dec592.1326786990.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 34/62] image_types_uboot.bbclass: Add uncompressed ext2 image option
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:46 -0000

From: Matthew McClintock <msm@freescale.com>

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/classes/image_types_uboot.bbclass |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image_types_uboot.bbclass b/meta/classes/image_types_uboot.bbclass
index 65dc91b..8d1081c 100644
--- a/meta/classes/image_types_uboot.bbclass
+++ b/meta/classes/image_types_uboot.bbclass
@@ -5,6 +5,10 @@ oe_mkimage () {
         -d ${DEPLOY_DIR_IMAGE}/$1 ${DEPLOY_DIR_IMAGE}/$1.u-boot
 }
 
+IMAGE_DEPENDS_ext2.u-boot = "genext2fs-native e2fsprogs-native u-boot-mkimage-native"
+IMAGE_CMD_ext2.u-boot      = "${IMAGE_CMD_ext2} \
+                                 oe_mkimage ${IMAGE_NAME}.rootfs.ext2 none"
+
 IMAGE_DEPENDS_ext2.gz.u-boot = "genext2fs-native e2fsprogs-native u-boot-mkimage-native"
 IMAGE_CMD_ext2.gz.u-boot      = "${IMAGE_CMD_ext2.gz} \
                                  oe_mkimage ${IMAGE_NAME}.rootfs.ext2.gz gzip"
@@ -25,4 +29,4 @@ IMAGE_DEPENDS_ext4.gz.u-boot = "genext2fs-native e2fsprogs-native u-boot-mkimage
 IMAGE_CMD_ext4.gz.u-boot      = "${IMAGE_CMD_ext4.gz} \
                                  oe_mkimage ${IMAGE_NAME}.rootfs.ext4.gz gzip"
 
-IMAGE_TYPES += "ext2.gz.u-boot ext2.bz2.u-boot ext2.lzma.u-boot ext3.gz.u-boot ext4.gz.u-boot"
+IMAGE_TYPES += "ext2.u-boot ext2.gz.u-boot ext2.bz2.u-boot ext2.lzma.u-boot ext3.gz.u-boot ext4.gz.u-boot"
-- 
1.7.6.5



