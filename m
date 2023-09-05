Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14939CA0FE9
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 14:37:33 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.23007.1693924644871080919
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 07:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Ode7iOcY;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-76f17eab34eso156730285a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 07:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693924644; x=1694529444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0igLf3yq0X8b2f5HVUYJzyDhUxf5uRlPf26qWz/vx2Y=;
        b=Ode7iOcY3ktXzGukAifvzYmzeZ6589Y+EacboVX+kjGs+jSKd3R1hPVKKHM7XkCjsm
         S4vEpRn6hcWJf2VYU/fXHwoYzCPbGtALtp3FocXtNHSrbXEGJ0LK7DUvQKXLeX+SnjX5
         2v++kZEjlnb81sec7vuYzaW2Bl9joCMRHb0mICkhBlyoDvSBvLOrGcv/WKA7jySkbZuk
         WVsZM4eCFX4C6c5aFdf0aXijtmQVIUb2+B2MrZcn/UuFJTZomqWLO6te0+sQBCuWIKQS
         JsP5IE4aTelbki1JvrFyd2UbaH23X0E8MIwHbQA/12NoHSXozvbHxgJJrYaBxyl1oJ24
         XqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693924644; x=1694529444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0igLf3yq0X8b2f5HVUYJzyDhUxf5uRlPf26qWz/vx2Y=;
        b=TkdFWUAo9cS1ZMUVLxf/yXoQ1RymJGFJNcP7Ykyen04ieTnfio+Pdwx0ISIy4tspwk
         GlctSeFNY1n1M/ddG99sySdhfmMPT0qYz0op8SSbLTbGm/SjgUKy/d/DW32Csw5LaOtF
         Igs36daIO9e3u+Ns/iQEFEeqRqeBCtf7jlaT8TBayA77oNGk6NLZ8CjeokzZlwNiHFI3
         FBRT7/M+074tcZVcJE52fsyIg8kgHCeaNk/USTthAb00DGXnDNw1QlYONcIQXeVHDdaw
         y91jG/Y/u8O5tsQpaHWJcAslkJMb7DWW6ufC4JmPrGTWmkNs0ijbfRMJkaj9Arltj3a3
         2eHQ==
X-Gm-Message-State: AOJu0Yz8Cf/W33lFxtGUWVYieR5IxzcaOLh5akCzD/8AE76ZOazRShqZ
	hrorArsfnP6VqPGvX4L3QbE=
X-Google-Smtp-Source: AGHT+IH0s6ZNu26JfmscymPSwX8eekIHDLEZxYv4vHXOxeedg5/AYYdboZxyRMZUFtsXTzSbCPJqIw==
X-Received: by 2002:a05:620a:2849:b0:767:261d:1ef6 with SMTP id h9-20020a05620a284900b00767261d1ef6mr14163984qkp.59.1693924643863;
        Tue, 05 Sep 2023 07:37:23 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id f9-20020a05620a15a900b0076ee82f7726sm4066227qkk.132.2023.09.05.07.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 07:37:22 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] linux-yocto/6.1: update to v6.1.51
Date: Tue,  5 Sep 2023 10:37:13 -0400
Message-Id: <42401daa4b26a9640e0b694c958a020ff9a6544d.1693924532.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693924532.git.bruce.ashfield@gmail.com>
References: <cover.1693924532.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 14:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187223

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
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 7839dea7b4..5a42da2019 100644
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
index 8709ad6704..3fd9a0e2a9 100644
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
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index ba0289a47f..3798ae3db9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
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
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.50"
+LINUX_VERSION ?= "6.1.51"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


