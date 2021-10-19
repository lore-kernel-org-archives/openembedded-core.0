Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A39E8C433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 02:46:23 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.4605.1634611582548947764
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 19:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZbMjRPPV;
 spf=pass (domain: gmail.com, ip: 209.85.219.43,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id k29so11443220qve.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 19:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=thUg2tARaCom6ZE5gMH1jQxtDXLOoqL1520jBD94oLo=;
        b=ZbMjRPPVl7uSOS7eFRhDmv1q+tXefu/NhVT4SB4joxHSyc1Y/4IFtLxk3J4IC6UTDv
         ZmcVuyshrC2J3WyLe+fdSDCG0EVjYKiNvT8CtnQG5JTfRU+AhrWk0Or4u4izPxYeXR8u
         C7eKsfNmkMEMmGSHWm6tN0doGPdhqgJwER09v9B0MYlcdaor3lclbJ84Tv4FeDKO8UTp
         L/JmEA0VLTskA06O2LFlup909vLqrQlKUDKw/6jJrRaiMXQZmNauAwTYl78mSCL0hMyH
         cFXKtqdPKg5zlInMFBErA3qn5UTBLsbqcTOrAwwrQQnF9g8YgDEMOjnAEK7NEpPwR6K+
         9QzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=thUg2tARaCom6ZE5gMH1jQxtDXLOoqL1520jBD94oLo=;
        b=ZICk4e+NgMAXzrue/phUm/nwmSixEtUtZsypQckEaNf7oFrczb3aHnDfpNym4F5iIn
         MUNi+g448azP9+LqBSIzvMDmDrutHmE8cu39y5bNzy17zvm9rgC2gWLlo8YEVjI1zZN6
         3jVJY3i7VTdQYjh+OkGr08R8elf0vSca9DlusNE8ZcZ6yxYEa/6Sa3NFFaLJoRzUwHp8
         AqxW48RjQLz0q1u+j8pkbvhKmhSRFmJYziTIBmu5ORL2BDKLxbmpzcjB2UUv0LZQQ5v/
         sLvJ0WZc9CV1zwUfuX1/F7TeSz1p7b+YKBn+DzeSc/Hu7jEsZitIFWN/K9inuFd1eLQb
         CJhA==
X-Gm-Message-State: AOAM532IohtmphG1ITTa4ZfwopcqXY3+1x1qLWbyREJK69sQag9GJ2M/
	t53Th0OKAEf+Hg+u+L/7r1foVDl/sjpQGg==
X-Google-Smtp-Source: 
 ABdhPJz7z6OA0H1MX6ULyFeatOqjz1RTHBHQeaIpcufETdw50xm7oC5kcOIZ1R7kNQGXRQ0CVVIEuA==
X-Received: by 2002:a05:6214:1305:: with SMTP id
 a5mr29464319qvv.64.1634611581562;
        Mon, 18 Oct 2021 19:46:21 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 x9sm7069060qtw.84.2021.10.18.19.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 19:46:21 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3][dunfell] linux-yocto/5.4: update to v5.4.150
