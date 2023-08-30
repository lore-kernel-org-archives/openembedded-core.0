Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E839DC83F19
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:48:59 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.1276.1693417729757330006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UOFgvwm0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-68c3b9f83f4so3521739b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693417729; x=1694022529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gz53unle4k577LFsLxDiatD0pMgild6RnQz3OczdWnc=;
        b=UOFgvwm0nAveJd2QubdbH5REooYrYRTvkdc00poLLbCjIF14S3IUsYGOd1I5RpksvQ
         LX1FEwOHdpQ50PBBzv5aJKVW5b8+6Bb5RUsgoEwXLWAsGejHjw7r0Oj086UmIatQ0sek
         f1T6ObJ5WPWbQNqqgXnemRdNQcA3Ah2mvnTX8cuaCflMSVZZGJssnkkl3BEaCSCa4Z9B
         hSb2RGz7byToSiiCOFUES10l9iLh07K/gUV93X0VjfIHCTEb0J9i8AkMjLwo4SVaURo+
         zvTxhim5/X6FoqZQLEKyAP3Qo6ZogfpcS5Aa8MTSMBubSH7zsMLrA+YBimPZFG55wYGm
         +AZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693417729; x=1694022529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gz53unle4k577LFsLxDiatD0pMgild6RnQz3OczdWnc=;
        b=UB83ju8117r+TIpNXEj14xFZ7UcjU1CryoSq2u5xGCFRYuk3gEAGxwHYlw0NglWENB
         Wl7A3IEiuV3quGMT4c/hWfyvHYGYoO9iE/ViN/PpvdtMO9wGF+gyU0XYt894kA9qJbdL
         wZbM0kKI0fLE6kRG6wA61t6hggZ8lD3y99pZN2MUlDGyfIsgRdf3psdaU+w3X2Vx2gmI
         wvp1/V1/euvws+M62iasEDXca/xBI74Qh5MJ6uDkOpzxWMGPu3uFcGdFlkJbZ6acS4Fx
         1+gNCvp1vWFaVzhh94EjgRZNkeqkjbPhmzs2Il6A1713LPuYzWfaoVasJjQvU/LE5zxN
         PI7w==
X-Gm-Message-State: AOJu0YyRNgU9mVVx7bIFGnHEEXy59rz4qaulp6r7Vk5qQgytvnMdx8DV
	Kdrw8v8cEO121yA/GRxOCz0tAAQPJIjGjcCoAZ0=
X-Google-Smtp-Source: AGHT+IH4BD/r5kynIsh0/MkK/krGd+XspBhbRVsRxsyq8jrfuu9EMTcKN7XAlY7on6DYT77AFkyCEA==
X-Received: by 2002:a05:6a00:2192:b0:68a:2c24:57d6 with SMTP id h18-20020a056a00219200b0068a2c2457d6mr2929374pfi.4.1693417728862;
        Wed, 30 Aug 2023 10:48:48 -0700 (PDT)
Received: from xps13.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id fm14-20020a056a002f8e00b006889348ba6dsm10567578pfb.93.2023.08.30.10.48.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 10:48:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/20] linux-yocto/6.1: update to v6.1.44
Date: Wed, 30 Aug 2023 07:48:12 -1000
Message-Id: <ab360d4cbaed4c8d4c625a9ed363d143fce16969.1693417541.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693417541.git.steve@sakoman.com>
References: <cover.1693417541.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 17:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186910

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    0a4a7855302d Linux 6.1.44
    dd5f2ef16e3c x86: fix backwards merge of GDS/SRSO bit
    fa5b932b77c8 xen/netback: Fix buffer overrun triggered by unusual packet
    4f25355540ad x86/srso: Tie SBPB bit setting to microcode patch detection
    77cf32d0dbfb x86/srso: Add a forgotten NOENDBR annotation
    c7f2cd045542 x86/srso: Fix return thunks in generated code
    c9ae63d773ca x86/srso: Add IBPB on VMEXIT
    79c8091888ef x86/srso: Add IBPB
    98f62883e751 x86/srso: Add SRSO_NO support
    9139f4b6dd4f x86/srso: Add IBPB_BRTYPE support
    ac41e90d8daa x86/srso: Add a Speculative RAS Overflow mitigation
    dec3b91f2c4b x86/cpu, kvm: Add support for CPUID_80000021_EAX
    dfede4cb8ef7 x86/bugs: Increase the x86 bugs vector size to two u32s
    dacb0bac2edb Documentation/x86: Fix backwards on/off logic about YMM support
    051f5dcf144a x86/mm: Initialize text poking earlier
    e0fd83a193c5 mm: Move mm_cachep initialization to mm_init()
    9ae15aaff39c x86/mm: Use mm_alloc() in poking_init()
    d972c8c08f96 x86/mm: fix poking_init() for Xen PV guests
    7f3982de36c6 x86/xen: Fix secondary processors' FPU initialization
    baa7b7501e41 x86/mem_encrypt: Unbreak the AMD_MEM_ENCRYPT=n build
    b6fd07c41b4c KVM: Add GDS_NO support to KVM
    c04579e95492 x86/speculation: Add Kconfig option for GDS
    92fc27c79bc7 x86/speculation: Add force option to GDS mitigation
    c66ebe070d96 x86/speculation: Add Gather Data Sampling mitigation
    f25ad76d9217 x86/fpu: Move FPU initialization into arch_cpu_finalize_init()
    e26932942b2c x86/fpu: Mark init functions __init
    9e8d9d399094 x86/fpu: Remove cpuinfo argument from init functions
    c956807d8462 x86/init: Initialize signal frame size late
    b0837880fa65 init, x86: Move mem_encrypt_init() into arch_cpu_finalize_init()
    8183a89caf67 init: Invoke arch_cpu_finalize_init() earlier
    a3342c60dcc5 init: Remove check_bugs() leftovers
    8beabde0ed8d um/cpu: Switch to arch_cpu_finalize_init()
    ce97072e10cc sparc/cpu: Switch to arch_cpu_finalize_init()
    84f585542ec6 sh/cpu: Switch to arch_cpu_finalize_init()
    6a90583dbd9b mips/cpu: Switch to arch_cpu_finalize_init()
    489ae02c8993 m68k/cpu: Switch to arch_cpu_finalize_init()
    08e86d42e2c9 loongarch/cpu: Switch to arch_cpu_finalize_init()
    403e4cc67e4c ia64/cpu: Switch to arch_cpu_finalize_init()
    e2e06240ae47 ARM: cpu: Switch to arch_cpu_finalize_init()
    7918a3555a25 x86/cpu: Switch to arch_cpu_finalize_init()
    d5501f2ff80d init: Provide arch_cpu_finalize_init()

