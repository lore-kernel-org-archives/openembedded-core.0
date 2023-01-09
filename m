Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4C0C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 00:39:24 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.59788.1673224751678344916
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 16:39:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iiV1Ki9Q;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id c7so6700268qtw.8
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 16:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gusBDDZfVYRFPGYMsB9NTO8erySZqYqH/VSA+eScfI4=;
        b=iiV1Ki9QxJvwTfXA0uMPQVEKrxZoAlm/wO+b+UG9DDHCI5S1v69q3em/2UxaKXJugZ
         Y5tTXguHiJgjJu/wH+myLML+IJkqW70cxuJ3hqWI7DN/ADyWhM1AydT6s4PqfhgDNZae
         mKPWhzDp8MhxQupazS5cQumrnv86+Qo6bNeYfHhKtC/9FhWyKjDPAms32GzbVKJ20IKm
         pdZzZWx0SZmpJlsnYkOsL/nJVhk8nNFjh+YCZa9x3SIf4Hi7BqrNSIBlr3xQE/e0FzB8
         rir8T4+L1n85MflmLdOgJ37Rn8rcR9vrsRYh2W3nlt2Bva3tIJ8+qSbUt+L7UvCuAAev
         XZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gusBDDZfVYRFPGYMsB9NTO8erySZqYqH/VSA+eScfI4=;
        b=ilQ8RuK4YiBlP4xd9Wu1LpcArcBf3rZjhIkofMhlSojF7jfX5h7HyR7jRFDF0fJLdC
         8s43StDNM488NZTGlTDxPPsUkux66leJ/WN8BYEkUQs6573qBsXRyiXWFor60sHJUy+B
         D60aybnq+Gs8W0mTVU8EwZuAlEjZ7yrxW2ObQItPdn/thjPRIO/LggNWhnp++CLQeZ2G
         Rb6S1szC2kBQ4jJsPo8qgtieagcrdG9qyOk0YsiZvc/61yq2bXL/MMGSb6ZhyPROB7/F
         HNPDYZqQXuP1bmkxoLmnyIg9XB/MZOy9rgNh0NO9zEAiurQJrRe4xjCwYL9+7iVRTcXc
         aEtA==
X-Gm-Message-State: AFqh2koIRiYyvYKyb5A1eoAKDFUr6fQdabAUSkceI/nCkfZYk6nvQ34L
	xLmOImQc6gLeegPrUtaxOmoblW9BLgI7+Q==
X-Google-Smtp-Source: AMrXdXsG+4bIWDzFdgHLr0aU5BXcH+7FKknC2pLjHCFvPalZ9noyXbxgzNVRjzB9owGWAX9UuUp3lg==
X-Received: by 2002:a05:622a:1f13:b0:3a5:3234:cc7b with SMTP id ca19-20020a05622a1f1300b003a53234cc7bmr90920184qtb.65.1673224754164;
        Sun, 08 Jan 2023 16:39:14 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id i1-20020a05620a248100b006fc9fe67e34sm4529980qkn.81.2023.01.08.16.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:39:13 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/14] linux-yocto/6.1: update to v6.1.1
