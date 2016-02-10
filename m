Return-Path: <arnold.csorvasi@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 3B09F60112
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 09:44:52 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u1A9irk8012195 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 03:44:53 -0600
Received: from arnold-ro-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016021003445380-824392 ;
	Wed, 10 Feb 2016 03:44:53 -0600 
From: Arnold Csorvasi <arnold.csorvasi@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 11:44:52 +0200
Message-Id: <1455097492-17771-1-git-send-email-arnold.csorvasi@ni.com>
X-Mailer: git-send-email 2.1.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/10/2016 03:44:53 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/10/2016 03:44:54 AM,
	Serialize complete at 02/10/2016 03:44:54 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-10_06:, , signatures=0
Subject: [PATCH 1/1] image_types_uboot: add cpio.gz.uboot to supported IMAGE_TYPES
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
X-List-Received-Date: Wed, 10 Feb 2016 09:44:55 -0000

U-Boot needs the U-Boot header in a ramdisk image to boot it.
Add this header to the cpio.gz image, so that it can be booted
with U-Boot.

Signed-off-by: Arnold Csorvasi <arnold.csorvasi@ni.com>
---
 meta/classes/image_types_uboot.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types_uboot.bbclass b/meta/classes/image_types_uboot.bbclass
index 081bca2..19e4aa2 100644
--- a/meta/classes/image_types_uboot.bbclass
+++ b/meta/classes/image_types_uboot.bbclass
@@ -22,5 +22,5 @@ COMPRESS_CMD_bz2.u-boot      = "${COMPRESS_CMD_bz2}; oe_mkimage ${IMAGE_NAME}.ro
 COMPRESS_DEPENDS_lzma.u-boot = "u-boot-mkimage-native"
 COMPRESS_CMD_lzma.u-boot      = "${COMPRESS_CMD_lzma}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lzma lzma clean"
 
-IMAGE_TYPES += "ext2.u-boot ext2.gz.u-boot ext2.bz2.u-boot ext2.lzma.u-boot ext3.gz.u-boot ext4.gz.u-boot"
+IMAGE_TYPES += "ext2.u-boot ext2.gz.u-boot ext2.bz2.u-boot ext2.lzma.u-boot ext3.gz.u-boot ext4.gz.u-boot cpio.gz.u-boot"
 
-- 
2.1.4


