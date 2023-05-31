Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C2AC7EE33
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 18:49:18 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.2516.1685558948157351752
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 11:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=l9aTcf+e;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-3f81396e435so30890371cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 11:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685558947; x=1688150947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncsUTh0s2/LvSTDL3Str0/44+Oxj9Y7eUBFZKJyXqrY=;
        b=l9aTcf+e7QIkzjznX8s0tp/RYMen6aJL8R/L7pVzLsAADYK+Os4+nZ30A6qMyTp2yL
         A2R4Zn3jOOlcyMFNz6f3w75UvzQ1ccmxSVDy+RRuNV97x1eAmzPn7tI++jAU16lypWaT
         +JeBkAAtrtE+dZ24m3mp2OJipTaFL74twFgUCjyCJYqlWdzV0kmoBZd2rohUAbku39X0
         j05UjHQ1b50d+J0x+2W79cSFE7+j/QV1gYOUK7FtI9YyARdw5UDPYEHzpsupW+pW0hWr
         ylH8NWKqf1yanW3pbteY4sDf2g1oMdcx9GLJzdpmyEwvrIl8fzdYrbMbtTPz/UQ7bKSc
         T71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685558947; x=1688150947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncsUTh0s2/LvSTDL3Str0/44+Oxj9Y7eUBFZKJyXqrY=;
        b=KQFSENj8bjsSpPZ2KfCFt9Qxej69XappadZ/f2J9f/7XnrbnlnhLn/HU0Dz8xUPKod
         rZcFqoXr2G1eJL0EjURfSGr7EBTCX8nm9tarfoTktvAcYKbcMyzIOJTgv5FKceCACYD0
         hZllbj0i4M04yM2+ngppHvDLh5l0kWebT2PWQE7P0YlSlHGMm7euQAhsEJZPw5m9Dyzt
         cg2XiSMajjwdvnMXJWxJwWO0ApaEXou4PigdBZOl5GT5vUI5E61+sKPWNejCLI8rmR6e
         rFheAP1A2qMkvV+l/0OxCxZAw1pHfsdZp7NR1WlSnKQedbqHdmYHETO+1upQep2Uf/uf
         d/tQ==
X-Gm-Message-State: AC+VfDxSBJlhyXNllWDcfGw6eApY5fegq4FduNNXeXOcuHjEbmyjL8ZW
	pU6XErQEv/oQGEKIsilwZldLo4c07Rot7g==
X-Google-Smtp-Source: ACHHUZ6GUgoEPOdOkYH39gXGetTC8g2FDwNK61lIx+Uw5qgeRgQ7ZjQ+y9kriy5XwhfNu5aNbC6G1Q==
X-Received: by 2002:ac8:5c13:0:b0:3f6:a807:c9b1 with SMTP id i19-20020ac85c13000000b003f6a807c9b1mr7561923qti.6.1685558947083;
        Wed, 31 May 2023 11:49:07 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id e16-20020a0cf750000000b006257e64474asm3926645qvo.113.2023.05.31.11.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 11:49:06 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] linux-yocto/6.1: update to v6.1.27
Date: Wed, 31 May 2023 14:48:55 -0400
Message-Id: <765d528dc3803bab928e152bfee1f395c631ea7f.1685558432.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685558432.git.bruce.ashfield@gmail.com>
References: <cover.1685558432.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 18:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182026

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    ca48fc16c493 Linux 6.1.27
    0bbec73fdd9e riscv: No need to relocate the dtb as it lies in the fixmap region
    17509e73ac8b riscv: Do not set initial_boot_params to the linear address of the dtb
    ed96b3143540 riscv: Move early dtb mapping into the fixmap region
    7cb8c95c0a6d driver core: Don't require dynamic_debug for initcall_debug probe timing
    ce0555352a28 USB: serial: option: add UNISOC vendor and TOZED LT70C product
    17e5ce4d89ad btrfs: fix uninitialized variable warnings
    47e6893a5b0a bluetooth: Perform careful capability checks in hci_sock_ioctl()
    c4acbf376124 gpiolib: acpi: Add a ignore wakeup quirk for Clevo NL5xNU
    d27acf15c8fa drm/fb-helper: set x/yres_virtual in drm_fb_helper_check_var
    e29661611e6e wifi: brcmfmac: slab-out-of-bounds read in brcmf_get_assoc_ies()
    34cec5cd7abc mptcp: fix accept vs worker race
    b45d8f5375ed mptcp: stops worker on unaccepted sockets at listener close
    862ea63fad16 mm/mempolicy: fix use-after-free of VMA iterator
    e1562cc202c9 KVM: arm64: Retry fault if vma_lookup() results become invalid
    d70f63be626d phy: phy-brcm-usb: Utilize platform_get_irq_byname_optional()
    7d057bf201ca um: Only disable SSE on clang to work around old GCC bugs

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index d2dc7e60f1..66550914c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "128a73d5e1339475618b41383121a0eef4bb29de"
-SRCREV_meta ?= "1bb0236be7c49344bd411c71f21769153ecd9695"
+SRCREV_machine ?= "573386d3cb8c102496deecf92ca867ff9d044ae1"
+SRCREV_meta ?= "b82e23405925b724cecf3deacc13739db6720ca2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.26"
+LINUX_VERSION ?= "6.1.27"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index b2f6266018..7eec6e97aa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.26"
+LINUX_VERSION ?= "6.1.27"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
-SRCREV_meta ?= "1bb0236be7c49344bd411c71f21769153ecd9695"
+SRCREV_machine ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
+SRCREV_meta ?= "b82e23405925b724cecf3deacc13739db6720ca2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index eebce559b7..7600f45522 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "171d448bfb9e531c7395deae260edf96305eab9c"
-SRCREV_machine:qemuarm64 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
-SRCREV_machine:qemuloongarch64 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
-SRCREV_machine:qemumips ?= "d637594e7e9c9037d7c609f9dfeef13a57a5aec4"
-SRCREV_machine:qemuppc ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
-SRCREV_machine:qemuriscv64 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
-SRCREV_machine:qemuriscv32 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
-SRCREV_machine:qemux86 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
-SRCREV_machine:qemux86-64 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
-SRCREV_machine:qemumips64 ?= "52e3ff0902681ac3d9128bcf037033e14ae20d68"
-SRCREV_machine ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
-SRCREV_meta ?= "1bb0236be7c49344bd411c71f21769153ecd9695"
+SRCREV_machine:qemuarm ?= "df2cfcb92e63bdbdd34667d5915a71b1441ec723"
+SRCREV_machine:qemuarm64 ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
+SRCREV_machine:qemuloongarch64 ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
+SRCREV_machine:qemumips ?= "9cf687bf5869c57781cb399038d455351e4517e9"
+SRCREV_machine:qemuppc ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
+SRCREV_machine:qemuriscv64 ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
+SRCREV_machine:qemuriscv32 ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
+SRCREV_machine:qemux86 ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
+SRCREV_machine:qemux86-64 ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
+SRCREV_machine:qemumips64 ?= "6e551dbbbc3d447255314706f089a45670063901"
+SRCREV_machine ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
+SRCREV_meta ?= "b82e23405925b724cecf3deacc13739db6720ca2"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "ca1c9012c941ab1520851938d5f695f5a4d23634"
+SRCREV_machine:class-devupstream ?= "ca48fc16c49388400eddd6c6614593ebf7c7726a"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.26"
+LINUX_VERSION ?= "6.1.27"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


