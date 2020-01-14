Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 39B677FC32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 09:12:40 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p17so12791389wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 01:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=5h6Je01UjSOHT51HlalcvRTTtUdWGsSJBBo/5LvG8o8=;
	b=X0vFRwav2GKWp/uMciSPEWHecMAZroD2dgcrGLyfgI9JRSz4FOGYAPULQQr0g5TuQE
	HF57q486iVGnNqCm+836uRqaVGAPh7IM28Yjo0I2H8B1snHhDkcz6vTUJaFGdcJdhncM
	2pqW7JsEPanOiAloqvRBY8jTVL2sWGacF5Uh46eFvQh210e0x9Qs48Ejlqlg1cCQ8L/Y
	TzsWPq7pReA0DKIKS8cAYRoJZ9MrL5abiuadyMD4yp97v/ZVenWu1JIpXVwb1xx0ED5K
	i7Cqc4ddlaSQdGN1f2ukCJt5CHraBE2mJccF14NM5ZetBYNJ089ldrSWd16WFXZgoQKw
	+GhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5h6Je01UjSOHT51HlalcvRTTtUdWGsSJBBo/5LvG8o8=;
	b=hgVH7iUPGwwmbkElMuwU12h90SMdQKSChE6Aw+Z5KEnUlbtX+E8C+s9jG1x4SuXKTM
	XEgqp/KR3dsUTWOitjg+eMl+pYRuGNyIQ0YbarJJm2qbytYH0PK31jwrAsC28P1+lHMY
	KVIjSq/bPKtA6iOOBDxDLUlFEontx71gqNuP8kmU4/5g1OUICn0y50OB7TfASJ852Pl5
	LAB5aqB1XBQpXzzPGapKO5wm/FJL1NQ5Rx7kk3FAQkviSXuEN7r9ZeHY6pRL2V+1Jo7S
	A/twQ60ILMOMdjokgWH9X6hlvLp7mZO8zipyJTnjdQ4oM1NwEQo9GKS3CJ6iXZNaz0rX
	UfnQ==
X-Gm-Message-State: APjAAAVadLLkwGnO1lGY2yzIxfqHja/n8HgEfpfvkitFQdLVh0MfmFcD
	mFl3g+biis4eKv1k2SnOL6p3bsMmTYg=
X-Google-Smtp-Source: APXvYqzHcAbNB0M6U6+dLpwxXNNiays3JaRrpMQAPpzR9OMRBP2Gk60fXtm4M7yP6Tluxz1H7NmdRw==
X-Received: by 2002:a1c:541b:: with SMTP id i27mr26748325wmb.137.1578993160653;
	Tue, 14 Jan 2020 01:12:40 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	r15sm17707357wmh.21.2020.01.14.01.12.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 01:12:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 10:12:23 +0100
Message-Id: <602388b1bdb47c3cbe72f8ec9cf65c54f4ad1976.1578993027.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1578993027.git.Martin.Jansa@gmail.com>
References: <cover.1578993027.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCHv5 4/8] kernel.bbclass: imageType without {}
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
X-List-Received-Date: Tue, 14 Jan 2020 09:12:40 -0000
Content-Transfer-Encoding: 8bit

* just to make sure it looks like bash variable not bitbake variable in
  run.do_* scripts

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 954b761094..ff5673fb56 100644
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
@@ -686,8 +686,8 @@ kernel_do_deploy() {
 	fi
 
 	for imageType in ${KERNEL_IMAGETYPES} ; do
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $deployDir/${imageType}-${KERNEL_IMAGE_NAME}.bin
-		ln -sf ${imageType}-${KERNEL_IMAGE_NAME}.bin $deployDir/${imageType}
+		install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$imageType-${KERNEL_IMAGE_NAME}.bin
+		ln -sf $imageType-${KERNEL_IMAGE_NAME}.bin $deployDir/$imageType
 	done
 
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
@@ -700,7 +700,7 @@ kernel_do_deploy() {
 			if [ "$imageType" = "fitImage" ] ; then
 				continue
 			fi
-			install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${imageType}-${INITRAMFS_NAME}.bin
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.initramfs $deployDir/$imageType-${INITRAMFS_NAME}.bin
 		done
 	fi
 }
@@ -718,7 +718,7 @@ kernel_do_deploy_links() {
 	fi
 
 	for imageType in ${KERNEL_IMAGETYPES} ; do
-		ln -vf $deployDir/${imageType}-${KERNEL_IMAGE_NAME}.bin $deployDir/${imageType}-${KERNEL_IMAGE_LINK_NAME}.bin
+		ln -vf $deployDir/$imageType-${KERNEL_IMAGE_NAME}.bin $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}.bin
 	done
 
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" -a -f $deployDir/modules-${MODULE_TARBALL_NAME}.tgz ] ; then
@@ -730,7 +730,7 @@ kernel_do_deploy_links() {
 			if [ "$imageType" = "fitImage" ] ; then
 				continue
 			fi
-			ln -vf $deployDir/${imageType}-${INITRAMFS_NAME}.bin $deployDir/${imageType}-${INITRAMFS_LINK_NAME}.bin
+			ln -vf $deployDir/$imageType-${INITRAMFS_NAME}.bin $deployDir/$imageType-${INITRAMFS_LINK_NAME}.bin
 		done
 	fi
 }
-- 
2.20.1


