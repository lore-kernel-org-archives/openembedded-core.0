Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web12.322.1626714861348110041
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jul 2021 10:14:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NCNOKQP5;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id g12so13493377qtb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jul 2021 10:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2y20tcLPUOScaRVWCHlj6zvl+dsX7puTeB6ImaGUOiE=;
        b=NCNOKQP5PtUhBbEDIpfMsu93c7bDoDLSwNs2ZFSEctL9wNfqnt5fAg2NQNTZVh/TAj
         p887dO3It3GwT32yce/7Gm35+NHkNF73OYmZ7KGinSbz4uj9A4c4Gfza2/e+wrw/zLvk
         aa/6M5E6RpW5v9Xvu4lKD+76RMPufKNAoLOHc4+Cl8mzYu215f//R9nIcKm77PJXhwvB
         8cvlbv5h3UiyKH7G+AOmJ4I//5Am8JDmLGY3xLQDvslK8RBneSMB1rcADwk6uCkmGJnH
         u4zLXTGj6XUAX9xyD89pSe7hv9CJ7P5YQVM2kkbNAVe3r9iMj4kQTQtJeKzmuiaDT9cY
         Xh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2y20tcLPUOScaRVWCHlj6zvl+dsX7puTeB6ImaGUOiE=;
        b=bPIv0ZwEanlsWL26xeo5YpCW7MPvebZKN6lldJzAzMoX/B5WcRV5FYRK31YYE2sUl/
         SagoidmdPcrfexAAI4kmGwDcq3Wk5VCWlzt2/HMLNE8I8NQOvUc1RtWavtonBykbyWeQ
         pihBYz9Fmi7hYeEYghd62qMK9ZCMpnXeGSnbpghtoNQtp8eqQczpaD241Q58IteqObY1
         tUB5jwuMKeZfehVYdfpU7ZuMfiD0WeC72w9/zi+1bERxBOeHwU95IFvMqdiqc63UyMKU
         yS8l2Eos1EPVFJFezYQplQ+ag/7d12dWPryvHSq3ViHV2DeeaVHL84RSh8GrwV0r55mq
         3X3A==
X-Gm-Message-State: AOAM531AYRCV7pc7yW9NWMsj9+vMi3EGtTxjBfc56xgNxeu3+CRTzy4c
	R7j5hPaJ/GufVWDzJDogLZE=
X-Google-Smtp-Source: ABdhPJwkujs5Ti3gyUkB6cg1EtSFMf68LCB+PA6PUtirPtOy48W7r8lbSAJATvqKNst+O9W3yo143A==
X-Received: by 2002:ac8:7489:: with SMTP id v9mr11256185qtq.9.1626714860174;
        Mon, 19 Jul 2021 10:14:20 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u184sm8291160qkd.53.2021.07.19.10.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 10:14:19 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.13: update to v5.13.3
