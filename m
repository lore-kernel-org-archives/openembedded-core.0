Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.12991.1598450258916847974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 06:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WtOAiS8J;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id o196so1351699qke.8
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 06:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4xCaHz3cqY6Ni+CcFrlwYT32Twk06h+h0lcx7eSIvJU=;
        b=WtOAiS8JR14/4Qd0NXWTZLJJ6abYRQZz25Pos3RrajfbWOz+ljvxqPeaBPPUzkTDui
         w0cvaQKxoOxs8YnwZZwOMrzIlN3Hnc+hQP6uN6bNZMtMqivjsxYCCvVAKxz3pTib6Ul3
         tNudhoLFd3zFV6kibL1MiWCXi42JW6pOVEfmSrrsCQI/O2iVAO5/CoBbeusjcDudH7Ej
         4ATWV/nrL/KWkkVa7BYG75TC1bR8gYsdAbCH622yl36MtoZHZKl4D3AjINuK04OatgCD
         laTyyuKSZ/jSmklGQl+rca5zOzBP+deT+kmSBK8ewZI0ciybRtdAFqG3bqEQy/j3gXdw
         CStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4xCaHz3cqY6Ni+CcFrlwYT32Twk06h+h0lcx7eSIvJU=;
        b=n+bcEUpwop+QU+6cmGP3UuyOqaleBxD4/J9g4+IarmjJX9PdDEnQW3kca74q1LfeiO
         WAK/DYobqsXPYFE7JsWxWMDrypyQHTzTaTXS8c/yzQGkdx/xmIdepuVliHG5WtK7qLSM
         x4wtSAr+JPpCzu4f8av71MwxCLwh+HeFmrF1nqpeLnVxRCImeqALcJLBkVOfqhPVPjt7
         j7HCeJs93HZPakFeKF6XsdAJJC5oaRHMvIZmAYZWvwm1iUQxiQerw0aS4jYdGs7EhfGM
         YMTzy5z24jq3pl+Qg2VRQJ1Krz4SMWOcaeej14o0piHuLCey4IyBa2UbhaqOFA5f0tG5
         ha9w==
X-Gm-Message-State: AOAM5310wHusI3O1ioyh0Y8YeU1lM5MqE8Q4IHMh4M9XPexQ1WofLc+F
	vseN2Cm7qA2LwQWkWLaXe8g=
X-Google-Smtp-Source: ABdhPJxf48692J3NQkq+M/K0GEoIZQrtOA1UCqOO9kNWoS+e5agz23lfsuDmbjhS8hDtiyvYwMAWLQ==
X-Received: by 2002:a05:620a:15c9:: with SMTP id o9mr14277278qkm.8.1598450257842;
        Wed, 26 Aug 2020 06:57:37 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id a52sm1371737qtc.22.2020.08.26.06.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 06:57:36 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/5.4: update to v5.4.60
