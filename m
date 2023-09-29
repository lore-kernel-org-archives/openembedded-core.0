Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E422AE728FF
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 20:17:26 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.28141.1696018643002437562
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 13:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K0JlhMgq;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-41819a68143so61366241cf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 13:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696018642; x=1696623442; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SoIdhOJVrlAv73TzP/02+2RkTmE5o9lL6LPp9b0rxLM=;
        b=K0JlhMgqbWoYsRXAOOJN0wQkQWwcLrHi/aIPUrHjdIO04r2oHsNSumIVyunAK6TLTW
         SBLZm0+i37rJIjYNeZvmq2rc4Y3ivMnzRQNrHLKC9Bc/44ZfQ2c8xQGJcgfcEb2Ssa3K
         zr3d4C2LU1lLUClcb/Em3h8Vw3fIUiQ673dfnxPyGtOIKNepVkWz+MX6XkXoYepHz5WP
         NXKYB3HQKERkYrrMkwtRmrF77KTCaiVU0vz69+tk5+7Ox7zvykiFzwd2s5IMUDCwu+ZU
         /VU/WSWq/Xxwm2jcWfLMVfrPFSRrR3Cq/SMmVYMKm1xKe7ES5Y1U/z68a1yU+V5zl+sb
         Wj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696018642; x=1696623442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SoIdhOJVrlAv73TzP/02+2RkTmE5o9lL6LPp9b0rxLM=;
        b=iaxEXdO3dCNP8MwtQ23fQTk5bYJTsfTXxc3yCy76e+ygvGHcWzCV+mkbA9b5I9adAU
         Fx9HLgwknpIFLl0CyzCSpPvH09noSo+uSYu1bT8LoLdPzg1LN92R5t5RIET8pB6oE/dZ
         5dIXyWJHIVwutP5u+7ieuGRzL8gvRk0nFeLEs3EPNnvfyaBJL7NjJvVyyg9uqfZaVlps
         w5FlN6D1O+kp1/RI5qHpLeozadjQEqGtYe+U7pPpNIin5AropkwOzsb75uydVBbgQfT/
         8No2Tbif9vMavBk2q7WD+f+PU22n0e/8WUsQ2Y2gcgl6Pl/X+7qGaGx+1e5fneowBMfA
         DEKw==
X-Gm-Message-State: AOJu0YyxcyeUwWzlvV3lLL5skdkfFlFLOQ49eBw2UOGnExUEgsJA2uf3
	EGNKFRPSOxsby0QhX+RITlPyxDpFX863Zg==
X-Google-Smtp-Source: AGHT+IG7FYTnA2O3kvsKKLKcWA5laXoeVUpglg+D7K7g5DhYPEiZAcYk0pYj2SPhFj4OKDKapZjkXw==
X-Received: by 2002:ac8:5916:0:b0:418:1071:7303 with SMTP id 22-20020ac85916000000b0041810717303mr6149300qty.31.1696018642066;
        Fri, 29 Sep 2023 13:17:22 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id i17-20020ae9ee11000000b00767d8e12ce3sm7199262qkg.49.2023.09.29.13.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 13:17:20 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/4] linux-yocto/5.4: update to v5.4.252
