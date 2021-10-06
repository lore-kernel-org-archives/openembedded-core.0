Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFC2C4332F
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 00:12:52 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.5136.1633479171008019827
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 17:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A1tJwlzA;
 spf=pass (domain: gmail.com, ip: 209.85.219.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 11so781043qvd.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 17:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1aHyRlj/c0gwgebwXxvtLOPHpwZkJEd8ix0uF9GhZz0=;
        b=A1tJwlzAULQjIE5CKQcivd3ggmaLqK1OU/1DCol4j/zE9wFanhjDDxdM+Z4hsnotpy
         Kqh1uHtU0eZu58ebsEibIfZj5Ea6Ihn8VjmpBm1DJZsZSWdOQjn9bjFSsGFk2xwGzHfz
         QM7soimdCkn79XnjXkGeUuhY7tVBhmAzbPE7vzyq7NsRIKGV8zCHubVumo/RhIbhJRNC
         QbGYtHqPqhRuI4zHXzx20uMU0TpDIFixhoUYR3CoeYzOTTqO18KHaKVEdgSd7DgREspC
         5++TPgflxjxPeaEaXrgKqpVtc+ON/liMCtfGNdLXaGMsZMAoQRKUI+KPd/fBNUqhNzZB
         fX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1aHyRlj/c0gwgebwXxvtLOPHpwZkJEd8ix0uF9GhZz0=;
        b=tO8DbgBYBOkGLI40RCVsRAFht/XmxWRld0LF6ECrH63ytjiFtwKUCt8EfVJ3z5IV0B
         oSBZFNAN2xlue9d2cjAuTked32MXOe2ONiuMixWptm+pd1YypjULQ/wY8CdNFs/uzNrB
         7dcG8mCwVDyeT8OS5OP2uxturj+7uL+CKOWL9syi6lFNKGZaMgd7YdELinMja6Cd3Sp2
         WMZfLDzuEYmSSCrb45tKP+HSeYqPepoC63AS5oyXfED0HWd2O5jDEo0nkoPg/FMUX/do
         g4CBBD/4mBvfzGVeNsxQTNxoyUq+53Y+gBap4GbK9HXlLP2vj4BuMQw1bhqx+Q3Mul+2
         Mlbw==
X-Gm-Message-State: AOAM532Z6f3eea7Z6+EHZzW+30yX4TvgwEh4/PN0EhVMSocwmAMoQiBM
	wiuBZA56HGmRozAuddi5PdWTIQrmSL/nOA==
X-Google-Smtp-Source: 
 ABdhPJyjEcgkop48/3ogiaghNd+uQvMjhcGRFfvdQcIYohw9a22fqbgJSlis1T0xvnjFvcBdj3rQ/A==
X-Received: by 2002:a0c:8cc3:: with SMTP id q3mr30194357qvb.19.1633479169834;
        Tue, 05 Oct 2021 17:12:49 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 bk20sm11275922qkb.13.2021.10.05.17.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 17:12:49 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] linux-yocto/5.14: update to v5.14.8
Date: Tue,  5 Oct 2021 20:12:41 -0400
Message-Id: 
 <6d69ccc29737fd54178ddeeb78927915c591163a.1633478971.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1633478971.git.bruce.ashfield@gmail.com>
