Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 80BB06AC00
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 22:16:36 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i134-v6so5633631wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 15:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EJIO9clGkFPhzEGQN10UxhVVTEtOsIIC1W2vGyjjqGs=;
	b=C5KUF/Kg+sOndz1SnGXh2dNVsFmfluI5gKd5BJpW0WHi5iNUNsCXRHsWA2Nn7vUSdg
	f/QQ9/OuNgrrqgp7UI6Axnb8So9GN0gTbj+77eW4w7Ux8kZsLCmU/MvH5y3Kaxvdpbv/
	0zcKkwwmOQA07F6sRGQg3nfD1Quh3R+pk1CdxQMjB+ptC4C0SW8jGJ4Y9ZIUleWfcCoL
	/tLLbuvrVpDwUG4RdG8NRpYDPkbioZanVzTTxDn8E3DUjrfJ5FcyYyLqnBJdCsG5d4P+
	6YIKyG+O2LT/jhWR7ejE5kmUU5wVNuMdzuAuJADPHz69fLJMEh0rJZBW8pM4UVWLkIRL
	9+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EJIO9clGkFPhzEGQN10UxhVVTEtOsIIC1W2vGyjjqGs=;
	b=nt1s0xmmgkyCsmFCo8f14owhLVC5Kl3xdVDG4MnWOLlsjib8Cdd90iegK5CTjal5a3
	1B4L8I38GLXHX5syhJfDVFPyGSkFeHUCfMf2xyuOVtS7gF2Heo51Ui8kh6gDp62ErpgZ
	2yZe1RzAhgih/pyoyDKEEaFpPNa+Qz/z7SDNVNG+BS7HtT6mUxz0YEgpJLV90W2tucwQ
	JjIqTgV9LjU2geCfjfwaenlgCewWOaufr2DsSiG5aCZBqFDLD0TWN1ucLgvzGSR2Ud+1
	ObFk6g90K+GzZBdD4CUVatk/Mdt1r84oh1NMTdWjY/eMSsZLcm/XIIdz42eobCL8/dxX
	QOaQ==
X-Gm-Message-State: AOUpUlGocVJF/sZvG8ezmgQ86AZsROZgVJjKJL/z5G+CWu8fcYYz4nhc
	3C2HC2xQT4PJael94Zgxi4Wv/ATv
X-Google-Smtp-Source: AA+uWPwlNHZx2qYOEBCv09Y6mNoKvW8lWLj4KwDe9nvEeaiyaAMDY1aPuKudfxuIocFRJNepestUuQ==
X-Received: by 2002:a1c:1584:: with SMTP id
	126-v6mr24320643wmv.24.1534716996965; 
	Sun, 19 Aug 2018 15:16:36 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c129-v6sm16212161wmh.2.2018.08.19.15.16.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 19 Aug 2018 15:16:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Aug 2018 22:16:00 +0000
Message-Id: <45d71796c37b6db2ebaa01a06a7ba4a37d898f87.1534716156.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1534716156.git.Martin.Jansa@gmail.com>
References: <cover.1534716156.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/6] kernel*.bbclass: rename *_SYMLINK_NAME variables to *_LINK_NAME and *_BASE_NAME to *_NAME
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
X-List-Received-Date: Sun, 19 Aug 2018 22:16:37 -0000

* for consistency with IMAGE_NAME and IMAGE_LINK_NAME
  and to avoid confusion with IMAGE_BASENAME (which is the
  actual name of the artifact, e.g. PN while KERNEL_IMAGE_BASE_NAME
  was only the version suffix)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-artifact-names.bbclass | 22 +++++++++++-----------
 meta/classes/kernel-devicetree.bbclass     | 22 +++++++++++-----------
 meta/classes/kernel-fitimage.bbclass       | 16 ++++++++--------
 meta/classes/kernel.bbclass                | 14 +++++++-------
 4 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/meta/classes/kernel-artifact-names.bbclass b/meta/classes/kernel-artifact-names.bbclass
index d235bc1096..56352d73b3 100644
--- a/meta/classes/kernel-artifact-names.bbclass
+++ b/meta/classes/kernel-artifact-names.bbclass
@@ -1,17 +1,17 @@
-KERNEL_IMAGE_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
-KERNEL_IMAGE_SYMLINK_NAME ?= "${MACHINE}"
+KERNEL_IMAGE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
+KERNEL_IMAGE_LINK_NAME ?= "${MACHINE}"
 
-KERNEL_DTB_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
-KERNEL_DTB_SYMLINK_NAME ?= "${MACHINE}"
+KERNEL_DTB_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
+KERNEL_DTB_LINK_NAME ?= "${MACHINE}"
 
-KERNEL_FIT_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
-KERNEL_FIT_SYMLINK_NAME ?= "${MACHINE}"
+KERNEL_FIT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
+KERNEL_FIT_LINK_NAME ?= "${MACHINE}"
 
-MODULE_IMAGE_BASE_NAME ?= "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
+MODULE_IMAGE_NAME ?= "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
-MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
-MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
+MODULE_TARBALL_NAME ?= "${MODULE_IMAGE_NAME}.tgz"
+MODULE_TARBALL_LINK_NAME ?= "modules-${MACHINE}.tgz"
 MODULE_TARBALL_DEPLOY ?= "1"
 
