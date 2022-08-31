Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB092C0502C
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 14:40:01 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web09.26475.1661956797260359752
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=HFQ0phU1;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id q9so13680876pgq.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=Kp8MLmJSySZ68KXppb0KyAvyPBJCEI6UGBHfDTksxcM=;
        b=HFQ0phU11OYSRM2WulKUh1uCuEH5SdDi1dciJXzIyoyLqXKQYtK4W/aLlrnKG1J8fE
         nbC/2EcS4JNd3r8XUCogy8SqGa4S4hKepDO5XnBFMjLVSL5o9nv4Ht/gWXJ0KfIJTXDi
         sWAa+0rf3mp+QqD+ekW+vqFDgTOCYZFu/T4NUhfOEW0darK2QAHfhMkCqhYcsvjpqdeu
         6BfmDDASWiF/ahXhNkTfjzDPdXz/w3cYv8ftG2mfiVmnnc8sUEwWOffGJbK/+jWo6N66
         6YNqVGdsCb99izp5zXTrfS7xz2vOZcam/4O3w21orf5GsEgGauiZZ7kQepek6PyhTyj4
         qwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=Kp8MLmJSySZ68KXppb0KyAvyPBJCEI6UGBHfDTksxcM=;
        b=KXBdhKUg4of3IXhhJCBiKhb7Xhvxj9vAxPwCiCyYb8R2lSnEsnoOhsNU6L9eWCfHDP
         cxNF89+2x9sFTlsndZErXFcg4gxt4EHtLONxmX+hPrRzSgcDfSWu8cdfjn8TELiHSV6x
         GX5gp+5oNFzSJ9+s1W65r6OWy/pyeYzPqrM6LTmHPFa0aN72SYzDKsfsw8c3uYH9j0C5
         HT8f3mYZOCCVosnb4AXB6YpgpT79OFyDPnHNJ0MnZ7teS0tAlGoPzFlzQD+xuWTQ3PAz
         eLrWCMtqjF4n/qkRMRiTiWlUnyMXFJw81WKuJ15D3ypyMNN1d7+f0EUrurRhwUEJoXOB
         vu6g==
X-Gm-Message-State: ACgBeo1ZPgqKR7X7R9wS1qzi87ZfFOLtR7zNGpxy6A5hS5G07SXCr4OV
	q55HsOAEdtVZU6+f0r0YASKK2rA/iiiF99Y7
X-Google-Smtp-Source: 
 AA6agR7AmJBQCG7RQZg3nZ4Z4b4s0t5Et+NSpU8xQAxJrxO6s8Iwn2rRYyb+15X9EnLXyXA6aEzkdg==
X-Received: by 2002:a65:6e46:0:b0:42a:2c7e:4232 with SMTP id
 be6-20020a656e46000000b0042a2c7e4232mr22403147pgb.611.1661956796209;
        Wed, 31 Aug 2022 07:39:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a170902d1c500b00174d715cb76sm6070780plb.2.2022.08.31.07.39.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 07:39:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/19] linux-yocto/5.15: update to v5.15.60
Date: Wed, 31 Aug 2022 04:39:23 -1000
Message-Id: 
 <9d8d44dc6cc882d45004711cebe6f47f0bba4ffd.1661956484.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661956484.git.steve@sakoman.com>
