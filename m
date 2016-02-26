Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 415 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 26 Feb 2016 16:45:15 UTC
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.16])
	by mail.openembedded.org (Postfix) with ESMTP id 31607772BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 16:45:15 +0000 (UTC)
Received: from [216.82.249.131] by server-16.bemta-12.messagelabs.com id
	8E/44-02968-D7F70D65; Fri, 26 Feb 2016 16:38:21 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-4.tower-28.messagelabs.com!1456504699!17945220!2
X-Originating-IP: [192.109.95.98]
X-StarScan-Received: 
X-StarScan-Version: 7.35.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29418 invoked from network); 26 Feb 2016 16:38:20 -0000
Received: from unknown (HELO DOR-VMS-XCH01.digi.com) (192.109.95.98)
	by server-4.tower-28.messagelabs.com with SMTP;
	26 Feb 2016 16:38:20 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by DOR-VMS-XCH01.digi.com
	(10.49.8.98) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Fri, 26 Feb 2016 17:38:14 +0100
Received: from log-cln-jviguera.digi.com (10.101.2.54) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.266.1; Fri, 26 Feb 2016 17:38:13 +0100
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Feb 2016 17:38:10 +0100
Message-ID: <1456504690-44398-2-git-send-email-javier.viguera@digi.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456504690-44398-1-git-send-email-javier.viguera@digi.com>
References: <1456504690-44398-1-git-send-email-javier.viguera@digi.com>
MIME-Version: 1.0
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
X-KSE-AntiSpam-Interceptor-Info: protection disabled
Subject: [jethro][PATCH] image_types_uboot: add cpio.gz.uboot to supported IMAGE_TYPES
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
X-List-Received-Date: Fri, 26 Feb 2016 16:45:16 -0000
Content-Type: text/plain

From: Arnold Csorvasi <arnold.csorvasi@ni.com>

U-Boot needs the U-Boot header in a ramdisk image to boot it.
Add this header to the cpio.gz image, so that it can be booted
with U-Boot.

Signed-off-by: Arnold Csorvasi <arnold.csorvasi@ni.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/image_types_uboot.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types_uboot.bbclass b/meta/classes/image_types_uboot.bbclass
index 081bca2cc9a0..19e4aa2e4785 100644
--- a/meta/classes/image_types_uboot.bbclass
+++ b/meta/classes/image_types_uboot.bbclass
@@ -22,5 +22,5 @@ COMPRESS_CMD_bz2.u-boot      = "${COMPRESS_CMD_bz2}; oe_mkimage ${IMAGE_NAME}.ro
 COMPRESS_DEPENDS_lzma.u-boot = "u-boot-mkimage-native"
 COMPRESS_CMD_lzma.u-boot      = "${COMPRESS_CMD_lzma}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lzma lzma clean"
 
-IMAGE_TYPES += "ext2.u-boot ext2.gz.u-boot ext2.bz2.u-boot ext2.lzma.u-boot ext3.gz.u-boot ext4.gz.u-boot"
+IMAGE_TYPES += "ext2.u-boot ext2.gz.u-boot ext2.bz2.u-boot ext2.lzma.u-boot ext3.gz.u-boot ext4.gz.u-boot cpio.gz.u-boot"
 

