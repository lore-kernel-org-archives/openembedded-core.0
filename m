Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58688C32796
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 01:42:39 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.6246.1661305351958314811
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 18:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BCTJ/GnN;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id c9so10534908qkk.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 18:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ey8YtuvuqwlNldUhEh+UIe+rYBBS2rB68veuZV9yBqk=;
        b=BCTJ/GnNZRjreRAP4BsYOQNcNLVxiobrf0CNQn4D5O83ZgsPLInUBXMQz+vyL9iISf
         U9AsETFcNd5ouXpLeC0AjYamCNTuI4j1413rMHxXqViHvUoUCRX3KXyY3P+lVsDJ4HuG
         61qTKLt+IAi0ichQVmt1S/EX9gQZupWifYF88t1W5ffSlFF6Ji9a7RiDgzMxFPBUbdOF
         DaBaZRUnuVCG/fn4sLiHyUltWzYVV7XyoR6JyeTQpAJZq+8RXF5ki1HGEHVLQu6douzC
         PLq2bxUZEtT12WNnplbabStpcjzyVXBCsZKRPUBX8r711nTUuLkr6wexNYrsKqK9Xzpq
         6kZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ey8YtuvuqwlNldUhEh+UIe+rYBBS2rB68veuZV9yBqk=;
        b=ySDDCQ+n05+JDlsEVn7TDySg5CdLaO8ESaOIiTDHqY+OLY2yvfECD4A0Xd5OdXNDRF
         9n+wKNC+q1sjPfbkccroqb3aJdDbg0B72PYmmKFTwbkJwft3rSfQ6sQrFTatF+Y3xoz8
         OYP4sFm+9KQYAtruwdGfeR9B3kEGRAR+2wMEIfKIbukkCelJAGzSthnIrIzhOiB82/ix
         /Ig6DlPZLgL5cPiWIBlKvH8a2Jb7Woz78E7evzymEz9l7MHVMDAhQbbsPhI8N30TGLbT
         0GhlL7jhREmKiVYqhrIY4fLDhqqFQINE8Mq9vbHfvYH2hVTYnXjk5ylKyw8iQ84UBlPj
         GA/g==
X-Gm-Message-State: ACgBeo3jKwD0BQtWg8bmy6RE8M3RuKegsd/ruiSearqInkrvXrePYHGQ
	vJneZxFgZibyd43ZKAWQnDOh+veFZMw=
X-Google-Smtp-Source: 
 AA6agR6y/+cUQOE7kjlcOyLwQYUu/MEVKLV7Rou65qvgZgG8yT/q/x9wFOc3t9GMoPxxt5l1q1LHig==
X-Received: by 2002:a05:620a:1468:b0:6bb:822d:2c48 with SMTP id
 j8-20020a05620a146800b006bb822d2c48mr18346846qkl.393.1661305350842;
        Tue, 23 Aug 2022 18:42:30 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 u4-20020a05620a454400b006bbe7ded98csm11110003qkp.112.2022.08.23.18.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 18:42:29 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/5.19: update to v5.19.1
Date: Tue, 23 Aug 2022 21:42:22 -0400
Message-Id: 
 <904ea60a46ad94ce23831068b20f92d205c76362.1661305178.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1661305178.git.bruce.ashfield@gmail.com>
