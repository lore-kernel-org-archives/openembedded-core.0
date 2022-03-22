Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8C2C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 17:20:15 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web08.12952.1647969614364873874
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CZEhQ27P;
 spf=pass (domain: gmail.com, ip: 209.85.219.49,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id kk12so2752742qvb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PMKIDhJOKdzLrLOcl/TuuhEpHu41tCQvaiWsAPQPJNQ=;
        b=CZEhQ27PS5n0hHkAY5UXzdfOr+WbyMQO2iAXpYLIFERO2ni9dghsTCCgKfDuT0OqnD
         pqGhvJ1Q3sji9HSVEaMav5tM+J3/dIC2g90sKf0/wbtKkom+jNzZbxom+LesDth1WvzW
         IVFfUKsg5DZJ2XqNtEkbU44PwqiuegT8yfvXYWp6LjGU9nNlMHLPaJJAk3yOW18rreus
         Mk1gr1uBBVvEngYM3z2swDFHEe7hdvvfcS0A+FzvdNjLBoDgh+N4f6noHid3IoVNDxda
         MG9mACT+0vJr3kTuk89LltmIJn7y/uAP5zll2NaZ2xrhX8/mLXCRliaBva5sCtE2KwTm
         halg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PMKIDhJOKdzLrLOcl/TuuhEpHu41tCQvaiWsAPQPJNQ=;
        b=0UCAs2bN5X3YufA6ZdTdM+BQ5krvIS1Js7O3b/phzoPxxNFCz6rsujrHp5VVF61HMo
         buIjuHDuf6sC6CwELYcMP11RNSQXgTNBcI7YooYB2fDYQ7YGR8rxEgplg8DjbT+2nWkH
         WF3NPsFmATDkwDTasz7c4kKMKi9fUDeQFU+iGVudjxAvMLlmkks3n6N05XjD18SEkFhf
         wr+Uyh4/d5UOlW0U/A7w132dVUNG24w6u61hbqomnPIQFeQeQHspJ46vCMRHt1Sux2LV
         8dmGYFLUX9JM7n/fo0Kx75gEWN9k+y6yWXwuuy6/3d6FmaUNymRGd3nrb3QSR7QI6cMe
         D/Dw==
X-Gm-Message-State: AOAM530jA4Z773kxJbz9e78ItV8Jj+rzZKTL7qvPdfJMZ7ZJZ2y1KHrD
	WeH8DBaMlV7PjuA8M9wgLdKG05FOqJaw0Q==
X-Google-Smtp-Source: 
 ABdhPJzhACeL1wRA+JxMlmjCCcXurUCaerw9z88BOjQjc5D2k6o8pU63HllzQ11D0VqSFfcre4dF3Q==
X-Received: by 2002:a05:6214:d42:b0:440:d56b:4233 with SMTP id
 2-20020a0562140d4200b00440d56b4233mr20115325qvr.15.1647969613220;
        Tue, 22 Mar 2022 10:20:13 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 q8-20020a05622a04c800b002e06d7c1eabsm14019648qtx.16.2022.03.22.10.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 10:20:12 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/10] linux-yocto/5.15: update to v5.15.30
Date: Tue, 22 Mar 2022 13:19:58 -0400
Message-Id: 
 <472389f736637a2d89020c76839ca48c5e2b4143.1647969481.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1647969481.git.bruce.ashfield@gmail.com>
