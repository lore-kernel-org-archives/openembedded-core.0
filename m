Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvcUK-0006yL-UX
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 23:56:57 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2011 14:52:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,265,1312182000"; d="scan'208";a="43970263"
Received: from unknown (HELO swold-MOBL.lan) ([10.255.13.234])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2011 14:52:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2011 14:51:52 -0700
Message-Id: <53ef871661eb03a5c23c49a180a80fd131fbb17e.1314043945.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/19] image_types_uboot: add uboot mkimage fs types
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
X-List-Received-Date: Mon, 22 Aug 2011 21:56:57 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/image_types_uboot.bbclass |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/image_types_uboot.bbclass

diff --git a/meta/classes/image_types_uboot.bbclass b/meta/classes/image_types_uboot.bbclass
new file mode 100644
index 0000000..f08ad8d
--- /dev/null
+++ b/meta/classes/image_types_uboot.bbclass
@@ -0,0 +1,21 @@
+oe_mkimage () {
+    mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C gzip -n ${IMAGE_NAME} \
+        -d ${DEPLOY_DIR_IMAGE}/$1 ${DEPLOY_DIR_IMAGE}/$1.u-boot
+}
+
+UBOOT_IMAGE_DEPENDS = "genext2fs-native e2fsprogs-native u-boot-mkimage-native"
+
+IMAGE_DEPENDS_ext2.gz.u-boot  = "${UBOOT_IMAGE_DEPENDS}"
+IMAGE_CMD_ext2.gz.u-boot      = "${IMAGE_CMD_ext2.gz}; oe_mkimage ${IMAGE_NAME}.rootfs.ext2.gz"
+IMAGE_DEPENDS_ext2.bz2.u-boot = "${UBOOT_IMAGE_DEPENDS}"
+IMAGE_CMD_ext2.bz2.u-boot     = "${IMAGE_CMD_ext2.bz2}; oe_mkimage ${IMAGE_NAME}.rootfs.ext2.bz2"
+
+IMAGE_DEPENDS_ext3.gz.u-boot  = "${UBOOT_IMAGE_DEPENDS}"
+IMAGE_CMD_ext3.gz.u-boot      = "${IMAGE_CMD_ext3.gz}; oe_mkimage ${IMAGE_NAME}.rootfs.ext3.gz"
+IMAGE_DEPENDS_ext3.bz2.u-boot = "${UBOOT_IMAGE_DEPENDS}"
+IMAGE_CMD_ext3.bz2.u-boot     = "${IMAGE_CMD_ext3.bz2}; oe_mkimage ${IMAGE_NAME}.rootfs.ext3.bz2"
+
+IMAGE_DEPENDS_ext4.gz.u-boot  = "${UBOOT_IMAGE_DEPENDS}"
+IMAGE_CMD_ext4.gz.u-boot      = "${IMAGE_CMD_ext4.gz}; oe_mkimage ${IMAGE_NAME}.rootfs.ext4.gz"
+IMAGE_DEPENDS_ext4.bz2.u-boot = "${UBOOT_IMAGE_DEPENDS}"
+IMAGE_CMD_ext4.bz2.u-boot     = "${IMAGE_CMD_ext4.bz2}; oe_mkimage ${IMAGE_NAME}.rootfs.ext4.bz2"
-- 
1.7.6



