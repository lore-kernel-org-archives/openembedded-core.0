Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.73627.1629400150685506508
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 12:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=M0i2Rqnf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.47, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f47.google.com with SMTP id r17-20020a0568302371b0290504f3f418fbso9938160oth.12
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 12:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Iu9vFAWRfMMVwo+hygjSybZJGEg6trQ7KA7aIRGEIjU=;
        b=M0i2RqnfdB0ZtWZ1ac+WIbyeaob2dWWzOwg1Qxj58ld2ygDBSmcThcjsXLcVaZs5Ox
         RjiLVOyKI/hYN5YgM2f4ppO2OxteaNRkkneE3focIhDi0OeMY6YL6D8TYK5T5n3iT6CY
         8a4HKMvnllNixgL6ev9e5afeCdUyNYZL6igCwCYUMVBmKfoPFyce3WSnryPYrTeu6feu
         r86+nkzdAE6Hspt1p1TsMzq+MUVSRHjdjm/LozfdH9oKVbay90Vtu6uAnxL6WxxG6RIU
         alXIUY2vOdTSwwNKpLXxj9UoIBzC/ZvSz3irbv7KwxcQB/49eNJ3ppSWKxp6M/zsxvJg
         hQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Iu9vFAWRfMMVwo+hygjSybZJGEg6trQ7KA7aIRGEIjU=;
        b=lVbeOd05kuYD9XA/X1XxHSP5OjjR9C7hrhupn5gn5oEn6Q3W52TNaKAt2NYKwFRXZX
         060A0Uj6Ei5cXrbgJFxQ2vmsUObtWcMwARmfwW6sPwUyrwkJHlz1/A2pzzf+5Z8yStFC
         xQQHc63++NmslZhPwQVJMHi/wNE8K1t6S4/7HvaP58Twhs9p9kyfBHWuLAUvSExMO5tw
         JcIEcuUi7vY/IydEBizDI3Jxvz/eXqi0EcQIbdeUvu2mobgFkQb7/HwaicrAi9EeRlDO
         jibIwf421ESX8hZgdMF3PJybWTV0Mpxz0A7uAsBCPoHqNzZTkV5+fuyfJIjAYuLHoo35
         a/ug==
X-Gm-Message-State: AOAM530ffKdWgqG7Nnjg4L6bGbW9wHERcBvs0BZDi08+fjsEtEwQ9sTS
	UVFSSWY0Q8Dp+tutWoLXPtKrNHMq4IFr2wcN
X-Google-Smtp-Source: ABdhPJxqcFW3JHKzx5hzUGh5YZ5P467yGqNbgV5DKfHF1F37oZqNNiUSNWWdf6jD6iEYt+Z4P2p1lw==
X-Received: by 2002:a05:6830:3115:: with SMTP id b21mr13934715ots.240.1629400149560;
        Thu, 19 Aug 2021 12:09:09 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s10sm765080oog.14.2021.08.19.12.09.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 12:09:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/12] linux-yocto/5.4: update to v5.4.139
