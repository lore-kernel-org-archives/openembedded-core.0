Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C80C433FE
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 21:57:53 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.818.1637704673099752832
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:57:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bSnk4+Hf;
 spf=pass (domain: gmail.com, ip: 209.85.160.172,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id t11so716515qtw.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ze3RU6SwgrsUAkZEDnvKhuVSI72zd1uN/V5hQ3n7CpA=;
        b=bSnk4+HfFnBoHfX9/Q+UxRAgXOHCFWATd1A5CXEkIQW7JxcYxVzFj2+XKFHCJfpqxe
         aWGXbVCrpcg7fcrs8ta+cs0xskyDaCV+BlSwh7rUn6sRu3P+cRji2VgG+99mP5xCKHcX
         JRuJ4DL7CJCWHuncRdstRg9fjKUf/7K6OT5YAffDgrCVWYJczsZNF8bTttyk/BhqQRPU
         wW18RY3jFp0bVCjqCDvXZoUmOz6CX3ll4ChNHOESpHRq+4W1zUR75Nie2FcPUbnjNc6J
         2nWMW66Fi7WQosvnHipkxPismxekBmXHyhh42FrMxn0EuLAWGFyKqRUFGGFQBZgybh2o
         jqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ze3RU6SwgrsUAkZEDnvKhuVSI72zd1uN/V5hQ3n7CpA=;
        b=cNg1l35Y2X5e04K+fvILAqR9s0J4T4qV+FhwTA/Gvu9/4oFu7nLNA2UoiyqU9iF7CM
         uXge13kNOnHP38pTVHTZXcwkTxC3Uq1N6f1Sz4rFc97o9iR/91OjZleb4X+Ll1qttfhg
         6KbRMdwdxcVixOVzms9wbcjIDajueLfJ7hHBNjgFLAd8i63Hox5GK2MMYvR/swhQQe0A
         FlU20S3Awn1zmnuIUnWRAK04xCDTuFEFq9YHF0avZufsc6ju4fsQZbP6aaOQioFHjh2P
         Kl/iTrJTcdgmUrDxJ89tWNifFSCFf+l1dFq+ZvmWbz70bMxlryWe3KOg5YdHAXZiRWJd
         GqyQ==
X-Gm-Message-State: AOAM533Jx6o6zf5CHgAM9cp4jalXU/CBYvVhJ/Rh9A+VPAxc48TBqhna
	6s8vFq6qYNVySIuv0RaMVyY=
X-Google-Smtp-Source: 
 ABdhPJwFfOBJs3ih4vqCCVKb1bx/yRUQoUhD1dDi/cDBW9+PRwK9A/4odwhGNLQX/Gpb5gGGbwoISQ==
X-Received: by 2002:ac8:44bc:: with SMTP id a28mr839201qto.149.1637704671996;
        Tue, 23 Nov 2021 13:57:51 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 m9sm6395640qtn.73.2021.11.23.13.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:57:51 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 02/20] linux-yocto/5.14: update to v5.14.18