References: <cover.1633478971.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 00:12:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156662

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.14 to the latest korg -stable release that comprises
the following commits:

    c34892e1995d Linux 5.14.8
    1236431c8531 drm/nouveau/nvkm: Replace -ENOSYS with -ENODEV
    bef2b32a1490 selinux,smack: fix subjective/objective credential use mixups
    dcd45a08b9a6 io_uring: fix off-by-one in BUILD_BUG_ON check of __REQ_F_LAST_BIT
    d1217e40d082 cifs: properly invalidate cached root handle when closing it
    cacfce79af9b sched/idle: Make the idle timer expire in hard interrupt context
    affd236df3e8 rtc: rx8010: select REGMAP_I2C
    46384252a8f4 blk-mq: allow 4x BLK_MAX_REQUEST_COUNT at blk_plug for multiple_queues
    a3330c1c8319 blk-throttle: fix UAF by deleteing timer in blk_throtl_exit()
    2ab96bfe3201 block: genhd: don't call blkdev_show() with major_names_lock held
    e2860e2175c0 nvmet: fixup buffer overrun in nvmet_subsys_attr_serial()
    da6643141740 pwm: stm32-lp: Don't modify HW state in .remove() callback
    2c92f9e8e039 pwm: rockchip: Don't modify HW state in .remove() callback
    f53bd7fe1bf6 pwm: img: Don't modify HW state in .remove() callback
    ddd8601dd853 habanalabs: cannot sleep while holding spinlock
    f621eeead8d6 habanalabs: add "in device creation" status
    836c0806500d habanalabs: fix mmu node address resolution in debugfs
    46d712b46080 habanalabs: add validity check for event ID received from F/W
    350b2f2b1f2a drm/amdgpu: fix fdinfo race with process exit
    25b4e51e2333 drm/amd/display: Fix memory leak reported by coverity
    682645659796 drm/amdgpu: Fixes to returning VBIOS RAS EEPROM address
    d5b10c0b4288 habanalabs: fix nullifying of destroyed mmu pgt pool
    d51100f73561 thermal/drivers/rcar_gen3_thermal: Store TSC id as unsigned int
    0ea5f803c39d nilfs2: fix memory leak in nilfs_sysfs_delete_snapshot_group
    7797daf14c3f nilfs2: fix memory leak in nilfs_sysfs_create_snapshot_group
    6e17978ca9b8 nilfs2: fix memory leak in nilfs_sysfs_delete_##name##_group
    90b8f51480a4 nilfs2: fix memory leak in nilfs_sysfs_create_##name##_group
    e005476348f9 nilfs2: fix NULL pointer in nilfs_##name##_attr_release
    255c3bfa2826 nilfs2: fix memory leak in nilfs_sysfs_create_device_group
    0e78f3da8e58 btrfs: fix lockdep warning while mounting sprout fs
    ebed7d89e54c btrfs: delay blkdev_put until after the device remove
    13d4c38e5c51 btrfs: update the bdev time directly when closing
    e0f8639c87e1 s390/unwind: use current_frame_address() to unwind current task
    31db9b13e54e ceph: lockdep annotations for try_nonblocking_invalidate
    6ca3781b4664 ceph: remove the capsnaps when removing caps
    8e46eccfc10f ceph: request Fw caps before updating the mtime in ceph_write_iter
    8e4e080b2be0 ceph: fix memory leak on decode error in ceph_handle_caps
    abae6b3bab39 ACPI: PM: s2idle: Run both AMD and Microsoft methods if both are supported
    417cd319e998 ASoC: audio-graph: respawn Platform Support
    0a96c9734bd8 s390: add kmemleak annotation in stack_alloc()
    5c9fc5418714 dmaengine: xilinx_dma: Set DMA mask for coherent APIs
    996a4337be96 dmaengine: ioat: depends on !UML
    964a98344922 cxl/pci: Introduce cdevm_file_operations
    e921d59a75c7 cxl: Move cxl_core to new directory
    786c11aebd4f dmaengine: sprd: Add missing MODULE_DEVICE_TABLE
    70100a0fb72d dmaengine: idxd: depends on !UML
    4d74704a3975 riscv: dts: microchip: mpfs-icicle: Fix serial console
    f8d2c2cfbff3 of: property: Disable fw_devlink DT support for X86
    f7525b4c5d40 drm/ttm: Fix a deadlock if the target BO is not idle during swap
    3a4a126d3515 arm64: mm: limit linear region to 51 bits for KVM in nVHE mode
    4ca60140f83e iommu/vt-d: Fix a deadlock in intel_svm_drain_prq()
    cab628d695ab iommu/vt-d: Fix PASID leak in intel_svm_unbind_mm()
    f74210e642c8 iommu/amd: Relocate GAMSup check to early_enable_iommus
    2d0bfe7e6f5d parisc: Move pci_dev_is_behind_card_dino to where it is used
    9a9d2fb4995a dma-buf: DMABUF_DEBUG should depend on DMA_SHARED_BUFFER
    7eb2c8604702 dma-buf: DMABUF_MOVE_NOTIFY should depend on DMA_SHARED_BUFFER
    0a1b8623d10c drivers: base: cacheinfo: Get rid of DEFINE_SMP_CALL_CACHE_FUNCTION()
    52cf80714d50 drm/amdgpu: Disable PCIE_DPM on Intel RKL Platform
    654b40ff096e thermal/core: Fix thermal_cooling_device_register() prototype
    57df1f724b35 tracing/boot: Fix to loop on only subkeys
    59faa7816df1 tools/bootconfig: Fix tracing_on option checking in ftrace2bconf.sh
    bdf3f584913c Kconfig.debug: drop selecting non-existing HARDLOCKUP_DETECTOR_ARCH
    71f9ab9c157c init: move usermodehelper_enable() to populate_rootfs()
    4abef9e11035 math: RATIONAL_KUNIT_TEST should depend on RATIONAL instead of selecting it
    7e68a2bd2169 SUNRPC: don't pause on incomplete allocation
    bf55b052cfeb s390/entry: make oklabel within CHKSTG macro local
    674534e6327e platform/chrome: cros_ec_trace: Fix format warnings
    c3315f6436e7 platform/chrome: sensorhub: Add trace events for sample
    0e53af9116e4 dmaengine: idxd: clear block on fault flag when clear wq
    ecf3158aad68 dmaengine: idxd: fix abort status check
    858343654607 dmaengine: idxd: fix wq slot allocation index check
    6c578df6fdd9 dmaengine: idxd: have command status always set
    acf769fe268d dmanegine: idxd: cleanup all device related bits after disabling device
    81680e81b71a pwm: mxs: Don't modify HW state in .probe() after the PWM chip was registered
    1c90a357cef4 pwm: lpc32xx: Don't modify HW state in .probe() after the PWM chip was registered
    ec33d4bcec80 ceph: cancel delayed work instead of flushing on mdsc teardown
    02006feaf26f thermal/drivers/qcom/spmi-adc-tm5: Don't abort probing if a sensor is not used
    04864f20674f PM: sleep: core: Avoid setting power.must_resume to false
    07906d13ba6b profiling: fix shift-out-of-bounds bugs
    ada62fe1bdbc nilfs2: use refcount_dec_and_lock() to fix potential UAF
    154d764b1f82 prctl: allow to setup brk for et_dyn executables
    861006fa37d8 pwm: ab8500: Fix register offset calculation to not depend on probe order
    bc013a3943af 9p/trans_virtio: Remove sysfs file on probe failure
    e0e873820b55 thermal/drivers/exynos: Fix an error code in exynos_tmu_probe()
    61c87f0674e5 n64cart: fix return value check in n64cart_probe()
    8843c3dc1ad2 staging: rtl8723bs: fix wpa_set_auth_algs() function
    24a026e4ae1d perf tools: Allow build-id with trailing zeros
    60a830dc0a2b perf symbol: Look for ImageBase in PE file to compute .text offset
    d4e7c85ae25f perf test: Fix bpf test sample mismatch reporting
    b005ce62b39c dmaengine: acpi: Avoid comparison GSI with Linux vIRQ
    e0291e6fb03d RDMA/mlx5: Fix xlt_chunk_align calculation
    e00e0ed534a2 RDMA/hns: Enable stash feature of HIP09
    6909fa41fbd4 um: virtio_uml: fix memory leak on init failures
    dc25d3bebac1 coredump: fix memleak in dump_vma_snapshot()
    069c28830690 um: fix stub location calculation
    5cd412eda5d6 staging: rtl8192u: Fix bitwise vs logical operator in TranslateRxSignalStuff819xUsb()
    f59fcad27535 console: consume APC, DM, DCS
    fb28e3d5d0d8 PCI: aardvark: Fix reporting CRS value
    952d4ed0bd65 PCI: pci-bridge-emul: Add PCIe Root Capabilities Register
    56c0ace445bd Linux 5.14.7
    a7593244dc31 s390/bpf: Fix branch shortening during codegen pass
    6a8787093b04 s390/bpf: Fix 64-bit subtraction of the -0x80000000 constant
    7a31ec4d215a s390/bpf: Fix optimizing out zero-extensions
    10203c14d608 net: dsa: bcm_sf2: Fix array overrun in bcm_sf2_num_active_ports()
    45c0e1ee3e9f bnxt_en: Fix error recovery regression
    47b119613dcf net: renesas: sh_eth: Fix freeing wrong tx descriptor
    45f8ba56d4dd cxgb3: fix oops on module removal
    dc2ebd4105b0 mfd: lpc_sch: Rename GPIOBASE to prevent build error
    4666248379e9 ip6_gre: Revert "ip6_gre: add validation for csum_start"
    9ae3fccac631 bnxt_en: Fix possible unintended driver initiated error recovery
    05935d1da3c7 bnxt_en: Fix asic.rev in devlink dev info command
    a4dc86f679b2 bnxt_en: fix stored FW_PSID version masks
    c70b2b2ca0c0 net: dsa: b53: Fix IMP port setup on BCM5301x
    4bf5d5224ffc ip_gre: validate csum_start only on pull
    faa3bd11de91 iwlwifi: pnvm: Fix a memory leak in 'iwl_pnvm_get_from_fs()'
    b5fe5a750923 iwlwifi: move get pnvm file name to a separate function
    2b6c8100c693 qlcnic: Remove redundant unlock in qlcnic_pinit_from_rom
    ec5150055362 fq_codel: reject silly quantum parameters
    7d0458a67e6d netfilter: socket: icmp6: fix use-after-scope
    864251f26753 mptcp: Only send extra TCP acks in eligible socket states
    bd65986f3e2d net: dsa: b53: Set correct number of ports in the DSA struct
    7c5800c3cab8 net: dsa: b53: Fix calculating number of switch ports
    98641c732e95 net: hso: add failure handler for add_net_device
    5d37e739f531 selftests: mptcp: clean tmp files in simult_flows
    e35820fb5641 mptcp: fix possible divide by zero
    122a20d062e8 tools build: Fix feature detect clean for out of source builds
    e67dcd6556fa net: dsa: tag_rtl4_a: Fix egress tags
    fcf7264e8714 io_uring: retry in case of short read on block device
    e7009e8ecdf6 gpio: mpc8xxx: Use 'devm_gpiochip_add_data()' to simplify the code and avoid a leak
    450adfabe059 gpio: mpc8xxx: Fix a potential double iounmap call in 'mpc8xxx_probe()'
    8c7ba0ec7c45 gpio: mpc8xxx: Fix a resources leak in the error handling path of 'mpc8xxx_probe()'
    17bf84a9e8a2 perf bench inject-buildid: Handle writen() errors
    20e60bf86492 perf unwind: Do not overwrite FEATURE_CHECK_LDFLAGS-libunwind-{x86,aarch64}
    82d7271c9ead perf config: Fix caching and memory leak in perf_home_perfconfig()
    eb15078cd848 ARC: export clear_user_page() for modules
    6989067d55cd mtd: rawnand: cafe: Fix a resource leak in the error handling path of 'cafe_nand_probe()'
    08a901da171d watchdog: Fix NULL pointer dereference when releasing cdev
    59aba0148404 PCI: Sync __pci_register_driver() stub for CONFIG_PCI=n
    638fb35ca3e4 PCI/PTM: Remove error message at boot
    b3c9eff1a853 KVM: arm64: Handle PSCI resets before userspace touches vCPU state
    bd5ad57a4dc7 KVM: arm64: Fix read-side race on updates to vcpu reset state
    7655140eda86 mtd: mtdconcat: Check _read, _write callbacks existence before assignment
    5cd5c566aaf3 mtd: mtdconcat: Judge callback existence based on the master
    a452dc09a5a6 tracing/boot: Fix a hist trigger dependency for boot time tracing
    3be43a9ac4a9 mfd: tqmx86: Clear GPIO IRQ resource when no IRQ is set
    1104ea6b8e2a PCI: Fix pci_dev_str_match_path() alloc while atomic bug
    619b6ad1b135 KVM: arm64: Restrict IPA size to maximum 48 bits on 4K and 16K page size
    39880692657c netfilter: nft_ct: protect nft_ct_pcpu_template_refcnt with mutex
    408c5b7081b1 PCI: iproc: Fix BCMA probe resource handling
    43f59fff1fdf PCI: of: Don't fail devm_pci_alloc_host_bridge() on missing 'ranges'
    b4ae6f96d7db PCI: controller: PCI_IXP4XX should depend on ARCH_IXP4XX
    86bfda3f6cb5 backlight: ktd253: Stabilize backlight
    31c16809d0bc mfd: axp20x: Update AXP288 volatile ranges
    eb3eeb317385 net: phylink: add suspend/resume support
    54f62219145c stmmac: dwmac-loongson:Fix missing return value
    a308deafe4e3 NTB: perf: Fix an error code in perf_setup_inbuf()
    9c787064f0a8 NTB: Fix an error code in ntb_msit_probe()
    23edad31b827 ethtool: Fix an error code in cxgb2.c
    0fc65686c1de loop: reduce the loop_ctl_mutex scope
    b1438181dcee PCI: ibmphp: Fix double unmap of io_mem
    88013a0c5d99 block, bfq: honor already-setup queue merges
    488e251c6987 net: usb: cdc_mbim: avoid altsetting toggling for Telit LN920
    2bbf4c40bfb2 flow: fix object-size-mismatch warning in flowi{4,6}_to_flowi_common()
    2a2ada738da6 Set fc_nlinfo in nh_create_ipv4, nh_create_ipv6
    1680812a0f7d octeontx2-af: Add additional register check to rvu_poll_reg()
    ed0f3b99c5a1 watchdog: Start watchdog in watchdog_set_last_hw_keepalive only if appropriate
    a1d4322f6782 PCI: Add ACS quirks for Cavium multi-function devices
    a87aa051d7bd PCI: j721e: Add PCIe support for AM64
    1def82a63892 PCI: j721e: Add PCIe support for J7200
    06ef79094f16 PCI: cadence: Add quirk flag to set minimum delay in LTSSM Detect.Quiet state
    cdade20269a4 PCI: cadence: Use bitfield for *quirk_retrain_flag* instead of bool
    53347ed7cc2e tracing/probes: Reject events which have the same name of existing one
    86ddc7397906 KVM: arm64: Make hyp_panic() more robust when protected mode is enabled
    35f2ecc7a6e5 riscv: fix the global name pfn_base confliction error
    f9910fae78de PCI: rcar: Fix runtime PM imbalance in rcar_pcie_ep_probe()
    24bc88f6d28e mfd: Don't use irq_create_mapping() to resolve a mapping
    2edfc28e4a80 PCI: tegra: Fix OF node reference leak
    119f11c0a5fd PCI: tegra194: Fix MSI-X programming
    2338e1b02584 PCI: tegra194: Fix handling BME_CHGED event
    cba893f7193a fuse: fix use after free in fuse_read_interrupt()
    bd95a58ccd96 PCI: Add ACS quirks for NXP LX2xx0 and LX2xx2 platforms
    6bd777c9cece mfd: db8500-prcmu: Adjust map to reality
    28fd51c13227 remoteproc: qcom: wcnss: Fix race with iris probe
    65fa28b7695f dt-bindings: mtd: gpmc: Fix the ECC bytes vs. OOB bytes equation
    d49e2c649480 mlxbf_gige: clear valid_polarity upon open
    0cacc8c5f8b8 net: dsa: flush switchdev workqueue before tearing down CPU/DSA ports
    3e8418e36177 blkcg: fix memory leak in blk_iolatency_init
    2990e56bb82c nvme: avoid race in shutdown namespace removal
    0eb2133475b4 net: hns3: fix the exception when query imp info
    cd0015a07cf7 net: dsa: lantiq_gswip: Add 200ms assert delay
    a4604b3cde1c net: dsa: qca8k: fix kernel panic with legacy mdio mapping
    d2a6d9c240e5 ice: Correctly deal with PFs that do not support RDMA
    084ba1ace0b9 net/mlx5e: Fix mutual exclusion between CQE compression and HW TS
    080ce6343eff Drivers: hv: vmbus: Fix kernel crash upon unbinding a device from uio_hv_generic driver
    4664ad853f4b net: stmmac: platform: fix build warning when with !CONFIG_PM_SLEEP
    dbf905bcd28a net: hns3: fix the timing issue of VF clearing interrupt sources
    39da2bc7e5ac net: hns3: disable mac in flr process
    6f3d5ea0f817 net: hns3: change affinity_mask to numa node range
    ab73511cb258 net: hns3: pad the short tunnel frame before sending to hardware
    acd97a2a900b bnxt_en: make bnxt_free_skbs() safe to call after bnxt_free_mem()
    da15ae0968fa s390/pci_mmio: fully validate the VMA before calling follow_pte()
    722ee4b29a59 powerpc/mce: Fix access error in mce handler
    31f2beef3ef1 powerpc/64s: system call rfscv workaround for TM bugs
    9151f0bdc3a1 KVM: PPC: Book3S HV: Tolerate treclaim. in fake-suspend mode changing registers
    d5bf0fd8f4d1 ibmvnic: check failover_pending in login response
    e7b260fd7309 dt-bindings: arm: Fix Toradex compatible typo
    322b40b5094e udp_tunnel: Fix udp_tunnel_nic work-queue type
    2a791fa9de15 qed: Handle management FW error
    01d935828325 selftest: net: fix typo in altname test
    88ed682408f1 tcp: fix tp->undo_retrans accounting in tcp_sacktag_one()
    e50f1df204d5 x86/uaccess: Fix 32-bit __get_user_asm_u64() when CC_HAS_ASM_GOTO_OUTPUT=y
    893124376b0a net: dsa: destroy the phylink instance on any error in dsa_slave_phy_setup
    43867a55875e net/af_unix: fix a data-race in unix_dgram_poll
    178c282e543f vhost_net: fix OoB on sendmsg() failure.
    e8f84d205910 gen_compile_commands: fix missing 'sys' package
    b5663238281f net: ipa: initialize all filter table slots
    bb84e79f4f79 events: Reuse value read using READ_ONCE instead of re-reading it
    398026b3e1fe powerpc/64s: system call scv tabort fix for corrupt irq soft-mask state
    ae66447e9959 nvme-tcp: fix io_work priority inversion
    48e04f88a216 igc: fix tunnel offloading
    2283da2a64fb net: stmmac: fix system hang caused by eee_ctrl_timer during suspend/resume
    c29323ea0eb6 net/mlx5: Fix potential sleeping in atomic context
    31aec563de90 net/mlx5: FWTrace, cancel work on alloc pd error flow
    bef2db97a77c perf machine: Initialize srcline string member in add_location struct
    a628e6c8eaa7 drm/i915/dp: return proper DPRX link training result
    80e336d29217 rtc: cmos: Disable irq around direct invocation of cmos_interrupt()
    bc9299c5270f drm/rockchip: cdn-dp-core: Make cdn_dp_core_resume __maybe_unused
    2926d3827105 tipc: increase timeout in tipc_sk_enqueue()
    3433e7d135de r6040: Restore MDIO clock frequency after MAC reset
    6e4a2519c912 net/l2tp: Fix reference count leak in l2tp_udp_recv_core
    51f7b364a2d1 dccp: don't duplicate ccid when cloning dccp sock
    3e811a5c96fa ptp: dp83640: don't define PAGE0
    9ac80ef7cc41 net-caif: avoid user-triggerable WARN_ON(1)
    1f2f637b31e5 net/{mlx5|nfp|bnxt}: Remove unnecessary RTNL lock assert
    a2db1c64f2ce net: remove the unnecessary check in cipso_v4_doi_free
    35ee11c8f438 ethtool: Fix rxnfc copy to user buffer overflow
    ba099fe50c0a tipc: fix an use-after-free issue in tipc_recvmsg
    54089df947b0 x86/mce: Avoid infinite loop for copy from user recovery
    d6d35beff5d4 x86/mm: Fix kern_addr_valid() to cope with existing but not present entries
    388e1fd62e8c x86/pat: Pass valid address to sanitize_phys()
    6ed2d5e30cf4 net: qrtr: revert check in qrtr_endpoint_post()
    2aeb3cfb82ae s390/sclp: fix Secure-IPL facility detection
    3405e0d5e4a3 drm/etnaviv: add missing MMU context put when reaping MMU mapping
    ac533196011b drm/etnaviv: reference MMU context when setting up hardware state
    3e8cfbab6c8b drm/etnaviv: fix MMU context leak on GPU reset
    4ad4e5f3f20a drm/etnaviv: exec and MMU state is lost when resetting the GPU
    c80772895cc0 drm/etnaviv: keep MMU context across runtime suspend/resume
    18e0930dd776 drm/etnaviv: stop abusing mmu_context as FE running marker
    d73f98558f4a drm/etnaviv: put submit prev MMU context when it exists
    3ea21946ba7b drm/etnaviv: return context from etnaviv_iommu_context_get
    dc1fd142dcf2 drm/i915/dp: Use max params for panels < eDP 1.4
    d717dcf122ea io_uring: allow retry for O_NONBLOCK if async is supported
    3704a556158e drm/radeon: pass drm dev radeon_agp_head_init directly
    fe232886fb71 drm/amdkfd: separate kfd_iommu_resume from kfd_resume
    815cf7b38a1c drm/amd/pm: fix the issue of uploading powerplay table
    413a8644966a drm/amdgpu: move iommu_resume before ip init/resume
    64ca7170c9b1 drm/amdgpu: add amdgpu_amdkfd_resume_iommu
    2a0dfd8e2878 drm/amdgpu: fix use after free during BO move
    05e7e2d760aa drm/amdgpu: use IS_ERR for debugfs APIs
    ab55e44ea8dc drm/amd/amdgpu: Increase HWIP_MAX_INSTANCE to 10
    deeb5db10001 drm/amd/pm: fix runpm hang when amdgpu loaded prior to sound driver
    05a19da7efcd drm/amd/display: Fix white screen page fault for gpuvm
    c6d921d1e88c drm/amd/display: dsc mst 2 4K displays go dark with 2 lane HBR3
    c5548625a758 drm/amd/display: Get backlight from PWM if DMCU is not initialized
    73892cbd7c88 PCI: Add AMD GPU multi-function power dependencies
    0b4547d3ee46 PM: base: power: don't try to use non-existing RTC for storing data
    06cd58aa18f2 arm64/sve: Use correct size when reinitialising SVE state
    5c687b528a92 bnx2x: Fix enabling network interfaces without VFs
    6860535176f2 xen: fix usage of pmd_populate in mremap for pv guests
    93ce214dc0c4 xen: reset legacy rtc flag for PV domU
    90b2c99e4769 swiotlb-xen: fix late init retry
    4eb05451173e swiotlb-xen: avoid double free
    71e32edd2210 io_uring: ensure symmetry in handling iter types in loop_rw_iter()
    1e93a76c6995 net: stmmac: fix MAC not working when system resume back with WoL active

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.14.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.14.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
index 06064706e0..5e5be1362a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "87e920626b63515458e304527509289993be2796"
-SRCREV_meta ?= "a1e3f40a0f4c5d05d1a6110a42d53eb3c3947ec8"
+SRCREV_machine ?= "61d40facfa18554ae6c57cd4d3cab9be8272e177"
+SRCREV_meta ?= "cb45cbb1f55bc80b49d8b037d3b89121841a5963"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.14.6"
+LINUX_VERSION ?= "5.14.8"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
index 699c8c7da0..8ba2d0a737 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.14.6"
+LINUX_VERSION ?= "5.14.8"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "f956536237159b85f94d70bb9e74b5894e6bf07d"
-SRCREV_machine ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
-SRCREV_meta ?= "a1e3f40a0f4c5d05d1a6110a42d53eb3c3947ec8"
+SRCREV_machine:qemuarm ?= "372ed9b008af35e56e5dacc906522203a4dd897b"
+SRCREV_machine ?= "b6850b99071366f57df504f6deefbd0276189554"
+SRCREV_meta ?= "cb45cbb1f55bc80b49d8b037d3b89121841a5963"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
index 809b6fa066..4fec074a58 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.14/standard/base"
 KBRANCH:qemux86-64 ?= "v5.14/standard/base"
 KBRANCH:qemumips64 ?= "v5.14/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "139cd4a6ac01e83002011680d9fbb14048c1bc3a"
