Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id BC4AB74CB4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 15:04:54 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v128-v6so3960161wme.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2018 08:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0BjlLQbuKLoLY+0DXmju4qMLX3PVksLWDvpYeJ+EFzQ=;
	b=FZMFOkkQNuY80Zk4nOR+8keKQpzWTeDwyk/P3sG7J+O6t0dQydS22MiQ8A77uhgJg/
	Nk403r1sMfXPBahJETELFUNyqdmSFV4M1crazOpM0yWCehpd8NH8cxkkivN1GGrIV3zQ
	xukWXTDEhNexuEi+YSWj4BH9F7y0yfh1aJvmiL1UZ8dxxVpzgELcV9qNOZuwD5KGMU2C
	MoGo5t9CTfDHWInDXYhVil2JnniohmzUAafayF+9vyfOTmX2go/C7gE83I+xaYjXm12n
	qsnmwVu5/mF9FEOvhICrZt7qOI72EeLeZsRa0P/0EGOSmbNM7PgI6QlLrvimmkZDr/ys
	cDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0BjlLQbuKLoLY+0DXmju4qMLX3PVksLWDvpYeJ+EFzQ=;
	b=hGBdCskMSMbDSXlTdx/trJpIFCoUPTWU79n7FUMNZLEN1bu741SDD2j8CzmYoPw7kY
	7K/KLkmmgHQzHzhwFwq/1kEKjNjFg0k3oUb5YY6c9Vi3p9vgud44Y4pOahBDvrzlEDmu
	rLyQRJvS8Cr3NBPNHEWj0g0hLYquyT7fWW9bW4RpBpzrCILSr4CIyqqvP337VX/62dAv
	NEZbMkQCaGtWLxti0kfCFXoF0vIr4VJHJVSPFJ3J8lOqty13vyXpQ3D6TSHxthHCD0+r
	sHEm4Q1ggU/RinypxKWRx5xwPrMAEriPUulwf+TXqrD1JiwJmKh0rCn5hI3wyt5Nlx9z
	VrWw==
X-Gm-Message-State: APt69E00ukA3ZL8AsvWjwmKrEaoz+gRgnaYafyDY87Lla050v+3LFa/S
	Pi3VoVB0r2UMOEljfBRh06ABQg==
X-Google-Smtp-Source: AAOMgpdl8nTj/GCAg8pClhXKx1J6QRYMvxor7Z28JljH+zOfzbYLqd2R8Y7v7mGxWt+0jfhEkjDNUw==
X-Received: by 2002:a1c:ed07:: with SMTP id
	l7-v6mr13373733wmh.139.1531148695161; 
	Mon, 09 Jul 2018 08:04:55 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	35-v6sm10719788wri.78.2018.07.09.08.04.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 09 Jul 2018 08:04:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2018 15:04:57 +0000
Message-Id: <20180709150500.20233-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180709150416.GA1825@jama>
References: <20180709150416.GA1825@jama>
Subject: [PATCHv4 1/4] kernel-devicetree.bbclass: Use lowercase names for shell variables
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
X-List-Received-Date: Mon, 09 Jul 2018 15:04:55 -0000

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


