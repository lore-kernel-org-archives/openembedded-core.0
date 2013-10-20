Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id EC5676D1BD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 22:34:33 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e52so3233035eek.30
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 15:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=BgjUkHaDOQS8P/cs36qCQ/voWTNQ29IKG7f4CxYEbj0=;
	b=t06OASByVmSrPTlUYerW1EeWhau8Zxh/iPbELZolouRcdTlEL57zXpF2M/cG27rgWg
	79vkiOONKdddaRjHPrJ7GHqsYkeArwSVuD8y1JOD7tUImQ3H3vWTlswLE37G7aNfyA5K
	Y8nIoJYWfrErcNtKsZXN/vX7gDulXKDYW+xp2k4kKzmBRaXRrBQF/v0BCeUKWqHYHXPf
	11QfqU7ks/xbOPngCpqN6YCa+xW/KlJWZgQyj3CfRnE8qQ4xHVhhtGmc0MbXW/Eoj4fo
	48sl6+Y7drD/xQON8xYOLV4yjYPvFCw3PwTrvUxIiLqb71DbrLUI4hrrS2/EMldJRuwz
	vRCA==
X-Received: by 10.14.225.199 with SMTP id z47mr19000326eep.24.1382308475481;
	Sun, 20 Oct 2013 15:34:35 -0700 (PDT)
Received: from mizar.localdomain
	(host218-209-dynamic.16-79-r.retail.telecomitalia.it.
	[79.16.209.218])
	by mx.google.com with ESMTPSA id j7sm35752601eeo.15.2013.10.20.15.34.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Oct 2013 15:34:35 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2013 00:34:19 +0200
Message-Id: <a26f8d8bde9b637d568a9c19960f424d28f3474a.1382307169.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1382307169.git.andrea.adami@gmail.com>
References: <cover.1382307169.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1382307169.git.andrea.adami@gmail.com>
References: <cover.1382307169.git.andrea.adami@gmail.com>
Subject: [PATCH 1/5] image_types.bbclass: do not force --no-cleanmarkers for jffs2
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
X-List-Received-Date: Sun, 20 Oct 2013 22:34:34 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/image_types.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 9ead059..8693a8f 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -140,9 +140,9 @@ XZ_COMPRESSION_LEVEL ?= "-e -6"
 XZ_INTEGRITY_CHECK ?= "crc32"
 XZ_THREADS ?= "-T 0"
 
-IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -n ${EXTRA_IMAGECMD}"
+IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
 IMAGE_CMD_sum.jffs2 = "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
-	-o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 -n ${EXTRA_IMAGECMD}"
+	-o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}"
 
 IMAGE_CMD_cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
 
-- 
1.8.1.5


