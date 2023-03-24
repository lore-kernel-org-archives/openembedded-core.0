Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A81C761AF
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:15:27 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.104612.1679670924551877007
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gad8+Vfi;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id o44so1828293qvo.4
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 08:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679670923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRD/6Ij04zbCvaUSTxbyHGUQubYY14ks8JKtBSvH0F8=;
        b=gad8+VfiaeQES1Evz65HEbxX1N/kljfUX129BqPT93L2VjtluD8j5LM8fCBuDecrCN
         1VkvmhpSp14XQF56NxQW+UPG8UD/UiybDR7aVnG+/l5a4Wq3BwFF4WhwZ/D+8AaPQ3Yp
         f/zPxdgVVF480jRk3TvDXnFhH1DvvkbLGdKddM/4GcnehvDaT0TTzIEqryEu6ssjd70L
         BCXlyQ7lr5WeAakvi/7/Ulo+KPESFqVigHtrPIxBMd08T+I4aiiBEvtzb4Z/9ziKLWW1
         xLUBzs4IleKJDHUX+Sako0YyvsFIqaZVbaMAtZLoWrdlbDUcdbNVt09vBQ1pF5fwjHQb
         IPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679670923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BRD/6Ij04zbCvaUSTxbyHGUQubYY14ks8JKtBSvH0F8=;
        b=lxbqikPshGTpP9XmdDQz0b7IBhJM8L3tauGoeVSf2IdmeHMa/fjhCtJ5v/GY+Zr5qx
         G41sjbtX/as0u20q5KfZ4xckGoKW0epXwQhvRz/U3lwZfSLf6Bpowp8UY0bKK4BrE9PH
         kb+6+w4v4UIbIXkGmyrXV30MSgk3rsADbkzCC7phSbmurQe044BTh93Ftuh7vyPA8Fj0
         vZ9/5xARu75Zr/EMSz0cDVd/mpcJ5Yv310AqPR/yCm6oFzDiQ1xbIlmRieHU6aMMelqw
         jyQNv/iL5CkcM4W++9qcTYKur6ZjbO89jDXBlMPFGDabyDFEJAKRdzZs0ruv3IaUBVGj
         b6Xw==
X-Gm-Message-State: AAQBX9cUHSGplWub90QiQVrxoCTv3xS68Z7AkXQyQewsUmum98uINLjT
	R09ULLyu885ap3ET/XCK1tQIoye4MoWlMw==
X-Google-Smtp-Source: AKy350aCIajW05Suk73J+WqHsfiLj8jMV/VDPikQDM320/PTixI0ekJelZJTBl8fcNc3OMSMYqO/tw==
X-Received: by 2002:a05:6214:d62:b0:5bd:14f9:650d with SMTP id 2-20020a0562140d6200b005bd14f9650dmr5275986qvs.36.1679670922743;
        Fri, 24 Mar 2023 08:15:22 -0700 (PDT)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id ek5-20020ad45985000000b005dd8b93459fsm748200qvb.55.2023.03.24.08.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 08:15:22 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4][dunfell] linux-yocto/5.4: update to v5.4.233
