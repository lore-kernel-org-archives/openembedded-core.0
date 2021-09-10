Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web08.9694.1631282885319366685
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 07:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nycOTs/i;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id y144so2035053qkb.6
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 07:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lDCPjeMg0ksDMa7Vrk2QXQXhm6Q/9E503SCOw7FaSm4=;
        b=nycOTs/iRKezTALouXEkIC1U+Xc80lPedSuHci/+sW2ObczmmwtxGh96X4W8ZTfiIP
         2oADWIkoDyD7TiR94qKwfgDSs2HPFRuz8PvGk74n37YgdsPLCi1AsiFpqQ5LQ9lvXRF5
         QwYwSosTDGpSk3lz5WeXlURMtx5czLS65wS3QgLJGBUpHGiE3s8qsqGIKp2JuGolg+5R
         vCRvViBDd6R1he1+NaNZx9tFoISUSo6FlvtcM0xXEc3Uub1BJ/hYuYSf8KGcE3ld1WFY
         KTPFTaN8L+4cSo2P5PBi4MQtjP4EiQg1R/WvvlyAmpB/xLHiOUR6idBQ+zvYUdffGmJp
         Pxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lDCPjeMg0ksDMa7Vrk2QXQXhm6Q/9E503SCOw7FaSm4=;
        b=ALtSuCS4vPiTNYm/p67q/QjJnZ/o2TceRPLkwWovdhd1rkhx28IXgmF5j0fVx/ypfF
         4Hk+Hn41xO3juuwAyFyf3N3ThDWG7GDiAiQLJyhsqQ7NxMy1Kv+AzblETURHRRA2angO
         1Ibke3n15DItyFouuRR/ucjvKvtgY5aiFWvh0XECCVsjyZ9TGucWZla8BU7IAk6jQNKx
         MVqqjqUISFE+rpLqqStzWN18C+5pW+A+yOHbubTYlihBpK+e2ohq5fn+wwV8NaTBg1sj
         vck7pjP9Dh8WlZBWnKlXJY5KqocZ09gvyfbQix4lr29KiCypTsYlV4NlleADZiXqPEc8
         iF0Q==
X-Gm-Message-State: AOAM530pXtckgNb5cirWFq3AYYS4EOE3Z4zbBx3EolxdQO/n6jJw4rfM
	GpgXCxEOyn2lDJ0f1NOXrfRk6fPqkzG8jA==
X-Google-Smtp-Source: ABdhPJzmCzyXB137uPVItE4+ZcWraSfkekTIfso01F8wR5Pot3PcPeZPbZ5oIu7P3vWZc54vi88eyA==
X-Received: by 2002:ae9:f701:: with SMTP id s1mr7925602qkg.223.1631282884287;
        Fri, 10 Sep 2021 07:08:04 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id i16sm3128240qtq.52.2021.09.10.07.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 07:08:03 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/5.10: update to v5.10.63
