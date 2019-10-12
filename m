Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id E40D37F659
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 13:03:16 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j11so14705854wrp.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 06:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=j0Gfm8WtDw5K/LoDxkx+YYRyf6Nm+rIK84d//XvjC4k=;
	b=KTkbx83BBNx8pbTWBWjlV8LVDrPOtt/FERzlNA2x4dn4/ZJiCRE35qrXJhyiAO/V07
	g5rn9ux5mHHcVlZfNZ6y/xE9ZjxNchLn3JpMEZ+Y7R57tyut00Q/h7px2zX5LGzAcWxV
	AHPIkFQw797rJvLIiuRvfrHP880BDhuJrPbYA+vlrQLPLNnrs0hBgKXk23vcY3xQqgle
	4ekmt0QH/QjmWgEXzOyMQPoiehjw3HVzdeKDi7/HYYvviYzEwYqgdBzg3MyJQrsephsx
	U+jyD0EpSCKvHt1EXphOpjklukNZxWXQZFJPKtD642Gcp5xOHg5jQrzq/fnOc+f2RnzJ
	uBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=j0Gfm8WtDw5K/LoDxkx+YYRyf6Nm+rIK84d//XvjC4k=;
	b=o2Nezg22HhnR6Z/VqAnMoFAA7EZ/EQtjmQQRT2QnfzBJQZwcxo0IGmuQTQxGXjGryA
	K8NYOFoEC8MiHtdCdtB3gdSNH4g/gvaNiDluo92YAryv//phVkqIPQaYe+EMtwF1NHf9
	V1UiuSpE9I73U0/znV0c4CdcLY4byNS6XroBf0ih19nyI0eHmc1hNdinueoZ3C9wuE6A
	lBFfLcLzR12RiB0a0KRSezUdt9LNbFtzUYKa+xEUdGMtpl77hH7gzLZnJa6MzX/1EWtQ
	/KBQL8K148lc0xJM+5iNAJpCvYG40YJmefo8QVywDiKDOfDqaYF/9zhN9BOFLf0/pieT
	0YKg==
X-Gm-Message-State: APjAAAXqqLz9xfA9KBf3uUOW2FSokVG5ErHwzuMO1v4//uZg/qKVtivb
	8jYAoQ3p8pyyuA4suPhWLEKM6vS883U=
X-Google-Smtp-Source: APXvYqxDS8+nkzkhgaU960pkh8ljq+MTwSfc+zBNQ46MN+VVQOoGEM6EZ87dqr9zs5demdUW4IXdxA==
X-Received: by 2002:adf:c98b:: with SMTP id f11mr18459287wrh.274.1570885397270;
	Sat, 12 Oct 2019 06:03:17 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	q19sm26357219wra.89.2019.10.12.06.03.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 12 Oct 2019 06:03:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Oct 2019 13:03:10 +0000
Message-Id: <4b3e5643f8f0032df76ac97f4da43aa3c7163852.1570885333.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1570885333.git.Martin.Jansa@gmail.com>
References: <cover.1570885333.git.Martin.Jansa@gmail.com>
Subject: [PATCH][RESEND 4/6] kernel.bbclass: imageType without {}
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
X-List-Received-Date: Sat, 12 Oct 2019 13:03:17 -0000

* just to make sure it looks like bash variable not bitbake variable in
  run.do_* scripts

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index beced6fc6e..e8ee556f93 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -373,9 +373,9 @@ kernel_do_install() {
 	install -d ${D}/${KERNEL_IMAGEDEST}
 	install -d ${D}/boot
 	for imageType in ${KERNEL_IMAGETYPES} ; do
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
+		install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType ${D}/${KERNEL_IMAGEDEST}/$imageType-${KERNEL_VERSION}
 		if [ "${KERNEL_PACKAGE_NAME}" = "kernel" ]; then
-			ln -sf ${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}
+			ln -sf $imageType-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/$imageType
 		fi
 	done
 	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
@@ -683,8 +683,8 @@ kernel_do_deploy() {
 	fi
 
 	for imageType in ${KERNEL_IMAGETYPES} ; do
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $deployDir/${imageType}-${KERNEL_IMAGE_NAME}.bin
-		ln -sf ${imageType}-${KERNEL_IMAGE_NAME}.bin $deployDir/${imageType}
+		install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$imageType-${KERNEL_IMAGE_NAME}.bin
+		ln -sf $imageType-${KERNEL_IMAGE_NAME}.bin $deployDir/$imageType
 	done
 
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
@@ -697,7 +697,7 @@ kernel_do_deploy() {
 			if [ "$imageType" = "fitImage" ] ; then
 				continue
 			fi
-			install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${imageType}-${INITRAMFS_NAME}.bin
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.initramfs $deployDir/$imageType-${INITRAMFS_NAME}.bin
 		done
 	fi
 }
@@ -715,7 +715,7 @@ kernel_do_deploy_links() {
 	fi
 
 	for imageType in ${KERNEL_IMAGETYPES} ; do
-		ln -vf $deployDir/${imageType}-${KERNEL_IMAGE_NAME}.bin $deployDir/${imageType}-${KERNEL_IMAGE_LINK_NAME}.bin
+		ln -vf $deployDir/$imageType-${KERNEL_IMAGE_NAME}.bin $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}.bin
 	done
 
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" -a -f $deployDir/modules-${MODULE_TARBALL_NAME}.tgz ] ; then
@@ -727,7 +727,7 @@ kernel_do_deploy_links() {
 			if [ "$imageType" = "fitImage" ] ; then
 				continue
 			fi
-			ln -vf $deployDir/${imageType}-${INITRAMFS_NAME}.bin $deployDir/${imageType}-${INITRAMFS_LINK_NAME}.bin
+			ln -vf $deployDir/$imageType-${INITRAMFS_NAME}.bin $deployDir/$imageType-${INITRAMFS_LINK_NAME}.bin
 		done
 	fi
 }
-- 
2.17.1


