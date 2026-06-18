Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C507BCD98FC
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 16:50:47 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24016.1781801440283505915
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 09:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gfegvryg;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-488b3fd8d0dso502699b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 09:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781801439; x=1782406239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htmmbviTFKFO6CGnAjLliWc0qZi9TjaXMmIgPhE5RD0=;
        b=gfegvrygoBjddg6tcZKEFNPmLCmGKk+Zk2cWCGihQ6FZOPzU5gp4ZTt+XYaMeafFQ6
         RzKuFec6c6XGkWfLcbRHUOL3vqMuqR+5za76HlCoKEHhd8vylE1rVrcBu4417PgMB4bh
         QtKDhEmVKEMfaV7gh/HgFJsten3vbnNM3tKyf/WxnNrFdy+sFiWjXqmfkaM5j8upEdzU
         DEJG7C3w0qUJ+Zasdf6K7w4dwHyRw+iTdKLUrwlEqWkwwcuhA617aCIRp8ttnIZ+kl4I
         q3cqPPEXCo8aEjuHtxNgQfFQSU1gqaGncp5rOWHodiouUnz4NrWXPcEyMm+/0LBcAYDL
         e+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781801439; x=1782406239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=htmmbviTFKFO6CGnAjLliWc0qZi9TjaXMmIgPhE5RD0=;
        b=G35uibkoHML99wGLmdg7eHKVSgPP5VKk4S1rBIEWny2qxwOsKKcwq5MBnvIGy+kbEz
         KiP2EKFua3nQFBlMkhvl0RG9qEcaduQQncQgjcU9zrc6Jr5Qfft7MDJZ/WjPuMkWtgJP
         bbQzp1m9qTDozhUcyBr910Ywfi8McsgER7Xdii7RU5ZFO3InNcOmW8ceiH9PBRJPmwYR
         8yGWVF+SOvPbsunqoql7fpzcv8aZGkQ1sMVTxhaepHCxRCGX7i/1q/TlHdxyBNp3JiNT
         XfJNc11ArJ851xM6nk3sms6qyth+mrVohRw75SJn4IOFH4CVG1sibI0SSZTjeu+xIa7+
         vIjw==
X-Gm-Message-State: AOJu0Yx5qqxoPP/IZP+yDvObVlehhunCxC49JzjEFZMFy1Ea6wninwzT
	y/iwZhDMPuP08/gSjphF+P9ltSxFEDzXpIPKYWx/Cukh9Zw2OXIc89maL29wMQ==
X-Gm-Gg: AfdE7cmpf67g77utXRp1lIpua7jPQBDr6w9jA/B5Oi7MqGjcOYi4UJKCfQV3Anx6cYl
	uGaaHuTB2NaaZKzWk32CPKaS3ABl8u1y/GbmLFwVlHwqpaI99kz7g8kWo6yrMEx3O5y+jZOWwFS
	DWVd2LXo2FUvff5hdHIej4gS/D2A6i/4rbP1yrFINAsxmzJpOglhD+aKCtHChfg024uoaobQSw8
	W7p5ZGsUd1ELsTrYFqaT1locN0mRcUcWSuoqfbwnBPDYVzveY0zp9urTXaAAzBEwQ1hvo6HdMvG
	78ePDZ+eQUe/xK8jdAgKs9Dn3GcdIqBlPqvQQQWXsKJXmiHOViwvaZWxR3wo6f/LJ5kaHoHPpwy
	YZnJ7yX6pW2q7nXNC9js/MpPx4T4q09OACN++e10TgxPaC+zRVOVZLOShA8rfgS+OgEi9OUbsO7
	gXe4MFTtgupuIox/E50WvD
X-Received: by 2002:a05:6808:7003:b0:486:560d:aa8e with SMTP id 5614622812f47-4896ab9cf48mr176809b6e.22.1781801439108;
        Thu, 18 Jun 2026 09:50:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::8b4b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4875dda5ee5sm8732987b6e.2.2026.06.18.09.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 09:50:38 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 3/5] Add SPDX deploy tasks to various recipes
