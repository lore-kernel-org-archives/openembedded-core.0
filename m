Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A348AE728FB
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 20:15:46 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.27966.1696018539157202898
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 13:15:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aHrAT7++;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4180d962b68so74758251cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 13:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696018538; x=1696623338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Lu9wf7WoEezXTVILyoC+B9Y3pTpOPHXETXpNIISzbE=;
        b=aHrAT7++rG9SfTnrKG/d5PUFqHmjBGy2FIluqz+R8RPVTdHNV29PwIm0Wzp6oM2DZD
         6DDh2XNbEhj62zIlYhE7sxFzPuz3jW6dOBPM9sA0WuNnDnjpA6GVFX6vcXSbWtpwzQLr
         OzeicvXgccQFpNvOFIEZItTxX5938p3K14pBz5KLNGyQVMsnzRVhqiVPfVOymxXnGK4P
         YRpb8+1TwZYh02AOzyqOVOriV0qwaxrFF/1/GG1jN/ERLMiBlUEuFB4teVm83jEArvKJ
         0RFkSaVENIGDATuOpzvoXsi2nIzD/ll4ehDzOg6pprniycB1ute9JVUlyMcdbiMCwkTd
         4GHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696018538; x=1696623338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Lu9wf7WoEezXTVILyoC+B9Y3pTpOPHXETXpNIISzbE=;
        b=AdGyAAd3gecuWCscNH3P7U66jZDaY5xTtrJL1wUJ4118bTfVIVokisLkDPbMgAg7/A
         JqKoCSPt11iGa5hSMUuCk1YKpPIz0eFDxa62yp+mjMNU+tf3OxUXT72MO6BiTr3GaTjG
         ZSSXPc2DN4l+qVH76wSqYooBTsSwF3Mi9p9LKx+JHyLcWKsaYDw3RjWcEDy6zR/V2kaF
         yUgWRwr9smSB2WV5Je0ZUWFzTVXeskw+rGqnvtbwZnZk4bDyl4oIhvh56mGdBjEQ81zz
         tegv4yHKM3Dz6giiGfrrOgK1n4hF6NP0/hexSN54BBVYpnD8GWpMZTYBVPwcmi62Id6n
         ROeQ==
X-Gm-Message-State: AOJu0YyJHQdNXmCQ45QgpS3hA2I2hM9lFJ022hzX52a9FRnkPDVtzklM
	11Nuzo5SXtD5hbmGXw3uG+kwE11TRC6e9g==
X-Google-Smtp-Source: AGHT+IH8QoNN0I6jo8TwFXP7mN9iJjrwWSMwz+M/5cDd3Qix9zqY6/r1wv1hIiGKtp+0wbapsXdc4g==
X-Received: by 2002:a05:622a:1303:b0:413:3384:d43f with SMTP id v3-20020a05622a130300b004133384d43fmr6468937qtk.11.1696018538069;
        Fri, 29 Sep 2023 13:15:38 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id y22-20020ac87c96000000b0041957506ca9sm2616656qtv.15.2023.09.29.13.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 13:15:37 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/5] linux-yocto/5.10: update to v5.10.189
Date: Fri, 29 Sep 2023 16:15:32 -0400
Message-Id: <20230929201536.3517331-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 20:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188437

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    de5f63612d16 Linux 5.10.189
    2ae9a73819a7 x86: fix backwards merge of GDS/SRSO bit
    f9167a2d6b94 xen/netback: Fix buffer overrun triggered by unusual packet
    8457fb5740b1 x86/srso: Tie SBPB bit setting to microcode patch detection
    4873939c0e1c x86/srso: Fix return thunks in generated code
    384d41bea948 x86/srso: Add IBPB on VMEXIT
    4acaea47e3bc x86/srso: Add IBPB
    e47af0c255ae x86/srso: Add SRSO_NO support
    df76a59feba5 x86/srso: Add IBPB_BRTYPE support
    3f9b7101bea1 x86/srso: Add a Speculative RAS Overflow mitigation
    34f23ba8a399 x86/cpu, kvm: Add support for CPUID_80000021_EAX
    073a28a9b506 x86/bugs: Increase the x86 bugs vector size to two u32s
    9b7fe7c6fbc0 tools headers cpufeatures: Sync with the kernel sources
    437fa179f213 x86/cpufeatures: Assign dedicated feature word for CPUID_0x8000001F[EAX]
    baf6d6c39e23 x86/cpu: Add VM page flush MSR availablility as a CPUID feature
    675046878431 Documentation/x86: Fix backwards on/off logic about YMM support
    79972c2b95ec x86/mm: Initialize text poking earlier
    1ff14defdfc9 mm: Move mm_cachep initialization to mm_init()
    6ee042fd240f x86/mm: Use mm_alloc() in poking_init()
    f076d0817878 x86/mm: fix poking_init() for Xen PV guests
    583016037a09 x86/xen: Fix secondary processors' FPU initialization
    eb13cce48874 KVM: Add GDS_NO support to KVM
    7db4ddcb8d8e x86/speculation: Add Kconfig option for GDS
    363c98f9cfa8 x86/speculation: Add force option to GDS mitigation
    288a2f6bc1ce x86/speculation: Add Gather Data Sampling mitigation
    4ae1cbb730bd x86/fpu: Move FPU initialization into arch_cpu_finalize_init()
    2462bc3ef061 x86/fpu: Mark init functions __init
    7a2f42bce9ab x86/fpu: Remove cpuinfo argument from init functions
    18fcd72da1ed init, x86: Move mem_encrypt_init() into arch_cpu_finalize_init()
    09658b81d158 init: Invoke arch_cpu_finalize_init() earlier
    bf2fa3a9d0e6 init: Remove check_bugs() leftovers
    b05031c2bca7 um/cpu: Switch to arch_cpu_finalize_init()
    2edb3b39ca79 sparc/cpu: Switch to arch_cpu_finalize_init()
    3c45134b38b4 sh/cpu: Switch to arch_cpu_finalize_init()
    75bb54c951e9 mips/cpu: Switch to arch_cpu_finalize_init()
    1cd3fc18eb16 m68k/cpu: Switch to arch_cpu_finalize_init()
    12d93c6c98d5 ia64/cpu: Switch to arch_cpu_finalize_init()
    c0fff20d4efa ARM: cpu: Switch to arch_cpu_finalize_init()
    e5eb18e164d0 x86/cpu: Switch to arch_cpu_finalize_init()
    6e606e681873 init: Provide arch_cpu_finalize_init()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 5b59ebac16..772ffac071 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "40d51460c17be51e4ebcdcc54a8ee8c86707c56c"
