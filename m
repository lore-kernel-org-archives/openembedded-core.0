Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BED6EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 03:28:56 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.4.1689650933626701659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 20:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KiS00NWI;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-40353537485so32891941cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 20:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689650932; x=1692242932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIhXj8l5bZGrFIuKTkix1Qq5xlwGcJRaNvZz9gEZ6hM=;
        b=KiS00NWIfKAZiEV930VSBUxmYljHyLZm9R63HRLM/h/eFa3zTGcg551Q0vCvV+2A3O
         hKjFxgoECLNuN/ck+kqAScWdMZz+eJT+1DGvXT0wsv2VhZd2RXrQhFnxFuoTSsGdH+f4
         tBuBMH2xmUvX3PmXdugOJSmKQte9yXqGhVBJxKuQ+hsnOFkuLuLtT9bAzkVhuCeSSsUp
         TwYb5vRjTJiuo3nvLRgSxZCyzf32BBf2L5TCH0Q1Bn2+rF3VbNvPv30aaUij2dXokGiD
         jNSywmZwkk7Y8bsX3LAcjWsKf9eW5FhgwDcScy4it6+GETQp39cyjI6i2ck+dXc7iS6H
         ez4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689650932; x=1692242932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIhXj8l5bZGrFIuKTkix1Qq5xlwGcJRaNvZz9gEZ6hM=;
        b=A10UfPbvs6dy9uKL7giB5S9hJF59rK98u3S4WXJYdnyXr2Jn6JnuQOV5Gf6KxdKgQN
         ZwlGic1d7zKCWQnXe3GOU2QsTVq8WI0OJnwMaFzXFT4UgrvMKathQXZ/o9RHK7kPSI8w
         9v8VAjLXVPZVPP5vwWGxhMjnnuWreDYN0XsT/KJyj3GwJZWvdDPsk5C2q3KDhkKJF4ov
         /PVRuJWeARhCY2vaK4/u3U5zcwbIHvmUKnuSvbSarhlZIew5k8mua3KCbtNp+7dKQZuW
         NHTkJGDkTmvBP+5KC9yS4YtWjldq5TX8GMrvK5yPgeP27oq3gjHsmOyPtgz+js+7A2jg
         oIBA==
X-Gm-Message-State: ABy/qLYRZira0e6NdjPN6F5EWf72/4FyAhWWHHuOL5Ync5JixL62/f6a
	8uw1A30MRe0XRFURI7R23p8=
X-Google-Smtp-Source: APBJJlH14kRaO8T7fc4tfdAU2708ZVLzecQrGcuAKWmS+gJbEtA0JI54WMTXdcZTIuG4G6XI1Jksng==
X-Received: by 2002:ac8:5a42:0:b0:403:1d93:b210 with SMTP id o2-20020ac85a42000000b004031d93b210mr1304221qta.59.1689650932629;
        Mon, 17 Jul 2023 20:28:52 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id s17-20020a0cb311000000b0063c79938606sm410743qve.120.2023.07.17.20.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 20:28:51 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2][mickledore] linux-yocto/5.15: update to v5.15.120
Date: Mon, 17 Jul 2023 23:28:47 -0400
Message-Id: <20230718032847.526999-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230718032847.526999-1-bruce.ashfield@gmail.com>
References: <20230718032847.526999-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 03:28:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184488

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    d54cfc420586 Linux 5.15.120
    c06edf13f4cf nubus: Partially revert proc_create_single_data() conversion
    6e65fa33edf5 parisc: Delete redundant register definitions in <asm/assembly.h>
    b4d8f8900021 drm/amdgpu: Validate VM ioctl flags.
    26eb191bf5a0 scripts/tags.sh: Resolve gtags empty index generation
    989b4a753c7e perf symbols: Symbol lookup with kcore can fail if multiple segments match stext
    87f51cf60e3e Revert "thermal/drivers/mediatek: Use devm_of_iomap to avoid resource leak in mtk_thermal_probe"
    6a28f3490d3d HID: logitech-hidpp: add HIDPP_QUIRK_DELAYED_INIT for the T651.
    67ce7724637c HID: wacom: Use ktime_t rather than int when dealing with timestamps
    347732317749 bpf: ensure main program has an extable
    d874cf9799a9 can: isotp: isotp_sendmsg(): fix return error fix on TX path
    27d03d15bb8b x86/smp: Use dedicated cache-line for mwait_play_dead()
    d6c745ca4fc5 x86/microcode/AMD: Load late on both threads too
    9052349685e9 drm/amdgpu: Set vmbo destroy after pt bo is created
    796481bedc3e mm, hwpoison: when copy-on-write hits poison, take page offline
    6713b8f11aa0 mm, hwpoison: try to recover from copy-on write faults
    b46021ab8304 mptcp: consolidate fallback and non fallback state machine
    42ff95b4bd11 mptcp: fix possible divide by zero in recvmsg()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index a75eef5d8b..94b0df3f4d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "482797bf5730cf22143afe28d489363ca4bf44a2"
