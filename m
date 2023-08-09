Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC50C41513
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 03:32:04 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.80682.1691551920202466864
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 20:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=NznRsH11;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-40ff796e8ddso37715711cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 20:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691551919; x=1692156719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YqdoHT8k2DWkbXYWLiC1LZHGp9MeJ42YNvj3bVkhL58=;
        b=NznRsH110XOcAIqTg9+/VxmwbZQ+DGSSYpJG2CdWXdpf7KTFSWx3Q6EyjjGbR2iDLE
         v4qUg/FzD4DbvBZ/XbfrWFQIECAHEdTKlLgIDkg16pskxQpjJEYIny5QRzv8L2/WusiW
         XM+L5fcTJltCzwU5QngVgMJVho7cLr4aKSr3KYUQJkJcHGBsY/34JhDSuMHhtyZmVx26
         vVUndJ7oZwI+QO5+60kBixoIpQHOxaT9H3NdkDk65wwq8FoHkuBgqfzaffjjePbkKhF9
         VlYECzK/ov1qm8jd5OWfSO8zlf/9v9UgJEgvmDaAlDu0v16UbEkP/XDgu2X63srtOszR
         2z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691551919; x=1692156719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YqdoHT8k2DWkbXYWLiC1LZHGp9MeJ42YNvj3bVkhL58=;
        b=Ty2H75v6HtvlmR/mDsB/skSapNJZa3mlvQIGBm6BoyJdkpMCwS3gLO+SQVhmVlhAwk
         NVuSFvDknkDtwVRuHeys6vWIOCmqmm5b0o5vWLMB/HQp87mukuPYkJaoNLs1Sogy100/
         HKu5jc1ZTWGjPXt7xwEvtxQB7rFepubmEXkOW2gsywRyqr62o/w3pvjPoM+nGmOE10ZN
         RWnDMrqmMVgbWG3q5ovK/c3ghpgRSOWK+pm5hzONiCrlAusxJIJKs9L5ra3cbyRf3G1R
         t34eyvyentJYQc896Pkvi5ouQ2zgU3DDz4ADFQMttHhIMwYLmvOqdGiasNBaKwWx31aM
         0grQ==
X-Gm-Message-State: AOJu0YwXIhi/mbq2OIjs/YZ8TLe54P9Tb3ndGTWIln5t6TbdWZKGjzoH
	+Tyw22GIWrOh5hyuG2pqLPE=
X-Google-Smtp-Source: AGHT+IGv3gxv2YSrqAN5agQRpGu/jn0DZ4E2UumJH15U+DrMwU+uHAb4kXDwtNOMTpsgU8Ft8CEEdg==
X-Received: by 2002:a05:622a:1802:b0:40e:13e5:9651 with SMTP id t2-20020a05622a180200b0040e13e59651mr2197403qtc.65.1691551919099;
        Tue, 08 Aug 2023 20:31:59 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id j23-20020ac84f97000000b004033c3948f9sm3781532qtw.42.2023.08.08.20.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 20:31:58 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/6.4: update to v6.4.9
Date: Tue,  8 Aug 2023 23:31:55 -0400
Message-Id: <20230809033156.3494164-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 03:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185683

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    38ca69782268 Linux 6.4.9
    2692b1574ad9 x86: fix backwards merge of GDS/SRSO bit
    cf482893f721 xen/netback: Fix buffer overrun triggered by unusual packet
    9b73a2a43f4d x86/srso: Tie SBPB bit setting to microcode patch detection
    4974bd4b1385 x86/srso: Add a forgotten NOENDBR annotation
    b155f54a92b0 x86/srso: Fix return thunks in generated code
    b31eb84b6756 x86/srso: Add IBPB on VMEXIT
    948e43310c20 x86/srso: Add IBPB
    bf46b6249f26 x86/srso: Add SRSO_NO support
    dc399c66209b x86/srso: Add IBPB_BRTYPE support
    acdc883eb61e x86/srso: Add a Speculative RAS Overflow mitigation
    d351cc7c14a6 x86/bugs: Increase the x86 bugs vector size to two u32s
    7be4a6b1128c Documentation/x86: Fix backwards on/off logic about YMM support
    2f94fb4a4231 x86/xen: Fix secondary processors' FPU initialization
    6a592d977a0d x86/mem_encrypt: Unbreak the AMD_MEM_ENCRYPT=n build
    6f29afbba8fc KVM: Add GDS_NO support to KVM
    4da542e6b2bb x86/speculation: Add Kconfig option for GDS
    c73393948612 x86/speculation: Add force option to GDS mitigation
    ff0642207e24 x86/speculation: Add Gather Data Sampling mitigation
    71c140aa6327 x86/fpu: Move FPU initialization into arch_cpu_finalize_init()
    7e56c238ff4a x86/fpu: Mark init functions __init
    6c69f14c3e67 x86/fpu: Remove cpuinfo argument from init functions
    121887418638 x86/init: Initialize signal frame size late
    03e244a37a41 init, x86: Move mem_encrypt_init() into arch_cpu_finalize_init()
    5dc85ed21b9c init: Invoke arch_cpu_finalize_init() earlier
    f9a4f2ba337c init: Remove check_bugs() leftovers
    50455d685b65 um/cpu: Switch to arch_cpu_finalize_init()
    4b61f3683da0 sparc/cpu: Switch to arch_cpu_finalize_init()
    65b2da915cf9 sh/cpu: Switch to arch_cpu_finalize_init()
    09afafc754b3 mips/cpu: Switch to arch_cpu_finalize_init()
    626fefa0ba15 m68k/cpu: Switch to arch_cpu_finalize_init()
    3868a6a35c95 loongarch/cpu: Switch to arch_cpu_finalize_init()
    2156182d8f66 ia64/cpu: Switch to arch_cpu_finalize_init()
    81da5576db4e ARM: cpu: Switch to arch_cpu_finalize_init()
    f2aef93c0bc7 x86/cpu: Switch to arch_cpu_finalize_init()
    e5b3acb81bd2 init: Provide arch_cpu_finalize_init()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Richard,

