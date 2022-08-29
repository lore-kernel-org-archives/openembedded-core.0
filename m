Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E74C9ECAAA2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 01:58:02 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web08.66245.1661738281548250914
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 18:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hweTR1sa;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id w18so5126936qki.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 18:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=e5ka8zEc6eqRNPmbPBqijguFUJxLbmcThbPqxWnhstk=;
        b=hweTR1sayRWOyLT504blAw/iS9aVsCRvcg6v23L1WmtPEKBorsVToZ4+S9EqmZyZKS
         WFtlL/kfX3FwwTds+AvjdQBR3b3RTBEAHUzFJRcL4nZcwSDJFh8BL9QGQvDqIll78a77
         zerFuxTKz9vj59Px01LT2MnDjICimIlt5mtQYj/zLYaFNtZBAv0jdo9AuoJMGP31Lugs
         0jCBdbKQNlPAomgIzPAq1EJFBO6UlwLpflvN9zhMUaGSsajd2b+4LAB7BWfeFbUrugIf
         7LuIw1GxicEjsi+JTAS4CElHadcLQu+XF3nzhAPIruYiWuk68XZQbsAimgzcb7sLCL4v
         eB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=e5ka8zEc6eqRNPmbPBqijguFUJxLbmcThbPqxWnhstk=;
        b=cWGqVrYGDDrIxCk6bmxRkusScxroLghWP32g4nkj7l4qJ3z2lMe6R1Wiv3m4fWuIAD
         8YT2orTzoyVwiipk7LBhYzzPa2Hq0penkN9HejILlq8R2f+a/OoRR45xS/BHbjMIEHVC
         fNJmrsZ3HkqWFuw+V6Fj2TF4o2qPiY63Oh08h3p70NZcH8iOvehlhbORiYAcu8nnTu/k
         kiIdZOdNhoJHGOpvNKseu+nnRqPOnTZGQMF0iq9y1SYV55n5MPjy0jlH9cgOoVv4v4rF
         axvTNrXEcHw8LbqdRuHlXy+igIRtqGKpz5UpZx1v4PZGgJyb+qLJiEwBhijkv3Lak1Ue
         oatQ==
X-Gm-Message-State: ACgBeo0gI+ceBx1EshN3UFDCKXpnZ/uDfJBufvBVFOR0+5tQiaxCYfGU
	afOGXsbIXkSfsXBGyVrw7IlQeOY9HR4=
X-Google-Smtp-Source: 
 AA6agR667aTL+yEejIiLZue1YGjObsu0/22HAvIgeQPFs0pf5i9vvgflG8jn/TAfU6Cx/KKivsbDbA==
X-Received: by 2002:a37:a904:0:b0:6bc:6de2:2d71 with SMTP id
 s4-20020a37a904000000b006bc6de22d71mr6893754qke.85.1661738280447;
        Sun, 28 Aug 2022 18:58:00 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 n3-20020a05620a294300b006b97151d2b3sm5124789qkp.67.2022.08.28.18.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 18:57:59 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2][kirkstone] linux-yocto/5.10: update to v5.10.136
