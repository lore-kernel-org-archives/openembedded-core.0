Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0D82079216
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 22:16:39 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id a108-v6so8734311wrc.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 15:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=x8aAj1glh6qUQoP/rT4JOZbDk/dcpqF2nWObowx5FfQ=;
	b=foEBWlBeBgK4vfJLo9+22kRNcL0FMsZtfdMVVm/ap1W2VBLJzvQwYGxsjTUdsC76bk
	clLeubHuNK7EhgXAMUgsApv/rFc1hLrADmQeIq5bT/r/eKpLZrEw/mcvwkq5bB1jp1za
	wjsfAiIiwyIWOmNR7oKsaB0vaBNuV44Ahu0+MMuud/VPl4geEMt6SSsBfhqfVSQmHLOa
	34yQcMkk2nNOSFt4iXsojpzi8A90OZd48IhFzMSvbIW8pF01+U3Nrq6EC1vrh8ehFgJN
	GHVhivRhGai+QZguY8fTN+ROgbBtGlz3Wc6MllRNMusxBYMk9vNY8LZ1ioVTqZJXRr2K
	Rs+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=x8aAj1glh6qUQoP/rT4JOZbDk/dcpqF2nWObowx5FfQ=;
	b=DWQ1J5MlzTQ94Y0n0OO7Z1k7Le0h4M8kQwFO1VmVjS+zwCUge3QJvVD7ZdKJueGTzl
	uLRS4QTHkME9Hx28KtxOegshht2f8sI834rhtFUuLAWpAGgNHULXjiFXMqTwG9yTNdDD
	6juZF61QcK6FBsLdNlIsB/rdY30jUKiCfGmDfq+QVS3Ok1Dra7QY6K4ncMAL6Iuib6Pi
	HmYnRNeiYN9MFheciaKDiON3Ln+zh8pfg4DG3lrXvXG37laufo3aWz+HE5ajl5PXAzwL
	roB2PzOzCun0l6LchHqj05CtQ9lDV5XWa2x7AuinCLjZLffYjO5OMw5iGKXwrEGyhfZM
	VbQw==
X-Gm-Message-State: APzg51DEL6TW3CEibqBK8BXD8/5JI813ll1Mk/CqQpyGfmODAoFc/hLX
	HgPBjnyEhEqg01jNCAtvocmsM8VG
X-Google-Smtp-Source: ANB0VdbZfZh2ECEBKpVJf4t5WdgZLo8i9pbXCA9cf1V+1lS+enb/+xUpD1v2OWuXQpuyDleyBNHHGA==
X-Received: by 2002:adf:8367:: with SMTP id
	94-v6mr3625402wrd.258.1534717000566; 
	Sun, 19 Aug 2018 15:16:40 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i1-v6sm6260495wrq.69.2018.08.19.15.16.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 19 Aug 2018 15:16:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Aug 2018 22:16:03 +0000
Message-Id: <e9aa618bae130ed50a932c968443e4512aa78a40.1534716156.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1534716156.git.Martin.Jansa@gmail.com>
References: <cover.1534716156.git.Martin.Jansa@gmail.com>
Subject: [PATCH 6/6] kernel.bbclass: rename type variable to imageType
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
X-List-Received-Date: Sun, 19 Aug 2018 22:16:40 -0000

