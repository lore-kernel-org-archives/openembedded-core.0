Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF356FFA1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 22:16:35 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id u12-v6so11404448wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 15:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=z9hO/dqJkUPQhCystnR017a5Ewf1qQx51NGPNYUlJTc=;
	b=RtRJ/9GEi+8fkFzLPAwEP1KVJhg+SeE9fEtAgMFiVh3LHoBVRBTEQRS/9RoMYOgOf9
	gnjnwdwfBO2VbmK8nCamZ4z/Jzi8syEsqwImzRH4dRouZSvCC18MDTUiyfjmRuJFaF/t
	25WTfKwX+ehRMFTlDQwgixPOQm2WH/4de7peQFK6LZELxt53akC0WONwaHgEUyqywNMx
	K9JF09+p3S16yBjVD8DJs6bMlXiIBQx0MzC7ze6M3vJOYXVf6MuS3cqA4+1pP/2+ejNn
	EGNouVLZFoXw1B5bGodQgKvfT4bhJjESS+q2mXweHMuklAG/Z1FYEhmjyzrm7S135zOn
	sd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=z9hO/dqJkUPQhCystnR017a5Ewf1qQx51NGPNYUlJTc=;
	b=RoO/v5eDbadsZRVzTb06l+hhDypjLU+9483psCAH1Em7Eap1xHxog4PP2djtxgg0a5
	zr0T4On3p+UuWAPs8J2B+iXSGt530ZFoIpSdefRbseVNm+1pGR1ZpCcG9IXMVQnCmSNd
	8xpNKISSBjMsxASlwQc0nuGHgRvm9wuFT0QWwhKH9Xem1r+zNNkLWG9uKGzyIgu9+nCR
	NYz9eEgZWYpca8Rk9BXYSobIUA2lbU1cCThx4jkVsfXZOt8c3Xet2PjM3P+rUrK1FNv1
	pi1LVr6nISbb6MBaj8xFHiTSQyxd0ReUGfB9u1pucKt56fuNY+gZWUE1OJmQxvxNC0fR
	Hegw==
X-Gm-Message-State: AOUpUlHQn3/ukME+NOO4hH3nA3XaY1uCb50B9z2BG/3Js0Z13Bmal0+N
	mNhty2GmCWfwhw00/tXzM9tPmexx
X-Google-Smtp-Source: AA+uWPxcdlqh7IlVRfMPspadNGv3Tb5I0gmUDGSkqeUUFw/Al987UijDLapGkXdhJmFeG6lkWIKS3Q==
X-Received: by 2002:adf:a963:: with SMTP id
	u90-v6mr26734408wrc.248.1534716995772; 
	Sun, 19 Aug 2018 15:16:35 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r16-v6sm11750464wru.59.2018.08.19.15.16.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 19 Aug 2018 15:16:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Aug 2018 22:15:59 +0000
Message-Id: <056d327707c1e53a3bf662553ed7544734a2fdc8.1534716156.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1534716156.git.Martin.Jansa@gmail.com>
References: <cover.1534716156.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/6] kernel-artifact-names, kernel-fitimage: add KERNEL_FIT_BASE_NAME, KERNEL_FIT_SYMLINK_NAME variables
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
X-List-Received-Date: Sun, 19 Aug 2018 22:16:35 -0000

* use the same naming scheme for fitImage files like all other deployed artifacts
* remove unnecessary cd to DEPLOYDIR
* remove unnecessary cd to B

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-artifact-names.bbclass |  3 ++
 meta/classes/kernel-fitimage.bbclass       | 34 ++++++++--------------
 2 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/meta/classes/kernel-artifact-names.bbclass b/meta/classes/kernel-artifact-names.bbclass
index 70b1cb804d..d235bc1096 100644
--- a/meta/classes/kernel-artifact-names.bbclass
+++ b/meta/classes/kernel-artifact-names.bbclass
@@ -4,6 +4,9 @@ KERNEL_IMAGE_SYMLINK_NAME ?= "${MACHINE}"
 KERNEL_DTB_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 KERNEL_DTB_SYMLINK_NAME ?= "${MACHINE}"
 