(From OE-Core rev: c8b669d53b3444191c83f171768b03f96913f4eb)

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ee0f9bb134ed2167bd014aaa0fafa551215a6f28)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 0645458d11..5323ae02ca 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ca3ebd29a77417d2c6cabc451496f2283d69e46d"
-SRCREV_meta ?= "9f8ee63473567964331b9465fa1aba301a9a725b"
+SRCREV_machine ?= "cd11a96d480a4748f96cb93d323c3eb8bbd8935d"
+SRCREV_meta ?= "fd76f76e2b84ddc47ade29ca3118ff14c2b9b67e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.43"
+LINUX_VERSION ?= "6.1.44"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index dfc1e5e5d6..3d392cb9cf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.43"
+LINUX_VERSION ?= "6.1.44"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "19cd9d8c4bafb673a03b2d7c22407d7c8d192a96"
-SRCREV_meta ?= "9f8ee63473567964331b9465fa1aba301a9a725b"
+SRCREV_machine ?= "a0e01625bc57f4e70ce779097fd99321377e48cc"
+SRCREV_meta ?= "fd76f76e2b84ddc47ade29ca3118ff14c2b9b67e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index c9694fb58e..5b88274587 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d6ed8644d9b0767f8f676987a5c4f61173b803a8"
-SRCREV_machine:qemuarm64 ?= "19cd9d8c4bafb673a03b2d7c22407d7c8d192a96"
-SRCREV_machine:qemuloongarch64 ?= "19cd9d8c4bafb673a03b2d7c22407d7c8d192a96"
-SRCREV_machine:qemumips ?= "6e0c4ce9fd26b55a23becbddd466d0100b3fc2b0"
-SRCREV_machine:qemuppc ?= "19cd9d8c4bafb673a03b2d7c22407d7c8d192a96"
-SRCREV_machine:qemuriscv64 ?= "19cd9d8c4bafb673a03b2d7c22407d7c8d192a96"
-SRCREV_machine:qemuriscv32 ?= "19cd9d8c4bafb673a03b2d7c22407d7c8d192a96"
-SRCREV_machine:qemux86 ?= "19cd9d8c4bafb673a03b2d7c22407d7c8d192a96"
-SRCREV_machine:qemux86-64 ?= "19cd9d8c4bafb673a03b2d7c22407d7c8d192a96"
-SRCREV_machine:qemumips64 ?= "98b8dbe56e119690cdc0af0661867df6c3ee39a2"
-SRCREV_machine ?= "19cd9d8c4bafb673a03b2d7c22407d7c8d192a96"
-SRCREV_meta ?= "9f8ee63473567964331b9465fa1aba301a9a725b"
+SRCREV_machine:qemuarm ?= "586e4b8bd93c81f8f5f81f7fe8e945800c4b1190"
+SRCREV_machine:qemuarm64 ?= "a0e01625bc57f4e70ce779097fd99321377e48cc"
+SRCREV_machine:qemuloongarch64 ?= "a0e01625bc57f4e70ce779097fd99321377e48cc"
+SRCREV_machine:qemumips ?= "d476b8a1ff748bab6f12e687cbdea543b28edc63"
+SRCREV_machine:qemuppc ?= "a0e01625bc57f4e70ce779097fd99321377e48cc"
+SRCREV_machine:qemuriscv64 ?= "a0e01625bc57f4e70ce779097fd99321377e48cc"
+SRCREV_machine:qemuriscv32 ?= "a0e01625bc57f4e70ce779097fd99321377e48cc"
+SRCREV_machine:qemux86 ?= "a0e01625bc57f4e70ce779097fd99321377e48cc"
+SRCREV_machine:qemux86-64 ?= "a0e01625bc57f4e70ce779097fd99321377e48cc"
+SRCREV_machine:qemumips64 ?= "33526acd1493dc6cf9c26296313888c461fdfa8f"
+SRCREV_machine ?= "a0e01625bc57f4e70ce779097fd99321377e48cc"
+SRCREV_meta ?= "fd76f76e2b84ddc47ade29ca3118ff14c2b9b67e"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "52a953d0934b17a88f403b4135eb3cdf83d19f91"
+SRCREV_machine:class-devupstream ?= "0a4a7855302d56a1d75cec3aa9a6914a3af9c6af"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.43"
+LINUX_VERSION ?= "6.1.44"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


