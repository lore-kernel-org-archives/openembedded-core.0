Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81EDC04A6A
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 18:57:19 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.11709.1690052234034898166
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 11:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=zczAK4ma;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-666e6541c98so2814063b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 11:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690052233; x=1690657033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPWAcplvFT/9WoqjlO69J3GFkIQYIMX8khz/aa5+PF4=;
        b=zczAK4maCkuEaO7/box3NQBXmp7UKYqIZGiDEdH/JKdar80bGCd5MxZZPDRuG5UbMq
         ys4EjlNno5iDLIZ2sg3g4ECCBSaHIm4emYbAom4LD0ZnFDtnSgmgV8StfBfj3OQHmwWx
         Lq1EkUOO35hmxfvbaqv6ElN8YfWNOdJAiiL1nCHn1Q7DmqhOReyLU9+HZ+4sdsB0r8dy
         aG082Spo31mobWYl6k54Y9H8IVvN+9HusOVt7Xf3RY7b21MZ0Kv+zA/e5CacNQvd+hVq
         z0uVZbvKfcoW2czulGwOxdVvazSNx4Baidiyw1oHHUh48D9oW+YbXWMJ8Mb7r9jgS/OK
         Je5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690052233; x=1690657033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPWAcplvFT/9WoqjlO69J3GFkIQYIMX8khz/aa5+PF4=;
        b=Xx3lSx7IoblgJ730puYBeZ1KMZDWhpQYAsnuUHnvK0yWwZGxXvABIQe9EWVNOLS8hj
         OKZTk6BnRZa64Y3G2qFuVXGSpLfD52cl4wU3vjiMEpvtNIUQUV+FuWfzevwUsFpxQSo/
         XzVoepLaZwvfUpMVNTEdyxCAAPZwfswlA0ZMDAZXQCg/Z+555s0oTnmJ5bw97RaTasa7
         P0NcZuZJCeHysxCiDLl4JClT+h8Dkb+oYLnYYSpU7ZKmd7IeH+D8d5cHnFvEosdGeIuV
         o+F7jlcFvRMDhHxxZM/kYRNca/mZgxzHRvOj8JCnq6bME3Q4iwcHYGUjbvze22XmDcmE
         5O4w==
X-Gm-Message-State: ABy/qLZVS/5gGkE8QXVwbIt+PZf5fQzb0O+Ew3342ckr0nGKakBPsiVn
	aNGXk2Hwfsc1siq2CJAWCzn4o33LJWdRSkEyUUg=
X-Google-Smtp-Source: APBJJlHaUywzZVbuB76i3dfziv1nLh+JHhszpAWotayAgaAYipjODsQpHEo0zAlDCcZwQOv2u3Xzqw==
X-Received: by 2002:a05:6a20:4d9e:b0:134:1c06:1c1f with SMTP id gj30-20020a056a204d9e00b001341c061c1fmr6228878pzb.37.1690052232987;
        Sat, 22 Jul 2023 11:57:12 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g28-20020a63375c000000b00553ad4ae5e5sm5400572pgn.22.2023.07.22.11.57.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 11:57:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 05/11] linux-yocto/5.15: update to v5.15.120
Date: Sat, 22 Jul 2023 08:56:49 -1000
Message-Id: <5209c9db1a918aa06c5d37163742efc59bb4503b.1690052101.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690052101.git.steve@sakoman.com>
References: <cover.1690052101.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 18:57:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184728

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


