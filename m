Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72631C761AF
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:08:57 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.103755.1679670534236574567
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jLYOVN1J;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id q88so1697616qvq.13
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 08:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679670533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZlzyVTNHMWz87AU+fFfgSeKLIoO7wOI1KzCla5hlL0=;
        b=jLYOVN1JEzcQqb/LgnUlzp6Jb17na8o5hBjxR67tPMfo24PHB7biQGvw3KKsAFXPIa
         ZitM0h8FvmeTYL6Wfe0iF2BGNERn3EE8ewhiVajbo73mgmylAdffWzuhXjYQzNxrwE0X
         vbAP81f1euiOcIbhJpFtAIzG19yQGKBfB+gHNgwbnoixcoypPt0U5paE7Mv7tQVMDASE
         h7P8fh3OCCkTtsAIdyZSHG4I14eK55aLfKaktRFMUwBiJqGuC6JNQ2Sv9UYNHMBMhhpi
         7EbSiDUex1oxbDUoR4su5p3w7vjnda7gLFfa2A0U0ntpqxM3hJcRcyUIE8xTE+tYYPAS
         s5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679670533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZlzyVTNHMWz87AU+fFfgSeKLIoO7wOI1KzCla5hlL0=;
        b=WAdE7pfHbzu2AA7JPJVtq2mVrHaVyC6mBUcFB7uVLk/GjpkULAp8EGgXtv19cmFO4M
         cBWPL06rNUlWpatj86Pxz1cIJjkuGVOPRe+8Ez1tTEYCsdtii54/KCEfdGVxHmXer+Wy
         VSSj5ETvgAWsyF9hyd1QrDobqLC8TJWTCPP6OLbvEg1wxvx+ZwIWopkx1jL5kdX4Kzwy
         a7Xpq1xJT7nH5BZRYYxcTuJRImn57VsliQayuO3FwjooEboj5otgbO0Ehq2deZalVNm2
         4LtWu2E5QIyUcF2FKDDhGh/U0l8Z7R26IbWsllhFL5TJtX7XHc2Ma6ahV+qs4/72wV2E
         353g==
X-Gm-Message-State: AO0yUKWq5sxr3gWjcz6Fofq/HHNY9Vu7fDzov3agNG0raepeHCdLFZpQ
	7Yvk9voj3CsshQh8cZvwdWv6YgJqRkeXow==
X-Google-Smtp-Source: AK7set8lp02IvT+vpXh/RgQdf75scyU4w8L2OgTNCDJun7FBbuQe5Dn6A4mBxlUHRHxI01FrZ+4kMg==
X-Received: by 2002:a05:6214:518f:b0:5cd:848a:8a1e with SMTP id kl15-20020a056214518f00b005cd848a8a1emr15248762qvb.11.1679670533165;
        Fri, 24 Mar 2023 08:08:53 -0700 (PDT)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id mf10-20020a0562145d8a00b005dd8b9345e8sm746219qvb.128.2023.03.24.08.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 08:08:52 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] linux-yocto/5.15: update to v5.15.98
Date: Fri, 24 Mar 2023 11:08:43 -0400
Message-Id: <b91bf7c4fc0d45004f377f89ada783a7ca55ce1d.1679670268.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679670268.git.bruce.ashfield@gmail.com>
References: <cover.1679670268.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179043

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    d9b4a0c83a2d Linux 5.15.98
    937c15e27a63 io_uring: ensure that io_init_req() passes in the right issue_flags
    bf7123dd26a0 Linux 5.15.97
    cf7f9cd50013 io_uring: add missing lock in io_get_file_fixed
    77358093331e USB: core: Don't hold device lock while reading the "descriptors" sysfs file
    3b24c980dc07 usb: gadget: u_serial: Add null pointer check in gserial_resume
    2d72795ccde2 USB: serial: option: add support for VW/Skoda "Carstick LTE"
    02190d23b731 usb: dwc3: pci: add support for the Intel Meteor Lake-M
    cc09a7d5a6a1 scripts/tags.sh: fix incompatibility with PCRE2
    1aee4ab2c107 scripts/tags.sh: Invoke 'realpath' via 'xargs'
    06740b433d9d vc_screen: don't clobber return value in vcs_read
    e7f460696340 net: Remove WARN_ON_ONCE(sk->sk_forward_alloc) from sk_stream_kill_queues().
    16d319ec18b0 bpf: bpf_fib_lookup should not return neigh in NUD_FAILED state
    6dd1de27d771 staging: mt7621-dts: change palmbus address to lower case
    07f0c6f9c357 x86/cpu: Add Lunar Lake M
    e1b09162f268 HID: core: Fix deadloop in hid_apply_multiplier.
    f1ee47003075 neigh: make sure used and confirmed times are valid
    2590058fb058 IB/hfi1: Assign npages earlier
    4534ea429ed8 ASoC: rt715-sdca: fix clock stop prepare timeout issue
    e430f058d90c btrfs: send: limit number of clones and allocated memory size
    d454a7212e17 ACPI: NFIT: fix a potential deadlock during NFIT teardown
    435e8fabd19a HID: elecom: add support for TrackBall 056E:011C
    6bd2f1754393 ARM: dts: rockchip: add power-domains property to dp node on rk3288
    839a9c0047a1 arm64: dts: rockchip: drop unused LED mode property from rk3328-roc-cc
    503e3d93cf35 Fix XFRM-I support for nested ESP tunnels
    765b3a0e0a81 ionic: refactor use of ionic_rx_fill()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 0f557ba2c5..e67dc38736 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4d335265c1010cdf45dc0169b1b79638323a5109"
