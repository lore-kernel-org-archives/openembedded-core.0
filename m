Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148EBC83F33
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 14:37:33 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.23202.1693924643415782843
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 07:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CU14zlIp;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-76f08e302a1so159873585a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 07:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693924642; x=1694529442; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgBWh0DfTo+Oz2l9sZCesiAk5aO6m3Wl2aGSTdlZ2VU=;
        b=CU14zlIpkvFx2KN4X+uCaEOR2fhFNlj3qaLE/IgQ06m8tOVSmfsEilKeGHFeBYCMFN
         xxlNOfaTZ/NkgiJplWbWFshGVXeeUa7M5gHaBDLqud7lneSbSJvrljZmARnlgpO4Vs/A
         nv5kMTnTFFITsEQ79TYbWy8r3y2DWBOcbCEsRSKYY4nmO74YdvwHWdYLsVCNxiI7Kibh
         n9VLyZyXfMyfJ1n0MlCZTEjESMWfxAvBxdBq99dljkeP82xu2N4oWBGzYW2uTpl5xvNl
         L3lwRxkp1d+Y4YI01M1qWwmDFOV2NtEXAUW8SMBbShonIFssLkl99XV8TZfDosXrit0T
         Es1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693924642; x=1694529442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgBWh0DfTo+Oz2l9sZCesiAk5aO6m3Wl2aGSTdlZ2VU=;
        b=gCHatCGhib4PGjyuHVxOfR/TVqywp2uWWnwxa1aFcyb6O1qSVSUZI6FrWZaMUVifTk
         hea/Eqd7slmw1hDJylwvcc84wZcBvIJLydxCCKxMJ7el8ZiPYHj7Lx+MTNkGPbgo8tTy
         +uOZ2F46TzFjFkON/+xVMGoVgRVognOlTOCQjzXt0Xr/Rkml2fZx8rNOkbBGrXJiop2v
         7aHUez7SxVkci6UBg6Gz76Qc32ctXVrLc3lUEr5uve1bFKyDMuowktGkvoYbJe3K/xR7
         hSt7VN0cLTZcpzCWLDoHOBeevbCmBMrxzXl0/omznoT29Y7Y3reXsT7FmzrvwfLGXwXc
         73Ow==
X-Gm-Message-State: AOJu0YyLkgaiHcl3rmUTWxp2kvCGDqVFS2m/o5PyKFaZFdeJy8liJc7W
	qK2VQoK4H0Fw7BsxptW5VSHWBgkAlEdUpw==
X-Google-Smtp-Source: AGHT+IFMu+F2xS1l+bnmyNaNR1Iz5InQHoShufxX0umtdvGe28+2Aq9raO2A/fKBNlauli0C7Zc8Qw==
X-Received: by 2002:a05:620a:2681:b0:76d:89c5:78a0 with SMTP id c1-20020a05620a268100b0076d89c578a0mr15818082qkp.63.1693924642382;
        Tue, 05 Sep 2023 07:37:22 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id f9-20020a05620a15a900b0076ee82f7726sm4066227qkk.132.2023.09.05.07.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 07:37:21 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] linux-yocto/6.4: update to v6.4.14
Date: Tue,  5 Sep 2023 10:37:12 -0400
Message-Id: <9d6f6dc6dc8eb7047945a6330e9ba42ca463de45.1693924532.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693924532.git.bruce.ashfield@gmail.com>
References: <cover.1693924532.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 14:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187222

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    babc8be398c3 Linux 6.4.14
    9a3ac3bf4dbf thunderbolt: Fix a backport error for display flickering issue
    bb899e081c6c kallsyms: Fix kallsyms_selftest failure
    ebc51587d0c5 parisc: sys_parisc: parisc_personality() is called from asm code
    895af97c9792 lockdep: fix static memory detection even more
    98e4c99b0576 ARM: module: Use module_init_layout_section() to spot init sections
    41ecb281f7c2 arm64: module: Use module_init_layout_section() to spot init sections
    49b7dbeddff3 arm64: module-plts: inline linux/moduleloader.h
    05dae005f50a module: Expose module_init_layout_section()
    d65d7487c1c2 module/decompress: use vmalloc() for zstd decompression workspace
    bf50fc751c46 ACPI: thermal: Drop nocrt parameter

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.4.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index fac0eaf156..aacbea40c0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6c3fed2773c3f8ac4f389c1a16b74af499a15d00"
-SRCREV_meta ?= "63304ee24efde8260ecdc840eb2e2fb7ae1f1193"
+SRCREV_machine ?= "06b99074bdc85095a2b3411dcade4a64a8e8f7c0"
+SRCREV_meta ?= "f12230a4c8a427af642be8196828a23f4562bc86"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.4.13"
+LINUX_VERSION ?= "6.4.14"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index dd782146b0..c3a7a16342 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.4.inc
 
