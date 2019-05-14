Return-Path: <liu.ming50@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id C0D2E7DE68
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 18:31:56 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id g57so239522edc.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 11:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=I77hqNKmAA3zrFQICUootNWoFGAEBrBIzcnEBGf7MVs=;
	b=Vr295OxEkaG4YoxJ+pfeGaPAfA3/9cjUnODEGdXI26x0qfYQeBphRJ6047GdHVenpT
	81jQZZE22Eu8CD7qHmhtOD6DVIse3Xd+nt9vdo+7DpplsU/33MIo0qwt2vbDEuFXMiEd
	bbH5rHeSyWoTsPLL0YVyJjwJwMGtUcrs11jW8ioxgv4GGW1oLRcheKeX9hBJ1pYdDbqO
	CLxKRZQI1RZ1q19aBO1QNKrC0Sd26ftKUF5NbYWZtTSGqvumW5LQ4/PnMSbmuq+fIr0q
	xM8z2zpQH8zrM/9GywrNeiYZhkXpLR0qW2NMnGKe5KNprlnN9xYBSCJTAGz7fHdAOWjP
	vr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=I77hqNKmAA3zrFQICUootNWoFGAEBrBIzcnEBGf7MVs=;
	b=V00tE3jWsdVRCYAURlJlHFqNGJ1/PocR97NwYZqLCuq4GYtRTmoDxLlSlyI7YMk8mQ
	2hw0GKunJ8DLMsxHT/GuUwSrfii/bwO3pCJmtVx0ZqZ32G489b339u6P4hyYEDw6JReG
	DgDyb0wa4q5aI5kuVJiGaVzEjVIq+hIeJ0Wk9/RszYF2SeRo2WZGfB1T/r5VDhI8Luxf
	Ujhu2/WbutAcEDnM/RHQNd55IAscmxR7v2lOKQS8f0ReHIjlzKIGdJKDkyS5OzblE29P
	kR6i+KN46mcRRInC94J7G/CAB4u9kLnn3Hu+Rssylw/ySwDgj/k5yXgVsjpR19NrtS4B
	XXsw==
X-Gm-Message-State: APjAAAWdkJ4dvMS4YH24lCj1tk6vkTloVJgmSOZT1VUFnls1/BMHUPqu
	bF1HQOxRQUEky3JA58nwjAtH8jGkEbkUfQ==
X-Google-Smtp-Source: APXvYqyHqTQ0I/XG20aDzLsvh1IxRq3F3wZLgTS22IyvdHim9HYT3yIZ86rSA3lBwjTnv9GH+KhtuQ==
X-Received: by 2002:a50:908a:: with SMTP id c10mr37690774eda.226.1557858717275;
	Tue, 14 May 2019 11:31:57 -0700 (PDT)
Received: from peterliu-Precision-M4800.toradex.int
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id d4sm853661edk.46.2019.05.14.11.31.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 May 2019 11:31:56 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2019 20:31:50 +0200
Message-Id: <1557858710-2880-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] kernel.bbclass: adjust a condition checking
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
X-List-Received-Date: Tue, 14 May 2019 18:31:57 -0000

From: Ming Liu <liu.ming50@gmail.com>

do_bundle_initramfs does not have to depend on
${INITRAMFS_IMAGE}:do_image_complete if INITRAMFS_IMAGE_BUNDLE is not
set.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b346a60..437b8c7 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -95,7 +95,8 @@ python __anonymous () {
         d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
 
     image = d.getVar('INITRAMFS_IMAGE')
-    if image:
+    image_bundle = d.getVar('INITRAMFS_IMAGE_BUNDLE')
+    if image and bb.utils.to_boolean(image_bundle, False):
         d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
 
     # NOTE: setting INITRAMFS_TASK is for backward compatibility
-- 
2.7.4