Date: Thu, 19 Aug 2021 09:07:58 -1000
Message-Id: <df362ae9ed810017b276d810e09c21f0290abcfd.1629399953.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629399953.git.steve@sakoman.com>
References: <cover.1629399953.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    e350cd02e293 Linux 5.4.139
    03ff8a4f9db6 spi: mediatek: Fix fifo transfer
    a0f66ddf05c2 bpf, selftests: Adjust few selftest outcomes wrt unreachable code
    d3796e8f6b3d bpf, selftests: Add a verifier test for assigning 32bit reg states to 64bit ones
    8dec99abcd74 bpf: Test_verifier, add alu32 bounds tracking tests
    fd568de5806f bpf: Fix leakage under speculation on mispredicted branches
    d2f790327f83 bpf: Do not mark insn as seen under speculative path verification
    283d742988f6 bpf: Inherit expanded/patched seen count from old aux data
    a0a9546aaec3 Revert "watchdog: iTCO_wdt: Account for rebooting on second timeout"
    76f5314d7859 firmware: arm_scmi: Add delayed response status check
    1b38f70bbc7c firmware: arm_scmi: Ensure drivers provide a probe function
    44f522298c94 Revert "Bluetooth: Shutdown controller after workqueues are flushed or cancelled"
    38f54217b423 ACPI: fix NULL pointer dereference
    0ea2f55babb7 nvme: fix nvme_setup_command metadata trace event
    b508b652d4f3 net: Fix zero-copy head len calculation.
    bf692e7ef657 qed: fix possible unpaired spin_{un}lock_bh in _qed_mcp_cmd_and_union()
    6bc48348eca7 r8152: Fix potential PM refcount imbalance
    a57c75ff0700 ASoC: tlv320aic31xx: fix reversed bclk/wclk master bits
    e2cccb839a18 spi: stm32h7: fix full duplex irq handler handling
    b72f2d9e91e1 regulator: rt5033: Fix n_voltages settings for BUCK and LDO
    86f2a3e9aae9 btrfs: fix lost inode on log replay after mix of fsync, rename and inode eviction
    b7f0fa2192c5 btrfs: fix race causing unnecessary inode logging during link and rename
    cb006da62a9e btrfs: do not commit logs and transactions during link and rename operations
    174c27d0f9ef btrfs: delete duplicated words + other fixes in comments
    7b90d57b09fa Linux 5.4.138
    7eef18c0479b can: j1939: j1939_session_deactivate(): clarify lifetime of session object
    18b536de3b97 i40e: Add additional info to PHY type error
    d21eb931109a Revert "perf map: Fix dso->nsinfo refcounting"
    16447b2f5c66 powerpc/pseries: Fix regression while building external modules
    265883d1d839 PCI: mvebu: Setup BAR0 in order to fix MSI
    21734a31c9a0 can: hi311x: fix a signedness bug in hi3110_cmd()
    f4fa45b0f91e sis900: Fix missing pci_disable_device() in probe and remove
    dff00ce44891 tulip: windbond-840: Fix missing pci_disable_device() in probe and remove
    e0310bbeaaa2 sctp: fix return value check in __sctp_rcv_asconf_lookup
    408614108abd net/mlx5e: Fix nullptr in mlx5e_hairpin_get_mdev()
    ac4983230616 net/mlx5: Fix flow table chaining
    527feae56fe6 net: llc: fix skb_over_panic
    ede4c93860e6 mlx4: Fix missing error code in mlx4_load_one()
    acb97d4b2d0e net: Set true network header for ECN decapsulation
    851946a68136 tipc: fix sleeping in tipc accept routine
    194b71d28b26 i40e: Fix log TC creation failure when max num of queues is exceeded
    834af62212c7 i40e: Fix queue-to-TC mapping on Tx
    74aea4b7159a i40e: Fix firmware LLDP agent related warning
    b2ab34e862eb i40e: Fix logic of disabling queues
    519582e44e6a netfilter: nft_nat: allow to specify layer 4 protocol NAT only
    3a7a4cee7bec netfilter: conntrack: adjust stop timestamp to real expiry value
    1c043783403c cfg80211: Fix possible memory leak in function cfg80211_bss_update
    6cf2abea1018 nfc: nfcsim: fix use after free during module unload
    6b313d0ffa71 NIU: fix incorrect error return, missed in previous revert
    c4663c162778 HID: wacom: Re-enable touch by default for Cintiq 24HDT / 27QHDT
    e9e2ce00aeda can: esd_usb2: fix memory leak
    43726620b2f6 can: ems_usb: fix memory leak
    819867389276 can: usb_8dev: fix memory leak
    a051dbd17b5b can: mcba_usb_start(): add missing urb->transfer_dma initialization
    793581441b5c can: raw: raw_setsockopt(): fix raw_rcv panic for sock UAF
    c621638d0e6d can: j1939: j1939_xtp_rx_dat_one(): fix rxtimer value between consecutive TP.DT to 750ms
    a24d87b429a9 ocfs2: issue zeroout to EOF blocks
    eaaa4284e288 ocfs2: fix zero out valid data
    9bd1092148b5 KVM: add missing compat KVM_CLEAR_DIRTY_LOG
    7a94dfe5e2a0 x86/kvm: fix vcpu-id indexed array sizes
    2dc291582cce Revert "ACPI: resources: Add checks for ACPI IRQ override"
    a8eec6979734 btrfs: mark compressed range uptodate only if all bio succeed
    57429c1ec770 btrfs: fix rw device counting in __btrfs_free_extra_devids
    61f2cbc792eb x86/asm: Ensure asm/proto.h can be included stand-alone
    99372c38a948 net_sched: check error pointer in tcf_dump_walker()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d5455d9e201e324b7cf7bb19381bfebb0e892312)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 03a49a0b39..d4b7b26ca4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c2634e34da0641aafe30fd3fb924386dd62f4941"
