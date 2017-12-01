Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id C7FE771AB5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 21:53:25 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id y21so11481417wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Dec 2017 13:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5833CwuyS2hQltZ/odLxRfmnCMxW7Eg3KC7janJ7klE=;
	b=bswb0tHpchinQNPgJH5IoD7qZ+pkut0jSyLFH+c918JT1JYMb6htYCRziGKC/bed9u
	gyS9k5N+LRqsxvyWEinq/pC037EHHNaHEfAbutoRWl1eZU1/SrxA5k0dV7hQl1Ry/UaN
	jywQS6VbwtPdOV4XVSr/rNxTOB4bKCiUzCQtWBqdTXBO7QaD2xffJHA7Y4Z/9Z7x0Fp4
	TvazokaQ2Txkt0oOk9ghZJ/iuO9Ph0Qe1ZMO45A8r//3Sn5O7Ohumy1Pv+RMorRKkq89
	EOcD+VzvwlPQH8nIuhy6cDrqpREpEHDuf3+vYrDbl7tPyfwIxL/edD9hzejXyRxQzcFr
	FH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5833CwuyS2hQltZ/odLxRfmnCMxW7Eg3KC7janJ7klE=;
	b=Xwj/PHmFVhkkWKyslvKwRaZF6IqX7rLii9Xya+nRxQphZwGiF1w9Gt+0HxWHb49JHq
	5MsHzV1E361RimfRlETatv1SjbqrofuNSE1Z6nlWEv/qc5gVTMgh5ht9Lmp/X3r7Mubo
	eUvm0oQifX+4hKjV6u/wci2TDOREiWeMaKKxiWhtgLl8HNGdIxO3lsm8TW+zC8SkUxrt
	eLoDa/O1jGQ6YCiKdDHQNMH85GRHbPtgWLdMOswEMhZEZIs9wyVXEAzkkAERTrILUaoB
	nqAYLKsBU8RoRj/ej5KU2yJuoj9m6JPDYcaU+0hkvOkTAPZ0j4NsCGc8UvlyM19QEQS5
	GLNQ==
X-Gm-Message-State: AJaThX7IO82LFBqRRe6FJdLL3TOVFwvsmzybxhzNRSb4y4h64llmOmY2
	2UDgfv6JJBFTZfMiw6d8Qacffw==
X-Google-Smtp-Source: AGs4zMYo/nwFCRYpLvv0+PRXnOvRGcnPfA+0QVcb5ySvX2sKh0QbDYnLkzX5plnMqWI/zcPI0NNSEA==
X-Received: by 10.223.188.81 with SMTP id a17mr6766027wrh.146.1512165206316;
	Fri, 01 Dec 2017 13:53:26 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x133sm2344729wmd.44.2017.12.01.13.53.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Dec 2017 13:53:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Dec 2017 21:53:21 +0000
Message-Id: <1512165201-51-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CA+chaQe+qJCwz3dyYh51Pr8Gum5L0wt3VDqrTxs+a36cbOyzYQ@mail.gmail.com>
References: <CA+chaQe+qJCwz3dyYh51Pr8Gum5L0wt3VDqrTxs+a36cbOyzYQ@mail.gmail.com>
Subject: [PATCH] initramfs-module-install: Remove allarch and FILESEXTRAPATHS
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
X-List-Received-Date: Fri, 01 Dec 2017 21:53:26 -0000

* files is already included in default FILESPATH
* it cannot inherit allarch as it RDEPENDS on bunch of TUNE_PKGARCH packages
* use the same COMPATIBLE_HOST restrictions as grub has to prevent ERRORs in
  bitbake world
  ERROR: Nothing RPROVIDES 'grub' (but oe-core/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb RDEPENDS on or otherwise requires it)
  grub was skipped: incompatible with host arm-oe-linux-gnueabi (not in COMPATIBLE_HOST)
  grub was skipped: incompatible with host arm-oe-linux-gnueabi (not in COMPATIBLE_HOST)
  NOTE: Runtime target 'grub' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['grub']
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../initrdscripts/initramfs-module-install-efi_1.0.bb             | 3 ---
 meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb   | 8 +++++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
index 24b53a8..1e7f76f 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
@@ -5,9 +5,6 @@ RDEPENDS_${PN} = "initramfs-framework-base parted e2fsprogs-mke2fs dosfstools ut
 
 PR = "r4"
 
-inherit allarch
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 SRC_URI = "file://init-install-efi.sh"
 
 S = "${WORKDIR}"
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
index ce7f165..02b69f3 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
@@ -3,11 +3,13 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS_${PN} = "initramfs-framework-base grub parted e2fsprogs-mke2fs util-linux-blkid"
 
-PR = "r1"
+# The same restriction as grub
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
+COMPATIBLE_HOST_armv7a = 'null'
+COMPATIBLE_HOST_armv7ve = 'null'
 
-inherit allarch
+PR = "r1"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 SRC_URI = "file://init-install.sh"
 
 S = "${WORKDIR}"
-- 
2.7.4


