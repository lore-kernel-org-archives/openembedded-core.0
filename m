Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525C1C77B62
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 16:42:49 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.48712.1680453764688439174
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Apr 2023 09:42:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=u7JI8WP4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso12257163pjf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 09:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680453764; x=1683045764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHw/mXv6h0EtiNhs+DNT8RLmQ43cG6/fVGKMj5DlhM8=;
        b=u7JI8WP4NyiOdNQZO2p+l33NHKiRTFIGC+CvZF71ihTOB9cA4I1Smupgzl0d/9vSuR
         ahcRj7JIXQl1IsE7HuQ1mRg1/yAbxSIJkXkAOHL4le6z/UwtxWayuWH1jAfEqbEcyRmT
         IhO2mbVVuBKpbTBvVUsjVl4oc+et0vlTEiymhZEDVt1AWIwIv4riXmKv4/ng+C3Ly4XL
         Q8BWjxREt0uTwudhvOCbKod9XVvwHGeSeRsUL5cV2go/HFNgPNzfa4EpZVB3owO2XZCW
         6/AYtv4Ux3P89KEoECI6mgQ2Dq4k3YihmA1IM2bxQXzeI2vkXL1xmNovj5gckD4IFZmq
         TtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680453764; x=1683045764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHw/mXv6h0EtiNhs+DNT8RLmQ43cG6/fVGKMj5DlhM8=;
        b=Qg189jLqPshA2tWVavD3jTw3ws/s+GlVZVeWFryXQGTVahXXB3wnjgdfn30RU7Yq1t
         r5efZjCbl4d5rp6OUMLN6Fo5GoB90yVdVGJEDRQT3img6QlnTa2AYNNWFqc8ITPQKzrh
         F+IOI8pqwO3jgvBk/aGyqvttkhavDqsMSbNF4qXcW7uC+sCVQhMgZYpjLeZuq1STjgpg
         KnfsdDMi7E8syqMbyRc4QGFURlK7zRrYYR3C2b8OiZ8ORpdWCYw2Sp7k0UfyUv6RqXdt
         lvz2bhucbO48Sh1KYWdspM+bEb72o/Dx1tFjaKMvV4aoZA725VNeYYcOEikLud0FB+7c
         o/Sw==
X-Gm-Message-State: AAQBX9fzFwpIMJiNGjM+HFh/wkd8f9xT2LTKfj6j4Da2FVyk5eoLJJha
	cu19eg3FK1P8WFYVXJiBzoC01u552j3HKwf7YXw=
X-Google-Smtp-Source: AKy350ZcMC5CWTMk7ehjNhaLcCQkGWuty4um3/sUjRX01brkCWl9V9VGI3l0GLvlsQjwhbPJyUaKQg==
X-Received: by 2002:a17:902:daca:b0:19f:3d59:e0ac with SMTP id q10-20020a170902daca00b0019f3d59e0acmr41414254plx.44.1680453763701;
        Sun, 02 Apr 2023 09:42:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001a1ddd224desm5042079plb.89.2023.04.02.09.42.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 09:42:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/21] linux-yocto/5.10: update to v5.10.172
