Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web09.9660.1631282883346445773
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 07:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=okcCnDQc;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id p4so2054052qki.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 07:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PzHxtyAXtsJGm5w4Hpdoh5NoJT3ioLpLyZOaIKlKO1w=;
        b=okcCnDQccSY3rs4kWMPjJhTItTpaaqA/1m72rp4gSyWjcy2Vj+C7MAiV2xODai2AXe
         yDGm2heHHE9A1wrP2P+ROVKJbSXdjpHVQb4I28ZaVGOL7rrLkxpJ7Jq8FrAjLVLCH85W
         wGQ7qmCbov4tez97lhnH9OxHfL9qPSK+aTJ6DJqOyonNT3oypHq9VMVjVTgutN2lSR/C
         JKt7MRWdPeB0xXwffJHSYqEumHDkuNp8xJpbdAptF/agVSvwsuC0d+uf8BbtQY9BacSd
         O1eIcV2meTDgnfnziVw6hlyHxBqB3xMI1dHUUNd7Eusah7QsioKZflEod+06dnKNpK+w
         CeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PzHxtyAXtsJGm5w4Hpdoh5NoJT3ioLpLyZOaIKlKO1w=;
        b=D5+aC/D9g+pdjd1rt3FdsYmIvmTt1ZA1wPxbNQwx0zCzy1cA/EFNJnGwaU3PKIO2n0
         I0RFyLmBIZzinJmwm59ccW1gaiTpWZhxqJDlwoHRjMCYRLZ5545MFrlx1T7Dvg6LmDsP
         KVylHPPF4TEMsfm0MNq2cu4f9lED/V6vvxd1GlIteiWe9i1HwuM4EZIjkbFoNNDY318R
         hS02hXL9q9l4HMLlQxloloJqRCZmoTZ3Lsuv826RsEbYRKwe5Vq3S12wnKidudq930F+
         4mC9NqKXoHKBqLt5PZTaCen0+k/JHzFREr8p4evlbA9JYYopyR7yRGUkLqEbSHWokmOV
         kFaA==
X-Gm-Message-State: AOAM530E39pgMEiSpCRJGeRWzVBBQL3GOboIROfOxrAhOGNHjgDIClnR
	Nq/wlWEB5rjjAfO8tWpxHWyhWfdnBFe1qQ==
X-Google-Smtp-Source: ABdhPJxWyFZJVJohEf9Vu8LHUNHk8OD+MQF22MLoKFwchGstwrcMZEPIyIvdgaUH78LIGFsl4rL70Q==
X-Received: by 2002:a37:2754:: with SMTP id n81mr7743198qkn.297.1631282882331;
        Fri, 10 Sep 2021 07:08:02 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id i16sm3128240qtq.52.2021.09.10.07.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 07:08:01 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/5.13: update to v5.13.15