Date: Fri, 24 Mar 2023 11:15:18 -0400
Message-Id: <20230324151520.1349287-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230324151520.1349287-1-bruce.ashfield@gmail.com>
References: <20230324151520.1349287-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179050

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    69f65d442efe Linux 5.4.233
    c6cc0121d44d bpf: add missing header file include
    5d873a6c658f Revert "net/sched: taprio: make qdisc_leaf() see the per-netdev-queue pfifo child qdiscs"
    99e3fd21f8fc ext4: Fix function prototype mismatch for ext4_feat_ktype
    6f86bb6f853f wifi: mwifiex: Add missing compatible string for SD8787
    6c750ed0367f uaccess: Add speculation barrier to copy_from_user()
    4d2e5de071fd mac80211: mesh: embedd mesh_paths and mpp_paths into ieee80211_if_mesh
    787ef0db0140 drm/i915/gvt: fix double free bug in split_2MB_gtt_entry
    100cf2af1b39 alarmtimer: Prevent starvation by small intervals and SIG_IGN
    dab2066c5fff powerpc: dts: t208x: Disable 10G on MAC1 and MAC2
    113e0cde39bb can: kvaser_usb: hydra: help gcc-13 to figure out cmd_len
    f93a1a5bdcdd KVM: VMX: Execute IBPB on emulated VM-exit when guest has IBRS
    db209f39f1d1 KVM: x86: Fail emulation during EMULTYPE_SKIP on any exception
    dc399695dfe9 random: always mix cycle counter in add_latent_entropy()
    eff0e02f7d3f powerpc: dts: t208x: Mark MAC1 and MAC2 as 10G
    ead0689bd6fd wifi: rtl8xxxu: gen2: Turn on the rate control
    0a77a966aa4a drm/etnaviv: don't truncate physical page address
    fa2845b21671 drm: etnaviv: fix common struct sg_table related issues
    4626550b09ea scatterlist: add generic wrappers for iterating over sgtable objects
    fe3e217272a8 dma-mapping: add generic helpers for mapping sgtable objects
    64121e2adf7d Linux 5.4.232
    8b47e324af71 iommu/amd: Pass gfp flags to iommu_map_page() in amd_iommu_map()
    7519069f1fb8 net: sched: sch: Fix off by one in htb_activate_prios()
    5660a6ffa7a4 ASoC: SOF: Intel: hda-dai: fix possible stream_tag leak
    52844d8382cd nilfs2: fix underflow in second superblock position calculations
    9f95a161a7de kvm: initialize all of the kvm_debugregs structure before sending it to userspace
    9f4abf204827 i40e: Add checking for null for nlmsg_find_attr()
    e71554a09edf ipv6: Fix tcp socket connection with DSCP.
    388886f9708e ipv6: Fix datagram socket connection with DSCP.
    905199dac226 ixgbe: add double of VLAN header when computing the max MTU
    df099e65564a net: mpls: fix stale pointer if allocation fails during device rename
    736f8f66d7a9 net: stmmac: Restrict warning on disabling DMA store and fwd mode
    1a2c7951424c bnxt_en: Fix mqprio and XDP ring checking logic
    de44bdebcfe4 net: stmmac: fix order of dwmac5 FlexPPS parametrization sequence
    a753352622b4 net/usb: kalmia: Don't pass act_len in usb_bulk_msg error path
    0c2651c76369 dccp/tcp: Avoid negative sk_forward_alloc by ipv6_pinfo.pktoptions.
    a4e9411769a7 sctp: sctp_sock_filter(): avoid list_entry() on possibly empty list
    e1b54b561250 net: bgmac: fix BCM5358 support by setting correct flags
    8a4d05b0ffc8 i40e: add double of VLAN header when computing the max MTU
    fdeb4c258bc6 ixgbe: allow to increase MTU to 3K with XDP enabled
    32d81fd54e4e revert "squashfs: harden sanity check in squashfs_read_xattr_id_table"
    4c8011e77c27 net: Fix unwanted sign extension in netdev_stats_to_stats64()
    6b08c9fc72c6 Revert "mm: Always release pages to the buddy allocator in memblock_free_late()."
    8c07792e79cf hugetlb: check for undefined shift on 32 bit architectures
    7caeb5457bd0 sched/psi: Fix use-after-free in ep_remove_wait_queue()
    6c38aa4020b6 ALSA: hda/realtek - fixed wrong gpio assigned
    6e0ef3fc6560 ALSA: hda/conexant: add a new hda codec SN6180
    e9b488d60f51 mmc: mmc_spi: fix error handling in mmc_spi_probe()
    761db46b29b4 mmc: sdio: fix possible resource leaks in some error paths
    98895c225e28 ipv4: Fix incorrect route flushing when source address is deleted
    04a331c9dd66 Revert "ipv4: Fix incorrect route flushing when source address is deleted"
    85eda8088334 xfs: sync lazy sb accounting on quiesce of read-only mounts
    fb8ee907c145 xfs: prevent UAF in xfs_log_item_in_current_chkpt
    7c07806ab05c xfs: fix the forward progress assertion in xfs_iwalk_run_callbacks
    313699d5053c xfs: ensure inobt record walks always make forward progress
    7f9309a9f580 xfs: fix missing CoW blocks writeback conversion retry
    6246b3a18f7e xfs: only relog deferred intent items if free space in the log gets low
    09d61814476c xfs: expose the log push threshold
    5d711e41361c xfs: periodically relog deferred intent items
    870e7d710843 xfs: change the order in which child and parent defer ops are finished
    f5af1d5c2dfe xfs: fix an incore inode UAF in xfs_bui_recover
    efcdc2e70e01 xfs: clean up xfs_bui_item_recover iget/trans_alloc/ilock ordering
    abad319deef5 xfs: clean up bmap intent item recovery checking
    6601531db861 xfs: xfs_defer_capture should absorb remaining transaction reservation
    411b14e68c68 xfs: xfs_defer_capture should absorb remaining block reservations
    3324249e6ecd xfs: proper replay of deferred ops queued during log recovery
    1c89c0430561 xfs: fix finobt btree block recovery ordering
    6678b2787bb4 xfs: log new intent items created as part of finishing recovered intent items
    562da8e70463 xfs: refactor xfs_defer_finish_noroll
    42a2406f9015 xfs: turn dfp_intent into a xfs_log_item
    e11f1516fc9f xfs: merge the ->diff_items defer op into ->create_intent
    e84096edf886 xfs: merge the ->log_item defer op into ->create_intent
    64b21eaa33f5 xfs: factor out a xfs_defer_create_intent helper
    d24633f3c258 xfs: remove the xfs_inode_log_item_t typedef
    e0373eeaaaa3 xfs: remove the xfs_efd_log_item_t typedef
    94e0639992dd xfs: remove the xfs_efi_log_item_t typedef
    83ef55c4281f netfilter: nft_tproxy: restrict to prerouting hook
    b6ac5e6be513 btrfs: free device in btrfs_close_devices for a single device filesystem
    4326d0080f7e aio: fix mremap after fork null-deref
    62b19b9f3a0d nvme-fc: fix a missing queue put in nvmet_fc_ls_create_association
    16409f7d9ca5 s390/decompressor: specify __decompress() buf len to avoid overflow
    fbe71c5dacaa net: sched: sch: Bounds check priority
    09561d5e6ab0 net: stmmac: do not stop RX_CLK in Rx LPI state for qcs404 SoC
    a74d3b0ea984 net/rose: Fix to not accept on connected socket
    ec54c946b412 tools/virtio: fix the vringh test for virtio ring changes
    6644685f7971 ASoC: cs42l56: fix DT probe
    d23b66b16e30 selftests/bpf: Verify copy_register_state() preserves parent/live fields
    a94695e0f9c6 migrate: hugetlb: check for hugetlb shared PMD in node migration
    bcd34f1eea88 bpf: Always return target ifindex in bpf_fib_lookup
    776f2ccfdcef nvme-pci: Move enumeration by class to be last in the table
    5c8680988279 arm64: dts: meson-axg: Make mmc host controller interrupts level-sensitive
    4b97dab7cd98 arm64: dts: meson-g12-common: Make mmc host controller interrupts level-sensitive
    f0302e98edc8 arm64: dts: meson-gx: Make mmc host controller interrupts level-sensitive
    1509e9391616 riscv: Fixup race condition on PG_dcache_clean in flush_icache_pte
    bb3187311ec2 ceph: flush cap releases when the session is flushed
    9b5d37d3288d usb: typec: altmodes/displayport: Fix probe pin assign check
    d9758f7deb5a usb: core: add quirk for Alcor Link AK9563 smartcard reader
    43379fcacea2 net: USB: Fix wrong-direction WARNING in plusb.c
    1bcb431237f1 pinctrl: intel: Restore the pins that used to be in Direct IRQ mode
    2b763f7de108 pinctrl: single: fix potential NULL dereference
    cc1affa23403 pinctrl: aspeed: Fix confusing types in return value
    f209431be199 ALSA: pci: lx6464es: fix a debug loop
    1aab663ecb78 selftests: forwarding: lib: quote the sysctl values
    ba38eacade35 rds: rds_rm_zerocopy_callback() use list_first_entry()
    87a5e3fc8416 ice: Do not use WQ_MEM_RECLAIM flag for workqueue
    f312958f588a ionic: clean interrupt before enabling queue to avoid credit race
    a532f7ebf9fd net: phy: meson-gxl: use MMD access dummy stubs for GXL, internal PHY
    73b8e217fe6f bonding: fix error checking in bond_debug_reregister()
    c89ddf134c53 xfrm: fix bug with DSCP copy to v6 from v4 tunnel
    80282a3d103f RDMA/usnic: use iommu_map_atomic() under spin_lock()
    fe4d70866839 iommu: Add gfp parameter to iommu_ops::map
    4a779187db39 IB/IPoIB: Fix legacy IPoIB due to wrong number of queues
    7896accedf5b IB/hfi1: Restore allocated resources on failed copyout
    ae774f480da3 can: j1939: do not wait 250 ms if the same addr was already claimed
    56ee31167ce5 tracing: Fix poll() and select() do not work on per_cpu trace_pipe and trace_pipe_raw
    039f935ae009 ALSA: emux: Avoid potential array out-of-bound in snd_emux_xg_control()
    7e43bb69bc6f btrfs: zlib: zero-initialize zlib workspace
    ed29d8b309b5 btrfs: limit device extents to the device size
    9f296c615ec4 iio:adc:twl6030: Enable measurement of VAC
    9cf5e99c1ae1 wifi: brcmfmac: Check the count value of channel spec to prevent out-of-bounds reads
    e5142a4935c1 f2fs: fix to do sanity check on i_extra_isize in is_alive()
    3b3d3127f5b4 fbdev: smscufx: fix error handling code in ufx_usb_probe
    8edda487f085 powerpc/imc-pmu: Revert nest_init_lock to being a mutex
    fc8548c75c03 serial: 8250_dma: Fix DMA Rx rearm race
    71d6b277c4e5 serial: 8250_dma: Fix DMA Rx completion race
    ec5b4ca3d30b xprtrdma: Fix regbuf data not freed in rpcrdma_req_create()
    5af2f74f9074 mm: swap: properly update readahead statistics in unuse_pte_range()
    ce62df33fcff nvmem: core: fix cell removal on error
    1369322c1de5 Squashfs: fix handling and sanity checking of xattr_ids count
    d49c85a19133 mm/swapfile: add cond_resched() in get_swap_pages()
    c127bf9a952a fpga: stratix10-soc: Fix return value check in s10_ops_write_init()
    6d86b4ceb09b mm: hugetlb: proc: check for hugetlb shared PMD in /proc/PID/smaps
    845a3708f04f riscv: disable generation of unwind tables
    c89af52d91ca parisc: Wire up PTRACE_GETREGS/PTRACE_SETREGS for compat case
    8e6cc45ba8ab parisc: Fix return code of pdc_iodc_print()
    7f5df45fcb26 iio:adc:twl6030: Enable measurements of VUSB, VBAT and others
    4b82cc9f7f05 iio: adc: berlin2-adc: Add missing of_node_put() in error path
    a300e358c6fc iio: hid: fix the retval in accel_3d_capture_sample
    2035cfb9586f efi: Accept version 2 of memory attributes table
    f6ea834e8dce watchdog: diag288_wdt: fix __diag288() inline assembly
    78e55b52b205 watchdog: diag288_wdt: do not use stack buffers for hardware data
    4abcd352a022 fbcon: Check font dimension limits
    e00d6a74c3c4 Input: i8042 - add Clevo PCX0DX to i8042 quirk table
    faed5af8a9c3 Input: i8042 - add TUXEDO devices to i8042 quirk tables
    ee77a19ee5b3 Input: i8042 - merge quirk tables
    a789c05516a4 Input: i8042 - move __initconst to fix code styling warning
    d0332cbf53da vc_screen: move load of struct vc_data pointer in vcs_read() to avoid UAF
    5bf0010b87be usb: gadget: f_fs: Fix unbalanced spinlock in __ffs_ep0_queue_wait
    db3798943ab7 usb: dwc3: qcom: enable vbus override when in OTG dr-mode
    fefffc782500 usb: dwc3: dwc3-qcom: Fix typo in the dwc3 vbus override API
    e4650c04de90 iio: adc: stm32-dfsdm: fill module aliases
    165511b99ebc net/x25: Fix to not accept on connected socket
    b05664e036e1 i2c: rk3x: fix a bunch of kernel-doc warnings
    d4d765f4761f scsi: iscsi_tcp: Fix UAF during login when accessing the shost ipaddress
    6122ce1de1b2 scsi: target: core: Fix warning on RT kernels
    d92a25627bcd efi: fix potential NULL deref in efi_mem_reserve_persistent
    ed6c5e8caf55 net: openvswitch: fix flow memory leak in ovs_flow_cmd_new
    743f7b51fe7c virtio-net: Keep stop() to follow mirror sequence of open()
    aed972fbf6fa selftests: net: udpgso_bench_tx: Cater for pending datagrams zerocopy benchmarking
    df1213a26704 selftests: net: udpgso_bench: Fix racing bug between the rx/tx programs
    6c70ece3d374 selftests: net: udpgso_bench_rx/tx: Stop when wrong CLI args are provided
    d47f886d0c38 selftests: net: udpgso_bench_rx: Fix 'used uninitialized' compiler warning
    db3f016ad500 ata: libata: Fix sata_down_spd_limit() when no link speed is reported
    6950df42a03c can: j1939: fix errant WARN_ON_ONCE in j1939_session_deactivate
    cb079b077026 net: phy: meson-gxl: Add generic dummy stubs for MMD register access
    db76fc535fbd squashfs: harden sanity check in squashfs_read_xattr_id_table
    dffe83a198a6 netfilter: br_netfilter: disable sabotage_in hook after first suppression
    20355b9569bd netrom: Fix use-after-free caused by accept on already connected socket
    03eb2a1b03f3 fix "direction" argument of iov_iter_kvec()
    34b0fab797f0 fix iov_iter_bvec() "direction" argument
    50b70599c00b WRITE is "data source", not destination...
    21081886de0c scsi: Revert "scsi: core: map PQ=1, PDT=other values to SCSI_SCAN_TARGET_PRESENT"
    14be8b0c4eed arm64: dts: imx8mm: Fix pad control for UART1_DTE_RX
    d6870f3800db ALSA: hda/via: Avoid potential array out-of-bound in add_secret_dac_path()
    412fddc09612 ASoC: Intel: bytcr_rt5651: Drop reference count of ACPI device after use
    79dfde344e0f bus: sunxi-rsb: Fix error handling in sunxi_rsb_init()
    53785fd9b315 firewire: fix memory leak for payload of request subaction to IEC 61883-1 FCP region

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  4 ++--
 .../linux/linux-yocto-tiny_5.4.bb             |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 20 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index bb164928ae..133d9484db 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "da7f3c7acf315f6e17fe65f760adf9f28ba74138"
