Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB81C001B3
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 23:19:40 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.25992.1687475977214410869
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 16:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=bIB2jMs/;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7624679c9c4so558400385a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 16:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687475976; x=1690067976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7aho4iR52CowJ9iQ7E/bMfmGMY1HOdyYKyUahrqsGQ=;
        b=bIB2jMs/ifXdoM6OHbSpLFEEnJHsorGz4IgbPL1I+YrEm6FhcW7E6atrmk3nhzEIt9
         x68TnBhWNHBlzSNGka1CI+BrcMjxdyfX/5gLM0K2VuBfW2k03Qs/sNpw47l1raf62x1m
         F8f9g+AtvMSf0Ncy48+TbRYuUuGy1/bQEwv6l8Ws+5cXcaVirxUgJEiZA0Nf49fEe6Bt
         p39HWmxGQDjGm3r7fjeGmL5IZxMSxnGcZEk11vO2HrFxxyoE5/cCX0mLCCpF/Pd1E6hQ
         L7nT0xXN9bUYnmNpHcM+H1fcMXiyPtyfNCF2ba6ehF6gQfktJhdKtI9W81xmDV66rsm4
         lmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687475976; x=1690067976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7aho4iR52CowJ9iQ7E/bMfmGMY1HOdyYKyUahrqsGQ=;
        b=VDhrpMDqDPZy90HHumeW8+XKllIP3d3aMv/AndEm36yiIksRoYM5oE9sj0BgvN/NGN
         u+iCJCxLy+Ino1fhaQ4tUEvZb6vq8eFciol+Sku49myrNqljld+OdincqzOssFEMxsXP
         IkqCtJEcwIcgZjfnTXxnUDu+YpoR09A9aqv00VJQDJJZfEWB91ESZiNLzoCugB8WJ/xW
         pcwxFe5qQBiQk0bxsjd+zEwFoPXnzql3dd+Y2hsNqHo/JAiVag8b3EKAtxopB7bQDvc1
         29BIE3gRzroVGZIVLg5ta6nawkm/0Bi+e2XX1Vb9aHKNVkOqktxjsjzg0hTG3xG0A5el
         77bw==
X-Gm-Message-State: AC+VfDxXxeWJAMU+htWBzntl16wFQYTMQyUbTUzAnqyDWGRTaI71Yy76
	oS/y12t74ZWIEM76csol3N2rjxizcbrhHw==
X-Google-Smtp-Source: ACHHUZ6/Jmpk5nR4pa9V4eeG6nWHKd4qoOS/Gyp07ylewgyvGBMhjc9MVHZi8nh5L9CqvWv2FcFKhg==
X-Received: by 2002:a05:6214:2346:b0:62f:f13e:bd73 with SMTP id hu6-20020a056214234600b0062ff13ebd73mr27492239qvb.20.1687475976202;
        Thu, 22 Jun 2023 16:19:36 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t2-20020ac86a02000000b003f9c26069aesm4137148qtr.34.2023.06.22.16.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 16:19:35 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/4] linux-yocto/5.10: update to v5.10.185