Date: Fri, 10 Sep 2021 10:07:58 -0400
Message-Id: <1a02d6c19fc4fd6e42415851776674f97edf4afa.1631282594.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1631282594.git.bruce.ashfield@gmail.com>
References: <cover.1631282594.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    e07f317d5a28 Linux 5.10.63
    4405ea221dea media: stkwebcam: fix memory leak in stk_camera_probe
    ad5e13f15db7 fuse: fix illegal access to inode with reused nodeid
    40ba433a85db new helper: inode_wrong_type()
    ded9137fcf0d spi: Switch to signed types for *_native_cs SPI controller fields
    55bb5193cec5 serial: 8250: 8250_omap: Fix possible array out of bounds access
    8e41134a92a5 ALSA: pcm: fix divide error in snd_pcm_lib_ioctl
    4ffde17862b0 ALSA: hda/realtek: Workaround for conflicting SSID on ASUS ROG Strix G17
    4ee2686b3745 ALSA: hda/realtek: Quirk for HP Spectre x360 14 amp setup
    2808d59fb29b cryptoloop: add a deprecation warning
    61a038f80c80 perf/x86/amd/power: Assign pmu.module
    ec9a82e034f6 perf/x86/amd/ibs: Work around erratum #1197
    23c29490b84d ceph: fix possible null-pointer dereference in ceph_mdsmap_decode()
    d2064a1444d6 perf/x86/intel/pt: Fix mask of num_address_ranges
    0e74bba60452 qede: Fix memset corruption
    35f223cb21b1 net: macb: Add a NULL check on desc_ptp
    cf50d02e474b qed: Fix the VF msix vectors flow
    2177c4943e40 reset: reset-zynqmp: Fixed the argument data type
    9872349b088d gpu: ipu-v3: Fix i.MX IPU-v3 offset calculations for (semi)planar U/V formats
    b983d60292a6 ARM: OMAP1: ams-delta: remove unused function ams_delta_camera_power
    bc860c3f0945 xtensa: fix kconfig unmet dependency warning for HAVE_FUTEX_CMPXCHG
    b1075d2a7052 static_call: Fix unused variable warn w/o MODULE
    ae16b7c66837 Revert "Add a reference to ucounts for each cred"
    1aa3f27e592d Revert "cred: add missing return error code when set_cred_ucounts() failed"
    0c1443874e1c Revert "ucounts: Increase ucounts reference counter before the security hook"
    0479b2bd2959 ubifs: report correct st_size for encrypted symlinks
    3ac01789f6d9 f2fs: report correct st_size for encrypted symlinks
    894a02236d0d ext4: report correct st_size for encrypted symlinks
    b8c298cf57dc fscrypt: add fscrypt_symlink_getattr() for computing st_size
    09a379549620 ext4: fix race writing to an inline_data file while its xattrs are changing
    f6dd002450bf Linux 5.10.62
    0c9a876f2897 bpf: Fix potentially incorrect results with bpf_get_local_storage()
    38c1915d3e9f audit: move put_tree() to avoid trim_trees refcount underflow and UAF
    1890ee7ff87f net: don't unconditionally copy_from_user a struct ifreq for socket ioctls
    0085646e02b2 Revert "parisc: Add assembly implementations for memset, strlen, strcpy, strncpy and strcat"
    17982c664f8b Revert "floppy: reintroduce O_NDELAY fix"
    709c162ddc83 kthread: Fix PF_KTHREAD vs to_kthread() race
    c43add24dffd btrfs: fix NULL pointer dereference when deleting device by invalid id
    1604c42a1ca9 arm64: dts: qcom: msm8994-angler: Fix gpio-reserved-ranges 85-88
    f760c1101f52 lkdtm: Enable DOUBLE_FAULT on all architectures
    b6c657abb893 net: dsa: mt7530: fix VLAN traffic leaks again
    f8242f554c82 usb: typec: ucsi: Clear pending after acking connector change
    e15e32d519fa usb: typec: ucsi: Work around PPM losing change information
    08953884aad4 usb: typec: ucsi: acpi: Always decode connector change information
    9a4f1dc8a17c tracepoint: Use rcu get state and cond sync for static call updates
    b6ae3854075e srcu: Provide polling interfaces for Tiny SRCU grace periods
    450948b06ce8 srcu: Make Tiny SRCU use multi-bit grace-period counter
    641e1d88404a srcu: Provide internal interface to start a Tiny SRCU grace period
    f789de3be808 srcu: Provide polling interfaces for Tree SRCU grace periods
    fdf66e5a7fc8 srcu: Provide internal interface to start a Tree SRCU grace period
    d3c38d8549c0 powerpc/perf: Invoke per-CPU variable access with disabled interrupts
    77b77d45a4b1 perf annotate: Fix jump parsing for C++ code.
    9f9e40ddfca3 perf tools: Fix arm64 build error with gcc-11
    94687c49b65b perf record: Fix memory leak in vDSO found using ASAN
    e0ca67030fda perf symbol-elf: Fix memory leak by freeing sdt_note.args
    0d8e39bb9416 perf env: Fix memory leak of bpf_prog_info_linear member
    133d7f93eecd riscv: Fixup patch_text panic in ftrace
    7e2087249e87 riscv: Fixup wrong ftrace remove cflag
    b42fde92cdde Bluetooth: btusb: check conditions before enabling USB ALT 3 for WBS
    60d69cb4e60d vt_kdsetmode: extend console locking
    0a178a015161 tipc: call tipc_wait_for_connect only when dlen is not 0
    ded6da217ced mtd: spinand: Fix incorrect parameters for on-die ECC
    3b2018f9c9c0 pipe: do FASYNC notifications for every pipe IO, not just state changes
    e91da23c1be1 pipe: avoid unnecessary EPOLLET wakeups under normal loads
    d845f89d59fc btrfs: fix race between marking inode needs to be logged and log syncing
    6f38d95f33be net/rds: dma_map_sg is entitled to merge entries
    b882dda2bf7a drm/nouveau/kms/nv50: workaround EFI GOP window channel format differences
    7f422cda03a6 drm/nouveau/disp: power down unused DP links during init
    6fd6e20520cc drm: Copy drm_wait_vblank to user before returning
    26ee94ba343c blk-mq: don't grab rq's refcount in blk_mq_check_expired()
    b00ca567579a drm/amd/pm: change the workload type for some cards
    3c37ec435022 Revert "drm/amd/pm: fix workload mismatch on vega10"
    cc126b400b25 qed: Fix null-pointer dereference in qed_rdma_create_qp()
    18a65ba06903 qed: qed ll2 race condition fixes
    4ac9c81e8a54 tools/virtio: fix build
    c7ee4d22614e vringh: Use wiov->used to check for read/write desc order
    6c074eaaf785 virtio_vdpa: reject invalid vq indices
    0698278e8eef virtio_pci: Support surprise removal of virtio pci device
    065a13c299b4 virtio: Improve vq->broken access to avoid any compiler optimization
    f41c7462d8ae cpufreq: blocklist Qualcomm sm8150 in cpufreq-dt-platdev
    3dea93159038 opp: remove WARN when no valid OPPs remain
    be37f7dbcd2c iwlwifi: pnvm: accept multiple HW-type TLVs
    9a6a5602c217 clk: renesas: rcar-usb2-clock-sel: Fix kernel NULL pointer dereference
    bdc5049c3698 perf/x86/intel/uncore: Fix integer overflow on 23 bit left shift of a u32
    c5600b914690 dt-bindings: sifive-l2-cache: Fix 'select' matching
    ad5329a53327 usb: gadget: u_audio: fix race condition on endpoint stop
    257ea8a5edc0 drm/i915: Fix syncmap memory leak
    e49b8d9c5e88 net: stmmac: fix kernel panic due to NULL pointer dereference of plat->est
    b2091d47a14e net: stmmac: add mutex lock to protect est parameters
    ac874290e75c Revert "mmc: sdhci-iproc: Set SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN on BCM2711"
    411680a07cc6 net: hns3: fix get wrong pfc_en when query PFC configuration
    e834ca7c7924 net: hns3: fix duplicate node in VLAN list
    5931ec35e992 net: hns3: add waiting time before cmdq memory is released
    9820af16a879 net: hns3: clear hardware resource when loading driver
    ad0db8385575 rtnetlink: Return correct error on changing device netns
    51bc5c66606d cxgb4: dont touch blocked freelist bitmap after free
    beefd5f0c63a ipv4: use siphash instead of Jenkins in fnhe_hashfun()
    dced8347a727 ipv6: use siphash in rt6_exception_hash()
    f517335a61ff net/sched: ets: fix crash when flipping from 'strict' to 'quantum'
    b493af3a66e0 ucounts: Increase ucounts reference counter before the security hook
    8e0881f6f57e net: marvell: fix MVNETA_TX_IN_PRGRS bit number
    850401a23a85 xgene-v2: Fix a resource leak in the error handling path of 'xge_probe()'
    fb45459d9ddb ip_gre: add validation for csum_start
    e78006b59a30 RDMA/efa: Free IRQ vectors on error flow
    8f1e3ad94569 e1000e: Do not take care about recovery NVM checksum
    87285ac51ecf e1000e: Fix the max snoop/no-snoop latency for 10M
    58b3dbf10c01 igc: Use num_tx_queues when iterating over tx_ring queue
    ae6480ba0665 igc: fix page fault when thunderbolt is unplugged
    384dea502e91 net: usb: pegasus: fixes of set_register(s) return value evaluation;
    3217c9d4602f ice: do not abort devlink info if board identifier can't be found
    3a2c5fbb1cc6 RDMA/bnxt_re: Remove unpaired rtnl unlock in bnxt_re_dev_init()
    56ac7463a140 IB/hfi1: Fix possible null-pointer dereference in _extend_sdma_tx_descs()
    3e949aaa8bef RDMA/bnxt_re: Add missing spin lock initialization
    22c18102ec59 scsi: core: Fix hang of freezing queue between blocking and running device
    01da7c1dc4cf usb: dwc3: gadget: Stop EP0 transfers during pullup disable
    87b2016493eb usb: dwc3: gadget: Fix dwc3_calc_trbs_left()
    56c92b8ddc0c usb: renesas-xhci: Prefer firmware loading on unknown ROM state
    b0bcc8038868 USB: serial: option: add new VID/PID to support Fibocom FG150
    8437e07c370f Revert "USB: serial: ch341: fix character loss at high transfer rates"
    da3067eadcc1 drm/amdgpu: Cancel delayed work when GFXOFF is disabled
    3134292a8e79 Revert "btrfs: compression: don't try to compress if we don't have enough pages"
    921c2533aa3a riscv: Ensure the value of FP registers in the core dump file is up to date
    e55a8b461585 ceph: correctly handle releasing an embedded cap flush
    7008b9981b6a can: usb: esd_usb2: esd_usb2_rx_event(): fix the interchange of the CAN RX and TX error counters
    45b7b2097153 net: mscc: Fix non-GPL export of regmap APIs
    ef2d68ef9a3b ovl: fix uninitialized pointer read in ovl_lookup_real_one()
    c94d50979f20 blk-iocost: fix lockdep warning on blkcg->lock
    6815e21fe28d once: Fix panic when module unload
    f68ad168e235 netfilter: conntrack: collect all entries in one cycle
    a13a2df0b149 ARC: Fix CONFIG_STACKDEPOT
    0af6a9f82ca3 ASoC: component: Remove misplaced prefix handling in pin control functions
    34cc80ec12d6 ASoC: rt5682: Adjust headset volume button threshold
    d81ddadabdee bpf: Fix NULL pointer dereference in bpf_get_local_storage() helper
    9dd6f6d89693 bpf: Fix ringbuf helper function compatibility
    ad41706c771a net: qrtr: fix another OOB Read in qrtr_endpoint_post

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index c53c6f74c8..097dd7b5f9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6cd3b8cc48adcec0f91a2f95d12679a8ceb3d77d"
+SRCREV_machine ?= "31e2870ebfd892708e8c5f3aced96565e2456ed9"
 SRCREV_meta ?= "bce2813b162bb472c137fb503951295a931c25b6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.61"