+SRCREV_machine ?= "e68dd38ef88dbe506472a8df31a7b454505908f3"
 SRCREV_meta ?= "04a8941a1c8ce5c21e2ec10231f61c96d918bd6d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.231"
+LINUX_VERSION ?= "5.4.233"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 273e28d102..0e144c1acf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.231"
+LINUX_VERSION ?= "5.4.233"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "3bc636e9bb56206940d4b524e0f45ab0138b7cac"
-SRCREV_machine ?= "a21707495771d630b7d8f5a271a4748e634c7ef6"
+SRCREV_machine_qemuarm ?= "9f2a124e75fe91216e730fc6b055b793737a8a66"
+SRCREV_machine ?= "bfe78e26b6c27a1f83abc5ef9b93fcc39199824d"
 SRCREV_meta ?= "04a8941a1c8ce5c21e2ec10231f61c96d918bd6d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index bd4889b6de..1468f9acf5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "163b7401067e07185336b59280f220e2f49578b3"
-SRCREV_machine_qemuarm64 ?= "8842f2841c82e8a8739eeaf5b1685d32a2089f48"
-SRCREV_machine_qemumips ?= "e2e5389765a4252dd08068b99726f44b82ab190a"
-SRCREV_machine_qemuppc ?= "540bdafa098e2a3566b074e66e4946b4f6997775"
-SRCREV_machine_qemuriscv64 ?= "36bd96a78e924503c332c2999a8d9ae105ebd05a"
-SRCREV_machine_qemux86 ?= "36bd96a78e924503c332c2999a8d9ae105ebd05a"
-SRCREV_machine_qemux86-64 ?= "36bd96a78e924503c332c2999a8d9ae105ebd05a"
-SRCREV_machine_qemumips64 ?= "816c4ec95a87309ec9ae6a8ff39fd4498e3e60f1"
-SRCREV_machine ?= "36bd96a78e924503c332c2999a8d9ae105ebd05a"
+SRCREV_machine_qemuarm ?= "40299a1e34d11f3dc7d17fe9dbb83d7e99ad88d8"
+SRCREV_machine_qemuarm64 ?= "d317fa78733b175da112b551eae780d7e6cecc5f"
+SRCREV_machine_qemumips ?= "34bf249db02c8548e86c8d8294a5c153d60f3b74"
+SRCREV_machine_qemuppc ?= "144970fe07e46df90ad69b896def4f35cb1245e5"
+SRCREV_machine_qemuriscv64 ?= "3738f9fc3662b6f6e131c7c9844da1000f37ffc2"
+SRCREV_machine_qemux86 ?= "3738f9fc3662b6f6e131c7c9844da1000f37ffc2"
+SRCREV_machine_qemux86-64 ?= "3738f9fc3662b6f6e131c7c9844da1000f37ffc2"
+SRCREV_machine_qemumips64 ?= "70dd62b13f29ef10e41c288047cc59c0f4d24d06"
+SRCREV_machine ?= "3738f9fc3662b6f6e131c7c9844da1000f37ffc2"
 SRCREV_meta ?= "04a8941a1c8ce5c21e2ec10231f61c96d918bd6d"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.231"
+LINUX_VERSION ?= "5.4.233"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


