Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADC3C41513
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:12 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.16753.1690487048928878161
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=c0mpsf6n;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2681223aaacso860912a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487048; x=1691091848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HccaPT3abiJAZsz4ek6KErxdB5DRrZfzDFt/Bun85bM=;
        b=c0mpsf6np8QhO5ho2JLUeWurcOQMY94QO4iSdZOJV/yVMq4S5t1gknEgxT/FuMXUB3
         53Msu0jAsC8laYZqU9qV4N7KJje+TnFyI9iwSjBLXsJ2ZjvQP6plIoMLt9ptyFpgys/7
         AYj61faL2hPNEErNMAF7V+FGowHlFK6vEpnuP+vq4sBeXppbLHeayvrCjDUFazwad78p
         zmM8zmNhPE2+Zut+PJ8oPNDga76jtzEYlSMxDym++Dz9EUW6DDJDF2pE94fryqo/h3jv
         udoPYKgIJZ3sZB9rccqu5mBlaNaNeYgA244YOu+72TF4qupCBxnrKmeGmmD0pPPa9woA
         bE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487048; x=1691091848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HccaPT3abiJAZsz4ek6KErxdB5DRrZfzDFt/Bun85bM=;
        b=g6w/opMJ7p5H3Op9lBDcOLH3eRKM8rrmuOjgS8AuS/Xo4jju3CcGNDzIZd9u8N1k8p
         w5dBLPphFQ/IF/p10iWduGcIaIRGSPhXKt7jqOiFDIY+QnkKVEQQ05rl7pyLgXv5YYjp
         2rHUFaYdnl7yXqnU2fK7ACFlsVCGhnllpiXq2IFSh0qkBmyvxAaNVh68LZ7gXAdJaBVP
         DIDtAvuNlYCyFM4Bg5i0vZQr7tV0idrZ4Fio9fiF2uL5RV0wBdyNX6LHvdh/QJnDYC4w
         oQNsJJjVb72ucoFack4L/PTiFLEPrJjdzeHv+McVNbxAlmfOg+RIwp+/+iwMMNE0H9s7
         mQ9Q==
X-Gm-Message-State: ABy/qLZIQwcbxMEhvshBXI643rhiPAgWXKzhE49Q/+YlKwsr1F1uxNoq
	oDb1+PdWI8TErsm4hzJZSSvBILGD9eMOTd2k598=
X-Google-Smtp-Source: APBJJlEi0RSgR0A2ZecZmrW0GQteu9iHAYqNojPGxHzpsPWu5IUproRqotXsNN7ScG0KqQ+QRr86OA==
X-Received: by 2002:a17:90a:bd8a:b0:25c:18ad:6b82 with SMTP id z10-20020a17090abd8a00b0025c18ad6b82mr306772pjr.21.1690487047957;
        Thu, 27 Jul 2023 12:44:07 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.44.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:44:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 07/27] linux-yocto/6.1: update to v6.1.38
Date: Thu, 27 Jul 2023 09:43:25 -1000
Message-Id: <eb74b5cc85c7c9172b7b944af160ac7e3701e858.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184982

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b4a4354fff41ffe61a1638b216e3a17e50b5c0e2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 3245c3eab2..5f61c43fed 100644
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
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.37"
+LINUX_VERSION ?= "6.1.38"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