Date: Mon, 18 Oct 2021 22:46:17 -0400
Message-Id: <20211019024618.62100-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20211019024618.62100-1-bruce.ashfield@gmail.com>
References: <20211019024618.62100-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 02:46:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157101

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    3a7dc5b4cfbd Linux 5.4.150
    27f8c4402c4a qnx4: work around gcc false positive warning bug
    3a0f951e3725 xen/balloon: fix balloon kthread freezing
    f80b6793811d arm64: dts: marvell: armada-37xx: Extend PCIe MEM space
    04783de9c0f3 thermal/drivers/int340x: Do not set a wrong tcc offset on resume
    de1c3506806d EDAC/synopsys: Fix wrong value type assignment for edac_mode
    8ede848bc99e spi: Fix tegra20 build with CONFIG_PM=n
    d193f7dbf4ec net: 6pack: Fix tx timeout and slot time
    fa56f2c987c7 alpha: Declare virt_to_phys and virt_to_bus parameter as pointer to volatile
    af4a142ab798 arm64: Mark __stack_chk_guard as __ro_after_init
    aeb19da46c7d parisc: Use absolute_pointer() to define PAGE0
    8cd34eb616d9 qnx4: avoid stringop-overread errors
    1214ace61402 sparc: avoid stringop-overread errors
    113a8edfb9c9 net: i825xx: Use absolute_pointer for memcpy from fixed memory location
    2397ea2db22b compiler.h: Introduce absolute_pointer macro
    d12ddd843f18 blk-cgroup: fix UAF by grabbing blkcg lock before destroying blkg pd
    9d7798823264 sparc32: page align size in arch_dma_alloc
    ec49f3f7f669 nvme-multipath: fix ANA state updates when a namespace is not present
    29917bbb07c3 xen/balloon: use a kernel thread instead a workqueue
    93937596e065 bpf: Add oversize check before call kvcalloc()
    7273cb182f13 ipv6: delay fib6_sernum increase in fib6_add
    7432ecc55fe9 m68k: Double cast io functions to unsigned long
    29c70b0d335a net: stmmac: allow CSR clock of 300MHz
    1da750d1e214 net: macb: fix use after free on rmmod
    ebb8d26d93c3 blktrace: Fix uaf in blk_trace access after removing by sysfs
    2b5befcd4045 md: fix a lock order reversal in md_alloc
    42d3711c2378 irqchip/gic-v3-its: Fix potential VPE leak on error
    71f323f60592 irqchip/goldfish-pic: Select GENERIC_IRQ_CHIP to fix build
    1b59625da697 scsi: lpfc: Use correct scnprintf() limit
    30d373dc3501 scsi: qla2xxx: Restore initiator in dual mode
    d140ccb140c2 cifs: fix a sign extension bug
    1c1062c5cf21 thermal/core: Potential buffer overflow in thermal_build_list_of_policies()
    b869901caba4 fpga: machxo2-spi: Fix missing error code in machxo2_write_complete()
    0ebc3e688f54 fpga: machxo2-spi: Return an error on failure
    5bcead7cde68 tty: synclink_gt: rename a conflicting function name
    c5f27aedf6bb tty: synclink_gt, drop unneeded forward declarations
    1deb94d37a7e scsi: iscsi: Adjust iface sysfs attr detection
    d0f4a2eeebbe net/mlx4_en: Don't allow aRFS for encapsulated packets
    ae7b957ef003 qed: rdma - don't wait for resources under hw error recovery flow
    23716d7153fc gpio: uniphier: Fix void functions to remove return value
    f7fb7dbdfb25 net/smc: add missing error check in smc_clc_prfx_set()
    363438ed5de0 bnxt_en: Fix TX timeout when TX ring size is set to the smallest
    4c4c3052911b enetc: Fix illegal access when reading affinity_hint
    cf9138c966dd platform/x86/intel: punit_ipc: Drop wrong use of ACPI_PTR()
    a8e8b1481930 afs: Fix incorrect triggering of sillyrename on 3rd-party invalidation
    acce91ba0d9f net: hso: fix muxed tty registration
    494260e20ac2 serial: mvebu-uart: fix driver's tx_empty callback
    2d7c20db7220 xhci: Set HCD flag to defer primary roothub registration
    381c8ce0abc0 btrfs: prevent __btrfs_dump_space_info() to underflow its free space
    d4ec140e7158 erofs: fix up erofs_lookup tracepoint
    7751f609eadf mcb: fix error handling in mcb_alloc_bus()
    406ff5bf727d USB: serial: option: add device id for Foxconn T99W265
    4b2cf0faffce USB: serial: option: remove duplicate USB device ID
    59564b0183cb USB: serial: option: add Telit LN920 compositions
    5cc674a3f18e USB: serial: mos7840: remove duplicated 0xac24 device ID
    20c9fdde30fb usb: core: hcd: Add support for deferring roothub registration
    a6c7d3c2d127 Re-enable UAS for LaCie Rugged USB3-FW with fk quirk
    4dc56951a8d9 staging: greybus: uart: fix tty use after free
    aa2c274c279f binder: make sure fd closes complete
    93fa08e9a32f USB: cdc-acm: fix minor-number release
    0dc1cfa7b907 USB: serial: cp210x: add ID for GW Instek GDM-834x Digital Multimeter
    85d3493085ab usb-storage: Add quirk for ScanLogic SL11R-IDE older than 2.6c
    d4e7647695c9 xen/x86: fix PV trap handling on secondary processors
    8b06b0f17f35 cifs: fix incorrect check for null pointer in header_assemble
    b1f6efa27b24 usb: musb: tusb6010: uninitialized data in tusb_fifo_write_unaligned()
    b8c806065160 usb: dwc2: gadget: Fix ISOC transfer complete handling for DDMA
    ff275c870e1b usb: dwc2: gadget: Fix ISOC flow for BDMA and Slave
    f013a5001b4a usb: gadget: r8a66597: fix a loop in set_feature()
    aa40438c7174 ocfs2: drop acl cache for directories too

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 0a4392400a..506ef6931f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4c265e0d0e3551dec36163b4e87fe1ce90bc3a40"
-SRCREV_meta ?= "6da37dca302efa8696e1164f14194af341c2808d"
+SRCREV_machine ?= "f3196d5b7c9ed7e02530a1e421520e851753c6b7"
+SRCREV_meta ?= "e14d587eec888fba8693da2a072f729219acfb41"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.149"
+LINUX_VERSION ?= "5.4.150"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 3f8ce21024..8165c58266 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.149"
+LINUX_VERSION ?= "5.4.150"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "c0e6ebbecc2eba46d3d26b841519e518b93f8081"
-SRCREV_machine ?= "56ff0be143ef1eff47eb90eac6768e452700c070"
-SRCREV_meta ?= "6da37dca302efa8696e1164f14194af341c2808d"
+SRCREV_machine_qemuarm ?= "16773ce7bb039749a7ec8228128e184d9de4ccf6"
+SRCREV_machine ?= "cf292e8551f71965ea892fbb8bf1d1faecfaccb4"
+SRCREV_meta ?= "e14d587eec888fba8693da2a072f729219acfb41"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 92051b38f6..fecf7c2b02 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "02d9640a2cf032508b87ea5e8b021112e8327352"
-SRCREV_machine_qemuarm64 ?= "fb8d74b308e3ed71ee8a83794dfe13dff0f612bf"
-SRCREV_machine_qemumips ?= "42e53ea6e3bdb0dd3efeca6cb09310bce0d817d0"
-SRCREV_machine_qemuppc ?= "0aa4502926c02102c63f5a425dd31219eecf22b1"
-SRCREV_machine_qemuriscv64 ?= "328c6fa2267540825e756abd9d7eea8d55d6d3aa"
-SRCREV_machine_qemux86 ?= "328c6fa2267540825e756abd9d7eea8d55d6d3aa"
-SRCREV_machine_qemux86-64 ?= "328c6fa2267540825e756abd9d7eea8d55d6d3aa"
-SRCREV_machine_qemumips64 ?= "78bc22d494fdcbb71ecda4cb722a74feea923eb6"
-SRCREV_machine ?= "328c6fa2267540825e756abd9d7eea8d55d6d3aa"
-SRCREV_meta ?= "6da37dca302efa8696e1164f14194af341c2808d"
+SRCREV_machine_qemuarm ?= "c1b3bf44c81e3c46ad58289bb2448864367163ac"
+SRCREV_machine_qemuarm64 ?= "25136e7cd245182ff8287426c459e5b7b1c0939b"
+SRCREV_machine_qemumips ?= "2d5c012de1588897338ef93e259fe5266876018d"
+SRCREV_machine_qemuppc ?= "9c41d8b3be3976d1b752b29bfdfb01013ef72783"
+SRCREV_machine_qemuriscv64 ?= "6e15bad091dbe72ae0ec9cf65a1110afb5e45a5e"
+SRCREV_machine_qemux86 ?= "6e15bad091dbe72ae0ec9cf65a1110afb5e45a5e"
+SRCREV_machine_qemux86-64 ?= "6e15bad091dbe72ae0ec9cf65a1110afb5e45a5e"
+SRCREV_machine_qemumips64 ?= "18bfd88fbfbc9de8a2ae219fabd724d633459ab8"
+SRCREV_machine ?= "6e15bad091dbe72ae0ec9cf65a1110afb5e45a5e"
+SRCREV_meta ?= "e14d587eec888fba8693da2a072f729219acfb41"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.149"
+LINUX_VERSION ?= "5.4.150"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


