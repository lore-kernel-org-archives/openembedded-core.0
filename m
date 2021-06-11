Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.4062.1623383461856029952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 20:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: hpkKuWCr88R0amg6w/OUa1TNEx7JuefCWWx3b8CgmZQWp2+qDO3Dg3FCbQLcFMAgWhsQvmidPQ
 VC2PAjhCUZUw==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="192566041"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="192566041"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 20:51:10 -0700
IronPort-SDR: UTFkDN87YSWhHUqGqssOWvhi2+ELnPTk4r5UqizNQPLKfXv4ukdFp5/slBWSU7eYiRSs6Itz4Z
 Pmg661/TzS9g==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="403091629"
Received: from dlau-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.151.154])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 20:51:08 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 10/17] linux-yocto/5.10: update to v5.10.37
Date: Fri, 11 Jun 2021 11:50:43 +0800
Message-Id: <4221323c8d31f97657d0cef0a4e1f1953504aa9d.1623383318.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623383318.git.anuj.mittal@intel.com>
References: <cover.1623383318.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    e97bd1e03e6e Linux 5.10.37
    42f1b8653f85 sctp: delay auto_asconf init until binding the first addr
    14919cdf68d0 Revert "net/sctp: fix race condition in sctp_destroy_sock"
    41f1aed56de5 smp: Fix smp_call_function_single_async prototype
    6c1ea8bee75d net: Only allow init netns to set default tcp cong to a restricted algo
    2281df0b0226 arm64: Remove arm64_dma32_phys_limit and its uses
    00d9f429af03 bpf: Prevent writable memory-mapping of read-only ringbuf pages
    1ca284f08670 bpf, ringbuf: Deny reserve of buffers larger than ringbuf
    282bfc8848ea bpf: Fix alu32 const subreg bound tracking on bitwise operations
    f76e0829bbab afs: Fix speculative status fetches
    949e7c5f4957 mm/memory-failure: unnecessary amount of unmapping
    62d96faa74c8 mm/sparse: add the missing sparse_buffer_fini() in error branch
    31df8bc4d3fe mm: memcontrol: slab: fix obtain a reference to a freeing memcg
    2e95bc6cfed1 mm/sl?b.c: remove ctor argument from kmem_cache_flags
    618fa6a35c79 kfifo: fix ternary sign extension bugs
    c02dd80655fd ia64: fix EFI_DEBUG build
    c6b7e0b1ab87 perf session: Add swap operation for event TIME_CONV
    86941f8bd46a perf jit: Let convert_timestamp() to be backwards-compatible
    fe07408afba2 perf tools: Change fields type in perf_record_time_conv
    3bce718d977b net:nfc:digital: Fix a double free in digital_tg_recv_dep_req
    e2c34cacff7b net: bridge: mcast: fix broken length + header check for MRDv6 Adv.
    f5ce59707d6a RDMA/bnxt_re: Fix a double free in bnxt_qplib_alloc_res
    608a4b90ece0 RDMA/siw: Fix a use after free in siw_alloc_mr
    4394be0a1866 bpf: Fix propagation of 32 bit unsigned bounds from 64 bit bounds
    183d9ebd449c selftests/bpf: Fix core_reloc test runner
    0257a0a5ffb7 selftests/bpf: Fix field existence CO-RE reloc tests
    3769c54d341c selftests/bpf: Fix BPF_CORE_READ_BITFIELD() macro
    9dc373f74097 net:emac/emac-mac: Fix a use after free in emac_mac_tx_buf_send
    8fcdfa71ba6a KVM: VMX: Intercept FS/GS_BASE MSR accesses for 32-bit KVM
    4fcaad2b7dac bnxt_en: Fix RX consumer index logic in the error path.
    1625872f012c selftests: mlxsw: Remove a redundant if statement in tc_flower_scale test
    8ebdce8fe0b0 selftests: net: mirror_gre_vlan_bridge_1q: Make an FDB entry static
    71ad9260c001 net: geneve: modify IP header check in geneve6_xmit_skb and geneve_xmit_skb
    1fc61844b6a2 arm64: dts: uniphier: Change phy-mode to RGMII-ID to enable delay pins for RTL8211E
    0ae610556f23 ARM: dts: uniphier: Change phy-mode to RGMII-ID to enable delay pins for RTL8211E
    66b1cfc0cd87 bnxt_en: fix ternary sign extension bug in bnxt_show_temp()
    9f722ef596fe net: enetc: fix link error again
    bfcb5a8cc7b6 net: phy: marvell: fix m88e1111_set_downshift
    1157d01e04d9 net: phy: marvell: fix m88e1011_set_downshift
    be631825652f powerpc/52xx: Fix an invalid ASM expression ('addi' used instead of 'add')
    e06a532f31c4 powerpc/perf: Fix the threshold event selection for memory events in power10
    b6b894e7a27e wlcore: Fix buffer overrun by snprintf due to incorrect buffer size
    1cce33fe59f0 ath10k: Fix ath10k_wmi_tlv_op_pull_peer_stats_info() unlock without lock
    8bb054fb336f ath10k: Fix a use after free in ath10k_htc_send_bundle
    0f98e1ea970c ath9k: Fix error check in ath9k_hw_read_revisions() for PCI devices
    4b9fb2c9039a powerpc/64: Fix the definition of the fixmap area
    c5ebaca402f5 RDMA/core: Add CM to restrack after successful attachment to a device
    63c61d26e3fb RDMA/rxe: Fix a bug in rxe_fill_ip_info()
    7fe12d6db3f0 net: phy: intel-xway: enable integrated led functions
    cf49a91faa7d net: renesas: ravb: Fix a stuck issue when a lot of frames are received
    01dab91200dc net: stmmac: fix TSO and TBS feature enabling during driver open
    64753ac1e43e nfp: devlink: initialize the devlink port attribute "lanes"
    e606073b77a3 crypto: ccp: Detect and reject "invalid" addresses destined for PSP
    4fa28c807da5 mt76: mt7615: fix memleak when mt7615_unregister_device()
    9ed951f41643 net: davinci_emac: Fix incorrect masking of tx and rx error channel
    0ce6052802be net: marvell: prestera: fix port event handling on init
    b605673b523f vsock/virtio: free queued packets when closing socket
    5231d17eb9d0 sfc: ef10: fix TX queue lookup in TX event handling
    7459bb594328 ALSA: usb: midi: don't return -ENOMEM when usb_urb_ep_type_check fails
    312c5ce34942 RDMA/i40iw: Fix error unwinding when i40iw_hmc_sd_one fails
    45b84abb47a9 RDMA/cxgb4: add missing qpid increment
    da54cc254939 gro: fix napi_gro_frags() Fast GRO breakage due to IP alignment check
    257f38e78aa3 net: ethernet: ixp4xx: Set the DMA masks explicitly
    78d8b34751cf libbpf: Initialize the bpf_seq_printf parameters array field by field
    b9e719698fc4 vsock/vmci: log once the failed queue pair allocation
    bc2e5321d7f1 netfilter: nftables_offload: special ethertype handling for VLAN
    a7eb38aacc81 netfilter: nftables_offload: VLAN id needs host byteorder in flow dissector
    cf2de861b279 netfilter: nft_payload: fix C-VLAN offload support
    1dd5ac62c0d4 mwl8k: Fix a double Free in mwl8k_probe_hw
    87299aad6278 i2c: mediatek: Fix wrong dma sync flag
    232598e99fad i2c: sh7760: fix IRQ error path
    d204db4fe6ac wlcore: fix overlapping snprintf arguments in debugfs
    c0aa320ac617 rtlwifi: 8821ae: upgrade PHY and RF parameters
    e9bd1af4c038 KVM: x86: dump_vmcs should not assume GUEST_IA32_EFER is valid
    bf6476152a0a powerpc/smp: Reintroduce cpu_core_mask
    af39f070c8b0 powerpc/pseries: extract host bridge from pci_bus prior to bus removal
    8dfd7329ad0b MIPS: pci-legacy: stop using of_pci_range_to_resource
    cabed6027a5b drm/amd/pm: fix error code in smu_set_power_limit()
    486642baea69 perf beauty: Fix fsconfig generator
    0df2770ad33b iommu/amd: Put newline after closing bracket in warning
    a1c1de90cd28 drm/i915/gvt: Fix error code in intel_gvt_init_device()
    2b3ae007c639 net/packet: remove data races in fanout operations
    3a1c395703be net/packet: make packet_fanout.arr size configurable up to 64K
    d10c5162b493 net/mlx5: Fix bit-wise and with zero
    d97d22bda17a ASoC: ak5558: correct reset polarity
    c1f980961133 powerpc/xive: Fix xmon command "dxi"
    e2724bed6481 powerpc/xive: Drop check on irq_data in xive_core_debug_show()
    a38b77899c2c i2c: sh7760: add IRQ check
    4b8177766a8b i2c: rcar: add IRQ check
    1ac4f7a26017 i2c: rcar: protect against supurious interrupts on V3U
    11e2b2b6f6b9 i2c: rcar: make sure irq is not threaded on Gen2 and earlier
    f41d2bfef538 i2c: mlxbf: add IRQ check
    c6eea11b5cb6 i2c: jz4780: add IRQ check
    ab6d6cae0aa1 i2c: emev2: add IRQ check
    6f291ab1776e i2c: cadence: add IRQ check
    c977426db644 i2c: xiic: fix reference leak when pm_runtime_get_sync fails
    c323b270a52a i2c: stm32f7: fix reference leak when pm_runtime_get_sync fails
    e547640cee79 i2c: sprd: fix reference leak when pm_runtime_get_sync fails
    8c0a2009fb20 i2c: omap: fix reference leak when pm_runtime_get_sync fails
    3a0cdd336d92 i2c: imx: fix reference leak when pm_runtime_get_sync fails
    cc49d2064142 i2c: imx-lpi2c: fix reference leak when pm_runtime_get_sync fails
    e80ae8bde412 i2c: img-scb: fix reference leak when pm_runtime_get_sync fails
    30410519328c i2c: cadence: fix reference leak when pm_runtime_get_sync fails
    b64415c6b347 RDMA/rtrs-clt: destroy sysfs after removing session from active list
    6a07e5e39d4f RDMA/srpt: Fix error return code in srpt_cm_req_recv()
    4601bcc6410c net: thunderx: Fix unintentional sign extension issue
    6a61307e58ab cxgb4: Fix unintentional sign extension issues
    52fd8005a239 RDMA/bnxt_re: Fix error return code in bnxt_qplib_cq_process_terminal()
    afb738b74447 IB/hfi1: Fix error return code in parse_platform_config()
    a12d75f5dcfb RDMA/qedr: Fix error return code in qedr_iw_connect()
    0f8528c78fc8 ovl: invalidate readdir cache on changes to dir with origin
    082fa65bf60a KVM: PPC: Book3S HV P9: Restore host CTRL SPR after guest exit
    de4e60382b90 mt76: mt7663s: fix the possible device hang in high traffic
    188dfc470263 mt76: mt7663s: make all of packets 4-bytes aligned in sdio tx aggregation
    bf08637d32e6 mt76: mt7915: fix mib stats counter reporting to mac80211
    0b39be51626d mt76: mt7615: fix mib stats counter reporting to mac80211
    2da92db47f07 mt76: mt7915: fix aggr len debugfs node
    4e7914ce2330 mt76: mt7915: fix tx skb dma unmap
    75bc5f779a76 mt76: mt7615: fix tx skb dma unmap
    3443c54c4171 mt7601u: fix always true expression
    00792f31a330 rtw88: Fix an error code in rtw_debugfs_set_rsvd_page()
    80cff3e11670 xfs: fix return of uninitialized value in variable error
    b07520a55f10 perf vendor events amd: Fix broken L2 Cache Hits from L2 HWPF metric
    08c75d4b7682 mac80211: bail out if cipher schemes are invalid
    e00f32c2c97b powerpc: iommu: fix build when neither PCI or IBMVIO is set
    8ce329c68983 powerpc/perf: Fix PMU constraint check for EBB events
    84c0762633f2 powerpc/64s: Fix pte update for kernel memory on radix
    8fac4bd3674f IB/hfi1: Use kzalloc() for mmu_rb_handler allocation
    f9e9df72dc08 liquidio: Fix unintented sign extension of a left shift of a u16
    c87df56d28a6 ASoC: simple-card: fix possible uninitialized single_cpu local variable
    325e8f9edf72 KVM: arm64: Initialize VCPU mdcr_el2 before loading it
    348f68ae40c8 HID: lenovo: Map mic-mute button to KEY_F20 instead of KEY_MICMUTE
    9b14027e4cc2 HID: lenovo: Check hid_get_drvdata() returns non NULL in lenovo_event()
    5ccdc6dd6266 HID: lenovo: Fix lenovo_led_set_tp10ubkbd() error handling
    29bfd0446a2c HID: lenovo: Use brightness_set_blocking callback for setting LEDs brightness
    716132e00ce1 ALSA: usb-audio: Add error checks for usb_driver_claim_interface() calls
    e759105d459b iommu/vt-d: Invalidate PASID cache when root/context entry changed
    c848416cc05a iommu/vt-d: Remove WO permissions on second-level paging entries
    416fa531c816 iommu/vt-d: Preset Access/Dirty bits for IOVA over FL
    32737c3a2669 iommu/vt-d: Report the right page fault address
    eb0530d71c78 iommu/vt-d: Report right snoop capability when using FL for IOVA
    620aa5821aaa iommu: Fix a boundary issue to avoid performance drop
    c96f7eb59b7e iommu/vt-d: Don't set then clear private data in prq_event_thread()
    e0c7b956162b mips: bmips: fix syscon-reboot nodes
    3cf9fac71b79 net: hns3: Limiting the scope of vector_ring_chain variable
    db574a60c482 nfc: pn533: prevent potential memory corruption
    a16f02187d9d RDMA/core: Fix corrupted SL on passive side
    556e75a0ae03 bug: Remove redundant condition check in report_bug
    faba97afdbb9 net/tipc: fix missing destroy_workqueue() on error in tipc_crypto_start()
    fd26f3a07e73 powerpc/pseries: Only register vio drivers if vio bus exists
    4877c4a52339 udp: never accept GSO_FRAGLIST packets
    c45cb22a5500 net: phy: lan87xx: fix access to wrong register of LAN87xx
    897c095c7e9e ALSA: core: remove redundant spin_lock pair in snd_card_disconnect
    afb3416c4fef gpio: guard gpiochip_irqchip_add_domain() with GPIOLIB_IRQCHIP
    9becf957e0b0 MIPS/bpf: Enable bpf_probe_read{, str}() on MIPS again
    19c990c9fad3 powerpc: Fix HAVE_HARDLOCKUP_DETECTOR_ARCH build configuration
    499b3ceb17ad IB/isert: Fix a use after free in isert_connect_request
    78f537c0054a RDMA/mlx5: Fix drop packet rule in egress table
    4ff081701b3d iommu/arm-smmu-v3: add bit field SFM into GERROR_ERR_MASK
    9681d50a70b2 ASoC: wm8960: Remove bitclk relax condition in wm8960_configure_sysclk
    0f69f9596ba0 MIPS: loongson64: fix bug when PAGE_SIZE > 16KB
    da40d5fec5d7 pinctrl: pinctrl-single: fix pcs_pin_dbg_show() when bits_per_mux is not zero
    353fcebf49e2 pinctrl: pinctrl-single: remove unused parameter
    a273c27d7255 inet: use bigger hash table for IP ID generation
    6b4b3b84049f ima: Fix the error code for restoring the PCR value
    536175f0065c MIPS: fix local_irq_{disable,enable} in asmmacro.h
    4c45556db31c powerpc/prom: Mark identical_pvr_fixup as __init
    494327b777f6 powerpc/fadump: Mark fadump_calculate_reserve_size as __init
    454fb207476b libbpf: Add explicit padding to btf_dump_emit_type_decl_opts
    87520507b1ae selftests/bpf: Re-generate vmlinux.h and BPF skeletons if bpftool changed
    ee06efc811ea iommu/vt-d: Reject unsupported page request modes
    b60e13c30688 iommu: Check dev->iommu in iommu_dev_xxx functions
    3d15bf2b2c93 bpftool: Fix maybe-uninitialized warnings
    b1ed7a571750 libbpf: Add explicit padding to bpf_xdp_set_link_opts
    f72e3d81c622 net: lapbether: Prevent racing when checking whether the netif is running
    7cc0ba67883c Bluetooth: avoid deadlock between hci_dev->lock and socket lock
    5cce890e5dc6 KVM: x86/mmu: Retry page faults that hit an invalid memslot
    cd6e679b8d1d wilc1000: write value to WILC_INTR2_ENABLE register
    0d74db145787 RDMA/mlx5: Fix mlx5 rates to IB rates map
    4ebb3b797a63 ASoC: Intel: Skylake: Compile when any configuration is selected
    5fb733e250c0 ASoC: Intel: boards: sof-wm8804: add check for PLL setting
    b3222026dde7 perf symbols: Fix dso__fprintf_symbols_by_name() to return the number of printed chars
    56027a2e75e6 HID: plantronics: Workaround for double volume key presses
    613f9d1f1587 xsk: Respect device's headroom and tailroom on generic xmit path
    5378c92425f3 drivers/block/null_blk/main: Fix a double free in null_init.
    94f1bdf01b39 sched/debug: Fix cgroup_path[] serialization
    cbbc13b115b8 io_uring: fix overflows checks in provide buffers
    db4645fbae17 perf/amd/uncore: Fix sysfs type mismatch
    c8a54b4d6657 x86/events/amd/iommu: Fix sysfs type mismatch
    d5149a487f2d HSI: core: fix resource leaks in hsi_add_client_from_dt()
    38c1f8ebb373 media: cedrus: Fix H265 status definitions
    a11497b3bb75 nvme-pci: don't simple map sgl when sgls are disabled
    b2c55f81c1d1 nvmet-tcp: fix a segmentation fault during io parsing error
    2842b91ac7a5 mfd: stm32-timers: Avoid clearing auto reload register
    cadbba5ec895 mailbox: sprd: Introduce refcnt when clients requests/free channels
    b42ec774db50 scsi: ibmvfc: Fix invalid state machine BUG_ON()
    5129ec347a89 scsi: sni_53c710: Add IRQ check
    79ee30433357 scsi: sun3x_esp: Add IRQ check
    18e729d21f26 scsi: jazz_esp: Add IRQ check
    7d81167e513f scsi: hisi_sas: Fix IRQ checks
    aa83f32d40e2 scsi: ufs: ufshcd-pltfrm: Fix deferred probing
    4e5e08975521 scsi: pm80xx: Fix potential infinite loop
    a613887c4126 scsi: pm80xx: Increase timeout for pm80xx mpi_uninit_check()
    d3d3735858e0 clk: uniphier: Fix potential infinite loop
    c360228ecfb1 drm/radeon: Fix a missing check bug in radeon_dp_mst_detect()
    a6d56760eaba drm/amd/display: use GFP_ATOMIC in dcn20_resource_construct
    3968d95f3116 clk: qcom: apss-ipq-pll: Add missing MODULE_DEVICE_TABLE
    edc6a44bcc49 clk: qcom: a53-pll: Add missing MODULE_DEVICE_TABLE
    a6596d71a635 drm: xlnx: zynqmp: fix a memset in zynqmp_dp_train()
    fc076f40c859 clk: zynqmp: pll: add set_pll_mode to check condition in zynqmp_pll_enable
    9c91a014a3b5 clk: zynqmp: move zynqmp_pll_set_mode out of round_rate callback
    b29d6a435e0f vfio/mdev: Do not allow a mdev_type to have a NULL parent pointer
    87856f9af04e vfio/pci: Re-order vfio_pci_probe()
    dad86dd76b8b vfio/pci: Move VGA and VF initialization to functions
    daa72300c996 vfio/fsl-mc: Re-order vfio_fsl_mc_probe()
    d0702c665e6b media: v4l2-ctrls.c: fix race condition in hdl->requests list
    2d49873b49dc media: i2c: imx219: Balance runtime PM use-count
    0050c9794135 media: i2c: imx219: Move out locking/unlocking of vflip and hflip controls from imx219_set_stream
    59dd4fe0ae03 nvme: retrigger ANA log update if group descriptor isn't found
    20719538c49f power: supply: bq25980: Move props from battery node
    9e33e261b4d6 clk: imx: Fix reparenting of UARTs not associated with stdout
    60ade0d56b06 nvmet-tcp: fix incorrect locking in state_change sk callback
    a3ea59d09525 nvme-tcp: block BH in sk state_change sk callback
    7456cc7c9fd5 seccomp: Fix CONFIG tests for Seccomp_filters
    4f53ef0f7841 ata: libahci_platform: fix IRQ check
    6187fa250294 sata_mv: add IRQ checks
    f87689e71604 pata_ipx4xx_cf: fix IRQ check
    d1bb0316f507 pata_arasan_cf: fix IRQ check
    0ad91dc7ea8e selftests: fix prepending $(OUTPUT) to $(TEST_PROGS)
    296da2049f2a x86/kprobes: Fix to check non boostable prefixes correctly
    e2ff41d2ee4d of: overlay: fix for_each_child.cocci warnings
    c272c735a1e2 drm/amdkfd: fix build error with AMD_IOMMU_V2=m
    d218c7a0284f media: atomisp: Fix use after free in atomisp_alloc_css_stat_bufs()
    1f743e8d582b media: m88rs6000t: avoid potential out-of-bounds reads on arrays
    96498fbb7b14 media: atomisp: Fixed error handling path
    cc4cc2fb5aaf media: [next] staging: media: atomisp: fix memory leak of object flash
    99ce023bb8bb media: docs: Fix data organization of MEDIA_BUS_FMT_RGB101010_1X30
    757d5d54ca71 media: m88ds3103: fix return value check in m88ds3103_probe()
    697af15095fc media: platform: sunxi: sun6i-csi: fix error return code of sun6i_video_start_streaming()
    00b68a747834 media: venus: core: Fix some resource leaks in the error path of 'venus_probe()'
    0741a8f2e5b0 drm/probe-helper: Check epoch counter in output_poll_execute()
    a59d01384c80 media: aspeed: fix clock handling logic
    29eb741801b3 media: rkisp1: rsz: crash fix when setting src format
    38f9456ef5a2 media: omap4iss: return error code when omap4iss_get() failed
    3ad6a6288c88 media: saa7146: use sg_dma_len when building pgtable
    a250df336aa5 media: saa7134: use sg_dma_len when building pgtable
    385470a358a6 media: vivid: fix assignment of dev->fbuf_out_flags
    7d81aff28953 rcu: Remove spurious instrumentation_end() in rcu_nmi_enter()
    95f4e9f33b70 afs: Fix updating of i_mode due to 3rd party change
    80862cbf76c2 sched/fair: Fix shift-out-of-bounds in load_balance()
    ef8a03901259 drm/mcde/panel: Inverse misunderstood flag
    403c4528e588 drm/amd/display: Fix off by one in hdmi_14_process_transaction()
    9f075cb08822 drm/stm: Fix bus_flags handling
    1de265ad3c3c drm/tilcdc: send vblank event when disabling crtc
    8e81ff6d512e soc: aspeed: fix a ternary sign expansion bug
    bbe9de67ac5b xen-blkback: fix compatibility bug with single page rings
    565e7c98d332 serial: omap: fix rs485 half-duplex filtering
    9c3e2ad20b0c serial: omap: don't disable rs485 if rts gpio is missing
    927162c7133f ttyprintk: Add TTY hangup callback.
    62bb46f51f91 usb: dwc2: Fix hibernation between host and device modes.
    7bf9d7286cf2 usb: dwc2: Fix host mode hibernation exit with remote wakeup flow.
    1789737ca9f1 PM: hibernate: x86: Use crc32 instead of md5 for hibernation e820 integrity check
    8b4d4bd1f1ce Drivers: hv: vmbus: Increase wait time for VMbus unload
    816fbc17cbe8 hwmon: (pmbus/pxe1610) don't bail out when not all pages are active
    ee9bc379e43c x86/platform/uv: Fix !KEXEC build failure
    5980a3b9c933 spi: spi-zynqmp-gqspi: return -ENOMEM if dma_map_single fails
    1231279389b5 spi: spi-zynqmp-gqspi: fix use-after-free in zynqmp_qspi_exec_op
    fa3a26b43760 spi: spi-zynqmp-gqspi: fix hang issue when suspend/resume
    24159580abcc spi: spi-zynqmp-gqspi: fix clk_enable/disable imbalance issue
    d5c7b42c9f56 Drivers: hv: vmbus: Use after free in __vmbus_open()
    b49bdd70b337 ARM: dts: aspeed: Rainier: Fix humidity sensor bus address
    fe310fd19ff1 platform/x86: pmc_atom: Match all Beckhoff Automation baytrail boards with critclk_systems DMI table
    09a119a2d4c0 security: keys: trusted: fix TPM2 authorizations
    7bb63ed88189 memory: samsung: exynos5422-dmc: handle clk_set_parent() failure
    71bcc1b4a174 memory: renesas-rpc-if: fix possible NULL pointer dereference of resource
    73585b2714db spi: spi-zynqmp-gqspi: Fix missing unlock on error in zynqmp_qspi_exec_op()
    58ee5a0de192 m68k: Add missing mmap_read_lock() to sys_cacheflush()
    99d2fa2daf6d usbip: vudc: fix missing unlock on error in usbip_sockfd_store()
    99a29899e3a3 crypto: chelsio - Read rxchannel-id from firmware
    c703ef8289dc node: fix device cleanups in error handling code
    190a2f24aed6 firmware: qcom-scm: Fix QCOM_SCM configuration
    26882a15ed23 serial: core: return early on unsupported ioctls
    1d9cde4ddf6c tty: fix return value for unsupported termiox ioctls
    eef2158b0c44 tty: Remove dead termiox code
    aa7f103da301 tty: fix return value for unsupported ioctls
    bd8fa4ef36ca tty: actually undefine superseded ASYNC flags
    45c7e5c1428f USB: cdc-acm: fix TIOCGSERIAL implementation
    4425c2f32ac9 USB: cdc-acm: fix unprivileged TIOCCSERIAL
    e38a77c48aa0 usb: gadget: r8a66597: Add missing null check on return from platform_get_resource
    ce02e58ddf86 spi: fsl-lpspi: Fix PM reference leak in lpspi_prepare_xfer_hardware()
    cbe254a1fdce spi: spi-zynqmp-gqspi: fix incorrect operating mode in zynqmp_qspi_read_op
    314469666791 spi: spi-zynqmp-gqspi: transmit dummy circles by using the controller's internal functionality
    6bd307eb518d spi: spi-zynqmp-gqspi: add mutex locking for exec_op
    c164328f57c4 spi: spi-zynqmp-gqspi: use wait_for_completion_timeout to make zynqmp_qspi_exec_op not interruptible
    36cf347de9c4 cpufreq: armada-37xx: Fix determining base CPU frequency
    2f412fba2749 cpufreq: armada-37xx: Fix driver cleanup when registration failed
    6d7507243e05 clk: mvebu: armada-37xx-periph: Fix workaround for switching from L1 to L0
    a7ddbc86e4e4 clk: mvebu: armada-37xx-periph: Fix switching CPU freq from 250 Mhz to 1 GHz
    ce4b8f58b611 cpufreq: armada-37xx: Fix the AVS value for load L1
    cccc3f18fcb5 clk: mvebu: armada-37xx-periph: remove .set_parent method for CPU PM clock
    a13b110e7c9e cpufreq: armada-37xx: Fix setting TBG parent for load levels
    1faf7e6199b8 crypto: qat - Fix a double free in adf_create_ring
    0e596b373464 crypto: sa2ul - Fix memory leak of rxd
    2c67a9333da9 crypto: sun8i-ss - Fix memory leak of pad
    2e57ffdb5696 crypto: allwinner - add missing CRYPTO_ prefix
    ac0fc2de8ad1 ACPI: CPPC: Replace cppc_attr with kobj_attribute
    e65c287c9bd8 cpuidle: Fix ARM_QCOM_SPM_CPUIDLE configuration
    8316ec23bdd0 PM: runtime: Replace inline function pm_runtime_callbacks_present()
    d97cb4365747 soc: qcom: mdt_loader: Detect truncated read of segments
    ab86e5145f61 soc: qcom: mdt_loader: Validate that p_filesz < p_memsz
    078362f495a0 spi: fsl: add missing iounmap() on error in of_fsl_spi_probe()
    c7fabe372a90 spi: Fix use-after-free with devm_spi_alloc_*
    1de36911689c clocksource/drivers/ingenic_ost: Fix return value check in ingenic_ost_probe()
    edfcc1835958 clocksource/drivers/timer-ti-dm: Add missing set_state_oneshot_stopped
    410a1da7ee0e clocksource/drivers/timer-ti-dm: Fix posted mode status check order
    0681c62d1ea2 PM / devfreq: Use more accurate returned new_freq as resume_freq
    165b71a98c5a soc: qcom: pdr: Fix error return code in pdr_register_listener
    49f71d50cb30 staging: greybus: uart: fix unprivileged TIOCCSERIAL
    2c3ce3d84e80 staging: fwserial: fix TIOCGSERIAL implementation
    e08a24ae25b3 staging: fwserial: fix TIOCSSERIAL implementation
    40d622b31baf staging: rtl8192u: Fix potential infinite loop
    ab727e601cb5 staging: comedi: tests: ni_routes_test: Fix compilation error
    16ed454e10a8 irqchip/gic-v3: Fix OF_BAD_ADDR error handling
    b1d1f644ed9e mtd: rawnand: gpmi: Fix a double free in gpmi_nand_init
    4b465576f02a iio: adc: Kconfig: make AD9467 depend on ADI_AXI_ADC symbol
    11e708c19bdd firmware: qcom_scm: Workaround lack of "is available" call on SC7180
    89d449867c5d firmware: qcom_scm: Reduce locking section for __get_convention()
    2ceac2b6c87c firmware: qcom_scm: Make __qcom_scm_is_call_available() return bool
    1dfb26df15fc m68k: mvme147,mvme16x: Don't wipe PCC timer config bits
    7c468deae306 soundwire: stream: fix memory leak in stream config error path
    aa531c6c51e7 memory: pl353: fix mask of ECC page_size config register
    0256f4205c14 driver core: platform: Declare early_platform_cleanup() prototype
    100a5c76e5d2 drivers: nvmem: Fix voltage settings for QTI qfprom-efuse
    409ab5a9d809 USB: gadget: udc: fix wrong pointer passed to IS_ERR() and PTR_ERR()
    4b6b771a6d3f usb: gadget: aspeed: fix dma map failure
    36babddef782 crypto: qat - fix error path in adf_isr_resource_alloc()
    bbd61fa05cd6 crypto: poly1305 - fix poly1305_core_setkey() declaration
    821ff1d44fe3 NFSv4.2: fix copy stateid copying for the async copy
    74bcea1a608e NFSD: Fix sparse warning in nfs4proc.c
    c9df2c56f502 arm64: dts: mediatek: fix reset GPIO level on pumpkin
    53191c1d78b1 phy: marvell: ARMADA375_USBCLUSTER_PHY should not default to y, unconditionally
    6cca7cc213d6 phy: ti: j721e-wiz: Delete "clk_div_sel" clk provider during cleanup
    1e337097fe10 soundwire: bus: Fix device found flag correctly
    00f6abd3509b bus: qcom: Put child node before return
    6a4d2f863ab8 arm64: dts: renesas: r8a779a0: Fix PMU interrupt
    7b6552719c0c mtd: require write permissions for locking and badblock ioctls
    45eb038029b9 dt-bindings: serial: stm32: Use 'type: object' instead of false for 'additionalProperties'
    42c9f39a7222 usb: gadget: s3c: Fix the error handling path in 's3c2410_udc_probe()'
    0764c91011c5 usb: gadget: s3c: Fix incorrect resources releasing
    b33c05d6bf6f fotg210-udc: Complete OUT requests on short packets
    7d5ff493219c fotg210-udc: Don't DMA more than the buffer can take
    e06d4a0c39bf fotg210-udc: Mask GRP2 interrupts we don't handle
    3515fd226ea0 fotg210-udc: Remove a dubious condition leading to fotg210_done
    36df13916de9 fotg210-udc: Fix EP0 IN requests bigger than two packets
    01c66e834024 fotg210-udc: Fix DMA on EP0 for length > max packet size
    1f50392650ae crypto: qat - ADF_STATUS_PF_RUNNING should be set after adf_dev_init
    b50967781767 crypto: qat - don't release uninitialized resources
    31e1314ceee0 crypto: ccp - fix command queuing to TEE ring buffer
    22ae303805aa usb: gadget: pch_udc: Provide a GPIO line used on Intel Minnowboard (v1)
    9f6e0fdb154c usb: gadget: pch_udc: Initialize device pointer before use
    3b6769806027 usb: gadget: pch_udc: Check for DMA mapping error
    a6e680788c62 usb: gadget: pch_udc: Check if driver is present before calling ->setup()
    7d18eb34036a usb: gadget: pch_udc: Replace cpu_to_le32() by lower_32_bits()
    501ba8bf8d35 devtmpfs: fix placement of complete() call
    bac20313210a x86/microcode: Check for offline CPUs before requesting new microcode
    05b3f9b0ac32 spi: stm32: Fix use-after-free on unbind
    75a7a8920a57 arm64: dts: renesas: r8a77980: Fix vin4-7 endpoint binding
    e8146dc804bf regulator: bd9576: Fix return from bd957x_probe()
    0390f6f1d0bc spi: stm32: drop devres version of spi_register_master
    617ec35ed51f crypto: sun8i-ss - Fix memory leak of object d when dma_iv fails to map
    75d0f3fb02d9 arm64: dts: qcom: db845c: fix correct powerdown pin for WSA881x
    a27a2590f76e arm64: dts: qcom: sm8250: fix number of pins in 'gpio-ranges'
    2feffa751958 arm64: dts: qcom: sm8150: fix number of pins in 'gpio-ranges'
    8ff9b9f4fb54 arm64: dts: qcom: sdm845: fix number of pins in 'gpio-ranges'
    3673e0fa13ec arm64: dts: qcom: sm8250: Fix timer interrupt to specify EL2 physical timer
    5faf320a2b4d arm64: dts: qcom: sm8250: Fix level triggered PMU interrupt polarity
    33ffc713dfc2 ARM: dts: stm32: fix usart 2 & 3 pinconf to wake up with flow control
    5133b4bdc98e mtd: maps: fix error return code of physmap_flash_remove()
    c55310e30de2 mtd: don't lock when recursively deleting partitions
    174fe383de80 mtd: rawnand: qcom: Return actual error code instead of -ENODEV
    ca28e6a013b2 mtd: Handle possible -EPROBE_DEFER from parse_mtd_partitions()
    705ad2d8c361 mtd: rawnand: brcmnand: fix OOB R/W with Hamming ECC
    c8f3837c51f8 mtd: rawnand: fsmc: Fix error code in fsmc_nand_probe()
    82a0cadf6fa5 spi: rockchip: avoid objtool warning
    eb949f891226 regmap: set debugfs_name to NULL after it is freed
    840a6ff50a53 usb: typec: stusb160x: fix return value check in stusb160x_probe()
    72fa4c30ac1b usb: typec: tps6598x: Fix return value check in tps6598x_probe()
    2c80fa2cbfec usb: typec: tcpci: Check ROLE_CONTROL while interpreting CC_STATUS
    98743f2b8c25 serial: stm32: fix tx_empty condition
    566901ba502f serial: stm32: add FIFO flush when port is closed
    01ce9c5d1715 serial: stm32: fix FIFO flush in startup and set_termios
    f765918b334d serial: stm32: call stm32_transmit_chars locked
    a98c0683a3be serial: stm32: fix tx dma completion, release channel
    1f308f65d851 serial: stm32: fix a deadlock in set_termios
    5eacd7fa4087 serial: stm32: fix wake-up flag handling
    ea627af3dddd serial: stm32: fix a deadlock condition with wakeup event
    69ac7b3b893c serial: stm32: fix TX and RX FIFO thresholds
    5ca0d5b2c801 serial: stm32: fix incorrect characters on console
    a44d6acfa7df serial: stm32: fix startup by enabling usart for reception
    b5e8f0adaec1 serial: stm32: Use of_device_get_match_data()
    379b007b57ca serial: stm32: fix probe and remove order for dma
    1027c8c028c0 serial: stm32: add "_usart" prefix in functions name
    ab8363f13f12 serial: stm32: fix code cleaning warnings and checks
    7c5e96e89c05 x86/platform/uv: Set section block size for hubless architectures
    e6d95f35235a arm64: dts: renesas: Add mmc aliases into board dts files
    9d48f2b903d1 ARM: dts: renesas: Add mmc aliases into R-Car Gen2 board dts files
    2ddb0b285c2c ARM: dts: s5pv210: correct fuel gauge interrupt trigger level on Fascinate family
    6d6abd5e4778 ARM: dts: exynos: correct PMIC interrupt trigger level on Snow
    0069053e21ed ARM: dts: exynos: correct PMIC interrupt trigger level on SMDK5250
    c4121dac1c14 ARM: dts: exynos: correct PMIC interrupt trigger level on Odroid X/U3 family
    2c2d05131e1b ARM: dts: exynos: correct PMIC interrupt trigger level on Midas family
    c6541b0e8891 ARM: dts: exynos: correct MUIC interrupt trigger level on Midas family
    0cc067284a3e ARM: dts: exynos: correct fuel gauge interrupt trigger level on Midas family
    41fdefb351ae ARM: dts: exynos: correct fuel gauge interrupt trigger level on GT-I9100
    dff20fb2791c memory: gpmc: fix out of bounds read and dereference on gpmc_cs[]
    1f12aaf07f61 crypto: sun8i-ss - fix result memory leak on error path
    9c0d2c3f7f72 fpga: fpga-mgr: xilinx-spi: fix error messages on -EPROBE_DEFER
    305a936af4fc firmware: xilinx: Remove zynqmp_pm_get_eemi_ops() in IS_REACHABLE(CONFIG_ZYNQMP_FIRMWARE)
    cfc0577ab19e firmware: xilinx: Add a blank line after function declaration
    ef7809681b2c firmware: xilinx: Fix dereferencing freed memory
    7f69649dad99 Revert "tools/power turbostat: adjust for temperature offset"
    0781a13c9c44 usb: gadget: pch_udc: Revert d3cb25a12138 completely
    6b922dc1d11e Revert "drm/qxl: do not run release if qxl failed to init"
    06f414e5c9f0 ovl: fix missing revert_creds() on error path
    7604978e85b8 Revert "i3c master: fix missing destroy_workqueue() on error in i3c_master_register"
    545dbb1bbeff Revert "drivers/net/wan/hdlc_fr: Fix a double free in pvc_xmit"
    96e308a36efe KVM: arm64: Fix KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION read
    00824c30236b KVM: arm64: Fully zero the vcpu state on reset
    2a20592baff5 KVM: Stop looking for coalesced MMIO zones if the bus is destroyed
    03c6cccedd39 KVM: Destroy I/O bus devices on unregister failure _after_ sync'ing SRCU
    ae996824da9b KVM: arm/arm64: Fix KVM_VGIC_V3_ADDR_TYPE_REDIST read
    a947f95b6b3a KVM: nVMX: Truncate base/index GPR value on address calc in !64-bit
    6b7028de661d KVM: nVMX: Truncate bits 63:32 of VMCS field on nested check in !64-bit
    fa9b4ee318f9 KVM: nVMX: Defer the MMU reload to the normal path on an EPTP switch
    6748f80aeaf3 KVM: SVM: Inject #GP on guest MSR_TSC_AUX accesses if RDTSCP unsupported
    6ccdbedd167c KVM: SVM: Do not allow SEV/SEV-ES initialization after vCPUs are created
    ead4fb53fd42 KVM: SVM: Don't strip the C-bit from CR2 on #PF interception
    12d684302581 KVM: nSVM: Set the shadow root level to the TDP level for nested NPT
    f59c2220f6ec KVM: x86: Remove emulator's broken checks on CR0/CR3/CR4 loads
    c8b49e01a23b KVM: x86/mmu: Alloc page for PDPTEs when shadowing 32-bit NPT with 64-bit
    b4414fbc0fb3 KVM: s390: extend kvm_s390_shadow_fault to return entry pointer
    568782de5df1 KVM: s390: split kvm_s390_real_to_abs
    3804d1a4be99 KVM: s390: VSIE: fix MVPG handling for prefixing and MSO
    814cb6de6db6 s390: fix detection of vector enhancements facility 1 vs. vector packed decimal facility
    be4ed1ac92ef KVM: s390: fix guarded storage control register handling
    2705bc3f1c8d KVM: s390: split kvm_s390_logical_to_effective
    82de9ad49303 KVM: s390: VSIE: correctly handle MVPG when in VSIE
    885024a8fb20 ALSA: hda/realtek: Fix speaker amp on HP Envy AiO 32
    bead5f0e81d7 ALSA: hda/realtek: ALC285 Thinkpad jack pin quirk is unreachable
    e8a3a49001f3 ALSA: hda/realtek: Remove redundant entry for ALC861 Haier/Uniwill devices
    ccaa81e802d2 ALSA: hda/realtek: Re-order ALC662 quirk table entries
    ada3f488d576 ALSA: hda/realtek: Re-order remaining ALC269 quirk table entries
    5a58fbcf6443 ALSA: hda/realtek: Re-order ALC269 Lenovo quirk table entries
    44d57dcd8300 ALSA: hda/realtek: Re-order ALC269 Sony quirk table entries
    9f7ee3dd2c09 ALSA: hda/realtek: Re-order ALC269 ASUS quirk table entries
    7aee1f28ebd9 ALSA: hda/realtek: Re-order ALC269 Dell quirk table entries
    ba56b860da86 ALSA: hda/realtek: Re-order ALC269 Acer quirk table entries
    252feb3af9a0 ALSA: hda/realtek: Re-order ALC269 HP quirk table entries
    91d5c81bf24f ALSA: hda/realtek: Re-order ALC882 Clevo quirk table entries
    56e923d0368f ALSA: hda/realtek: Re-order ALC882 Sony quirk table entries
    8c9841ae6e8b ALSA: hda/realtek: Re-order ALC882 Acer quirk table entries
    ae5c6690e0c8 drm/amdgpu: fix concurrent VM flushes on Vega/Navi v2
    7e2459bb19b9 drm/amd/display: Reject non-zero src_y and src_x for video planes
    ce450934a00c drm: bridge/panel: Cleanup connector on bridge detach
    92b98bcc4f48 drm/dp_mst: Set CLEAR_PAYLOAD_ID_TABLE as broadcast
    7eea3eff02ed drm/dp_mst: Revise broadcast msg lct & lcr
    9b50c185d27d drm/radeon: fix copy of uninitialized variable back to userspace
    09b031b5fc18 drm/panfrost: Don't try to map pages that are already mapped
    abb79f67a909 drm/panfrost: Clear MMU irqs before handling the fault
    08f6e8a7538d drm/qxl: use ttm bo priorities
    f6c5cc6febbe drm/i915/gvt: Fix vfio_edid issue for BXT/APL
    92b82770e9ba drm/i915/gvt: Fix virtual display setup for BXT/APL
    3b999f3eac04 FDDI: defxx: Make MMIO the configuration default except for EISA
    9fa26701cd1f mt76: fix potential DMA mapping leak
    95fb153c6027 rtw88: Fix array overrun in rtw_get_tx_power_params()
    9e7fcf39e2f8 cfg80211: scan: drop entry from hidden_list on overflow
    c9996845ff67 ipw2x00: potential buffer overflow in libipw_wx_set_encodeext()
    f54f21c07fea mt76: mt7615: use ieee80211_free_txskb() in mt7615_tx_token_put()
    0035a4704557 md: Fix missing unused status line of /proc/mdstat
    b70b7ec50089 md: md_open returns -EBUSY when entering racing area
    cdcfa77a332a md: factor out a mddev_find_locked helper from mddev_find
    07e737408502 md: split mddev_find
    61b8c6efbe87 md-cluster: fix use-after-free issue when removing rdev
    569885ad7518 md/bitmap: wait for external bitmap writes to complete during tear down
    cab2e8e5997b async_xor: increase src_offs when dropping destination page
    a4c421b12cc6 x86, sched: Treat Intel SNC topology as default, COD as exception
    4c0ddc8712d9 selinux: add proper NULL termination to the secclass_map permissions
    bb27aecf06a3 misc: vmw_vmci: explicitly initialize vmci_datagram payload
    15f2a3de1a6b misc: vmw_vmci: explicitly initialize vmci_notify_bm_set_msg struct
    6115a9027e52 phy: ti: j721e-wiz: Invoke wiz_init() before of_platform_device_create()
    dbd328dfd9c1 misc: lis3lv02d: Fix false-positive WARN on various HP models
    be6566144cbd phy: cadence: Sierra: Fix PHY power_on sequence
    66c86eefa2eb sc16is7xx: Defer probe if device read fails
    814919a0739f iio:adc:ad7476: Fix remove handling
    62a560ac4acd iio:accel:adis16201: Fix wrong axis assignment that prevents loading
    5670ed4d5568 iio: inv_mpu6050: Fully validate gyro and accel scale writes
    a1ad124c8368 soc/tegra: regulators: Fix locking up when voltage-spread is out of range
    2f2d444ac496 PM / devfreq: Unlock mutex and free devfreq struct in error path
    e0b325888b53 PCI: keystone: Let AM65 use the pci_ops defined in pcie-designware-host.c
    cc178b77f8a3 PCI: xgene: Fix cfg resource mapping
    451a3e7570fc KVM: x86: Defer the MMU unload to the normal path on an global INVPCID
    14e3676e3cad PCI: Allow VPD access for QLogic ISP2722
    a22fc2eb03c4 FDDI: defxx: Bail out gracefully with unassigned PCI resource for CSR
    bd93fbc101d0 MIPS: pci-rt2880: fix slot 0 configuration
    149e1986ff6a MIPS: pci-mt7620: fix PLL lock check
    cdc7ff119a65 ASoC: tlv320aic32x4: Increase maximum register in regmap
    8d24a7195976 ASoC: tlv320aic32x4: Register clocks before registering component
    c3c86bd3d5e4 ASoC: Intel: kbl_da7219_max98927: Fix kabylake_ssp_fixup function
    7a7c14873c6d ASoC: samsung: tm2_wm5110: check of of_parse return value
    5a75dc20a92b usb: xhci-mtk: improve bandwidth scheduling with TT
    eb58724f4476 usb: xhci-mtk: remove or operator for setting schedule parameters
    048a99032d8a usb: typec: tcpm: update power supply once partner accepts
    61a4b925aa0f usb: typec: tcpm: Address incorrect values of tcpm psy for pps supply
    79cae796dbf0 usb: typec: tcpm: Address incorrect values of tcpm psy for fixed supply
    0dace269aa22 drm: bridge: fix LONTIUM use of mipi_dsi_() functions
    8a80901a061f staging: fwserial: fix TIOCSSERIAL permission check
    af5145c8efa6 tty: moxa: fix TIOCSSERIAL permission check
    6096118089c9 staging: fwserial: fix TIOCSSERIAL jiffies conversions
    eb3a757e0baa USB: serial: ti_usb_3410_5052: fix TIOCSSERIAL permission check
    767e8241dd1c staging: greybus: uart: fix TIOCSSERIAL jiffies conversions
    304efedabad2 USB: serial: usb_wwan: fix TIOCSSERIAL jiffies conversions
    f283aaa01824 tty: amiserial: fix TIOCSSERIAL permission check
    f09ec0fc67a4 tty: moxa: fix TIOCSSERIAL jiffies conversions
    eeb4fd46eb9e usb: roles: Call try_module_get() from usb_role_switch_find_by_fwnode()
    c2ef392fff9d Revert "USB: cdc-acm: fix rounding error in TIOCSSERIAL"
    7e916d0124e5 io_uring: truncate lengths larger than MAX_RW_COUNT on provide buffers
    6b7021ed36da net/nfc: fix use-after-free llcp_sock_bind/connect
    2d84ef4e6569 bluetooth: eliminate the potential race condition when removing the HCI controller
    1d7bd87a2c8d Bluetooth: verify AMP hci_chan before amp_destroy

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7e47d02cb34d23132b54e48bf0c86844d20d0f02)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index a5a2bb08ac..aa5136bdd3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9aa05ff10d0110953bf3597b3c4ea90f74a78d85"
-SRCREV_meta ?= "009a0d9db0fb974aaafddfb2fe6ced4fd1f8bfc8"
+SRCREV_machine ?= "bced2cdbd646996800d920c1604bffbb050a62ab"
+SRCREV_meta ?= "cd049697e9b2d3e9118110d476075ff8f87202cc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.36"
+LINUX_VERSION ?= "5.10.37"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 1f85d972f7..2229651234 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.36"
+LINUX_VERSION ?= "5.10.37"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "170e1fc536c98406fb1ad250af511a4bf401f8e2"
-SRCREV_machine ?= "2105ce2526ddd17827c23e89d6b4e9010261c08c"
-SRCREV_meta ?= "009a0d9db0fb974aaafddfb2fe6ced4fd1f8bfc8"
+SRCREV_machine_qemuarm ?= "8671a3ad43c8c3c86c6d68cbe37699bcdbefcf95"
+SRCREV_machine ?= "3e27efe3e870d43df01e9a9fdb06bf4221e82b51"
+SRCREV_meta ?= "cd049697e9b2d3e9118110d476075ff8f87202cc"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 969f1a46d4..910b38e874 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "0da8b6daad325e8c6ae957d9023e91186645a4cd"
-SRCREV_machine_qemuarm64 ?= "2105ce2526ddd17827c23e89d6b4e9010261c08c"
-SRCREV_machine_qemumips ?= "4b377a8a37f03f34fff1e1fcf49e31772e6fda08"
-SRCREV_machine_qemuppc ?= "2105ce2526ddd17827c23e89d6b4e9010261c08c"
-SRCREV_machine_qemuriscv64 ?= "2105ce2526ddd17827c23e89d6b4e9010261c08c"
-SRCREV_machine_qemuriscv32 ?= "2105ce2526ddd17827c23e89d6b4e9010261c08c"
-SRCREV_machine_qemux86 ?= "2105ce2526ddd17827c23e89d6b4e9010261c08c"
-SRCREV_machine_qemux86-64 ?= "2105ce2526ddd17827c23e89d6b4e9010261c08c"
-SRCREV_machine_qemumips64 ?= "df5eac625c02c6be577dbb1a7cc0472b71c704b4"
-SRCREV_machine ?= "2105ce2526ddd17827c23e89d6b4e9010261c08c"
-SRCREV_meta ?= "009a0d9db0fb974aaafddfb2fe6ced4fd1f8bfc8"
+SRCREV_machine_qemuarm ?= "4709102e6293ec2ac641914495cf3dc3d91172dd"
+SRCREV_machine_qemuarm64 ?= "3e27efe3e870d43df01e9a9fdb06bf4221e82b51"
+SRCREV_machine_qemumips ?= "15f871db6d6e35e72e3a2bf15927cb99865218e1"
+SRCREV_machine_qemuppc ?= "3e27efe3e870d43df01e9a9fdb06bf4221e82b51"
+SRCREV_machine_qemuriscv64 ?= "3e27efe3e870d43df01e9a9fdb06bf4221e82b51"
+SRCREV_machine_qemuriscv32 ?= "3e27efe3e870d43df01e9a9fdb06bf4221e82b51"
+SRCREV_machine_qemux86 ?= "3e27efe3e870d43df01e9a9fdb06bf4221e82b51"
+SRCREV_machine_qemux86-64 ?= "3e27efe3e870d43df01e9a9fdb06bf4221e82b51"
+SRCREV_machine_qemumips64 ?= "5487fabea2c4601da8b1233d50a07a7b4e698c89"
+SRCREV_machine ?= "3e27efe3e870d43df01e9a9fdb06bf4221e82b51"
+SRCREV_meta ?= "cd049697e9b2d3e9118110d476075ff8f87202cc"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.36"
+LINUX_VERSION ?= "5.10.37"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.31.1