-SRCREV_meta ?= "58ef8845366aea0e1719d00618444be34a765c15"
+SRCREV_machine ?= "0b2e44360ea08b441883f16826c4720546a0886c"
+SRCREV_meta ?= "820b9bdb192ae263be93e609da415c570d5acc79"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "5.15.119"
+LINUX_VERSION ?= "5.15.120"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 6d7939ba83..e5d181598d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.119"
+LINUX_VERSION ?= "5.15.120"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ded230a888ef81ccedf0044bd8c2236f3b809599"
-SRCREV_meta ?= "58ef8845366aea0e1719d00618444be34a765c15"
+SRCREV_machine ?= "bb0cc3f9542c03fba314f5da44e91556c641706f"
+SRCREV_meta ?= "820b9bdb192ae263be93e609da415c570d5acc79"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index dfe9171ddd..80cc5239cd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "9ae4c8018039201ce683ff26bde47a3e3e6664ef"
-SRCREV_machine:qemuarm64 ?= "58394274da1b4fdf69ca780001bf25eebfd1950f"
-SRCREV_machine:qemumips ?= "bacfb28c9349b36afe3041e57d98551aa723bbc2"
-SRCREV_machine:qemuppc ?= "d9efae0cb3731ab62cb81778c2fa5689594d34b1"
-SRCREV_machine:qemuriscv64 ?= "a05c1b953b7b7dbd195b7f826e8879d79587a4a3"
-SRCREV_machine:qemuriscv32 ?= "a05c1b953b7b7dbd195b7f826e8879d79587a4a3"
-SRCREV_machine:qemux86 ?= "a05c1b953b7b7dbd195b7f826e8879d79587a4a3"
-SRCREV_machine:qemux86-64 ?= "a05c1b953b7b7dbd195b7f826e8879d79587a4a3"
-SRCREV_machine:qemumips64 ?= "2ae09c410d8a5a0ec66d50368579dd3d3616072b"
-SRCREV_machine ?= "a05c1b953b7b7dbd195b7f826e8879d79587a4a3"
-SRCREV_meta ?= "58ef8845366aea0e1719d00618444be34a765c15"
+SRCREV_machine:qemuarm ?= "938c0c130bc6403d7e54ffc026a1eb32d10b34f9"
+SRCREV_machine:qemuarm64 ?= "d248c07ace0f6bf2a94eaba26a2bdbdbcfb2ec15"
+SRCREV_machine:qemumips ?= "19fdaea3b322820eb042622e68ede3cc99cdf87f"
+SRCREV_machine:qemuppc ?= "8db87cbed6574bec3ece05bf4cbb275fd3497f50"
+SRCREV_machine:qemuriscv64 ?= "74c80e559b24dd2c75214e4affc86d71f3d8cc8a"
+SRCREV_machine:qemuriscv32 ?= "74c80e559b24dd2c75214e4affc86d71f3d8cc8a"
+SRCREV_machine:qemux86 ?= "74c80e559b24dd2c75214e4affc86d71f3d8cc8a"
+SRCREV_machine:qemux86-64 ?= "74c80e559b24dd2c75214e4affc86d71f3d8cc8a"
+SRCREV_machine:qemumips64 ?= "f7673229ddb5c9f3d77b5fb521c98f7dcd20f2ea"
+SRCREV_machine ?= "74c80e559b24dd2c75214e4affc86d71f3d8cc8a"
+SRCREV_meta ?= "820b9bdb192ae263be93e609da415c570d5acc79"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "4af60700a60cc45ee4fb6d579cccf1b7bca20c34"
+SRCREV_machine:class-devupstream ?= "d54cfc420586425d418a53871290cc4a59d33501"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.119"
+LINUX_VERSION ?= "5.15.120"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