-SRCREV_meta ?= "cfd547115bc4d65c29f0f4313bd950976f41ebd8"
+SRCREV_machine ?= "0ad6f2204daf35fb25df5e9b52383507df813bb4"
+SRCREV_meta ?= "98ba88191b7c489bc0d83b6c87a31b2330fcd886"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.137"
+LINUX_VERSION ?= "5.4.139"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index dd2a9cbcc0..c734ce8db5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.137"
+LINUX_VERSION ?= "5.4.139"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "a51fc55766d4ae07f7b67adc4c9d3b07a1d1d475"
-SRCREV_machine ?= "4c6ef497d892e3b5846a60fdd6f2a6df7177f570"
-SRCREV_meta ?= "cfd547115bc4d65c29f0f4313bd950976f41ebd8"
+SRCREV_machine_qemuarm ?= "a80ea6be16b19c18855f831333c93d4f3b55e58a"
+SRCREV_machine ?= "405fce9e3f0314767e38b5e8295b34a24cd97a46"
+SRCREV_meta ?= "98ba88191b7c489bc0d83b6c87a31b2330fcd886"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 03f188da51..a4c3b54805 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "88d3d4ec2c23ed165ee11dd9fc48ac77fee480ba"
-SRCREV_machine_qemuarm64 ?= "7cad0ac3beb6fc0a1f84dc079d0e6a68fedb3df4"
-SRCREV_machine_qemumips ?= "d8b1cb081cbfa6a7157561d61ce383bc661208d8"
-SRCREV_machine_qemuppc ?= "528a4de381c0a22e9eeebe899e159ed8d4fccff3"
-SRCREV_machine_qemuriscv64 ?= "90d297d951740cd13553072fb00afbf39045d38a"
-SRCREV_machine_qemux86 ?= "90d297d951740cd13553072fb00afbf39045d38a"
-SRCREV_machine_qemux86-64 ?= "90d297d951740cd13553072fb00afbf39045d38a"
-SRCREV_machine_qemumips64 ?= "29b36c7b1c51b5322cba165dd11b435ad9439adf"
-SRCREV_machine ?= "90d297d951740cd13553072fb00afbf39045d38a"
-SRCREV_meta ?= "cfd547115bc4d65c29f0f4313bd950976f41ebd8"
+SRCREV_machine_qemuarm ?= "3d243cfd29a57dfe6b04a6a6cf1b1088d107f1f6"
+SRCREV_machine_qemuarm64 ?= "dcac97a2b4469136189f86fe42703026693384be"
+SRCREV_machine_qemumips ?= "ee74231b68518107954078d03d0606910603cf7a"
+SRCREV_machine_qemuppc ?= "76c51679aa6b9c25fe2b5c2052e84197ff2e4e2d"
+SRCREV_machine_qemuriscv64 ?= "807b4668ff7fe3be031ace442a84d70821ef9571"
+SRCREV_machine_qemux86 ?= "807b4668ff7fe3be031ace442a84d70821ef9571"
+SRCREV_machine_qemux86-64 ?= "807b4668ff7fe3be031ace442a84d70821ef9571"
+SRCREV_machine_qemumips64 ?= "3396071f8ce8ca148231fee4d2130feeead41926"
+SRCREV_machine ?= "807b4668ff7fe3be031ace442a84d70821ef9571"
+SRCREV_meta ?= "98ba88191b7c489bc0d83b6c87a31b2330fcd886"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.137"
+LINUX_VERSION ?= "5.4.139"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1

