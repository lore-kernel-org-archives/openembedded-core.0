Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430C2C77B62
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 16:42:59 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.48837.1680453770024130271
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Apr 2023 09:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=6a1ier8s;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id r7-20020a17090b050700b002404be7920aso26198487pjz.5
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 09:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680453769; x=1683045769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53tQn6K3YuwA2s2shml3qgF0Gx7EHz307QV+3ZlDJNc=;
        b=6a1ier8s+MoFZDhhIJuJun7AJbjNi0avreRQgE+sdhDh91cbBh9R7ORA5TBaVQL8/S
         Q9DGoMZmMZW4/oauPyjm1wbu1X08yKDyKD44O9HRgIGbpi4tb3R7j28D3zMFvp/UibZ5
         d7E3houISmDYa0eTOMN5hQvEgp5O3saLflSq+dnxSwlWcmvb7qWK6FdQk1qTCY58AgDU
         RMWH/2Lvh69qWL3rnBs0655NLbkosKwGyQLMQJh4K8xzsGcPACDIF5/We6OOGserkRqB
         dbDZy72Yh2NvGIp5aY8J2KhqXMv7Kb5qOynNvjxb0MT97DFEOdSZYH/3S+qhjCrHgqlG
         OF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680453769; x=1683045769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53tQn6K3YuwA2s2shml3qgF0Gx7EHz307QV+3ZlDJNc=;
        b=0ZMoQoXkZhd4+2YIHU7U41kvNlSFfrslv56Q6JkPuj8YHxucDN7zq/xiGPnUqbx2kF
         ae52NoOZYq/dA6uB+aKdTjq3rodG6Z+Pkq09xY6J3O4jue92BBVWFb8zLaBz+eguC6PH
         aiqLbASpsXRhJ2sTG0Nh/7+tadVPqB2bVnvpDVIsb7f4f1UoqsQXtCXnvVZ96xbt4bSu
         xg1gLP7Q6F8NpDxjwNw8FPG8dvz7B0mzeEHAL+CVnPE3FTDl5RmoyfpeqDh2vs95ruht
         Kc2Nq1WPGSC/ybEN4Zp7iAZdgFTBiUC/X1SeH86Nqkzk1KkSSu6LvsRMCmw+sPrre09r
         rpaQ==
X-Gm-Message-State: AAQBX9fyI0e88WV57g/M3zCbZ4AvQzrO9jvF60PfhtUsNRxZZpRxOryt
	bqha4OuxKDAhIokcfGnHRkStaH9xtfibLZCmfKE=
X-Google-Smtp-Source: AKy350bjLumLgRjgSOLREpogsGRVeBputWgqnFTPjis7wYXDFJlUmo/LZZ6gmoHlEhMA9I9UJcJVUw==
X-Received: by 2002:a17:902:f315:b0:19e:9849:1767 with SMTP id c21-20020a170902f31500b0019e98491767mr28033980ple.42.1680453769038;
        Sun, 02 Apr 2023 09:42:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001a1ddd224desm5042079plb.89.2023.04.02.09.42.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 09:42:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/21] linux-yocto/5.15: update to v5.15.98
Date: Sun,  2 Apr 2023 06:42:08 -1000
Message-Id: <10736085c3e47c23c377bd68623b0753557e3a06.1680453201.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680453201.git.steve@sakoman.com>
References: <cover.1680453201.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 16:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179594

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4961d295599b1c3822752c42891006a49aea8ff3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


