Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5900.1793051194808077230
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 14:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lk9qrrUq;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4b190cdc9feso1929589b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 14:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793051194; x=1793655994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+ouQaMFgDYI3fQrwZTzLr1CA7PrKoLTGWyvwbX5LxU=;
        b=lk9qrrUqttJmKrVuFd5xPnf7kAdR+b985vfrgM0T7vZj2AW2XyOSfwp7JRmK6q5X2/
         H8mSWfSPHEaBxetSdRBZrDX8EMdI/6SYA3icOUerdw+6sl1tBM3BrYLViP32J+Grl36D
         QBPc0+FYdqfO3X2zE6q9lGfmDVAUSftAI9iloEBE7S+eb1OfubbMXTbenN/OJPQWXn4y
         jL95Vu3+XI/2c/8YceRRRUOBAIKNyX+qpv6JVFuy8tSrP5YdRCU3eoZ8hE2sGGUdBm/n
         82RWBcykdBDPPs2Ua6d0Qt0K5eMQ1LVzY+5pgnGV2JaAXnZtrkPBpI7N0/xNtvHu7FhA
         KVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793051194; x=1793655994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+ouQaMFgDYI3fQrwZTzLr1CA7PrKoLTGWyvwbX5LxU=;
        b=xe7eiWdFjo0MlUQwmu2dilgA845H9ES46QGJ60gjcLGXGCCs2zKhjJh3F2mCxckz0t
         rakemjgSvCZIoAaHakzeGLQDwn8SCj2SqOi9KgtJtg3iPCeEDoise/IIXB9oX45QhoUj
         Co9GhFWNfjwc7OUTeErvPqiH/k87CgP9rZmL6XsCUhBBfkINe1Xe8IXjleG9ou4eozfn
         6wuqf+TZNGg+K/4jIlJBrDJffIu5sA94Xl9UiWbEEUHOvJ8UAuwlh/l+Y3xXSOi3+/Mj
         hc49i6T5BfXk45aZ6Xo2Wbb5YfGOwrBIFYe/XkDjlF1ybwQoUh5gYapN/BBg7kQhWxpe
         qtJA==
X-Gm-Message-State: AFq9FYItojeA8sLyOO2FSiyCCM+g5d949yRE8QDfEcpQPl8V2VfhE31c
	ZEif0fDjzoTj/I7q4ZoEXtoW2ZxgLnmexM55SCycZg3bx7TF3ehYWgqhaqeQkA==
X-Gm-Gg: AYBFou0Mk5jHjdqNoaTkVD1lHT6VGqJG0Ep8NDOWjmtdMYuQLjjuhAmnaK2SAjq6P46
	Xr0RraqfS4KMOEFObFw3BWS1iXCquYCbg3YIBgsfQrUPj9Jz0F0V1FBLEQV7Kb7l09H6QNnXxSM
	EfZPGHocY04Mrv1lX+X2jnOnAM+b0UUbuo7qpng06eTO0tmSSQwRKe3v6MFHI9WOkfd02NaSa23
	5fir/8/q/aXqppMZe6BZ4sexU4fIXT8FblbhCS+BKnVBQ04JWj7w0Lt+u3i1fMttB8Q2YPt2Yls
	ahqBbdc4eRfjuvQD8Flm3lgYRVvNQ3cByRckCv6seJn3Udi+tndnvTW/uBcc+gkJHF/+YrQdFPd
	JoCjtsV/NNGu1ni4llNh9yThy1VVWt1wJTSsPpB8AkoVBSUKCQYqV2H97rjn0OcHqE/jXIfgXmB
	iw8hcdE6YC/eiCHeCpzLFOPRxt1y9IukV6G5r/vzATH5RvtU8CnWv9Dz+Y8H4Welj9/OXKPJ1yW
	HXKRJs9/4BbYFvW3HgxAozUmexJNrct0EaetvRRMZVdg+3Zu7DMht4kPCKuSUH2m+/LRU2giJI=
X-Received: by 2002:a05:6808:4f14:b0:4cb:f21b:6f8e with SMTP id 5614622812f47-55c001f9e4dmr5599653b6e.33.1793051193896;
        Mon, 26 Oct 2026 14:46:33 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::283f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424a05dsm6304219b6e.4.2026.10.26.14.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:46:33 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 5/6] Add SPDX deploy tasks to various recipes