References: <cover.1647969481.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 17:20:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163566

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    0464ab17184b Linux 5.15.30
    a9bbacc53d1f ice: Fix race condition during interface enslave
    df3817ab226f x86/module: Fix the paravirt vs alternative order
    ff2e93a03f8d kselftest/vm: fix tests build with old libc
    d99db3b935b7 bnx2: Fix an error message
    ff7dfcd47a7e sfc: extend the locking on mcdi->seqno
    ff17119dceef tcp: make tcp_read_sock() more robust
    f5a425f5d5fc nl80211: Update bss channel on channel switch for P2P_CLIENT
    3534c5c005ef drm/vrr: Set VRR capable prop only if it is attached to connector
    46c02c5051aa iwlwifi: don't advertise TWT support
    4051516d4b79 atm: firestream: check the return value of ioremap() in fs_init()
    76e0b8e12c64 can: rcar_canfd: rcar_canfd_channel_probe(): register the CAN device when fully ready
    3679ccc09d88 Bluetooth: hci_core: Fix leaking sent_cmd skb
    c2924e9143c2 ARM: 9178/1: fix unmet dependency on BITREVERSE for HAVE_ARCH_BITREVERSE
    be538b764a46 MIPS: smp: fill in sibling and core maps earlier
    c98afa0db3a3 mac80211: refuse aggregations sessions before authorized
    84ecddbc9888 ARM: dts: rockchip: fix a typo on rk3288 crypto-controller
    8ad1b44f2d2e ARM: dts: rockchip: reorder rk322x hmdi clocks
    4744e1df7268 arm64: dts: agilex: use the compatible "intel,socfpga-agilex-hsotg"
    f5743453365b arm64: dts: rockchip: reorder rk3399 hdmi clocks
    f9a510bb024d arm64: dts: rockchip: align pl330 node name with dtschema
    e90da30175cb arm64: dts: rockchip: fix rk3399-puma eMMC HS400 signal integrity
    0f06f953aac5 xfrm: Fix xfrm migrate issues when address family changes
    e6d7e51e1092 xfrm: Check if_id in xfrm_migrate
    8918ae97417a arm64: dts: rockchip: fix rk3399-puma-haikou USB OTG mode
    e901c9212457 Revert "xfrm: state and policy should fail if XFRMA_IF_ID 0"
    b9a0208cb3e3 Linux 5.15.29
    f83c85ee73df vhost: allow batching hint without size
    caf18e4da9bf Revert "net: dsa: mv88e6xxx: flush switchdev FDB workqueue before removing VLAN"
    69b80587f650 block: drop unused includes in <linux/genhd.h>
    cd072bf2dcbd riscv: dts: k210: fix broken IRQs on hart1
    074c88751dc1 drm/i915: Workaround broken BIOS DBUF configuration on TGL/RKL
    a1ce40f8aeb1 btrfs: make send work with concurrent block group relocation
    342783ba9c3c drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP
    1fbafa9a5b42 x86/traps: Mark do_int3() NOKPROBE_SYMBOL
    ce91f0f023ad x86/sgx: Free backing memory after faulting the enclave page
    e946556d3665 x86/boot: Add setup_indirect support in early_memremap_is_setup_data()
    19503d381aab x86/boot: Fix memremap of setup_indirect structures
    ffb8fd39c84c watch_queue: Make comment about setting ->defunct more accurate
    eb38c2e9fc74 watch_queue: Fix lack of barrier/sync/lock between post and read
    82ff8a2243f7 watch_queue: Free the alloc bitmap when the watch_queue is torn down
    d453d0e5a15d watch_queue: Fix the alloc bitmap size to reflect notes allocated
    b022b6a0586f watch_queue: Fix to always request a pow-of-2 pipe ring size
    ccd03c30f103 watch_queue: Fix to release page in ->release()
    8275b6699c6d watch_queue, pipe: Free watchqueue state after clearing pipe ring
    1b09f28f70a5 watch_queue: Fix filter limit check
    52445030f135 ARM: fix Thumb2 regression with Spectre BHB
    4a8e7f9dae4a net/mlx5: Fix offloading with ESWITCH_IPV4_TTL_MODIFY_ENABLE
    cbb726e6c652 virtio: acknowledge all features before access
    22823b1a0dc9 virtio: unexport virtio_finalize_features
    a633bc013333 KVM: x86/mmu: kvm_faultin_pfn has to return false if pfh is returned
    2c1f97af38be swiotlb: rework "fix info leak with DMA_FROM_DEVICE"
    0349c79c5508 arm64: kasan: fix include error in MTE functions
    61d32defc00f arm64: Ensure execute-only permissions are not allowed without EPAN
    72ea28d88d30 arm64: dts: marvell: armada-37xx: Remap IO space to bus address 0x0
    42aaf726c9e9 tracing/osnoise: Force quiescent states while tracing
    eae073d854c5 riscv: Fix auipc+jalr relocation range checks
    b515552d41ee mmc: meson: Fix usage of meson_mmc_post_req()
    9b3cdf5e8ad9 riscv: alternative only works on !XIP_KERNEL
    b5e792187f50 net: macb: Fix lost RX packet wakeup race in NAPI receive
    1fb9dd378749 staging: gdm724x: fix use after free in gdm_lte_rx()
    441bc1e3d7e0 staging: rtl8723bs: Fix access-point mode deadlock
    ca62747b38f5 fuse: fix pipe buffer lifetime for direct_io
    d60d34b4d6d1 fuse: fix fileattr op failure
    64147ce85e2f ARM: Spectre-BHB: provide empty stub for non-config
    5c237251421d selftests/memfd: clean up mapping in mfd_fail_write
    e22807ee679f selftest/vm: fix map_fixed_noreplace test failure
    9d95b7e239a1 tracing/osnoise: Make osnoise_main to sleep for microseconds
    4d2889691570 tracing: Ensure trace buffer is at least 4096 bytes large
    041616a22c40 ipv6: prevent a possible race condition with lifetimes
    2708ceb4e5cc Revert "xen-netback: Check for hotplug-status existence before watching"
    fe39ab30dcc2 Revert "xen-netback: remove 'hotplug-status' once it has served its purpose"
    fcd1d79aa943 drm/amdgpu: bypass tiling flag check in virtual display case (v2)
    5cf4dd01efe0 gpio: Return EPROBE_DEFER if gc->to_irq is NULL
    94b568a9d2a5 PCI: Mark all AMD Navi10 and Navi14 GPU ATS as broken
    bb9795b6da22 hwmon: (pmbus) Clear pmbus fault/warning bits after read
    8d5e69d8fbf3 net-sysfs: add check for netdevice being present to speed_show
    1280c8ae9745 x86/kvm: Don't use pv tlb/ipi/sched_yield if on 1 vCPU
    ee22082c3e2f drm/vc4: hdmi: Unregister codec device on unbind
    5bef4e5089d3 spi: rockchip: terminate dma transmission when slave abort
    1f04bbd2935c spi: rockchip: Fix error in getting num-cs property
    bcd4279b989f kvm: x86: Disable KVM_HC_CLOCK_PAIRING if tsc is in always catchup mode
    e160ee96d03f KVM: Fix lockdep false negative during host resume
    302ce2946160 pinctrl: tigerlake: Revert "Add Alder Lake-M ACPI ID"
    839ddf786772 usb: dwc3: pci: add support for the Intel Raptor Lake-S
    7403f4118ab9 swiotlb: fix info leak with DMA_FROM_DEVICE
    b0028e1cc1fa selftests/bpf: Add test for bpf_timer overwriting crash
    732c7172b79c net: phy: meson-gxl: improve link-up behavior
    6c0d2f348be2 net: bcmgenet: Don't claim WOL when its not available
    1502f15b9f29 sctp: fix kernel-infoleak for SCTP sockets
    9ca50a73c98c net: phy: DP83822: clear MISR2 register to disable interrupts
    f49f646f9ec2 gianfar: ethtool: Fix refcount leak in gfar_get_ts_info
    c7f6accc6795 gpio: ts4900: Do not set DAT and OE together
    c614aad2ee9e selftests: pmtu.sh: Kill nettest processes launched in subshell.
    d4dfc94c4052 selftests: pmtu.sh: Kill tcpdump processes launched by subshell.
    0e721b8f2ee5 NFC: port100: fix use-after-free in port100_send_complete
    a2355333cf18 net/mlx5e: Lag, Only handle events from highest priority multipath entry
    7c519f769f55 net/mlx5: Fix a race on command flush flow
    b3d4a7dcb9ca net/mlx5: Fix size field in bufferx_reg struct
    46ad629e58ce ax25: Fix NULL pointer dereference in ax25_kill_by_device
    b7c2fd1d1263 net: marvell: prestera: Add missing of_node_put() in prestera_switch_set_base_mac_addr
    6e294d389023 net: ethernet: lpc_eth: Handle error for clk_enable
    c746fa0f54c9 net: ethernet: ti: cpts: Handle error for clk_enable
    5548c81e97ab tipc: fix incorrect order of state message data sanity check
    5e7c402892e1 ethernet: Fix error handling in xemaclite_of_probe
    06a97a7afa05 ice: Fix curr_link_speed advertised speed
    fd0ca20f1846 ice: Don't use GFP_KERNEL in atomic context
    15d1271d89b8 ice: Fix error with handling of bonding MTU
    9bda6a09e7ef ice: stop disabling VFs due to PF error responses
    49839cb40d6c i40e: stop disabling VFs due to PF error responses
    35f11aba74e2 iavf: Fix handling of vlan strip virtual channel messages
    0716607ad241 ARM: dts: aspeed: Fix AST2600 quad spi group
    9c0686caa822 net: dsa: mt7530: fix incorrect test in mt753x_phylink_validate()
    f9ec15fc3c48 drm/sun4i: mixer: Fix P010 and P210 format numbers
    c5883d38a470 gpiolib: acpi: Convert ACPI value of debounce to microseconds
    c014efbd1c28 smsc95xx: Ignore -ENODEV errors when device is unplugged
    3acc8788febf qed: return status of qed_iov_get_link
    e5d078d21fa0 esp: Fix BEET mode inter address family tunneling on GSO
    4aaabbffc3b0 esp: Fix possible buffer overflow in ESP transformation
    4dfa7d3508bf net: qlogic: check the return value of dma_alloc_coherent() in qed_vf_hw_prepare()
    92d97017c67c isdn: hfcpci: check the return value of dma_set_mask() in setup_hw()
    4b1743bc715a vdpa: fix use-after-free on vp_vdpa_remove
    8848b0fa9bf1 virtio-blk: Don't use MAX_DISCARD_SEGMENTS if max_discard_seg is zero
    f8d88e86e90e vhost: fix hung thread due to erroneous iotlb entries
    7777b1f795af mISDN: Fix memory leak in dsp_pipeline_build()
    20145e05e497 net: phy: meson-gxl: fix interrupt handling in forced mode
    90a2f4fc5b23 vduse: Fix returning wrong type in vduse_domain_alloc_iova()
    e7e118416465 vdpa/mlx5: add validation for VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET command
    f96dc3adb9a9 tipc: fix kernel panic when enabling bearer
    0a99594d2058 arm64: dts: armada-3720-turris-mox: Add missing ethernet0 alias
    e52ecbca254b HID: vivaldi: fix sysfs attributes leak
    ea45b38caf2b clk: qcom: dispcc: Update the transition delay for MDSS GDSC
    ba24eb3cc95c clk: qcom: gdsc: Add support to update GDSC transition delay
    b6c624d07bf2 ARM: boot: dts: bcm2711: Fix HVS register range
    3ffbe85cda7f HID: hid-thrustmaster: fix OOB read in thrustmaster_interrupts
    a5334502f91f HID: elo: Revert USB reference counting
    af4fcf85c88d arm64: dts: qcom: sm8350: Correct UFS symbol clocks
    8fa52df84c58 arm64: dts: qcom: sm8350: Describe GCC dependency clocks
    aa79753319d8 Linux 5.15.28
    39d332de8edb Revert "ACPI: PM: s2idle: Cancel wakeup before dispatching EC GPE"
    dea18aef2021 xen/netfront: react properly to failing gnttab_end_foreign_access_ref()
    27dc69aa5568 xen/gnttab: fix gnttab_end_foreign_access() without page specified
    5bff1721c8f9 xen/pvcalls: use alloc/free_pages_exact()
    a019d26830e8 xen/9p: use alloc/free_pages_exact()
    90c5f198b923 xen: remove gnttab_query_foreign_access()
    f06e3edaeac1 xen/gntalloc: don't use gnttab_query_foreign_access()
    f1c85942314d xen/scsifront: don't use gnttab_query_foreign_access() for mapped status
    5d5fa1d53a31 xen/netfront: don't use gnttab_query_foreign_access() for mapped status
    f9ade968df79 xen/blkfront: don't use gnttab_query_foreign_access() for mapped status
    1dd5b4b230f6 xen/grant-table: add gnttab_try_end_foreign_access()
    66cb2bbb522b xen/xenbus: don't let xenbus_grant_ring() remove grants in error case
    2b2d2a8ba2e9 ARM: fix build warning in proc-v7-bugs.c
    8836a046ef41 arm64: Do not include __READ_ONCE() block in assembly files
    431b92c3c25e ARM: Do not use NOCROSSREFS directive with ld.lld
    57a65667fbdc ARM: fix co-processor register typo
    49062ec32e79 ARM: fix build error when BPF_SYSCALL is disabled
    3317d21b84e9 arm64: proton-pack: Include unprivileged eBPF status in Spectre v2 mitigation reporting
    8979720ac64c arm64: Use the clearbhb instruction in mitigations
    fb2bb2ec137c KVM: arm64: Allow SMCCC_ARCH_WORKAROUND_3 to be discovered and migrated
    4bbfd0c28025 arm64: Mitigate spectre style branch history side channels
    8e55b9b0e765 arm64: proton-pack: Report Spectre-BHB vulnerabilities as part of Spectre-v2
    d7066114dcd6 arm64: Add percpu vectors for EL1
    cfd0c38125aa arm64: entry: Add macro for reading symbol addresses from the trampoline
    50e700a11766 arm64: entry: Add vectors that have the bhb mitigation sequences
    ffb8a34c0fd8 arm64: entry: Add non-kpti __bp_harden_el1_vectors for mitigations
    517f988ee050 arm64: entry: Allow the trampoline text to occupy multiple pages
    6895584a92ee arm64: entry: Make the kpti trampoline's kpti sequence optional
    a40472d463f9 arm64: entry: Move trampoline macros out of ifdef'd section
    be9c5526aad6 arm64: entry: Don't assume tramp_vectors is the start of the vectors
    2e09754a03a7 arm64: entry: Allow tramp_alias to access symbols after the 4K boundary
    e25a9dced2bd arm64: entry: Move the trampoline data page before the text page
    4a691bbf56a1 arm64: entry: Free up another register on kpti's tramp_exit path
    479c9bb741bf arm64: entry: Make the trampoline cleanup optional
    368a1fd8c4a6 KVM: arm64: Allow indirect vectors to be used without SPECTRE_V3A
    44adac5908ff arm64: spectre: Rename spectre_v4_patch_fw_mitigation_conduit
    b7beeab84f02 arm64: entry.S: Add ventry overflow sanity checks
    e38b3c0d245b arm64: cpufeature: add HWCAP for FEAT_RPRES
    a4c234f60269 arm64: cpufeature: add HWCAP for FEAT_AFP
    912961e188dc arm64: add ID_AA64ISAR2_EL1 sys register
    ac7bc62b78de arm64: Add Cortex-X2 CPU part definition
    f0c559c38e98 arm64: Add HWCAP for self-synchronising virtual counter
    d82f489cbbdb arm64: Add Neoverse-N2, Cortex-A710 CPU part definition
    842f2d498ee1 ARM: include unprivileged BPF status in Spectre V2 reporting
    576548846f1e ARM: Spectre-BHB workaround
    2dca61693e6c ARM: use LOADADDR() to get load address of sections
    878ad97f745e ARM: early traps initialisation
    f02cab2bed1a ARM: report Spectre v2 status through sysfs
    bf048d1921b6 x86/speculation: Warn about eIBRS + LFENCE + Unprivileged eBPF + SMT
    074d72604639 x86/speculation: Warn about Spectre v2 LFENCE mitigation
    36fbbd78471c x86/speculation: Update link to AMD speculation whitepaper
    a56566d7a957 x86/speculation: Use generic retpoline by default on AMD
    316e4a16524a x86/speculation: Include unprivileged eBPF status in Spectre v2 mitigation reporting
    eb4596417756 Documentation/hw-vuln: Update spectre doc
    d7771f380c90 x86/speculation: Add eIBRS + Retpoline options
    f150b6fccf7f x86/speculation: Rename RETPOLINE_AMD to RETPOLINE_LFENCE
    e94d490a1ad6 x86,bugs: Unconditionally allow spectre_v2=retpoline,amd
    668c821321b4 slip: fix macro redefine warning

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 51ef3b2a4f..8edafbcc4e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "931d5079b9fc28bf11bf0a13e2fd49049422674c"
-SRCREV_meta ?= "2f5c61a31c735701fdb4fb9615a31c43db40cf11"
+SRCREV_machine ?= "593f500eff5997a184c8d3836e1e26b199af994f"
+SRCREV_meta ?= "fee71fc34f2e551ebfd7bf0996d82f3447787e7a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.27"
+LINUX_VERSION ?= "5.15.30"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index bd4cbf84f5..01c59a1ffc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.27"
+LINUX_VERSION ?= "5.15.30"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "06b3afe81676d7f706ff90a2eb01d19dc36bc365"
-SRCREV_machine ?= "f6607d246d44d674c15f4911140810c751a4def6"
-SRCREV_meta ?= "2f5c61a31c735701fdb4fb9615a31c43db40cf11"
+SRCREV_machine:qemuarm ?= "0c05aecb4a6a902d8b44b69f887dd991e091b234"
+SRCREV_machine ?= "94c4403d43f8d4a4fa330d9342350b02426696d4"
+SRCREV_meta ?= "fee71fc34f2e551ebfd7bf0996d82f3447787e7a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index b754cb90f2..de71d1fe13 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "97c2224cc9dc67dfbc1b42486046c34cef015365"
-SRCREV_machine:qemuarm64 ?= "c1855ad93c8de958c11563b7bdb083d169327468"
-SRCREV_machine:qemumips ?= "46d4a01ac6f017ce92cdb24e5bf916b57a6af9db"
-SRCREV_machine:qemuppc ?= "db0ff027bc782f6ae6d67f2ddcfc71d2ec1d31f2"
-SRCREV_machine:qemuriscv64 ?= "81b54a76d48d941632e36e1d68e53e07e5ba695a"
-SRCREV_machine:qemuriscv32 ?= "81b54a76d48d941632e36e1d68e53e07e5ba695a"
-SRCREV_machine:qemux86 ?= "81b54a76d48d941632e36e1d68e53e07e5ba695a"
-SRCREV_machine:qemux86-64 ?= "81b54a76d48d941632e36e1d68e53e07e5ba695a"
-SRCREV_machine:qemumips64 ?= "4ae738aae43cbee8798b4142bb7169b3794e2969"
-SRCREV_machine ?= "81b54a76d48d941632e36e1d68e53e07e5ba695a"
-SRCREV_meta ?= "2f5c61a31c735701fdb4fb9615a31c43db40cf11"
+SRCREV_machine:qemuarm ?= "4632211e5b019b6337536305bfce0a5ffd3b570b"
+SRCREV_machine:qemuarm64 ?= "c88fcdb0b3ca81f0149309ed7025cb28f709ed3d"
+SRCREV_machine:qemumips ?= "ad268b2a1d6d1d6f1c9e9103cf4b1519477feb39"
+SRCREV_machine:qemuppc ?= "688bb26b6f83a60ec39a0f20f31ec2bc37b49c6f"
+SRCREV_machine:qemuriscv64 ?= "70cf8dde55448a804da825139fa12daf5a855047"
+SRCREV_machine:qemuriscv32 ?= "70cf8dde55448a804da825139fa12daf5a855047"
+SRCREV_machine:qemux86 ?= "70cf8dde55448a804da825139fa12daf5a855047"
+SRCREV_machine:qemux86-64 ?= "70cf8dde55448a804da825139fa12daf5a855047"
+SRCREV_machine:qemumips64 ?= "5e7bcff3dccd4749783b87d69ffd405ba71c9fda"
+SRCREV_machine ?= "70cf8dde55448a804da825139fa12daf5a855047"
+SRCREV_meta ?= "fee71fc34f2e551ebfd7bf0996d82f3447787e7a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "8993e6067f263765fd26edabf3e3012e3ec4d81e"
+SRCREV_machine:class-devupstream ?= "0464ab17184b8fdec6676fabe76059b90e54e74f"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -41,7 +41,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.27"
+LINUX_VERSION ?= "5.15.30"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