Date: Tue, 23 Nov 2021 16:57:29 -0500
Message-Id: 
 <b2964a1eb5e337bf6e361f70f3f63d0ed61090f4.1637703810.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637703810.git.bruce.ashfield@gmail.com>
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 21:57:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158623

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.14 to the latest korg -stable release that comprises
the following commits:

    a0265dd8262d Linux 5.14.18
    1379769b0b46 rsi: fix control-message timeout
    eda57a310234 media: staging/intel-ipu3: css: Fix wrong size comparison imgu_css_fw_init
    5013f2aaf959 staging: rtl8192u: fix control-message timeouts
    f3422d1fceba staging: r8712u: fix control-message timeout
    373ac8c59414 comedi: vmk80xx: fix bulk and interrupt message timeouts
    7b0e35618932 comedi: vmk80xx: fix bulk-buffer overflow
    278484ae9329 comedi: vmk80xx: fix transfer-buffer overflows
    4a9d43cb5d5f comedi: ni_usb6501: fix NULL-deref in command paths
    3ac273d154d6 comedi: dt9812: fix DMA buffers on stack
    b2fa1f52d22c isofs: Fix out of bound access for corrupted isofs image
    befd23bd3b17 staging: rtl8712: fix use-after-free in rtl8712_dl_fw
    bec32c40e438 binder: don't detect sender/target during buffer cleanup
    68abe9aefc40 binder: use cred instead of task for getsecid
    46088365bab7 binder: use cred instead of task for selinux checks
    fbb106e79524 binder: use euid from cred instead of using task
    f9b4ef2504bb Revert "proc/wchan: use printk format instead of lookup_symbol_name()"
    4674de4e2734 usb-storage: Add compatibility quirk flags for iODD 2531/2541
    6be11f54f5d4 usb: musb: Balance list entry in musb_gadget_queue
    d7f4ffba71d0 usb: gadget: Mark USB_FSL_QE broken on 64-bit
    d3c7daab289d usb: ehci: handshake CMD_RUN instead of STS_HALT
    a4cdb4c9c453 Revert "x86/kvm: fix vcpu-id indexed array sizes"
    2f63111ab86f KVM: x86: avoid warning with -Wbitwise-instead-of-logical
    f468cbedb2a7 ALSA: pci: cs46xx: Fix set up buffer type properly
    186155ac272e ALSA: pcm: Check mmap capability of runtime dma buffer at first

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.14.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.14.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
index 7e02f83d51..a328c6211f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "672665c11dd86abd71bbad0537e6388c6a5a84ca"
-SRCREV_meta ?= "b3ac9c40a22d6b00545b7ce51ef6dfb0cb9d2933"
+SRCREV_machine ?= "b9d37d8650cd3787d60516496f60178c51564a59"
+SRCREV_meta ?= "4e79d0b09290482ffb891e6b4acb3c7447b9c94d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.14.17"
+LINUX_VERSION ?= "5.14.18"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
index 9ad9549554..98947900a4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.14.17"
+LINUX_VERSION ?= "5.14.18"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "566227d5b0913910467a7736d78cad37e60217f8"
-SRCREV_machine ?= "35888b3a9a222963b856c960e8f0c72c2de18d4a"
-SRCREV_meta ?= "b3ac9c40a22d6b00545b7ce51ef6dfb0cb9d2933"
+SRCREV_machine:qemuarm ?= "83004545c9bb5e3ad666b3ffa9ad723eb795881a"
+SRCREV_machine ?= "8411a30747a2750c9d4dbe24631958bd00d3157e"
+SRCREV_meta ?= "4e79d0b09290482ffb891e6b4acb3c7447b9c94d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
index f034f36d45..673c03d82e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.14/standard/base"
 KBRANCH:qemux86-64 ?= "v5.14/standard/base"
 KBRANCH:qemumips64 ?= "v5.14/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "eef94a78151c2227eba9a8468ac611d9507482b5"
-SRCREV_machine:qemuarm64 ?= "35888b3a9a222963b856c960e8f0c72c2de18d4a"
-SRCREV_machine:qemumips ?= "607d94618b35382f38ab2bc0d37494372897ae4d"
-SRCREV_machine:qemuppc ?= "35888b3a9a222963b856c960e8f0c72c2de18d4a"
-SRCREV_machine:qemuriscv64 ?= "35888b3a9a222963b856c960e8f0c72c2de18d4a"
-SRCREV_machine:qemuriscv32 ?= "35888b3a9a222963b856c960e8f0c72c2de18d4a"
-SRCREV_machine:qemux86 ?= "35888b3a9a222963b856c960e8f0c72c2de18d4a"
-SRCREV_machine:qemux86-64 ?= "35888b3a9a222963b856c960e8f0c72c2de18d4a"
-SRCREV_machine:qemumips64 ?= "9ed182ebbcd4c77b8f99439d2feb6c4591148324"
-SRCREV_machine ?= "35888b3a9a222963b856c960e8f0c72c2de18d4a"
-SRCREV_meta ?= "b3ac9c40a22d6b00545b7ce51ef6dfb0cb9d2933"
+SRCREV_machine:qemuarm ?= "992053c4ec826932d9256ea4e1ad8686e4ea5375"
+SRCREV_machine:qemuarm64 ?= "8411a30747a2750c9d4dbe24631958bd00d3157e"
+SRCREV_machine:qemumips ?= "e362a5e68da1cca6ad77a27cbda02116edc9864d"
+SRCREV_machine:qemuppc ?= "8411a30747a2750c9d4dbe24631958bd00d3157e"
+SRCREV_machine:qemuriscv64 ?= "8411a30747a2750c9d4dbe24631958bd00d3157e"
+SRCREV_machine:qemuriscv32 ?= "8411a30747a2750c9d4dbe24631958bd00d3157e"
+SRCREV_machine:qemux86 ?= "8411a30747a2750c9d4dbe24631958bd00d3157e"
+SRCREV_machine:qemux86-64 ?= "8411a30747a2750c9d4dbe24631958bd00d3157e"
+SRCREV_machine:qemumips64 ?= "90b773a3236f213b62d2d4ab23cca9c695bc8383"
+SRCREV_machine ?= "8411a30747a2750c9d4dbe24631958bd00d3157e"
+SRCREV_meta ?= "4e79d0b09290482ffb891e6b4acb3c7447b9c94d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "b3ac9c40a22d6b00545b7ce51ef6dfb0cb9d2933"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "3dfa869cb79d60a2fe66efb4a11517ec7c89de16"
+SRCREV_machine:class-devupstream ?= "a0265dd8262de73457aaa3ce1c5938dc152b8085"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.14/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.14.17"
+LINUX_VERSION ?= "5.14.18"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