Date: Sun,  2 Apr 2023 06:42:05 -1000
Message-Id: <2f13f3e02efb83e9d935efac71bbf0b750420d23.1680453201.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680453201.git.steve@sakoman.com>
References: <cover.1680453201.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 16:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179591

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    9fd42770b507 Linux 5.10.172
    da24142b1ef9 io_uring: ensure that io_init_req() passes in the right issue_flags
    a25aa776b0c4 Linux 5.10.171
    08681391b84d io_uring: add missing lock in io_get_file_fixed
    218925bfd5d1 USB: core: Don't hold device lock while reading the "descriptors" sysfs file
    c5360eec648b usb: gadget: u_serial: Add null pointer check in gserial_resume
    cebcd4300af9 USB: serial: option: add support for VW/Skoda "Carstick LTE"
    87c647def389 drm/virtio: Correct drm_gem_shmem_get_sg_table() error handling
    0a4181b23acf drm/virtio: Fix NULL vs IS_ERR checking in virtio_gpu_object_shmem_init
    a401ef0557da scripts/tags.sh: fix incompatibility with PCRE2
    65c07e15f2ce scripts/tags.sh: Invoke 'realpath' via 'xargs'
    1c44109c3094 md: Flush workqueue md_rdev_misc_wq in md_alloc()
    80653a6e6e28 vc_screen: don't clobber return value in vcs_read
    3e4bbd1f38a8 net: Remove WARN_ON_ONCE(sk->sk_forward_alloc) from sk_stream_kill_queues().
    a2957adbf3f5 bpf: bpf_fib_lookup should not return neigh in NUD_FAILED state
    75fbe1e43505 HID: core: Fix deadloop in hid_apply_multiplier.
    2fd5059f4fdf neigh: make sure used and confirmed times are valid
    065f6a663392 IB/hfi1: Assign npages earlier
    6195cea4c738 btrfs: send: limit number of clones and allocated memory size
    8e833fe47f45 ACPI: NFIT: fix a potential deadlock during NFIT teardown
    abbf52efadeb ARM: dts: rockchip: add power-domains property to dp node on rk3288
    1f3a209b2f4e arm64: dts: rockchip: drop unused LED mode property from rk3328-roc-cc
    887975834dea Fix XFRM-I support for nested ESP tunnels

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index b79503a713..90ebacb79f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "96696fd86a146b4caf2ace4aa35a05173cf4e4f0"
-SRCREV_meta ?= "5ff3d3c9cac6c7151a8667ce0b829815b4a10fe9"
+SRCREV_machine ?= "906ed2510448296f6ae7fd7eec4a16323a122d56"
+SRCREV_meta ?= "e0258879d18c06e18d245ea2fbe5363abe204f1d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.170"
+LINUX_VERSION ?= "5.10.172"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 3340ea9490..90918e9075 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.170"
+LINUX_VERSION ?= "5.10.172"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "0458c56e80d109be74ac798badf708238d23c0be"
-SRCREV_machine ?= "b67f14a9f17371acee4d322bd97936ac4724677a"
-SRCREV_meta ?= "5ff3d3c9cac6c7151a8667ce0b829815b4a10fe9"
+SRCREV_machine:qemuarm ?= "06797bb6770cf02dac8549965cadcfaf9662648b"
+SRCREV_machine ?= "81be5bada3aaefe33470fe564cf775a7101d2753"
+SRCREV_meta ?= "e0258879d18c06e18d245ea2fbe5363abe204f1d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index ad37ef0f90..6b95cd6c15 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "5f89e91aaac8b66f595bc859572912d034e2c0a4"
-SRCREV_machine:qemuarm64 ?= "3c27ba92e77d51651dcaeffa871c6d75e1838b28"
-SRCREV_machine:qemumips ?= "230e54a73d22fa82e09c120d2d7f01f5472250fe"
-SRCREV_machine:qemuppc ?= "b9836fd66f2036814cb73aca7fa33f12616c3d53"
-SRCREV_machine:qemuriscv64 ?= "2865a8c85a10428c17144aa5d21c5c5f73f991e8"
-SRCREV_machine:qemuriscv32 ?= "2865a8c85a10428c17144aa5d21c5c5f73f991e8"
-SRCREV_machine:qemux86 ?= "2865a8c85a10428c17144aa5d21c5c5f73f991e8"
-SRCREV_machine:qemux86-64 ?= "2865a8c85a10428c17144aa5d21c5c5f73f991e8"
-SRCREV_machine:qemumips64 ?= "2fc6dfde53ddca6e3c59c15cdad8c1f59d9bee9d"
-SRCREV_machine ?= "2865a8c85a10428c17144aa5d21c5c5f73f991e8"
-SRCREV_meta ?= "5ff3d3c9cac6c7151a8667ce0b829815b4a10fe9"
+SRCREV_machine:qemuarm ?= "c98a46648630fcd991c14d5681a8ffac871a375d"
+SRCREV_machine:qemuarm64 ?= "5af3730831ade6e681e9c5171b201af7044b6f14"
+SRCREV_machine:qemumips ?= "ee066941c9388615026bd61bcfdb87cc090a708b"
+SRCREV_machine:qemuppc ?= "79adfb34b779d73f9b270968de317bbed5ed99ac"
+SRCREV_machine:qemuriscv64 ?= "64bb62787e5dbc958d29ed9b001312f1f49b61f9"
+SRCREV_machine:qemuriscv32 ?= "64bb62787e5dbc958d29ed9b001312f1f49b61f9"
+SRCREV_machine:qemux86 ?= "64bb62787e5dbc958d29ed9b001312f1f49b61f9"
+SRCREV_machine:qemux86-64 ?= "64bb62787e5dbc958d29ed9b001312f1f49b61f9"
+SRCREV_machine:qemumips64 ?= "2c5facc36b895eba9cc75357e924e9e3b313cf68"
+SRCREV_machine ?= "64bb62787e5dbc958d29ed9b001312f1f49b61f9"
+SRCREV_meta ?= "e0258879d18c06e18d245ea2fbe5363abe204f1d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.170"
+LINUX_VERSION ?= "5.10.172"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


