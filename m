Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id E600261E92
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2013 21:28:54 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id m6so4194002wiv.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jun 2013 14:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=iqA08Fj8mFA3+3+FjelL2rdGS4QdVVMrx+dS4hrYgPE=;
	b=WItkqpfFPEUnOxNiFFxnuagSTST/k+TOsXw5/lBDbJPxcoyThuRP3kqb2NrGv8WaF3
	mfA8OXLTCXLVZneidqH0AEaoPcRIF3Y63zvQo6MZfr5DJpJkWlnPDyyqKE/qpLFjFtVG
	6Xo9X7u9QPMuSw3K4tGhycGPGM9F8Vq9JHN7KNebtNtrEA7BelGNwUiB9nLtLjQIcW9n
	PtrQ2VOzyZM1Z7eACGatXMduj6grQnqQQx8E/wLdv8BhunjN7RSAE70x6d+2PAhNxgbh
	kLijnFIE7FsXfiFvhINdlTejBPQutD/KMUOKQpUrhuX2wXfqmrqaVf25beibQBW8EMUw
	lMpA==
X-Received: by 10.180.9.35 with SMTP id w3mr3319962wia.51.1370381334859;
	Tue, 04 Jun 2013 14:28:54 -0700 (PDT)
Received: from mizar.localdomain
	(host199-42-dynamic.183-80-r.retail.telecomitalia.it.
	[80.183.42.199])
	by mx.google.com with ESMTPSA id ca19sm5579880wib.3.2013.06.04.14.28.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 04 Jun 2013 14:28:54 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Jun 2013 23:28:45 +0200
Message-Id: <1370381325-8760-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH] image_types.bbclass: add ubifs to IMAGE_TYPES
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
X-List-Received-Date: Tue, 04 Jun 2013 21:28:56 -0000

* the IMAGE_TYPES variable is used exclusively by hob
* IMAGE_CMD_ubifs is already present in the class
* ubifs images can be flashed on existing ubi volumes with 'ubiupdatevol'

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 38647cf..059af7d 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -240,7 +240,7 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
-IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs live squashfs squashfs-xz ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk elf"
+IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs live squashfs squashfs-xz ubi ubifs tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk elf"
 
 COMPRESSIONTYPES = "gz bz2 lzma xz"
 COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
-- 
1.8.1.5