-INITRAMFS_BASE_NAME ?= "initramfs-${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
-INITRAMFS_SYMLINK_NAME ?= "initramfs-${MACHINE}"
+INITRAMFS_NAME ?= "initramfs-${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
+INITRAMFS_LINK_NAME ?= "initramfs-${MACHINE}"
diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 9c5e125981..867b776aa7 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -72,22 +72,22 @@ do_deploy_append() {
 		dtb_ext=${dtb##*.}
 		dtb_base_name=`basename $dtb .$dtb_ext`
 		install -d ${DEPLOYDIR}
-		install -m 0644 ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext
-		ln -sf $dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext ${DEPLOYDIR}/$dtb_base_name.$dtb_ext
-		ln -sf $dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_SYMLINK_NAME}.$dtb_ext
+		install -m 0644 ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
+		ln -sf $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext ${DEPLOYDIR}/$dtb_base_name.$dtb_ext
+		ln -sf $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext
 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
 			if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
 				cat ${D}/${KERNEL_IMAGEDEST}/$type \
-					${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext \
-					> ${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext.bin
-				ln -sf $type-$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext.bin \
-					${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_SYMLINK_NAME}.$dtb_ext.bin
+					${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext \
+					> ${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin
+				ln -sf $type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin \
+					${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext.bin
 				if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
 					cat ${KERNEL_OUTPUT_DIR}/${type}.initramfs \
-						${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext
-						>  ${DEPLOYDIR}/${type}-${INITRAMFS_BASE_NAME}-$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext.bin
-					ln -sf ${type}-${INITRAMFS_BASE_NAME}-$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext.bin \
-						${DEPLOYDIR}/${type}-${INITRAMFS_BASE_NAME}-$dtb_base_name-${KERNEL_DTB_SYMLINK_NAME}.$dtb_ext.bin
+						${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
+						>  ${DEPLOYDIR}/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin
+					ln -sf ${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin \
+						${DEPLOYDIR}/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext.bin
 				fi
 			fi
 		done
diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index a99c9d8054..a4d7acae40 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -489,21 +489,21 @@ kernel_do_deploy_append() {
 	# Update deploy directory
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
 		echo "Copying fit-image.its source file..."
-		install -m 0644 ${B}/fit-image.its ${DEPLOYDIR}/fitImage-its-${KERNEL_FIT_BASE_NAME}.its
-		ln -snf fitImage-its-${KERNEL_FIT_BASE_NAME} ${DEPLOYDIR}/fitImage-its-${KERNEL_FIT_SYMLINK_NAME}
+		install -m 0644 ${B}/fit-image.its ${DEPLOYDIR}/fitImage-its-${KERNEL_FIT_NAME}.its
+		ln -snf fitImage-its-${KERNEL_FIT_NAME} ${DEPLOYDIR}/fitImage-its-${KERNEL_FIT_LINK_NAME}
 
 		echo "Copying linux.bin file..."
-		install -m 0644 ${B}/linux.bin ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_BASE_NAME}.bin
-		ln -snf fitImage-linux.bin-${KERNEL_FIT_BASE_NAME}.bin ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_SYMLINK_NAME}
+		install -m 0644 ${B}/linux.bin ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
+		ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}
 
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
 			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
-			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its ${DEPLOYDIR}/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_BASE_NAME}.its
-			ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_BASE_NAME}.its ${DEPLOYDIR}/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_SYMLINK_NAME}
+			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its ${DEPLOYDIR}/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its
+			ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its ${DEPLOYDIR}/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}
 
 			echo "Copying fitImage-${INITRAMFS_IMAGE} file..."
-			install -m 0644 ${B}/arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} ${DEPLOYDIR}/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_BASE_NAME}.bin
-			ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_BASE_NAME}.bin ${DEPLOYDIR}/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_SYMLINK_NAME}
+			install -m 0644 ${B}/arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} ${DEPLOYDIR}/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin
+			ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin ${DEPLOYDIR}/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}
 		fi
 	fi
 }
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 42efa382ad..e47c063f5a 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -667,26 +667,26 @@ kernel_do_deploy() {
 	fi
 
 	for type in ${KERNEL_IMAGETYPES} ; do
-		base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
+		base_name=${type}-${KERNEL_IMAGE_NAME}
 		install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} $deployDir/${base_name}.bin
 	done
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		mkdir -p ${D}/lib
-		tar -cvzf $deployDir/${MODULE_TARBALL_BASE_NAME} -C ${D} lib
-		ln -sf ${MODULE_TARBALL_BASE_NAME} $deployDir/${MODULE_TARBALL_SYMLINK_NAME}
+		tar -cvzf $deployDir/${MODULE_TARBALL_NAME} -C ${D} lib
+		ln -sf ${MODULE_TARBALL_NAME} $deployDir/${MODULE_TARBALL_LINK_NAME}
 	fi
 
 	for type in ${KERNEL_IMAGETYPES} ; do
-		base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
-		symlink_name=${type}-${KERNEL_IMAGE_SYMLINK_NAME}
+		base_name=${type}-${KERNEL_IMAGE_NAME}
+		symlink_name=${type}-${KERNEL_IMAGE_LINK_NAME}
 		ln -sf ${base_name}.bin $deployDir/${symlink_name}.bin
 		ln -sf ${base_name}.bin $deployDir/${type}
 	done
 
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
 		for type in ${KERNEL_IMAGETYPES} ; do
-			initramfs_base_name=${type}-${INITRAMFS_BASE_NAME}
-			initramfs_symlink_name=${type}-${INITRAMFS_SYMLINK_NAME}
+			initramfs_base_name=${type}-${INITRAMFS_NAME}
+			initramfs_symlink_name=${type}-${INITRAMFS_LINK_NAME}
 			install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}.initramfs $deployDir/${initramfs_base_name}.bin
 			ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
 		done
-- 
2.17.1


