Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7EEBC6FA92
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 14:28:48 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web12.20455.1663597724350863687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 07:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VvgmPWXz;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id s18so17701299qtx.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 07:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=orGdic9jhQjCXbboTdWqeCptUJP5MmGA+bvo5UVthek=;
        b=VvgmPWXzQeDqqePIDx6olDwRsipLi8LY855+MGNH7mpyAd6PpNHr9tUSbRfj4DIDGx
         7i45x05lgRkKRMa/FCnGV2FqUVEPpN/jAeV96EQ2V6TZYHZC1VPER54HJT0GY4gzlC2A
         yn2tWFkkfBPegcYe9zuQH2akGjlvMiqRJ1xZTaTRe5D6px4sC/Y8VMNJfEVd8owLa3+s
         K0g468hsU9Rd2p0DfDx3uhdmJJk2bRiAC4xJTQ3tdZyX3N+siqcpw4FnrNmlgrGgYwSf
         9cjF6abgKPpiujEixE643u9GIi4LTFq4hA3pJ4tFjOgaVGiiM+XUISarLbgka+n/B+w5
         dYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=orGdic9jhQjCXbboTdWqeCptUJP5MmGA+bvo5UVthek=;
        b=OtObNDPT4uHmoaHxJVZTg3GzqbgEo9E/cjKny3t+qdTPDaM+uIEOPs4rupGzyAeIuD
         GUKyXeEN3ZyPA81mkvrvL7Mk5UNOZozjTZN3oXK6/jpk8qQqR62vaxQ8U0j4OKVaIgy6
         T41m7iuC3p5KvegLu1fAHyS+A+e9mNOc9E21gd8hFBbPJb1fnuejhaznuHsXhXEX3V8R
         yBB3MddyM0ZIhnMroV57xuMFMERzHbdZ6+NOBFppkkGADPbVnQNRUFUKFDVPhsqFj2xE
         Bdb/RHmRPt42MB9ZQ1TvNW0LuZxGdxK8v8/53dCDR6zxwXOSFBwAbclPLaPSf7mzCePX
         GGxQ==
X-Gm-Message-State: ACrzQf2rs40XvUNFFjmSvk9QAUX6N/wjLeT3YFpV3PCDbGw8vtp8bSnI
	WNfSGnhi0Ul3194WUAD4/YHIXZeWwMI=
X-Google-Smtp-Source: 
 AMsMyM7lE1zLE1YDCxWLBT1lPrwY+9SNmoowqcb3a4C/DFSsJgaSIHsANsbTLEna37gdEVPdLCp/Iw==
X-Received: by 2002:ac8:590f:0:b0:35c:c247:9731 with SMTP id
 15-20020ac8590f000000b0035cc2479731mr15113122qty.114.1663597723219;
        Mon, 19 Sep 2022 07:28:43 -0700 (PDT)
Received: from build.lan
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 j12-20020a05620a288c00b006cbc40f4b36sm13362226qkp.39.2022.09.19.07.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 07:28:42 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] linux-yocto/5.19: update to v5.19.7
Date: Mon, 19 Sep 2022 10:28:28 -0400
Message-Id: 
 <10ee7839fa7d4b673de5c7579f5164e4720bd533.1663597409.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1663597409.git.bruce.ashfield@gmail.com>
