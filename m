Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25AC7C02196
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 22:57:28 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.55905.1738882640077668629
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 14:57:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pn+4viOF;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43634b570c1so10240995e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 14:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738882638; x=1739487438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7iD2MlcjQq8m+1Pf0zfao/O63G6kdcG83cOFMS+Zvrc=;
        b=Pn+4viOFs0PPgI0nsy7XOb+UBgmSsPhyl2ux7QTOP1sJBpNywIOaT96jGB+dtl1wGJ
         OVIxHKWJkspXj+Xida7Zpm//C/WAd4qNB79IZ/3WgI+VHA2PDiROZiUsXXcCkr97MYxI
         IIRZIc8ss2I1eAUJqB+SM9DsbUBhS3wpgX0wKWBUcuPSglOo5piSUMov5kpqc81hRFQo
         lAXct3DxQruhaU7yfiMTZ8UwN8yHcPgNt3rIvIZ/SpAm8Bybt1EB3b+XntW9xFwcIgOU
         cEMZFSOhnBKwwKI0vBs4CqRL6fTO60ZJMBgQppabWNJzwSyWudxVbi1ARI4pIqdNPZEW
         AiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738882638; x=1739487438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7iD2MlcjQq8m+1Pf0zfao/O63G6kdcG83cOFMS+Zvrc=;
        b=IZxtDWo7P9IJkP/JJwKnY/VbdOIc4iNjXmflwxB6PuZqyMqrS0gJUwUzOJhofchH3t
         HSTUPmm2yeTYsIUQTbAMZMrjj7veJ0j8tKRyawW3wB2zT3WGertiUZi0+VSYF5q9eXNX
         vPPjEBWq2JicNn2B3iCF5nQlEPpvQsGYFsuUmC79evZ/EKD33L1XzF6CifEwRpH6FxbJ
         ENoitFnAkr4Tm+q86enrXFQiXLHf5eKRxuM5jyZlYs5vaiI9uct+U9u/xKzwgUytaEa1
         pJq4IKT2RMNPacqkoLoSTMDhOIAxPL3DsXZnWwB+DMOCmcN1fk9j38Uy4TNySUkY22Rh
         FbxA==
X-Gm-Message-State: AOJu0YyAgP1487eDpWVS5Htg67gvb4X3AhESkCYwIfEBQIFt7Q19sLmU
	5dvtcHszG5evccSHPxKomDd0D1FHKNGUoalYBZOaOYGMWT6hUJbFqkZMDQ==
X-Gm-Gg: ASbGncuQUnjLo3ZbsxQtEmCesvrLqV8FrStDoL9nZBg8P9ZaYPpjMZ+YH1MATM/nuoG
	GbDuTKUbx2zaCuTuqo8Vxhxhe1ZGq4BdDdsIexV6GLmYWoUzv5OCmsSoCi2ntM5RNHJObWMMcfs
	FQINtQytWNEI8XTGG53fOBpivSvMUxVyPq7zzbDY+o3yH9bdHsteJdj3G5e/xAFR20QYwGPoOyB
	Rc2Q80yvze+juA4OZaCUw9D2lT9vQsiBmCljC/hgV0wISbqgGaloyyw56UGKtLUYUhTjm9yYYZ2
	5uOGAcfYYfI+xIkkVfHznu3YK90Y2Rf00D5AFw==
X-Google-Smtp-Source: AGHT+IEmrXCyzzi/Ez/MfbW/uxqJpjy6kFxQ3xGIHlbkdRGD1jJcZghffxNrnmOfOiZ9zlT+srBvuw==
X-Received: by 2002:a05:600c:1c9f:b0:436:1c0c:bfb6 with SMTP id 5b1f17b1804b1-439249c0324mr7904285e9.27.1738882637855;
        Thu, 06 Feb 2025 14:57:17 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d896d70sm68737535e9.0.2025.02.06.14.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:57:16 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/4] kernel-fitimage.bbclass: do not use the UBOOT_ENV variable
Date: Thu,  6 Feb 2025 23:56:05 +0100
Message-ID: <20250206225654.1660760-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206225654.1660760-1-adrian.freihofer@siemens.com>
References: <20250206225654.1660760-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 22:57:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210964

The kernel-fitimage.bbclass evaluates the UBOOT_ENV variable from the
u-boot recipe. Based on this variable an u-boot script might be added to
the fitImage. However, the UBOOT_ENV variable is also used to install
the script as an old u-boot image, usually named boot.scr into the /boot
directory of the target device. This dual usage of one variable leads to
several strange side effects. Some examples:
- If UBOOT_ENV_SUFFIX is set to the default value scr, the boot.cmd
  script gets added as a legacy uImage to the fitImage. That does not
  look useful.
- If the UBOOT_ENV_SUFFIX is set to e.g. txt the script is not converted
  into a legacy uImage and a usable plain text script gets added to the
  fitImage. But the same script ends up redundant in /boot.
  Another strange detail is that the UBOOT_ENV_BINARY gets set to e.g.
  boot.txt for this configuration.
- Appending the script to the u-boot recipe and then hand it over to the
  kernel recipe via the staged /boot directory looks like over
  complicated. Such kind of over complications and u-boot kernel
  inter-dependencies lead to an almost unmaintainable
  kernel-fitimage.bbclass.
- A single variable does not allow you to add a text file to the fitImage
  and at the same time place boot.scr file in the /boot directory of the
  target device.
- It is not documented or obvious how the UBOOT_ENV variable should be
  used together with the kernel-fitimage.bbclass.

The commit which introduced this feature (among other features...) is:
https://git.yoctoproject.org/poky/commit/?id=8a2f4e143b52109fbd0ee8d792e327d460b8c1e6
This commit is going to remove the u-boot script part of it.

The removal of this function requires a note in the migration guide.
The migration should be straightforward: If UBOOT_ENV and the
kernel-fitimage.bbclass are used, the u-boot script must now be appended
to the kernel recipe and the new FIT_UBOOT_ENV variable must be used.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index bd2e371b63a..22356fe5678 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -41,10 +41,6 @@ python __anonymous () {
     if image:
         d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
 
-    ubootenv = d.getVar('UBOOT_ENV')
-    if ubootenv:
-        d.appendVarFlag('do_assemble_fitimage', 'depends', ' virtual/bootloader:do_populate_sysroot')
-
     #check if there are any dtb providers
     providerdtb = d.getVar("PREFERRED_PROVIDER_virtual/dtb")
     if providerdtb:
@@ -607,15 +603,6 @@ fitimage_assemble() {
 	# Step 3: Prepare a u-boot script section
 	#
 
-	if [ -n "${UBOOT_ENV}" ] && [ -d "${STAGING_DIR_HOST}/boot" ]; then
-		if [ -e "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY}" ]; then
-			cp ${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} ${B}
-			bootscr_id="${UBOOT_ENV_BINARY}"
-			fitimage_emit_section_boot_script $1 "$bootscr_id" ${UBOOT_ENV_BINARY}
-		else
-			bbwarn "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} not found."
-		fi
-	fi
 	if [ -n "${FIT_UBOOT_ENV}" ]; then
 		cp ${UNPACKDIR}/${FIT_UBOOT_ENV} ${B}
 		bootscr_id="${FIT_UBOOT_ENV}"
-- 
2.47.1


