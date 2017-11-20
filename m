Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6FB3178694
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 20:11:19 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id a63so9207618wrc.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 12:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=r6WzoBZmY9xBMRITL+rrNwVgD0aHepVqbew0t5kOBkQ=;
	b=Ky4AJcVu/mENs6uCjfl1dX5TuQdDLfThGLR1op5k4Ej8K2Qz24Ofh1YyzuJdp+ZwbE
	AmX2KMqqY8e38pJjXBiE+m6W09GS+od//TurGPp0MnFg+8EUbzGwKiceUgQkGXAU7lvY
	UmxykBb30taLSRWJ/ROuGndZIBqb1wtwAg7Ew4gzVgGeLSlajVNwlf0+O1WUZwViwBti
	gTOmibr9pkTUVRtfvoKbUhOSxzK1j3QDdsBgaAVdIEqCJtZl7NZ8BRchT4BQ4cmM2WzV
	IKuv88/WGY3TS4qZrZqEl93Qe+OriEAXJoV1aJ0PkJRXoy6LZhUM5XehNjy5bpWAzWXH
	deJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=r6WzoBZmY9xBMRITL+rrNwVgD0aHepVqbew0t5kOBkQ=;
	b=ME5ECnKgELI0GPr6IzWVnJ+a/JvMGh0CwVnmLV5IDKzpYtguZqtdtn/0z3Tk8KO2l/
	+MTMmxUjCuWhaeFJTpNK3+8mBBjQ9TFCQCzDhI8t5Mn7XG8F3lWm7W14dSOJ9mfKNZkV
	NLIQat6mLXQFjs2cGtBiuYss+IQjyrCs8FsZjLVrxb1dGDJUq8hMF+X85MuDHFxkHwDB
	A4F9mfmIYTquBcDDfptGeZgBa+0uNbx1dYTQHvnic2Wq2UR9Kvw9Xe3CbE5gpg+ymaQG
	PMFV5+4xZWBoP5aoYPxgIOIjFV1UPcpkAzgCCq1z+0Vt2ZTpoKf3w/e270mQVNWxOtjm
	bPzg==
X-Gm-Message-State: AJaThX5L1MX9EpgstBgK3ozAqzoizjXOao/+PG3AU54Xz2szTKOug5wW
	xGUj6znxeMLOA9I/0wOonCFbCg==
X-Google-Smtp-Source: AGs4zMbNmXS9WFHZMyvx4kIHLdakqZU+4Oo2b9kEzasBXh6lcSjm+LtJDJ9f/awLIa7tTvclCIKyow==
X-Received: by 10.223.185.3 with SMTP id k3mr6667788wrf.40.1511208680799;
	Mon, 20 Nov 2017 12:11:20 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	f19sm14477364wrh.64.2017.11.20.12.11.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Nov 2017 12:11:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Nov 2017 20:11:00 +0000
Message-Id: <c0de141d9c2ad1ced20993e6d74338492eaa4ad8.1511207344.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1511207344.git.Martin.Jansa@gmail.com>
References: <cover.1511207344.git.Martin.Jansa@gmail.com>
Subject: [RFC][PATCH 1/5] kernel-devicetree.bbclass: Use lowercase names for shell variables
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
X-List-Received-Date: Mon, 20 Nov 2017 20:11:20 -0000