Date: Fri, 10 Sep 2021 10:07:56 -0400
Message-Id: <13e93dc7daa25af8479f6f4f6a70853307c44abb.1631282594.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1631282594.git.bruce.ashfield@gmail.com>
References: <cover.1631282594.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.13 to the latest korg -stable release that comprises
the following commits:

    b8c3cc76091b Linux 5.13.15
    2f939f346edb media: stkwebcam: fix memory leak in stk_camera_probe
    26874d67198b ALSA: pcm: fix divide error in snd_pcm_lib_ioctl
    0c9cca4cbd05 ALSA: hda/realtek: Workaround for conflicting SSID on ASUS ROG Strix G17
    a0bdfbbb6d79 ALSA: usb-audio: Fix regression on Sony WALKMAN NW-A45 DAC
    237d4c2abcf8 ALSA: hda/realtek: Quirk for HP Spectre x360 14 amp setup
    deb48f56a556 USB: serial: cp210x: fix flow-control error handling
    4df3f36f3e43 USB: serial: cp210x: fix control-characters error handling
    7dac6a6ae0ec USB: serial: pl2303: fix GL type detection
    af64ddb6600f xtensa: fix kconfig unmet dependency warning for HAVE_FUTEX_CMPXCHG
    391cfacf8c81 cryptoloop: add a deprecation warning
    39c6cf24c4ff perf/x86/amd/power: Assign pmu.module
    3e3bb99d69a3 perf/x86/amd/ibs: Work around erratum #1197
    c7858c55cb5d ceph: fix possible null-pointer dereference in ceph_mdsmap_decode()
    1ab026cbc7c4 perf/x86/intel/pt: Fix mask of num_address_ranges
    610832256fd2 qede: Fix memset corruption
    8475b024be01 net: macb: Add a NULL check on desc_ptp
    9809b708655a riscv: dts: microchip: Add ethernet0 to the aliases node
    b13e2bf00cc2 riscv: dts: microchip: Use 'local-mac-address' for emac1
    2aad925a0c8e net: dsa: mv88e6xxx: Update mv88e6393x serdes errata
    9bf0c451fc85 qed: Fix the VF msix vectors flow
    eb5392205208 reset: reset-zynqmp: Fixed the argument data type
    241581af858b gpu: ipu-v3: Fix i.MX IPU-v3 offset calculations for (semi)planar U/V formats
    b6de6ec37320 ext4: fix e2fsprogs checksum failure for mounted filesystem
    c764e8fa4491 ext4: fix race writing to an inline_data file while its xattrs are changing
    a603798fb168 Linux 5.13.14
    49da19a85383 platform/x86: Make dual_accel_detect() KIOX010A + KIOX020A detect more robust
    4e25ac3793f7 audit: move put_tree() to avoid trim_trees refcount underflow and UAF
    f8132a4726df net: don't unconditionally copy_from_user a struct ifreq for socket ioctls
    6b58e692a685 Revert "parisc: Add assembly implementations for memset, strlen, strcpy, strncpy and strcat"
    9caa2e5a818d ubifs: report correct st_size for encrypted symlinks
    7532df5ee085 f2fs: report correct st_size for encrypted symlinks
    f04584399d1c ext4: report correct st_size for encrypted symlinks
    2bc40caa8099 fscrypt: add fscrypt_symlink_getattr() for computing st_size
    ba17363729d2 Revert "floppy: reintroduce O_NDELAY fix"
    301aabe0239f btrfs: fix NULL pointer dereference when deleting device by invalid id
    8e2112d600b2 arm64: dts: qcom: msm8994-angler: Fix gpio-reserved-ranges 85-88
    98d1fcc6c937 net: dsa: mt7530: fix VLAN traffic leaks again
    339e8ba1a3d0 Bluetooth: btusb: check conditions before enabling USB ALT 3 for WBS
    a5dfcf3d8ecc vt_kdsetmode: extend console locking
    65f5602cd767 tipc: call tipc_wait_for_connect only when dlen is not 0
    6b7533e796aa pipe: do FASYNC notifications for every pipe IO, not just state changes
    4abb1d77321a pipe: avoid unnecessary EPOLLET wakeups under normal loads
    eec6f991bf28 arm64: initialize all of CNTHCTL_EL2
    c9ecaffe65cb net/rds: dma_map_sg is entitled to merge entries
    66d8d0677e4d platform/x86: gigabyte-wmi: add support for B450M S2H V2
    b484bcabe66b drm/nouveau/kms/nv50: workaround EFI GOP window channel format differences
    045f785ad859 drm/nouveau/disp: power down unused DP links during init
    4dc8c06fd51e drm/nouveau: recognise GA107
    2a0e1f9a62e5 platform/x86: gigabyte-wmi: add support for X570 GAMING X
    7e6c3b5c9864 drm: Copy drm_wait_vblank to user before returning
    65bafad4556d blk-mq: don't grab rq's refcount in blk_mq_check_expired()
    1ae8c1e2dbd7 drm/amd/pm: change the workload type for some cards
    19be3ad020b1 Revert "drm/amd/pm: fix workload mismatch on vega10"
    e5baac733182 qed: Fix null-pointer dereference in qed_rdma_create_qp()
    b6d485eb00e1 qed: qed ll2 race condition fixes
    e415d2209567 platform/x86: asus-nb-wmi: Add tablet_mode_sw=lid-flip quirk for the TP200s
    aa4ad193d83b platform/x86: asus-nb-wmi: Allow configuring SW_TABLET_MODE method with a module option
    0eeee5f085e6 tools/virtio: fix build
    2aef43ab6de1 vringh: Use wiov->used to check for read/write desc order
    839815ea5f1d virtio_vdpa: reject invalid vq indices
    2f18a3c91fde virtio_pci: Support surprise removal of virtio pci device
    6c4072f94fab virtio: Improve vq->broken access to avoid any compiler optimization
    25d4ff7e59aa cpufreq: blocklist Qualcomm sm8150 in cpufreq-dt-platdev
    ef3738a60d18 opp: remove WARN when no valid OPPs remain
    184caa4f8b83 iwlwifi: add new so-jf devices
    eed3c6bb51fe iwlwifi: add new SoF with JF devices
    0dabf99c08de iwlwifi: pnvm: accept multiple HW-type TLVs
    2fcb7f101fa2 clk: renesas: rcar-usb2-clock-sel: Fix kernel NULL pointer dereference
    0298f03cf8ee sched: Fix get_push_task() vs migrate_disable()
    886364f99b7c perf/x86/intel/uncore: Fix integer overflow on 23 bit left shift of a u32
    6e6822e47ee3 usb: gadget: u_audio: fix race condition on endpoint stop
    0b3d2bfa7906 net: stmmac: fix kernel panic due to NULL pointer dereference of plat->est
    5ce4cc16d471 net: stmmac: add mutex lock to protect est parameters
    01e5bad5b6b8 Revert "mmc: sdhci-iproc: Set SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN on BCM2711"
    fd8b3da89096 media: ipu3-cio2: Drop reference on error path in cio2_bridge_connect_sensor()
    229db408796c net: hns3: fix get wrong pfc_en when query PFC configuration
    6434d7a17272 net: hns3: fix duplicate node in VLAN list
    5d73c3788d73 net: hns3: fix speed unknown issue in bond 4
    728d196fe469 net: hns3: add waiting time before cmdq memory is released
    13c1896f8ace net: hns3: clear hardware resource when loading driver
    6e472c800e5c rtnetlink: Return correct error on changing device netns
    8f4e74663b41 net: dsa: hellcreek: Adjust schedule look ahead window
    35844a1bde10 net: dsa: hellcreek: Fix incorrect setting of GCL
    7d1b598f92d7 cxgb4: dont touch blocked freelist bitmap after free
    fc21a98484ca ipv4: use siphash instead of Jenkins in fnhe_hashfun()
    b3f99fcc204b ipv6: use siphash in rt6_exception_hash()
    1a72ef276754 SUNRPC: Fix XPT_BUSY flag leakage in svc_handle_xprt()...
    d05330672afe net/sched: ets: fix crash when flipping from 'strict' to 'quantum'
    6faa3f1424f1 ucounts: Increase ucounts reference counter before the security hook
    768d4cf8dbaf net: marvell: fix MVNETA_TX_IN_PRGRS bit number
    a73e59683548 xgene-v2: Fix a resource leak in the error handling path of 'xge_probe()'
    01951aeafc40 ip_gre: add validation for csum_start
    4c00ae66159a RDMA/efa: Free IRQ vectors on error flow
    50092de6d9e4 e1000e: Do not take care about recovery NVM checksum
    7878e0fe833d e1000e: Fix the max snoop/no-snoop latency for 10M
    e46212393a30 igc: Use num_tx_queues when iterating over tx_ring queue
    7bc8e807665b igc: fix page fault when thunderbolt is unplugged
    89362210ac19 net: usb: pegasus: fixes of set_register(s) return value evaluation;
    2b0267118a68 ice: do not abort devlink info if board identifier can't be found
    a35de1e71b68 RDMA/rxe: Fix memory allocation while in a spin lock
    9413a11e77eb RDMA/bnxt_re: Remove unpaired rtnl unlock in bnxt_re_dev_init()
    7cfd5894226b IB/hfi1: Fix possible null-pointer dereference in _extend_sdma_tx_descs()
    4fdd674a31f2 RDMA/bnxt_re: Add missing spin lock initialization
    30067a9a1617 RDMA/uverbs: Track dmabuf memory regions
    6a4dd0859f4f RDMA/mlx5: Fix crash when unbind multiport slave
    db030881c465 scsi: core: Fix hang of freezing queue between blocking and running device
    3e07893f0f82 usb: dwc3: gadget: Stop EP0 transfers during pullup disable
    6b8951c842cd usb: dwc3: gadget: Fix dwc3_calc_trbs_left()
    24bcaabc7be2 usb: typec: tcpm: Raise vdm_sm_running flag only when VDM SM is running
    6a59c0559d74 usb: renesas-xhci: Prefer firmware loading on unknown ROM state
    155c3c86abdb USB: serial: option: add new VID/PID to support Fibocom FG150
    2159dc1c023d Revert "USB: serial: ch341: fix character loss at high transfer rates"
    05366fb0bfd1 drm/amdgpu: Fix build with missing pm_suspend_target_state module export
    164f7029a8ca drm/amdgpu: use the preferred pin domain after the check
    49db1b658914 drm/amdgpu: Cancel delayed work when GFXOFF is disabled
    05c07e76a37c drm/i915/dp: Drop redundant debug print
    65e526efa215 drm/i915: Fix syncmap memory leak
    b9d0c15e74cd net: stmmac: fix kernel panic due to NULL pointer dereference of buf->xdp
    d4a399b96e0b net: stmmac: fix kernel panic due to NULL pointer dereference of xsk_pool
    efc5eb94e7b3 Revert "btrfs: compression: don't try to compress if we don't have enough pages"
    dbce1780abeb mm/memory_hotplug: fix potential permanent lru cache disable
    0d1cf894cc24 powerpc: Re-enable ARCH_ENABLE_SPLIT_PMD_PTLOCK
    9e04475feb82 riscv: Ensure the value of FP registers in the core dump file is up to date
    31296d4fdbff dt-bindings: sifive-l2-cache: Fix 'select' matching
    904d52e1beda ceph: correctly handle releasing an embedded cap flush
    dbbf1899c6ff can: usb: esd_usb2: esd_usb2_rx_event(): fix the interchange of the CAN RX and TX error counters
    1579b0f1e7bd net: mscc: Fix non-GPL export of regmap APIs
    60c1ed05cba1 ovl: fix uninitialized pointer read in ovl_lookup_real_one()
    2514e486faf7 blk-iocost: fix lockdep warning on blkcg->lock
    de14d2fc6a62 io_uring: rsrc ref lock needs to be IRQ safe
    b8eaf1e595fe once: Fix panic when module unload
    7aa03980b21f netfilter: conntrack: collect all entries in one cycle
    e0f824abe0f4 netfilter: ipset: Limit the maximal range of consecutive elements to add/delete
    3ac582bc72d7 ARC: Fix CONFIG_STACKDEPOT
    9810910bc686 platform/x86: Add and use a dual_accel_detect() helper
    dbd38b275b86 ASoC: component: Remove misplaced prefix handling in pin control functions
    6f2ec29dfd5e ASoC: rt5682: Adjust headset volume button threshold
    a31b3b8d3cbf bpf: Fix ringbuf helper function compatibility
    d6060df9b53a net: qrtr: fix another OOB Read in qrtr_endpoint_post

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.13.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.13.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 24 +++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
index 02c9c41eb1..0b534c3fbc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5bf65aebc58699c42d96c1b70ce51e2568222f7b"
+SRCREV_machine ?= "eaf308f87d26c526da01d90bfb3581e2f40e32e7"
 SRCREV_meta ?= "c38435a3cacf424fa686ecac9a95ef8349b83bb3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.13.13"