* to avoid confusion with "type" command in shell

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass | 58 ++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 3c8aa5911f..6b734be2b6 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -235,31 +235,31 @@ do_bundle_initramfs () {
 		copy_initramfs
 		# Backing up kernel image relies on its type(regular file or symbolic link)
 		tmp_path=""
-		for type in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
-			if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
-				linkpath=`readlink -n ${KERNEL_OUTPUT_DIR}/$type`
-				realpath=`readlink -fn ${KERNEL_OUTPUT_DIR}/$type`
+		for imageType in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
+			if [ -h ${KERNEL_OUTPUT_DIR}/$imageType ] ; then
+				linkpath=`readlink -n ${KERNEL_OUTPUT_DIR}/$imageType`
+				realpath=`readlink -fn ${KERNEL_OUTPUT_DIR}/$imageType`
 				mv -f $realpath $realpath.bak
-				tmp_path=$tmp_path" "$type"#"$linkpath"#"$realpath
-			elif [ -f ${KERNEL_OUTPUT_DIR}/$type ]; then
-				mv -f ${KERNEL_OUTPUT_DIR}/$type ${KERNEL_OUTPUT_DIR}/$type.bak
-				tmp_path=$tmp_path" "$type"##"
+				tmp_path=$tmp_path" "$imageType"#"$linkpath"#"$realpath
+			elif [ -f ${KERNEL_OUTPUT_DIR}/$imageType ]; then
+				mv -f ${KERNEL_OUTPUT_DIR}/$imageType ${KERNEL_OUTPUT_DIR}/$imageType.bak
+				tmp_path=$tmp_path" "$imageType"##"
 			fi
 		done
 		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
 		kernel_do_compile
 		# Restoring kernel image
 		for tp in $tmp_path ; do
-			type=`echo $tp|cut -d "#" -f 1`
+			imageType=`echo $tp|cut -d "#" -f 1`
 			linkpath=`echo $tp|cut -d "#" -f 2`
 			realpath=`echo $tp|cut -d "#" -f 3`
 			if [ -n "$realpath" ]; then
 				mv -f $realpath $realpath.initramfs
 				mv -f $realpath.bak $realpath
-				ln -sf $linkpath.initramfs ${B}/${KERNEL_OUTPUT_DIR}/$type.initramfs
+				ln -sf $linkpath.initramfs ${B}/${KERNEL_OUTPUT_DIR}/$imageType.initramfs
 			else
-				mv -f ${KERNEL_OUTPUT_DIR}/$type ${KERNEL_OUTPUT_DIR}/$type.initramfs
-				mv -f ${KERNEL_OUTPUT_DIR}/$type.bak ${KERNEL_OUTPUT_DIR}/$type
+				mv -f ${KERNEL_OUTPUT_DIR}/$imageType ${KERNEL_OUTPUT_DIR}/$imageType.initramfs
+				mv -f ${KERNEL_OUTPUT_DIR}/$imageType.bak ${KERNEL_OUTPUT_DIR}/$imageType
 			fi
 		done
 	fi
@@ -365,10 +365,10 @@ kernel_do_install() {
 	#
 	install -d ${D}/${KERNEL_IMAGEDEST}
 	install -d ${D}/boot
-	for type in ${KERNEL_IMAGETYPES} ; do
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} ${D}/${KERNEL_IMAGEDEST}/${type}-${KERNEL_VERSION}
+	for imageType in ${KERNEL_IMAGETYPES} ; do
+		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
 		if [ "${KERNEL_PACKAGE_NAME}" = "kernel" ]; then
-			ln -sf ${type}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${type}
+			ln -sf ${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}
 		fi
 	done
 	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
@@ -640,10 +640,10 @@ do_sizecheck() {
 			die "Invalid KERNEL_IMAGE_MAXSIZE: ${KERNEL_IMAGE_MAXSIZE}, should be an integer (The unit is Kbytes)"
 		fi
 		at_least_one_fits=
-		for type in ${KERNEL_IMAGETYPES} ; do
-			size=`du -ks ${B}/${KERNEL_OUTPUT_DIR}/$type | awk '{print $1}'`
+		for imageType in ${KERNEL_IMAGETYPES} ; do
+			size=`du -ks ${B}/${KERNEL_OUTPUT_DIR}/$imageType | awk '{print $1}'`
 			if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
-				bbwarn "This kernel $type (size=$size(K) > ${KERNEL_IMAGE_MAXSIZE}(K)) is too big for your device."
+				bbwarn "This kernel $imageType (size=$size(K) > ${KERNEL_IMAGE_MAXSIZE}(K)) is too big for your device."
 			else
 				at_least_one_fits=y
 			fi
@@ -666,9 +666,9 @@ kernel_do_deploy() {
 		mkdir "$deployDir"
 	fi
 
-	for type in ${KERNEL_IMAGETYPES} ; do
-		base_name=${type}-${KERNEL_IMAGE_NAME}
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} $deployDir/${base_name}.bin
+	for imageType in ${KERNEL_IMAGETYPES} ; do
+		base_name=${imageType}-${KERNEL_IMAGE_NAME}
+		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $deployDir/${base_name}.bin
 	done
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		mkdir -p ${D}/lib
@@ -676,18 +676,18 @@ kernel_do_deploy() {
 		ln -sf modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
 	fi
 
-	for type in ${KERNEL_IMAGETYPES} ; do
-		base_name=${type}-${KERNEL_IMAGE_NAME}
-		symlink_name=${type}-${KERNEL_IMAGE_LINK_NAME}
+	for imageType in ${KERNEL_IMAGETYPES} ; do
+		base_name=${imageType}-${KERNEL_IMAGE_NAME}
+		symlink_name=${imageType}-${KERNEL_IMAGE_LINK_NAME}
 		ln -sf ${base_name}.bin $deployDir/${symlink_name}.bin
-		ln -sf ${base_name}.bin $deployDir/${type}
+		ln -sf ${base_name}.bin $deployDir/${imageType}
 	done
 
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
-		for type in ${KERNEL_IMAGETYPES} ; do
-			initramfs_base_name=${type}-${INITRAMFS_NAME}
-			initramfs_symlink_name=${type}-${INITRAMFS_LINK_NAME}
-			install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}.initramfs $deployDir/${initramfs_base_name}.bin
+		for imageType in ${KERNEL_IMAGETYPES} ; do
+			initramfs_base_name=${imageType}-${INITRAMFS_NAME}
+			initramfs_symlink_name=${imageType}-${INITRAMFS_LINK_NAME}
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${initramfs_base_name}.bin
 			ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
 		done
 	fi
-- 
2.17.1