Date: Sun, 28 Aug 2022 21:57:58 -0400
Message-Id: <20220829015759.63624-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 01:58:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170003

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    6eae1503ddf9 Linux 5.10.136
    1bea03b44ea2 x86/speculation: Add LFENCE to RSB fill sequence
    509c2c9fe75e x86/speculation: Add RSB VM Exit protections
    e5b556a7b271 macintosh/adb: fix oob read in do_adb_query() function
    75742ffc3630 Bluetooth: btusb: Add Realtek RTL8852C support ID 0x13D3:0x3586
    40e2e7f1bf03 Bluetooth: btusb: Add Realtek RTL8852C support ID 0x13D3:0x3587
    9c45bb363e26 Bluetooth: btusb: Add Realtek RTL8852C support ID 0x0CB8:0xC558
    3a292cb18132 Bluetooth: btusb: Add Realtek RTL8852C support ID 0x04C5:0x1675
    1a2a2e34569c Bluetooth: btusb: Add Realtek RTL8852C support ID 0x04CA:0x4007
    e81f95d03060 Bluetooth: btusb: Add support of IMC Networks PID 0x3568
    918ce738e28b Bluetooth: hci_bcm: Add DT compatible for CYW55572
    033a4455d9d6 Bluetooth: hci_bcm: Add BCM4349B1 variant
    50763f0ac070 selftests: KVM: Handle compiler optimizations in ucall
    a56e1ccdb7bb tools/kvm_stat: fix display of error when multiple processes are found
    3c77292d52b3 crypto: arm64/poly1305 - fix a read out-of-bound
    e2c63e1afdb3 ACPI: APEI: Better fix to avoid spamming the console with old error logs
    6ccff35588d2 ACPI: video: Shortening quirk list by identifying Clevo by board_name only
    a2b472b152f9 ACPI: video: Force backlight native for some TongFang devices
    a01a4e9f5dc9 tun: avoid double free in tun_free_netdev
    1069087e2fb1 selftests/bpf: Check dst_port only on the client socket
    042fb1c281f3 selftests/bpf: Extend verifier and bpf_sock tests for dst_port loads
    78c8397132dd ath9k_htc: fix NULL pointer dereference at ath9k_htc_tx_get_packet()
    4f3b85233660 ath9k_htc: fix NULL pointer dereference at ath9k_htc_rxep()
    45b69848a2fe x86/speculation: Make all RETbleed mitigations 64-bit only

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 9387c67cfb..fe566f4a98 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6df690626649ba5430a379f63a5f7b7423ce2e48"
-SRCREV_meta ?= "ed7e0c3bb9464387ba99fedd5ea32bf78ae2fe45"
+SRCREV_machine ?= "53c4c47a43a3309e6aac7c67642877e2fb5f0aa5"
+SRCREV_meta ?= "443f1c2f821e55dd96d115bb09e89f8f106b63d4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.135"
+LINUX_VERSION ?= "5.10.136"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index d7aa3281cc..6527b79127 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.135"
+LINUX_VERSION ?= "5.10.136"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "3b1c4608c04d645b292f13cc550b5151e032794b"
-SRCREV_machine ?= "cbfab86927ad95da60b8d49957ca941df615d877"
-SRCREV_meta ?= "ed7e0c3bb9464387ba99fedd5ea32bf78ae2fe45"
+SRCREV_machine:qemuarm ?= "9809577b21100a3aefced164ee35a396a39328d2"
+SRCREV_machine ?= "c6edaa10a3b8eb4543a60a638d9b70d4389d3297"
+SRCREV_meta ?= "443f1c2f821e55dd96d115bb09e89f8f106b63d4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 73a58e59a0..e190fe1d20 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "23ab0f8300e7b90fdf1e0be923933d5cfd03b618"
-SRCREV_machine:qemuarm64 ?= "5ff1949cbb7ff90ae3e4dc6fd0fd9876ffaab9d2"
-SRCREV_machine:qemumips ?= "01c75770046189608bb4ea9977521ec58a15b6bf"
-SRCREV_machine:qemuppc ?= "7dd170da9eacb57c6d8eff88ca24b8bf55ab042a"
-SRCREV_machine:qemuriscv64 ?= "d09b184cbc0321794bda715ab560dec077a048d0"
-SRCREV_machine:qemuriscv32 ?= "d09b184cbc0321794bda715ab560dec077a048d0"
-SRCREV_machine:qemux86 ?= "d09b184cbc0321794bda715ab560dec077a048d0"
-SRCREV_machine:qemux86-64 ?= "d09b184cbc0321794bda715ab560dec077a048d0"
-SRCREV_machine:qemumips64 ?= "a099189ac94c7218c09f1519ea4222fb2d9070be"
-SRCREV_machine ?= "d09b184cbc0321794bda715ab560dec077a048d0"
-SRCREV_meta ?= "ed7e0c3bb9464387ba99fedd5ea32bf78ae2fe45"
+SRCREV_machine:qemuarm ?= "43b91747cacc1e5fcdf5b947fd5b4590fae8a049"
+SRCREV_machine:qemuarm64 ?= "6165ca236a23c05d3da4b738bad89dd535aa78f3"
+SRCREV_machine:qemumips ?= "31e654239d87d1e23860c4d3ccb4ec1cafcd1da1"
+SRCREV_machine:qemuppc ?= "c937840dded651d4a6c52c3224d9143881357f24"
+SRCREV_machine:qemuriscv64 ?= "f5a6799ac6a4f7f1f4ba3c202d7c4cf77f9f3edb"
+SRCREV_machine:qemuriscv32 ?= "f5a6799ac6a4f7f1f4ba3c202d7c4cf77f9f3edb"
+SRCREV_machine:qemux86 ?= "f5a6799ac6a4f7f1f4ba3c202d7c4cf77f9f3edb"
+SRCREV_machine:qemux86-64 ?= "f5a6799ac6a4f7f1f4ba3c202d7c4cf77f9f3edb"
+SRCREV_machine:qemumips64 ?= "d66b79176c796d94b313bff2b7dc77f0db335490"
+SRCREV_machine ?= "f5a6799ac6a4f7f1f4ba3c202d7c4cf77f9f3edb"
+SRCREV_meta ?= "443f1c2f821e55dd96d115bb09e89f8f106b63d4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.135"
+LINUX_VERSION ?= "5.10.136"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


