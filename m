Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14ADFC433FE
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 13:48:00 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.7266.1648734472624914593
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 06:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Fl7kRoBq;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648734477; x=1680270477;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=0jCR64sBKNJryFFB3K/S5Q8xJTmy4p29N5Yj/TSSJ7k=;
  b=Fl7kRoBqsiBBSeLAZ8G4GHhLP7U1DWwTuLYpjvjmrol1wkwLAAtc2oLU
   bwjAsr4HUYfOcXglNcEOyoKImNWMdwYCkxa56wCM59DaYCbFUoqyyzNWJ
   uq1hEB5fj4DCVOTEvHvnFqX15xFQiIJTVHgeCOwF+2mbv2XSxjR6hRqrq
   AEkmETIbzuaTbbZhBVBxqSBXkrlmh7gxf9sVIPdbMBd2G4bjdznL9yn/5
   HXdswUNFnPBVjCx5C0N6HVq6EakhROlZNJ9msxn1RzwIcbYbekWJ+H98i
   ffuZEWyrvSmm7K2U0ota52Tw36TiIwKbkQ2N2B69zgyUwT0P8Wq0dCSfp
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259551849"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="259551849"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:54 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="520542276"
Received: from scho7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.39])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:52 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 15/20] linux-yocto/5.10: update to v5.10.107
Date: Thu, 31 Mar 2022 21:47:20 +0800
Message-Id: 
 <03c3af8bcd0a7059ae37e6e633d9c94310ebdc16.1648734169.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648734169.git.anuj.mittal@intel.com>
