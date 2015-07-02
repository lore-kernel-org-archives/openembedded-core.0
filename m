Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 16CD865C89
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 02:34:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t622YsnC028188
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jul 2015 19:34:54 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Wed, 1 Jul 2015 19:34:54 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Jul 2015 10:34:29 +0800
Message-ID: <1435804469-14774-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] image_types_uboot: remove the middle file
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
X-List-Received-Date: Thu, 02 Jul 2015 02:34:58 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The .gz, .bz2 or .lzma are middle files for making gz.u-boot,
bz2.u-boot, or lzma.u-boot. It should be removed once the final
image is generated. Otherwise, even you --enable-rm-oldimgs=yes,
it can't be removed, moreover more and more middle files are
genrated via 'make fs

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 meta/classes/image_types_uboot.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/image_types_uboot.bbclass b/meta/classes/image_types_uboot.bbclass
index 07837b5..dba9293 100644
--- a/meta/classes/image_types_uboot.bbclass
+++ b/meta/classes/image_types_uboot.bbclass
@@ -3,6 +3,7 @@ inherit image_types kernel-arch
 oe_mkimage () {
     mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C $2 -n ${IMAGE_NAME} \
         -d ${DEPLOY_DIR_IMAGE}/$1 ${DEPLOY_DIR_IMAGE}/$1.u-boot
+    rm $1
 }
 
 COMPRESSIONTYPES += "gz.u-boot bz2.u-boot lzma.u-boot u-boot"
-- 
1.9.1