Date: Mon, 19 Jul 2021 13:14:17 -0400
Message-Id: <20210719171417.49442-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.13 to the latest korg -stable release that comprises
the following commits:

    f86aa267e180 Linux 5.13.3
    e472b276a0d2 f2fs: fix to avoid racing on fsync_entry_slab by multi filesystem instances
    258fd821f693 smackfs: restrict bytes count in smk_set_cipso()
    bfb48b54db25 media: v4l2-core: explicitly clear ioctl input data
    42f102ea1943 jfs: fix GPF in diFree
    7ed572cdf110 ext4: fix possible UAF when remounting r/o a mmp-protected file system
    e9f6b57ef114 drm/ast: Remove reference to struct drm_device.pdev
    7eefc573bcbf pinctrl: mcp23s08: Fix missing unlock on error in mcp23s08_irq()
    e294f97e8af8 dm writecache: write at least 4k when committing
    691e71cf1fd1 media: uvcvideo: Fix pixel format change for Elgato Cam Link 4K
    7c148146e075 media: gspca/sunplus: fix zero-length control requests
    8f6a609903a0 media: gspca/sq905: fix control-request direction
    90be28e26596 media: ccs: Fix the op_pll_multiplier address
    d69b39d89f36 media: zr364xx: fix memory leak in zr364xx_start_readpipe
    2f920c1543f7 media: dtv5100: fix control-request directions
    7be5e037e564 media: i2c: ccs-core: fix pm_runtime_get_sync() usage count
    8b39b430dc0a media: subdev: disallow ioctl for saa6588/davinci
    eda818ae5d39 PCI: aardvark: Implement workaround for the readback value of VEND_ID
    678d93d3d243 PCI: aardvark: Fix checking for PIO Non-posted Request
    9789b16dc4e3 PCI: Leave Apple Thunderbolt controllers on for s2idle or standby
    ad365e9351ac dm btree remove: assign new_root only when removal succeeds
    3993b84d4493 dm writecache: flush origin device when writing and cache is full
    14f19e585018 dm zoned: check zone capacity
    0115687be7b1 coresight: tmc-etf: Fix global-out-of-bounds in tmc_update_etf_buffer()
    2ac133f4b299 coresight: Propagate symlink failure
    5b37fd9da03f ipack/carriers/tpci200: Fix a double free in tpci200_pci_probe
    1d2865bbd89e tracing: Resize tgid_map to pid_max, not PID_MAX_DEFAULT
    38164905b1cc tracing: Simplify & fix saved_tgids logic
    589f6fac5c92 rq-qos: fix missed wake-ups in rq_qos_throttle try two
    d57fcab190b6 seq_buf: Fix overflow in seq_buf_putmem_hex()
    775ab9f4a4d9 lkdtm: Enable DOUBLE_FAULT on all architectures
    42e737661a0d extcon: intel-mrfld: Sync hardware and software state on init
    6fd650c47411 selftests/lkdtm: Fix expected text for CR4 pinning
    07b761cf78b1 lkdtm/bugs: XFAIL UNALIGNED_LOAD_STORE_WRITE
    866573b6c9bf nvmem: core: add a missing of_node_put
    9c6c73fc99b9 mfd: syscon: Free the allocated name field of struct regmap_config
    8451754bca7b power: supply: ab8500: Fix an old bug
    c0756f75c221 ubifs: Fix races between xattr_{set|get} and listxattr operations
    ec00b71f402a thermal/drivers/int340x/processor_thermal: Fix tcc setting
    238a7c0a5c30 ipmi/watchdog: Stop watchdog timer when the current action is 'none'
    13b307880b66 qemu_fw_cfg: Make fw_cfg_rev_attr a proper kobj_attribute
    1e71e1344d61 i40e: fix PTP on 5Gb links
    35af69c7c049 mwifiex: bring down link before deleting interface
    5665e64c99e3 ASoC: tegra: Set driver_name=tegra for all machine drivers
    72104552eae2 fpga: stratix10-soc: Add missing fpga_mgr_free() call
    c3f4ad1ba2eb clocksource/arm_arch_timer: Improve Allwinner A64 timer workaround
    a34295528a14 cpu/hotplug: Cure the cpusets trainwreck
    dcb4b49e3ced arm64: tlb: fix the TTL value of tlb_get_level
    31d1d7db4978 ata: ahci_sunxi: Disable DIPM
    3b7c6122f390 docs: Makefile: Use CONFIG_SHELL not SHELL
    5c8e4b20e70f mmc: core: Allow UHS-I voltage switch for SDSC cards if supported
    3d2e0431e687 mmc: core: clear flags before allowing to retune
    c1b907e43b32 mmc: sdhci: Fix warning message when accessing RPMB in HS400 mode
    7210a1b23c50 mmc: sdhci-acpi: Disable write protect detection on Toshiba Encore 2 WT8-B
    970aa4aefaab drm/i915/display: Do not zero past infoframes.vsc
    b4772d4e8ec3 drm/ingenic: Switch IPU plane to type OVERLAY
    0256fdf3b07c drm/nouveau: Don't set allow_fb_modifiers explicitly
    8c5960e823bf drm/arm/malidp: Always list modifiers
    a2c67909bb71 drm/msm/mdp4: Fix modifier support enabling
    337e397a1e9e drm/tegra: Don't set allow_fb_modifiers explicitly
    5c2196d8286e drm/ingenic: Fix pixclock rate for 24-bit serial panels
    858d38315fc3 drm/amd/display: Reject non-zero src_y and src_x for video planes
    6683128d7ca5 pinctrl/amd: Add device HID for new AMD GPIO controller
    dcb7f78b876c drm/amd/display: fix incorrrect valid irq check
    72cba7be3648 drm/rockchip: dsi: remove extra component_del() call
    e7762bc634c8 drm/dp: Handle zeroed port counts in drm_dp_read_downstream_info()
    bab3618ca92c drm/vc4: hdmi: Prevent clock unbalance
    dee39749424b drm/vc4: crtc: Skip the TXP
    da442a77dd49 drm/vc4: txp: Properly set the possible_crtcs mask
    e4f2d5c77205 drm/radeon: Call radeon_suspend_kms() in radeon_pci_shutdown() for Loongson64
    63de45921822 drm/radeon: Add the missed drm_gem_object_put() in radeon_user_framebuffer_create()
    7764d2c698d7 drm/amdgpu: fix the hang caused by PCIe link width switch
    0d3a1e59fd9d drm/amdgpu: fix NAK-G generation during PCI-e link width switch
    5af51c7bc675 drm/amdgpu: enable sdma0 tmz for Raven/Renoir(V2)
    fb5beb2b3f06 drm/amdgpu: Update NV SIMD-per-CU to 2
    788c261cdb58 drm/amdgpu: add new dimgrey cavefish DID
    7fad97798d9b powerpc/powernv/vas: Release reference to tgid during window close
    30a401a03189 powerpc/barrier: Avoid collision with clang's __lwsync macro
    cc7442037062 powerpc/xive: Fix error handling when allocating an IPI
    7feb683793ea powerpc/bpf: Reject atomic ops in ppc32 JIT
    8a96ec5ebf96 powerpc/mm: Fix lockup on kernel exec fault
    987a852734e6 mm/mremap: hold the rmap lock in write mode when moving page table entries.
    f908381a3ec7 MIPS: MT extensions are not available on MIPS32r1
    eecc96e0458c PCI: tegra194: Fix host initialization during resume
    b63416bc9d6d MIPS: CI20: Reduce clocksource to 750 kHz.
    8e3f6e978e4c MIPS: set mips32r5 for virt extensions
    1930d84a29d4 MIPS: loongsoon64: Reserve memory below starting pfn to prevent Oops
    92b74375a1bb sctp: add size validation when walking chunks
    4ecabee69d19 sctp: validate from_addr_param return
    5f7ca3459118 flow_offload: action should not be NULL when it is referenced
    e9d02dbbab0a bpf: Fix false positive kmemleak report in bpf_ringbuf_area_alloc()
    5f2d7f0241e2 sched/fair: Ensure _sum and _avg values stay consistent
    377c584c325e Bluetooth: btusb: fix bt fiwmare downloading failure issue for qca btsoc.
    387d99b463af Bluetooth: btusb: use default nvm if boardID is 0 for wcn6855.
    8e4a714f4510 Bluetooth: mgmt: Fix the command returns garbage parameter value
    15407b14e27b Bluetooth: btusb: Add support USB ALT 3 for WBS
    69ccde876ca5 Bluetooth: L2CAP: Fix invalid access on ECRED Connection response
    840907eecac0 Bluetooth: L2CAP: Fix invalid access if ECRED Reconfigure fails
    efffb7884033 Bluetooth: btusb: Add a new QCA_ROME device (0cf3:e500)
    c19a2820df32 Bluetooth: Shutdown controller after workqueues are flushed or cancelled
    286bba24e6ce Bluetooth: Fix alt settings for incoming SCO with transparent coding format
    cbb2f564faa4 Bluetooth: Fix the HCI to MGMT status conversion table
    5c73a8008035 Bluetooth: cmtp: fix file refcount when cmtp_attach_device fails
    dc239f449b03 Bluetooth: btusb: Fixed too many in-token issue for Mediatek Chip.
    07583ba2e2d8 RDMA/cma: Fix rdma_resolve_route() memory leak
    e4d57b37f034 net: ip: avoid OOM kills with large UDP sends over loopback
    602b0c1dbedc net: retrieve netns cookie via getsocketopt
    b01ad7c3b08e media, bpf: Do not copy more entries than user space requested
    e6b42db7e571 IB/isert: Align target max I/O size to initiator size
    b3d56dd75032 mac80211: Properly WARN on HW scan before restart
    e32446de59d2 mac80211_hwsim: add concurrent channels scanning support over virtio
    6f9ae4a024c5 mac80211: consider per-CPU statistics if present
    5924678a442d cfg80211: fix default HE tx bitrate mask in 2G band
    e1d88925c3b9 wireless: wext-spy: Fix out-of-bounds warning
    649adc384fb3 sfc: error code if SRIOV cannot be disabled
    65c8d58a1f7a sfc: avoid double pci_remove of VFs
    81772d2c7d04 rtw88: add quirks to disable pci capabilities
    2002b7ae2f00 rtw88: 8822c: update RF parameter tables to v62
    5a7db3036585 iwlwifi: pcie: fix context info freeing
    5b2b879f69b4 iwlwifi: pcie: free IML DMA memory allocation
    44164d5528fb iwlwifi: mvm: fix error print when session protection ends
    111fa98f60d2 iwlwifi: mvm: apply RX diversity per PHY context
    89b944c896f9 iwlwifi: mvm: don't change band on bound PHY contexts
    af1036530646 RDMA/rxe: Don't overwrite errno from ib_umem_get()
    6e34e09aa418 drm/amd/display: Fix edp_bootup_bl_level initialization issue
    f033a30e32ce vsock: notify server to shutdown when client has pending signal
    ac05406330eb atm: nicstar: register the interrupt handler in the right place
    3c0b0b2533f9 atm: nicstar: use 'dma_free_coherent' instead of 'kfree'
    5ad7f389f93b net: fec: add ndo_select_queue to fix TX bandwidth fluctuations
    df628a202755 net: fec: add FEC_QUIRK_HAS_MULTI_QUEUES represents i.MX6SX ENET IP
    b223fca477ad MIPS: add PMD table accounting into MIPS'pmd_alloc_one
    59dc71f577ea rtl8xxxu: Fix device info for RTL8192EU devices
    97e50ed9eae5 mt76: fix iv and CCMP header insertion
    65c015b50515 mt76: mt7915: fix IEEE80211_HE_PHY_CAP7_MAX_NC for station mode
    9b6248b3e649 mt76: connac: fix the maximum interval schedule scan can support
    bbe1d0ada80e mt76: connac: fix UC entry is being overwritten
    57602135190b mt76: mt7921: enable hw offloading for wep keys
    869417fa825c mt76: mt7921: reset wfsys during hw probe
    6620a41fe435 mt76: mt7921: fix reset under the deep sleep is enabled
    7922a844969d mt76: mt7915: fix tssi indication field of DBDC NICs
    38b73fe18c6b drm/amdkfd: Walk through list with dqm lock hold
    af15052971e1 drm/amdgpu: fix bad address translation for sienna_cichlid
    a8eca6968b1e io_uring: fix false WARN_ONCE
    9e134247013e net: sched: fix error return code in tcf_del_walker()
    06648197e4ae net: ipa: Add missing of_node_put() in ipa_firmware_load()
    0147b9c4ebf6 net: fix mistake path for netdev_features_strings
    4d23e6082729 mt76: dma: use ieee80211_tx_status_ext to free packets when tx fails
    2a64f3732310 mt76: mt7615: fix fixed-rate tx status reporting
    b2b69554431f ice: mark PTYPE 2 as reserved
    008ec090f0d1 ice: fix incorrect payload indicator on PTYPE
    eb7b40d9d378 ext4: fix memory leak in ext4_fill_super
    4d39b8f57b7d bpf: Fix up register-based shifts in interpreter to silence KUBSAN
    2cb85397c30f net: hsr: don't check sequence number if tag removal is offloaded
    3382ec34a4d5 drm/amdkfd: Fix circular lock in nocpsch path
    161c4c2a19f4 drm/amdkfd: fix circular locking on get_wave_state
    118e6aea7ae7 cw1200: add missing MODULE_DEVICE_TABLE
    40af3960a153 wl1251: Fix possible buffer overflow in wl1251_cmd_scan
    36409fe65122 net: phy: nxp-c45-tja11xx: enable MDIO write access to the master/slave registers
    84bb21d9886c wlcore/wl12xx: Fix wl12xx get_mac error if device is in ELP
    ce6dc850612a dm writecache: commit just one block, not a full page
    7cc35bd4355b xfrm: Fix error reporting in xfrm_state_construct.
    62adf2af9f09 ibmvnic: fix kernel build warnings in build_hdr_descs_arr
    20102b0f6784 drm/amd/display: Verify Gamma & Degamma LUT sizes in amdgpu_dm_atomic_check
    66fc2862a252 r8169: avoid link-up interrupt issue on RTL8106e if user enables ASPM
    4b58c2891d09 selinux: use __GFP_NOWARN with GFP_NOWAIT in the AVC
    dd18ad96a9ea net: mido: mdio-mux-bcm-iproc: Use devm_platform_get_and_ioremap_resource()
    7ca7d4404b95 fjes: check return value after calling platform_get_resource()
    61e364fafec1 drm/amdkfd: use allowed domain for vmbo validation
    3b5c55df5067 net: sgi: ioc3-eth: check return value after calling platform_get_resource()
    42b8412dc123 selftests: Clean forgotten resources as part of cleanup()
    32438665ba66 net: phy: realtek: add delay to fix RXC generation issue
    3df8a157824b drm/amd/display: Fix crash during MPO + ODM combine mode recalculation
    caef3b95ce82 drm/amd/display: Fix off-by-one error in DML
    6f88bc77bbc7 drm/amd/display: Set DISPCLK_MAX_ERRDET_CYCLES to 7
    db1ca5441e33 drm/amd/display: Release MST resources on switch from MST to SST
    71e0e437e97b drm/amd/display: Update scaling settings on modeset
    dc9e10ea5bdd drm/amd/display: Revert "Fix clock table filling logic"
    ef485944e718 drm/amd/display: Fix DCN 3.01 DSCCLK validation
    18aa10751227 net: moxa: Use devm_platform_get_and_ioremap_resource()
    c01540159ead net: micrel: check return value after calling platform_get_resource()
    373db5a9c8c4 net: mvpp2: check return value after calling platform_get_resource()
    cd9575caf7bd net: bcmgenet: check return value after calling platform_get_resource()
    43630cbcd7de net: mscc: ocelot: check return value after calling platform_get_resource()
    e8f03933f5a7 virtio_net: Remove BUG() to avoid machine dead
    47cafc568c31 ice: fix clang warning regarding deadcode.DeadStores
    63efeeb1274d ice: set the value of global config lock timeout longer
    22f5c64be9c7 pinctrl: mcp23s08: fix race condition in irq handler
    88e1357e4d05 net: bridge: mrp: Update ring transitions.
    03de5ab1dc40 block: introduce BIO_ZONE_WRITE_LOCKED bio flag
    4068cb7e1113 dm: Fix dm_accept_partial_bio() relative to zone management commands
    0a8a10887b65 dm writecache: don't split bios when overwriting contiguous cache content
    3c8afdbb62ee dm space maps: don't reset space map allocation cursor when committing
    c5cc91094e6a RDMA/cxgb4: Fix missing error code in create_qp()
    957d6d796e73 icmp: fix lib conflict with trinity
    e0b8274cda12 net: tcp better handling of reordering then loss cases
    b01c274e3a3a clk: tegra: tegra124-emc: Fix clock imbalance in emc_set_timing()
    3da33bf6aaff drm/amdgpu: remove unsafe optimization to drop preamble ib
    3b2b93a485fb drm/amd/display: Avoid HDCP over-read and corruption
    060a3b127d9e drm/amdgpu: fix sdma firmware version error in sriov
    3e7b75192e15 drm/amdgpu: fix metadata_size for ubo ioctl queries
    7c77db5a26db MIPS: ingenic: Select CPU_SUPPORTS_CPUFREQ && MIPS_EXTERNAL_TIMER
    181bc6b98b10 MIPS: cpu-probe: Fix FPU detection on Ingenic JZ4760(B)
    8853d2ce4e9e ipv6: use prandom_u32() for ID generation
    ba710baa1cc1 virtio-net: Add validation for used length
    8d7221a98741 drm: bridge: cdns-mhdp8546: Fix PM reference leak in
    4dbd10b868b6 clk: tegra: Ensure that PLLU configuration is applied properly
    91789532c24c clk: tegra: Fix refcounting of gate clocks
    9bce65a588d9 drm/tegra: hub: Fix YUV support
    86e0ca4c6aee RDMA/rtrs: Change MAX_SESS_QUEUE_DEPTH
    f2aad1098936 net: stmmac: the XPCS obscures a potential "PHY not found" error
    7366ccbd327c drm: rockchip: add missing registers for RK3066
    20f88209526e drm: rockchip: add missing registers for RK3188
    c77ad9cbf0c7 net/mlx5: Fix lag port remapping logic
    f39de3cc0ff7 net/mlx5e: IPsec/rep_tc: Fix rep_tc_update_skb drops IPsec packet
    ba2d94789a1f drm/amdgpu/swsmu/aldebaran: fix check in is_dpm_running
    93ed1b0210ea drm/amd/display: fix odm scaling
    669f0f6f83d5 clk: renesas: r8a77995: Add ZA2 clock
    383114477250 drm/bridge: cdns: Fix PM reference leak in cdns_dsi_transfer()
    4432f3694ee5 igb: fix assignment on big endian machines
    003d37fa8c70 igb: handle vlan types with checker enabled
    dd658e324c34 e100: handle eeprom as little endian
    38d70d239c7c drm/vc4: hdmi: Fix PM reference leak in vc4_hdmi_encoder_pre_crtc_co()
    62f616078e9f drm/vc4: Fix clock source for VEC PixelValve on BCM2711
    6d0f4887e742 drm/amd/pm: fix return value in aldebaran_set_mp1_state()
    8722275b41d5 net: xilinx_emaclite: Do not print real IOMEM pointer
    5150877e4d99 udf: Fix NULL pointer dereference in udf_symlink function
    50d7e03ad487 drm/sched: Avoid data corruptions
    baf802cd27cd drm/scheduler: Fix hang when sched_entity released
    cef0b8eab231 pinctrl: equilibrium: Add missing MODULE_DEVICE_TABLE
    248fc2633293 net: ethernet: ixp4xx: Fix return value check in ixp4xx_eth_probe()
    7b777772879c net/sched: cls_api: increase max_reclassify_loop
    0f20ce74aff8 net: mdio: provide shim implementation of devm_of_mdiobus_register
    5cb3b25c7f53 drm/virtio: Fix double free on probe failure
    5ac1c5fcffd0 reiserfs: add check for invalid 1st journal block
    b8f63c943700 drm/bridge: lt9611: Add missing MODULE_DEVICE_TABLE
    3828625dd18d net: mdio: ipq8064: add regmap config to disable REGCACHE
    8f5cc4dc1e2a drm/panfrost: devfreq: Disable devfreq when num_supplies > 1
    e049b85f7dcc drm/mediatek: Fix PM reference leak in mtk_crtc_ddp_hw_init()
    609ee98affb0 net: Treat __napi_schedule_irqoff() as __napi_schedule() on PREEMPT_RT
    5b991df88810 atm: nicstar: Fix possible use-after-free in nicstar_cleanup()
    ed7c3739d0a0 mISDN: fix possible use-after-free in HFC_cleanup()
    d1fb12412874 atm: iphase: fix possible use-after-free in ia_module_exit()
    72bdf3c6b059 hugetlb: clear huge pte during flush function on mips platform
    d2958a2e6d92 MIPS: Loongson64: Fix build error 'secondary_kexec_args' undeclared under !SMP
    6102f34e4622 clk: renesas: rcar-usb2-clock-sel: Fix error handling in .probe()
    5ec05aa8160b drm/amd/display: fix use_max_lb flag for 420 pixel formats
    57092f4f803b drm/amd/display: Fix clock table filling logic
    3eb50ab2c5ac drm/amdgpu: change the default timeout for kernel compute queues
    c9c00298cf07 net: pch_gbe: Use proper accessors to BE data in pch_ptp_match()
    ae1864f13cce drm/imx: Add 8 pixel alignment fix
    925a6b206bde drm/bridge: nwl-dsi: Force a full modeset when crtc_state->active is changed to be true
    0cf0cb019cd5 drm/vc4: fix argument ordering in vc4_crtc_get_margins()
    e684e0ee1153 drm/amd/amdgpu/sriov disable all ip hw status by default
    eeb44b638475 drm/amd/display: Fix BSOD with NULL check
    3728601cd68e drm/amd/display: Revert wait vblank on update dpp clock
    73893fe52178 drm/amd/display: fix HDCP reset sequence on reinitialize
    fc2e7aeedba2 drm/ast: Fixed CVE for DP501
    d5d89dd11f6f drm/zte: Don't select DRM_KMS_FB_HELPER
    992b191b179c drm/mxsfb: Don't select DRM_KMS_FB_HELPER

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Richard,

