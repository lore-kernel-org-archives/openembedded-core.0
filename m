Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D312C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 17:20:10 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.13116.1647969609437467888
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ojK8QeUr;
 spf=pass (domain: gmail.com, ip: 209.85.219.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id gi14so3338238qvb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=61GLzhKSYaGzvF/qY2bWp1ozETXXulkLeJbG/o25cQg=;
        b=ojK8QeUryqVNvS1O4pYJ+z0PUvnq/4ppQNOhqcZbZEpy9nIHTiCLjKjLTNAlX9Rpx0
         WLj/kRupJXDw/D41ZSRh6lDZsNHNUklz+apY/lsEqWiCud9gBxn5z0Kz8nlvKtU6/k0L
         VIX2oMC/OjhgrjAsJX/PgmAZbe6pvOkfnyh3mkx2I852jUZ4rbfBY8wWlfwCAAOeZ89w
         veoPKxbbzCIdlenfiOsXkRoTZ5p98Kl7AFYFgu0JWLjTjvKpvJRT22eznlmhJYVABli/
         4pez6uYJmNhjLgCxTwFEmvXMVhRs0l7adLaQds+WgoVzc7Z78sODTTF8mR5CsDnRbPfe
         U6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=61GLzhKSYaGzvF/qY2bWp1ozETXXulkLeJbG/o25cQg=;
        b=3I6XGKCcJDqIosNS0mLQmBtz37mQPVzjxV5+xsxLNExU53FzcYrnx3mRy9mkcMSgrG
         K5QzIWdc1rvqKbIQP/bPI5I8vNyvDp/CcpuL/2DTRzmN1+b7yZ+K3omE5GPZl7bwRmNj
         veUW4opUXeefg+tcbqC4Ah3DY1+SI/PYSt+qzZxZqTNt9V3DRY+VgVh7zH5MjpiBdVBF
         p6ec5YAIQ0AmafyWm1RsncOjeLHGsj7CnaEQamwLjBamyOw5n6SDHxnNjtfCoomIRsuM
         H1YPdkv00EmvRc6c234xUlTNYDp5ey3R4z0fwGOL7Ch6QR4QNpNX6jtiG6bGBPNewwQ+
         E/zA==
X-Gm-Message-State: AOAM533YYCEi2jTj/nEE1nnnmjnTy/OmdWYC+tfQkPgSllXr0DPxHAQX
	UcyWo/w0Ehoe7w/UPGLbTMdZGYQizy0P+g==
X-Google-Smtp-Source: 
 ABdhPJxqoJ+Mgr4TOtdDxv2NzGU9tvuf5DBS9ESJCtSPTCWOBYqaSg6kHeCNgTrdnwsuHk40RRLfnQ==
X-Received: by 2002:a05:6214:4104:b0:42c:1db0:da28 with SMTP id
 kc4-20020a056214410400b0042c1db0da28mr20743552qvb.67.1647969608262;
        Tue, 22 Mar 2022 10:20:08 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 q8-20020a05622a04c800b002e06d7c1eabsm14019648qtx.16.2022.03.22.10.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 10:20:07 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/10] linux-yocto/5.15: update to v5.15.27
Date: Tue, 22 Mar 2022 13:19:55 -0400
Message-Id: 
 <0bfe5efbd3afaf45c844655f2a6af36bf499e6f4.1647969481.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1647969481.git.bruce.ashfield@gmail.com>