+KERNEL_FIT_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
+KERNEL_FIT_SYMLINK_NAME ?= "${MACHINE}"
+
 MODULE_IMAGE_BASE_NAME ?= "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
 MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index a1d0dda55d..a99c9d8054 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -1,4 +1,4 @@
-inherit kernel-uboot uboot-sign
+inherit kernel-uboot kernel-artifact-names uboot-sign
 
 python __anonymous () {
     kerneltypes = d.getVar('KERNEL_IMAGETYPES') or ""
@@ -488,32 +488,22 @@ kernel_do_deploy[vardepsexclude] = "DATETIME"
 kernel_do_deploy_append() {
 	# Update deploy directory
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
-		cd ${B}
 		echo "Copying fit-image.its source file..."
-		its_base_name="fitImage-its-${PV}-${PR}-${MACHINE}-${DATETIME}"
-		its_symlink_name=fitImage-its-${MACHINE}
-		install -m 0644 fit-image.its ${DEPLOYDIR}/${its_base_name}.its
-		linux_bin_base_name="fitImage-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}"
-		linux_bin_symlink_name=fitImage-linux.bin-${MACHINE}
-		install -m 0644 linux.bin ${DEPLOYDIR}/${linux_bin_base_name}.bin
+		install -m 0644 ${B}/fit-image.its ${DEPLOYDIR}/fitImage-its-${KERNEL_FIT_BASE_NAME}.its
+		ln -snf fitImage-its-${KERNEL_FIT_BASE_NAME} ${DEPLOYDIR}/fitImage-its-${KERNEL_FIT_SYMLINK_NAME}
+
+		echo "Copying linux.bin file..."
+		install -m 0644 ${B}/linux.bin ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_BASE_NAME}.bin
+		ln -snf fitImage-linux.bin-${KERNEL_FIT_BASE_NAME}.bin ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_SYMLINK_NAME}
 
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
 			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
-			its_initramfs_base_name="fitImage-its-${INITRAMFS_IMAGE_NAME}-${PV}-${PR}-${DATETIME}"
-			its_initramfs_symlink_name=fitImage-its-${INITRAMFS_IMAGE_NAME}
-			install -m 0644 fit-image-${INITRAMFS_IMAGE}.its ${DEPLOYDIR}/${its_initramfs_base_name}.its
-			fit_initramfs_base_name="fitImage-${INITRAMFS_IMAGE_NAME}-${PV}-${PR}-${DATETIME}"
-			fit_initramfs_symlink_name=fitImage-${INITRAMFS_IMAGE_NAME}
-			install -m 0644 arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} ${DEPLOYDIR}/${fit_initramfs_base_name}.bin
-		fi
+			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its ${DEPLOYDIR}/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_BASE_NAME}.its
+			ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_BASE_NAME}.its ${DEPLOYDIR}/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_SYMLINK_NAME}
 
-		cd ${DEPLOYDIR}
-		ln -sf ${its_base_name}.its ${its_symlink_name}.its
-		ln -sf ${linux_bin_base_name}.bin ${linux_bin_symlink_name}.bin
-
-		if [ -n "${INITRAMFS_IMAGE}" ]; then
-			ln -sf ${its_initramfs_base_name}.its ${its_initramfs_symlink_name}.its
-			ln -sf ${fit_initramfs_base_name}.bin ${fit_initramfs_symlink_name}.bin
+			echo "Copying fitImage-${INITRAMFS_IMAGE} file..."
+			install -m 0644 ${B}/arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} ${DEPLOYDIR}/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_BASE_NAME}.bin
+			ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_BASE_NAME}.bin ${DEPLOYDIR}/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_SYMLINK_NAME}
 		fi
 	fi
 }
-- 
2.17.1