-LINUX_VERSION ?= "6.4.13"
+LINUX_VERSION ?= "6.4.14"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9fc390f3967223a546a75769e28a1ef6bfd98d7b"
-SRCREV_meta ?= "63304ee24efde8260ecdc840eb2e2fb7ae1f1193"
+SRCREV_machine ?= "800df81fa2a8bacd6487a19115b3f89f34620249"
+SRCREV_meta ?= "f12230a4c8a427af642be8196828a23f4562bc86"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index 6e18ac688d..e959b2a88f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.4/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.4/standard/base"
 KBRANCH:qemumips64 ?= "v6.4/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d0f3b0622c54ce9a203363c0c20975a8ff888286"
-SRCREV_machine:qemuarm64 ?= "9fc390f3967223a546a75769e28a1ef6bfd98d7b"
-SRCREV_machine:qemuloongarch64 ?= "9fc390f3967223a546a75769e28a1ef6bfd98d7b"
-SRCREV_machine:qemumips ?= "cb78ab735dcba4631199b347993d9f3c00fbf4af"
-SRCREV_machine:qemuppc ?= "9fc390f3967223a546a75769e28a1ef6bfd98d7b"
-SRCREV_machine:qemuriscv64 ?= "9fc390f3967223a546a75769e28a1ef6bfd98d7b"
-SRCREV_machine:qemuriscv32 ?= "9fc390f3967223a546a75769e28a1ef6bfd98d7b"
-SRCREV_machine:qemux86 ?= "9fc390f3967223a546a75769e28a1ef6bfd98d7b"
-SRCREV_machine:qemux86-64 ?= "9fc390f3967223a546a75769e28a1ef6bfd98d7b"
-SRCREV_machine:qemumips64 ?= "8a49433d63c8109fc107653733313e8aad1083a1"
-SRCREV_machine ?= "9fc390f3967223a546a75769e28a1ef6bfd98d7b"
-SRCREV_meta ?= "63304ee24efde8260ecdc840eb2e2fb7ae1f1193"
+SRCREV_machine:qemuarm ?= "0194f88dc4ac51536f9bb2bf751d256bc5fe5d69"
+SRCREV_machine:qemuarm64 ?= "800df81fa2a8bacd6487a19115b3f89f34620249"
+SRCREV_machine:qemuloongarch64 ?= "800df81fa2a8bacd6487a19115b3f89f34620249"
+SRCREV_machine:qemumips ?= "179200623f949dde2afeca75943700a2cd0684ab"
+SRCREV_machine:qemuppc ?= "800df81fa2a8bacd6487a19115b3f89f34620249"
+SRCREV_machine:qemuriscv64 ?= "800df81fa2a8bacd6487a19115b3f89f34620249"
+SRCREV_machine:qemuriscv32 ?= "800df81fa2a8bacd6487a19115b3f89f34620249"
+SRCREV_machine:qemux86 ?= "800df81fa2a8bacd6487a19115b3f89f34620249"
+SRCREV_machine:qemux86-64 ?= "800df81fa2a8bacd6487a19115b3f89f34620249"
+SRCREV_machine:qemumips64 ?= "4ce1ab0a4fce437802b0f7305289b036ffb4ccae"
+SRCREV_machine ?= "800df81fa2a8bacd6487a19115b3f89f34620249"
+SRCREV_meta ?= "f12230a4c8a427af642be8196828a23f4562bc86"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "388f6d150784d9d1d25a3b6bace00aa52a85daf3"
+SRCREV_machine:class-devupstream ?= "babc8be398c3a0701e52582f93bfba946e9e5f8e"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.4/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.4.13"
+LINUX_VERSION ?= "6.4.14"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