Date: Mon, 26 Oct 2026 15:45:25 -0600
Message-ID: <20261026214627.2388650-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026214627.2388650-1-JPEWhacker@gmail.com>
References: <20260630210422.1903245-1-JPEWhacker@gmail.com>
 <20261026214627.2388650-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 21:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248698
Content-Type: text/plain; charset="utf-8"

Adds SPDX deploy tasks to many recipes to record their output when
consumed in an SBoM

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/barebox.bbclass           | 1 +
 meta/classes-recipe/devicetree.bbclass        | 1 +
 meta/classes-recipe/kernel-fit-image.bbclass  | 1 +
 meta/classes-recipe/kernel.bbclass            | 1 +
 meta/recipes-bsp/grub/grub-efi_2.14.bb        | 1 +
 meta/recipes-bsp/opensbi/opensbi_1.9.bb       | 1 +
 meta/recipes-bsp/u-boot/u-boot.inc            | 1 +
 meta/recipes-core/systemd/systemd-boot_262.bb | 2 +-
 8 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe/barebox.bbclass
index 3980849b53..252e97fa65 100644
--- a/meta/classes-recipe/barebox.bbclass
+++ b/meta/classes-recipe/barebox.bbclass
@@ -165,5 +165,6 @@ barebox_do_deploy () {
         fi
 }
 addtask deploy after do_compile
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 EXPORT_FUNCTIONS do_configure do_compile do_install do_deploy
diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe/devicetree.bbclass
index 4fe389bed8..affbf115c2 100644
--- a/meta/classes-recipe/devicetree.bbclass
+++ b/meta/classes-recipe/devicetree.bbclass
@@ -166,6 +166,7 @@ devicetree_do_deploy() {
     done
 }
 addtask deploy before do_build after do_install
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 EXPORT_FUNCTIONS do_compile do_install do_deploy
 
diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index 7b2bcd4673..d0f7274e70 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -260,3 +260,4 @@ do_deploy() {
     fi
 }
 addtask deploy after do_compile before do_build
+SPDX_DEPLOY_TASKS += "do_deploy"
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 0a6d754108..14c71dec54 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -840,6 +840,7 @@ kernel_do_deploy() {
 do_deploy[prefuncs] += "read_subpackage_metadata"
 
 addtask deploy after do_install do_populate_sysroot do_packagedata
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 EXPORT_FUNCTIONS do_deploy
 
diff --git a/meta/recipes-bsp/grub/grub-efi_2.14.bb b/meta/recipes-bsp/grub/grub-efi_2.14.bb
index d19b33b504..8d8671614a 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.14.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.14.bb
@@ -99,6 +99,7 @@ do_deploy() {
 }
 
 addtask deploy after do_install before do_build
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 FILES:${PN} = "${libdir}/grub/${GRUB_TARGET}-efi \
                ${datadir}/grub \
diff --git a/meta/recipes-bsp/opensbi/opensbi_1.9.bb b/meta/recipes-bsp/opensbi/opensbi_1.9.bb
index 96167f7c73..bb35f906b2 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.9.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.9.bb
@@ -49,6 +49,7 @@ do_deploy () {
 }
 
 addtask deploy before do_build after do_install
+SPDX_DEPLOY_TASKS += "do_deploy"
 
 FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_jump.*"
 FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_payload.*"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index b9f61a185c..1c9911ff6e 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -474,3 +474,4 @@ uboot_deploy_spl () {
 }
 
 addtask deploy before do_build after do_compile
+SPDX_DEPLOY_TASKS += "do_deploy"
diff --git a/meta/recipes-core/systemd/systemd-boot_262.bb b/meta/recipes-core/systemd/systemd-boot_262.bb
index bab2e7ae27..c9bc3e2a91 100644
--- a/meta/recipes-core/systemd/systemd-boot_262.bb
+++ b/meta/recipes-core/systemd/systemd-boot_262.bb
@@ -71,4 +71,4 @@ do_deploy () {
 }
 
 addtask deploy before do_build after do_compile
-
+SPDX_DEPLOY_TASKS += "do_deploy"
-- 
2.56.0

