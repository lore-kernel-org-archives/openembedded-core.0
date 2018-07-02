Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 341AE786D4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 22:07:47 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id f16-v6so16938069wrm.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 15:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mWEwVq0l6IbaGayHy2TOhRbFSxR1A1dPt4eLQKfrpF0=;
	b=OobLgXs2FSDCEGp3hRH9MSeLaT00NVAhADD0XsMPWpgjR0wJUpO28VHnfqWIUROphN
	ybmF6xH9+Z5aTO5ZXYHwcHPClnRC8T0bNp0kr2uCNY1kGCl5AVp7a+SFK/9HLMHrJnqk
	Cx0SSvaQI3K/zf6uh1Wd5d1KKGVH3u6qk1wzPAuROFa0sWrkQDZSxNXenciC6nt/nqdA
	5mYxuAAUQVwUlRUbmGXYyySt7xihq8jCvEnWPaKUdhyuqtb1LS1EiZZj8RuCWg8gTtSv
	xF1NLE4HIu/mheuCc1jK9eyQPLZvXWNuvc2X484TpwLT43HlMNsT8Oav7C73IzDjb4Xi
	BmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mWEwVq0l6IbaGayHy2TOhRbFSxR1A1dPt4eLQKfrpF0=;
	b=o5Y4xy1l+yuXBhLLHEZgFMChy+uOq/Is9HCjX4IdLqwY1XOHvd0njDwf9Ml8/KnIL1
	WkpLLXTcGRqtS3hyaa2MobKypCdLoEw6PUGXdTOXeBJuLbCRlXczqNdkCLFtT6ZXeUuY
	h6x7ReBeZNY72OIENrNdKslxgIekMt3/Nv3x3J1pL1EtcKzsrm+yXhREFJbu6srTgqAU
	1Mv7sS2qCDpnCKIcLHGdZPBK8S07XB8bhsbX7QwdUk9J0g6cg7P4kEYXHtJxmShlBByb
	yLUVPKpIaXLc4zUYd25vw+EUOgLLIxibj40yZEGAdvE8uceQfhlWYmYSHjToVdsyBqC2
	yyTw==
X-Gm-Message-State: APt69E3HhJYPtl8YuXsqUO7OoBi2A41yPxgPxu/S10DZoYqPYb4HHSJY
	fPQ6vknWp7ioOfXiz+XUYvth7g==
X-Google-Smtp-Source: AAOMgpfPMzdC0XqUEwVT9z7mgRYY0HhEhHr4LGq4vEIuiotf6oOq9DChqaXZf5ewohHSP1pjHDZugw==
X-Received: by 2002:adf:e285:: with SMTP id
	v5-v6mr19651470wri.54.1530569267758; 
	Mon, 02 Jul 2018 15:07:47 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	74-v6sm17169760wmt.31.2018.07.02.15.07.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 02 Jul 2018 15:07:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jul 2018 22:07:43 +0000
Message-Id: <20180702220744.10881-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180702220744.10881-1-Martin.Jansa@gmail.com>
References: <CA+chaQd9otpzozM5DrifBUVdODogBsVdy2U8czAAd+Ys_6TBtA@mail.gmail.com>
	<20180702220744.10881-1-Martin.Jansa@gmail.com>
Subject: [PATCHv2 3/4] kernel.bbclass: use the consistent naming schema for initramfs
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
X-List-Received-Date: Mon, 02 Jul 2018 22:07:47 -0000

* use INITRAMFS_BASE_NAME and INITRAMFS_SYMLINK_NAME variables, like
  other kernel artifacts are using
* use "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}" instead of
  "${PV}-${PR}-${MACHINE}-${DATETIME}" to be consistent with other files
* allow to modify default symlink name with INITRAMFS_SYMLINK_NAME
  instead of currently used:
  initramfs_symlink_name=${type}-initramfs-${MACHINE}

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 7ce64fd19f..0045cec819 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -229,8 +229,6 @@ copy_initramfs() {
 	echo "Finished copy of initramfs into ./usr"
 }
 
-INITRAMFS_BASE_NAME ?= "initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}"
-INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
 do_bundle_initramfs () {
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
 		echo "Creating a kernel image with a bundled initramfs..."
@@ -673,6 +671,10 @@ MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
 MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
 MODULE_TARBALL_DEPLOY ?= "1"
 
+INITRAMFS_BASE_NAME ?= "initramfs-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
+INITRAMFS_SYMLINK_NAME ?= "initramfs-${MACHINE}"
+
 kernel_do_deploy() {
 	deployDir="${DEPLOYDIR}"
 	if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
@@ -697,17 +699,14 @@ kernel_do_deploy() {
 		ln -sf ${base_name}.bin $deployDir/${type}
 	done
 
-	cd ${B}
-	# Update deploy directory
-	for type in ${KERNEL_IMAGETYPES} ; do
-		if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
-			echo "Copying deploy ${type} kernel-initramfs image and setting up links..."
+	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
+		for type in ${KERNEL_IMAGETYPES} ; do
 			initramfs_base_name=${type}-${INITRAMFS_BASE_NAME}
-			initramfs_symlink_name=${type}-initramfs-${MACHINE}
+			initramfs_symlink_name=${type}-${INITRAMFS_SYMLINK_NAME}
 			install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}.initramfs $deployDir/${initramfs_base_name}.bin
 			ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
-		fi
-	done
+		done
+	fi
 }
 do_deploy[cleandirs] = "${DEPLOYDIR}"
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
-- 
2.17.1


