Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E06EE95A77
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 22:25:52 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.27683.1696717545529088144
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 15:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=G4dv87Ux;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.43, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6c4fc2ce697so2326261a34.0
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 15:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696717544; x=1697322344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zeBEOggoAYmxlDyuc085+X3dvxkZl+Mt1KcBlQ7aucM=;
        b=G4dv87Ux1oirrFIH9VbY+EjyaBsVbRNnAxoXbDVablkxIIzK1vQCoZqtED446j62TS
         K5pIo5N/6F8uH0e49HgdrVt15uLyG5XpARuszS7SkGtUz3xThNMKPOTWepR8d10EHgc0
         3V8sp2WQnmbCqUAPccSqe6L261K1FRHT3kD/jz7FBmUy8TCtGUm//Wd5vgfsjTcsbfmD
         nF/+LvgXLBZAaZAIx5Oj9uIIcodCeY21eA091H5uP20JougRhWnQ6/wK/iHwitb6vmhA
         U+3/23cxJQg/QcFR8M1LF5dqB6sLP0qqqDzI/PB1B/pNhtNLLvKbxkPlNoOh0PGkd9Bl
         QNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696717544; x=1697322344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeBEOggoAYmxlDyuc085+X3dvxkZl+Mt1KcBlQ7aucM=;
        b=phaznlajFfIVLj/dhAD4r7Zbr9tRxu+X0Cp2IFIRwjKSwM4p5lrWW4g8sJHS7sV2AI
         XkEWgFs+/WqvSSJYVVroZLuyfbZPWAaBdZ6QZ9SZDXLvmo1rOxIE5MrFjaYMpsM0SuAQ
         IONnC+O0xHZECUZBNlcTSxMKaDrE+tpAZwNRGEguGJkepsQXhUBtqzMCCar3chTK+gzv
         AjJj8jPpkQD7RVjZeYOsJsi1rgUj9nbZ6A5GT11zi95/QIOHoP6Da08xP5CDvp49bxY5
         aapyizu9UugjmfZBZChhzll11HmXs3ts4cm5lgdV7u6OtrR7eYReP+4nIc/VlZxHhp0u
         LuGA==
X-Gm-Message-State: AOJu0YxjfeBqIoYCx4uTg5o2096RIpGLhbtJ0GNJiITL7a7gYwKDJGzo
	/nvtT0ykr9oCIs8yFH3IFyE2Yr8Iw67Oy3M5340=
X-Google-Smtp-Source: AGHT+IEFQnyaB1QlWFwbmHOT++6OqoUcmXVCu5ZSZ8it/Vqxvszp4ATlCs9juw8nZlILqM1/r68JQg==
X-Received: by 2002:a05:6871:451:b0:1dc:ddcd:876f with SMTP id e17-20020a056871045100b001dcddcd876fmr13609273oag.41.1696717544315;
        Sat, 07 Oct 2023 15:25:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj15-20020a170903048f00b001b8c6890623sm6424076plb.7.2023.10.07.15.25.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 15:25:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 11/19] linux-yocto/6.1: update to v6.1.51