References: <cover.1663597409.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Sep 2022 14:28:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170866

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    7d0a458e1963 Linux 5.19.7
    a754ee1c66bd arm64: cacheinfo: Fix incorrect assignment of signed error value to unsigned fw_level
    123bf15c1a15 net: neigh: don't call kfree_skb() under spin_lock_irqsave()
    ec274d8f1e64 net/af_packet: check len when min_header_len equals to 0
    d25d6744c46b android: binder: fix lockdep check on clearing vma
    8a239dd886e2 btrfs: tree-checker: check for overlapping extent items
    b83e1567af28 btrfs: fix lockdep splat with reloc root extent buffers
    98f803acf8ac btrfs: move lockdep class helpers to locking.c
    82af833b99dc ALSA: hda/cs8409: Support new Dolphin Variants
    0f31a350fd9a platform/x86: serial-multi-instantiate: Add CLSA0101 Laptop
    503728838bdf testing: selftests: nft_flowtable.sh: use random netns names
    7d4bfe34b9cb netfilter: conntrack: NF_CONNTRACK_PROCFS should no longer default to y
    933020e6d057 drm/amdgpu: Fix interrupt handling on ih_soft ring
    09186eeffd39 drm/amdgpu: Add secure display TA load for Renoir
    d278f332d105 drm/amdgpu: Add decode_iv_ts helper for ih_v6 block
    4eb2be1d0827 drm/amd/display: avoid doing vm_init multiple time
    bd71ef2c3024 drm/amd/display: Fix plug/unplug external monitor will hang while playback MPO video
    db1d9deb84d7 drm/amdgpu: Increase tlb flush timeout for sriov
    db0669c9731b drm/amd/display: Fix pixel clock programming
    22a75c616f19 drm/amd/pm: add missing ->fini_xxxx interfaces for some SMU13 asics
    4d21584ac639 drm/amd/pm: add missing ->fini_microcode interface for Sienna Cichlid
    d9d70547cba1 drm/amdgpu: disable 3DCGCG/CGLS temporarily due to stability issue
    dc441eda0617 ksmbd: don't remove dos attribute xattr on O_TRUNC open
    895096784ab9 s390/hypfs: avoid error message under KVM
    2432f152c175 ALSA: hda/realtek: Add quirks for ASUS Zenbooks using CS35L41
    2dd5ed474115 neigh: fix possible DoS due to net iface start/stop loop
    0d462a681d7d net: lan966x: fix checking for return value of platform_get_irq_byname()
    40f424dc1ee3 ksmbd: return STATUS_BAD_NETWORK_NAME error status if share is not configured
    4b25bdb54578 drm/amd/pm: Fix a potential gpu_metrics_table memory leak
    21e3891abc83 drm/amdkfd: Handle restart of kfd_ioctl_wait_events
    952d4c72d903 drm/amd/pm: skip pptable override for smu_v13_0_7
    909dae582c8f drm/amd/display: Fix TDR eDP and USB4 display light up issue
    3101839b0801 drm/amd/display: clear optc underflow before turn off odm clock
    c6f7ba837efc drm/amd/display: For stereo keep "FLIP_ANY_FRAME"
    71f2cb739a3c drm/amd/display: Fix HDMI VSIF V3 incorrect issue
    b26218b2349a drm/amd/display: Avoid MPC infinite loop
    ab01ac7fa985 drm/amd/display: Device flash garbage before get in OS
    ae29c0c46681 drm/amd/display: Add a missing register field for HPO DP stream encoder
    de3f7eb0b864 rtla: Fix tracer name
    33f15a70fe9d ASoC: rt5640: Fix the JD voltage dropping issue
    dc4351487a55 ASoC: sh: rz-ssi: Improve error handling in rz_ssi_probe() error path
    d875be57a215 fs/ntfs3: Fix work with fragmented xattr
    c9215e9018bd mmc: sdhci-of-dwcmshc: Re-enable support for the BlueField-3 SoC
    30841ba786ee mmc: sdhci-of-dwcmshc: rename rk3568 to rk35xx
    d1541cdf5aec mmc: sdhci-of-dwcmshc: add reset call back for rockchip Socs
    1c137c46d16e mmc: mtk-sd: Clear interrupts when cqe off/disable
    1d7df13d223b HID: intel-ish-hid: ipc: Add Meteor Lake PCI device ID
    a32046896fe1 HID: thrustmaster: Add sparco wheel and fix array length
    7c6e6c334154 HID: nintendo: fix rumble worker null pointer deref
    2b32e820ccf5 HID: asus: ROG NKey: Ignore portion of 0x5a report
    5b3063adff7d HID: Add Apple Touchbar on T2 Macs in hid_have_special_driver list
    2803225ac89b HID: AMD_SFH: Add a DMI quirk entry for Chromebooks
    4af0f12367b2 HID: add Lenovo Yoga C630 battery quirk
    b61400c4e784 HID: input: fix uclogic tablets
    ec45c7783319 ALSA: usb-audio: Add quirk for LH Labs Geek Out HD Audio 1V5
    7877eaa11311 mm/rmap: Fix anon_vma->degree ambiguity leading to double-reuse
    72f2dc8993f1 bpf: Don't redirect packets with invalid pkt_len
    d81bd6671f45 ftrace: Fix NULL pointer dereference in is_ftrace_trampoline when ftrace is dead
    cb4bb011a683 fbdev: fb_pm2fb: Avoid potential divide by zero error
    86026be8535c net: fix refcount bug in sk_psock_get (2)
    52a3c62a8151 HID: hidraw: fix memory leak in hidraw_release()
    f44b0b95d50f USB: gadget: Fix use-after-free Read in usb_udc_uevent()
    c02d2a91a85c media: pvrusb2: fix memory leak in pvr_probe
    f2f6ea1a8da1 udmabuf: Set the DMA mask for the udmabuf device (v2)
    dee1e51b5479 HID: steam: Prevent NULL pointer dereference in steam_{recv,send}_report
    adb9caabcd16 Revert "PCI/portdrv: Don't disable AER reporting in get_port_device_capability()"
    e8fcbce54249 Bluetooth: L2CAP: Fix build errors in some archs
    d3916da4bc6c arm64: errata: Add Cortex-A510 to the repeat tlbi list
    a8ba16e9f171 docs: kerneldoc-preamble: Test xeCJK.sty before loading
    e120a6353294 crypto: lib - remove unneeded selection of XOR_BLOCKS
    515af71adf3d firmware: tegra: bpmp: Do only aligned access to IPC memory area
    1cf82931822d drm/vc4: hdmi: Depends on CONFIG_PM
    1a289a168570 drm/vc4: hdmi: Rework power up
    3c730ee65d57 Linux 5.19.6
    a36df92c7ff7 bpf: Don't use tnum_range on array range checking for poke descriptors
    f0e5ce88e1cf riscv: dts: microchip: mpfs: remove pci axi address translation property
    14f158b9770f riscv: dts: microchip: mpfs: remove bogus card-detect-delay
    a8604d23a812 riscv: dts: microchip: mpfs: remove ti,fifo-depth property
    5977375a7dba riscv: dts: microchip: mpfs: fix incorrect pcie child node name
    f24ee7391a75 scsi: core: Fix passthrough retry counter handling
    828f57ac75ea scsi: storvsc: Remove WQ_MEM_RECLAIM from storvsc_error_wq
    a292244e5bfa scsi: ufs: core: Enable link lost interrupt
    0761b0e818c7 arm64/sme: Don't flush SVE register state when handling SME traps
    a8d79f9d1a4d arm64/sme: Don't flush SVE register state when allocating SME storage
    913fe86ae903 arm64/signal: Flush FPSIMD register state when disabling streaming mode
    f83cbd14c794 arm64: fix rodata=full
    ec76a1de1d65 perf stat: Clear evsel->reset_group for each stat run
    6d7a4a140cfc perf/x86/intel/ds: Fix precise store latency handling
    291f8baead17 perf/x86/intel/uncore: Fix broken read_counter() for SNB IMC PMU
    a9271d39d6dc perf python: Fix build when PYTHON_CONFIG is user supplied
    b2f10baf4d67 blk-mq: fix io hung due to missing commit_rqs
    ca949183c340 Documentation/ABI: Mention retbleed vulnerability info file for sysfs
    43365c8fbb3c drm/amdkfd: Fix isa version for the GC 10.3.7
    b864bc2ad49f x86/nospec: Fix i386 RSB stuffing
    7b0163c1b07b binder_alloc: add missing mmap_lock calls when using the VMA
    b887868c4e6b arm64: Fix match_list for erratum 1286807 on Arm Cortex-A76
    f42a9819ba84 md: call __md_stop_writes in md_stop
    4d83d9b7d5dd Revert "md-raid: destroy the bitmap after destroying the thread"
    ba8da1806c4f mm/hugetlb: fix hugetlb not supporting softdirty tracking
    5192d4ae17a5 io_uring: fix issue with io_write() not always undoing sb_start_write()
    e8f1d2fd8113 Revert "zram: remove double compression logic"
    c4ce7913dfd2 riscv: dts: microchip: correct L2 cache interrupts
    b8e86aef0a60 riscv: traps: add missing prototype
    f80d72069ede riscv: signal: fix missing prototype warning
    45d47bd9b96e xen/privcmd: fix error exit of privcmd_ioctl_dm_op()
    f377ac7597ba ocfs2: fix freeing uninitialized resource on ocfs2_dlm_shutdown
    a25f09216071 smb3: missing inode locks in punch hole
    8e3ba23a67de nouveau: explicitly wait on the fence in nouveau_bo_move_m2mf
    f1a7466258b7 ACPI: processor: Remove freq Qos request for all CPUs
    c061d697a304 shmem: update folio if shmem_replace_page() updates the page
    5f4d2b0caf20 Revert "memcg: cleanup racy sum avoidance code"
    f08ccb792d3e fbdev: fbcon: Properly revert changes when vc_resize() failed
    fbdc482d43ed s390: fix double free of GS and RI CBs on fork() failure
    bb125123f60e cifs: skip extra NULL byte in filenames
    5fcf81e308d1 mm/mprotect: only reference swap pfn page if type match
    3ada1b3e58db mm/hugetlb: avoid corrupting page->mapping in hugetlb_mcopy_atomic_pte
    9ae15c4ba2be bootmem: remove the vmemmap pages from kmemleak in put_page_bootmem
    8eaa24d57ab6 s390/mm: do not trigger write fault when vma does not allow VM_WRITE
    c035edae0dad mm/damon/dbgfs: avoid duplicate context directory creation
    fe64e17d9b01 asm-generic: sections: refactor memory_intersects
    22ebb780d54e audit: move audit_return_fixup before the filters
    9a6c710f3bc1 writeback: avoid use-after-free after removing device
    9be7fa7ead18 loop: Check for overflow while configuring loop
    a210408b9024 x86/PAT: Have pat_enabled() properly reflect state when running on Xen
    d9975eea5e6a x86/nospec: Unwreck the RSB stuffing
    9d0a21053cf3 x86/bugs: Add "unknown" reporting for MMIO Stale Data
    0666703c4be8 x86/sev: Don't use cc_platform_has() for early SEV-SNP calls
    a10290756e4f x86/unwind/orc: Unwind ftrace trampolines with correct ORC entry
    d1a6d0a9631f x86/entry: Fix entry_INT80_compat for Xen PV guests
    66f2f9f27726 perf/x86/lbr: Enable the branch type for the Arch LBR by default
    e31430b23603 perf/x86/intel: Fix pebs event constraints for ADL
    ffbf5efde85e x86/boot: Don't propagate uninitialized boot_params->cc_blob_address
    1fc82cdd9089 btrfs: update generation of hole file extent item when merging holes
    4b124ad87244 btrfs: fix possible memory leak in btrfs_get_dev_args_from_path()
    0f72e355c4a0 btrfs: check if root is readonly while setting security xattr
    a2e54eb64229 btrfs: fix space cache corruption and potential double allocations
    b4656b25c83f btrfs: add info when mount fails due to stale replace target
    955d400e263d btrfs: replace: drop assert for suspended replace
    e08fcb1284a9 btrfs: fix silent failure when deleting root reference
    3ef2786e32d9 net: lantiq_xrx200: restore buffer if memory allocation failed
    0d9981b0636d net: lantiq_xrx200: fix lock under memory pressure
    73f475865269 net: lantiq_xrx200: confirm skb is allocated before using
    27a5ab8fec27 net: stmmac: work around sporadic tx issue on link-up
    c830d7120137 ionic: VF initial random MAC address if no assigned mac
    79e77fb1565d ionic: fix up issues with handling EAGAIN on FW cmds
    94d71d99e5dd ionic: clear broken state on generation change
    091dc91e119f rxrpc: Fix locking in rxrpc's sendmsg
    b886aebd0c3d net: ethernet: mtk_eth_soc: fix hw hash reporting for MTK_NETSYS_V2
    2f2375708467 net: ethernet: mtk_eth_soc: enable rx cksum offload for MTK_NETSYS_V2
    82fd14027677 i40e: Fix incorrect address type for IPv6 flow rules
    c2b99b2a249b ixgbe: stop resetting SYSTIME in ixgbe_ptp_start_cyclecounter
    18a8b82643e7 net: Fix a data-race around sysctl_somaxconn.
    8a536935207a net: Fix a data-race around netdev_unregister_timeout_secs.
    21c6c135354a net: Fix a data-race around gro_normal_batch.
    bdb33552e663 net: Fix data-races around sysctl_devconf_inherit_init_net.
    e94dd3e96036 net: Fix data-races around sysctl_fb_tunnels_only_for_init_net.
    d923063ba2d1 net: Fix a data-race around netdev_budget_usecs.
    c34e06f05ab7 net: Fix data-races around sysctl_max_skb_frags.
    293ec6acc32a net: Fix a data-race around netdev_budget.
    6a520caf1f55 net: Fix a data-race around sysctl_net_busy_read.
    05d92723f99c net: Fix a data-race around sysctl_net_busy_poll.
    6fc89f990716 net: Fix a data-race around sysctl_tstamp_allow_data.
    764352456e55 net: Fix data-races around sysctl_optmem_max.
    f1bbd4c0966c ratelimit: Fix data-races in ___ratelimit().
    c49b023e4e2e net: Fix data-races around netdev_tstamp_prequeue.
    32f8c816b92e net: Fix data-races around netdev_max_backlog.
    01198bebd53e net: Fix data-races around weight_p and dev_weight_[rt]x_bias.
    a9de312f4514 net: Fix data-races around sysctl_[rw]mem_(max|default).
    89e135a36a9e netfilter: flowtable: fix stuck flows on cleanup due to pending work
    cbfc3a1b098d netfilter: flowtable: add function to invoke garbage collection immediately
    fdca693fcf26 netfilter: nf_tables: disallow binding to already bound chain
    486bfb68d7b1 netfilter: nft_tunnel: restrict it to netdev family
    02e8575a86f4 netfilter: nft_osf: restrict osf to ipv4, ipv6 and inet families
    98a621ef45e3 netfilter: nf_tables: do not leave chain stats enabled on error
    09cd8ecf3107 netfilter: nft_payload: do not truncate csum_offset and csum_type
    0ee5c638e108 netfilter: nft_payload: report ERANGE for too long offset and length
    c8ebc3b8635f netfilter: nf_tables: make table handle allocation per-netns friendly
    b7dfe042ecec netfilter: nf_tables: disallow updates of implicit chain
    c5101ebeb2ed bnxt_en: fix LRO/GRO_HW features in ndo_fix_features callback
    2ec3dc278d97 bnxt_en: fix NQ resource accounting during vf creation on 57500 chips
    46195aec8631 bnxt_en: set missing reload flag in devlink features
    51ca62d3274c bnxt_en: Use PAGE_SIZE to init buffer when multi buffer XDP is not in use
    343fed6b0dae netfilter: nft_tproxy: restrict to prerouting hook
    e53cfa017bf4 netfilter: ebtables: reject blobs that don't provide all entry points
    223fbc2f5039 net: ipvtap - add __init/__exit annotations to module init/exit funcs
    3ff47e599420 bonding: 802.3ad: fix no transmission of LACPDUs
    b8bd96a46c93 net: moxa: get rid of asymmetry in DMA mapping/unmapping
    162571b77486 net: phy: Don't WARN for PHY_READY state in mdio_bus_phy_resume()
    834a5483bfe0 net: ipa: don't assume SMEM is page-aligned
    67426e99a1ac net: dsa: microchip: keep compatibility with device tree blobs with no phy-mode
    dfee8aec730d net: dsa: microchip: update the ksz_phylink_get_caps
    bb015bf77a9e net: dsa: microchip: move the port mirror to ksz_common
    d719d680a557 net: dsa: microchip: move vlan functionality to ksz_common
    23fcd5216540 net: dsa: microchip: move tag_protocol to ksz_common
    eafb01efb8c7 net: dsa: microchip: move switch chip_id detection to ksz_common
    422e808ba8a5 net: dsa: microchip: ksz9477: cleanup the ksz9477_switch_detect
    eaa08e3c5abd net/mlx5e: Fix wrong tc flag used when set hw-tc-offload off
    160967199c5e net/mlx5e: Fix wrong application of the LRO state
    b0faef51599e net/mlx5: Avoid false positive lockdep warning by adding lock_class_key
    0ea1abf797f0 net/mlx5: Fix cmd error logging for manage pages cmd
    cddad6c98f5c net/mlx5: Disable irq when locking lag_lock
    3325cb4f2d07 net/mlx5: Eswitch, Fix forwarding decision to uplink
    4c040acf5744 net/mlx5: LAG, fix logic over MLX5_LAG_FLAG_NDEVS_READY
    1155eb7baf1b net/mlx5e: Properly disable vlan strip on non-UL reps
    952efbc7a06f ice: xsk: use Rx ring's XDP ring when picking NAPI context
    03a3f29fe5b1 ice: xsk: prohibit usage of non-balanced queue id
    2c71f5d55a86 nfc: pn533: Fix use-after-free bugs caused by pn532_cmd_timeout
    edbcbe37c31a r8152: fix the RX FIFO settings when suspending
    3eb8eb6e2e2a r8152: fix the units of some registers for RTL8156A
    9197ca40fd9d rose: check NULL rose_loopback_neigh->loopback
    546443d8886d ntfs: fix acl handling
    02ab2b234c58 mm/smaps: don't access young/dirty bit if pte unpresent
    86ebf313929f SUNRPC: RPC level errors should set task->tk_rpc_status
    c2a47f6903e2 NFSv4.2 fix problems with __nfs42_ssc_open
    4eac2ff103b9 Revert "net: macsec: update SCI upon MAC address change."
    9a852bcf90fb fs: require CAP_SYS_ADMIN in target namespace for idmapped mounts
    e26d676c1f9f xfrm: policy: fix metadata dst->dev xmit null pointer dereference
    6901885656c0 af_key: Do not call xfrm_probe_algs in parallel
    87b7ef9e760b xfrm: clone missing x->lastused in xfrm_do_migrate
    9156a7b65c9d Revert "xfrm: update SA curlft.use_time"
    d66c05287979 xfrm: fix refcount leak in __xfrm_policy_check()
    4500aa11358d mt76: mt7921: fix command timeout in AP stop period
    49f05dfd2412 mm/hugetlb: support write-faults in shared mappings
    3e2747c3ddfa mm/uffd: reset write protection when unregister with wp-mode
    bc3188d8a3b8 kprobes: don't call disarm_kprobe() for disabled kprobes
    79ce0b1445f9 kernel/sys_ni: add compat entry for fadvise64_64
    760dc9f658d7 parisc: Fix exception handler for fldw and fstw instructions
    012dad4b908a parisc: Make CONFIG_64BIT available for ARCH=parisc64 only
    b0d2e414bcc7 cgroup: Fix race condition at rebind_subsystems()
    24a943ca4c45 audit: fix potential double free on error path from fsnotify_add_inode_mark
    72440414b10b NFS: Fix another fsync() issue after a server reboot
    9def52eb10ba mm/gup: fix FOLL_FORCE COW security issue and remove FOLL_COW

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.19.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.19.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index a6f0c41f49..2997a533f7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a950b78ae8d483ec47ff8ec67d7b8b57913ef591"
-SRCREV_meta ?= "2531046e2da0438e704deb8798fc18c6f2799afd"
+SRCREV_machine ?= "036e789efdca81efc810fa003153c084003828b0"
+SRCREV_meta ?= "ddb7fe05a2e7050ff604639a0dd53a862902b949"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.19.5"
+LINUX_VERSION ?= "5.19.7"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index dbe06fca42..f1b5b27f61 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.19.5"
+LINUX_VERSION ?= "5.19.7"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2b8e2d66fbacf6b213220d87659ab9f9adaf86c3"
-SRCREV_meta ?= "2531046e2da0438e704deb8798fc18c6f2799afd"
+SRCREV_machine ?= "764d3890bc156851da21a5d15a70ec118d1b2fdc"
+SRCREV_meta ?= "ddb7fe05a2e7050ff604639a0dd53a862902b949"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index ffc6518cfc..528e000012 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.19/standard/base"
 KBRANCH:qemux86-64 ?= "v5.19/standard/base"
 KBRANCH:qemumips64 ?= "v5.19/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b099ff4206267fc928cbaf32b8f5e517589290ca"
