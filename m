Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9507279216
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 22:16:38 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g33-v6so1357106wrd.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 15:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TjLPzPVndCFETcZFXiVel2Abd9cpQqwBFOPFk0nzQQ0=;
	b=siE0uBDmJzFEqNv4FjYhNTmOoRF6OuDTjbD//Xr1ia3gempW//5iMNc49CogSrCN0Q
	9zOyNwIvlNVxH3Sk/nzrH6zeHBs4VjtNQKNefFPhaUFM/JDocKel0gt4ZnCPJvWuOw7q
	4KNQV1Jkwm+0rH47rUEUZe0LPz7rfe0NJtewlCmrAnBNJJH1EnkOiGpPYj4GW+M6kclu
	CQp+qhCbSatL9qSy3a5svFi3ThnH82BopxSS6H0uGwasQRjeyDF5LbhWLZeJzwZ5gXOM
	yLVJgi2Rwv6ySbie+3J4FyG3p+gPa1+noJwstF55q0rBROSgcISZGnNmd3zBa7tATjxW
	FPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TjLPzPVndCFETcZFXiVel2Abd9cpQqwBFOPFk0nzQQ0=;
	b=HymuwQk5zcf6DuC1Lu/w4r+ukvK4lGW7G/y8+oozR6RSHXaqvkJpuP5ddmCSBUpJBR
	SIFwRZqbxj2iaCowqn/3MmW/fepqsL8M2vB9L9xAnzuQ4K7K9Sh0bgypcHvX1Ekkjgru
	dmstKNNWqFFdSgmo9XqFQDGb9PN7fPC06YJIBPy0+Y+krR110xYyoK+qN1tewdZM/65P
	IDvG4lSoqt9qpLotH6dfx196afe+pZarBMnG2F0AyRZYyHkQRbLWxJI2s3I3Vk92u6+v
	p2ZbsHGPEaAdSHsYBDh4T2Epc/PF9BQXvPiEhKYL9s3SkJeaYujcISCQPqi7R6hMzI6n
	nNfg==
X-Gm-Message-State: AOUpUlGCz2d4cK9G9ibCpY7fWyF0S/5Uqepc65KFiv9QMnE4zn22Fm6z
	MxMemkLbNtGVEZTsVdJlU5dX/Vtc
X-Google-Smtp-Source: AA+uWPxBNjMl8JsOoubFFlh/kqtcy+QigpfrDAnCEEnh+UvWhzrgTcNBPnMdmQFDQgHdEOisIWbvvA==
X-Received: by 2002:adf:97d3:: with SMTP id
	t19-v6mr9563682wrb.283.1534716999393; 
	Sun, 19 Aug 2018 15:16:39 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o6-v6sm7072525wmc.15.2018.08.19.15.16.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 19 Aug 2018 15:16:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Aug 2018 22:16:02 +0000
Message-Id: <a1ce137299303cd31ffb7ebd2344a24c469209f2.1534716156.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1534716156.git.Martin.Jansa@gmail.com>
References: <cover.1534716156.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/6] kernel-artifact-names.bbclass: Add 2 more variables to make it easier to change all names with one variable
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
X-List-Received-Date: Sun, 19 Aug 2018 22:16:39 -0000

* some people don't like the ${MACHINE} in the symlink, because now the DEPLOYDIR already
  contains ${MACHINE} subdirectory, add KERNEL_ARTIFACT_LINK_NAME variable to change it
  in one place without the need to list all variables for various artifacts

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-artifact-names.bbclass | 23 ++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/meta/classes/kernel-artifact-names.bbclass b/meta/classes/kernel-artifact-names.bbclass
index d21450c914..bbeecba7bd 100644
--- a/meta/classes/kernel-artifact-names.bbclass
+++ b/meta/classes/kernel-artifact-names.bbclass
@@ -1,15 +1,18 @@
-KERNEL_IMAGE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
-KERNEL_IMAGE_LINK_NAME ?= "${MACHINE}"
+KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
+KERNEL_ARTIFACT_LINK_NAME ?= "${MACHINE}"
 
-KERNEL_DTB_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
-KERNEL_DTB_LINK_NAME ?= "${MACHINE}"
+KERNEL_IMAGE_NAME ?= "${KERNEL_ARTIFACT_NAME}"
+KERNEL_IMAGE_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
 
-KERNEL_FIT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
-KERNEL_FIT_LINK_NAME ?= "${MACHINE}"
+KERNEL_DTB_NAME ?= "${KERNEL_ARTIFACT_NAME}"
+KERNEL_DTB_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
 
-MODULE_TARBALL_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
-MODULE_TARBALL_LINK_NAME ?= "${MACHINE}"
+KERNEL_FIT_NAME ?= "${KERNEL_ARTIFACT_NAME}"
+KERNEL_FIT_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
+
+MODULE_TARBALL_NAME ?= "${KERNEL_ARTIFACT_NAME}"
+MODULE_TARBALL_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
 MODULE_TARBALL_DEPLOY ?= "1"
 
-INITRAMFS_NAME ?= "initramfs-${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
-INITRAMFS_LINK_NAME ?= "initramfs-${MACHINE}"
+INITRAMFS_NAME ?= "initramfs-${KERNEL_ARTIFACT_NAME}"
+INITRAMFS_LINK_NAME ?= "initramfs-${KERNEL_ARTIFACT_LINK_NAME}"
-- 
2.17.1


