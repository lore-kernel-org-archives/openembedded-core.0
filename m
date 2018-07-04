Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 215F678ABD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 07:59:31 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id a12-v6so4326540wro.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2018 00:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mWEwVq0l6IbaGayHy2TOhRbFSxR1A1dPt4eLQKfrpF0=;
	b=GcI3niWeA3A6wj2+7FPXPUQLKPeaxclsy2N7q2YUmZfKSQV1ZgW7y7LeGacdmktx3n
	uefUMrOuGv8u4poyLFi6m0zQq6xR1cGlU/PqaJsrIKUkytHNbCHFjKTocXbLEdklS4KS
	kgqLm04mwxCDYQ1rqBob1EnAbGEgcZi7ZHkbFH5b/xMudNfGDe8GKpOxJiTrHL/jw4xS
	Kpx4uUoalchvdp1+FY2B+6hJvhDx8pdYCoxMkKlvHDpGMl9MeZ3JL6j3FX0Iz+Vd9w9Y
	1YYWCvSpV/GyWD+dCyUFL+u7mFGQHc5i3lhPI2vaF9yffqTjU4TBGlIIsXXK3B7tTXdx
	NyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mWEwVq0l6IbaGayHy2TOhRbFSxR1A1dPt4eLQKfrpF0=;
	b=WCDwWyLsXLXMynjlDowqbxqULL4SDLF3lg4wzPMBjwfSi0GtwCLCTKKoWkCE3UVEbb
	yVfTvaVhiDQhfGm6hfUdBJC7NA8/yYTYW1GdKwwKVjYd9b+uNxI/NeZCMG9j7PQ8WSxP
	OUfe5mDNQ+1E5E4+GKAb3o+06q4TcSOPqzJQUBdNuxq+mFYTGLsLed7uJRS8kk/hDDKi
	cR/jaZIBfQF4KPG1Uw0EY1uLonXJl3kCykV1c4o/p+jVe//5vzy5s8psUdos96NB4ECU
	Q9s/L3/XUfWxgffvK3b5tQmg0r49l3zRveLBxH58JFWxZfMFwszY8xFVgsiL4oQPD7X7
	dcgA==
X-Gm-Message-State: APt69E3Q9BOGqKKzcL4+5tfW9eVceWJommWcNGpRBaEalzNNSrTrM9p0
	k4GM+BA9N41my85BNeonsG7FAA==
X-Google-Smtp-Source: AAOMgpeOAZET4/t1Rz7XCPgomZBXhUdG/ZuIA7HfYItfCDD3PSfQk/bNSfQvSFsDDQblI/OzPTYx6A==
X-Received: by 2002:adf:982c:: with SMTP id v41-v6mr747608wrb.72.1530691172580;
	Wed, 04 Jul 2018 00:59:32 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	t9-v6sm2520802wmh.41.2018.07.04.00.59.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Jul 2018 00:59:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2018 07:59:23 +0000
Message-Id: <20180704075924.24065-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180704075924.24065-1-Martin.Jansa@gmail.com>
References: <CA+chaQd9otpzozM5DrifBUVdODogBsVdy2U8czAAd+Ys_6TBtA@mail.gmail.com>
	<20180704075924.24065-1-Martin.Jansa@gmail.com>
Subject: [PATCHv3 3/4] kernel.bbclass: use the consistent naming schema for initramfs
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
X-List-Received-Date: Wed, 04 Jul 2018 07:59:32 -0000

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


