Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D90C001B0
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 03:20:47 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.31966.1688959240340409971
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jul 2023 20:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mf7Kk55W;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-403af7dfa3aso5992771cf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jul 2023 20:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688959239; x=1691551239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1Gtnact5JM4yDuwjeiqmEjFzv2konMsxDTwAk0hFLM=;
        b=mf7Kk55WZYbSNgw5DqP4Rg3BdUKsPQk/CpJjwq36lB6nxW61JgjwDn5CulpTH6vfaz
         EjqDqUR4/9hAaQKx37otp7X0QbpA4xHmKh5woIIWg54kEZBesr6HSyAowDvlE5bpmZWW
         vyX8zA73TZaO+bTtcGKYs4xnUUZ6DoN6oca97mJJy4uZWuukpdB6avetRF/UHxiZ9rJi
         pY94lZRjNTgUtr3gxJmVhQrhTNwq/soZAdgd8iQHxoJiVHNm6WybeuJTdAj4kBkCuXX9
         WsGn33MNKFDc8lUd51GO3n3D1SDn0QKdRmj1+MThcMMIr/JIfBMtDtrkBAWmc5ziNyk/
         GCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688959239; x=1691551239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1Gtnact5JM4yDuwjeiqmEjFzv2konMsxDTwAk0hFLM=;
        b=QI2MkbOeEQBopsNkyeXJMhzt35+FCNkA3fHK7IDfRjUJ6DbbDho2BlYDHdNFuAn4iz
         NEumZLFoIPuCs0OZfNGR6BORhMr9ZK+5z+IoBN8eoLWWsxU6pRZqo509AnH8g4fkbq4Y
         +GWd7nN7kP0CuYaZutC7sB43xwY4kkRlWJ24C6bldn2e2y4VKqvD/r1pA9NLOFnZgYR4
         4yz/E7IqkViQvbd4DAG4tda/ZnTdrgyc/Vc3XgMwolZ6JiWnIy44Kqbdr/ludgSiZM7P
         CiQZ21TWYGLluZqNfwBg+Bx8ESH8+TWOOKMTC5OLJhxumOrPhJW4ff+rGQG5rdIQV9WX
         wooQ==
X-Gm-Message-State: ABy/qLZj3UeeDj5xZ+XWME61wOGpaPpmwstwy/XfjrCQkbU/T4CPDF/e
	7pzQTQm9DXKMO6uBJMmbYJK6EHK+42c=
X-Google-Smtp-Source: APBJJlEDD4t5xOvszg31PHQeNcIZgqyWX5bE2ALeRbzTbf7JiLTiaSh3qqcf1D1e3MBHOrrTJtLD5g==
X-Received: by 2002:a05:622a:1897:b0:3f6:af5f:29a6 with SMTP id v23-20020a05622a189700b003f6af5f29a6mr15816273qtc.33.1688959239357;
        Sun, 09 Jul 2023 20:20:39 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d15-20020a0cf0cf000000b00630228acc45sm5039863qvl.145.2023.07.09.20.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 20:20:38 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/15] linux-yocto/6.1: update to v6.1.38