Date: Sun,  8 Jan 2023 19:38:57 -0500
Message-Id: <8c2892d4c6edef6ed1e998c64d4b1d23cc559eb3.1673224444.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1673224444.git.bruce.ashfield@gmail.com>
References: <cover.1673224444.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 00:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175650

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    ebdb69c5b054 Linux 6.1.1
    1d1a710c1983 KEYS: encrypted: fix key instantiation with user-provided data
    e8d16a54842d cifs: fix oops during encryption
    4e453324803d usb: dwc3: pci: Update PCIe device ID for USB3 controller on CPU sub-system for Raptor Lake
    9222912924fc usb: typec: ucsi: Resume in separate work
    c383c7c35c7b igb: Initialize mailbox message for VF reset
    52d5896ba2a4 staging: r8188eu: fix led register settings
    c9cacc0ab1ea xhci: Apply XHCI_RESET_TO_DEFAULT quirk to ADL-N
    c0d91ec1a16a ALSA: hda/realtek: fix mute/micmute LEDs for a HP ProBook
    c0815ea08548 USB: serial: f81534: fix division by zero on line-speed change
    3c8b21ee1404 USB: serial: f81232: fix division by zero on line-speed change
    736f626ea8b8 USB: serial: cp210x: add Kamstrup RF sniffer PIDs
    0b63d587c0d2 USB: serial: option: add Quectel EM05-G modem
    d1a92bb8d697 usb: gadget: uvc: Prevent buffer overflow in setup handler
    2cd2e9322726 udf: Fix extending file within last block
    1cd3e9297d44 udf: Do not bother looking for prealloc extents if i_lenExtents matches i_size
    12a88f572d6d udf: Fix preallocation discarding at indirect extent boundary
    e6b01f6a0e77 udf: Discard preallocation before extending file with a hole
    fb9b502cf911 irqchip/ls-extirq: Fix endianness detection
    18301e16ea55 mips: ralink: mt7621: do not use kzalloc too early
    ee11da28a62e mips: ralink: mt7621: soc queries and tests as functions
    a1d9199ba485 mips: ralink: mt7621: define MT7621_SYSC_BASE with __iomem
    a4997bae1b5b PCI: mt7621: Add sentinel to quirks table
    76c6303530eb libbpf: Fix uninitialized warning in btf_dump_dump_type_data
    96c5043a4d64 x86/vdso: Conditionally export __vdso_sgx_enter_enclave()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++---
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 3bcd2e516b..d5cf406805 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3c497011beb11a43a38acc273366ce0997bc10db"
-SRCREV_meta ?= "d2ea5dce4e8398b85b226c9b0f303584de8d9f30"
+SRCREV_machine ?= "72ee515fa8840fdd38fa84d75330b05253f26b80"
+SRCREV_meta ?= "62f8a61df7e306935dee101e7268108956d1baee"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "6.1"
+LINUX_VERSION ?= "6.1.1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 32ec91dac8..93bf2e2bf8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "6.1"
+LINUX_VERSION ?= "6.1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6b919643ad199903450791493de5791556c032b7"
-SRCREV_meta ?= "d2ea5dce4e8398b85b226c9b0f303584de8d9f30"
+SRCREV_machine ?= "17d0acd7d6b43187ac9a8f88a9cc1b283682e693"
+SRCREV_meta ?= "62f8a61df7e306935dee101e7268108956d1baee"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 6aab5982b5..67cf09be44 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v6.1/standard/base"
 KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "09521916385d581a8ee0517f8279d28303f22d32"
-SRCREV_machine:qemuarm64 ?= "6b919643ad199903450791493de5791556c032b7"
-SRCREV_machine:qemumips ?= "0a86f820b067832e72b291c2310b0808618f66a6"
-SRCREV_machine:qemuppc ?= "6b919643ad199903450791493de5791556c032b7"
-SRCREV_machine:qemuriscv64 ?= "6b919643ad199903450791493de5791556c032b7"
-SRCREV_machine:qemuriscv32 ?= "6b919643ad199903450791493de5791556c032b7"
-SRCREV_machine:qemux86 ?= "6b919643ad199903450791493de5791556c032b7"
-SRCREV_machine:qemux86-64 ?= "6b919643ad199903450791493de5791556c032b7"
-SRCREV_machine:qemumips64 ?= "99437d8498c3e175f7e0f666e8a42fc942c65262"
-SRCREV_machine ?= "6b919643ad199903450791493de5791556c032b7"
-SRCREV_meta ?= "d2ea5dce4e8398b85b226c9b0f303584de8d9f30"
+SRCREV_machine:qemuarm ?= "0c99788b051ad6e9998d1f1faad4d83a78853276"
+SRCREV_machine:qemuarm64 ?= "17d0acd7d6b43187ac9a8f88a9cc1b283682e693"
+SRCREV_machine:qemumips ?= "c5e04f15989e607a92e8f188d8a192f4d4c9e58f"
+SRCREV_machine:qemuppc ?= "17d0acd7d6b43187ac9a8f88a9cc1b283682e693"
+SRCREV_machine:qemuriscv64 ?= "17d0acd7d6b43187ac9a8f88a9cc1b283682e693"
+SRCREV_machine:qemuriscv32 ?= "17d0acd7d6b43187ac9a8f88a9cc1b283682e693"
+SRCREV_machine:qemux86 ?= "17d0acd7d6b43187ac9a8f88a9cc1b283682e693"
+SRCREV_machine:qemux86-64 ?= "17d0acd7d6b43187ac9a8f88a9cc1b283682e693"
+SRCREV_machine:qemumips64 ?= "c99762002a808c36fd17f0d8c1158b3fcc2f2b4a"
+SRCREV_machine ?= "17d0acd7d6b43187ac9a8f88a9cc1b283682e693"
+SRCREV_meta ?= "62f8a61df7e306935dee101e7268108956d1baee"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "094226ad94f471a9f19e8f8e7140a09c2625abaa"
+SRCREV_machine:class-devupstream ?= "ebdb69c5b054f115ef5ff72f0bb2aaa1718904e6"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1"
+LINUX_VERSION ?= "6.1.1"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


