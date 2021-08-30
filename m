Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.13900.1630308851415211051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 00:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="197789611"
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; 
   d="scan'208";a="197789611"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2021 00:34:25 -0700
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; 
   d="scan'208";a="509469339"
Received: from hongkekh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.234.105])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2021 00:34:23 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 8/9] linux-yocto/5.4: update to v5.4.141
Date: Mon, 30 Aug 2021 15:33:59 +0800
Message-Id: <4d7d06f27e64441a8b98dc7469513a8216e205b7.1630306698.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1630306698.git.anuj.mittal@intel.com>
References: <cover.1630306698.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    b704883aa8dc Linux 5.4.141
    983d6a6b7e3c btrfs: don't flush from btrfs_delayed_inode_reserve_metadata
    ea13f678a3fd btrfs: export and rename qgroup_reserve_meta
    41a9b8f36de7 btrfs: qgroup: don't commit transaction when we already hold the handle
    38b8485b72cb net: xilinx_emaclite: Do not print real IOMEM pointer
    654c19a7e8d8 btrfs: fix lockdep splat when enabling and disabling qgroups
    c55442cdfdb8 btrfs: qgroup: remove ASYNC_COMMIT mechanism in favor of reserve retry-after-EDQUOT
    fdaf6a322fcc btrfs: transaction: Cleanup unused TRANS_STATE_BLOCKED
    36af2de520cc btrfs: qgroup: try to flush qgroup space when we get -EDQUOT
    5c79287c2b6d btrfs: qgroup: allow to unreserve range without releasing other ranges
    b7a722fd75a1 btrfs: make btrfs_qgroup_reserve_data take btrfs_inode
    dfadea4061a2 btrfs: make qgroup_free_reserved_data take btrfs_inode
    812f39ed5b0b ovl: prevent private clone if bind mount is not allowed
    eeb4742501e0 ppp: Fix generating ppp unit id when ifname is not specified
    3460f3959d1c ALSA: hda: Add quirk for ASUS Flow x13
    81d1a3f97631 USB:ehci:fix Kunpeng920 ehci hardware problem
    d28adaabbbf4 KVM: X86: MMU: Use the correct inherited permissions to get shadow page
    5f4ab7e25fbb usb: dwc3: gadget: Avoid runtime resume if disabling pullup
    1782c4af6bd0 usb: dwc3: gadget: Disable gadget IRQ during pullup disable
    54b7022f2878 usb: dwc3: gadget: Clear DEP flags after stop transfers in ep disable
    e36245a68eb1 usb: dwc3: gadget: Prevent EP queuing while stopping transfers
    823f69250863 usb: dwc3: gadget: Restart DWC3 gadget when enabling pullup
    25a0625fa96f usb: dwc3: gadget: Allow runtime suspend if UDC unbinded
    5f081a928d55 usb: dwc3: Stop active transfers before halting the controller
    396f29ea0cd2 tracing: Reject string operand in the histogram expression
    28276c280f2e media: v4l2-mem2mem: always consider OUTPUT queue during poll
    236aca70929d tee: Correct inappropriate usage of TEE_SHM_DMA_BUF flag
    5b774238e8af KVM: SVM: Fix off-by-one indexing when nullifying last used SEV VMCB
    a998faa9c4ce Linux 5.4.140
    3c197fdd0732 arm64: fix compat syscall return truncation
    72fcaf69525d net/qla3xxx: fix schedule while atomic in ql_wait_for_drvr_lock and ql_adapter_reset
    742e85fa9e80 alpha: Send stop IPI to send to online CPUs
    26946d21395c virt_wifi: fix error on connect
    17d7c9c940fb reiserfs: check directory items on read from disk
    bcad6ece2a50 reiserfs: add check for root_inode in reiserfs_fill_super
    e30a88f1f578 libata: fix ata_pio_sector for CONFIG_HIGHMEM
    a2671d96a3c7 bpf, selftests: Adjust few selftest result_unpriv outcomes
    4892b4f3244b perf/x86/amd: Don't touch the AMD64_EVENTSEL_HOSTONLY bit inside the guest
    d6cf5342faa6 soc: ixp4xx/qmgr: fix invalid __iomem access
    a5bf7ef13ebf spi: meson-spicc: fix memory leak in meson_spicc_remove
    27991c78d630 soc: ixp4xx: fix printing resources
    07fd256d53a3 arm64: vdso: Avoid ISB after reading from cntvct_el0
    90e498ef3f54 KVM: x86/mmu: Fix per-cpu counter corruption on 32-bit builds
    2e1a80b93464 KVM: Do not leak memory for duplicate debugfs directories
    43486cd7391f KVM: x86: accept userspace interrupt only if no event is injected
    1b7b9713a50f md/raid10: properly indicate failure when ending a failed write request
    790cb68d35a6 pcmcia: i82092: fix a null pointer dereference bug
    42ac2c63486f timers: Move clearing of base::timer_running under base:: Lock
    8211bb20da23 serial: 8250_pci: Avoid irq sharing for MSI(-X) interrupts.
    f73dcb5d63e2 serial: 8250_pci: Enumerate Elkhart Lake UARTs via dedicated driver
    607460d38692 MIPS: Malta: Do not byte-swap accesses to the CBUS UART
    3eb686d01c31 serial: 8250: Mask out floating 16/32-bit bus bits
    3b73a69962d6 serial: 8250_mtk: fix uart corruption issue when rx power off
    afdef443a892 serial: tegra: Only print FIFO error message when an error occurs
    097a183f9c1d ext4: fix potential htree corruption when growing large_dir directories
    ac23a1738127 pipe: increase minimum default pipe size to 2 pages
    f3cae04bd42d media: rtl28xxu: fix zero-length control request
    e2f6d5b03898 staging: rtl8712: get rid of flush_scheduled_work
    8f241df0e68f staging: rtl8723bs: Fix a resource leak in sd_int_dpc
    bbdd4a51629a tpm_ftpm_tee: Free and unregister TEE shared memory during kexec
    3c712f14d8a9 optee: Fix memory leak when failing to register shm pages
    0572199b78b3 tee: add tee_shm_alloc_kernel_buf()
    b247bf412cc2 optee: Clear stale cache entries during initialization
    7da261e6bb65 tracing / histogram: Give calculation hist_fields a size
    ba22053f5d5e scripts/tracing: fix the bug that can't parse raw_trace_func
    8d1191f9243c clk: fix leak on devm_clk_bulk_get_all() unwind
    ed5c9a49e6c0 usb: otg-fsm: Fix hrtimer list corruption
    449a705fba60 usb: gadget: f_hid: idle uses the highest byte for duration
    02f336cee589 usb: gadget: f_hid: fixed NULL pointer dereference
    f780a9580cd2 usb: gadget: f_hid: added GET_IDLE and SET_IDLE handlers
    134e27da543d usb: cdns3: Fixed incorrect gadget state
    df1c6eec4ea1 ALSA: usb-audio: Add registration quirk for JBL Quantum 600
    639b45456ec6 ALSA: hda/realtek: add mic quirk for Acer SF314-42
    d09639528b66 firmware_loader: fix use-after-free in firmware_fallback_sysfs
    1deb6b903018 firmware_loader: use -ETIMEDOUT instead of -EAGAIN in fw_load_sysfs_fallback
    0ee687e67277 USB: serial: ftdi_sio: add device ID for Auto-M3 OP-COM v2
    01b2c35b051b USB: serial: ch341: fix character loss at high transfer rates
    9ed43cfaa7f7 USB: serial: option: add Telit FD980 composition 0x1056
    518e81874c40 USB: usbtmc: Fix RCU stall warning
    ff29fe26ab86 Bluetooth: defer cleanup of resources in hci_unregister_dev()
    580c10a40cc7 blk-iolatency: error out if blk_get_queue() failed in iolatency_set_limit()
    ed169b054b43 net: vxge: fix use-after-free in vxge_device_unregister
    c5549876a9ef net: fec: fix use-after-free in fec_drv_remove
    3fed6dee16e4 net: pegasus: fix uninit-value in get_interrupt_interval
    75cef4fc07d2 bnx2x: fix an error code in bnx2x_nic_load()
    437ee90d7b4f mips: Fix non-POSIX regexp
    b1fa6747b9d0 net: ipv6: fix returned variable type in ip6_skb_dst_mtu
    3e63b566d96a nfp: update ethtool reporting of pauseframe control
    d333503de1f0 sctp: move the active_key update after sh_keys is added
    de30346dd396 gpio: tqmx86: really make IRQ optional
    9d440b5c1d20 net: natsemi: Fix missing pci_disable_device() in probe and remove
    69340406986a net: phy: micrel: Fix detection of ksz87xx switch
    2b8ab7aec0dc net: dsa: sja1105: invalidate dynamic FDB entries learned concurrently with statically added ones
    71b0a935dbb0 net: dsa: sja1105: overwrite dynamic FDB entries with static ones in .port_fdb_add
    88b7781609c6 net, gro: Set inner transport header offset in tcp/udp GRO hook
    ba3abe3f8236 dmaengine: imx-dma: configure the generic DMA type to make it work
    ee2f81330a7b media: videobuf2-core: dequeue if start_streaming fails
    3377f2f8c606 scsi: sr: Return correct event when media event code is 3
    f588d4b7be92 spi: imx: mx51-ecspi: Fix low-speed CONFIGREG delay calculation
    b58e3d59a5d8 spi: imx: mx51-ecspi: Reinstate low-speed CONFIGREG delay
    2c1065d40acb omap5-board-common: remove not physically existing vdds_1v8_main fixed-regulator
    299e3968c01a ARM: dts: am437x-l4: fix typo in can@0 node
    9cbe7e21ddff clk: stm32f4: fix post divisor setup for I2S/SAI PLLs
    3f9eed4462b3 ALSA: usb-audio: fix incorrect clock source setting
    16db40fc4a37 arm64: dts: armada-3720-turris-mox: remove mrvl,i2c-fast-mode
    7c08460773b8 ARM: dts: imx: Swap M53Menlo pinctrl_power_button/pinctrl_power_out pins
    1b1f1aa225ed ARM: imx: fix missing 3rd argument in macro imx_mmdc_perf_init
    aecff98c3efe ARM: dts: colibri-imx6ull: limit SDIO clock to 25MHz
    c39907335b9c ARM: dts: imx6qdl-sr-som: Increase the PHY reset duration to 10ms
    61b71c5f51aa ARM: imx: add missing clk_disable_unprepare()
    d88d6bba3bd9 ARM: imx: add missing iounmap()
    6c629cd0239f arm64: dts: ls1028a: fix node name for the sysclk
    4a830a37d37e ALSA: seq: Fix racy deletion of subscriber
    0658a4533576 Revert "ACPICA: Fix memory leak caused by _CID repair function"
    e350cd02e293 Linux 5.4.139
    03ff8a4f9db6 spi: mediatek: Fix fifo transfer
    a0f66ddf05c2 bpf, selftests: Adjust few selftest outcomes wrt unreachable code
    d3796e8f6b3d bpf, selftests: Add a verifier test for assigning 32bit reg states to 64bit ones
    8dec99abcd74 bpf: Test_verifier, add alu32 bounds tracking tests
    fd568de5806f bpf: Fix leakage under speculation on mispredicted branches
    d2f790327f83 bpf: Do not mark insn as seen under speculative path verification
    283d742988f6 bpf: Inherit expanded/patched seen count from old aux data
    a0a9546aaec3 Revert "watchdog: iTCO_wdt: Account for rebooting on second timeout"
    76f5314d7859 firmware: arm_scmi: Add delayed response status check
    1b38f70bbc7c firmware: arm_scmi: Ensure drivers provide a probe function
    44f522298c94 Revert "Bluetooth: Shutdown controller after workqueues are flushed or cancelled"
    38f54217b423 ACPI: fix NULL pointer dereference
    0ea2f55babb7 nvme: fix nvme_setup_command metadata trace event
    b508b652d4f3 net: Fix zero-copy head len calculation.
    bf692e7ef657 qed: fix possible unpaired spin_{un}lock_bh in _qed_mcp_cmd_and_union()
    6bc48348eca7 r8152: Fix potential PM refcount imbalance
    a57c75ff0700 ASoC: tlv320aic31xx: fix reversed bclk/wclk master bits
    e2cccb839a18 spi: stm32h7: fix full duplex irq handler handling
    b72f2d9e91e1 regulator: rt5033: Fix n_voltages settings for BUCK and LDO
    86f2a3e9aae9 btrfs: fix lost inode on log replay after mix of fsync, rename and inode eviction
    b7f0fa2192c5 btrfs: fix race causing unnecessary inode logging during link and rename
    cb006da62a9e btrfs: do not commit logs and transactions during link and rename operations
    174c27d0f9ef btrfs: delete duplicated words + other fixes in comments
    7b90d57b09fa Linux 5.4.138
    7eef18c0479b can: j1939: j1939_session_deactivate(): clarify lifetime of session object
    18b536de3b97 i40e: Add additional info to PHY type error
    d21eb931109a Revert "perf map: Fix dso->nsinfo refcounting"
    16447b2f5c66 powerpc/pseries: Fix regression while building external modules
    265883d1d839 PCI: mvebu: Setup BAR0 in order to fix MSI
    21734a31c9a0 can: hi311x: fix a signedness bug in hi3110_cmd()
    f4fa45b0f91e sis900: Fix missing pci_disable_device() in probe and remove
    dff00ce44891 tulip: windbond-840: Fix missing pci_disable_device() in probe and remove
    e0310bbeaaa2 sctp: fix return value check in __sctp_rcv_asconf_lookup
    408614108abd net/mlx5e: Fix nullptr in mlx5e_hairpin_get_mdev()
    ac4983230616 net/mlx5: Fix flow table chaining
    527feae56fe6 net: llc: fix skb_over_panic
    ede4c93860e6 mlx4: Fix missing error code in mlx4_load_one()
    acb97d4b2d0e net: Set true network header for ECN decapsulation
    851946a68136 tipc: fix sleeping in tipc accept routine
    194b71d28b26 i40e: Fix log TC creation failure when max num of queues is exceeded
    834af62212c7 i40e: Fix queue-to-TC mapping on Tx
    74aea4b7159a i40e: Fix firmware LLDP agent related warning
    b2ab34e862eb i40e: Fix logic of disabling queues
    519582e44e6a netfilter: nft_nat: allow to specify layer 4 protocol NAT only
    3a7a4cee7bec netfilter: conntrack: adjust stop timestamp to real expiry value
    1c043783403c cfg80211: Fix possible memory leak in function cfg80211_bss_update
    6cf2abea1018 nfc: nfcsim: fix use after free during module unload
    6b313d0ffa71 NIU: fix incorrect error return, missed in previous revert
    c4663c162778 HID: wacom: Re-enable touch by default for Cintiq 24HDT / 27QHDT
    e9e2ce00aeda can: esd_usb2: fix memory leak
    43726620b2f6 can: ems_usb: fix memory leak
    819867389276 can: usb_8dev: fix memory leak
    a051dbd17b5b can: mcba_usb_start(): add missing urb->transfer_dma initialization
    793581441b5c can: raw: raw_setsockopt(): fix raw_rcv panic for sock UAF
    c621638d0e6d can: j1939: j1939_xtp_rx_dat_one(): fix rxtimer value between consecutive TP.DT to 750ms
    a24d87b429a9 ocfs2: issue zeroout to EOF blocks
    eaaa4284e288 ocfs2: fix zero out valid data
    9bd1092148b5 KVM: add missing compat KVM_CLEAR_DIRTY_LOG
    7a94dfe5e2a0 x86/kvm: fix vcpu-id indexed array sizes
    2dc291582cce Revert "ACPI: resources: Add checks for ACPI IRQ override"
    a8eec6979734 btrfs: mark compressed range uptodate only if all bio succeed
    57429c1ec770 btrfs: fix rw device counting in __btrfs_free_extra_devids
    61f2cbc792eb x86/asm: Ensure asm/proto.h can be included stand-alone
    99372c38a948 net_sched: check error pointer in tcf_dump_walker()
    5b1de8e15f0f Linux 5.4.137
    ebb1b38be0c9 ipv6: ip6_finish_output2: set sk into newly allocated nskb
    6c04123962f0 ARM: dts: versatile: Fix up interrupt controller node names
    befa900533a9 iomap: remove the length variable in iomap_seek_hole
    83fb41b2f6e4 iomap: remove the length variable in iomap_seek_data
    302e1acd4c26 cifs: fix the out of range assignment to bit fields in parse_server_interfaces
    02a470e3c64a firmware: arm_scmi: Fix range check for the maximum number of pending messages
    289dd584319f firmware: arm_scmi: Fix possible scmi_linux_errmap buffer overflow
    e3acb292f092 hfs: add lock nesting notation to hfs_find_init
    af1178296d77 hfs: fix high memory mapping in hfs_bnode_read
    89136a47e2e7 hfs: add missing clean-up in hfs_fill_super
    ded37d03440d ipv6: allocate enough headroom in ip6_finish_output2()
    f65b7f377cca sctp: move 198 addresses from unusable to private scope
    c8d32973ee6a net: annotate data race around sk_ll_usec
    c23b9a5610f9 net/802/garp: fix memleak in garp_request_join()
    88c4cae3ed25 net/802/mrp: fix memleak in mrp_request_join()
    eef99860c677 cgroup1: fix leaked context root causing sporadic NULL deref in LTP
    7f0365b4daaa workqueue: fix UAF in pwq_unbound_release_workfn()
    85abe0d47fe6 af_unix: fix garbage collect vs MSG_PEEK
    af45f3527aa0 KVM: x86: determine if an exception has an error code only when injecting it.
    828cab3c8c23 tools: Allow proper CC/CXX/... override with LLVM=1 in Makefile.include
    525c5513b60d selftest: fix build error in tools/testing/selftests/vm/userfaultfd.c
    253dccefb5cb Linux 5.4.136
    587f86b7a2a0 xhci: add xhci_get_virt_ep() helper
    f9d0c35556cd perf inject: Close inject.output on exit
    a9c103fa91e4 PCI: Mark AMD Navi14 GPU ATS as broken
    11561d2f7b9d btrfs: compression: don't try to compress if we don't have enough pages
    4980301e1c1f iio: accel: bma180: Fix BMA25x bandwidth register values
    d04f2582c47e iio: accel: bma180: Use explicit member assignment
    4e0afa88954b net: bcmgenet: ensure EXT_ENERGY_DET_MASK is clear
    2a4865d1547e net: dsa: mv88e6xxx: use correct .stats_set_histogram() on Topaz
    7d8c06b8d2d2 drm: Return -ENOTTY for non-drm ioctls
    b5d7bebd96a3 nds32: fix up stack guard gap
    ba378b796088 rbd: always kick acquire on "acquired" and "released" notifications
    13066d6628f0 rbd: don't hold lock_rwsem while running_list is being drained
    b12ead825f6c hugetlbfs: fix mount mode command line processing
    60dbbd76f110 userfaultfd: do not untag user pointers
    540eee8cbb3d selftest: use mmap instead of posix_memalign to allocate memory
    e706ac3fc82e ixgbe: Fix packet corruption due to missing DMA sync
    e617fa62f6cf media: ngene: Fix out-of-bounds bug in ngene_command_config_free_buf()
    77713fb336ca btrfs: check for missing device in btrfs_trim_fs
    f899f24d34d9 tracing: Fix bug in rb_per_cpu_empty() that might cause deadloop.
    59a9f75fb2b6 tracing/histogram: Rename "cpu" to "common_cpu"
    379d8da3353e firmware/efi: Tell memblock about EFI iomem reservations
    281a94362bbe usb: dwc2: gadget: Fix sending zero length packet in DDMA mode.
    167079fbfaa7 USB: serial: cp210x: add ID for CEL EM3588 USB ZigBee stick
    811c4cdf2917 USB: serial: cp210x: fix comments for GE CS1000
    f54ee7e16d0d USB: serial: option: add support for u-blox LARA-R6 family
    e28d28eb9be6 usb: renesas_usbhs: Fix superfluous irqs happen after usb_pkt_pop()
    863d071dbcd5 usb: max-3421: Prevent corruption of freed memory
    e4077a90e600 USB: usb-storage: Add LaCie Rugged USB3-FW to IGNORE_UAS
    da6f6769ee0f usb: hub: Fix link power management max exit latency (MEL) calculations
    fea6b53e631a usb: hub: Disable USB 3 device initiated lpm if exit latency is too high
    962ce043ef92 KVM: PPC: Book3S HV Nested: Sanitise H_ENTER_NESTED TM state
    2b9ffddd70b4 KVM: PPC: Book3S: Fix H_RTAS rets buffer overflow
    c968f563ccde xhci: Fix lost USB 2 remote wake
    a660ecde5c55 ALSA: hdmi: Expose all pins on MSI MS-7C94 board
    f73696354d59 ALSA: sb: Fix potential ABBA deadlock in CSP driver
    7aa2dfbc6bd0 ALSA: usb-audio: Add registration quirk for JBL Quantum headsets
    46d62c3fe2ab ALSA: usb-audio: Add missing proc text entry for BESPOKEN type
    f1754f96ab41 s390/boot: fix use of expolines in the DMA code
    8eb521d19248 s390/ftrace: fix ftrace_update_ftrace_func implementation
    268132b070d9 Revert "MIPS: add PMD table accounting into MIPS'pmd_alloc_one"
    f323809e3108 proc: Avoid mixing integer types in mem_rw()
    b71a75209f6a drm/panel: raspberrypi-touchscreen: Prevent double-free
    2e6ab87f8e63 net: sched: cls_api: Fix the the wrong parameter
    b60461696a0b sctp: update active_key for asoc when old key is being replaced
    9fa89c2caee2 nvme: set the PRACT bit when using Write Zeroes with T10 PI
    c50141b3d769 r8169: Avoid duplicate sysfs entry creation error
    f726817d6b42 afs: Fix tracepoint string placement with built-in AFS
    b22c9e433bb7 Revert "USB: quirks: ignore remote wake-up on Fibocom L850-GL LTE modem"
    69a49e7b5baf nvme-pci: don't WARN_ON in nvme_reset_work if ctrl.state is not RESETTING
    830251361425 ipv6: fix another slab-out-of-bounds in fib6_nh_flush_exceptions
    a88414fb1117 net/sched: act_skbmod: Skip non-Ethernet packets
    c278b954ccc7 net: hns3: fix rx VLAN offload state inconsistent issue
    006ed6f4d00b net/tcp_fastopen: fix data races around tfo_active_disable_stamp
    3942ba235693 net: hisilicon: rename CACHE_LINE_MASK to avoid redefinition
    f11f12decd55 bnxt_en: Check abort error state in bnxt_half_open_nic()
    16ce6cb78690 bnxt_en: Add missing check for BNXT_STATE_ABORT_ERR in bnxt_fw_rset_task()
    c993e7aadc50 bnxt_en: Refresh RoCE capabilities in bnxt_ulp_probe()
    6ee8e6be3067 bnxt_en: Improve bnxt_ulp_stop()/bnxt_ulp_start() call sequence.
    35637acc9810 spi: cadence: Correct initialisation of runtime PM again
    2f2150bf41c1 scsi: target: Fix protect handling in WRITE SAME(32)
    a6cb717f8534 scsi: iscsi: Fix iface sysfs attr detection
    25df44e90ff5 netrom: Decrease sock refcount when sock timers expire
    8d7924ce85ba net: sched: fix memory leak in tcindex_partial_destroy_work
    f38527f18905 KVM: PPC: Fix kvm_arch_vcpu_ioctl vcpu_load leak
    b85dadd4347b KVM: PPC: Book3S: Fix CONFIG_TRANSACTIONAL_MEM=n crash
    b3224bd31861 net: decnet: Fix sleeping inside in af_decnet
    bd2b3b13aa2a efi/tpm: Differentiate missing and invalid final event log table.
    9413c0abb57f net: fix uninit-value in caif_seqpkt_sendmsg
    6d56299ff911 bpftool: Check malloc return value in mount_bpffs_for_pin
    edec10098675 bpf, sockmap, tcp: sk_prot needs inuse_idx set for proc stats
    58259e8b6e85 s390/bpf: Perform r1 range checking before accessing jit->seen_reg[r1]
    cc876a5618bc liquidio: Fix unintentional sign extension issue on left shift of u16
    42fe8f433b31 ASoC: rt5631: Fix regcache sync errors on resume
    d99aaf07365f spi: mediatek: fix fifo rx mode
    08cdda8d8972 regulator: hi6421: Fix getting wrong drvdata
    b25be6bf6419 regulator: hi6421: Use correct variable type for regmap api val argument
    a1ade24cccb5 spi: stm32: fixes pm_runtime calls in probe/remove
    40e203ce74eb spi: stm32: Use dma_request_chan() instead dma_request_slave_channel()
    24b78097a837 spi: imx: add a check for speed_hz before calculating the clock
    52cff6123aa0 perf data: Close all files in close_dir()
    0f63857d1099 perf probe-file: Delete namelist in del_events() on the error path
    8b92ea243bbf perf lzma: Close lzma stream on exit
    51351c6d5a18 perf script: Fix memory 'threads' and 'cpus' leaks on exit
    d2bfc3eda914 perf dso: Fix memory leak in dso__new_map()
    05804a7d223d perf test event_update: Fix memory leak of evlist
    d257f3abdc71 perf test session_topology: Delete session->evlist
    89d1762a4a21 perf env: Fix sibling_dies memory leak
    fd335143befb perf probe: Fix dso->nsinfo refcounting
    6513dee46f80 perf map: Fix dso->nsinfo refcounting
    ff9fc81fa884 nvme-pci: do not call nvme_dev_remove_admin from nvme_remove
    d029df83c61a cxgb4: fix IRQ free race during driver unload
    ae9b64434441 pwm: sprd: Ensure configuring period and duty_cycle isn't wrongly skipped
    a37ca2a076ec selftests: icmp_redirect: IPv6 PMTU info should be cleared after redirect
    05364a2794fb selftests: icmp_redirect: remove from checking for IPv6 route get
    7f4848229e91 ipv6: fix 'disable_policy' for fwd packets
    c67fb96f5431 gve: Fix an error handling path in 'gve_probe()'
    e33da4eeaa35 igb: Fix position of assignment to *ring
    7dd897773618 igb: Check if num of q_vectors is smaller than max before array access
    d3d7cceee841 iavf: Fix an error handling path in 'iavf_probe()'
    7a13a8a8a5fb e1000e: Fix an error handling path in 'e1000_probe()'
    9fc381db7583 fm10k: Fix an error handling path in 'fm10k_probe()'
    5d6a04927b08 igb: Fix an error handling path in 'igb_probe()'
    cddd53237de8 igc: Fix an error handling path in 'igc_probe()'
    47f69d8828e7 igc: Prefer to use the pci_release_mem_regions method
    83b2d55a512a ixgbe: Fix an error handling path in 'ixgbe_probe()'
    ba4fbb68fcfe igc: change default return of igc_read_phy_reg()
    88e0720133d4 igb: Fix use-after-free error during reset
    a9508e0edfe3 igc: Fix use-after-free error during reset

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index e810132d02..984859a88b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0ad6f2204daf35fb25df5e9b52383507df813bb4"
-SRCREV_meta ?= "98ba88191b7c489bc0d83b6c87a31b2330fcd886"
+SRCREV_machine ?= "e823f31a48749bf1d01a86c274fcec87fae1e5ba"
+SRCREV_meta ?= "71f799f448d405a35d88ecee0aba3ec2b198d542"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.139"
+LINUX_VERSION ?= "5.4.141"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index c734ce8db5..44a033d5cb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.139"
+LINUX_VERSION ?= "5.4.141"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "a80ea6be16b19c18855f831333c93d4f3b55e58a"
-SRCREV_machine ?= "405fce9e3f0314767e38b5e8295b34a24cd97a46"
-SRCREV_meta ?= "98ba88191b7c489bc0d83b6c87a31b2330fcd886"
+SRCREV_machine_qemuarm ?= "63d08f6ee3425e9d94eccf3a75a9ec4e474df916"
+SRCREV_machine ?= "05b2de44f781a297be454242d77f619189dfc6f4"
+SRCREV_meta ?= "71f799f448d405a35d88ecee0aba3ec2b198d542"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index fcf65149f0..e80c1e69ae 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "3d243cfd29a57dfe6b04a6a6cf1b1088d107f1f6"
-SRCREV_machine_qemuarm64 ?= "dcac97a2b4469136189f86fe42703026693384be"
-SRCREV_machine_qemumips ?= "ee74231b68518107954078d03d0606910603cf7a"
-SRCREV_machine_qemuppc ?= "76c51679aa6b9c25fe2b5c2052e84197ff2e4e2d"
-SRCREV_machine_qemuriscv64 ?= "807b4668ff7fe3be031ace442a84d70821ef9571"
-SRCREV_machine_qemux86 ?= "807b4668ff7fe3be031ace442a84d70821ef9571"
-SRCREV_machine_qemux86-64 ?= "807b4668ff7fe3be031ace442a84d70821ef9571"
-SRCREV_machine_qemumips64 ?= "3396071f8ce8ca148231fee4d2130feeead41926"
-SRCREV_machine ?= "807b4668ff7fe3be031ace442a84d70821ef9571"
-SRCREV_meta ?= "98ba88191b7c489bc0d83b6c87a31b2330fcd886"
+SRCREV_machine_qemuarm ?= "91a35a54a7b2d4d558b3f8b24c39657a3ff71c7c"
+SRCREV_machine_qemuarm64 ?= "a8edc7f1b004c6fb56d142fba3e688ba2a051b54"
+SRCREV_machine_qemumips ?= "4f1c4fc19e8d2cb994dac34fb8bb32a7c776b318"
+SRCREV_machine_qemuppc ?= "7bb64db24c2b7bd2b6656036009bd71618eb125d"
+SRCREV_machine_qemuriscv64 ?= "13fa9f66484db2492ee09667f45ad3e52e5b35ac"
+SRCREV_machine_qemux86 ?= "13fa9f66484db2492ee09667f45ad3e52e5b35ac"
+SRCREV_machine_qemux86-64 ?= "13fa9f66484db2492ee09667f45ad3e52e5b35ac"
+SRCREV_machine_qemumips64 ?= "931ad0c17451151dd3ddfb27dc2e33965f90ce86"
+SRCREV_machine ?= "13fa9f66484db2492ee09667f45ad3e52e5b35ac"
+SRCREV_meta ?= "71f799f448d405a35d88ecee0aba3ec2b198d542"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.139"
+LINUX_VERSION ?= "5.4.141"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.31.1

