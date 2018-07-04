Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5F98478AD0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 07:59:29 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i139-v6so4744389wmf.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2018 00:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ABP2msMpGVTvZyFxIfXpCYWWDaSaXfKH2mysFE6n6Fw=;
	b=DaM2O7sQZALwDm2NRQIYGWVbvnXnAYw7LEB6vobGoBoTzl+fAELszN6esgFM2LHhlj
	BYXdBQjHXyU29d/+eTIVvRcoHa0OgrJ2LN3Zf5EEi0nME87zdHVXhiVSJKSaWFo5Vjm5
	2I0t33YR/FgKnf0peoknJVdu7+/zF4SMdYqJY09ddLIZJs3aR1OZD4xUe7WSfvLqW1GV
	2Dt4xNadm7V5eQH19cca+HA3zj4HKso6XnCY9M0zATVFltS1oqlOc9kTlv5Uo+7l3rhl
	3fU4Ej9QTQNLTtcUmQ+1Xqd1klPAuHlbDi5Wznnej6ZCkg+pD/gMMN6AUNtZPesZ9PaK
	xN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ABP2msMpGVTvZyFxIfXpCYWWDaSaXfKH2mysFE6n6Fw=;
	b=ADYL3YNvDZPEQVCxSIFLV+64n2xtMa436i5/ol8/vyRdTkbXlCEPcRUBHER9MEEdsR
	WW5mxzNkPHOAUa9+R8ebN0cfaGY1wUTeQ8VNf+6BcEVlNNQsxk22+3fuGq4oROmNU2so
	HUHzA9rzNEBxROGFH4kAQbsWUhq6aBPLoS41IRQdj9k4bR4G/PJV44CPFMDCFcYTPUX3
	P/4HC423ONkmxNjaSCq8grgQntcmdsOeHd9omXgTkLVC03twX4G7IWG3dPO2g1g6y0BQ
	Xbh1dNo3YXtHFajhkTyf32WQRS6wPOlWHPZzeQ3oSTww4+J+n3piSPZ3/K3FRqenXZfL
	NrbQ==
X-Gm-Message-State: APt69E2LcK5hNEiKiRA86LukTwKgjOi6raRckGgvGxqbd1b/mOFYDsog
	B7TOrFBY6af99xDEboswsRw5fA==
X-Google-Smtp-Source: AAOMgpe1wArXOpZrzVxdLCCgwYL5ovtn+g3n1QAay+UhiBZMWUpVgaXzgwZQoHK1/UayyS+wTMhzmQ==
X-Received: by 2002:a1c:4004:: with SMTP id n4-v6mr837984wma.83.1530691169795; 
	Wed, 04 Jul 2018 00:59:29 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c188-v6sm1615487wma.31.2018.07.04.00.59.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Jul 2018 00:59:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2018 07:59:21 +0000
Message-Id: <20180704075924.24065-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CA+chaQd9otpzozM5DrifBUVdODogBsVdy2U8czAAd+Ys_6TBtA@mail.gmail.com>
References: <CA+chaQd9otpzozM5DrifBUVdODogBsVdy2U8czAAd+Ys_6TBtA@mail.gmail.com>
Subject: [PATCHv3 1/4] kernel-devicetree.bbclass: Use lowercase names for shell variables
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
X-List-Received-Date: Wed, 04 Jul 2018 07:59:29 -0000

* just to make it more clear what is local shell variable and what is
  replaced by bitbake from the metadata and also to prevent the variable
  to be incorrectly expanded by bitbake if someone happens to define
  e.g. DTB_BASE_NAME

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-devicetree.bbclass | 80 +++++++++++++-------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 9866d844ab..5d38d3760d 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -10,21 +10,21 @@ FILES_${KERNEL_PACKAGE_NAME}-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-
 KERNEL_DEVICETREE_BUNDLE ?= "0"
 
 normalize_dtb () {
-	DTB="$1"
-	if echo ${DTB} | grep -q '/dts/'; then
-		bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
+	dtb="$1"
+	if echo $dtb | grep -q '/dts/'; then
+		bbwarn "$dtb contains the full path to the the dts file, but only the dtb name should be used."
 	fi
-	DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
-	echo "${DTB}"
+	dtb=`basename $dtb | sed 's,\.dts$,.dtb,g'`
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