Date: Thu, 18 Jun 2026 09:38:43 -0600
Message-ID: <20260618165032.347436-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618165032.347436-1-JPEWhacker@gmail.com>
References: <20260609222331.1293007-1-JPEWhacker@gmail.com>
 <20260618165032.347436-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 16:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239093

Adds SPDX deploy tasks to many recipes to record their output when
consumed in an SBoM

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/barebox.bbclass             | 1 +
 meta/classes-recipe/devicetree.bbclass          | 1 +
 meta/classes-recipe/kernel-fit-image.bbclass    | 1 +
 meta/classes-recipe/kernel.bbclass              | 1 +
 meta/recipes-bsp/grub/grub-efi_2.14.bb          | 1 +
 meta/recipes-bsp/opensbi/opensbi_1.8.1.bb       | 1 +
 meta/recipes-bsp/u-boot/u-boot.inc              | 1 +
 meta/recipes-core/systemd/systemd-boot_259.5.bb | 2 +-
 8 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe/barebox.bbclass
index 2411fb5caa..60437c1ad1 100644
--- a/meta/classes-recipe/barebox.bbclass
+++ b/meta/classes-recipe/barebox.bbclass
@@ -158,5 +158,6 @@ barebox_do_deploy () {
         fi
 }
 addtask deploy after do_compile
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 EXPORT_FUNCTIONS do_configure do_compile do_install do_deploy
diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe/devicetree.bbclass
index ce9d008aac..35c2499bdb 100644
--- a/meta/classes-recipe/devicetree.bbclass
+++ b/meta/classes-recipe/devicetree.bbclass
@@ -164,6 +164,7 @@ devicetree_do_deploy() {
     done
 }
 addtask deploy before do_build after do_install
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 EXPORT_FUNCTIONS do_compile do_install do_deploy
 
diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index ae8f3c6688..5115482eff 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -241,3 +241,4 @@ do_deploy() {
     fi
 }
 addtask deploy after do_compile before do_build
+SPDX_DEPLOY_TASKS += "do_deploy"
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 50cef17f69..8d0cb91688 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -842,6 +842,7 @@ kernel_do_deploy() {
 do_deploy[prefuncs] += "read_subpackage_metadata"
 
 addtask deploy after do_install do_populate_sysroot do_packagedata
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 EXPORT_FUNCTIONS do_deploy
 
diff --git a/meta/recipes-bsp/grub/grub-efi_2.14.bb b/meta/recipes-bsp/grub/grub-efi_2.14.bb
index 6354b43989..e535d99710 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.14.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.14.bb
@@ -97,6 +97,7 @@ do_deploy() {
 }
 
 addtask deploy after do_install before do_build
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 FILES:${PN} = "${libdir}/grub/${GRUB_TARGET}-efi \
                ${datadir}/grub \
diff --git a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
index 0a9652c283..93646a97df 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
@@ -45,6 +45,7 @@ do_deploy () {
 }
 
 addtask deploy before do_build after do_install
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_jump.*"
 FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_payload.*"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index a75948dfc3..acc2bf9819 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -471,3 +471,4 @@ uboot_deploy_spl () {
 }
 
 addtask deploy before do_build after do_compile
+SPDX_DEPLOY_TASKS += "do_deploy"
diff --git a/meta/recipes-core/systemd/systemd-boot_259.5.bb b/meta/recipes-core/systemd/systemd-boot_259.5.bb
index c6c443f929..c887835806 100644
--- a/meta/recipes-core/systemd/systemd-boot_259.5.bb
+++ b/meta/recipes-core/systemd/systemd-boot_259.5.bb
@@ -72,4 +72,4 @@ do_deploy () {
 }
 
 addtask deploy before do_build after do_compile
-
+SPDX_DEPLOY_TASKS += "do_deploy"
-- 
2.54.0