Date: Thu, 22 Jun 2023 19:19:32 -0400
Message-Id: <20230622231932.928672-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230622231932.928672-1-bruce.ashfield@gmail.com>
References: <20230622231932.928672-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 23:19:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183301

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    ef0d5feb32ab Linux 5.10.185
    ed2bf5cee6c6 um: Fix build w/o CONFIG_PM_SLEEP
    f73ec12dc718 drm/i915/gen11+: Only load DRAM information from pcode
    27458487c8f4 drm/i915/dg1: Wait for pcode/uncore handshake at startup
    2d1c19597d1e media: dvb-core: Fix use-after-free due to race at dvb_register_device()
    5c61c3945adf media: dvbdev: fix error logic at dvb_register_device()
    a1b26dac8bc6 media: dvbdev: Fix memleak in dvb_register_device
    a13dee47fa2a nilfs2: reject devices with insufficient block count
    c374552b54d6 mm/memory_hotplug: extend offline_and_remove_memory() to handle more than one memory block
    e6dc6a9d0a76 mmc: block: ensure error propagation for non-blk
    7ce0e8b28720 batman-adv: Switch to kstrtox.h for kstrtou64
    e6104284c42f neighbour: delete neigh_lookup_nodev as not used
    bf82668eb950 net: Remove DECnet leftovers from flow.h.
    7d07fd03f50c net: Remove unused inline function dst_hold_and_use()
    53076071fb92 neighbour: Remove unused inline function neigh_key_eq16()
    7230a9e599d3 rcu/kvfree: Avoid freeing new kfree_rcu() memory after old grace period
    a26158962176 cgroup: always put cset in cgroup_css_set_put_fork
    4c1084386332 afs: Fix vlserver probe RTT handling
    49b6607dedc2 selftests/ptp: Fix timestamp printf format for PTP_SYS_OFFSET
    08899e8d5a99 net: tipc: resize nlattr array to correct size
    5fd696b404fb net: lapbether: only support ethernet devices
    6ee3728ae87e net/sched: cls_api: Fix lockup on flushing explicitly created chain
    efed5b50f3b8 ext4: drop the call to ext4_error() from ext4_get_group_info()
    6ab91d1adb5a drm/nouveau: add nv_encoder pointer check for NULL
    5d43bb9b3e0c drm/nouveau/dp: check for NULL nv_connector->native_mode
    edb970e03d65 drm/nouveau: don't detect DSM for non-NVIDIA device
    8c3446ab5902 igb: fix nvm.ops.read() error handling
    221281d60c46 sctp: fix an error code in sctp_sf_eat_auth()
    5c47ed7f25d6 ipvlan: fix bound dev checking for IPv6 l3s mode
    3c97f2c9ec29 IB/isert: Fix incorrect release of isert connection
    da6ae4aab5a6 IB/isert: Fix possible list corruption in CMA handler
    2b6f8817ca66 IB/isert: Fix dead lock in ib_isert
    2f9d26345c6e IB/uverbs: Fix to consider event queue closing also upon non-blocking mode
    6cccdbc9f09c RDMA/cma: Always set static rate to 0 for RoCE
    f49abbb27416 RDMA/mlx5: Initiate dropless RQ for RAW Ethernet functions
    aa277d5cd4b2 octeontx2-af: fixed resource availability check
    0fb48a2a6ad4 iavf: remove mask from iavf_irq_enable_queues()
    079a9591ee18 RDMA/rxe: Fix the use-before-initialization error of resp_pkts
    089a0e831f68 RDMA/rxe: Removed unused name from rxe_task struct
    6205c0d9ff8b RDMA/rxe: Remove the unused variable obj
    af6eaa57986e net/sched: cls_u32: Fix reference counter leak leading to overflow
    5852d17aaa8b ping6: Fix send to link-local addresses with VRF.
    9e666a77f008 net: enetc: correct the indexes of highest and 2nd highest TCs
    1200af82cf0b netfilter: nfnetlink: skip error delivery on batch in case of ENOMEM
    af42c4fd827c spi: fsl-dspi: avoid SCK glitches with continuous transfers
    cb6ec51ddd00 RDMA/rtrs: Fix the last iu->buf leak in err path
    26293251ab64 usb: dwc3: gadget: Reset num TRBs before giving back the request
    f4bc41694289 serial: lantiq: add missing interrupt ack
    0b6e65016c3c USB: serial: option: add Quectel EM061KGL series
    1c004b379b03 Remove DECnet support from kernel
    e9d384983fa9 ALSA: hda/realtek: Add a quirk for Compaq N14JP6
    1148d4ca3029 net: usb: qmi_wwan: add support for Compal RXM-G1
    d7acfd522560 RDMA/uverbs: Restrict usage of privileged QKEYs
    96e14c91c530 nouveau: fix client work fence deletion race
    f1f7117b2236 powerpc/purgatory: remove PGO flags
    26c80741ceb6 x86/purgatory: remove PGO flags
    f368aed4827b kexec: support purgatories with .text.hot sections
    7e78b9142fdf nilfs2: fix possible out-of-bounds segment allocation in resize ioctl
    902fcec05295 nilfs2: fix incomplete buffer cleanup in nilfs_btnode_abort_change_key()
    d59293f082dc nios2: dts: Fix tse_mac "max-frame-size" property
    2847d9eed48b ocfs2: check new file size on fallocate call
    e73b135f540c ocfs2: fix use-after-free when unmounting read-only filesystem
    370f5d98ffe5 epoll: ep_autoremove_wake_function should use list_del_init_careful
    4716c73b1885 io_uring: hold uring mutex around poll removal
    93a68acc497b irqchip/gic: Correctly validate OF quirk descriptors
    2a2641a842ea drm:amd:amdgpu: Fix missing buffer object unlock in failure path
    7c0b17679b43 xen/blkfront: Only check REQ_FUA for writes
    8e45fb70f4b5 ASoC: dwc: move DMA init to snd_soc_dai_driver probe()
    d47b5a6d2331 mips: Move initrd_start check after initrd address sanitisation.
    619672bf2d04 MIPS: Alchemy: fix dbdma2
    0ca73b45b767 parisc: Flush gatt writes and adjust gatt mask in parisc_agp_mask_memory()
    3f7625e08620 parisc: Improve cache flushing for PCXL in arch_sync_dma_for_cpu()
    73102fdb5bf3 ASoC: soc-pcm: test if a BE can be prepared
    3bc883132d03 btrfs: handle memory allocation failure in btrfs_csum_one_bio
    142fbad31405 btrfs: scrub: try harder to mark RAID56 block groups read-only
    35d32d841592 power: supply: Fix logic checking if system is running from battery
    8b7a2207ee40 irqchip/gic-v3: Disable pseudo NMIs on Mediatek devices w/ firmware issues
    dbf610997242 regulator: Fix error checking for debugfs_create_dir
    37bcc48e7dd1 platform/x86: asus-wmi: Ignore WMI events with codes 0x7B, 0xC0
    88d1c1365ff6 power: supply: Ratelimit no data debug output
    6be7a4bef9dc tools: gpio: fix debounce_period_us output of lsgpio
    39eb9eb9ea43 ARM: dts: vexpress: add missing cache properties
    b2856c3cd3b2 power: supply: bq27xxx: Use mod_delayed_work() instead of cancel() + schedule()
    ce2b5f24caad power: supply: sc27xx: Fix external_power_changed race
    9e9e150fa8a6 power: supply: ab8500: Fix external_power_changed race
    539c387f0bb9 test_firmware: fix a memory leak with reqs buffer
    af36f35074b1 test_firmware: prevent race conditions by a correct implementation of locking
    682ca602515d test_firmware: Use kstrtobool() instead of strtobool()
    6e2e551e39fd kernel.h: split out kstrtox() and simple_strtox() to a separate header
    c2def5578b44 lib: cleanup kstrto*() usage

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index af4fede4e9..8e7b0b32a0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2b0a7b0262d2a775fad7d9ca87de32dc88015b74"
-SRCREV_meta ?= "e269c86d186e2727bdceab40e3a71ec45e0252d1"
+SRCREV_machine ?= "46fb028ad9413cfa8d47a6dc8bf9a57d9d5edf8b"
+SRCREV_meta ?= "697cb5ef3aff49be3fa29bf604598ca36ceb5dfd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.184"
+LINUX_VERSION ?= "5.10.185"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index f85fea070b..5c4eb9e990 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.184"
+LINUX_VERSION ?= "5.10.185"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "8cec679b919f74822063e03f38e5a1b5df6248bc"
-SRCREV_machine ?= "962077eea8f30dbc431d66ea7a2cee33659854e2"
-SRCREV_meta ?= "e269c86d186e2727bdceab40e3a71ec45e0252d1"
+SRCREV_machine:qemuarm ?= "6e0299be775387485e22edcd57ac6099c08f4356"
+SRCREV_machine ?= "772cf990473f73ebf34c1a1ef4f06eb3e297c4db"
+SRCREV_meta ?= "697cb5ef3aff49be3fa29bf604598ca36ceb5dfd"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 91ab6ea9b3..6e82782a38 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "85c2e636ff0c1dc431de60f0113b1f5f89967ca4"
-SRCREV_machine:qemuarm64 ?= "4afca6da69d97af944983918087728d5741df052"
-SRCREV_machine:qemumips ?= "483a2f5f0bf0048b3e864b2a6a9cc1399d27bd1e"
-SRCREV_machine:qemuppc ?= "9f99a56eda87f9de191f14668b488b3b24132c7a"
-SRCREV_machine:qemuriscv64 ?= "e715b8acadb88331f3fc8c820e54e4d27b8c67db"
-SRCREV_machine:qemuriscv32 ?= "e715b8acadb88331f3fc8c820e54e4d27b8c67db"
-SRCREV_machine:qemux86 ?= "e715b8acadb88331f3fc8c820e54e4d27b8c67db"
-SRCREV_machine:qemux86-64 ?= "e715b8acadb88331f3fc8c820e54e4d27b8c67db"
-SRCREV_machine:qemumips64 ?= "6bddecdb7271f2cbede46ade8701ce9d0c2bd0f2"
-SRCREV_machine ?= "e715b8acadb88331f3fc8c820e54e4d27b8c67db"
-SRCREV_meta ?= "e269c86d186e2727bdceab40e3a71ec45e0252d1"
+SRCREV_machine:qemuarm ?= "08e7e91e009a1d738962de06f48f9704075d3a56"
+SRCREV_machine:qemuarm64 ?= "f23a4523287d5199b67a135e5d1cf3680fe58a3a"
+SRCREV_machine:qemumips ?= "82bae5b9d4316474df162ca7e5a2dff35c4ede39"
+SRCREV_machine:qemuppc ?= "8b5027212160436c9d466b80e0c385f265acfbdb"
+SRCREV_machine:qemuriscv64 ?= "dafc025b033585311d1693255c80b60b690b0e54"
+SRCREV_machine:qemuriscv32 ?= "dafc025b033585311d1693255c80b60b690b0e54"
+SRCREV_machine:qemux86 ?= "dafc025b033585311d1693255c80b60b690b0e54"
+SRCREV_machine:qemux86-64 ?= "dafc025b033585311d1693255c80b60b690b0e54"
+SRCREV_machine:qemumips64 ?= "ee18c4343db52d5846a0f332cd6df26a6f72dd45"
+SRCREV_machine ?= "dafc025b033585311d1693255c80b60b690b0e54"
+SRCREV_meta ?= "697cb5ef3aff49be3fa29bf604598ca36ceb5dfd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.184"
+LINUX_VERSION ?= "5.10.185"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


