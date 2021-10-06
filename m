Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F63C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 00:12:55 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web12.5012.1633479174323035393
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 17:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B/zH0uYR;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id r16so828570qtw.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 17:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ISUR7EiV03+IckbTn40QNokr1X8EeJKxRfxL/jxESHw=;
        b=B/zH0uYRK9aBNY842J/sbGkUfLnQqNed2uharfhZ5nBW8WyS4zpBsYi1xamSdLuft0
         9NX3KUhjdNjgUQ37kDJiktd3fY0l+8v0FLQ37KZmsCiTGfbhFVaAETu11svNPQWvw4L0
         pMUFGJf3SA/FyCC1dJUOkxPPpJtrNBJtfsphZj7zid4xNwBHTf7mFQJuCyE5WECkqTBw
         ctfY0iGyID+qK3Z+z7k00Qua5vAlsXtC2/3w4+beir014ET6AMkm19UphSN/isA071MN
         bjMjsHspKOPnOPAse6fPmGPcepV+zGkLpeuOxMD1s04v6DuLuFWA7jKBjjM6OZRlc9aq
         nOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ISUR7EiV03+IckbTn40QNokr1X8EeJKxRfxL/jxESHw=;
        b=4YjZXUpKzKyw410sf+MVrsC9qNURvoNxSs3nHQW17lQfGlwi6Bq5Zoi9y8rsk4f4Z4
         0YLbFQ1zFBDx99fQAO8YG7zBVm9SHXdX3B1Pp5VyDEKRV+Xe8YKbxWyJwJpUsQmObndB
         661LHPw7Eot7F3ETQ4qMg+dVQrETtAN04A8dT+5b8WAlkM8mtcItWYBiC0HyHWrsU7zV
         1T1SWGHNtDvgZg414/7VfCIlA+vlbYzEYUq3osNrguBx29Cx/RSBS2JEA3/geXCl06cL
         TnqJvpZJCUQnd1LRdMBdbKGDVNepY6ME3BE2F4tNXbdQkTsf3dPGxQnJ6CmgAou6SsRZ
         rgvg==
X-Gm-Message-State: AOAM531ZsdaPcm51jm46M82Uks63mzu7P88tfpVjzCvMkvs0USUUFLlI
	rvXXsJc7QC/LJ0oRvEEpo7lBG5JcpNqt2Q==
X-Google-Smtp-Source: 
 ABdhPJzGQrEpw73dxIbVs8d9rDLaNcJkPbEpVwrSj6A7NAYFGc+TFGwVW/yMD1KNSUhhNvtZq+aAIw==
X-Received: by 2002:ac8:117:: with SMTP id e23mr5826927qtg.29.1633479171823;
        Tue, 05 Oct 2021 17:12:51 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 bk20sm11275922qkb.13.2021.10.05.17.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 17:12:51 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto/5.10: update to v5.10.69
Date: Tue,  5 Oct 2021 20:12:43 -0400
Message-Id: 
 <b721c8cc21626387394769a43633308ddaadb6f0.1633478971.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1633478971.git.bruce.ashfield@gmail.com>