-SRCREV_machine:qemuarm64 ?= "2b8e2d66fbacf6b213220d87659ab9f9adaf86c3"
-SRCREV_machine:qemumips ?= "4406ca2b5acede33604c50aa512caa2c15a540f2"
-SRCREV_machine:qemuppc ?= "2b8e2d66fbacf6b213220d87659ab9f9adaf86c3"
-SRCREV_machine:qemuriscv64 ?= "2b8e2d66fbacf6b213220d87659ab9f9adaf86c3"
-SRCREV_machine:qemuriscv32 ?= "2b8e2d66fbacf6b213220d87659ab9f9adaf86c3"
-SRCREV_machine:qemux86 ?= "2b8e2d66fbacf6b213220d87659ab9f9adaf86c3"
-SRCREV_machine:qemux86-64 ?= "2b8e2d66fbacf6b213220d87659ab9f9adaf86c3"
-SRCREV_machine:qemumips64 ?= "73d355234ca6a4b7dd2277617c73a26392880544"
-SRCREV_machine ?= "2b8e2d66fbacf6b213220d87659ab9f9adaf86c3"
-SRCREV_meta ?= "2531046e2da0438e704deb8798fc18c6f2799afd"
+SRCREV_machine:qemuarm ?= "5b0372b52b810d2365b210e69227de1dec6c8d2c"
+SRCREV_machine:qemuarm64 ?= "764d3890bc156851da21a5d15a70ec118d1b2fdc"
+SRCREV_machine:qemumips ?= "290081f2609d420e94a7ecaa37fc9bab482b77ab"
+SRCREV_machine:qemuppc ?= "764d3890bc156851da21a5d15a70ec118d1b2fdc"
+SRCREV_machine:qemuriscv64 ?= "764d3890bc156851da21a5d15a70ec118d1b2fdc"
+SRCREV_machine:qemuriscv32 ?= "764d3890bc156851da21a5d15a70ec118d1b2fdc"
+SRCREV_machine:qemux86 ?= "764d3890bc156851da21a5d15a70ec118d1b2fdc"
+SRCREV_machine:qemux86-64 ?= "764d3890bc156851da21a5d15a70ec118d1b2fdc"
+SRCREV_machine:qemumips64 ?= "afd431bd55805b5a980774ebf30b5d8aa4da492e"
+SRCREV_machine ?= "764d3890bc156851da21a5d15a70ec118d1b2fdc"
+SRCREV_meta ?= "ddb7fe05a2e7050ff604639a0dd53a862902b949"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "1916ff079c77dc38275493cc18e22fe18532fb0f"
+SRCREV_machine:class-devupstream ?= "7d0a458e1963128ee5a85bf0584bea5e75149946"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.19/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.19.5"
+LINUX_VERSION ?= "5.19.7"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