These two patches should be applied to the end of my latest
consolidated pull request to pickup the latest 6.4-stable
and Jon's qemuarm boot fix.

Bruce

 .../linux/linux-yocto-rt_6.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.4.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index 53961cb9b3..c624b2dac8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "dea7f1321a72454808398aba37090cb8543d68c2"
-SRCREV_meta ?= "50e8722be4cd4fe25f03d5a26ea88fb199c8b41a"
+SRCREV_machine ?= "0bcc161e5d456bcbcfa6852e5e7750636a00ce46"
+SRCREV_meta ?= "8dc4f68eb852784a5bc82d30768ac3276c890754"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.4.8"
+LINUX_VERSION ?= "6.4.9"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index 950df14f26..409a95e633 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.4.inc
 
-LINUX_VERSION ?= "6.4.8"
+LINUX_VERSION ?= "6.4.9"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "5545fd447acbc5d280c783e1e1c73a3e2ef7f54a"
-SRCREV_meta ?= "50e8722be4cd4fe25f03d5a26ea88fb199c8b41a"
+SRCREV_machine ?= "80174b01645669e6d83c7c1532fa2661438ba49d"
+SRCREV_meta ?= "8dc4f68eb852784a5bc82d30768ac3276c890754"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index 5badb65731..527b09087c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.4/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.4/standard/base"
 KBRANCH:qemumips64 ?= "v6.4/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "fed79080c4b5477e1e60c6ffb7b8d7ebf8d6b50d"
-SRCREV_machine:qemuarm64 ?= "5545fd447acbc5d280c783e1e1c73a3e2ef7f54a"
-SRCREV_machine:qemuloongarch64 ?= "5545fd447acbc5d280c783e1e1c73a3e2ef7f54a"
-SRCREV_machine:qemumips ?= "d6fcc4e1adef98ae517611e9495d8419196bf0da"
-SRCREV_machine:qemuppc ?= "5545fd447acbc5d280c783e1e1c73a3e2ef7f54a"
-SRCREV_machine:qemuriscv64 ?= "5545fd447acbc5d280c783e1e1c73a3e2ef7f54a"
-SRCREV_machine:qemuriscv32 ?= "5545fd447acbc5d280c783e1e1c73a3e2ef7f54a"
-SRCREV_machine:qemux86 ?= "5545fd447acbc5d280c783e1e1c73a3e2ef7f54a"
-SRCREV_machine:qemux86-64 ?= "5545fd447acbc5d280c783e1e1c73a3e2ef7f54a"
-SRCREV_machine:qemumips64 ?= "a7dffb3088550aa11e68aecff03de6616a4acea6"
-SRCREV_machine ?= "5545fd447acbc5d280c783e1e1c73a3e2ef7f54a"
-SRCREV_meta ?= "50e8722be4cd4fe25f03d5a26ea88fb199c8b41a"
+SRCREV_machine:qemuarm ?= "4d6b5d3235770e00b35d53c0dd33827624e0dba3"
+SRCREV_machine:qemuarm64 ?= "80174b01645669e6d83c7c1532fa2661438ba49d"
+SRCREV_machine:qemuloongarch64 ?= "80174b01645669e6d83c7c1532fa2661438ba49d"
+SRCREV_machine:qemumips ?= "1504fdd2f568bf0f39042b69e282a9e6042594a1"
+SRCREV_machine:qemuppc ?= "80174b01645669e6d83c7c1532fa2661438ba49d"
+SRCREV_machine:qemuriscv64 ?= "80174b01645669e6d83c7c1532fa2661438ba49d"
+SRCREV_machine:qemuriscv32 ?= "80174b01645669e6d83c7c1532fa2661438ba49d"
+SRCREV_machine:qemux86 ?= "80174b01645669e6d83c7c1532fa2661438ba49d"
+SRCREV_machine:qemux86-64 ?= "80174b01645669e6d83c7c1532fa2661438ba49d"
+SRCREV_machine:qemumips64 ?= "a55946081548eb8b23d5e1da3aa7f469addef1c8"
+SRCREV_machine ?= "80174b01645669e6d83c7c1532fa2661438ba49d"
+SRCREV_meta ?= "8dc4f68eb852784a5bc82d30768ac3276c890754"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "714a286bf9ee3740260c61471ed72d10bd17336a"
+SRCREV_machine:class-devupstream ?= "38ca69782268c8e9578ba2f1fccf931f643eb8da"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.4/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.4.8"
+LINUX_VERSION ?= "6.4.9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