-SRCREV_meta ?= "9b0d4e338b1bbdd683347cf9365bacfec2169035"
+SRCREV_machine ?= "63fd205e5d1e048a576d5ba03cdbdf5782a2f6b4"
+SRCREV_meta ?= "603507f09e4a22a650e37fb9dcfbcb69ceb36841"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.188"
+LINUX_VERSION ?= "5.10.189"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 3a58a1a659..aebec33555 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.188"
+LINUX_VERSION ?= "5.10.189"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "41daa5d20567419e303d0b684fd3c3c859446d24"
-SRCREV_machine ?= "085bed8577aa6435339ff83339e38dfd9e7994a6"
-SRCREV_meta ?= "9b0d4e338b1bbdd683347cf9365bacfec2169035"
+SRCREV_machine:qemuarm ?= "8f8fe5c5719959ad536be166937fc22606b7a7f3"
+SRCREV_machine ?= "452190ae123212f7d3c233fc48419c60874f4223"
+SRCREV_meta ?= "603507f09e4a22a650e37fb9dcfbcb69ceb36841"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 6807a6b2d8..11f583dccf 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "66536572b0fe35ac0e5158d69d12641281ab93ef"
-SRCREV_machine:qemuarm64 ?= "00d0178dae976305eaecc7fc119da63930bcf07f"
-SRCREV_machine:qemumips ?= "8cc44bb4c536028438decbb5abf2d8b731898ec0"
-SRCREV_machine:qemuppc ?= "1f2a193c7f82e2f2c7eefc2fa35dce5b96cc3ba9"
-SRCREV_machine:qemuriscv64 ?= "d3e6aa7bf695da482f46a6f5575dfd66bd48ba6c"
-SRCREV_machine:qemuriscv32 ?= "d3e6aa7bf695da482f46a6f5575dfd66bd48ba6c"
-SRCREV_machine:qemux86 ?= "d3e6aa7bf695da482f46a6f5575dfd66bd48ba6c"
-SRCREV_machine:qemux86-64 ?= "d3e6aa7bf695da482f46a6f5575dfd66bd48ba6c"
-SRCREV_machine:qemumips64 ?= "2fe172b06a5b6d8840c0c0226a1501b627b9e703"
-SRCREV_machine ?= "d3e6aa7bf695da482f46a6f5575dfd66bd48ba6c"
-SRCREV_meta ?= "9b0d4e338b1bbdd683347cf9365bacfec2169035"
+SRCREV_machine:qemuarm ?= "0f9599a793f23d2e1cd2da30aba53c4876b3621d"
+SRCREV_machine:qemuarm64 ?= "358a41898b853ccfc3309fcf30a95621b3d15ec6"
+SRCREV_machine:qemumips ?= "8ad0f4fa028c844dbc6f32321664488e50bd5e64"
+SRCREV_machine:qemuppc ?= "4f0a30a5edc13b65482bb788d1a2eb7a5405190a"
+SRCREV_machine:qemuriscv64 ?= "fc99f5e7ce23e4814c7b41f24c5d0296754be89e"
+SRCREV_machine:qemuriscv32 ?= "fc99f5e7ce23e4814c7b41f24c5d0296754be89e"
+SRCREV_machine:qemux86 ?= "fc99f5e7ce23e4814c7b41f24c5d0296754be89e"
+SRCREV_machine:qemux86-64 ?= "fc99f5e7ce23e4814c7b41f24c5d0296754be89e"
+SRCREV_machine:qemumips64 ?= "a01ff251fdd19b1ab7ee109c7ee2213e6b01a28b"
+SRCREV_machine ?= "fc99f5e7ce23e4814c7b41f24c5d0296754be89e"
+SRCREV_meta ?= "603507f09e4a22a650e37fb9dcfbcb69ceb36841"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.188"
+LINUX_VERSION ?= "5.10.189"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


