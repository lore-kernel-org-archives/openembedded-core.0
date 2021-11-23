Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DDBC433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 21:57:54 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.869.1637704674092955281
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:57:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZQFm0ciY;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id de30so738068qkb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4xRH3zh5CrwMdEN/eoxcBH/2rljbPccuMwe4ev80wFM=;
        b=ZQFm0ciYevk3a+Mgt6sKra3TtkrvNRCCajV18pG7WKiGSWjHdBQuKqI4gFc8FdAyJv
         wsd5n9ITR/uSJUZsuMocVIlvjpqQNzLYtSAcrGvACUsc5EdpxxuasopIYwzf3WJfiIRF
         OMp2qielalmuIz7ipYvPCGnEnIqETSPMcTkCllmmILjtltxu4Sz2ePjTQT7Gy0BN3tlQ
         BXgqbfChGP3Hh9OmHhaBd7d/Qb9oiifM4y89Om2xDd3N3o8hbyH71cwWWsJxrRqsyofj
         /xQFiKsD9U3GDkJ9QJHe50nbxjLxf8Iqe7jg5hiShBMI1FEE2PPbbzbepeZoZVWoUL2m
         SJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4xRH3zh5CrwMdEN/eoxcBH/2rljbPccuMwe4ev80wFM=;
        b=CDtIaQn8Bm4zj1GJN1PT6X3ngFRUhsUY3XN+i5wX/v/M0b8ggGTPDOo/L6rn4+vb2W
         2VfhRVgsv+dDny+zbSrgZbOJcnj6xWJieG8fFYB3vt9wWIdRvvaVVzs2X3aPlmBZ/HLc
         a2nNiI3hFGnB4lAcUzUEE9kUfcRystZIkYDpPsGBz+s1VHrEzbjxmEdlfBGyt0IK3z3r
         GJ9/r5p8l/IIN8ePXMhMLE8UND+idFiLtPlMUGHQXKoIZ4VblB4AWTeT5U8t5B2RIXSv
         Mce4rno+RwxymSHQgBay6jQcJh0MAZfr7Gy2iGTf2h4ED7FGXcJL9bQh2U9uOoMMpmFE
         iBIg==
X-Gm-Message-State: AOAM532Bbm9AQYIeeR3rTZOCyHK/70FbPXOKiQ6HY6Z4DM3+AOVYo+tM
	rPNll+uuttVRtZNTFJtdIEQ=
X-Google-Smtp-Source: 
 ABdhPJwRBUEtLpGPvtwwnKPrUCdT3L0iEbkj0QibpNIP9m+Ua2Cn+yVoEFBRWdbVMO0m4BUN/blJ1Q==
X-Received: by 2002:a05:620a:28d0:: with SMTP id
 l16mr703906qkp.500.1637704673208;
        Tue, 23 Nov 2021 13:57:53 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 m9sm6395640qtn.73.2021.11.23.13.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:57:52 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 03/20] linux-yocto/5.10: update to v5.10.79