Date: Fri, 29 Sep 2023 16:17:16 -0400
Message-Id: <20230929201719.3517611-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 20:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188442

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    21732fd22497 Linux 5.4.252
    9399ea1ce481 x86: fix backwards merge of GDS/SRSO bit
    bc7b9a6c2ca4 xen/netback: Fix buffer overrun triggered by unusual packet
    43ed6f79b3e7 x86/cpu, kvm: Add support for CPUID_80000021_EAX
    1f0618bb2456 x86/bugs: Increase the x86 bugs vector size to two u32s
    08ba48152a8a tools headers cpufeatures: Sync with the kernel sources
    694b40dcfb41 x86/cpufeatures: Assign dedicated feature word for CPUID_0x8000001F[EAX]
    4fa849d4af68 x86/cpu: Add VM page flush MSR availablility as a CPUID feature
    998eec066607 x86/cpufeatures: Add SEV-ES CPU feature
    3e21d8b0f3a9 Documentation/x86: Fix backwards on/off logic about YMM support
    ad7670dd65cb x86/mm: Initialize text poking earlier
    979366f5c2aa mm: Move mm_cachep initialization to mm_init()
    3d1b8cfdd0c9 x86/mm: Use mm_alloc() in poking_init()
    ddcf05fe8850 x86/mm: fix poking_init() for Xen PV guests
    3f8968f1f0ad x86/xen: Fix secondary processors' FPU initialization
    e56c1e0f9134 KVM: Add GDS_NO support to KVM
    ed56430ab253 x86/speculation: Add Kconfig option for GDS
    e35c65794365 x86/speculation: Add force option to GDS mitigation
    f68f9f2df68e x86/speculation: Add Gather Data Sampling mitigation
    6e6044366897 x86/fpu: Move FPU initialization into arch_cpu_finalize_init()
    2ee37a46aa13 x86/fpu: Mark init functions __init
    77fe8150579c x86/fpu: Remove cpuinfo argument from init functions
    95356fff6fee init, x86: Move mem_encrypt_init() into arch_cpu_finalize_init()
    7aa2cec22e28 init: Invoke arch_cpu_finalize_init() earlier
    944d5c3ffa4b init: Remove check_bugs() leftovers
    a03ef708788e um/cpu: Switch to arch_cpu_finalize_init()
    98c3955e145f sparc/cpu: Switch to arch_cpu_finalize_init()
    568d68fc1dd4 sh/cpu: Switch to arch_cpu_finalize_init()
    18cd611a3eaa mips/cpu: Switch to arch_cpu_finalize_init()
    2febb4a73004 m68k/cpu: Switch to arch_cpu_finalize_init()
    1f4494ea77e8 ia64/cpu: Switch to arch_cpu_finalize_init()
    73719e89e32b ARM: cpu: Switch to arch_cpu_finalize_init()
    1743bc756b6b x86/cpu: Switch to arch_cpu_finalize_init()
    afe787cf253b init: Provide arch_cpu_finalize_init()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 3a44375824..8bb9b8792d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6a552f5822442183d2487c91903f27085183ca0e"
-SRCREV_meta ?= "25f38de25d47570a132a18a1dc147b10e05b378b"
+SRCREV_machine ?= "0d4b4bdf319c66188fed945ed84d55b63467a1cc"
+SRCREV_meta ?= "c068a3afc1a9d73b177643195e6b5546e6141efe"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.251"
+LINUX_VERSION ?= "5.4.252"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 3136b0defc..a9e59473f8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.251"
+LINUX_VERSION ?= "5.4.252"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -16,8 +16,8 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "29ae0b5c67d29249bf00cb8eaaae5914d928bbd6"
-SRCREV_machine ?= "16db12c2685020aa6347a18df5099f40a9176366"
-SRCREV_meta ?= "25f38de25d47570a132a18a1dc147b10e05b378b"
+SRCREV_machine ?= "22f4db08b470bae35d90149956de4cdcd6b4c6ea"
+SRCREV_meta ?= "c068a3afc1a9d73b177643195e6b5546e6141efe"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index a466e5c2fc..f9afeb0acd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,8 +21,8 @@ SRCREV_machine_qemuriscv64 ?= "2adacd3242d46ddaff62e5a4695b98edf01cccc5"
 SRCREV_machine_qemux86 ?= "2adacd3242d46ddaff62e5a4695b98edf01cccc5"
 SRCREV_machine_qemux86-64 ?= "2adacd3242d46ddaff62e5a4695b98edf01cccc5"
 SRCREV_machine_qemumips64 ?= "854f6bee15babf95445644cba59691cd45173180"
-SRCREV_machine ?= "2adacd3242d46ddaff62e5a4695b98edf01cccc5"
-SRCREV_meta ?= "25f38de25d47570a132a18a1dc147b10e05b378b"
+SRCREV_machine ?= "2176ac775b5360b26e8cab0f8c1607853af76633"
+SRCREV_meta ?= "c068a3afc1a9d73b177643195e6b5546e6141efe"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -31,7 +31,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.251"
+LINUX_VERSION ?= "5.4.252"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