References: <cover.1648734169.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 13:48:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163829

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    4c8814277b5d Linux 5.10.107
    7a0d13ef67a1 arm64: kvm: Fix copy-and-paste error in bhb templates for v5.10 stable
    dc1163203ae6 io_uring: return back safer resurrect
    8fdaab341bad kselftest/vm: fix tests build with old libc
    2490695ffdba sfc: extend the locking on mcdi->seqno
    2fad5b694896 tcp: make tcp_read_sock() more robust
    3f9a8f8a952c nl80211: Update bss channel on channel switch for P2P_CLIENT
    0ba557d33094 drm/vrr: Set VRR capable prop only if it is attached to connector
    9a8e4a5c5b73 iwlwifi: don't advertise TWT support
    c5ea0221c816 atm: firestream: check the return value of ioremap() in fs_init()
    efdd92c18ed4 can: rcar_canfd: rcar_canfd_channel_probe(): register the CAN device when fully ready
    ebe106eac686 ARM: 9178/1: fix unmet dependency on BITREVERSE for HAVE_ARCH_BITREVERSE
    e8ad9ecc4069 MIPS: smp: fill in sibling and core maps earlier
    8c70b9b47004 mac80211: refuse aggregations sessions before authorized
    d687d7559e24 ARM: dts: rockchip: fix a typo on rk3288 crypto-controller
    6f0a94931c47 ARM: dts: rockchip: reorder rk322x hmdi clocks
    6493c6aa8b44 arm64: dts: agilex: use the compatible "intel,socfpga-agilex-hsotg"
    c5c8c649fee0 arm64: dts: rockchip: reorder rk3399 hdmi clocks
    f7f062919f41 arm64: dts: rockchip: fix rk3399-puma eMMC HS400 signal integrity
    ca142038a54f xfrm: Fix xfrm migrate issues when address family changes
    d8889a445b53 xfrm: Check if_id in xfrm_migrate
    6056abc99b58 sctp: fix the processing for INIT chunk
    bdf0316982f0 Revert "xfrm: state and policy should fail if XFRMA_IF_ID 0"
    327f1e7d813c Linux 5.10.106
    648895da69ce watch_queue: Fix filter limit check
    8bb5b72dbd9a ARM: fix Thumb2 regression with Spectre BHB
    6b1249db9e1c ext4: add check to prevent attempting to resize an fs with sparse_super2
    b297cf764d8c x86/traps: Mark do_int3() NOKPROBE_SYMBOL
    29f6f3500127 x86/boot: Add setup_indirect support in early_memremap_is_setup_data()
    b3444e5b640a x86/boot: Fix memremap of setup_indirect structures
    24d268130e3c watch_queue: Make comment about setting ->defunct more accurate
    ec03510e0a77 watch_queue: Fix lack of barrier/sync/lock between post and read
    06ab8444392a watch_queue: Free the alloc bitmap when the watch_queue is torn down
    880acbb718e1 watch_queue: Fix the alloc bitmap size to reflect notes allocated
    e2b52ca4988e watch_queue: Fix to always request a pow-of-2 pipe ring size
    2039900aadba watch_queue: Fix to release page in ->release()
    d729d4e99fb8 watch_queue, pipe: Free watchqueue state after clearing pipe ring
    573a3228ca32 virtio: acknowledge all features before access
    bf52b627cf47 virtio: unexport virtio_finalize_features
    8bfb959ea28d arm64: dts: marvell: armada-37xx: Remap IO space to bus address 0x0
    1ef5fe3dba2a riscv: Fix auipc+jalr relocation range checks
    a69aa422b478 mmc: meson: Fix usage of meson_mmc_post_req()
    0c6eeaf8c168 net: macb: Fix lost RX packet wakeup race in NAPI receive
    6d9700b44509 staging: gdm724x: fix use after free in gdm_lte_rx()
    8c1bc04c8c82 staging: rtl8723bs: Fix access-point mode deadlock
    ab5595b45f73 fuse: fix pipe buffer lifetime for direct_io
    f2c52a4baf56 ARM: Spectre-BHB: provide empty stub for non-config
    f1f5d089fcc6 selftests/memfd: clean up mapping in mfd_fail_write
    71013d071b50 selftest/vm: fix map_fixed_noreplace test failure
    8d276f10e84a tracing: Ensure trace buffer is at least 4096 bytes large
    ae7597b47dda ipv6: prevent a possible race condition with lifetimes
    8c0c50e9fcff Revert "xen-netback: Check for hotplug-status existence before watching"
    625c04b523ca Revert "xen-netback: remove 'hotplug-status' once it has served its purpose"
    a0e2768fb901 gpio: Return EPROBE_DEFER if gc->to_irq is NULL
    65d4e9d130fb hwmon: (pmbus) Clear pmbus fault/warning bits after read
    d15c9f6e3335 net-sysfs: add check for netdevice being present to speed_show
    8c023c303978 spi: rockchip: terminate dma transmission when slave abort
    889254f98e99 spi: rockchip: Fix error in getting num-cs property
    4fb9be675be8 selftests/bpf: Add test for bpf_timer overwriting crash
    dc1c2b47b539 net: bcmgenet: Don't claim WOL when its not available
    b7e4d9ba2ddb sctp: fix kernel-infoleak for SCTP sockets
    3cf533f12001 net: phy: DP83822: clear MISR2 register to disable interrupts
    21044e679ed5 gianfar: ethtool: Fix refcount leak in gfar_get_ts_info
    3a4cd1c51eea gpio: ts4900: Do not set DAT and OE together
    7702e7e9e396 selftests: pmtu.sh: Kill tcpdump processes launched by subshell.
    2b1c85f56512 NFC: port100: fix use-after-free in port100_send_complete
    1fdabf2cf42b net/mlx5e: Lag, Only handle events from highest priority multipath entry
    f3331bc17449 net/mlx5: Fix a race on command flush flow
    5f1340963b11 net/mlx5: Fix size field in bufferx_reg struct
    e2201ef32f93 ax25: Fix NULL pointer dereference in ax25_kill_by_device
    cc7679079c7e net: ethernet: lpc_eth: Handle error for clk_enable
    b3e4fcb53921 net: ethernet: ti: cpts: Handle error for clk_enable
    5e42f90d7220 tipc: fix incorrect order of state message data sanity check
    979b418b96e3 ethernet: Fix error handling in xemaclite_of_probe
    506d61bc1b50 ice: Fix curr_link_speed advertised speed
    852a9e97d396 ice: Rename a couple of variables
    b21ffd5469a9 ice: Remove unnecessary checker loop
    875967aff5a6 ice: Align macro names to the specification
    8c613f7cd3ca ice: stop disabling VFs due to PF error responses
    d9ee2cbff2e9 i40e: stop disabling VFs due to PF error responses
    965070a2b71d ARM: dts: aspeed: Fix AST2600 quad spi group
    96b01b854151 net: dsa: mt7530: fix incorrect test in mt753x_phylink_validate()
    ed5bb00d8604 drm/sun4i: mixer: Fix P010 and P210 format numbers
    93223495bce5 qed: return status of qed_iov_get_link
    5bee2ed0508b esp: Fix BEET mode inter address family tunneling on GSO
    16386479ef59 net: qlogic: check the return value of dma_alloc_coherent() in qed_vf_hw_prepare()
    33c74f808596 isdn: hfcpci: check the return value of dma_set_mask() in setup_hw()
    cca9d5035bd0 virtio-blk: Don't use MAX_DISCARD_SEGMENTS if max_discard_seg is zero
    a3d5fcc6cf2e mISDN: Fix memory leak in dsp_pipeline_build()
    f97ad179d12f mISDN: Remove obsolete PIPELINE_DEBUG debugging information
    2de76d37d4a6 tipc: fix kernel panic when enabling bearer
    ea3a5e6df512 arm64: dts: armada-3720-turris-mox: Add missing ethernet0 alias
    2c6a75ea32f9 HID: vivaldi: fix sysfs attributes leak
    2a18a38cbc3b clk: qcom: gdsc: Add support to update GDSC transition delay
    0d6882dd158e ARM: boot: dts: bcm2711: Fix HVS register range
    67c781d938b8 Linux 5.10.105
    561e91e5fee8 Revert "ACPI: PM: s2idle: Cancel wakeup before dispatching EC GPE"
    206c8e271ba2 xen/netfront: react properly to failing gnttab_end_foreign_access_ref()
    39c00d09286c xen/gnttab: fix gnttab_end_foreign_access() without page specified
    c4b16486d602 xen/pvcalls: use alloc/free_pages_exact()
    8357d75bfdb8 xen/9p: use alloc/free_pages_exact()
    17f01b7206af xen: remove gnttab_query_foreign_access()
    5f36ae75b847 xen/gntalloc: don't use gnttab_query_foreign_access()
    304725518277 xen/scsifront: don't use gnttab_query_foreign_access() for mapped status
    f6690dd9446a xen/netfront: don't use gnttab_query_foreign_access() for mapped status
    96219af4e504 xen/blkfront: don't use gnttab_query_foreign_access() for mapped status
    3d81e85f30a8 xen/grant-table: add gnttab_try_end_foreign_access()
    5c600371b8fd xen/xenbus: don't let xenbus_grant_ring() remove grants in error case
    90f59cc2f2cc ARM: fix build warning in proc-v7-bugs.c
    8c4192d126ba ARM: Do not use NOCROSSREFS directive with ld.lld
    1749b553d73b ARM: fix co-processor register typo
    a330601c637b ARM: fix build error when BPF_SYSCALL is disabled
    b65b87e718c3 arm64: proton-pack: Include unprivileged eBPF status in Spectre v2 mitigation reporting
    551717cf3b58 arm64: Use the clearbhb instruction in mitigations
    38c26bdb3cc5 KVM: arm64: Allow SMCCC_ARCH_WORKAROUND_3 to be discovered and migrated
    e192c8baa69a arm64: Mitigate spectre style branch history side channels
    192023e6baf7 KVM: arm64: Allow indirect vectors to be used without SPECTRE_V3A
    13a807a0a080 arm64: proton-pack: Report Spectre-BHB vulnerabilities as part of Spectre-v2
    1f63326a5211 arm64: Add percpu vectors for EL1
    56cf5326bdf9 arm64: entry: Add macro for reading symbol addresses from the trampoline
    3f21b7e35523 arm64: entry: Add vectors that have the bhb mitigation sequences
    49379552969a arm64: entry: Add non-kpti __bp_harden_el1_vectors for mitigations
    26211252c1c1 arm64: entry: Allow the trampoline text to occupy multiple pages
    73ee716a1f63 arm64: entry: Make the kpti trampoline's kpti sequence optional
    8c691e5308c5 arm64: entry: Move trampoline macros out of ifdef'd section
    e55025063276 arm64: entry: Don't assume tramp_vectors is the start of the vectors
    5275fb5ea5f5 arm64: entry: Allow tramp_alias to access symbols after the 4K boundary
    bda89602814c arm64: entry: Move the trampoline data page before the text page
    d93b25a66548 arm64: entry: Free up another register on kpti's tramp_exit path
    5242d6971e10 arm64: entry: Make the trampoline cleanup optional
    7048a21086fb arm64: spectre: Rename spectre_v4_patch_fw_mitigation_conduit
    dc5b630c0d53 arm64: entry.S: Add ventry overflow sanity checks
    97d8bdf33182 arm64: cpufeature: add HWCAP for FEAT_RPRES
    162aa002ec1a arm64: cpufeature: add HWCAP for FEAT_AFP
    dbcfa9853953 arm64: add ID_AA64ISAR2_EL1 sys register
    7ae8127e4123 arm64: Add HWCAP for self-synchronising virtual counter
    b19eaa004f2e arm64: Add Cortex-A510 CPU part definition
    86171569312b arm64: Add Cortex-X2 CPU part definition
    fc8070a9c5ad arm64: Add Neoverse-N2, Cortex-A710 CPU part definition
    f3c12fc53e0a arm64: cputype: Add CPU implementor & types for the Apple M1 cores
    302754d023a0 ARM: include unprivileged BPF status in Spectre V2 reporting
    3f9c958e3572 ARM: Spectre-BHB workaround
    29d9b56df1e1 ARM: use LOADADDR() to get load address of sections
    46deb224680b ARM: early traps initialisation
    b7f1e73c4ddf ARM: report Spectre v2 status through sysfs
    d04937ae9490 x86/speculation: Warn about eIBRS + LFENCE + Unprivileged eBPF + SMT
    cc9e3e55bde7 x86/speculation: Warn about Spectre v2 LFENCE mitigation
    e335384560d1 x86/speculation: Update link to AMD speculation whitepaper
    2fdf67a1d215 x86/speculation: Use generic retpoline by default on AMD
    afc2d635b5e1 x86/speculation: Include unprivileged eBPF status in Spectre v2 mitigation reporting
    071e8b69d780 Documentation/hw-vuln: Update spectre doc
    a6a119d647ad x86/speculation: Add eIBRS + Retpoline options
    f38774bb6e23 x86/speculation: Rename RETPOLINE_AMD to RETPOLINE_LFENCE
    206cfe2dac3e x86,bugs: Unconditionally allow spectre_v2=retpoline,amd
    97581b56b59f Linux 5.10.104
    dbbe09d95377 hamradio: fix macro redefine warning
    dcd03efd7e8d Revert "xfrm: xfrm_state_mtu should return at least 1280 for ipv6"
    292e1c88b8a5 btrfs: add missing run of delayed items after unlink during log replay
    41712c5fa518 btrfs: qgroup: fix deadlock between rescan worker and remove qgroup
    6e0319e77083 btrfs: fix lost prealloc extents beyond eof after full fsync
    827172ffa999 tracing: Fix return value of __setup handlers
    78059b1cfcd9 tracing/histogram: Fix sorting on old "cpu" value
    0e188fde82d7 HID: add mapping for KEY_ALL_APPLICATIONS
    f276ea5035aa HID: add mapping for KEY_DICTATE
    3b8f2a7aed80 Input: samsung-keypad - properly state IOMEM dependency
    a621ae6394ce Input: elan_i2c - fix regulator enable count imbalance after suspend/resume
    1397bbcd817f Input: elan_i2c - move regulator_[en|dis]able() out of elan_[en|dis]able_power()
    988f4f29cc44 net: dcb: disable softirqs in dcbnl_flush_dev()
    6828da5dea53 drm/amdgpu: fix suspend/resume hang regression
    f5e496ef73f3 nl80211: Handle nla_memdup failures in handle_nan_filter
    64e4305a03d0 iavf: Refactor iavf state machine tracking
    e6bc597fbcb2 net: chelsio: cxgb3: check the return value of pci_find_capability()
    320980b2496d ibmvnic: complete init_done on transport events
    86027004bb9d ARM: tegra: Move panels to AUX bus
    fbb810825aff soc: fsl: qe: Check of ioremap return value
    2824f6939e26 soc: fsl: guts: Add a missing memory allocation failure check
    3afe488d5c9c soc: fsl: guts: Revert commit 3c0d64e867ed
    44709130793b ARM: dts: Use 32KiHz oscillator on devkit8000
    298f6fae544f ARM: dts: switch timer config to common devkit8000 devicetree
    8b20c1999d3a s390/extable: fix exception table sorting
    49aa9c9c7fa7 memfd: fix F_SEAL_WRITE after shmem huge page allocated
    6acbc8875282 ibmvnic: free reset-work-item when flushing
    9d8a11d74de5 igc: igc_write_phy_reg_gpy: drop premature return
    223744f52133 pinctrl: sunxi: Use unique lockdep classes for IRQs
    2851b76e5fd0 selftests: mlxsw: tc_police_scale: Make test more robust
    85bf489c5c01 ARM: 9182/1: mmu: fix returns from early_param() and __setup() functions
    6b6341049086 ARM: Fix kgdb breakpoint for Thumb2
    fefe4cb4a640 igc: igc_read_phy_reg_gpy: drop premature return
    0632854fb171 arm64: dts: rockchip: Switch RK3399-Gru DP to SPDIF output
    43eaf1b17845 can: gs_usb: change active_channels's type from atomic_t to u8
    daaed6ced88c ASoC: cs4265: Fix the duplicated control name
    8b8ac465bf52 firmware: arm_scmi: Remove space in MODULE_ALIAS name
    667df6fe3ece efivars: Respect "block" flag in efivar_entry_set_safe()
    283c37e5429e ixgbe: xsk: change !netif_carrier_ok() handling in ixgbe_xmit_zc()
    5f394102ee27 net: arcnet: com20020: Fix null-ptr-deref in com20020pci_probe()
    92b791771abd ibmvnic: register netdev after init of adapter
    6e0f986032c5 net: sxgbe: fix return value of __setup handler
    e1a82db1ebaf iavf: Fix missing check for running netdev
    c9a066fe4593 mac80211: treat some SAE auth steps as final
    e6d7f57f919f net: stmmac: fix return value of __setup handler
    fa65989a4867 mac80211: fix forwarded mesh frames AC & queue selection
    dcc3423c1dca ia64: ensure proper NUMA distance and possible map initialization
    1312ef5ad0a5 sched/topology: Fix sched_domain_topology_level alloc in sched_init_numa()
    d753aecb3d4b sched/topology: Make sched_init_numa() use a set for the deduplicating sort
    05ae1f0fe9c6 ice: fix concurrent reset and removal of VFs
    41edeeaae51a ice: Fix race conditions between virtchnl handling and VF ndo ops
    0c145262ac99 rcu/nocb: Fix missed nocb_timer requeue
    9bb7237cc740 net/smc: fix unexpected SMC_CLC_DECL_ERR_REGRMB error cause by server
    d7eb662625eb net/smc: fix unexpected SMC_CLC_DECL_ERR_REGRMB error generated by client
    2e8d465b83db net/smc: fix connection leak
    6a8a4dc2a279 net: dcb: flush lingering app table entries for unregistered devices
    f4c63b24dea9 net: ipv6: ensure we call ipv6_mc_down() at most once
    a9c4a74ad5ae batman-adv: Don't expect inter-netns unique iflink indices
    3dae11d21fc8 batman-adv: Request iflink once in batadv_get_real_netdevice
    dcf10d78ff2c batman-adv: Request iflink once in batadv-on-batadv check
    81f817f3e559 netfilter: nf_queue: handle socket prefetch
    4d05239203fa netfilter: nf_queue: fix possible use-after-free
    3b9ba964f77c netfilter: nf_queue: don't assume sk is full socket
    4e178ed14bda net: fix up skbs delta_truesize in UDP GRO frag_list
    eb5e444fe37d e1000e: Correct NVM checksum verification flow
    b53d4bfd1a68 xfrm: enforce validity of offload input flags
    2f0e6d80e8b5 xfrm: fix the if_id check in changelink
    24efaae03b0d bpf, sockmap: Do not ignore orig_len parameter
    8b0142c4143c netfilter: fix use-after-free in __nf_register_net_hook()
    4952faa77d8d xfrm: fix MTU regression
    e93f2be33d4f mm: Consider __GFP_NOWARN flag for oversized kvmalloc() calls
    912186db092c ntb: intel: fix port config status offset for SPR
    1c0b51e62a50 thermal: core: Fix TZ_GET_TRIP NULL pointer dereference
    a1753d5c29a6 xen/netfront: destroy queues before real_num_tx_queues is zeroed
    ce41d8039196 drm/i915: s/JSP2/ICP2/ PCH
    61a895da4844 iommu/amd: Recover from event log overflow
    6951a5888165 ASoC: ops: Shift tested values in snd_soc_put_volsw() by +min
    dd9dd24fd7cb riscv: Fix config KASAN && DEBUG_VIRTUAL
    7211aab2881b riscv: Fix config KASAN && SPARSEMEM && !SPARSE_VMEMMAP
    00fb385f0ac4 riscv/efi_stub: Fix get_boot_hartid_from_fdt() return value
    336872601cb8 ALSA: intel_hdmi: Fix reference to PCM buffer address
    e57dfaf66f2b tracing: Add ustring operation to filtering string pointers
    4a9d2390f3e2 drm/amdgpu: check vm ready by amdgpu_vm->evicting flag
    67e25eb1b474 ata: pata_hpt37x: fix PCI clock detection
    335f11ff74f2 serial: stm32: prevent TDR register overwrite when sending x_char
    c999c5927e96 tracing: Add test for user space strings when filtering on string pointers
    db36a94ed66b exfat: fix i_blocks for files truncated over 4 GiB
    1b810d5cb6ce exfat: reuse exfat_inode_info variable instead of calling EXFAT_I()
    fdd64084e405 usb: gadget: clear related members when goto fail
    c13159a58881 usb: gadget: don't release an existing dev->buf
    00d5ac05af3a net: usb: cdc_mbim: avoid altsetting toggling for Telit FN990
    16f903afbafb i2c: qup: allow COMPILE_TEST
    57c333ad8c28 i2c: cadence: allow COMPILE_TEST
    9d6285e63241 dmaengine: shdma: Fix runtime PM imbalance on error
    37b06d5ebf5c selftests/seccomp: Fix seccomp failure by adding missing headers
    df9db1a2af37 cifs: fix double free race when mount fails in cifs_get_root()
    e3850e211df6 tipc: fix a bit overflow in tipc_crypto_key_rcv()
    6d4985b8a0bf KVM: arm64: vgic: Read HW interrupt pending state from the HW
    5d4b00e053fc Input: clear BTN_RIGHT/MIDDLE on buttonpads
    6e7015d982ee regulator: core: fix false positive in regulator_late_cleanup()
    467d664e5fff ASoC: rt5682: do not block workqueue if card is unbound
    0b050b7a0d73 ASoC: rt5668: do not block workqueue if card is unbound
    11956c6eeb5a i2c: bcm2835: Avoid clock stretching timeouts
    13f0ea8d1193 mac80211_hwsim: initialize ieee80211_tx_info at hw_scan_work
    46f6d66219b5 mac80211_hwsim: report NOACK frames in tx_status

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 1e600731a459c1dfe14032e5242806a25f091b41)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index a11d0515e3..50e6a9f1e2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "48b12b48c1103b811263aaed4d81bfb8b24fdfc4"
-SRCREV_meta ?= "cec5f94cd2090d98b2dcfeee7a4258ae6adce506"
+SRCREV_machine ?= "7f96d3fd60eea0ab38afdf07b3fc7c8c9f501802"
+SRCREV_meta ?= "24ab54209a8822aad92afe2c51ea5b95f5175394"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.103"
+LINUX_VERSION ?= "5.10.107"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 5365301045..8f22c89165 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.103"
+LINUX_VERSION ?= "5.10.107"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "3c9683e7166044d91c0ef900491f2f881a8bd6b7"
-SRCREV_machine ?= "7f3e78220d6510de21d74e3f330f1f93cb635745"
-SRCREV_meta ?= "cec5f94cd2090d98b2dcfeee7a4258ae6adce506"
+SRCREV_machine_qemuarm ?= "d47f1b40f2f77d0c810defd853c69eb39cb84bf5"
+SRCREV_machine ?= "1ae0844c6a36151066744e43fd30db3a946bc21d"
+SRCREV_meta ?= "24ab54209a8822aad92afe2c51ea5b95f5175394"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 64dbdc826a..5ce504812f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ed7ac660431f6eb29add763876d7a10b6a6e539e"
-SRCREV_machine_qemuarm64 ?= "9ca22664eb7cd86b7c91770bdaa1c5581a081938"
-SRCREV_machine_qemumips ?= "4d5c2b576ee19c6ede626f2ffdb6a96d06ddd065"
-SRCREV_machine_qemuppc ?= "54e5ceedcce6039a0479eaeea000e3c42cf4e4bc"
-SRCREV_machine_qemuriscv64 ?= "0370165abaa08fa66808c54ed345eb70a558268b"
-SRCREV_machine_qemuriscv32 ?= "0370165abaa08fa66808c54ed345eb70a558268b"
-SRCREV_machine_qemux86 ?= "0370165abaa08fa66808c54ed345eb70a558268b"
-SRCREV_machine_qemux86-64 ?= "0370165abaa08fa66808c54ed345eb70a558268b"
-SRCREV_machine_qemumips64 ?= "012ce81097a4d2d94a7d5cb596fb4ad7d8f438f1"
-SRCREV_machine ?= "0370165abaa08fa66808c54ed345eb70a558268b"
-SRCREV_meta ?= "cec5f94cd2090d98b2dcfeee7a4258ae6adce506"
+SRCREV_machine_qemuarm ?= "2ef8231651bb6a4c79b307f59a794b92238546ec"
+SRCREV_machine_qemuarm64 ?= "00684b441f15d202c5849eed164a9b3b94a5c1e8"
+SRCREV_machine_qemumips ?= "661a4f517906253e074fe301d68ff1e6b6968e9f"
+SRCREV_machine_qemuppc ?= "bff933cb7a11019c64e6034c48ab79453f75b99e"
+SRCREV_machine_qemuriscv64 ?= "763c0dbc0458ebcb1d06afe2f324925f0f61bd27"
+SRCREV_machine_qemuriscv32 ?= "763c0dbc0458ebcb1d06afe2f324925f0f61bd27"
+SRCREV_machine_qemux86 ?= "763c0dbc0458ebcb1d06afe2f324925f0f61bd27"
+SRCREV_machine_qemux86-64 ?= "763c0dbc0458ebcb1d06afe2f324925f0f61bd27"
+SRCREV_machine_qemumips64 ?= "7a89b456542ff1fa0ab71fa4a2ae6f04281f3a2d"
+SRCREV_machine ?= "763c0dbc0458ebcb1d06afe2f324925f0f61bd27"
+SRCREV_meta ?= "24ab54209a8822aad92afe2c51ea5b95f5175394"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.103"
+LINUX_VERSION ?= "5.10.107"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.35.1