I'm sending this bump out sooner than I normally would, since my release
script inserted and extra underscore into the devupstream version. Since
it is so new, I didn't want to leave it like that any longer than
required!

Bruce

 .../linux/linux-yocto-rt_5.13.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.13.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
index aeeb565db2..55f2f537db 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "41ea72d0815da26eea1e7ae6fd3fc12b891f656f"
-SRCREV_meta ?= "ff973ffbf57891daa4060bfb7ef8f53192950b22"
+SRCREV_machine ?= "ffbd81e1827d733085ddf6ecb48de1c0668f00cf"
+SRCREV_meta ?= "4dcaa4bcd042d398e210b702449dd35fdf9f0078"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.13.2"
+LINUX_VERSION ?= "5.13.3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
index f06e5f2ffc..3bb29c3a50 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.13.2"
+LINUX_VERSION ?= "5.13.3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "054e53c50b92e2d6fdc7c21209ee7666d0a45a67"
-SRCREV_machine ?= "fbed80d1efbf9d19b06aa48cdee84342c0dda1c9"
-SRCREV_meta ?= "ff973ffbf57891daa4060bfb7ef8f53192950b22"
+SRCREV_machine_qemuarm ?= "14af4c0436892ac334ddc7e72bd1acf4ee55265d"
+SRCREV_machine ?= "d775b5d52af8b1788408676df70771db02114435"
+SRCREV_meta ?= "4dcaa4bcd042d398e210b702449dd35fdf9f0078"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
index cf38303984..df385f912c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.13/standard/base"
 KBRANCH_qemux86-64 ?= "v5.13/standard/base"
 KBRANCH_qemumips64 ?= "v5.13/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "5eaf18f1e3fb22c99d8a1cf7cd4148f10fa01d3c"