References: <cover.1633478971.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 00:12:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156665

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    5f4196eaa90c Linux 5.10.69
    7c09505e9e6b drm/nouveau/nvkm: Replace -ENOSYS with -ENODEV
    83a3cb200eff sched/idle: Make the idle timer expire in hard interrupt context
    647c19bc6102 rtc: rx8010: select REGMAP_I2C
    9a14014df72d blk-mq: allow 4x BLK_MAX_REQUEST_COUNT at blk_plug for multiple_queues
    23dfb959c6cb blk-throttle: fix UAF by deleteing timer in blk_throtl_exit()
    a2551d0a29e9 pwm: stm32-lp: Don't modify HW state in .remove() callback
    a6a2b36a8cc4 pwm: rockchip: Don't modify HW state in .remove() callback
    0a2ea5c0e5d1 pwm: img: Don't modify HW state in .remove() callback
    db8838e48a0a habanalabs: add validity check for event ID received from F/W
    d7736e2faa13 nilfs2: fix memory leak in nilfs_sysfs_delete_snapshot_group
    0f36028d0133 nilfs2: fix memory leak in nilfs_sysfs_create_snapshot_group
    5770b54b112e nilfs2: fix memory leak in nilfs_sysfs_delete_##name##_group
    5acb21e30d85 nilfs2: fix memory leak in nilfs_sysfs_create_##name##_group
    0480f7a480bc nilfs2: fix NULL pointer in nilfs_##name##_attr_release
    d95b50ff07b8 nilfs2: fix memory leak in nilfs_sysfs_create_device_group
    aa1af89a6697 btrfs: fix lockdep warning while mounting sprout fs
    c43803c1aa76 btrfs: update the bdev time directly when closing
    921ef7cfef15 ceph: lockdep annotations for try_nonblocking_invalidate
    487ead34a208 ceph: remove the capsnaps when removing caps
    386fd6fd01bd ceph: request Fw caps before updating the mtime in ceph_write_iter
    b26ced26251c dmaengine: xilinx_dma: Set DMA mask for coherent APIs
    9c1ea8537730 dmaengine: ioat: depends on !UML
    35492619e010 dmaengine: sprd: Add missing MODULE_DEVICE_TABLE
    c12cf7f9afe2 dmaengine: idxd: depends on !UML
    b4bb0b171b6e iommu/amd: Relocate GAMSup check to early_enable_iommus
    2a07348e9821 parisc: Move pci_dev_is_behind_card_dino to where it is used
    ca907291e116 dma-buf: DMABUF_MOVE_NOTIFY should depend on DMA_SHARED_BUFFER
    b9a1526d5174 drivers: base: cacheinfo: Get rid of DEFINE_SMP_CALL_CACHE_FUNCTION()
    45bd9dd1bee8 drm/amdgpu: Disable PCIE_DPM on Intel RKL Platform
    c9538018cb2d thermal/core: Fix thermal_cooling_device_register() prototype
    d1f9ecc00da1 tools/bootconfig: Fix tracing_on option checking in ftrace2bconf.sh
    912afe602eac Kconfig.debug: drop selecting non-existing HARDLOCKUP_DETECTOR_ARCH
    e418ce8b8dfd ceph: cancel delayed work instead of flushing on mdsc teardown
    8193ad306ea0 ceph: allow ceph_put_mds_session to take NULL or ERR_PTR
    41aa21573486 platform/chrome: cros_ec_trace: Fix format warnings
    113a69460de5 platform/chrome: sensorhub: Add trace events for sample
    48271d10bf4c dmaengine: idxd: fix wq slot allocation index check
    777344da345a pwm: mxs: Don't modify HW state in .probe() after the PWM chip was registered
    322b70b522ab pwm: lpc32xx: Don't modify HW state in .probe() after the PWM chip was registered
    c63df77c40ca PM: sleep: core: Avoid setting power.must_resume to false
    74190973ab01 profiling: fix shift-out-of-bounds bugs
    0796d99c1b16 nilfs2: use refcount_dec_and_lock() to fix potential UAF
    30417cbeccff prctl: allow to setup brk for et_dyn executables
    e464b3876b02 9p/trans_virtio: Remove sysfs file on probe failure
    375e779ec32a thermal/drivers/exynos: Fix an error code in exynos_tmu_probe()
    38ab04186fb3 perf tools: Allow build-id with trailing zeros
    87c4144450e6 tools lib: Adopt memchr_inv() from kernel
    ebcd3fd9207c perf test: Fix bpf test sample mismatch reporting
    fa64b08931ee dmaengine: acpi: Avoid comparison GSI with Linux vIRQ
    9d49973b0848 um: virtio_uml: fix memory leak on init failures
    5d0e6a5e4441 coredump: fix memleak in dump_vma_snapshot()
    6b24588708fe staging: rtl8192u: Fix bitwise vs logical operator in TranslateRxSignalStuff819xUsb()
    ccb79116c372 sctp: add param size validation for SCTP_PARAM_SET_PRIMARY
    ffca46766850 sctp: validate chunk size in __rcv_asconf_lookup
    473cea4983b5 Revert "net/mlx5: Register to devlink ingress VLAN filter trap"
    5ce134e65f3b ARM: 9098/1: ftrace: MODULE_PLT: Fix build problem without DYNAMIC_FTRACE
    f91d25a7c89e ARM: 9079/1: ftrace: Add MODULE_PLTS support
    ad00533858f7 ARM: 9078/1: Add warn suppress parameter to arm_gen_branch_link()
    ce90c6706d5a ARM: 9077/1: PLT: Move struct plt_entries definition to header
    eb46d7c8ae83 ARM: Qualify enabling of swiotlb_init()
    79286ea830b3 s390/pci_mmio: fully validate the VMA before calling follow_pte()
    74d54e5ceba3 console: consume APC, DM, DCS
    9493e92a3953 PCI: aardvark: Fix reporting CRS value
    9e766b86a9ef PCI: pci-bridge-emul: Add PCIe Root Capabilities Register
    4d8524048a35 Linux 5.10.68
    a23d3576215f net: dsa: bcm_sf2: Fix array overrun in bcm_sf2_num_active_ports()
    9f2972e151dd bnxt_en: Fix error recovery regression
    619d747c1850 x86/mce: Avoid infinite loop for copy from user recovery
    47bc9c3929eb net: renesas: sh_eth: Fix freeing wrong tx descriptor
    b2f9b7455baf mfd: lpc_sch: Rename GPIOBASE to prevent build error
    027c44b8c8e4 mfd: lpc_sch: Partially revert "Add support for Intel Quark X1000"
    52a7e6667133 bnxt_en: Fix possible unintended driver initiated error recovery
    9a3f52f73c04 bnxt_en: Improve logging of error recovery settings information.
    639a2eddb731 bnxt_en: Convert to use netif_level() helpers.
    01cad477a968 bnxt_en: Consolidate firmware reset event logging.
    fad75e046363 bnxt_en: log firmware debug notifications
    f90a34fabaa5 bnxt_en: Fix asic.rev in devlink dev info command
    724502318455 bnxt_en: fix stored FW_PSID version masks
    eb635e008cb1 net: dsa: b53: Fix IMP port setup on BCM5301x
    87b34cd64851 ip_gre: validate csum_start only on pull
    9c98d2bd1434 qlcnic: Remove redundant unlock in qlcnic_pinit_from_rom
    8c01c620ae61 fq_codel: reject silly quantum parameters
    6e2d36f2b1d1 netfilter: socket: icmp6: fix use-after-scope
    c361c955609a net: dsa: b53: Set correct number of ports in the DSA struct
    0db7e0d9f67d net: dsa: b53: Fix calculating number of switch ports
    f89b0d032f86 net: hso: add failure handler for add_net_device
    f450958f7ff8 selftests: mptcp: clean tmp files in simult_flows
    5711ced58eb4 net: dsa: tag_rtl4_a: Fix egress tags
    b167a0cec187 gpio: mpc8xxx: Use 'devm_gpiochip_add_data()' to simplify the code and avoid a leak
    f86956143da9 gpio: mpc8xxx: Fix a resources leak in the error handling path of 'mpc8xxx_probe()'
    c2b52963fd0c perf bench inject-buildid: Handle writen() errors
    5a20adc38811 perf unwind: Do not overwrite FEATURE_CHECK_LDFLAGS-libunwind-{x86,aarch64}
    f5176a0798bd ARC: export clear_user_page() for modules
    9da1fb128c54 mtd: rawnand: cafe: Fix a resource leak in the error handling path of 'cafe_nand_probe()'
    5402b31c0c46 PCI: Sync __pci_register_driver() stub for CONFIG_PCI=n
    a957d82b2316 KVM: arm64: Handle PSCI resets before userspace touches vCPU state
    53921242cf99 KVM: arm64: Fix read-side race on updates to vcpu reset state
    b9b89da56af7 mtd: mtdconcat: Check _read, _write callbacks existence before assignment
    812cbb143c12 mtd: mtdconcat: Judge callback existence based on the master
    e8dfc446a16a tracing/boot: Fix a hist trigger dependency for boot time tracing
    87479b10eb72 mfd: tqmx86: Clear GPIO IRQ resource when no IRQ is set
    f10f727cf9f4 PCI: Fix pci_dev_str_match_path() alloc while atomic bug
    ed44be1cbe5e KVM: arm64: Restrict IPA size to maximum 48 bits on 4K and 16K page size
    62f813769f50 netfilter: nft_ct: protect nft_ct_pcpu_template_refcnt with mutex
    1cf43a1e5782 netfilter: Fix fall-through warnings for Clang
    9e89c22d1c94 PCI: iproc: Fix BCMA probe resource handling
    b1f3be0c302a PCI: of: Don't fail devm_pci_alloc_host_bridge() on missing 'ranges'
    063c3d980d78 backlight: ktd253: Stabilize backlight
    00303e459251 mfd: axp20x: Update AXP288 volatile ranges
    ab7cf2250161 s390/bpf: Fix branch shortening during codegen pass
    4320c222c2ff s390/bpf: Fix 64-bit subtraction of the -0x80000000 constant
    d92d3a9c2b65 s390/bpf: Fix optimizing out zero-extensions
    4a9339320338 NTB: perf: Fix an error code in perf_setup_inbuf()
    ce660d6dfcdd NTB: Fix an error code in ntb_msit_probe()
    e76ccbdedbdd ethtool: Fix an error code in cxgb2.c
    70ac967a7b88 PCI: ibmphp: Fix double unmap of io_mem
    9ae759a36b61 block, bfq: honor already-setup queue merges
    7f2b3242f0d4 net: usb: cdc_mbim: avoid altsetting toggling for Telit LN920
    ca8ecd7444a9 Set fc_nlinfo in nh_create_ipv4, nh_create_ipv6
    c422c555053e octeontx2-af: Add additional register check to rvu_poll_reg()
    1cac475eeb9f watchdog: Start watchdog in watchdog_set_last_hw_keepalive only if appropriate
    e5609d3fd57d PCI: Add ACS quirks for Cavium multi-function devices
    365cdfcc6eba PCI: j721e: Add PCIe support for AM64
    81381b72f40c PCI: j721e: Add PCIe support for J7200
    4892b1515b40 PCI: cadence: Add quirk flag to set minimum delay in LTSSM Detect.Quiet state
    a83e032cc489 PCI: cadence: Use bitfield for *quirk_retrain_flag* instead of bool
    3aedfe4b0800 tracing/probes: Reject events which have the same name of existing one
    75420f9400a6 PCI: rcar: Fix runtime PM imbalance in rcar_pcie_ep_probe()
    b6352e2e2764 mfd: Don't use irq_create_mapping() to resolve a mapping
    aa638669c8a4 PCI: tegra: Fix OF node reference leak
    d5c5d1b141fa PCI: tegra194: Fix MSI-X programming
    13f366bab077 PCI: tegra194: Fix handling BME_CHGED event
    b7d4f310bb8f fuse: fix use after free in fuse_read_interrupt()
    03cc3a2923d6 PCI: Add ACS quirks for NXP LX2xx0 and LX2xx2 platforms
    7a44361a1f6a mfd: db8500-prcmu: Adjust map to reality
    619f137ffd69 dt-bindings: mtd: gpmc: Fix the ECC bytes vs. OOB bytes equation
    49cf30ebb35c mm/memory_hotplug: use "unsigned long" for PFN in zone_for_pfn_range()
    aa39eb744a82 net: hns3: fix the timing issue of VF clearing interrupt sources
    ad47e0922108 net: hns3: disable mac in flr process
    b76522c7c349 net: hns3: change affinity_mask to numa node range
    34fc06d0477e net: hns3: pad the short tunnel frame before sending to hardware
    0511d099db6f bnxt_en: make bnxt_free_skbs() safe to call after bnxt_free_mem()
    49eff4ab7d43 KVM: PPC: Book3S HV: Tolerate treclaim. in fake-suspend mode changing registers
    e68795c1101e ibmvnic: check failover_pending in login response
    aeb67214ce94 dt-bindings: arm: Fix Toradex compatible typo
    0ab9981fa0c5 udp_tunnel: Fix udp_tunnel_nic work-queue type
    5221e6632991 qed: Handle management FW error
    e00eae1d6b1f selftest: net: fix typo in altname test
    53947b68c56b tcp: fix tp->undo_retrans accounting in tcp_sacktag_one()
    35d3ab2ea2ed x86/uaccess: Fix 32-bit __get_user_asm_u64() when CC_HAS_ASM_GOTO_OUTPUT=y
    cf6f29bb2c18 net: dsa: destroy the phylink instance on any error in dsa_slave_phy_setup
    df38f941a7e4 net/af_unix: fix a data-race in unix_dgram_poll
    cad96d0e50e4 vhost_net: fix OoB on sendmsg() failure.
    7843861e2140 gen_compile_commands: fix missing 'sys' package
    983ef866291c net: ipa: initialize all filter table slots
    c5102ced8ac0 events: Reuse value read using READ_ONCE instead of re-reading it
    8f8ad122ffe0 nvme-tcp: fix io_work priority inversion
    c586bc31d5b9 net/mlx5: Fix potential sleeping in atomic context
    29a5af9112a2 net/mlx5: FWTrace, cancel work on alloc pd error flow
    229e9293b2ba perf machine: Initialize srcline string member in add_location struct
    33c983f7a182 drm/rockchip: cdn-dp-core: Make cdn_dp_core_resume __maybe_unused
    fd9ed47fe6be tipc: increase timeout in tipc_sk_enqueue()
    abe460eb6fbb r6040: Restore MDIO clock frequency after MAC reset
    edfab735d518 net/l2tp: Fix reference count leak in l2tp_udp_recv_core
    6c3cb65d561e dccp: don't duplicate ccid when cloning dccp sock
    f6f80766558b ptp: dp83640: don't define PAGE0
    bd6d9a0dd411 net-caif: avoid user-triggerable WARN_ON(1)
    855c17ffa65f net/{mlx5|nfp|bnxt}: Remove unnecessary RTNL lock assert
    c5c9ee2d367b ethtool: Fix rxnfc copy to user buffer overflow
    ee3ffd56b40e tipc: fix an use-after-free issue in tipc_recvmsg
    12551b75b00b x86/mm: Fix kern_addr_valid() to cope with existing but not present entries
    6672dc68e28e x86/pat: Pass valid address to sanitize_phys()
    0346f8a2c5ec s390/sclp: fix Secure-IPL facility detection
    cc9d96c9f9e0 drm/etnaviv: add missing MMU context put when reaping MMU mapping
    ea995e8a6294 drm/etnaviv: reference MMU context when setting up hardware state
    660dfbf208a4 drm/etnaviv: fix MMU context leak on GPU reset
    22163efedcf3 drm/etnaviv: exec and MMU state is lost when resetting the GPU
    6b1c223d8a53 drm/etnaviv: keep MMU context across runtime suspend/resume
    c63e6e0951ff drm/etnaviv: stop abusing mmu_context as FE running marker
    cf24bd826e4b drm/etnaviv: put submit prev MMU context when it exists
    0759f648470b drm/etnaviv: return context from etnaviv_iommu_context_get
    8f95553f0016 drm/amd/amdgpu: Increase HWIP_MAX_INSTANCE to 10
    87f7032dc227 PCI: Add AMD GPU multi-function power dependencies
    cd64b416aed2 PM: base: power: don't try to use non-existing RTC for storing data
    a67e7cdbc633 arm64/sve: Use correct size when reinitialising SVE state
    84da60070c36 bnx2x: Fix enabling network interfaces without VFs
    1a5a3ba21aee xen: reset legacy rtc flag for PV domU
    ce8f81b76d3b io_uring: ensure symmetry in handling iter types in loop_rw_iter()
    88f3d951e2db btrfs: fix upper limit for max_inline for page size 64K
    575279059e26 drm/bridge: lt9611: Fix handling of 4k panels
    faf816b0f8d0 Linux 5.10.67
    ad3ea16746cc fanotify: limit number of event merge attempts
    412974e75fdd drm/panfrost: Clamp lock region to Bifrost minimum
    8976e09443cb drm/panfrost: Use u64 for size in lock_region
    95251e6833fa drm/panfrost: Simplify lock_region calculation
    b80a99e04827 drm/amd/display: Update bounding box states (v2)
    583c4f3d09c3 drm/amd/display: Update number of DCN3 clock states
    7b1abace16a9 drm/amdgpu: Fix BUG_ON assert
    c29485e34e63 drm/panfrost: Make sure MMU context lifetime is not bound to panfrost_priv
    bb693c114e8b drm/dp_mst: Fix return code on sideband message failure
    84cac4f80605 drm/msi/mdp4: populate priv->kms in mdp4_kms_init
    be1fcecfc145 drm/mgag200: Select clock in PLL update functions
    d0aaea1f117d net: dsa: lantiq_gswip: fix maximum frame length
    5944d0e2b0ab lib/test_stackinit: Fix static initializer test
    00cdb2fb4df1 platform/chrome: cros_ec_proto: Send command again when timeout occurs
    b2e72e53cd26 libnvdimm/pmem: Fix crash triggered when I/O in-flight during unbind
    6d86634d7bd1 memcg: enable accounting for pids in nested pid namespaces
    388f12dabbe0 mm,vmscan: fix divide by zero in get_scan_count
    2d2d8b0eca64 mm/hugetlb: initialize hugetlb_usage in mm_init
    ce75a6b399e0 mm/hmm: bypass devmap pte when all pfn requested flags are fulfilled
    e1fa3b2b60ab hugetlb: fix hugetlb cgroup refcounting during vma split
    27dd91221b3f s390/pv: fix the forcing of the swiotlb
    086faa4a2e86 cpufreq: powernv: Fix init_chip_info initialization in numa=off
    55be9eb1936a scsi: qla2xxx: Sync queue idx with queue_pair_map idx
    9c8414325eee scsi: qla2xxx: Changes to support kdump kernel
    137dafa72230 scsi: BusLogic: Fix missing pr_cont() use
    69775e4e17f2 ovl: fix BUG_ON() in may_delete() when called from ovl_cleanup()
    7a5756e90563 parisc: fix crash with signals and alloca
    9a4e7f903866 io_uring: remove duplicated io_size from rw
    6930a2a5be5c fs/io_uring Don't use the return value from import_iovec().
    2c304c65defd net: hns3: clean up a type mismatch warning
    fb1ee027878b net: w5100: check return value after calling platform_get_resource()
    c49a52046da7 fix array-index-out-of-bounds in taprio_change
    a4301d06a0b8 net: fix NULL pointer reference in cipso_v4_doi_free
    5ed5d594d9a7 ath9k: fix sleeping in atomic context
    aa3708236ea0 ath9k: fix OOB read ar9300_eeprom_restore_internal
    be457b27dd0a wcn36xx: Fix missing frame timestamp for beacon/probe-resp
    b1d547f2f51a selftests/bpf: Fix potential unreleased lock
    3ad66d67822d parport: remove non-zero check on count
    1e9302537804 net/mlx5: DR, Enable QP retransmission
    9c5c65ecbd87 net/mlx5: DR, fix a potential use-after-free bug
    4bbf0a9d90e8 iwlwifi: mvm: Fix scan channel flags settings
    a693aff5e8d7 iwlwifi: fw: correctly limit to monitor dump
    4ed6510e0559 iwlwifi: mvm: fix access to BSS elements
    9e80a3d88f4d iwlwifi: mvm: avoid static queue number aliasing
    3ed8982df50e iwlwifi: mvm: fix a memory leak in iwl_mvm_mac_ctxt_beacon_changed
    608c8359c567 iwlwifi: pcie: free RBs during configure
    eb04c51a439e nfsd: fix crash on LOCKT on reexported NFSv3
    0e9f4492219f drm/amdkfd: Account for SH/SE count when setting up cu masks.
    27d4a96addef ASoC: rockchip: i2s: Fixup config for DAIFMT_DSP_A/B
    969eddc3b4dc ASoC: rockchip: i2s: Fix regmap_ops hang
    7344a8a80190 usbip:vhci_hcd USB port can get stuck in the disabled state
    29c8f13a345d usbip: give back URBs for unsent unlink requests during cleanup
    8de01a896c1b usb: musb: musb_dsps: request_irq() after initializing musb
    c0751eeb938c Revert "USB: xhci: fix U1/U2 handling for hardware with XHCI_INTEL_HOST quirk set"
    ba2faddf1f14 cifs: fix wrong release in sess_alloc_buffer() failed path
    7c7d6c9cd879 mmc: core: Return correct emmc response in case of ioctl error
    d1e382a04ada selftests/bpf: Enlarge select() timeout for test_maps
    3aab5bffdde0 mmc: rtsx_pci: Fix long reads when clock is prescaled
    7f43da79ebc5 mmc: sdhci-of-arasan: Check return value of non-void funtions
    834ecf61cebd mmc: sdhci-of-arasan: Modified SD default speed to 19MHz for ZynqMP
    1a40e60e2af4 of: Don't allow __of_attached_node_sysfs() without CONFIG_SYSFS
    be69ed7bb9d3 ASoC: Intel: Skylake: Fix passing loadable flag for module
    4a48ed479467 ASoC: Intel: Skylake: Fix module configuration for KPB and MIXER
    d72afec087f7 soundwire: intel: fix potential race condition during power down
    b225eeaf3a02 btrfs: tree-log: check btrfs_lookup_data_extent return value
    87ae522e467e m68knommu: only set CONFIG_ISA_DMA_API for ColdFire sub-arch
    c10b1afc2f43 octeontx2-pf: Fix NIX1_RX interface backpressure
    6d657f1fa121 rtw88: wow: fix size access error of probe request
    aa82a11176bd rtw88: wow: build wow function only if CONFIG_PM is on
    2fd1964f7501 rtw88: use read_poll_timeout instead of fixed sleep
    9baf6f8ca285 rtl8xxxu: Fix the handling of TX A-MPDU aggregation
    756924bc1804 drm/exynos: Always initialize mapping in exynos_drm_register_dma()
    9ce6e29375ba lockd: lockd server-side shouldn't set fl_ops
    2d3fab9ceafa usb: chipidea: host: fix port index underflow and UBSAN complains
    2225a5cd2fbc gfs2: Don't call dlm after protocol is unmounted
    0df5eba67bf0 kselftest/arm64: pac: Fix skipping of tests on systems without PAC
    9486d7ac9f30 kselftest/arm64: mte: Fix misleading output when skipping tests
    1f5db5b8a3d6 net: Fix offloading indirect devices dependency on qdisc order creation
    2a69325ee510 staging: rts5208: Fix get_ms_information() heap buffer size
    868831492dd6 hwmon: (pmbus/ibm-cffps) Fix write bits for LED control
    39738ebfad39 selftests/bpf: Fix flaky send_signal test
    c53c68c9bf2a rpc: fix gss_svc_init cleanup on failure
    4b1b4d3f45df tcp: enable data-less, empty-cookie SYN with TFO_SERVER_COOKIE_NOT_REQD
    fca514f25c4d iomap: pass writeback errors to the mapping
    49e2bcb7cf58 serial: sh-sci: fix break handling for sysrq
    a99eec36ed39 opp: Don't print an error if required-opps is missing
    6698029de35b Bluetooth: Fix handling of LE Enhanced Connection Complete
    240a7025a6f8 nvme: code command_id with a genctr for use-after-free validation
    24618e92d50f nvme-tcp: don't check blk_mq_tag_to_rq when receiving pdu data
    27e8bc1f5b32 arm64: dts: ls1046a: fix eeprom entries
    aa06cfc5291c arm64: tegra: Fix compatible string for Tegra132 CPUs
    9c2b89f64f2e ARM: tegra: tamonten: Fix UART pad setting
    035e8d5a6dd8 ARM: tegra: acer-a500: Remove bogus USB VBUS regulators
    9713dfa5185a mac80211: Fix monitor MTU limit so that A-MSDUs get through
    83449db3aac0 drm/display: fix possible null-pointer dereference in dcn10_set_clock()
    2254383788ff gpu: drm: amd: amdgpu: amdgpu_i2c: fix possible uninitialized-variable access in amdgpu_i2c_router_select_ddc_port()
    155e7047909d net/mlx5: Fix variable type to match 64bit
    f86bc4a1a401 drm/msm/dp: return correct edid checksum after corrupted edid checksum read
    98d44b7be6f1 Bluetooth: avoid circular locks in sco_sock_connect
    a1073aad497d Bluetooth: schedule SCO timeouts with delayed_work
    d6c91423993e drm/vmwgfx: fix potential UAF in vmwgfx_surface.c
    3841dfa7eb5c selftests/bpf: Fix xdp_tx.c prog section name
    63ebc1f1df81 drm/amd/display: fix incorrect CM/TF programming sequence in dwb
    d763afc4ea2b drm/amd/display: fix missing writeback disablement if plane is removed
    491c8be21993 thunderbolt: Fix port linking by checking all adapters
    0f0f1de02b9b drm: xlnx: zynqmp: release reset to DP controller before accessing DP registers
    f76f78f9f479 drm: xlnx: zynqmp_dpsub: Call pm_runtime_get_sync before setting pixel clock
    127f3610a0e3 drm/msm/dsi: Fix DSI and DSI PHY regulator config from SDM660
    0bbbe3ec67f0 drm/msm: mdp4: drop vblank get/put from prepare/complete_commit
    ac21cd44c954 net: ethernet: stmmac: Do not use unreachable() in ipq806x_gmac_probe()
    2b0fa8d53041 nvmem: qfprom: Fix up qfprom_disable_fuse_blowing() ordering
    35e5c99b152d arm64: dts: qcom: sm8250: Fix epss_l3 unit address
    43ccafc91f63 arm64: dts: qcom: msm8996: don't use underscore in node name
    f868c2d62a27 arm64: dts: qcom: msm8994: don't use underscore in node name
    bda9c84edbb3 arm64: dts: qcom: sdm630: don't use underscore in node name
    aa16e76c80af arm64: dts: qcom: ipq6018: drop '0x' from unit address
    da714a198342 arm64: dts: qcom: sdm660: use reg value for memory node
    34e9c56675a8 arm64: dts: qcom: ipq8074: fix pci node reg property
    74287874c91d ARM: dts: imx53-ppd: Fix ACHC entry
    6a00decce3a6 serial: 8250_omap: Handle optional overrun-throttle-ms property
    699c91475847 arm64: dts: qcom: sdm630: Fix TLMM node and pinctrl configuration
    310a127178b0 arm64: dts: qcom: sdm630: Rewrite memory map
    783be2a94299 gfs2: Fix glock recursion in freeze_go_xmote_bh
    4e014ff22e4b media: tegra-cec: Handle errors of clk_prepare_enable()
    c159db240cf2 media: TDA1997x: fix tda1997x_query_dv_timings() return value
    e3a2e20ed503 media: v4l2-dv-timings.c: fix wrong condition in two for-loops
    ac1bcf53e32f media: imx258: Limit the max analogue gain to 480
    4cb4967472c8 media: imx258: Rectify mismatch of VTS value
    a64e3f1d8a27 ASoC: Intel: update sof_pcm512x quirks
    9cf827242033 ASoC: Intel: bytcr_rt5640: Move "Platform Clock" routes to the maps for the matching in-/output
    f1fb1f6fa172 arm64: tegra: Fix Tegra194 PCIe EP compatible string
    8fb3d8c151a7 ARM: dts: at91: use the right property for shutdown controller
    f710323dcd24 bonding: 3ad: fix the concurrency between __bond_release_one() and bond_3ad_state_machine_handler()
    5d008cb7636d ARM: dts: stm32: Update AV96 adv7513 node per dtbs_check
    3142476fa002 ARM: dts: stm32: Set {bitclock,frame}-master phandles on ST DKx
    37437a60a93b ARM: dts: stm32: Set {bitclock,frame}-master phandles on DHCOM SoM
    f4c7c95e3ee5 workqueue: Fix possible memory leaks in wq_numa_init()
    6528cc687c88 Bluetooth: skip invalid hci_sync_conn_complete_evt
    3b82e4799f53 ata: sata_dwc_460ex: No need to call phy_exit() befre phy_init()
    4af60a543ba6 libbpf: Fix race when pinning maps in parallel
    874d5aa06ce2 samples: bpf: Fix tracex7 error raised on the missing argument
    035f83b5abd3 staging: ks7010: Fix the initialization of the 'sleep_status' structure
    d0a8ef04c220 serial: 8250_pci: make setup_port() parameters explicitly unsigned
    2603740df8b2 hvsi: don't panic on tty_register_driver failure
    dd3307a8b383 xtensa: ISS: don't panic in rs_init
    b763d2e7d45c serial: 8250: Define RX trigger levels for OxSemi 950 devices
    973c57c5e649 s390: make PCI mio support a machine flag
    77d62f2bcc7f s390/jump_label: print real address in a case of a jump label bug
    863d2eb2f726 flow_dissector: Fix out-of-bounds warnings
    64583448c231 ipv4: ip_output.c: Fix out-of-bounds warning in ip_copy_addrs()
    bcc61adefd78 video: fbdev: riva: Error out if 'pixclock' equals zero
    63abc0eb8af5 video: fbdev: kyro: Error out if 'pixclock' equals zero
    6a8dcd2ffb41 video: fbdev: asiliantfb: Error out if 'pixclock' equals zero
    3740418ccde8 arm64: dts: allwinner: h6: tanix-tx6: Fix regulator node names
    be2e11b9f8fa drm/bridge: nwl-dsi: Avoid potential multiplication overflow on 32-bit
    6a3564739b9f bpf/tests: Do not PASS tests without actually testing the result
    99121dec14b0 bpf/tests: Fix copy-and-paste error in double word test
    6f51f4241253 drm/amd/amdgpu: Update debugfs link_settings output link_rate field in hex
    a5999d18a8d8 drm/amdgpu: Fix a printing message
    5b3a45eedd27 ethtool: improve compat ioctl handling
    52bb703f71d3 nfp: fix return statement in nfp_net_parse_meta()
    23e5fb647589 media: atomisp: pci: fix error return code in atomisp_pci_probe()
    e5cecb9105d4 media: atomisp: Fix runtime PM imbalance in atomisp_pci_probe
    9a85b9e37601 media: platform: stm32: unprepare clocks at handling errors in probe
    c6e5eebd9540 media: hantro: vp8: Move noisy WARN_ON to vpu_debug
    f462a39eb833 drm/amd/display: Fix timer_per_pixel unit error
    b4f5c9454dfc selftests: firmware: Fix ignored return val of asprintf() warn
    e944a221262e bus: fsl-mc: fix mmio base address for child DPRCs
    165c55af5f5f tty: serial: jsm: hold port lock when reporting modem line changes
    642639bb8d42 staging: board: Fix uninitialized spinlock when attaching genpd
    03f4492dbff3 usb: gadget: composite: Allow bMaxPower=0 if self-powered
    5534de13b6dc USB: EHCI: ehci-mv: improve error handling in mv_ehci_enable()
    b2b8137ec920 usb: gadget: u_ether: fix a potential null pointer dereference
    566ddd2d94b0 usb: host: fotg210: fix the actual_length of an iso packet
    224cf5e8c853 usb: host: fotg210: fix the endpoint's transactional opportunities calculation
    463b3edfba90 igc: Check if num of q_vectors is smaller than max before array access
    d3ca78775db4 rcu: Fix macro name CONFIG_TASKS_RCU_TRACE
    34609faad0c9 drm: protect drm_master pointers in drm_lease.c
    06a553a99bac drm: serialize drm_file.master with a new spinlock
    54e51d288b38 drm: avoid blocking in drm_clients_info's rcu section
    df19d95141d1 Smack: Fix wrong semantics in smk_access_entry()
    3533aa65e6a9 netlink: Deal with ESRCH error in nlmsg_notify()
    9de06dcd4710 video: fbdev: kyro: fix a DoS bug by restricting user input
    29ab7f6d505f ARM: dts: qcom: apq8064: correct clock names
    e0c17c11b15d iavf: fix locking of critical sections
    67c9262e3f31 iavf: do not override the adapter state in the watchdog task
    9f11de56012c iio: dac: ad5624r: Fix incorrect handling of an optional regulator.
    e78a0b4a339e net: phy: Fix data type in DP83822 dp8382x_disable_wol()
    cca61275874a tipc: keep the skb in rcv queue until the whole data is read
    cc12ab5951aa PCI: Use pci_update_current_state() in pci_enable_device_flags()
    aad29a00a598 crypto: mxs-dcp - Use sg_mapping_iter to copy data
    871abd1e6185 x86/hyperv: fix for unwanted manipulation of sched_clock when TSC marked unstable
    c327b69e96b0 libbpf: Fix reuse of pinned map on older kernel
    6a985c579499 media: dib8000: rewrite the init prbs logic
    2048907d8cb7 ASoC: atmel: ATMEL drivers don't need HAS_DMA
    10a135969fd7 drm/amdgpu: Fix amdgpu_ras_eeprom_init()
    b32d3ded9dc2 drm/vc4: hdmi: Set HD_CTL_WHOLSMP and HD_CTL_CHALIGN_SET
    6afd1e053d9b userfaultfd: prevent concurrent API initialization
    1e4cfe954bd9 kbuild: Fix 'no symbols' warning when CONFIG_TRIM_UNUSD_KSYMS=y
    981bf9b0aa1b MIPS: Malta: fix alignment of the devicetree buffer
    bb8108546da9 f2fs: should put a page beyond EOF when preparing a write
    d04925fb8d70 f2fs: deallocate compressed pages when error happens
    4b71928e5c54 f2fs: fix to unmap pages from userspace process in punch_hole()
    1c934aba9fd5 f2fs: fix unexpected ENOENT comes from f2fs_map_blocks()
    45cb5f86c1c6 f2fs: fix to account missing .skipped_gc_rwsem
    fd69f613af53 soc: mediatek: cmdq: add address shift in jump
    d320c1b2e728 KVM: PPC: Fix clearing never mapped TCEs in realmode
    6bf98b94ffeb clk: at91: clk-generated: Limit the requested rate to our range
    9bab2bc4c238 fscache: Fix cookie key hashing
    b4849e2ac706 RDMA/hns: Fix QP's resp incomplete assignment
    e91077cf1780 powerpc/smp: Update cpu_core_map on all PowerPc systems
    903ca538f588 platform/x86: dell-smbios-wmi: Add missing kfree in error-exit from run_smbios_call
    add8e8c3402f KVM: PPC: Book3S HV Nested: Reflect guest PMU in-use to L0 when guest SPRs are live
    4c0c4f702196 scsi: ufs: ufs-exynos: Fix static checker warning
    bda5602c1c35 KVM: PPC: Book3S HV: Fix copy_tofrom_guest routines
    926bf91248dd clk: imx8m: fix clock tree update of TF-A managed clocks
    e84a72f69621 HID: i2c-hid: Fix Elan touchpad regression
    253bac6c60ad iommu/vt-d: Update the virtual command related registers
    947579a6967a powerpc/config: Renable MTD_PHYSMAP_OF
    1bc19e4062e9 scsi: qedf: Fix error codes in qedf_alloc_global_queues()
    dc4577749987 scsi: qedi: Fix error codes in qedi_alloc_global_queues()
    782c4017845d scsi: smartpqi: Fix an error code in pqi_get_raid_map()
    41066433be42 powerpc/numa: Consider the max NUMA node for migratable LPAR
    d3612083ecc1 pinctrl: single: Fix error return code in pcs_parse_bits_in_pinctrl_entry()
    6291fd0eeafc scsi: fdomain: Fix error return code in fdomain_probe()
    f02ab9d1d3a6 sunrpc: Fix return value of get_srcport()
    21a2be1a5145 SUNRPC query transport's source port
    f19abe046354 SUNRPC/xprtrdma: Fix reconnection locking
    f3d301612787 SUNRPC: Fix potential memory corruption
    9aa7a3ffb11c NFSv4/pnfs: The layout barrier indicate a minimal value for the seqid
    2a542421eb7f NFSv4/pNFS: Always allow update of a zero valued layout barrier
    4b96edea5cd1 NFSv4/pNFS: Fix a layoutget livelock loop
    fa55e76641d8 dma-debug: fix debugfs initialization order
    ca7f7e37bae4 openrisc: don't printk() unconditionally
    31fd3211ef8b f2fs: reduce the scope of setting fsck tag when de->name_len is zero
    49e4c83db885 cpuidle: pseries: Mark pseries_idle_proble() as __init
    876e45c95eb6 RDMA/mlx5: Delete not-available udata check
    a77da9de0d7d RDMA/efa: Remove double QP type assignment
    1988836e30c5 powerpc/stacktrace: Include linux/delay.h
    c5a5528da722 cpuidle: pseries: Fixup CEDE0 latency only for POWER10 onwards
    3b2bbcccd6e9 scsi: ufs: Fix memory corruption by ufshcd_read_desc_param()
    d353e093c0d5 vfio: Use config not menuconfig for VFIO_NOIOMMU
    0f711378f0b1 pinctrl: samsung: Fix pinctrl bank pin count
    59137b7dfff1 scsi: BusLogic: Use %X for u32 sized integer rather than %lX
    8ea3e622af56 docs: Fix infiniband uverbs minor number
    fe2a1cd62267 RDMA/iwcm: Release resources if iw_cm module initialization fails
    b824bae96f73 IB/hfi1: Adjust pkey entry in index 0
    273ed4f47e6f clk: rockchip: drop GRF dependency for rk3328/rk3036 pll types
    f1eccc408168 scsi: bsg: Remove support for SCSI_IOCTL_SEND_COMMAND
    ef5395fbadac pinctrl: armada-37xx: Correct PWM pins definitions
    782ceaba977c pinctrl: remove empty lines in pinctrl subsystem
    2d586a3f5b7e f2fs: quota: fix potential deadlock
    70fd9363673b HID: input: do not report stylus battery state as "full"
    4e89aea738b5 PCI: aardvark: Fix masking and unmasking legacy INTx interrupts
    b50db4c02f45 PCI: aardvark: Fix checking for PIO status
    9d6090575406 PCI: Export pci_pio_to_address() for module use
    fa3c15ccf2ea PCI: aardvark: Configure PCIe resources from 'ranges' DT property
    df23bd40ed88 PCI: xilinx-nwl: Enable the clock through CCF
    72f2be343272 PCI: Return ~0 data on pciconfig_read() CAP_SYS_ADMIN failure
    088a1052f7b0 PCI: Restrict ASMedia ASM1062 SATA Max Payload Size Supported
    9302a3c00cc6 PCI/portdrv: Enable Bandwidth Notification only if port supports it
    74d6dfcb0f9d f2fs: fix to do sanity check for sb/cp fields correctly
    ce7e64e63acf ARM: 9105/1: atags_to_fdt: don't warn about stack size
    ba73bc166615 libata: add ATA_HORKAGE_NO_NCQ_TRIM for Samsung 860 and 870 SSDs
    bcbc44e42dc6 dmaengine: imx-sdma: remove duplicated sdma_load_context
    300ccb129252 Revert "dmaengine: imx-sdma: refine to load context only once"
    76668bdee0b0 s390/qdio: cancel the ESTABLISH ccw after timeout
    bcc0c767f9b3 s390/qdio: fix roll-back after timeout on ESTABLISH ccw
    2d2aaa200ced media: rc-loopback: return number of emitters rather than error
    c0eaaa686864 media: uvc: don't do DMA on stack
    516dbe27f447 VMCI: fix NULL pointer dereference when unmapping queue pair
    6cae39f45754 crypto: ccp - shutdown SEV firmware on kexec
    7509c4cb7c80 dm crypt: Avoid percpu_counter spinlock contention in crypt_page_alloc()
    4f920fefd857 power: supply: max17042: handle fails of reading status register
    0d54bbad80f7 block: bfq: fix bfq_set_next_ioprio_data()
    5df14bba0056 crypto: public_key: fix overflow during implicit conversion
    646870ad8e56 wcn36xx: Ensure finish scan is not requested before start scan
    4753723f8b48 iio: ltc2983: fix device probe
    de32e151800d arm64: head: avoid over-mapping in map_memory
    2d3a9dff763f arm64: mm: Fix TLBI vs ASID rollover
    01e6c64bbc5d soc: aspeed: p2a-ctrl: Fix boundary check for mmap
    3fdf2feb6cbe soc: aspeed: lpc-ctrl: Fix boundary check for mmap
    e80c45dbe263 soc: qcom: aoss: Fix the out of bound usage of cooling_devs
    610e8b2621d6 pinctrl: ingenic: Fix incorrect pull up/down info
    1e1136fbe89f pinctrl: stmfx: Fix hazardous u8[] to unsigned long cast
    7524fcd09c3e clk: socfpga: agilex: add the bypass register for s2f_usr0 clock
    96bf326fb93c clk: socfpga: agilex: fix up s2f_user0_clk representation
    7eb16be25f0f clk: socfpga: agilex: fix the parents of the psi_ref_clk
    ac99b3aa8375 tools/thermal/tmon: Add cross compiling support
    2daa118a3f7b selftests/ftrace: Fix requirement check of README file
    8248b61b86fb ceph: fix dereference of null pointer cf
    c37085d60634 9p/xen: Fix end of loop tests for list_for_each_entry
    907944851aa0 xen: fix setting of max_pfn in shared_info
    37566a343fe9 powerpc/perf/hv-gpci: Fix counter value parsing
    5f13c8bae824 PCI/MSI: Skip masking MSI-X on Xen PV
    d15554f98597 blk-zoned: allow BLKREPORTZONE without CAP_SYS_ADMIN
    a58f08255490 blk-zoned: allow zone management send operations without CAP_SYS_ADMIN
    c1b249e02a80 btrfs: reset replace target device to allocation state on close
    0901af53da8f btrfs: wake up async_delalloc_pages waiters after submit
    9ac218642dfc io-wq: fix wakeup race when adding new work
    548ee201fb4a io_uring: fail links of cancelled timeouts
    54eb6211b979 io_uring: add ->splice_fd_in checks
    a3ed34bcada5 io_uring: place fixed tables under memcg limits
    5103b733348e io_uring: limit fixed table size by RLIMIT_NOFILE
    ebedb252a47f rtc: tps65910: Correct driver module alias
    44a32dcb2fb5 Linux 5.10.66
    1de280adb209 Revert "time: Handle negative seconds correctly in timespec64_to_ns()"
    f49fd9882f54 Revert "posix-cpu-timers: Force next expiration recalc after itimer reset"
    0daa75bf750c Revert "block: nbd: add sanity check for first_minor"
    d3c3f4e07826 Revert "Bluetooth: Move shutdown callback before flushing tx and rx queue"
    c31c2cca229a Linux 5.10.65
    b216a075a9ab clk: kirkwood: Fix a clocking boot regression
    5866b1175df0 backlight: pwm_bl: Improve bootloader/kernel device handover
    4c00435cb813 fbmem: don't allow too huge resolutions
    34d099a330e7 IMA: remove the dependency on CRYPTO_MD5
    5cc1ee31353b IMA: remove -Wmissing-prototypes warning
    131968998109 fuse: flush extending writes
    8018100c5444 fuse: truncate pagecache on atomic_o_trunc
    a8ca1fba54be ARM: dts: at91: add pinctrl-{names, 0} for all gpios
    c2c7eefc9371 KVM: nVMX: Unconditionally clear nested.pi_pending on nested VM-Enter
    bf3622446335 KVM: VMX: avoid running vmx_handle_exit_irqoff in case of emulation
    c06e6ff2fcc3 KVM: x86: Update vCPU's hv_clock before back to guest when tsc_offset is adjusted
    1db337b10d12 KVM: s390: index kvm->arch.idle_mask by vcpu_idx
    dc9db2a2aae4 Revert "KVM: x86: mmu: Add guest physical address check in translate_gpa()"
    c6b42ec1c936 x86/resctrl: Fix a maybe-uninitialized build warning treated as error
    bafece6cd1f9 perf/x86/amd/ibs: Extend PERF_PMU_CAP_NO_EXCLUDE to IBS Op
    ae95c3a147d5 tty: Fix data race between tiocsti() and flush_to_ldisc()
    4d0e6d6fe4e2 bio: fix page leak bio_add_hw_page failure
    24fbd77d5a0f io_uring: IORING_OP_WRITE needs hash_reg_file set
    656f343d724b time: Handle negative seconds correctly in timespec64_to_ns()
    611b7f9dc9f6 f2fs: guarantee to write dirty data when enabling checkpoint back
    75ffcd85dff5 iwlwifi Add support for ax201 in Samsung Galaxy Book Flex2 Alpha
    3853c0c0703d ASoC: rt5682: Remove unused variable in rt5682_i2c_remove()
    c4f1ad393026 ipv4: fix endianness issue in inet_rtm_getroute_build_skb()
    dc4ff31506f4 octeontx2-af: Set proper errorcode for IPv4 checksum errors
    bf2991f8e783 octeontx2-af: Fix static code analyzer reported issues
    ee485124b7fa octeontx2-af: Fix loop in free and unmap counter
    a67c66c1bb12 net: qualcomm: fix QCA7000 checksum handling
    f96bc82e0348 net: sched: Fix qdisc_rate_table refcount leak when get tcf_block failed
    5867e20e1808 ipv4: make exception cache less predictible
    8692f0bb2992 ipv6: make exception cache less predictible
    4663aaef24df brcmfmac: pcie: fix oops on failure to resume and reprobe
    e68128e078da bcma: Fix memory leak for internally-handled cores
    26fae720c112 atlantic: Fix driver resume flow.
    cb996dc9f937 ath6kl: wmi: fix an error code in ath6kl_wmi_sync_point()
    baecab8c469f ice: Only lock to update netdev dev_addr
    bd6d9c83f44d iwlwifi: skip first element in the WTAS ACPI table
    4c4f868082ed iwlwifi: follow the new inclusive terminology
    5c305b90d8a1 ASoC: wcd9335: Disable irq on slave ports in the remove function
    729a459efd30 ASoC: wcd9335: Fix a memory leak in the error handling path of the probe function
    9c640a2bb551 ASoC: wcd9335: Fix a double irq free in the remove function
    8446bb0ff1d0 tty: serial: fsl_lpuart: fix the wrong mapbase value
    9ee4ff8cbe39 usb: bdc: Fix a resource leak in the error handling path of 'bdc_probe()'
    4d2823abd1fe usb: bdc: Fix an error handling path in 'bdc_probe()' when no suitable DMA config is available
    86b79054d76b usb: ehci-orion: Handle errors of clk_prepare_enable() in probe
    f0bb63127354 i2c: xlp9xx: fix main IRQ check
    7ac3090e0123 i2c: mt65xx: fix IRQ check
    6c4857203ffa CIFS: Fix a potencially linear read overflow
    b0491ab7d4c7 bpf: Fix possible out of bound write in narrow load handling
    cfaefbcc6bc4 mmc: moxart: Fix issue with uninitialized dma_slave_config
    ced0bc748185 mmc: dw_mmc: Fix issue with uninitialized dma_slave_config
    8a9f9b97558e mmc: sdhci: Fix issue with uninitialized dma_slave_config
    dd903083cbe4 ASoC: Intel: Skylake: Fix module resource and format selection
    b0159dbd1dd6 ASoC: Intel: Skylake: Leave data as is when invoking TLV IPCs
    7934c79fb0ed ASoC: Intel: kbl_da7219_max98927: Fix format selection for max98373
    56d976f45000 rsi: fix an error code in rsi_probe()
    110ce7d256a3 rsi: fix error code in rsi_load_9116_firmware()
    b4bbb77d886b gfs2: init system threads before freeze lock
    ee029e3aa129 i2c: hix5hd2: fix IRQ check
    d36ab9b3ee49 i2c: fix platform_get_irq.cocci warnings
    187705a4b1fa i2c: s3c2410: fix IRQ check
    3913fa307a33 i2c: iop3xx: fix deferred probing
    50e6f34499a5 Bluetooth: add timeout sanity check to hci_inquiry
    cc59ad70cfb6 lkdtm: replace SCSI_DISPATCH_CMD with SCSI_QUEUE_RQ
    9295566a136c mm/swap: consider max pages in iomap_swapfile_add_extent
    a9c29bc2a578 usb: gadget: mv_u3d: request_irq() after initializing UDC
    b2f4dd13b211 firmware: raspberrypi: Fix a leak in 'rpi_firmware_get()'
    60831f5ae6c7 firmware: raspberrypi: Keep count of all consumers
    5c68b7795b4c i2c: synquacer: fix deferred probing
    f577e9f58ff0 clk: staging: correct reference to config IOMEM to config HAS_IOMEM
    5ae5f087c9d6 arm64: dts: marvell: armada-37xx: Extend PCIe MEM space
    cb788d698a10 nfsd4: Fix forced-expiry locking
    c9773f42c1de lockd: Fix invalid lockowner cast after vfs_test_lock
    2600861b9069 locking/local_lock: Add missing owner initialization
    d5462a630f7d locking/lockdep: Mark local_lock_t
    22b106df73c6 mac80211: Fix insufficient headroom issue for AMSDU
    0ad4ddb27e2b libbpf: Re-build libbpf.so when libbpf.map changes
    494629ba62a9 usb: phy: tahvo: add IRQ check
    46638d6941ee usb: host: ohci-tmio: add IRQ check
    4b7874a32ec2 PM: cpu: Make notifier chain use a raw_spinlock_t
    471128476819 Bluetooth: Move shutdown callback before flushing tx and rx queue
    d993a6f137ec samples: pktgen: add missing IPv6 option to pktgen scripts
    2c0b826f4a79 devlink: Clear whole devlink_flash_notify struct
    2aa3d5c9e19e selftests/bpf: Fix test_core_autosize on big-endian machines
    c03bf1bc84ea usb: gadget: udc: renesas_usb3: Fix soc_device_match() abuse
    eabbb2e8cc41 usb: phy: twl6030: add IRQ checks
    fa5dbfd53982 usb: phy: fsl-usb: add IRQ check
    99ad1be3e9cb usb: gadget: udc: s3c2410: add IRQ check
    0a7731458968 usb: gadget: udc: at91: add IRQ check
    27f102bcee52 usb: dwc3: qcom: add IRQ check
    c4e0f54a56d0 usb: dwc3: meson-g12a: add IRQ check
    96ba1e20e252 ASoC: rt5682: Properly turn off regulators if wrong device ID
    1a2feb23043b ASoC: rt5682: Implement remove callback
    628acf6ee2f1 net/mlx5: Fix unpublish devlink parameters
    fe6322774ca2 net/mlx5: Register to devlink ingress VLAN filter trap
    dbeb4574ddf0 drm/msm/dsi: Fix some reference counted resource leaks
    059c2c09f4b7 Bluetooth: fix repeated calls to sco_sock_kill
    6df58421da13 ASoC: Intel: Fix platform ID matching
    10dfcfda5c6f cgroup/cpuset: Fix violation of cpuset locking rule
    cbc97661439d cgroup/cpuset: Miscellaneous code cleanup
    974ab0a04fe6 counter: 104-quad-8: Return error when invalid mode during ceiling_write
    c158f9b23279 arm64: dts: exynos: correct GIC CPU interfaces address range on Exynos7
    7125705623f9 drm/msm/dpu: make dpu_hw_ctl_clear_all_blendstages clear necessary LMs
    a6e980b110d2 drm/msm/mdp4: move HW revision detection to earlier phase
    90363618b552 drm/msm/mdp4: refactor HW revision detection into read_mdp_hw_revision
    416929eaf44e selftests/bpf: Fix bpf-iter-tcp4 test to print correctly the dest IP
    d6337dfd1e77 PM: EM: Increase energy calculation precision
    5014a8453f02 Bluetooth: increase BTNAMSIZ to 21 chars to fix potential buffer overflow
    afffa7b4c6e4 debugfs: Return error during {full/open}_proxy_open() on rmmod
    17830b041534 soc: qcom: smsm: Fix missed interrupts if state changes while masked
    b8361513ac76 bpf, samples: Add missing mprog-disable to xdp_redirect_cpu's optstring
    cd6008e31af0 PCI: PM: Enable PME if it can be signaled from D3cold
    3890c6e1da31 PCI: PM: Avoid forcing PCI_D0 for wakeup reasons inconsistently
    eda4ccca906f media: venus: venc: Fix potential null pointer dereference on pointer fmt
    519ad41a0989 media: em28xx-input: fix refcount bug in em28xx_usb_disconnect
    a7dd8b778a4d leds: trigger: audio: Add an activate callback to ensure the initial brightness is set
    917191d582f9 leds: lt3593: Put fwnode in any case during ->probe()
    eef8496579de i2c: highlander: add IRQ check
    11dd40c18918 net/mlx5: Fix missing return value in mlx5_devlink_eswitch_inline_mode_set()
    b376ae5597fc devlink: Break parameter notification sequence to be before/after unload/load driver
    9fa9ff10408f arm64: dts: renesas: hihope-rzg2-ex: Add EtherAVB internal rx delay
    e4da0e0006f9 arm64: dts: renesas: rzg2: Convert EtherAVB to explicit delay handling
    61b1db235868 Bluetooth: mgmt: Fix wrong opcode in the response for add_adv cmd
    bca46d228393 net: cipso: fix warnings in netlbl_cipsov4_add_std
    b6b5dc12bd7c drm: mxsfb: Clear FIFO_CLEAR bit
    1a0014c1c62c drm: mxsfb: Increase number of outstanding requests on V4 and newer HW
    46f546394063 drm: mxsfb: Enable recovery on underflow
    e0f3de1573fd cgroup/cpuset: Fix a partition bug with hotplug
    7a0b297480dd net/mlx5e: Block LRO if firmware asks for tunneled LRO
    c40ed983b874 net/mlx5e: Prohibit inner indir TIRs in IPoIB
    a11fc1cd8a31 ARM: dts: meson8b: ec100: Fix the pwm regulator supply properties
    2e68547e99a7 ARM: dts: meson8b: mxq: Fix the pwm regulator supply properties
    0d40e59c03b8 ARM: dts: meson8b: odroidc1: Fix the pwm regulator supply properties
    eda87dd4738a ARM: dts: meson8: Use a higher default GPU clock frequency
    a7d0a59e21ef tcp: seq_file: Avoid skipping sk during tcp_seek_last_pos
    1f60072320b5 drm/amdgpu/acp: Make PM domain really work
    c7ebd3622bf8 6lowpan: iphc: Fix an off-by-one check of array index
    def6efdf91e7 Bluetooth: sco: prevent information leak in sco_conn_defer_accept()
    e9a62740876b media: atomisp: fix the uninitialized use and rename "retvalue"
    b0e87701b813 media: coda: fix frame_mem_ctrl for YUV420 and YVU420 formats
    c062253748d8 media: rockchip/rga: fix error handling in probe
    dc49537334a7 media: rockchip/rga: use pm_runtime_resume_and_get()
    94d6aa2b871f media: go7007: remove redundant initialization
    ffd9c8cecbad media: go7007: fix memory leak in go7007_usb_probe
    fb22665c37b3 media: dvb-usb: Fix error handling in dvb_usb_i2c_init
    6b0fe6953430 media: dvb-usb: fix uninit-value in vp702x_read_mac_addr
    372890e0b41e media: dvb-usb: fix uninit-value in dvb_usb_adapter_dvb_init
    83f7297a4af4 ionic: cleanly release devlink instance
    203537ff35ea driver core: Fix error return code in really_probe()
    4225d357bc75 firmware: fix theoretical UAF race with firmware cache and resume
    c4aaad8a3389 gfs2: Fix memory leak of object lsi on error return path
    8c3b5028ec02 libbpf: Fix removal of inner map in bpf_object__create_map
    ffb887c15f7f soc: qcom: rpmhpd: Use corner in power_off
    f32b433d8e25 i40e: improve locking of mac_filter_hash
    5ac21a4e6e85 arm64: dts: renesas: r8a77995: draak: Remove bogus adv7511w properties
    a8c1eaed2374 ARM: dts: aspeed-g6: Fix HVI3C function-group in pinctrl dtsi
    6ca0b4089166 libbpf: Fix the possible memory leak on error
    f1673e85254d gve: fix the wrong AdminQ buffer overflow check
    1568dbe8892d drm/of: free the iterator object on failure
    389dfd114780 bpf: Fix potential memleak and UAF in the verifier.
    d4213b709316 bpf: Fix a typo of reuseport map in bpf.h.
    56e5c527cc2e drm/of: free the right object
    38235f195de9 media: cxd2880-spi: Fix an error handling path
    25fbfc31ceec soc: rockchip: ROCKCHIP_GRF should not default to y, unconditionally
    c391728c9b25 leds: is31fl32xx: Fix missing error code in is31fl32xx_parse_dt()
    d4abb6e14105 media: TDA1997x: enable EDID support
    8ce22f85381f ASoC: mediatek: mt8183: Fix Unbalanced pm_runtime_enable in mt8183_afe_pcm_dev_probe
    3d58f5e83f97 drm/gma500: Fix end of loop tests for list_for_each_entry
    54912723f16b drm/panfrost: Fix missing clk_disable_unprepare() on error in panfrost_clk_init()
    1e1423449d1c EDAC/i10nm: Fix NVDIMM detection
    a20e6868cbfc spi: spi-zynq-qspi: use wait_for_completion_timeout to make zynq_qspi_exec_mem_op not interruptible
    e2cb04c61bcf spi: sprd: Fix the wrong WDG_LOAD_VAL
    cd8cca7268a2 regulator: vctrl: Avoid lockdep warning in enable/disable ops
    8665e30317c8 regulator: vctrl: Use locked regulator_get_voltage in probe path
    80b1a70b0450 blk-crypto: fix check for too-large dun_bytes
    ba6e5af621ab spi: davinci: invoke chipselect callback
    c0aec70a256c x86/mce: Defer processing of early errors
    6627be8b36dc tpm: ibmvtpm: Avoid error message when process gets signal while waiting
    bd2028e9e27c certs: Trigger creation of RSA module signing key if it's not an RSA key
    fddf3a72abe1 crypto: qat - use proper type for vf_mask
    e7273d57d2b7 irqchip/gic-v3: Fix priority comparison when non-secure priorities are used
    f1f6d3d2ada8 spi: coldfire-qspi: Use clk_disable_unprepare in the remove function
    4b21d4e820bb block: nbd: add sanity check for first_minor
    31fc50cd93cd clocksource/drivers/sh_cmt: Fix wrong setting if don't request IRQ for clock source channel
    dde7ff1c1977 lib/mpi: use kcalloc in mpi_resize
    20d84fc59e85 irqchip/loongson-pch-pic: Improve edge triggered interrupt support
    e9a902f88207 genirq/timings: Fix error return code in irq_timings_test_irqs()
    10d3bdd2d578 spi: spi-pic32: Fix issue with uninitialized dma_slave_config
    d4ec971bfa88 spi: spi-fsl-dspi: Fix issue with uninitialized dma_slave_config
    87aa69aa10b4 block: return ELEVATOR_DISCARD_MERGE if possible
    386850718153 m68k: Fix invalid RMW_INSNS on CPUs that lack CAS
    497f3d9c3f58 rcu: Fix stall-warning deadlock due to non-release of rcu_node ->lock
    ea5e5bc881a4 rcu: Add lockdep_assert_irqs_disabled() to rcu_sched_clock_irq() and callees
    527b56d7856f rcu: Fix to include first blocked task in stall warning
    e6778e1b22d0 sched: Fix UCLAMP_FLAG_IDLE setting
    718180c24675 sched/numa: Fix is_core_idle()
    bf4b0fa3a2e2 m68k: emu: Fix invalid free in nfeth_cleanup()
    246c771b8562 power: supply: cw2015: use dev_err_probe to allow deferred probe
    a758b1d4ca20 s390/ap: fix state machine hang after failure to enable irq
    86f9980909f3 s390/debug: fix debug area life cycle
    0980d2b21f4d s390/debug: keep debug data on resize
    0404bf4a660c s390/pci: fix misleading rc in clp_set_pci_fn()
    8b471e72b51e s390/kasan: fix large PMD pages address alignment check
    9d999957cb39 udf_get_extendedattr() had no boundary checks.
    db2f238d8d12 fcntl: fix potential deadlock for &fasync_struct.fa_lock
    349633ed311c crypto: qat - do not export adf_iov_putmsg()
    205cfad5c0ca crypto: qat - fix naming for init/shutdown VF to PF notifications
    c29cc43e30ba crypto: qat - fix reuse of completion variable
    e53575ea28d9 crypto: qat - handle both source of interrupt in VF ISR
    9819975c636c crypto: qat - do not ignore errors from enable_vf2pf_comms()
    6f3c58bd62f2 crypto: omap - Fix inconsistent locking of device lists
    fc4073df2968 libata: fix ata_host_start()
    cf619a528e01 s390/zcrypt: fix wrong offset index for APKA master key valid state
    b4aa00bf8a4d s390/cio: add dev_busid sysfs entry for each subchannel
    d0831db736bb power: supply: max17042_battery: fix typo in MAx17042_TOFF
    5d59f38c6ba5 power: supply: smb347-charger: Add missing pin control activation
    10e759e350d7 nvmet: pass back cntlid on successful completion
    ea4a353c0ef4 nvme-rdma: don't update queue count when failing to set io queues
    5d0f0c3bbe99 nvme-tcp: don't update queue count when failing to set io queues
    591f69d7c415 blk-throtl: optimize IOPS throttle for large IO scenarios
    cf13537be54c bcache: add proper error unwinding in bcache_device_init
    48aa6e4e28c4 isofs: joliet: Fix iocharset=utf8 mount option
    940ac461323e udf: Fix iocharset=utf8 mount option
    4cf1551af31d udf: Check LVID earlier
    3d12ccecfa31 hrtimer: Ensure timerfd notification for HIGHRES=n
    aadfa1d6ca5f hrtimer: Avoid double reprogramming in __hrtimer_start_range_ns()
    13ccaef77ee8 posix-cpu-timers: Force next expiration recalc after itimer reset
    8a6c5eec811c EDAC/mce_amd: Do not load edac_mce_amd module on guests
    4b680b3fc6f3 rcu/tree: Handle VM stoppage in stall detection
    1cc05d71f04d sched/deadline: Fix missing clock update in migrate_task_rq_dl()
    104adbffbe4c crypto: omap-sham - clear dma flags only after omap_sham_update_dma_stop()
    ce7f2b516c77 power: supply: axp288_fuel_gauge: Report register-address on readb / writeb errors
    3ebd7b38415e sched/deadline: Fix reset_on_fork reporting of DL tasks
    8c4d94db5acd crypto: mxs-dcp - Check for DMA mapping errors
    7bb6302e9d09 regulator: tps65910: Silence deferred probe error
    a85985099644 regmap: fix the offset of register error log
    97bc540bfb61 locking/mutex: Fix HANDOFF condition
    cb83afdc0b86 Linux 5.10.64
    f72fce550709 PCI: Call Max Payload Size-related fixup quirks early
    8c04a16d2037 x86/reboot: Limit Dell Optiplex 990 quirk to early BIOS versions
    1234849353b0 xhci: fix unsafe memory usage in xhci tracing
    3f7f1baf7045 xhci: fix even more unsafe memory usage in xhci tracing
    30e6e9f8bf2c usb: mtu3: fix the wrong HS mult value
    8a4439aaf4f7 usb: mtu3: use @mult for HS isoc or intr
    147819723c74 usb: mtu3: restore HS function when set SS/SSP
    c75e2fd0d3c5 usb: gadget: tegra-xudc: fix the wrong mult value for HS isoc or intr
    d544c9a2190a usb: host: xhci-rcar: Don't reload firmware after the completion
    c3fd7b0b9aa1 ALSA: usb-audio: Add registration quirk for JBL Quantum 800
    798679af7978 blk-mq: clearing flush request reference in tags->rqs[]
    e51ff3ffc316 netfilter: nftables: clone set element expression template
    36983fc2f87e netfilter: nf_tables: initialize set before expression setup
    3fda454f909c netfilter: nftables: avoid potential overflows on 32bit arches
    cad6239f5080 blk-mq: fix is_flush_rq
    ceffaa61b5bb blk-mq: fix kernel panic during iterating over flush request
    bc1b5c5f3e3b x86/events/amd/iommu: Fix invalid Perf result due to IOMMU PMC power-gating
    554efc9a6138 Revert "r8169: avoid link-up interrupt issue on RTL8106e if user enables ASPM"
    d24347e2ff11 tty: drop termiox user definitions
    0757a883b970 net: linux/skbuff.h: combine SKB_EXTENSIONS + KCOV handling
    0b62660c6a33 serial: 8250: 8250_omap: Fix unused variable warning
    7ff0b71b6826 net: kcov: don't select SKB_EXTENSIONS when there is no NET
    c4225992060b mm/page_alloc: speed up the iteration of max_order
    50e56c68e1ef net: ll_temac: Remove left-over debug message
    6e2c4e665623 USB: serial: mos7720: improve OOM-handling in read_mos_reg()
    ddd7e8b7b848 igmp: Add ip_mc_list lock in ip_check_mc_rcu

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 097dd7b5f9..9dcf12978e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "31e2870ebfd892708e8c5f3aced96565e2456ed9"
-SRCREV_meta ?= "bce2813b162bb472c137fb503951295a931c25b6"
+SRCREV_machine ?= "eacfb1f85fa42b93fa7404db6e92f64755ab413b"
+SRCREV_meta ?= "917c420111475e33a26f46a9a2855b973ffffadb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.63"
+LINUX_VERSION ?= "5.10.69"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 0693a57613..36cd6a97e6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.63"
+LINUX_VERSION ?= "5.10.69"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "96ec3026283d29493f757a077f9c51e6d698c634"
-SRCREV_machine ?= "29ff88e6cdf170fbf71e27de32c09e4f6db95078"
-SRCREV_meta ?= "bce2813b162bb472c137fb503951295a931c25b6"
+SRCREV_machine:qemuarm ?= "b2766d667c5cad7ba4a9e9aeae3f5eefcb9ebd65"
+SRCREV_machine ?= "18ab4d1dd191b24702819546edf212e08c31a4bd"
+SRCREV_meta ?= "917c420111475e33a26f46a9a2855b973ffffadb"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 7c163436fb..3483440a98 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "36e0cc294f77cf72b01a1f9ea62bb13d1ab0693e"
-SRCREV_machine:qemuarm64 ?= "a1c9c936088b6cf4ec56f5180672d6f0e8e3b955"
-SRCREV_machine:qemumips ?= "4962920baaee3235448b48e992a3da0259dcfa57"
-SRCREV_machine:qemuppc ?= "57b30ad7f8a6c3be0ad8eac742476da3f97c23f3"
-SRCREV_machine:qemuriscv64 ?= "164ed895bc1e94722e80fe6496b176f6bb815cd4"
-SRCREV_machine:qemuriscv32 ?= "164ed895bc1e94722e80fe6496b176f6bb815cd4"
-SRCREV_machine:qemux86 ?= "164ed895bc1e94722e80fe6496b176f6bb815cd4"
-SRCREV_machine:qemux86-64 ?= "164ed895bc1e94722e80fe6496b176f6bb815cd4"
-SRCREV_machine:qemumips64 ?= "a615aa60bc10bea5262f2d65da7ddff4ba32146e"
-SRCREV_machine ?= "164ed895bc1e94722e80fe6496b176f6bb815cd4"
-SRCREV_meta ?= "bce2813b162bb472c137fb503951295a931c25b6"
+SRCREV_machine:qemuarm ?= "f0a07ccc216dccb7f0848e9bea2c08477dd6ffd6"
+SRCREV_machine:qemuarm64 ?= "1c230985587271d78518e16b8ab96d3743987e83"
+SRCREV_machine:qemumips ?= "e610948faefc5eb3b4980cc7745fc84e1bb70990"
+SRCREV_machine:qemuppc ?= "6ea059e2da8dfa75043db8ff402a66947c1c9d83"
+SRCREV_machine:qemuriscv64 ?= "a46a7f753466a319b6e95dac76caefaba6358094"
+SRCREV_machine:qemuriscv32 ?= "a46a7f753466a319b6e95dac76caefaba6358094"
+SRCREV_machine:qemux86 ?= "a46a7f753466a319b6e95dac76caefaba6358094"
+SRCREV_machine:qemux86-64 ?= "a46a7f753466a319b6e95dac76caefaba6358094"
+SRCREV_machine:qemumips64 ?= "fd474c7b135e4f11af56a159ab8944610674eae8"
+SRCREV_machine ?= "a46a7f753466a319b6e95dac76caefaba6358094"
+SRCREV_meta ?= "917c420111475e33a26f46a9a2855b973ffffadb"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.63"
+LINUX_VERSION ?= "5.10.69"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