References: <cover.1661956484.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 14:40:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170114

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    7217df812798 Linux 5.15.60
    5c5c77746ce1 x86/speculation: Add LFENCE to RSB fill sequence
    7fcd99e889c0 x86/speculation: Add RSB VM Exit protections
    c81d1bb58c88 macintosh/adb: fix oob read in do_adb_query() function
    d98cf2b40c20 Bluetooth: btusb: Add Realtek RTL8852C support ID 0x13D3:0x3586
    ee421ad8973b Bluetooth: btusb: Add Realtek RTL8852C support ID 0x13D3:0x3587
    59689a843bc9 Bluetooth: btusb: Add Realtek RTL8852C support ID 0x0CB8:0xC558
    b653eeaa8cf8 Bluetooth: btusb: Add Realtek RTL8852C support ID 0x04C5:0x1675
    d4f921efb4bf Bluetooth: btusb: Add Realtek RTL8852C support ID 0x04CA:0x4007
    04e3388eeb47 Bluetooth: btusb: Add support of IMC Networks PID 0x3568
    6a5ec48fb752 dt-bindings: bluetooth: broadcom: Add BCM4349B1 DT binding
    88e088e29487 Bluetooth: hci_bcm: Add DT compatible for CYW55572
    2aa38f0af306 Bluetooth: hci_bcm: Add BCM4349B1 variant
    37b385c78cd5 btrfs: zoned: fix critical section of relocation inode writeback
    5e04c8bf42d8 btrfs: zoned: prevent allocation from previous data relocation BG
    775871d4be0d arm64: set UXN on swapper page tables
    a619a0312099 KVM: x86/svm: add __GFP_ACCOUNT to __sev_dbg_{en,de}crypt_user()
    e423893fe320 selftests: KVM: Handle compiler optimizations in ucall
    bc2cee443c74 tools/kvm_stat: fix display of error when multiple processes are found
    9acd899d2feb KVM: selftests: Make hyperv_clock selftest more stable
    ad6fd99d5feb KVM: x86: do not set st->preempted when going back to user space
    92343314d34e KVM: x86: do not report a vCPU as preempted outside instruction boundaries
    3d4c28475ee3 crypto: arm64/poly1305 - fix a read out-of-bound
    397c2116cbe2 ACPI: APEI: Better fix to avoid spamming the console with old error logs
    e7170bcda613 ACPI: video: Shortening quirk list by identifying Clevo by board_name only
    3a5fab5c4505 ACPI: video: Force backlight native for some TongFang devices
    9894717519cc tools/vm/slabinfo: Handle files in debugfs
    7ad47f414b40 block: fix default IO priority handling again
    e889a4c440eb selftests/bpf: Check dst_port only on the client socket
    119debdb9f25 selftests/bpf: Extend verifier and bpf_sock tests for dst_port loads
    df9692b8a319 x86/speculation: Make all RETbleed mitigations 64-bit only

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 04d334d8881921a1a20407bc8428c7b9c9c80d2d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 32c7db2c74..86682d7e96 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "13ee019f28013cf8c102a3ffaadfa5e9ae9743e1"
-SRCREV_meta ?= "f7f709bf874f85baff9f2fb0ac0341c08399b144"
+SRCREV_machine ?= "00e089be37ae8128e25ad76999a742d30c94a8b2"
+SRCREV_meta ?= "d9823ca27110545274f77718aefbd809c29947e6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.59"
+LINUX_VERSION ?= "5.15.60"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 8eb138e78b..a5b499a239 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.59"
+LINUX_VERSION ?= "5.15.60"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "86c19d4c40f475e09a076d55391fa66d96a1b3ac"
-SRCREV_meta ?= "f7f709bf874f85baff9f2fb0ac0341c08399b144"
+SRCREV_machine ?= "d340c7a79d7732c113a14bdaeafb8105518a7a1e"
+SRCREV_meta ?= "d9823ca27110545274f77718aefbd809c29947e6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 083f87727b..e951416173 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c33f2e2ad3fdcc1c9539f80fb51b49f68c544c03"
-SRCREV_machine:qemuarm64 ?= "e8a14fadeb24619f20d3caebc01c7f26c49f768a"
-SRCREV_machine:qemumips ?= "c5f07eee39e4e03e90de3e71a3f6448fdb73921a"
-SRCREV_machine:qemuppc ?= "b5873d3a40b837059a36179174863cb4c7f9e109"
-SRCREV_machine:qemuriscv64 ?= "efe20512212b0e85b5f884b1bfc8fbba2b43541a"
-SRCREV_machine:qemuriscv32 ?= "efe20512212b0e85b5f884b1bfc8fbba2b43541a"
-SRCREV_machine:qemux86 ?= "efe20512212b0e85b5f884b1bfc8fbba2b43541a"
-SRCREV_machine:qemux86-64 ?= "efe20512212b0e85b5f884b1bfc8fbba2b43541a"
-SRCREV_machine:qemumips64 ?= "a6c0767511eed80395777e42d33fdc8405bff2b4"
-SRCREV_machine ?= "efe20512212b0e85b5f884b1bfc8fbba2b43541a"
-SRCREV_meta ?= "f7f709bf874f85baff9f2fb0ac0341c08399b144"
+SRCREV_machine:qemuarm ?= "4f44e132a6125375e0df478c554d7cdd2d9d2eef"
+SRCREV_machine:qemuarm64 ?= "a22cdb03286227fd857bf7fa2b300450731b5beb"
+SRCREV_machine:qemumips ?= "ec404ea5806c491da140012bc7e5079dd2de611d"
+SRCREV_machine:qemuppc ?= "5c3013acab557c83baede63b4cf0d93fb166910e"
+SRCREV_machine:qemuriscv64 ?= "f832b2c67939eecf666126dcde686c50c3e8d358"
+SRCREV_machine:qemuriscv32 ?= "f832b2c67939eecf666126dcde686c50c3e8d358"
+SRCREV_machine:qemux86 ?= "f832b2c67939eecf666126dcde686c50c3e8d358"
+SRCREV_machine:qemux86-64 ?= "f832b2c67939eecf666126dcde686c50c3e8d358"
+SRCREV_machine:qemumips64 ?= "08ee7b823201d23f7fac7177fc3f00ce61e981bf"
+SRCREV_machine ?= "f832b2c67939eecf666126dcde686c50c3e8d358"
+SRCREV_meta ?= "d9823ca27110545274f77718aefbd809c29947e6"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d676d6149a2f4b4d66b8ea0a1dfef30a54cf5750"
+SRCREV_machine:class-devupstream ?= "7217df81279835a7aee62a07aabb7b8fb8c766f2"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.59"
+LINUX_VERSION ?= "5.15.60"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