+LINUX_VERSION ?= "5.13.15"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
index bd30c487f9..5b71d75aef 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.13.13"
+LINUX_VERSION ?= "5.13.15"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "bb0d6a8b8094712620955b574757d3286add7696"
-SRCREV_machine ?= "2f126a0a69284d24a8d367abe6985cd525596a6b"
+SRCREV_machine:qemuarm ?= "94f45ad50950df80adbf1a8e1bbc110abff5bbc4"
+SRCREV_machine ?= "3bd6397a9acc2cd13228c09097d61c8d1aa3bbdf"
 SRCREV_meta ?= "c38435a3cacf424fa686ecac9a95ef8349b83bb3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
index 0cdc51b6c5..a17bddf0f4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.13/standard/base"
 KBRANCH:qemux86-64 ?= "v5.13/standard/base"
 KBRANCH:qemumips64 ?= "v5.13/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "1ba4dc7805cc92639acabfb0151f43c0b076c982"
-SRCREV_machine:qemuarm64 ?= "370a8e98fbc5ec6da6630edd765a900baf61d0d9"
-SRCREV_machine:qemumips ?= "76ac48cc6e9f3320d7358e979389584bfc513bd1"
-SRCREV_machine:qemuppc ?= "8fc360f43d203e3577416b4ca48d8dfe7f1f85b8"
-SRCREV_machine:qemuriscv64 ?= "4f742215802dad4a6457e2ef2cad96ef037d666c"
-SRCREV_machine:qemuriscv32 ?= "4f742215802dad4a6457e2ef2cad96ef037d666c"
-SRCREV_machine:qemux86 ?= "4f742215802dad4a6457e2ef2cad96ef037d666c"
-SRCREV_machine:qemux86-64 ?= "4f742215802dad4a6457e2ef2cad96ef037d666c"
-SRCREV_machine:qemumips64 ?= "9e06c12d9b1294cd17c24da363ec93e66d5ed5a6"
-SRCREV_machine ?= "4f742215802dad4a6457e2ef2cad96ef037d666c"
+SRCREV_machine:qemuarm ?= "482fd531f2e6ce11c2f2815b90e91452009f18ee"
+SRCREV_machine:qemuarm64 ?= "c75650fdc9635f92e0b04c0da0336141f1f8fa54"
+SRCREV_machine:qemumips ?= "f8be183487cb429e66e49a2cfd989847c9298a3e"
+SRCREV_machine:qemuppc ?= "e55911fc5834f4d5aa527f885cab0ab2a0dbb4b9"
+SRCREV_machine:qemuriscv64 ?= "7280c93f5599946db3add473eeb05b34c364938d"
+SRCREV_machine:qemuriscv32 ?= "7280c93f5599946db3add473eeb05b34c364938d"
+SRCREV_machine:qemux86 ?= "7280c93f5599946db3add473eeb05b34c364938d"
+SRCREV_machine:qemux86-64 ?= "7280c93f5599946db3add473eeb05b34c364938d"
+SRCREV_machine:qemumips64 ?= "07540093c1a8f876fc6f9410aecc3d7d417780ed"
+SRCREV_machine ?= "7280c93f5599946db3add473eeb05b34c364938d"
 SRCREV_meta ?= "c38435a3cacf424fa686ecac9a95ef8349b83bb3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
@@ -31,7 +31,7 @@ SRCREV_meta ?= "c38435a3cacf424fa686ecac9a95ef8349b83bb3"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "7aeadb5bb82ad21ffbcd54c81d77727b7a05e6c1"
+SRCREV_machine:class-devupstream ?= "b8c3cc76091b35ad6a3d31cfe152870a6467611f"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.13/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.13.13"
+LINUX_VERSION ?= "5.13.15"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

