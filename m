Return-Path: <net147@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 940F073ABF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 07:00:21 +0000 (UTC)
Received: by padet14 with SMTP id et14so9076152pad.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 00:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5t+Ca0az3BWZ6FvyFKzFAtUQXjgJWuV090nuoj9fSug=;
	b=uBMNAXksFmS6Gn5yI+9WwcZqg0KwZi79coyfJlaGfse6lvYobgcTGZai/tMJ44bb39
	jdqh+V/Xq/M29l/TfbuIggZV2pAfM39+vY+de3I5EsYHgjcVP2kiGv9wY9LV2YDTEW7a
	WHvmzAlP9eNEjJhf/uqESfpZktbZfmCbLhZ6i+0YzCNFSVOOwrDNVEDv9IdDVAMdJHgx
	5kSnf++tySo2/dvTgLsE/1dHHLGGaPzYlLx83Cm7KFrC37bp232zMMRdnySDHq5p/HEl
	VBuWXPoD9OpfgM3fmh5TpfjcLKJc9AJnwC/+o0xWAAyZkzxOYlykY0hNPXAdn8/mRe05
	jP1g==
X-Received: by 10.66.142.100 with SMTP id rv4mr75509202pab.84.1426057222338;
	Wed, 11 Mar 2015 00:00:22 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	di10sm4240884pad.41.2015.03.11.00.00.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Mar 2015 00:00:21 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2015 18:00:02 +1100
Message-Id: <1426057202-17789-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [PATCH] util-linux: split libsmartcols into separate sub-package
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
X-List-Received-Date: Wed, 11 Mar 2015 07:00:21 -0000

This avoids util-linux-fdisk pulling in util-linux and all the
associated sub-packages.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 3d8a4d0..a081d95 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -28,7 +28,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
 PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
              util-linux-swaponoff util-linux-losetup util-linux-umount \
              util-linux-mount util-linux-readprofile util-linux-libblkid \
-             util-linux-libmount util-linux-libuuid util-linux-uuidd \
+             util-linux-libmount util-linux-libsmartcols util-linux-libuuid util-linux-uuidd \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
              util-linux-mkfs util-linux-mcookie util-linux-reset \
              util-linux-mkfs.cramfs util-linux-fsck.cramfs util-linux-fstrim \
@@ -89,6 +89,7 @@ FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
 FILES_util-linux-libmount = "${base_libdir}/libmount.so.*"
 FILES_util-linux-pylibmount = "${libdir}/${PYTHON_DIR}/dist-packages/libmount/pylibmount.so \
                                ${libdir}/${PYTHON_DIR}/dist-packages/libmount/__init__.*"
+FILES_util-linux-libsmartcols = "${base_libdir}/libsmartcols.so.*"
 FILES_util-linux-libuuid = "${base_libdir}/libuuid.so.*"
 FILES_util-linux-lscpu = "${bindir}/lscpu"
 
-- 
2.3.1


