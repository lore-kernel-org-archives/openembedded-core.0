Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id AA1007F363
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 17:17:03 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y8so2214872wrn.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 10:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mHfFwP3gPC6O/jBUKVaOsTdTM9bgsRpyVUsydT67pT0=;
	b=aZ1d3VueKjEljDUSCPmBsCqvhth82k6C61p5H6rXbrRGCn1od7Vol97t7RZ8Otvo0d
	vDyJXSfUjHoWIWQmyGklq4P3q+SglpL9OP07E+gQmoa9/JVKtHaqeFO1AkIPwmZJhs2W
	LOGwAxhFjvp5n47VQw1B44OPZcU63ePO8/L7UNNj7n5oSRZIMX5QZeY8RhbNOoA2dTmt
	eP6UVEKtsT0WqV1+sICdZzX7blMzy25Ynwy+/+RWOfyyWvUXrwDufS1xHis1Y5/qc/zK
	3Wx02pAxyrHP3Ec5JrnUQL2sYAvUVWI7UmD0hEqIUZzOuneN79gbg8A8vPuVW57OA1Ne
	AX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mHfFwP3gPC6O/jBUKVaOsTdTM9bgsRpyVUsydT67pT0=;
	b=mOrnrSB2VV2+vKRba/ITZL9iM+ddIRlgm4RHS7VbtZYyywqa32gamEChQ5rTwsHGte
	vGcZvh399cgZwDxf3DQXQVg9PvsTHNbjQguctM8vsPZk3RYXPOWqu8QyghTIEmaifbiF
	Nrk71Rkyza/6JUYfoa5+c64+BBzFk5BtMqEMnlvz6R5mxIocs/jUQ3/69o6cnVSo61It
	vFUJVGyEFtP0PMm2fRiJo31Dwwx/kxH33hTRleTRbfdKLMwN2knNUmmecBIrDon31ZGR
	xsIraFmHFdeLpcJE5PZfP/7RxKDrLN8g2JIRKRIXsYdgrTULaF7TGLDK6Okhkwch6Bu7
	B9jQ==
X-Gm-Message-State: APjAAAXt54G4QtjCsj0hILWjtG5pk0CK9MobRPPU+WXmuVnO3XFv5u4T
	v7Einaan/KX4jKC1nx21KFnl/z+Rep8=
X-Google-Smtp-Source: APXvYqz00T3rYsi4Yu7vH14NXybJla/jCGmf+VUwUndD+6zY+zNfjYcG+R9k2Yn8cTHFCXlovjz1RQ==
X-Received: by 2002:a5d:4448:: with SMTP id x8mr12654955wrr.119.1565975824145; 
	Fri, 16 Aug 2019 10:17:04 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	a19sm19212775wra.2.2019.08.16.10.17.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Aug 2019 10:17:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2019 17:17:00 +0000
Message-Id: <b286ebfb85d63036b16d653a24fa9ac09e668b4d.1565973637.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1565973637.git.Martin.Jansa@gmail.com>
References: <cover.1565973637.git.Martin.Jansa@gmail.com>
Subject: [RFC][PATCH 4/6] kernel.bbclass: imageType without {}
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
X-List-Received-Date: Fri, 16 Aug 2019 17:17:04 -0000

* just to make sure it looks like bash variable not bitbake variable in
  run.do_* scripts

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 0c82946fcc..bda3af2950 100644
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
-			ln -vf ${imageType}-${INITRAMFS_NAME}.bin ${imageType}-${INITRAMFS_LINK_NAME}.bin
+			ln -vf $imageType-${INITRAMFS_NAME}.bin $imageType-${INITRAMFS_LINK_NAME}.bin
 		done
 	fi
 }
-- 
2.17.1


