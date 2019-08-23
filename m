Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1D9817F324
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 06:01:42 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t16so7486177wra.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 23:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XMO7A68KBNAEL+c3DwVvfyWzFgSoN3Rs5Fs5taNPzPc=;
	b=jWOIl4VgOJKfcoWGTnfvaIeYgasJ2nl/tsHVg2mhgj5kwuu+IUoyqlGO2fiHO7LcZK
	00lS4rDIFki6D36qTV/J0rWGufeVX/yMVlwljpQcCEjB8MgWX8l44SDX4qbR0f1f03t8
	0FEKg+tLcSWC5vjBlGrDWjkHugy+tkW1kLfJrWoN1eSgF2iD4uBvNp2ifvNE6rVuUvts
	pU0WZRQft32xfbZj6K+HCUgGF3gn8h4X7pWWFxP/vqOjQEap0eAmSGVM5O4r0VjxD8Y+
	4BJ8MEPK4USXEUREE+2/jzBtRuj+9wAaSHuNy8KlH1iBtainSl19Qz8AGDByHbZVXj9t
	Ah2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XMO7A68KBNAEL+c3DwVvfyWzFgSoN3Rs5Fs5taNPzPc=;
	b=ZpNGG/L0hza9In5QEfYvw3a0NrZNhMByOASmM45CimsPNE4sXGpYmr0G2jEPDS6xfg
	rz42vTz70v9XAKsbbXciZnPmT4HFfR5oZywxEJmJY4e6NEtDZ0Aegzdn/+Un7rTl0Aok
	/Y8MZK+0Kidfpw8yxdHx9wKxCE28BmqkAWvpnypX71iyOMAGsQfRS/RqEftKQjwYNjJ4
	BJjvNWQGd0esO9s+klHZ1n2MQto4/p5qOpOFSoltagO3VdOG2r50ZRiPB6BsQ7yuKLj+
	rCGI1DMBLda06TFxt+301+iIkbpUm/oiLHOe4gKb0R4OoYTY31PtoQAsNr0fDGIhF93R
	EG0w==
X-Gm-Message-State: APjAAAW0BvKUKelgMAug2tEoTCl5/9GvjnwA3SqvKIjXX456YqW7lMcb
	cGgLDvph5xahkpuuuR5jI79ez+4oYLA=
X-Google-Smtp-Source: APXvYqyqYNtzbO8144+8rmnrC6s0keZjSb7cgLWz5RspQjPAbm5z/i678mz7l1H+ir0YwDs6U6/+nQ==
X-Received: by 2002:a5d:470c:: with SMTP id y12mr2872469wrq.136.1566540103462; 
	Thu, 22 Aug 2019 23:01:43 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id o8sm3885226wma.1.2019.08.22.23.01.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Aug 2019 23:01:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 06:01:33 +0000
Message-Id: <c3be3cec770701553f35cb7d813af246ff4e934a.1566540028.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1566540028.git.Martin.Jansa@gmail.com>
References: <cover.1566540028.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/6] kernel.bbclass: imageType without {}
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
X-List-Received-Date: Fri, 23 Aug 2019 06:01:43 -0000

* just to make sure it looks like bash variable not bitbake variable in
  run.do_* scripts

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index bd7f7131a4..8046a69d83 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -371,9 +371,9 @@ kernel_do_install() {
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
@@ -681,8 +681,8 @@ kernel_do_deploy() {
 	fi
 
 	for imageType in ${KERNEL_IMAGETYPES} ; do
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $deployDir/${imageType}-${KERNEL_IMAGE_NAME}.bin
-		ln -sf ${imageType}-${KERNEL_IMAGE_NAME}.bin $deployDir/${imageType}
+		install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$imageType-${KERNEL_IMAGE_NAME}.bin
+		ln -sf $imageType-${KERNEL_IMAGE_NAME}.bin $deployDir/$imageType
 	done
 
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
@@ -695,7 +695,7 @@ kernel_do_deploy() {
 			if [ "$imageType" = "fitImage" ] ; then
 				continue
 			fi
-			install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${imageType}-${INITRAMFS_NAME}.bin
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.initramfs $deployDir/$imageType-${INITRAMFS_NAME}.bin
 		done
 	fi
 }
@@ -713,7 +713,7 @@ kernel_do_deploy_links() {
 	fi
 
 	for imageType in ${KERNEL_IMAGETYPES} ; do
-		ln -vf $deployDir/${imageType}-${KERNEL_IMAGE_NAME}.bin $deployDir/${imageType}-${KERNEL_IMAGE_LINK_NAME}.bin
+		ln -vf $deployDir/$imageType-${KERNEL_IMAGE_NAME}.bin $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}.bin
 	done
 
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" -a -f $deployDir/modules-${MODULE_TARBALL_NAME}.tgz ] ; then
@@ -725,7 +725,7 @@ kernel_do_deploy_links() {
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