-SRCREV_machine_qemuarm64 ?= "fbed80d1efbf9d19b06aa48cdee84342c0dda1c9"
-SRCREV_machine_qemumips ?= "8f960c63f6bd32557af074932f53f56bd9af423d"
-SRCREV_machine_qemuppc ?= "fbed80d1efbf9d19b06aa48cdee84342c0dda1c9"
-SRCREV_machine_qemuriscv64 ?= "fbed80d1efbf9d19b06aa48cdee84342c0dda1c9"
-SRCREV_machine_qemuriscv32 ?= "fbed80d1efbf9d19b06aa48cdee84342c0dda1c9"
-SRCREV_machine_qemux86 ?= "fbed80d1efbf9d19b06aa48cdee84342c0dda1c9"
-SRCREV_machine_qemux86-64 ?= "fbed80d1efbf9d19b06aa48cdee84342c0dda1c9"
-SRCREV_machine_qemumips64 ?= "c4651adf3e0a55fed797f0963a94aa02974dc591"
-SRCREV_machine ?= "fbed80d1efbf9d19b06aa48cdee84342c0dda1c9"
-SRCREV_meta ?= "ff973ffbf57891daa4060bfb7ef8f53192950b22"
+SRCREV_machine_qemuarm ?= "b378a7f6a2a3542bf8cf0dc21f21e183fc8aedbc"
+SRCREV_machine_qemuarm64 ?= "eb735648264252f9865fae18c509c067e32ad528"
+SRCREV_machine_qemumips ?= "9efee711588fc23832dcb32bb3ead012fd72ec34"
+SRCREV_machine_qemuppc ?= "e8966ba4bbaa9e90b21d8576cdd3bab8fe161782"
+SRCREV_machine_qemuriscv64 ?= "570e7aedcd00e7e8a218e37c3dfb3b1fda83d111"
+SRCREV_machine_qemuriscv32 ?= "570e7aedcd00e7e8a218e37c3dfb3b1fda83d111"
+SRCREV_machine_qemux86 ?= "570e7aedcd00e7e8a218e37c3dfb3b1fda83d111"
+SRCREV_machine_qemux86-64 ?= "570e7aedcd00e7e8a218e37c3dfb3b1fda83d111"
+SRCREV_machine_qemumips64 ?= "3f0308c87d201ae82c6561da52c57f8a23f8a3f0"
+SRCREV_machine ?= "570e7aedcd00e7e8a218e37c3dfb3b1fda83d111"
+SRCREV_meta ?= "4dcaa4bcd042d398e210b702449dd35fdf9f0078"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "ff973ffbf57891daa4060bfb7ef8f53192950b22"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE_class-devupstream = "-1"
-SRCREV__class-devupstream ?= "d6fc894baac777c38a95a31f65343bea8b1a2678"
+SRCREV_class-devupstream ?= "f86aa267e180b23d8d24ee6886bd3bf9a360112e"
 PN_class-devupstream = "linux-yocto-upstream"
 KBRANCH_class-devupstream = "v5.13/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.13.2"
+LINUX_VERSION ?= "5.13.3"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