-SRCREV_machine:qemuarm64 ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
-SRCREV_machine:qemumips ?= "f5a73ebec6f028075220c690bbb121284313ebd3"
-SRCREV_machine:qemuppc ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
-SRCREV_machine:qemuriscv64 ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
-SRCREV_machine:qemuriscv32 ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
-SRCREV_machine:qemux86 ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
-SRCREV_machine:qemux86-64 ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
-SRCREV_machine:qemumips64 ?= "912fc3d0cf57239e6fe5030b82165b2d6f0632e3"
-SRCREV_machine ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
-SRCREV_meta ?= "a1e3f40a0f4c5d05d1a6110a42d53eb3c3947ec8"
+SRCREV_machine:qemuarm ?= "98cb84843e33c3f2c89de648358433bdea144f4d"
+SRCREV_machine:qemuarm64 ?= "b6850b99071366f57df504f6deefbd0276189554"
+SRCREV_machine:qemumips ?= "4a595a4eabcf88f9dcf3e2881f027634897e6ad0"
+SRCREV_machine:qemuppc ?= "b6850b99071366f57df504f6deefbd0276189554"
+SRCREV_machine:qemuriscv64 ?= "b6850b99071366f57df504f6deefbd0276189554"
+SRCREV_machine:qemuriscv32 ?= "b6850b99071366f57df504f6deefbd0276189554"
+SRCREV_machine:qemux86 ?= "b6850b99071366f57df504f6deefbd0276189554"
+SRCREV_machine:qemux86-64 ?= "b6850b99071366f57df504f6deefbd0276189554"
+SRCREV_machine:qemumips64 ?= "d333b4641aa536e004174d65a3e91f0018eedf43"
+SRCREV_machine ?= "b6850b99071366f57df504f6deefbd0276189554"
+SRCREV_meta ?= "cb45cbb1f55bc80b49d8b037d3b89121841a5963"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "a1e3f40a0f4c5d05d1a6110a42d53eb3c3947ec8"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "6a7ababc0268063d0798c46d5859a90ee996612f"
+SRCREV_machine:class-devupstream ?= "c34892e1995da8ca0dfbdcb115d6156f15000435"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.14/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.14.6"
+LINUX_VERSION ?= "5.14.8"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


