Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9261678A10
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 22:07:44 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id f16-v6so16937993wrm.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 15:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0BjlLQbuKLoLY+0DXmju4qMLX3PVksLWDvpYeJ+EFzQ=;
	b=dWJbOytGAgeKu5tzLjlU/bcUKoOW62D8FW0FRP6ChIeuQpyIQmtlKdGWleJBKDMp/f
	nUUniHZvBppuNYnxaFyJ0mNMnfvjlKY9FnxsQe3qjPqOO+kR9NIfe0YAVhvbls9LXtHv
	9MVfCAyUBUwuKcELDwMNjwRluzY6AYHU5AsrrECGtrvCFpKW/p4egNxzY2xlWtB5wXUY
	S9slgE44SuT2V9AjyRVnJVbp6OGMbxGaluF8zFncxeLxM7m2JkieU9w2RdBpTF71S6l+
	h+MRYQk9UOS6Y4CLg7XP3BDUgccnXieURunn5fYbatvR4dN82nkd0on6hBAAaWN27e1w
	6Feg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0BjlLQbuKLoLY+0DXmju4qMLX3PVksLWDvpYeJ+EFzQ=;
	b=F7CO6+a+VNF76TONUhv49RkZadQMCvjS0Hc61opYOBXVJEpYbU247hTegLDGUaQe8T
	3CIwfy+LEo1ZsdHiDiBwEq80eu7rTDZ+oHnM7xGKPCIniugSSl7u2nCD8SsSGBeo79lh
	4PSuY7tL3Z0Q1IbiZcn+8Aji6NU/Lg0fD30ddVDEEb0Pj6TyX46cLrc9Mdu+KZS2oJ1e
	DQeeO6kaGtsUHbUhLhOibLaI+SrZcsiU0NgbtV4mXrZPI4bMU9unQ+3cts+GaJ9FWqpi
	SB1RQgDB/Nif4W6Ao9EqBpLHCsGtqRUP4MSWUYnNu4CWoyzrMK9syFhGk4f9JosI+RJt
	XJuA==
X-Gm-Message-State: APt69E2+6imUu2nondTZaI6svqpbw84tWKfed64x0I0Q1sbR0olap17p
	bvYNiJ3Ytxz5yP241fc6AdC9sA==
X-Google-Smtp-Source: AAOMgpe73xAlifeYGrp1SEsQG6pPIH7NvL6/2CODco6B8bB/13MfaEVfMUfEcZjWmDMtb8M1UamH8A==
X-Received: by 2002:adf:ef8c:: with SMTP id
	d12-v6mr10673370wro.195.1530569265043; 
	Mon, 02 Jul 2018 15:07:45 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l17-v6sm9571557wrh.45.2018.07.02.15.07.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 02 Jul 2018 15:07:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jul 2018 22:07:41 +0000
Message-Id: <20180702220744.10881-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CA+chaQd9otpzozM5DrifBUVdODogBsVdy2U8czAAd+Ys_6TBtA@mail.gmail.com>
References: <CA+chaQd9otpzozM5DrifBUVdODogBsVdy2U8czAAd+Ys_6TBtA@mail.gmail.com>
Subject: [PATCHv2 1/4] kernel-devicetree.bbclass: Use lowercase names for shell variables
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
X-List-Received-Date: Mon, 02 Jul 2018 22:07:45 -0000

* just to make it more clear what is local shell variable and what is
  replaced by bitbake from the metadata and also to prevent the variable
  to be incorrectly expanded by bitbake if someone happens to define
  e.g. DTB_BASE_NAME

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-devicetree.bbclass | 80 +++++++++++++-------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 4f80cc62eb..10441475e8 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -10,21 +10,21 @@ FILES_${KERNEL_PACKAGE_NAME}-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-
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
2.17.1