-SRCREV_meta ?= "509f4b9d68337f103633d48b621c1c9aa0dc975d"
+SRCREV_machine ?= "ce19518b87253279a0358d736d8e9a2cca908498"
+SRCREV_meta ?= "674b6bbdc9cb7cfdbec5a0642a3cbef0ba1f738c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.96"
+LINUX_VERSION ?= "5.15.98"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 34ffaa5132..8c0f149a35 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.96"
+LINUX_VERSION ?= "5.15.98"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9c8ee16005f204f7f48d6699822dd5e89b01d4a5"
-SRCREV_meta ?= "509f4b9d68337f103633d48b621c1c9aa0dc975d"
+SRCREV_machine ?= "c5c318ab79b57628d2046185821db1d0eb89df20"
+SRCREV_meta ?= "674b6bbdc9cb7cfdbec5a0642a3cbef0ba1f738c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 55580357d2..8c38db25f8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "5479084dba4fbe0e3db2a97b0ae00ff7651fb90b"
-SRCREV_machine:qemuarm64 ?= "91bfb4191c2f19b98b0c724676a69ca9d61bb696"
-SRCREV_machine:qemumips ?= "8be1d8e09c4b174ab4ef0fbd67263f9563967818"
-SRCREV_machine:qemuppc ?= "6de606ff8d3eeba9f003557ebb37c94a2d0e6bc1"
-SRCREV_machine:qemuriscv64 ?= "001e2930e6997f58dd98cda33908111506f53eb7"
-SRCREV_machine:qemuriscv32 ?= "001e2930e6997f58dd98cda33908111506f53eb7"
-SRCREV_machine:qemux86 ?= "001e2930e6997f58dd98cda33908111506f53eb7"
-SRCREV_machine:qemux86-64 ?= "001e2930e6997f58dd98cda33908111506f53eb7"
-SRCREV_machine:qemumips64 ?= "d2d2e93f5cea91969185ec1cc05d6833cd7e1412"
-SRCREV_machine ?= "001e2930e6997f58dd98cda33908111506f53eb7"
-SRCREV_meta ?= "509f4b9d68337f103633d48b621c1c9aa0dc975d"
+SRCREV_machine:qemuarm ?= "21e0bbe305e7dbcd73a3b8695084f0cc3334f4ee"
+SRCREV_machine:qemuarm64 ?= "574058afde6aba973ebe024686c2e609b9703bbb"
+SRCREV_machine:qemumips ?= "80b8c24fa8e87f562cb558662e0c9c8f036aa389"
+SRCREV_machine:qemuppc ?= "3263f7de77ed4245e3802e19e7aded24fe957f30"
+SRCREV_machine:qemuriscv64 ?= "99700bd79a36b1a0cea28fd65921b5973970fc88"
+SRCREV_machine:qemuriscv32 ?= "99700bd79a36b1a0cea28fd65921b5973970fc88"
+SRCREV_machine:qemux86 ?= "99700bd79a36b1a0cea28fd65921b5973970fc88"
+SRCREV_machine:qemux86-64 ?= "99700bd79a36b1a0cea28fd65921b5973970fc88"
+SRCREV_machine:qemumips64 ?= "ad9994f20f03947ef32a18e9cc86b13d37548010"
+SRCREV_machine ?= "99700bd79a36b1a0cea28fd65921b5973970fc88"
+SRCREV_meta ?= "674b6bbdc9cb7cfdbec5a0642a3cbef0ba1f738c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d383d0f28ecac0f3375bdfb9a0c4bfac979f6f8f"
+SRCREV_machine:class-devupstream ?= "d9b4a0c83a2d405dd85bf32d672686146b9bedff"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.96"
+LINUX_VERSION ?= "5.15.98"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