References: <cover.1647969481.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 17:20:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163563

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    efe3167e52a5 Linux 5.15.27
    ea2bc310250d hamradio: fix macro redefine warning
    8998aa676205 KVM: x86/mmu: Passing up the error state of mmu_alloc_shadow_roots()
    416e3a0e4276 proc: fix documentation and description of pagemap
    8b893496892e Revert "xfrm: xfrm_state_mtu should return at least 1280 for ipv6"
    6599d5e8bd75 btrfs: do not start relocation until in progress drops are done
    4aef4c900597 btrfs: add missing run of delayed items after unlink during log replay
    34146bbadcdd btrfs: qgroup: fix deadlock between rescan worker and remove qgroup
    e00077aa439f btrfs: do not WARN_ON() if we have PageError set
    725a6ac389b1 btrfs: fix relocation crash due to premature return from btrfs_commit_transaction()
    5342e9f3dac0 btrfs: fix lost prealloc extents beyond eof after full fsync
    80660a726d47 tracing: Fix return value of __setup handlers
    452f64ee0940 tracing/histogram: Fix sorting on old "cpu" value
    aa6d3eef28f3 HID: add mapping for KEY_ALL_APPLICATIONS
    b355d6a14ba7 HID: add mapping for KEY_DICTATE
    74e9545d9e25 Input: samsung-keypad - properly state IOMEM dependency
    cb19f03e5f65 Input: elan_i2c - fix regulator enable count imbalance after suspend/resume
    f74fc94691f0 Input: elan_i2c - move regulator_[en|dis]able() out of elan_[en|dis]able_power()
    7a1ee9934b14 MAINTAINERS: adjust file entry for of_net.c after movement
    7626ab3a3897 iavf: missing unlocks in iavf_watchdog_task()
    d784113217f9 iavf: do not override the adapter state in the watchdog task (again)
    d61f3737c559 net: stmmac: perserve TX and RX coalesce value during XDP setup
    d666d3363845 selftests: mlxsw: resource_scale: Fix return value
    6fe3127d3af1 net: dcb: disable softirqs in dcbnl_flush_dev()
    46eed3a37dee drm/amdgpu: fix suspend/resume hang regression
    a1e603e5f3b2 nl80211: Handle nla_memdup failures in handle_nan_filter
    a30496660634 MIPS: ralink: mt7621: use bitwise NOT instead of logical
    68c4fe2ef0bf e1000e: Fix possible HW unit hang after an s0ix exit
    9dfe6abc6c13 drm/bridge: ti-sn65dsi86: Properly undo autosuspend
    d675c05b792e drm/i915/guc/slpc: Correct the param count for unset param
    6f62bc0fc12b iavf: Fix __IAVF_RESETTING state usage
    598bc8955916 iavf: Fix race in init state
    ddc5db0bcfa2 iavf: Fix locking for VIRTCHNL_OP_GET_OFFLOAD_VLAN_V2_CAPS
    8c0e4da63385 iavf: Fix init state closure on remove
    85aa76066fef iavf: Add waiting so the port is initialized in remove
    e734c794dea3 iavf: Fix kernel BUG in free_msi_irqs
    200366d1a583 iavf: Add helper function to go from pci_dev to adapter
    23901462c301 iavf: Rework mutexes for better synchronisation
    9fedc4f86ee3 iavf: Add trace while removing device
    b4e0e00a361d iavf: Combine init and watchdog state machines
    57d2f0db2e63 iavf: Add __IAVF_INIT_FAILED state
    7e2d102501e1 iavf: Refactor iavf state machine tracking
    f8ce435f2c81 net: sparx5: Fix add vlan when invalid operation
    50948cea504c net: chelsio: cxgb3: check the return value of pci_find_capability()
    ea3d3c36a4fa ibmvnic: complete init_done on transport events
    13e3b51ffaf8 ibmvnic: define flush_reset_queue helper
    046d933c1b74 ibmvnic: initialize rc before completing wait
    bb20939bc8d1 net: stmmac: only enable DMA interrupts when ready
    e753b639363d net: stmmac: enhance XDP ZC driver level switching performance
    8cdac518eac7 can: etas_es58x: change opened_channel_cnt's type from atomic_t to u8
    04746dbd9593 ARM: tegra: Move panels to AUX bus
    9920d99cc89a netfilter: nf_tables: prefer kfree_rcu(ptr, rcu) variant
    4ed52fbeb967 soc: fsl: qe: Check of ioremap return value
    c2266d20251c soc: fsl: guts: Add a missing memory allocation failure check
    20ff0ff315cd soc: fsl: guts: Revert commit 3c0d64e867ed
    40d763efa5bf ARM: dts: Use 32KiHz oscillator on devkit8000
    50bce7f03e8c ARM: dts: switch timer config to common devkit8000 devicetree
    af143626eb85 MIPS: ralink: mt7621: do memory detection on KSEG1
    378e2fe1eb58 iommu/amd: Fix I/O page table memory leak
    f6cabb721c5b arm64: dts: juno: Remove GICv2m dma-range
    3411613611a5 sched: Fix yet more sched_fork() races
    3d76a995f646 s390/extable: fix exception table sorting
    b7c35587be23 memfd: fix F_SEAL_WRITE after shmem huge page allocated
    39738a2346b2 ibmvnic: free reset-work-item when flushing
    d4706de93cf7 igc: igc_write_phy_reg_gpy: drop premature return
    896d1b8a3612 pinctrl: sunxi: Use unique lockdep classes for IRQs
    09423ff81601 selftests: mlxsw: tc_police_scale: Make test more robust
    0c3f34beb459 mptcp: Correctly set DATA_FIN timeout when number of retransmits is large
    d7a4b54f4fc5 ARM: 9182/1: mmu: fix returns from early_param() and __setup() functions
    a664bd7a0084 mips: setup: fix setnocoherentio() boolean setting
    f14a0244b1ba ARM: Fix kgdb breakpoint for Thumb2
    c9cfcdd111d7 igc: igc_read_phy_reg_gpy: drop premature return
    7c1db4a30e29 arm64: dts: rockchip: Switch RK3399-Gru DP to SPDIF output
    6be5b626bec1 iommu/tegra-smmu: Fix missing put_device() call in tegra_smmu_find
    2b04bb51a9c1 can: gs_usb: change active_channels's type from atomic_t to u8
    b6149efc57bf auxdisplay: lcd2s: Use proper API to free the instance of charlcd object
    5d53cd33f425 auxdisplay: lcd2s: Fix memory leak in ->remove()
    6d6c139d1e2d ASoC: cs4265: Fix the duplicated control name
    d442f20e6daf firmware: arm_scmi: Remove space in MODULE_ALIAS name
    f9c3aa939c41 auxdisplay: lcd2s: Fix lcd2s_redefine_char() feature
    4efa386ef9e1 efivars: Respect "block" flag in efivar_entry_set_safe()
    61a303971c3c iavf: Fix deadlock in iavf_reset_task
    366f785bbba4 ixgbe: xsk: change !netif_carrier_ok() handling in ixgbe_xmit_zc()
    ea372aab5490 net: arcnet: com20020: Fix null-ptr-deref in com20020pci_probe()
    1c09774e5ea1 ibmvnic: register netdev after init of adapter
    f58ead21dd6a net: sxgbe: fix return value of __setup handler
    23a6be260d56 iavf: Fix missing check for running netdev
    a83ebad95542 mac80211: treat some SAE auth steps as final
    b85dd0d7a503 net: stmmac: fix return value of __setup handler
    828f75c24ab8 mac80211: fix forwarded mesh frames AC & queue selection
    5afd80c393f4 btrfs: fix ENOSPC failure when attempting direct IO write into NOCOW range
    15cbeeaada70 net/smc: fix unexpected SMC_CLC_DECL_ERR_REGRMB error cause by server
    21922d9cde88 net/smc: fix unexpected SMC_CLC_DECL_ERR_REGRMB error generated by client
    80895b6f9154 net/smc: fix connection leak
    a559e0598ce6 net: ipa: add an interconnect dependency
    4daaf8816d60 net: dcb: flush lingering app table entries for unregistered devices
    b11781515208 net: ipv6: ensure we call ipv6_mc_down() at most once
    24e49e17cbfc batman-adv: Don't expect inter-netns unique iflink indices
    94355d99ad70 batman-adv: Request iflink once in batadv_get_real_netdevice
    58ea33965a6f batman-adv: Request iflink once in batadv-on-batadv check
    216f3cb587e0 netfilter: nf_queue: handle socket prefetch
    dd648bd1b33a netfilter: nf_queue: fix possible use-after-free
    63291e95e8ae netfilter: nf_queue: don't assume sk is full socket
    3a65b82b1ef2 net: fix up skbs delta_truesize in UDP GRO frag_list
    a47e7ac8851c e1000e: Correct NVM checksum verification flow
    4020d2e14f13 xfrm: enforce validity of offload input flags
    ce0d6bf33c35 xfrm: fix the if_id check in changelink
    00c74b587197 bpf, sockmap: Do not ignore orig_len parameter
    bd61f192a339 netfilter: fix use-after-free in __nf_register_net_hook()
    75cbedd33343 xfrm: fix MTU regression
    261eff11ade9 mm: Consider __GFP_NOWARN flag for oversized kvmalloc() calls
    5d7c23d39660 ntb: intel: fix port config status offset for SPR
    78acc7dbd84a blktrace: fix use after free for struct blk_trace
    5f298bf7f337 mac80211: fix EAPoL rekey fail in 802.3 rx path
    3dafbf915c05 thermal: core: Fix TZ_GET_TRIP NULL pointer dereference
    a63eb1e4a2e1 xen/netfront: destroy queues before real_num_tx_queues is zeroed
    dab06be16184 drm/amd/display: Reduce dmesg error to a debug print
    7508ac360d1e drm/i915: s/JSP2/ICP2/ PCH
    a8a86631f4ce iommu/amd: Recover from event log overflow
    2aaa085bd012 iommu/vt-d: Fix double list_add when enabling VMD in scalable mode
    050b1821f27c ASoC: ops: Shift tested values in snd_soc_put_volsw() by +min
    7de1ed755e1a iwlwifi: mvm: check debugfs_dir ptr before use
    728fb555882b riscv: Fix config KASAN && DEBUG_VIRTUAL
    08b22e3f150e riscv: Fix config KASAN && SPARSEMEM && !SPARSE_VMEMMAP
    e64d6a689ec5 riscv/efi_stub: Fix get_boot_hartid_from_fdt() return value
    6c3d4da8e7a9 ucounts: Fix systemd LimitNPROC with private users regression
    3eb418122d12 ALSA: intel_hdmi: Fix reference to PCM buffer address
    9285523b4174 net: of: fix stub of_net helpers for CONFIG_NET=n
    dc75d7968901 PCI: mvebu: Fix device enumeration regression
    35afd8ae1184 drm/amd/display: For vblank_disable_immediate, check PSR is really used
    5f283e64a850 bnxt_en: Fix occasional ethtool -t loopback test failures
    10dd26349edf drm/amd/display: Fix stream->link_enc unassigned during stream removal
    aa280c04da1b cifs: fix confusing unneeded warning message on smb2.1 and earlier
    3d74c2c917e4 cifs: protect session channel fields with chan_lock
    2594dba1cd79 drm/mediatek: mtk_dsi: Reset the dsi0 hardware
    f510d6463949 net: ethernet: litex: Add the dependency on HAS_IOMEM
    3a3aa0881aeb of: net: move of_net under net/
    960dfaf3b578 ibmvnic: don't release napi in __ibmvnic_open()
    1d13e7221035 net: dsa: seville: register the mdiobus under devres
    8bfa27186e29 net: dsa: ocelot: seville: utilize of_mdiobus_register
    68c8e6d16f57 gve: Recording rx queue before sending to napi
    5c66161cceaa drm/i915: Disable DRRS on IVB/HSW port != A
    e2b3d1bf6ec3 drm/i915/display: Move DRRS code its own file
    23eb29281f1e drm/i915/display: split out dpt out of intel_display.c
    fbf6d5f8eef7 riscv/mm: Add XIP_FIXUP for phys_ram_base
    86a337bb8030 drm: mxsfb: Fix NULL pointer dereference
    9bbeba67bbbd drm: mxsfb: Set fallback bus format when the bridge doesn't provide one
    ed4488d8307f drm/amd/display: Update watermark values for DCN301
    07058fb18df8 bpf: Fix possible race in inc_misses_counter
    aa5040691cb7 bpf: Use u64_stats_t in struct bpf_prog_stats
    82a82ad92746 net/mlx5e: IPsec: Fix crypto offload for non TCP/UDP encapsulated traffic
    748438b4e62c net/mlx5e: IPsec: Refactor checksum code in tx data path
    f1c0163bb824 octeontx2-af: Add KPU changes to parse NGIO as separate layer
    63138001c961 octeontx2-af: Adjust LA pointer for cpt parse header
    ab3380a844aa octeontx2-af: cn10k: Use appropriate register for LMAC enable
    fe3eafea3907 octeontx2-af: cn10k: RPM hardware timestamp configuration
    ef33ae74bb9c octeontx2-af: Reset PTP config in FLR handler
    75279de4e392 octeontx2-af: Optimize KPU1 processing for variable-length headers
    462c5e6cb241 ethtool: Fix link extended state for big endian
    27e01f10d183 drm/amd/display: move FPU associated DSC code to DML folder
    691c0030be65 drm/amd/display: Use adjusted DCN301 watermarks
    2157e509e5b2 drm/amdgpu: filter out radeon secondary ids as well
    f724a438d986 drm/amdgpu: filter out radeon PCI device IDs
    48cf33ee6b04 drm/amdgpu/display: Only set vblank_disable_immediate when PSR is not enabled
    3f20cf3cd43f hugetlbfs: fix off-by-one error in hugetlb_vmdelete_list()
    e9737301f0df selftests/vm: make charge_reserved_hugetlb.sh work with existing cgroup setting
    1123c2fb9dc3 kasan: fix quarantine conflicting with init_on_free
    f1675103e0f3 mm: defer kmemleak object creation of module_alloc()
    013c2af6c15c tracing/probes: check the return value of kstrndup() for pbuf
    8a20fed48eb4 tracing/uprobes: Check the return value of kstrdup() for tu->filename
    1a62246c2c60 dma-buf: cma_heap: Fix mutex locking section
    8654464086a1 i3c: master: dw: check return of dw_i3c_master_get_free_pos()
    a80b13642a10 drm/amdgpu: use spin_lock_irqsave to avoid deadlock by local interrupt
    5609b7803947 drm/amdkfd: Check for null pointer after calling kmemdup
    950d17f190a4 ntb_hw_switchtec: Fix bug with more than 32 partitions
    377cbdc92716 ntb_hw_switchtec: Fix pff ioread to read into mmio_part_cfg_all
    cd07b19fbf37 drm/atomic: Check new_crtc_state->active to determine if CRTC needs disable in self refresh mode
    1796d5350cb4 drm/sun4i: dw-hdmi: Fix missing put_device() call in sun8i_hdmi_phy_get
    e209742c13d2 SUNRPC: Fix sockaddr handling in svcsock_accept_class trace points
    bdaa8c7b7189 SUNRPC: Fix sockaddr handling in the svc_xprt_create_error trace point
    d3f67ceaeb3f drm/i915: don't call free_mmap_offset when purging
    e47679c06afc x86/hyperv: Properly deal with empty cpumasks in hyperv_flush_tlb_multi()
    4425ca3677a6 nfsd: fix crash on COPY_NOTIFY with special stateid
    0f84cfb465af Revert "nfsd: skip some unnecessary stats in the v4 case"
    3abe2a70f5b4 NFSD: Fix verifier returned in stable WRITEs
    e7c433270307 PCI: mvebu: Fix support for DEVCAP2, DEVCTL2 and LNKCTL2 registers on emulated bridge
    a24745673304 PCI: mvebu: Fix support for PCI_EXP_RTSTA on emulated bridge
    1d4200e28436 PCI: mvebu: Fix support for PCI_EXP_DEVCTL on emulated bridge
    1ea3f69784ed PCI: mvebu: Fix support for PCI_BRIDGE_CTL_BUS_RESET on emulated bridge
    9c91c755005b PCI: mvebu: Setup PCIe controller to Root Complex mode
    3d394fa375f4 PCI: mvebu: Fix configuring secondary bus of PCIe Root Port via emulated bridge
    4396c507a8f8 PCI: mvebu: Fix support for bus mastering and PCI_COMMAND on emulated bridge
    bc988b126134 PCI: mvebu: Do not modify PCI IO type bits in conf_write
    c1a027629c36 PCI: mvebu: Check for errors from pci_bridge_emul_init() call
    7c93c809e00a Input: ti_am335x_tsc - fix STEPCONFIG setup for Z2
    16ff93557d1e Input: ti_am335x_tsc - set ADCREFM for X configuration
    628761fe0588 tracing: Do not let synth_events block other dyn_event systems during create
    f35bacbb795a i3c/master/mipi-i3c-hci: Fix a potentially infinite loop in 'hci_dat_v1_get_index()'
    e5264d44f732 i3c: fix incorrect address slot lookup on 64-bit
    1adfbfaeb20d KVM: x86: Exit to userspace if emulation prepared a completion callback
    3d8468045e39 KVM: x86: Handle 32-bit wrap of EIP for EMULTYPE_SKIP with flat code seg
    00542cbacf22 KVM: X86: Ensure that dirty PDPTRs are loaded
    723053e16d55 KVM: VMX: Read Posted Interrupt "control" exactly once per loop iteration
    32b758d12c24 KVM: s390: Ensure kvm_arch_no_poll() is read once when blocking vCPU
    b63190d0203f KVM: VMX: Don't unblock vCPU w/ Posted IRQ if IRQs are disabled in guest
    f303196899f1 PCI: aardvark: Fix checking for MEM resource type
    a2f5e9a6f2a0 PCI: dwc: Do not remap invalid res
    d9fc43aab60d PCI: rcar: Check if device is runtime suspended instead of __clk_is_enabled()
    aa805236ed97 PCI: mediatek-gen3: Disable DVFSRC voltage request
    7f361266e981 signal: In get_signal test for signal_group_exit every time through the loop
    f98371d2ac83 MIPS: fix local_{add,sub}_return on MIPS64
    64b487be33b7 mtd: spi-nor: Fix mtd size for s3an flashes
    83ef63535a8a tools/resolve_btf_ids: Close ELF file on error
    1bd12b7aaee0 io_uring: fix no lock protection for ctx->cq_extra
    384d1b11382b NFSD: Fix zero-length NFSv3 WRITEs
    2de88544b3db NFSD: Have legacy NFSD WRITE decoders use xdr_stream_subsegment()
    771aca9bc707 ipv6: fix skb drops in igmp6_event_query() and igmp6_event_report()
    33e22b6c53d0 tracing: Add ustring operation to filtering string pointers
    a9c6e02d223e drm/amdgpu: check vm ready by amdgpu_vm->evicting flag
    b2a3068d5f15 ata: pata_hpt37x: fix PCI clock detection
    e0bcd6b57793 sched/fair: Fix fault in reweight_entity
    6f6ffc717b85 ext4: fast commit may miss file actions
    97abcfedc87c ext4: fast commit may not fallback for ineligible commit
    647b3f1533f4 ext4: simplify updating of fast commit stats
    5abb1d84b6db ext4: drop ineligible txn start stop APIs
    82a99bc85c0e serial: stm32: prevent TDR register overwrite when sending x_char
    1921d1fd0e60 arm64: Mark start_backtrace() notrace and NOKPROBE_SYMBOL
    60e6d58ef921 tracing: Add test for user space strings when filtering on string pointers
    c9f727219f3e exfat: fix i_blocks for files truncated over 4 GiB
    1ffc130388c5 exfat: reuse exfat_inode_info variable instead of calling EXFAT_I()
    ab3656acb7b4 usb: gadget: clear related members when goto fail
    07de9a494b5a usb: gadget: don't release an existing dev->buf
    a1ba98731518 block-map: add __GFP_ZERO flag for alloc_page in function bio_copy_kern
    1148adac7781 net: usb: cdc_mbim: avoid altsetting toggling for Telit FN990
    f6fbf18d156c i2c: qup: allow COMPILE_TEST
    d65d187b51b6 i2c: imx: allow COMPILE_TEST
    d2327116861c i2c: cadence: allow COMPILE_TEST
    7b22f63b933f dmaengine: shdma: Fix runtime PM imbalance on error
    7d0214c38dca selftests/ftrace: Do not trace do_softirq because of PREEMPT_RT
    4543426cd7b8 drm/amd/pm: correct UMD pstate clocks for Dimgrey Cavefish and Beige Goby
    b628fffce58a selftests/seccomp: Fix seccomp failure by adding missing headers
    54e7951a1988 cifs: modefromsids must add an ACE for authenticated users
    18a9d6b18c2b HID: amd_sfh: Add interrupt handler to process interrupts
    852b6b0411e6 HID: amd_sfh: Add functionality to clear interrupts
    8ba9a2e72584 HID: amd_sfh: Handle amd_sfh work buffer in PM ops
    546d60859ecf cifs: fix double free race when mount fails in cifs_get_root()
    ccf46cb68859 cifs: do not use uninitialized data in the owner/group sid
    5340a0924ea9 tipc: fix a bit overflow in tipc_crypto_key_rcv()
    1ccc12f2240a block: loop:use kstatfs.f_bsize of backing file to set discard granularity
    8694330db9b0 KVM: arm64: vgic: Read HW interrupt pending state from the HW
    850a77c999b8 btrfs: get rid of warning on transaction commit when using flushoncommit
    6279c5263ded Input: clear BTN_RIGHT/MIDDLE on buttonpads
    700485846e12 regulator: core: fix false positive in regulator_late_cleanup()
    fd64f8bc0644 ASoC: rt5682: do not block workqueue if card is unbound
    4235a04ad401 ASoC: rt5668: do not block workqueue if card is unbound
    2ed390555dbc i2c: bcm2835: Avoid clock stretching timeouts
    e03ad1915ccc mac80211_hwsim: initialize ieee80211_tx_info at hw_scan_work
    2d27a2bd381f mac80211_hwsim: report NOACK frames in tx_status

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 7a5dd89684..3ccd308bbf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5486de5bb7320876bbfe6f92245f6819afed182c"
-SRCREV_meta ?= "18436b6ebc61f77ab111a8daeafbdb3534613ee8"
+SRCREV_machine ?= "3a5aeefb2543901e06f3ad90b690c2c01e846a20"
+SRCREV_meta ?= "2f5c61a31c735701fdb4fb9615a31c43db40cf11"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.26"
+LINUX_VERSION ?= "5.15.27"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index b014b482b1..bd4cbf84f5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.26"
+LINUX_VERSION ?= "5.15.27"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "25cfdd5cd20eb874209ee632b8b4ed567686523b"
-SRCREV_machine ?= "e54b9d06bee4c182cb376d570017c7b425369f3a"
-SRCREV_meta ?= "18436b6ebc61f77ab111a8daeafbdb3534613ee8"
+SRCREV_machine:qemuarm ?= "06b3afe81676d7f706ff90a2eb01d19dc36bc365"
+SRCREV_machine ?= "f6607d246d44d674c15f4911140810c751a4def6"
+SRCREV_meta ?= "2f5c61a31c735701fdb4fb9615a31c43db40cf11"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 61885ffcdf..b754cb90f2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f68974a8286c17346ca33b50617eccdf1becd1aa"
-SRCREV_machine:qemuarm64 ?= "72bd53de75fa937660c2bd25931ffaa05086e990"
-SRCREV_machine:qemumips ?= "334923580808976e3e7497dedfeb065c0c1ea977"
-SRCREV_machine:qemuppc ?= "418dd4b6087d1a3a3e9dd47b4cae0dcda27867e5"
-SRCREV_machine:qemuriscv64 ?= "81bdce5b5876571ef092b0392fd56d4f754789b9"
-SRCREV_machine:qemuriscv32 ?= "81bdce5b5876571ef092b0392fd56d4f754789b9"
-SRCREV_machine:qemux86 ?= "81bdce5b5876571ef092b0392fd56d4f754789b9"
-SRCREV_machine:qemux86-64 ?= "81bdce5b5876571ef092b0392fd56d4f754789b9"
-SRCREV_machine:qemumips64 ?= "7b53697cddec0526e8c10f25e1a6c2bea7d240d2"
-SRCREV_machine ?= "81bdce5b5876571ef092b0392fd56d4f754789b9"
-SRCREV_meta ?= "18436b6ebc61f77ab111a8daeafbdb3534613ee8"
+SRCREV_machine:qemuarm ?= "97c2224cc9dc67dfbc1b42486046c34cef015365"
+SRCREV_machine:qemuarm64 ?= "c1855ad93c8de958c11563b7bdb083d169327468"
+SRCREV_machine:qemumips ?= "46d4a01ac6f017ce92cdb24e5bf916b57a6af9db"
+SRCREV_machine:qemuppc ?= "db0ff027bc782f6ae6d67f2ddcfc71d2ec1d31f2"
+SRCREV_machine:qemuriscv64 ?= "81b54a76d48d941632e36e1d68e53e07e5ba695a"
+SRCREV_machine:qemuriscv32 ?= "81b54a76d48d941632e36e1d68e53e07e5ba695a"
+SRCREV_machine:qemux86 ?= "81b54a76d48d941632e36e1d68e53e07e5ba695a"
+SRCREV_machine:qemux86-64 ?= "81b54a76d48d941632e36e1d68e53e07e5ba695a"
+SRCREV_machine:qemumips64 ?= "4ae738aae43cbee8798b4142bb7169b3794e2969"
+SRCREV_machine ?= "81b54a76d48d941632e36e1d68e53e07e5ba695a"
+SRCREV_meta ?= "2f5c61a31c735701fdb4fb9615a31c43db40cf11"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -41,7 +41,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.26"
+LINUX_VERSION ?= "5.15.27"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