* just to make it more clear what is local shell variable and what is
  replaced by bitbake from the metadata and also to prevent the variable
  to be incorrectly expanded by bitbake if someone happens to define
  e.g. DTB_BASE_NAME

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-devicetree.bbclass | 80 +++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 6e08be4..3dca652 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -10,21 +10,21 @@ FILES_kernel-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
 KERNEL_DEVICETREE_BUNDLE ?= "0"
 
 normalize_dtb () {
-	DTB="$1"
-	if echo ${DTB} | grep -q '/dts/'; then
-		bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
-		DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
+	dtb="$1"
+	if echo $dtb | grep -q '/dts/'; then
+		bbwarn "$dtb contains the full path to the the dts file, but only the dtb name should be used."
+		dtb=`basename $dtb | sed 's,\.dts$,.dtb,g'`
 	fi
-	echo "${DTB}"
+	echo "$dtb"
 }
 
 get_real_dtb_path_in_kernel () {
-	DTB="$1"
-	DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
-	if [ ! -e "${DTB_PATH}" ]; then
-		DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
+	dtb="$1"
+	dtb_path="${B}/arch/${ARCH}/boot/dts/$dtb"
+	if [ ! -e "$dtb_path" ]; then
+		dtb_path="${B}/arch/${ARCH}/boot/$dtb"
 	fi
-	echo "${DTB_PATH}"
+	echo "$dtb_path"
 }
 
 do_configure_append() {
@@ -50,61 +50,61 @@ do_configure_append() {
 }
 
 do_compile_append() {
-	for DTB in ${KERNEL_DEVICETREE}; do
-		DTB=`normalize_dtb "${DTB}"`
-		oe_runmake ${DTB}
+	for dtbf in ${KERNEL_DEVICETREE}; do
+		dtb=`normalize_dtb "$dtbf"`
+		oe_runmake $dtb
 	done
 }
 
 do_install_append() {
-	for DTB in ${KERNEL_DEVICETREE}; do
-		DTB=`normalize_dtb "${DTB}"`
-		DTB_EXT=${DTB##*.}
-		DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
-		DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
-		install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT}
+	for dtbf in ${KERNEL_DEVICETREE}; do
+		dtb=`normalize_dtb "$dtbf"`
+		dtb_ext=${dtb##*.}
+		dtb_path=`get_real_dtb_path_in_kernel "$dtb"`
+		dtb_base_name=`basename $dtb ."$dtb_ext"`
+		install -m 0644 $dtb_path ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext
 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
 			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
-			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			ln -sf ${DTB_BASE_NAME}.${DTB_EXT} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
+			dtb_symlink_name=`echo ${symlink_name} | sed "s/${MACHINE}/$dtb_base_name/g"`
+			ln -sf $dtb_base_name.$dtb_ext ${D}/${KERNEL_IMAGEDEST}/devicetree-$dtb_symlink_name.$dtb_ext
 
 			if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
 				cat ${D}/${KERNEL_IMAGEDEST}/$type \
-					${D}/${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} \
-					> ${D}/${KERNEL_IMAGEDEST}/$type-${DTB_BASE_NAME}.${DTB_EXT}.bin
+					${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext \
+					> ${D}/${KERNEL_IMAGEDEST}/$type-$dtb_base_name.$dtb_ext.bin
 			fi
 		done
 	done
 }
 
 do_deploy_append() {
-	for DTB in ${KERNEL_DEVICETREE}; do
-		DTB=`normalize_dtb "${DTB}"`
-		DTB_EXT=${DTB##*.}
-		DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
+	for dtbf in ${KERNEL_DEVICETREE}; do
+		dtb=`normalize_dtb "$dtbf"`
+		dtb_ext=${dtb##*.}
+		dtb_base_name=`basename $dtb ."$dtb_ext"`
 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
 			base_name=${type}"-"${KERNEL_IMAGE_BASE_NAME}
 			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
-			DTB_NAME=`echo ${base_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
+			dtb_name=`echo ${base_name} | sed "s/${MACHINE}/$dtb_base_name/g"`
+			dtb_symlink_name=`echo ${symlink_name} | sed "s/${MACHINE}/$dtb_base_name/g"`
+			dtb_path=`get_real_dtb_path_in_kernel "$dtb"`
 			install -d ${DEPLOYDIR}
-			install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT}
-			ln -sf ${DTB_NAME}.${DTB_EXT} ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.${DTB_EXT}
-			ln -sf ${DTB_NAME}.${DTB_EXT} ${DEPLOYDIR}/${DTB_BASE_NAME}.${DTB_EXT}
+			install -m 0644 $dtb_path ${DEPLOYDIR}/$dtb_name.$dtb_ext
+			ln -sf $dtb_name.$dtb_ext ${DEPLOYDIR}/$dtb_symlink_name.$dtb_ext
+			ln -sf $dtb_name.$dtb_ext ${DEPLOYDIR}/$dtb_base_name.$dtb_ext
 
 			if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
 				cat ${DEPLOYDIR}/$type \
-					${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT} \
-					> ${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT}.bin
-				ln -sf ${DTB_NAME}.${DTB_EXT}.bin ${DEPLOYDIR}/$type-${DTB_BASE_NAME}.${DTB_EXT}.bin
+					${DEPLOYDIR}/$dtb_name.$dtb_ext \
+					> ${DEPLOYDIR}/$dtb_name.$dtb_ext.bin
+				ln -sf $dtb_name.$dtb_ext.bin ${DEPLOYDIR}/$type-$dtb_base_name.$dtb_ext.bin
 
 				if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
 					cat ${KERNEL_OUTPUT_DIR}/${type}.initramfs \
-						${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT} \
-						> ${DEPLOYDIR}/${type}-${INITRAMFS_BASE_NAME}-${DTB_BASE_NAME}.${DTB_EXT}.bin
-					ln -sf ${type}-${INITRAMFS_BASE_NAME}-${DTB_BASE_NAME}.${DTB_EXT}.bin \
-					       ${DEPLOYDIR}/${type}-initramfs-${DTB_BASE_NAME}.${DTB_EXT}-${MACHINE}.bin
+						${DEPLOYDIR}/$dtb_name.$dtb_ext \
+						> ${DEPLOYDIR}/${type}-${INITRAMFS_BASE_NAME}-$dtb_base_name.$dtb_ext.bin
+					ln -sf ${type}-${INITRAMFS_BASE_NAME}-$dtb_base_name.$dtb_ext.bin \
+					       ${DEPLOYDIR}/${type}-initramfs-$dtb_base_name.$dtb_ext-${MACHINE}.bin
 				fi
 			fi
 		done
-- 
2.7.4


