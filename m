Return-Path: <liu.ming50@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0DE4D7FFB7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 15:32:57 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id u71so5218569lje.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 07:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1Ovss23GI2DEJ+2JBENORst793i4oimAIBLeHynN0Z0=;
	b=FVDvrhw7FF/92vVR301QwheEvjRH5wThLaLcWxytec2cntI6WhRXcSSjxENyka4SXd
	ggC+bPLcykJUmP7cPotFmdNtyYMdfJTtuK1pAXig/TKjINjgknAaBv1i/ZTysavFfEAL
	o0qTDx9tmpOAk9Xid9RhoYQEx1uIt5wamnsNDJs8yQoVvEg7OC/Ri8mqIodGiXRph1PR
	/6igMxeqJQ8OxyVIbv+XP6TlVgannOETOQQ6BQui8Nk/MSqyujjfYkDg/4B3ocEzHZiP
	0mwH8xpJySjDRwjk7yCjV9yc+UQj8xQV6NGC1bf9o7eOAsnBwarBV6MgF/eTF4cpp8qG
	UBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1Ovss23GI2DEJ+2JBENORst793i4oimAIBLeHynN0Z0=;
	b=npDHJlwG/kYwrFF/2j1BnfAugDC2ob31Zy4p1c6FfgHFDM0jENSzORsXhCg5CJSZyq
	M/rl+PnWSn83kCdOQX1/xCj3946Ibj2ICIhfPb6/muLcvRr9o9pYhhmQsIJclpPDJK4S
	UaRCAvlEXVA919cNeKKA3sOMG1vv8Q6V2FNZ0l/WSUnZKEBhY3YqdBTfD0wrY5lVem85
	jkFXiGh7H4VLkKY7w9+SmQYYa7grCx5rQc38ljOxdOLNeaZh2/3DgZzOKw3pffpIAcQF
	T+J5BT4Pk02FiaIqfx515UYbmfrB+5R+scRxNNBZObY8q9H8Le+iGRmhHSgyAmEfHNDZ
	3Lhg==
X-Gm-Message-State: APjAAAXjstBITcWh8vut+kQhVLt0u6OChP8WeNOicaT4bfrxgDh/ri56
	UwPynfgENiVHS0aOVVVrQeTLUkfgWLy+5w==
X-Google-Smtp-Source: APXvYqz5NgNG0f7/nlO7Rx7u2lQdFgKV+/vYExetGFydjN6ENo6RoBULGE9RpsBdFANn2mx/dgwLlQ==
X-Received: by 2002:a2e:8152:: with SMTP id t18mr5686170ljg.255.1578756778352; 
	Sat, 11 Jan 2020 07:32:58 -0800 (PST)
Received: from peterliu-Precision-7530.lan
	(c-75fd72d5.022-417-73746f13.bbcust.telenor.se. [213.114.253.117])
	by smtp.gmail.com with ESMTPSA id l7sm2835102lfc.80.2020.01.11.07.32.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 11 Jan 2020 07:32:57 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 Jan 2020 16:32:55 +0100
Message-Id: <1578756775-4327-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>, stefan.agner@toradex.com,
	simon.bueler@toradex.com
Subject: [PATCH] kernel: introduce two convenient variables
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
X-List-Received-Date: Sat, 11 Jan 2020 15:32:58 -0000

From: Ming Liu <liu.ming50@gmail.com>

Introduce KERNEL_INITRAMFS_BUNDLE_TYPES and KERNEL_INITRAMFS_FIT_TYPES
variables that a end user could override them easily in local.conf.

Drop the hard-coded initramfs image names, no functional changes.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel-artifact-names.bbclass | 3 +++
 meta/classes/kernel-fitimage.bbclass       | 2 +-
 meta/classes/kernel.bbclass                | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-artifact-names.bbclass b/meta/classes/kernel-artifact-names.bbclass
index bbeecba..63fdbbd 100644
--- a/meta/classes/kernel-artifact-names.bbclass
+++ b/meta/classes/kernel-artifact-names.bbclass
@@ -16,3 +16,6 @@ MODULE_TARBALL_DEPLOY ?= "1"
 
 INITRAMFS_NAME ?= "initramfs-${KERNEL_ARTIFACT_NAME}"
 INITRAMFS_LINK_NAME ?= "initramfs-${KERNEL_ARTIFACT_LINK_NAME}"
+
+KERNEL_INITRAMFS_BUNDLE_TYPES ?= "cpio cpio.gz cpio.lz4 cpio.lzma cpio.lzo cpio.xz"
+KERNEL_INITRAMFS_FIT_TYPES ?= "cpio cpio.gz cpio.lz4 cpio.lzma cpio.lzo cpio.xz ext2.gz"
diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index ec18a3d..386115a 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -412,7 +412,7 @@ fitimage_assemble() {
 	#
 	if [ "x${ramdiskcount}" = "x1" ] ; then
 		# Find and use the first initramfs image archive type we find
-		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz ext2.gz cpio; do
+		for img in ${KERNEL_INITRAMFS_FIT_TYPES}; do
 			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.${img}"
 			echo "Using $initramfs_path"
 			if [ -e "${initramfs_path}" ]; then
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 750988f..3f1fa4e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -199,7 +199,7 @@ copy_initramfs() {
 	mkdir -p ${B}/usr
 	# Find and use the first initramfs image archive type we find
 	rm -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
-	for img in cpio cpio.gz cpio.lz4 cpio.lzo cpio.lzma cpio.xz; do
+	for img in ${KERNEL_INITRAMFS_BUNDLE_TYPES}; do
 		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img" ]; then
 			cp ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img ${B}/usr/.
 			case $img in
-- 
2.7.4