+LINUX_VERSION ?= "5.10.63"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index c142c9c996..0693a57613 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.61"
+LINUX_VERSION ?= "5.10.63"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "b359e868f08a317762618a0c8240769ede6205ee"
-SRCREV_machine ?= "458347294271cddba33b7cfefabf83181eba3440"
+SRCREV_machine:qemuarm ?= "96ec3026283d29493f757a077f9c51e6d698c634"
+SRCREV_machine ?= "29ff88e6cdf170fbf71e27de32c09e4f6db95078"
 SRCREV_meta ?= "bce2813b162bb472c137fb503951295a931c25b6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 5276657494..7c163436fb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c21afa1c405a581d0fbec7df31cf7e4d61ceabb9"
-SRCREV_machine:qemuarm64 ?= "749a8e1ffe820d07371d35850e31201d8583b08a"
-SRCREV_machine:qemumips ?= "8feace594d68ec0c4cde54be4b6ed312bef6def2"
-SRCREV_machine:qemuppc ?= "25cc0f5de71a992745898b9da9f109f30adacc18"
-SRCREV_machine:qemuriscv64 ?= "815f74d88d7be5ca75dc8b98479d4d8e2736dcd7"
-SRCREV_machine:qemuriscv32 ?= "815f74d88d7be5ca75dc8b98479d4d8e2736dcd7"
-SRCREV_machine:qemux86 ?= "815f74d88d7be5ca75dc8b98479d4d8e2736dcd7"
-SRCREV_machine:qemux86-64 ?= "815f74d88d7be5ca75dc8b98479d4d8e2736dcd7"
-SRCREV_machine:qemumips64 ?= "82f98a83c19c2a3e1d9b4b53a2117e84a37bb88d"
-SRCREV_machine ?= "815f74d88d7be5ca75dc8b98479d4d8e2736dcd7"
+SRCREV_machine:qemuarm ?= "36e0cc294f77cf72b01a1f9ea62bb13d1ab0693e"
+SRCREV_machine:qemuarm64 ?= "a1c9c936088b6cf4ec56f5180672d6f0e8e3b955"
+SRCREV_machine:qemumips ?= "4962920baaee3235448b48e992a3da0259dcfa57"
+SRCREV_machine:qemuppc ?= "57b30ad7f8a6c3be0ad8eac742476da3f97c23f3"
+SRCREV_machine:qemuriscv64 ?= "164ed895bc1e94722e80fe6496b176f6bb815cd4"
+SRCREV_machine:qemuriscv32 ?= "164ed895bc1e94722e80fe6496b176f6bb815cd4"
+SRCREV_machine:qemux86 ?= "164ed895bc1e94722e80fe6496b176f6bb815cd4"
+SRCREV_machine:qemux86-64 ?= "164ed895bc1e94722e80fe6496b176f6bb815cd4"
+SRCREV_machine:qemumips64 ?= "a615aa60bc10bea5262f2d65da7ddff4ba32146e"
+SRCREV_machine ?= "164ed895bc1e94722e80fe6496b176f6bb815cd4"
 SRCREV_meta ?= "bce2813b162bb472c137fb503951295a931c25b6"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.61"
+LINUX_VERSION ?= "5.10.63"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