Date: Sun,  9 Jul 2023 23:20:23 -0400
Message-Id: <42508e8fb4e2d2a161c476c4f8a14c029244bd7b.1688958789.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688958788.git.bruce.ashfield@gmail.com>
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 03:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184054

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    61fd484b2cf6 Linux 6.1.38
    c50065a39279 drm/amd/display: Ensure vmin and vmax adjust for DCE
    9d0b2afadfd7 drm/amdgpu: Validate VM ioctl flags.
    fe56f507a11a docs: Set minimal gtags / GNU GLOBAL version to 6.6.5
    c437b26bc3ae scripts/tags.sh: Resolve gtags empty index generation
    50e36c2897ba perf symbols: Symbol lookup with kcore can fail if multiple segments match stext
    67e3b5230cef nubus: Partially revert proc_create_single_data() conversion
    296927dbae7d execve: always mark stack as growing down during early stack setup
    d856e6f8a0b4 PCI/ACPI: Call _REG when transitioning D-states
    788c76c33df9 PCI/ACPI: Validate acpi_pci_set_power_state() parameter
    a905b0b318ad drm/amd/display: Do not update DRR while BW optimizations pending
    dd6d6f9d47ae drm/amd/display: Remove optimization for VRR updates
    6b2849b3e05d xtensa: fix lock_mm_and_find_vma in case VMA not found

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index b01f09b1a7..30fcbd8e86 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "48cdae83316b7055b4e63f3434ea26b0c04d7c71"
-SRCREV_meta ?= "f15c15c0755e36ec185927dd83a8a569186836eb"
+SRCREV_machine ?= "efb2c857761e865cd7947aab42eaa5ba77ef6ee7"
+SRCREV_meta ?= "2eaed50911009f9ddbc74460093e17b22ef7daa0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.37"
+LINUX_VERSION ?= "6.1.38"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 529f515db1..be27537dbc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.37"
+LINUX_VERSION ?= "6.1.38"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
-SRCREV_meta ?= "f15c15c0755e36ec185927dd83a8a569186836eb"
+SRCREV_machine ?= "b110cf9bbc395fe757956839d8110e72368699f4"
+SRCREV_meta ?= "2eaed50911009f9ddbc74460093e17b22ef7daa0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 4eb2fb11bb..b6a275c363 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "fccbb53f81908991a69214e09ae0eea360410617"
-SRCREV_machine:qemuarm64 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
-SRCREV_machine:qemuloongarch64 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
-SRCREV_machine:qemumips ?= "8370d3d4823bcff9532dd6bb163359f75a5416cd"
-SRCREV_machine:qemuppc ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
-SRCREV_machine:qemuriscv64 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
-SRCREV_machine:qemuriscv32 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
-SRCREV_machine:qemux86 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
-SRCREV_machine:qemux86-64 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
-SRCREV_machine:qemumips64 ?= "efe0a0701a1a8c5b6113d6a06b65857f8c84ac9f"
-SRCREV_machine ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
-SRCREV_meta ?= "f15c15c0755e36ec185927dd83a8a569186836eb"
+SRCREV_machine:qemuarm ?= "a74344429a095a5941cd8dfac532160349344c92"
+SRCREV_machine:qemuarm64 ?= "b110cf9bbc395fe757956839d8110e72368699f4"
+SRCREV_machine:qemuloongarch64 ?= "b110cf9bbc395fe757956839d8110e72368699f4"
+SRCREV_machine:qemumips ?= "78c81e178f8e2ffbb7c03cd324cf50ee0c5c4cf2"
+SRCREV_machine:qemuppc ?= "b110cf9bbc395fe757956839d8110e72368699f4"
+SRCREV_machine:qemuriscv64 ?= "b110cf9bbc395fe757956839d8110e72368699f4"
+SRCREV_machine:qemuriscv32 ?= "b110cf9bbc395fe757956839d8110e72368699f4"
+SRCREV_machine:qemux86 ?= "b110cf9bbc395fe757956839d8110e72368699f4"
+SRCREV_machine:qemux86-64 ?= "b110cf9bbc395fe757956839d8110e72368699f4"
+SRCREV_machine:qemumips64 ?= "6c6b1170464e1f64f78a45cf7e78d5c678f38f48"
+SRCREV_machine ?= "b110cf9bbc395fe757956839d8110e72368699f4"
+SRCREV_meta ?= "2eaed50911009f9ddbc74460093e17b22ef7daa0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "0f4ac6b4c5f00f45b7a429c8a5b028a598c6400c"
+SRCREV_machine:class-devupstream ?= "61fd484b2cf6bc8022e8e5ea6f693a9991740ac2"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.37"
+LINUX_VERSION ?= "6.1.38"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


