Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UXdqw-0006s9-Fi
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 22:42:19 +0200
Received: from i7-990x.r-finger.com
	(host86-131-182-26.range86-131.btcentralplus.com [86.131.182.26])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 115E39528;
	Wed,  1 May 2013 21:24:22 +0100 (BST)
From: tf+lists.yocto@r-finger.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 May 2013 21:24:22 +0100
Message-Id: <1367439862-4658-1-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Tomas Frydrych <tomas@sleepfive.com>
Subject: [PATCH] image_types: fix default location of kernel when generating elf images
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 May 2013 20:42:26 -0000

From: Tomas Frydrych <tomas@sleepfive.com>

The kernel is now located in DEPLOY_DIR_IMAGE rather than sysroot.

Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
---
 meta/classes/image_types.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 98d31f5..0e1ad3a 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -185,7 +185,7 @@ IMAGE_CMD_cpio () {
 	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
 }
 
-ELF_KERNEL ?= "${STAGING_DIR_HOST}/kernel/${KERNEL_IMAGETYPE}"
+ELF_KERNEL ?= "${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}.bin"
 ELF_APPEND ?= "ramdisk_size=32768 root=/dev/ram0 rw console="
 
 IMAGE_CMD_elf () {
-- 
1.7.10.4