Date: Sat,  7 Oct 2023 12:25:07 -1000
Message-Id: <9d0c26e3ac58c9c8d9e5bad8e3bff97f8dcdd507.1696702947.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696702947.git.steve@sakoman.com>
References: <cover.1696702947.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 22:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188812

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    c2cbfe5f5122 Linux 6.1.51
    ae0188f9c2a8 thunderbolt: Fix a backport error for display flickering issue
    583a8426abb3 kallsyms: Fix kallsyms_selftest failure
    5d54040e9d57 io_uring/parisc: Adjust pgoff in io_uring mmap() for parisc
    fff21bc26bbd parisc: sys_parisc: parisc_personality() is called from asm code
    e8ac4be71701 parisc: Cleanup mmap implementation regarding color alignment
    b3d099df68de lockdep: fix static memory detection even more
    1cb79e7e0572 ARM: module: Use module_init_layout_section() to spot init sections
    8d99105d6a10 arm64: module: Use module_init_layout_section() to spot init sections
    42efdb3531ab arm64: module-plts: inline linux/moduleloader.h
    207e228bf1f3 module: Expose module_init_layout_section()
    b0dc0aac2085 ACPI: thermal: Drop nocrt parameter

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ade4bf6b95aca4c168c3d33c2bcfc429f41d49b8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index d15cdf1ac4..a391e3b0e6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "347c811f6ceed10dd5f13edfedfdb8a097584c3d"
-SRCREV_meta ?= "d0d2dd467959c77db90458d2fc6864e9505418d5"
+SRCREV_machine ?= "ad7c05a03b8d70ee30ecce783a861cb96ea258cf"
+SRCREV_meta ?= "f845a7f37d7114230d6609e2bd630070f2f6cd9b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.50"
+LINUX_VERSION ?= "6.1.51"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index bef3398d9f..e90e92ccbc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.50"
+LINUX_VERSION ?= "6.1.51"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f191b0373f4daac610e4c24d5e6248105c67d109"
-SRCREV_meta ?= "d0d2dd467959c77db90458d2fc6864e9505418d5"
+SRCREV_machine ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
+SRCREV_meta ?= "f845a7f37d7114230d6609e2bd630070f2f6cd9b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 8271f05aa0..c55d411784 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "955185e6572be6bd7604f011ef330147344f9b5e"
-SRCREV_machine:qemuarm64 ?= "f191b0373f4daac610e4c24d5e6248105c67d109"
-SRCREV_machine:qemuloongarch64 ?= "f191b0373f4daac610e4c24d5e6248105c67d109"
-SRCREV_machine:qemumips ?= "0747ac9d34f9bee0ba8b465f501e2d8d34e6523e"
-SRCREV_machine:qemuppc ?= "f191b0373f4daac610e4c24d5e6248105c67d109"
-SRCREV_machine:qemuriscv64 ?= "f191b0373f4daac610e4c24d5e6248105c67d109"
-SRCREV_machine:qemuriscv32 ?= "f191b0373f4daac610e4c24d5e6248105c67d109"
-SRCREV_machine:qemux86 ?= "f191b0373f4daac610e4c24d5e6248105c67d109"
-SRCREV_machine:qemux86-64 ?= "f191b0373f4daac610e4c24d5e6248105c67d109"
-SRCREV_machine:qemumips64 ?= "dac2da1acf6f59c2ffc1187e2a8ba6fc4c88ab30"
-SRCREV_machine ?= "f191b0373f4daac610e4c24d5e6248105c67d109"
-SRCREV_meta ?= "d0d2dd467959c77db90458d2fc6864e9505418d5"
+SRCREV_machine:qemuarm ?= "8c81de99a4b9f69345873b06077f9d4e1321298e"
+SRCREV_machine:qemuarm64 ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
+SRCREV_machine:qemuloongarch64 ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
+SRCREV_machine:qemumips ?= "733cb5842aeac106f5606df4da7c64a180f0c500"
+SRCREV_machine:qemuppc ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
+SRCREV_machine:qemuriscv64 ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
+SRCREV_machine:qemuriscv32 ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
+SRCREV_machine:qemux86 ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
+SRCREV_machine:qemux86-64 ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
+SRCREV_machine:qemumips64 ?= "1c11fe963667e9380725bef0650aeaea8544ea8b"
+SRCREV_machine ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
+SRCREV_meta ?= "f845a7f37d7114230d6609e2bd630070f2f6cd9b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "a2943d2d9a00ae7c5c1fde2b2e7e9cdb47e7db05"
+SRCREV_machine:class-devupstream ?= "c2cbfe5f51227dfe6ef7be013f0d56a32c040faa"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.50"
+LINUX_VERSION ?= "6.1.51"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