Date: Wed, 26 Aug 2020 09:57:30 -0400
Message-Id: <ceef8f26b956429eb979f75696ba17d356d443a9.1598450136.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1598450136.git.bruce.ashfield@gmail.com>
References: <cover.1598450136.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    77fcb48939fc Linux 5.4.60
    53a856c5a6af drm/amd/display: dchubbub p-state warning during surface planes switch
    4287c18a7d8f drm/amdgpu: Fix bug where DPM is not enabled after hibernate and resume
    915ad46bdd4a drm: fix drm_dp_mst_port refcount leaks in drm_dp_mst_allocate_vcpi
    f9f53b7c6a81 drm: Added orientation quirk for ASUS tablet model T103HAF
    aeec14061d53 drm/panfrost: Use kvfree() to free bo->sgts
    a202b42b94bc arm64: dts: marvell: espressobin: add ethernet alias
    0f1c938ef82d khugepaged: retract_page_tables() remember to test exit
    e47e00559893 sh: landisk: Add missing initialization of sh_io_port_base
    64d358a9adb5 perf/x86/rapl: Fix missing psys sysfs attributes
    5c90739d36ce tools build feature: Quote CC and CXX for their arguments
    45989801d7cf perf bench mem: Always memset source before memcpy
    306df54b5b8a ALSA: echoaudio: Fix potential Oops in snd_echo_resume()
    8bc48c35a983 crypto: algif_aead - fix uninitialized ctx->init
    a23269976109 mfd: dln2: Run event handler loop under spinlock
    315b5cbe1aee i2c: iproc: fix race between client unreg and isr
    8620d18575af test_kmod: avoid potential double free in trigger_config_run_type()
    3457ba1acec2 fs/ufs: avoid potential u32 multiplication overflow
    ba40d33e36b2 fs/minix: remove expected error message in block_to_path()
    d91005b645d1 fs/minix: fix block limit check for V1 filesystems
    6def476496a5 fs/minix: set s_maxbytes correctly
    75cf7f895f56 nfs: Fix getxattr kernel panic and memory overflow
    d09d6dca89e9 net: qcom/emac: add missed clk_disable_unprepare in error path of emac_clks_phase1_init
    35b5e689abd9 drm/vmwgfx: Fix two list_for_each loop exit tests
    95922cdab4ad drm/vmwgfx: Use correct vmw_legacy_display_unit pointer
    1d8dce52a008 recordmcount: Fix build failure on non arm64
    f41600c55789 Input: sentelic - fix error return when fsp_reg_write fails
    8d7633b5aff9 x86/tsr: Fix tsc frequency enumeration bug on Lightning Mountain SoC
    8645225c7180 md-cluster: Fix potential error pointer dereference in resize_bitmaps()
    3fcd24040f55 watchdog: initialize device before misc_register
    9340d8bfec94 nfs: nfs_file_write() should check for writeback errors
    da14c05ad875 scsi: lpfc: nvmet: Avoid hang / use-after-free again when destroying targetport
    c9220ff3b9cc openrisc: Fix oops caused when dumping stack
    a6d5c5a398d6 libnvdimm/security: ensure sysfs poll thread woke up and fetch updated attr
    dfb5d727d721 libnvdimm/security: fix a typo
    0c51d8f5c83e clk: bcm2835: Do not use prediv with bcm2711's PLLs
    1896dfc97c90 ubifs: Fix wrong orphan node deletion in ubifs_jnl_update|rename
    7dccbf1111bf nfs: ensure correct writeback errors are returned on close()
    9153e0d43710 i2c: rcar: avoid race when unregistering slave
    4f69483568d6 tools build feature: Use CC and CXX from parent
    3d0808f3c7d9 pwm: bcm-iproc: handle clk_get_rate() return
    ba2c4d0e720b clk: clk-atlas6: fix return value check in atlas6_clk_init()
    c7bd131f4335 clk: qcom: gcc-sdm660: Fix up gcc_mss_mnoc_bimc_axi_clk
    422a01fc23d2 i2c: rcar: slave: only send STOP event when we have been addressed
    043bc80399a8 iommu/vt-d: Enforce PASID devTLB field mask
    99d1472ba802 clk: qcom: clk-alpha-pll: remove unused/incorrect PLL_CAL_VAL
    f66d0154ed2f clk: qcom: gcc: fix sm8150 GPU and NPU clocks
    a31ac4101981 iommu/omap: Check for failure of a call to omap_iommu_dump_ctx
    34c920e2c858 selftests/powerpc: ptrace-pkey: Don't update expected UAMOR value
    cf5078181528 selftests/powerpc: ptrace-pkey: Update the test to mark an invalid pkey correctly
    e4a6919c9908 selftests/powerpc: ptrace-pkey: Rename variables to make it easier to follow code
    ea777df6b8b9 clk: actions: Fix h_clk for Actions S500 SoC
    0e0a146f978e dm rq: don't call blk_mq_queue_stopped() in dm_stop_queue()
    386f82040c84 gpu: ipu-v3: image-convert: Wait for all EOFs before completing a tile
    0f77e95efd75 gpu: ipu-v3: image-convert: Combine rotate/no-rotate irq handlers
    e0a684edf6d7 crypto: caam - Remove broken arc4 support
    64563d1dca80 mmc: renesas_sdhi_internal_dmac: clean up the code for dma complete
    b638533ec6fa RDMA/counter: Allow manually bind QPs with different pids to same counter
    e5a9bb4f1243 RDMA/counter: Only bind user QPs in auto mode
    cf304df99fac devres: keep both device name and resource name in pretty name
    ddd3934f7b39 crypto: af_alg - Fix regression on empty requests
    9705f53eb01a USB: serial: ftdi_sio: clean up receive processing
    aeefe7d15cf1 USB: serial: ftdi_sio: make process-packet buffer unsigned
    8cab023c03aa selftests/bpf: test_progs use another shell exit on non-actions
    de624fbac3eb selftests/bpf: Test_progs indicate to shell on non-actions
    95c736a29105 IB/uverbs: Set IOVA on IB MR in uverbs layer
    ea1cdb1bb80b media: rockchip: rga: Only set output CSC mode for RGB input
    5f51ca677cd2 media: rockchip: rga: Introduce color fmt macros and refactor CSC mode logic
    0f334b668455 RDMA/ipoib: Fix ABBA deadlock with ipoib_reap_ah()
    5412efa6285a RDMA/ipoib: Return void from ipoib_ib_dev_stop()
    ab67471562ad platform/chrome: cros_ec_ishtp: Fix a double-unlock issue
    617da16f5ab9 mtd: rawnand: fsl_upm: Remove unused mtd var
    e1f2606892f2 octeontx2-af: change (struct qmem)->entry_sz from u8 to u16
    368caae37037 mfd: arizona: Ensure 32k clock is put on driver unbind and error
    cf368b876f44 crypto: algif_aead - Only wake up when ctx->more is zero
    bb0bba78d365 pinctrl: ingenic: Properly detect GPIO direction when configured for IRQ
    974ca069d531 orangefs: get rid of knob code...
    1752ab50e825 drm/imx: imx-ldb: Disable both channels for split mode in enc->disable()
    988fcef346a3 remoteproc: qcom_q6v5_mss: Validate modem blob firmware size before load
    babd6a4c3336 remoteproc: qcom_q6v5_mss: Validate MBA firmware size before load
    73ba6991e981 remoteproc: qcom: q6v5: Update running state before requesting stop
    55052ac61cb8 perf intel-pt: Fix duplicate branch after CBR
    8214e74b662d perf intel-pt: Fix FUP packet state
    169015f464d0 module: Correctly truncate sysfs sections output
    54f44e3af24b pseries: Fix 64 bit logical memory block panic
    37e3a1c08e2d ceph: handle zero-length feature mask in session messages
    8953e8cb0d6a ceph: set sec_context xattr on symlink creation
    12badd382453 watchdog: f71808e_wdt: clear watchdog timeout occurred flag
    0f35915a0feb watchdog: f71808e_wdt: remove use of wrong watchdog_info option
    4699d95a715b watchdog: f71808e_wdt: indicate WDIOF_CARDRESET support in watchdog_info.options
    43e172e31bad tracing: Move pipe reference to trace array instead of current_tracer
    9aab8b2b0f8f tracing: Use trace_sched_process_free() instead of exit() for pid tracing
    bd23940da2d1 tracing/hwlat: Honor the tracing_cpumask
    1424f0aa18dc kprobes: Fix NULL pointer dereference at kprobe_ftrace_handler
    3a1208574658 ftrace: Setup correct FTRACE_FL_REGS flags for module
    b47215b3749a mm/memory_hotplug: fix unpaired mem_hotplug_begin/done
    aeeddba9b498 mm/page_counter.c: fix protection usage propagation
    bd99ff4dc92b ocfs2: change slot number type s16 to u16
    a6b238cac6d3 khugepaged: collapse_pte_mapped_thp() protect the pmd lock
    687d366d0db1 khugepaged: collapse_pte_mapped_thp() flush the right range
    8cdf68355312 ext2: fix missing percpu_counter_inc
    6c7b42c8f01d MIPS: qi_lb60: Fix routing to audio amplifier
    59909e23020f MIPS: CPU#0 is not hotpluggable
    d3c9e815006e driver core: Avoid binding drivers to dead devices
    0cf746d8b052 mac80211: fix misplaced while instead of if
    c573e8673dc1 bcache: fix overflow in offset_to_stripe()
    42dd8cc9e499 bcache: allocate meta data pages as compound pages
    391b5d39faea md/raid5: Fix Force reconstruct-write io stuck in degraded raid5
    28163868530b net/compat: Add missing sock updates for SCM_RIGHTS
    6ea125ec644b net: stmmac: dwmac1000: provide multicast filter fallback
    e92a02e47e16 net: ethernet: stmmac: Disable hardware multicast filter
    eca5084aabdf media: vsp1: dl: Fix NULL pointer dereference on unbind
    28bbbc45054c pinctrl: ingenic: Enhance support for IRQ_TYPE_EDGE_BOTH
    9ba5f37fa353 powerpc: Fix circular dependency between percpu.h and mmu.h
    9de20a6c4dd6 powerpc: Allow 4224 bytes of stack expansion for the signal frame
    2150c25b76fb powerpc/ptdump: Fix build failure in hashpagetable.c
    7a991df9e5cb cifs: Fix leak when handling lease break for cached root fid
    545771537ec4 xtensa: fix xtensa_pmu_setup prototype
    d1e2ec2e0b7d xtensa: add missing exclusive access state management
    5efb3f91403c iio: dac: ad5592r: fix unbalanced mutex unlocks in ad5592r_read_raw()
    1a5e5b3b7571 dt-bindings: iio: io-channel-mux: Fix compatible string in example code
    ab58cc033124 arm64: perf: Correct the event index in sysfs
    8c1431221374 btrfs: fix return value mixup in btrfs_get_extent
    d256992d5105 btrfs: make sure SB_I_VERSION doesn't get unset by remount
    5bed3387c8a1 btrfs: fix memory leaks after failure to lookup checksums during inode logging
    f1d21b2688d9 btrfs: inode: fix NULL pointer dereference if inode doesn't need compression
    7bbf647dbb5a btrfs: only search for left_info if there is no right_info in try_merge_free_space
    38c8255af7d7 btrfs: fix messages after changing compression level by remount
    242747612209 btrfs: fix race between page release and a fast fsync
    ee6373070108 btrfs: don't WARN if we abort a transaction with EROFS
    d8848f4c2555 btrfs: sysfs: use NOFS for device creation
    e0e51f4fc488 btrfs: avoid possible signal interruption of btrfs_drop_snapshot() on relocation tree
    2f29a31f394e btrfs: add missing check for nocow and compression inode flags
    38ab14b1e27c btrfs: relocation: review the call sites which can be interrupted by signal
    ae3f93cafd6f btrfs: move the chunk_mutex in btrfs_read_chunk_tree
    98f55cd49671 btrfs: open device without device_list_mutex
    3d3452920cac btrfs: don't traverse into the seed devices in show_devname
    8bc3a5d8c2ae btrfs: remove no longer needed use of log_writers for the log root tree
    938051408905 btrfs: stop incremening log_batch for the log root tree when syncing log
    0ddf373adb42 btrfs: ref-verify: fix memory leak in add_block_entry
    c16ba06f5204 btrfs: don't allocate anonymous block device for user invisible roots
    d2731ac13ca5 btrfs: free anon block device right after subvolume deletion
    207659ef151c btrfs: allow use of global block reserve for balance item deletion
    7a6fc7c21962 PCI: qcom: Add support for tx term offset for rev 2.1.0
    5956d3847502 PCI: qcom: Define some PARF params needed for ipq8064 SoC
    588d5cbf4de7 PCI: Add device even if driver attach failed
    d7caf80700f2 PCI: Mark AMD Navi10 GPU rev 0x00 ATS as broken
    ae86233204ba PCI: hotplug: ACPI: Fix context refcounting in acpiphp_grab_context()
    72ba9d544e60 genirq/PM: Always unlock IRQ descriptor in rearm_wake_irq()
    a11f42496ac8 genirq/affinity: Make affinity setting if activated opt-in
    582ee2cb6f90 smb3: warn on confusing error scenario with sec=krb5

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index d1f3373155..a3416a660f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4a46fa0e5b9ac924a7827ad14e28359fd44071db"
-SRCREV_meta ?= "5d52d9eea95fa09d404053360c2351b2b91b323b"
+SRCREV_machine ?= "ac6f31906972c08f16c1ce43410502a5ef251dce"
+SRCREV_meta ?= "96bf76ffc2601220c790ffc0b57eec5a06c3f819"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.59"
+LINUX_VERSION ?= "5.4.60"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 12edd9c70b..58697bb9ef 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.59"
+LINUX_VERSION ?= "5.4.60"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "9d508813e893033dbe72caeb9421d95df5248e85"
-SRCREV_machine ?= "f8efa0bae5f9aad8ba621e1c37eb898a7530b5a1"
-SRCREV_meta ?= "5d52d9eea95fa09d404053360c2351b2b91b323b"
+SRCREV_machine_qemuarm ?= "693cdc59f5332582cd1e0e21f388b5342fadb5c6"
+SRCREV_machine ?= "60fc5f2c61a48088ff4bbfb35b2f64af70bc5bdd"
+SRCREV_meta ?= "96bf76ffc2601220c790ffc0b57eec5a06c3f819"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 26886d028e..5dc388925c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "81ee43dd68b5c88000b472e2406db7e46ac5a1a8"
-SRCREV_machine_qemuarm64 ?= "f8efa0bae5f9aad8ba621e1c37eb898a7530b5a1"
-SRCREV_machine_qemumips ?= "3e72d371ab61c9b23c79076e6e9aabba3907c440"
-SRCREV_machine_qemuppc ?= "f8efa0bae5f9aad8ba621e1c37eb898a7530b5a1"
-SRCREV_machine_qemuriscv64 ?= "f8efa0bae5f9aad8ba621e1c37eb898a7530b5a1"
-SRCREV_machine_qemux86 ?= "f8efa0bae5f9aad8ba621e1c37eb898a7530b5a1"
-SRCREV_machine_qemux86-64 ?= "f8efa0bae5f9aad8ba621e1c37eb898a7530b5a1"
-SRCREV_machine_qemumips64 ?= "7b5ccc4d7ce6f71b807bea00e67f8eb4c0e236a3"
-SRCREV_machine ?= "f8efa0bae5f9aad8ba621e1c37eb898a7530b5a1"
-SRCREV_meta ?= "5d52d9eea95fa09d404053360c2351b2b91b323b"
+SRCREV_machine_qemuarm ?= "05fde54b1e68379be26d2d666e52eb8a4433cf67"
+SRCREV_machine_qemuarm64 ?= "60fc5f2c61a48088ff4bbfb35b2f64af70bc5bdd"
+SRCREV_machine_qemumips ?= "02fee7ae77f92e2090c26959be11c0a109b02ec2"
+SRCREV_machine_qemuppc ?= "60fc5f2c61a48088ff4bbfb35b2f64af70bc5bdd"
+SRCREV_machine_qemuriscv64 ?= "60fc5f2c61a48088ff4bbfb35b2f64af70bc5bdd"
+SRCREV_machine_qemux86 ?= "60fc5f2c61a48088ff4bbfb35b2f64af70bc5bdd"
+SRCREV_machine_qemux86-64 ?= "60fc5f2c61a48088ff4bbfb35b2f64af70bc5bdd"
+SRCREV_machine_qemumips64 ?= "e8247201b3d33b579520620cf37a398fa8311822"
+SRCREV_machine ?= "60fc5f2c61a48088ff4bbfb35b2f64af70bc5bdd"
+SRCREV_meta ?= "96bf76ffc2601220c790ffc0b57eec5a06c3f819"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.59"
+LINUX_VERSION ?= "5.4.60"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

