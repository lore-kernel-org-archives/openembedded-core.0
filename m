Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83448CD8CB2
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 22:23:49 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7676.1781043823302218723
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 15:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MklKrNnI;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-69d92dbc420so4299045eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 15:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043822; x=1781648622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkyEMgBDuOwhUu4d2UNjJdeinlwawvhieVh0+OjSHOI=;
        b=MklKrNnIKIyOq0VGJXDCimR0dlRxjgR8FBJGyhKmVHijbYaknL+/ReopCO4pYju0ad
         E/A6DvTxej9KzNdVJjxocojmJhoJEc2SUMtiyEqDvlZcpZx56sScDRM22GAiGMKEEjfX
         2HPuDPctLQIIT5VxG5z5pVBahZDOayGs5jiYGLra4z+QaHtaq7wqsTOFV9v3vHhXP9lF
         1+IVruOcNxx5UWQFEpx2UPQHAxIsmPMmX3veBjCKu/1fWdthKxcx9BlH/d/NcUr9ku8O
         h8CH6dGlPbTextOpq5+L3jiznahklgM71AtGaMcvj8ju1VRFBPGy7Fww/4JI2qOxD0h9
         t6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043822; x=1781648622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nkyEMgBDuOwhUu4d2UNjJdeinlwawvhieVh0+OjSHOI=;
        b=D2JgAxDSNC5LeBeW1+rDdMNrehfPwzdu4ZfI2K+8KhGaPAI9AFm46WOu6WL3KfV3lh
         cD22mHD1TZrTpAPn0qVcEawRe9sKoNyyxpWi7gleWMiJXr1gHDCNGzrCflfEGrZz4Iob
         UxERNYft3ZC0MmF6OJ83L77ENb/7XsjH9I4xEurwJHO5mmBe/aPRIXdX+vGd2ocybGGu
         704bCYgm10SDOjPLNNkkeNQnrOV15zjsxsA6CMgcoEzRjodPruLyoTduggizs454uoUl
         H+QxqdeYVq3c6su3ol6MFsOqKWF75HjPIKPHBcQEnRMrl4R8ptvFNaTvlfo9gOYswHAE
         Driw==
X-Gm-Message-State: AOJu0Yy2JkF9sD6BapGu4tsf/xMGAVwTnTPABWHKCfWti8Ag2h6OtkGs
	omZDl9GTyclmX7sEeFeBp+GsvdVWv6SZZYtBg34113xFPtTwTPD9Y5173IxZ8g==
X-Gm-Gg: Acq92OEAuSy2EKW4pLTuXrvAxJP88kYci07wpoLrw1mGytD+COXMstNocMZDBMOucQq
	FgOOe53YVsg/CbHnb7Wv075hEQff7e/yoF2bW8RlkIc/M/gdyEyLSlK6cOlADkmpFuYVulWd14Q
	svtXPuk2VIutHZZWmgZbVcz4wgCWMBNk9j4eiYbzo0roeD1Je12TMdmINzER6LT3BxCABhaL49d
	8oilWFjIZ5fYq4TU0P0xSOYh6x8dZ882J0YklfH5DGZeYxKLaN3pfO2ehFa9iXFTdv4grDQu3Zl
	LU+XDCvbvEGA3oVgfjLI/iC070a8jfC1ULZqtCfbDskZrB57xKtMthdUc/lRancKJKSwnzfgmAD
	XSYfqNTpejwJQ+PnRdDrNN3g9gKAwrEbeScF1WyBewNzgruX0VfSvYUAylNRmQVnUYjFGzH8GiW
	uqiaoMsLwfhvRIB9+8DKuRkCjuEG8xaingeJ1+5BsV
X-Received: by 2002:a05:6820:1614:b0:69d:ef3c:7e34 with SMTP id 006d021491bc7-69e685f4849mr12596842eaf.0.1781043822476;
        Tue, 09 Jun 2026 15:23:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::ce1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d7d4f449sm19122610fac.8.2026.06.09.15.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:23:41 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 4/5] Add SPDX deploy tasks
Date: Tue,  9 Jun 2026 16:15:55 -0600
Message-ID: <20260609222331.1293007-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609222331.1293007-1-JPEWhacker@gmail.com>
References: <20260609222331.1293007-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 22:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238307