References: <cover.1661305178.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 01:42:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169771

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    d654f7e29909 Linux 5.19.1
    f6664a403f11 x86/speculation: Add LFENCE to RSB fill sequence
    f826d0412d80 x86/speculation: Add RSB VM Exit protections
    224b653547fa macintosh/adb: fix oob read in do_adb_query() function
    7f64bc0c090c Bluetooth: btusb: Add Realtek RTL8852C support ID 0x13D3:0x3586
    651880ed7d39 Bluetooth: btusb: Add Realtek RTL8852C support ID 0x13D3:0x3587
    7562b32d7531 Bluetooth: btusb: Add Realtek RTL8852C support ID 0x0CB8:0xC558
    17da5b394ba4 Bluetooth: btusb: Add Realtek RTL8852C support ID 0x04C5:0x1675
    9122622a9d2a Bluetooth: btusb: Add Realtek RTL8852C support ID 0x04CA:0x4007
    cb79e61c28b9 Bluetooth: btusb: Add support of IMC Networks PID 0x3568
    34464228344c dt-bindings: bluetooth: broadcom: Add BCM4349B1 DT binding
    18b04e68252f Bluetooth: hci_bcm: Add DT compatible for CYW55572
    f7b229ecf21a Bluetooth: hci_bcm: Add BCM4349B1 variant
    60ef27c1c77f Bluetooth: hci_qca: Return wakeup for qca_wakeup
    9283e708a9b8 arm64: set UXN on swapper page tables
    231276d2c6cc ata: sata_mv: Fixes expected number of resources now IRQs are gone
    d069dcffef84 crypto: arm64/poly1305 - fix a read out-of-bound
    cd5a88272762 ACPI: APEI: Better fix to avoid spamming the console with old error logs
    eb5595ac6aee ACPI: video: Shortening quirk list by identifying Clevo by board_name only
    5ab9b078c4ff ACPI: video: Force backlight native for some TongFang devices
    7c8e33cc2a49 tools/vm/slabinfo: Handle files in debugfs
    28a9cbc1c927 block: fix default IO priority handling again

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.19.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.19.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index e70d20f9f0..3e8fdad973 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "942f6fb5262e8432d6fa982022d953e6a63aec64"
-SRCREV_meta ?= "89fdc2046baff988519317cbe838386b6489779f"
+SRCREV_machine ?= "057686157785f537d3c8ddd336ec5543fa29ceef"
+SRCREV_meta ?= "0af450ed2237ad685ee30cce1b46347429269aef"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.19"
+LINUX_VERSION ?= "5.19.1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index b0c4d30ef0..163f8b476e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.19"
+LINUX_VERSION ?= "5.19.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "e0e977e1b098d96389f2ab657849456ded9189c9"
-SRCREV_meta ?= "89fdc2046baff988519317cbe838386b6489779f"
+SRCREV_machine ?= "06993dc6c98efb8187b54577f329d244823c640e"
+SRCREV_meta ?= "0af450ed2237ad685ee30cce1b46347429269aef"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index 2fb6a05b84..bd35fd4dcc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.19/standard/base"
 KBRANCH:qemux86-64 ?= "v5.19/standard/base"
 KBRANCH:qemumips64 ?= "v5.19/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "a6ca992258edecafa8bf33cfc5d9e54019ea27b8"
-SRCREV_machine:qemuarm64 ?= "e0e977e1b098d96389f2ab657849456ded9189c9"
-SRCREV_machine:qemumips ?= "371a5e816aa00f010df12d9fed04dee9f5829cf1"
-SRCREV_machine:qemuppc ?= "e0e977e1b098d96389f2ab657849456ded9189c9"
-SRCREV_machine:qemuriscv64 ?= "e0e977e1b098d96389f2ab657849456ded9189c9"
-SRCREV_machine:qemuriscv32 ?= "e0e977e1b098d96389f2ab657849456ded9189c9"
-SRCREV_machine:qemux86 ?= "e0e977e1b098d96389f2ab657849456ded9189c9"
-SRCREV_machine:qemux86-64 ?= "e0e977e1b098d96389f2ab657849456ded9189c9"
-SRCREV_machine:qemumips64 ?= "a28b974f928d53d00b06d0d61ae7746336a438f4"
-SRCREV_machine ?= "e0e977e1b098d96389f2ab657849456ded9189c9"
-SRCREV_meta ?= "89fdc2046baff988519317cbe838386b6489779f"
+SRCREV_machine:qemuarm ?= "0c8188d25f51316fb206d4080d2549ef3b014591"
+SRCREV_machine:qemuarm64 ?= "06993dc6c98efb8187b54577f329d244823c640e"
+SRCREV_machine:qemumips ?= "ca2f5a010898511f597c3ac9164710c45628b991"
+SRCREV_machine:qemuppc ?= "06993dc6c98efb8187b54577f329d244823c640e"
+SRCREV_machine:qemuriscv64 ?= "06993dc6c98efb8187b54577f329d244823c640e"
+SRCREV_machine:qemuriscv32 ?= "06993dc6c98efb8187b54577f329d244823c640e"
+SRCREV_machine:qemux86 ?= "06993dc6c98efb8187b54577f329d244823c640e"
+SRCREV_machine:qemux86-64 ?= "06993dc6c98efb8187b54577f329d244823c640e"
+SRCREV_machine:qemumips64 ?= "3a5b406270a506682a645819b76b387c8d1c6dae"
+SRCREV_machine ?= "06993dc6c98efb8187b54577f329d244823c640e"
+SRCREV_meta ?= "0af450ed2237ad685ee30cce1b46347429269aef"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "3d7cb6b04c3f3115719235cc6866b10326de34cd"
+SRCREV_machine:class-devupstream ?= "d654f7e29909ce602942a1cd927d56d5aa397ed8"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.19/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.19"
+LINUX_VERSION ?= "5.19.1"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