Date: Tue, 23 Nov 2021 16:57:30 -0500
Message-Id: 
 <e7c1276c257f47936675265963269f232fae4dae.1637703810.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637703810.git.bruce.ashfield@gmail.com>
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 21:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158624

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    bd816c278316 Linux 5.10.79
    62424fe4c2cf rsi: fix control-message timeout
    8971158af1e0 media: staging/intel-ipu3: css: Fix wrong size comparison imgu_css_fw_init
    1cf43e928954 staging: rtl8192u: fix control-message timeouts
    9963ba5b9d49 staging: r8712u: fix control-message timeout
    844b02496eac comedi: vmk80xx: fix bulk and interrupt message timeouts
    b7fd7f3387f0 comedi: vmk80xx: fix bulk-buffer overflow
    33d7a470730d comedi: vmk80xx: fix transfer-buffer overflows
    ef143dc0c3de comedi: ni_usb6501: fix NULL-deref in command paths
    786f5b034504 comedi: dt9812: fix DMA buffers on stack
    86d4aedcbc69 isofs: Fix out of bound access for corrupted isofs image
    c430094541a8 staging: rtl8712: fix use-after-free in rtl8712_dl_fw
    ab4af56ae250 printk/console: Allow to disable console output by using console="" or console=null
    07d1db141e47 binder: don't detect sender/target during buffer cleanup
    42681b90c4db usb-storage: Add compatibility quirk flags for iODD 2531/2541
    1309753b7841 usb: musb: Balance list entry in musb_gadget_queue
    27409143122f usb: gadget: Mark USB_FSL_QE broken on 64-bit
    94e5305a3816 usb: ehci: handshake CMD_RUN instead of STS_HALT
    a8db6fd04d58 Revert "x86/kvm: fix vcpu-id indexed array sizes"
    ecf58653f1e4 KVM: x86: avoid warning with -Wbitwise-instead-of-logical

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index f666ac0611..89ef0097fa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "12f6a7187b3c8abab5e139dbfdf7f58f265f4169"
-SRCREV_meta ?= "a0238f7f4f2222d08bb18147bb5e24cc877b0546"
+SRCREV_machine ?= "31ba5af055c8ec4f10e7d830f6303ca2384e345a"
+SRCREV_meta ?= "1a4cd99824c919ba17dc62935532f3748ef18469"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.78"
+LINUX_VERSION ?= "5.10.79"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 86010f106f..ef562f42f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.78"
+LINUX_VERSION ?= "5.10.79"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "cdec5045c5323846adaf2510e539843d0cfe74ae"
-SRCREV_machine ?= "344c0c38f5b892312b0a1db7f613d2704dd4942f"
-SRCREV_meta ?= "a0238f7f4f2222d08bb18147bb5e24cc877b0546"
+SRCREV_machine:qemuarm ?= "d8f6c9be051a886d4956a7d6195d0e8f10761a33"
+SRCREV_machine ?= "f7838de907e651c3d279e6b5209b7e5d7e12ad21"
+SRCREV_meta ?= "1a4cd99824c919ba17dc62935532f3748ef18469"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 2e81068330..a68744d129 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f98b917d7826304daeecf11cc52be2562a9304ff"
-SRCREV_machine:qemuarm64 ?= "13ff8a3ae368724e008e3bcd77833611de7962b2"
-SRCREV_machine:qemumips ?= "7b94dec2b0f5b582b97cdb3ac97fe153559869e4"
-SRCREV_machine:qemuppc ?= "652531fb0cc8eb3607109bb8d878253be2d3d534"
-SRCREV_machine:qemuriscv64 ?= "2daa192783edd4974da8e900c0dc93186e57a838"
-SRCREV_machine:qemuriscv32 ?= "2daa192783edd4974da8e900c0dc93186e57a838"
-SRCREV_machine:qemux86 ?= "2daa192783edd4974da8e900c0dc93186e57a838"
-SRCREV_machine:qemux86-64 ?= "2daa192783edd4974da8e900c0dc93186e57a838"
-SRCREV_machine:qemumips64 ?= "4c817df0fd06350e18693551699c33361e16a193"
-SRCREV_machine ?= "2daa192783edd4974da8e900c0dc93186e57a838"
-SRCREV_meta ?= "a0238f7f4f2222d08bb18147bb5e24cc877b0546"
+SRCREV_machine:qemuarm ?= "400d6ae8c64508b812dd58ee90106be2aa395bd9"
+SRCREV_machine:qemuarm64 ?= "efc398a5bce6938c24413608381d86e7bf225c91"
+SRCREV_machine:qemumips ?= "358d9326c084f4162b71ed857b16419b4fb3295f"
+SRCREV_machine:qemuppc ?= "0fb273427794cb084265a18b03878a482e438aa9"
+SRCREV_machine:qemuriscv64 ?= "fba683668510aeb475a5fd3fb4b7da5aed402495"
+SRCREV_machine:qemuriscv32 ?= "fba683668510aeb475a5fd3fb4b7da5aed402495"
+SRCREV_machine:qemux86 ?= "fba683668510aeb475a5fd3fb4b7da5aed402495"
+SRCREV_machine:qemux86-64 ?= "fba683668510aeb475a5fd3fb4b7da5aed402495"
+SRCREV_machine:qemumips64 ?= "e1dabeb4b0ea9695dea605a0c91f17c482f49f75"
+SRCREV_machine ?= "fba683668510aeb475a5fd3fb4b7da5aed402495"
+SRCREV_meta ?= "1a4cd99824c919ba17dc62935532f3748ef18469"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.78"
+LINUX_VERSION ?= "5.10.79"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