Adds SPDX deploy tasks to many recipes to record their output when
consumed in an SBoM

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/barebox.bbclass             | 3 ++-
 meta/classes-recipe/devicetree.bbclass          | 3 ++-
 meta/classes-recipe/kernel-fit-image.bbclass    | 3 ++-
 meta/classes-recipe/kernel.bbclass              | 3 ++-
 meta/recipes-bsp/grub/grub-efi_2.14.bb          | 3 ++-
 meta/recipes-bsp/opensbi/opensbi_1.8.1.bb       | 3 ++-
 meta/recipes-bsp/u-boot/u-boot.inc              | 3 ++-
 meta/recipes-core/systemd/systemd-boot_259.5.bb | 4 ++--
 8 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe/barebox.bbclass
index 73615999aa..0be611cf65 100644
--- a/meta/classes-recipe/barebox.bbclass
+++ b/meta/classes-recipe/barebox.bbclass
@@ -157,6 +157,7 @@ barebox_do_deploy () {
                 done
         fi
 }
-addtask deploy after do_compile
+addtask deploy after do_compile do_create_spdx
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 EXPORT_FUNCTIONS do_configure do_compile do_install do_deploy
diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe/devicetree.bbclass
index ce9d008aac..a313507251 100644
--- a/meta/classes-recipe/devicetree.bbclass
+++ b/meta/classes-recipe/devicetree.bbclass
@@ -163,7 +163,8 @@ devicetree_do_deploy() {
         install -Dm 0644 "${B}/$dtb_file" "${DEPLOYDIR}/devicetree/$dtb_file"
     done
 }
-addtask deploy before do_build after do_install
+addtask deploy before do_build after do_install do_create_spdx
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 EXPORT_FUNCTIONS do_compile do_install do_deploy
 
diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index ae8f3c6688..becbc280ce 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -240,4 +240,5 @@ do_deploy() {
         fi
     fi
 }
-addtask deploy after do_compile before do_build
+addtask deploy after do_compile do_create_spdx before do_build
+SPDX_DEPLOY_TASKS += "do_deploy"
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 50cef17f69..5dc606048b 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -841,7 +841,8 @@ kernel_do_deploy() {
 # ensure we get the right values for both
 do_deploy[prefuncs] += "read_subpackage_metadata"
 
-addtask deploy after do_install do_populate_sysroot do_packagedata
+addtask deploy after do_install do_populate_sysroot do_packagedata do_create_spdx
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 EXPORT_FUNCTIONS do_deploy
 
diff --git a/meta/recipes-bsp/grub/grub-efi_2.14.bb b/meta/recipes-bsp/grub/grub-efi_2.14.bb
index 6354b43989..db187ac373 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.14.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.14.bb
@@ -96,7 +96,8 @@ do_deploy() {
 	install -m 644 ${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} ${DEPLOYDIR}
 }
 
-addtask deploy after do_install before do_build
+addtask deploy after do_install do_create_spdx before do_build
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 FILES:${PN} = "${libdir}/grub/${GRUB_TARGET}-efi \
                ${datadir}/grub \
diff --git a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
index 0a9652c283..377a06fb78 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
@@ -44,7 +44,8 @@ do_deploy () {
 	install -m 755 ${D}/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_dynamic.* ${DEPLOYDIR}/
 }
 
-addtask deploy before do_build after do_install
+addtask deploy before do_build after do_install do_create_spdx
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_jump.*"
 FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_payload.*"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index a75948dfc3..1c3c9858df 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -470,4 +470,5 @@ uboot_deploy_spl () {
     ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
 }
 
-addtask deploy before do_build after do_compile
+addtask deploy before do_build after do_compile do_create_spdx
+SPDX_DEPLOY_TASKS += "do_deploy"
diff --git a/meta/recipes-core/systemd/systemd-boot_259.5.bb b/meta/recipes-core/systemd/systemd-boot_259.5.bb
index c6c443f929..e2c579db97 100644
--- a/meta/recipes-core/systemd/systemd-boot_259.5.bb
+++ b/meta/recipes-core/systemd/systemd-boot_259.5.bb
@@ -71,5 +71,5 @@ do_deploy () {
 	install ${B}/src/boot/addon*.efi.stub ${DEPLOYDIR}
 }
 
-addtask deploy before do_build after do_compile
-
+addtask deploy before do_build after do_compile do_create_spdx
+SPDX_DEPLOY_TASKS += "do_deploy"
-- 
2.54.0


