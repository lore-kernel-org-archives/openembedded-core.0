Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7CDF1793F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 13:45:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7UDjw3G015502
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Aug 2018 06:45:58 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 30 Aug 2018 06:45:58 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 30 Aug 2018 09:45:47 -0400
Message-ID: <c4af048270329d64834a23bfe8ab38f9052e2497.1535636375.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1535636375.git.bruce.ashfield@windriver.com>
References: <cover.1535636375.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] linux-yocto/4.14: update to v4.14.67
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2018 13:45:58 -0000
Content-Type: text/plain

Integrating the korg -stable updates that comprise the following commits:

   f4c88459f7c9 Linux 4.14.67
   ef3cf941e0df reiserfs: fix broken xattr handling (heap corruption, bad retval)
   82c6d4994ba8 i2c: imx: Fix race condition in dma read
   415a02d8b65a i2c: core: ACPI: Properly set status byte to 0 for multi-byte writes
   b5b7417ed9d6 PCI: pciehp: Fix unprotected list iteration in IRQ handler
   2f27dfad05ef PCI: pciehp: Fix use-after-free on unplug
   8af37982c3b2 PCI: Skip MPS logic for Virtual Functions (VFs)
   cf9c2bc5eea0 PCI: hotplug: Don't leak pci_slot on registration failure
   6541d98d114e parisc: Remove unnecessary barriers from spinlock.h
   3f59cf41fbfb net/smc: no shutdown in state SMC_LISTEN
   9e9f27e0d7ac packet: refine ring v3 block size test to hold one frame
   c764f22b2fc3 netfilter: conntrack: dccp: treat SYNC/SYNCACK as invalid if no prior state
   caf3d4bd62cc xfrm_user: prevent leaking 2 bytes of kernel memory
   fdb441da3858 parisc: Remove ordered stores from syscall.S
   deebf1d61e70 f2fs: sanity check for total valid node blocks
   2ab95e71c8a5 f2fs: return error during fill_super
   270d5d771917 KVM: irqfd: fix race between EPOLLHUP and irq_bypass_register_consumer
   7a12f4ed07a5 nvme: fix handling of metadata_len for NVME_IOCTL_IO_CMD
   0ee106583f9c ARM: dts: imx6: RDU2: fix irq type for mv88e6xxx switch
   119970f4775b ACPI / EC: Use ec_no_wakeup on more Thinkpad X1 Carbon 6th systems
   715f5f92aabf soc: imx: gpc: restrict register range for regmap access
   90e7d66508e3 tcp: identify cryptic messages as TCP seq # bugs
   e86aaeb8a630 net: qca_spi: Fix log level if probe fails
   7f117d7000ee net: qca_spi: Make sure the QCA7000 reset is triggered
   f600a10d05da net: qca_spi: Avoid packet drop during initial sync
   96dfb7652e17 PCI: versatile: Fix I/O space page leak
   0e66392d985c PCI: OF: Fix I/O space page leak
   114a5608cde4 kvmclock: fix TSC calibration for nested guests
   1b1968d8f6ae net: usb: rtl8150: demote allmulti message to dev_dbg()
   70cc6b67508c octeon_mgmt: Fix MIX registers configuration on MTU setup
   fc9caa36d80e btrfs: scrub: Don't use inode page cache in scrub_handle_errored_block()
   2daadcdc5827 ibmvnic: Fix error recovery on login failure
   a6c35a5c8750 net/ethernet/freescale/fman: fix cross-build error
   7b4ab0e6510b hv/netvsc: fix handling of fallback to single queue mode
   dcedabcab045 drm/nouveau/gem: off by one bugs in nouveau_gem_pushbuf_reloc_apply()
   b6fadd93ad96 pinctrl: nsp: Fix potential NULL dereference
   54046f1793c7 pinctrl: nsp: off by ones in nsp_pinmux_enable()
   87011fb97fe5 pinctrl: ingenic: Fix inverted direction for < JZ4770
   2d2eacd650c6 tcp: remove DELAYED ACK events in DCTCP
   bf106eaa181c qlogic: check kstrtoul() for errors
   75425326b88c packet: reset network header if packet shorter than ll reserved space
   edf81993dc29 kbuild: suppress warnings from 'getconf LFS_*'
   abf9fb6e1537 tools: build: Use HOSTLDFLAGS with fixdep
   bd43d233acaa ixgbe: Be more careful when modifying MAC filters
   95b08af40269 ARM: dts: am3517.dtsi: Disable reference to OMAP3 OTG controller
   e77c08b7c6f0 ARM: DRA7/OMAP5: Enable ACTLR[0] (Enable invalidates of BTB) for secondary cores
   b900c624d467 ARM: 8780/1: ftrace: Only set kernel memory back to read-only after boot
   26c7588c28ca RDMA/mlx5: Fix memory leak in mlx5_ib_create_srq() error path
   a6629efeef9d nfit: fix unchecked dereference in acpi_nfit_ctl
   953c9cddc999 perf script python: Fix dict reference counting
   d1d2e7d014d2 perf tools: Fix compilation errors on gcc8
   42a061a16675 perf llvm-utils: Remove bashism from kernel include fetch script
   e238b259b774 scsi: qedi: Send driver state to MFW
   a38adc3e104b scsi: qedf: Send the driver state to MFW
   fdf578210a0e bnxt_en: Fix for system hang if request_irq fails
   cab718feb18f bnxt_en: Always set output parameters in bnxt_get_max_rings().
   822bbc4c7966 bnxt_en: Fix inconsistent BNXT_FLAG_AGG_RINGS logic.
   09af6c90819d ARC: Improve cmpxchg syscall implementation
   e653e79ace50 netfilter: nf_conntrack: Fix possible possible crash on module loading.
   a76e62b50dc0 netfilter: nft_compat: explicitly reject ERROR and standard target
   afd13311ee01 drm/armada: fix irq handling
   3d211fefdd52 drm/armada: fix colorkey mode property
   f2cbde943d97 drm/tegra: Fix comparison operator for buffer size
   d3f205d2d3cd gpu: host1x: Check whether size of unpin isn't 0
   1b57c5876c08 ieee802154: fakelb: switch from BUG_ON() to WARN_ON() on problem
   c1f84e47ec26 ieee802154: at86rf230: use __func__ macro for debug messages
   68e70bc28d53 ieee802154: at86rf230: switch from BUG_ON() to WARN_ON() on problem
   1b8f1ab088ba nvmem: Don't let a NULL cell_id for nvmem_cell_get() crash us
   de9f2452b1ad net/sched: act_tunnel_key: fix NULL dereference when 'goto chain' is used
   431f0995a5e8 ARM: pxa: irq: fix handling of ICMR registers in suspend/resume
   924d13694a13 ravb: fix invalid context bug while changing link options by ethtool
   1465aba3428d ravb: fix invalid context bug while calling auto-negotiation by ethtool
   7947dc71b9de sh_eth: fix invalid context bug while changing link options by ethtool
   533b9559ff83 sh_eth: fix invalid context bug while calling auto-negotiation by ethtool
   5860ae76e018 net: qrtr: Broadcast messages only from control port
   8e39e96f23d8 ipv6: make ipv6_renew_options() interrupt/kernel safe
   365279b70bf3 netfilter: x_tables: set module owner for icmp(6) matches
   2d0da2188643 ieee802154: 6lowpan: set IFLA_LINK
   f599525df7f1 samples/bpf: Check the error of write() and read()
   3bbb0484a731 samples/bpf: Check the result of system()
   2b533daef882 samples/bpf: add missing <linux/if_vlan.h>
   bf030b2faacb drm/bridge/sii8620: Fix display of packed pixel modes
   5996929435a8 smsc75xx: Add workaround for gigabit link up hardware errata.
   6e7084e2c3f9 kasan: fix shadow_size calculation error in kasan_module_alloc
   017fe62bb794 tracing: Use __printf markup to silence compiler
   56f059c87bc6 bpf: hash map: decrement counter on error
   fa97c9162779 ARM: imx_v4_v5_defconfig: Select ULPI support
   2059e527a659 ARM: imx_v6_v7_defconfig: Select ULPI support
   2aebd462a5fd HID: wacom: Correct touch maximum XY of 2nd-gen Intuos
   979c7c0dd75d x86/mm/32: Initialize the CR4 shadow before __flush_tlb_all()
   bf6c97326381 drm/amdgpu: fix swapped emit_ib_size in vce3
   f3ef33ee85c1 ipvlan: call dev_change_flags when ipvlan mode is reset
   0bcba95686be objtool: Support GCC 8 '-fnoreorder-functions'
   e793dc3d9766 m68k: fix "bad page state" oops on ColdFire boot
   83141913ca6b openrisc: entry: Fix delay slot exception detection
   c845344aa2e2 acpi/nfit: fix cmd_rc for acpi_nfit_ctl to always return a value
   f06fae164194 dpaa_eth: DPAA SGT needs to be 256B
   fba7c43d9368 fsl/fman: fix parser reporting bad checksum on short frames
   3baa3f9221e2 bnx2x: Fix receiving tx-timeout in error or recovery state.
   441712f28d69 PCI: faraday: Add missing of_node_put()
   7851cea48abc PCI: xilinx-nwl: Add missing of_node_put()
   dfcee0c7d9cb PCI: xilinx: Add missing of_node_put()
   a21b37053edc bpf, s390: fix potential memleak when later bpf_jit_prog fails
   a567493430be drbd: Fix drbd_request_prepare() discard handling
   8a9e8b683a7c drm/exynos: decon5433: Fix WINCONx reset value
   4091040d025b drm/exynos: decon5433: Fix per-plane global alpha for XRGB modes
   49316955f501 drm/exynos: gsc: Fix support for NV16/61, YUV420/YVU420 and YUV422 modes
   d4857eb755d7 nl80211: check nla_parse_nested() return values
   334c9cd8ba8d nl80211: relax ht operation checks for mesh
   0aa88fda693a dev-dax: check_vma: ratelimit dev_info-s
   601c226ea662 md/raid10: fix that replacement cannot complete recovery after reassemble
   94cac10c50c1 ath10k: update the phymode along with bandwidth change request
   bb2b7243e3f7 dmaengine: k3dma: Off by one in k3_of_dma_simple_xlate()
   4cea08638e9a dmaengine: pl330: report BURST residue granularity
   4c68433396e1 ARM64: dts: meson-gxl: fix Mali GPU compatible string
   58b22343150b ARM: dts: da850: Fix interrups property for gpio
   9f8da50b0232 selftests/x86/sigreturn: Do minor cleanups
   90c45a36250b selftests/x86/sigreturn/64: Fix spurious failures on AMD CPUs
   778bce908b84 nfp: cast sizeof() to int when comparing with error code
   a5b6bb86cc12 net/mlx5: E-Switch, Disallow vlan/spoofcheck setup if not being esw manager
   77c967872e8e ceph: fix dentry leak in splice_dentry()
   4c3b0ae79f07 netfilter: nf_log: fix uninit read in nf_log_proc_dostring
   1ea053d1cc8b ARM: davinci: board-da850-evm: fix WP pin polarity for MMC/SD
   0f868ad81fac perf bench: Fix numa report output code
   28dbfc731fec perf tools: Fix a clang 7.0 compilation error
   b4d84dcee9ef perf report powerpc: Fix crash if callchain is empty
   f33194bca6c3 perf test session topology: Fix test on s390
   6367516474c8 perf record: Support s390 random socket_id assignment
   2f9e98dbccf7 kconfig: fix line numbers for if-entries in menu tree
   5a64e0870cc1 typec: tcpm: Fix a msecs vs jiffies bug
   d341ce9a63dc NFC: pn533: Fix wrong GFP flag usage
   8a7ac5ee6856 usb: xhci: increase CRS timeout value
   13a049bebb76 usb: xhci: remove the code build warning
   b171162cbd94 ALSA: seq: Fix UBSAN warning at SNDRV_SEQ_IOCTL_QUERY_NEXT_CLIENT ioctl
   36bc1e1e69be ARM: dts: am437x: make edt-ft5x06 a wakeup source
   fc3b4e774cec brcmfmac: stop watchdog before detach and free everything
   dc68381f4919 iio: pressure: bmp280: fix relative humidity unit
   9265a4509509 cxgb4: when disabling dcb set txq dcb priority to 0
   04954b2dca34 batman-adv: Fix multicast TT issues with bogus ROAM flags
   44fed77fc7e4 batman-adv: Avoid storing non-TT-sync flags on singular entries too
   d50e1f18eace batman-adv: Fix bat_v best gw refcnt after netlink dump
   cc210a039ed1 batman-adv: Fix bat_ogm_iv best gw refcnt after netlink dump
   7634aad31a73 arm64: dts: msm8916: fix Coresight ETF graph connections
   4545cfb006b7 Smack: Mark inode instant in smack_task_to_inode
   f8e7a1bd752a ipv6: mcast: fix unsolicited report interval after receiving querys
   b580cead624b x86/microcode/intel: Fix memleak in save_microcode_patch()
   99654c9ffcea mtd: dataflash: Use ULL suffix for 64-bit constants
   a17ea7fb07ac selftests: bpf: notification about privilege required to run test_kmod.sh testing script
   c55300fcac1c locking/lockdep: Do not record IRQ state within lockdep code
   097a82cb1a71 drm/bridge/sii8620: fix display of packed pixel modes in MHL2
   7a21294b84fa KVM: arm/arm64: Drop resource size check for GICV window
   8fb20507bca0 sctp: fix erroneous inc of snmp SctpFragUsrMsgs
   363b8de31ac9 net: davinci_emac: match the mdio device against its compatible if possible
   9b0b625841d8 nbd: Add the nbd NBD_DISCONNECT_ON_CLOSE config flag.
   fbeb2ee3ecca ARC: Enable machine_desc->init_per_cpu for !CONFIG_SMP
   6d2b87505f7a block: sed-opal: Fix a couple off by one bugs
   955887c1fe90 nvmet: reset keep alive timer in controller enable
   62e4c9049e86 net: stmmac: socfpga: add additional ocp reset line for Stratix10
   e0eaae387284 net: propagate dev_get_valid_name return code
   7c828ea375a1 net: hamradio: use eth_broadcast_addr
   fb24c6df0f8e enic: initialize enic->rfs_h.lock in enic_probe
   9418ea8cf216 qed: Do not advertise DCBX_LLD_MANAGED capability.
   3b29b09a53ab qed: Add sanity check for SIMD fastpath handler.
   26c6ffff8eec qed: Fix possible memory leak in Rx error path handling.
   d22240dd6ab3 arm64: make secondary_start_kernel() notrace
   a929f067a88f arm64: dma-mapping: clear buffers allocated with FORCE_CONTIGUOUS flag
   2e62d135dd53 xen/scsiback: add error handling for xenbus_printf
   91e1bb748bcc scsi: xen-scsifront: add error handling for xenbus_printf
   586ae5694e37 pNFS: Always free the session slot on error in nfs4_layoutget_handle_exception
   395c67c1c02d xen: add error handling for xenbus_printf
   72bc7a2f77ba dwc2: gadget: Fix ISOC IN DDMA PID bitfield value calculation
   6958ade76b36 usb: gadget: dwc2: fix memory leak in gadget_init()
   66cae9b5a1d9 usb: gadget: composite: fix delayed_status race condition when set_interface
   a54f59199a81 usb: dwc2: fix isoc split in transfer with no data
   6a38c8a49a9f usb: dwc2: alloc dma aligned buffer for isoc split in
   7ccd2c1be366 libahci: Fix possible Spectre-v1 pmp indexing in ahci_led_store()
   ed4afe79ba5a IB/rxe: Fix missing completion for mem_reg work requests
   6bcd5cdf3a36 drm/arm/malidp: Preserve LAYER_FORMAT contents when setting format
   0a43cd3ea76a drm: mali-dp: Enable Global SE interrupts mask for DP500
   997a6b6b3017 drivers/perf: xgene_pmu: Fix IOB SLOW PMU parser error
   fec2c747ae39 arm64: dts: Stingray: Fix I2C controller interrupt type
   22dc4f2b8b46 arm64: dts: ns2: Fix PCIe controller interrupt type
   db0b1a4b0772 arm64: dts: ns2: Fix I2C controller interrupt type
   69347a9150c9 arm64: dts: specify 1.8V EMMC capabilities for bcm958742t
   31b16a0302be arm64: dts: specify 1.8V EMMC capabilities for bcm958742k
   eab85e8bd486 ARM: dts: Cygnus: Fix PCIe controller interrupt type
   6542fcfbd4c5 ARM: dts: Cygnus: Fix I2C controller interrupt type
   2d4ac6f1837b ARM: dts: BCM5301x: Fix i2c controller interrupt type
   d8ff67605d54 ARM: dts: NSP: Fix PCIe controllers interrupt types
   7ab23e15c7d2 ARM: dts: NSP: Fix i2c controller interrupt type
   0104d49dc06f selftests: sync: add config fragment for testing sync framework
   a626c95346e1 selftests: vm: return Kselftest Skip code for skipped tests
   3a9907ebf83b selftests: zram: return Kselftest Skip code for skipped tests
   41325fa657b9 selftests: user: return Kselftest Skip code for skipped tests
   d5f9d1d350bc selftests: sysctl: return Kselftest Skip code for skipped tests
   bc5e458a9ee2 selftests: static_keys: return Kselftest Skip code for skipped tests
   81810e45384b selftests: pstore: return Kselftest Skip code for skipped tests
   175b38277b6d netfilter: nf_ct_helper: Fix possible panic after nf_conntrack_helper_unregister
   69c471908ddd netfilter: ipv6: nf_defrag: reduce struct net memory waste
   dcf6f268deee ACPI / EC: Use ec_no_wakeup on Thinkpad X1 Carbon 6th
   987a7dab8308 usb: dwc3: of-simple: fix use-after-free on remove
   7b2dc4515f03 usb: dwc2: gadget: Fix issue in dwc2_gadget_start_isoc()
   3572fd055e69 usb: gadget: ffs: Fix BUG when userland exits with submitted AIO transfers
   48168383379f usb: dwc3: pci: add support for Intel IceLake
   bf3bb8b549da soc: imx: gpcv2: correct PGC offset
   4dff89e722d5 hwmon: (nct6775) Fix loop limit
   c0f29f9d8aa8 ARC: Explicitly add -mmedium-calls to CFLAGS
   c170373c7230 drm/bridge/sii8620: fix potential buffer overflow
   69004038f01c drm/bridge/sii8620: fix loops in EDID fetch logic
   da327a4b9d09 IB/mlx4: Fix an error handling path in 'mlx4_ib_rereg_user_mr()'
   048f62f3725d Input: synaptics-rmi4 - fix axis-swap behavior
   d4108ed2a57f perf tools: Fix error index for pmu event parser
   7dcffd98360a vfio: ccw: fix error return in vfio_ccw_sch_event
   67c0f84827e1 arm: dts: armada: Fix "#cooling-cells" property's name
   4aec7c283904 pty: fix O_CLOEXEC for TIOCGPTPEER
   96de65df1936 EDAC: Add missing MEM_LRDDR4 entry in edac_mem_types[]
   b518e870f1f6 drm/i915/kvmgt: Fix potential Spectre v1
   4bc32484df6a ext4: fix spectre gadget in ext4_mb_regular_allocator()
   c5f7d3c4daf1 Linux 4.14.66
   178742867e4f cls_matchall: fix tcf_unbind_filter missing
   2b2cdec98e03 isdn: Disable IIOCDBGVAR
   f276e2efb661 Bluetooth: avoid killing an already killed socket
   31e4f8ba0173 misc: sram: fix resource leaks in probe error path
   3620bc1ceb14 serial: 8250_dw: Add ACPI support for uart on Broadcom SoC
   f6790793d80d serial: 8250_dw: always set baud rate in dw8250_set_termios
   da93a03fdd0a serial: 8250_exar: Read INT0 from slave device, too
   71cc9159212b tty: serial: 8250: Revert NXP SC16C2552 workaround
   21be9327e00c ACPI / PM: save NVS memory for ASUS 1025C laptop
   60d93a4b6d32 USB: option: add support for DW5821e
   925bce3815d8 USB: serial: pl2303: add a new device id for ATEN
   d17b9ab7d954 USB: serial: sierra: fix potential deadlock at close
   33a3444a096a ALSA: vxpocket: Fix invalid endian conversions
   79018e171ae5 ALSA: memalloc: Don't exceed over the requested size
   fda20e719212 ALSA: hda: Correct Asrock B85M-ITX power_save blacklist entry
   6b4af40779cc ALSA: cs5535audio: Fix invalid endian conversion
   f4253b46437a ALSA: virmidi: Fix too long output trigger loop
   f13a825ae2c6 ALSA: vx222: Fix invalid endian conversions
   f7de68a8d6cd ALSA: hda - Turn CX8200 into D3 as well upon reboot
   7f4c155214ae ALSA: hda - Sleep for 10ms after entering D3 on Conexant codecs
   50670d158cfa net: aquantia: Fix IFF_ALLMULTI flag functionality
   b3fb93987232 ip6_tunnel: use the right value for ipv4 min mtu check in ip6_tnl_xmit
   59f9f2c76fe1 vhost: reset metadata cache when initializing new IOTLB
   e125b1cc673a net_sched: Fix missing res info when create new tc_index filter
   36e55fde4ccf vsock: split dwork to avoid reinitializations
   4396f5024b9e net_sched: fix NULL pointer dereference when delete tcindex filter
   222e05e0a29a llc: use refcount_inc_not_zero() for llc_sap_find()
   46be8e4471d7 l2tp: use sk_dst_check() to avoid race on sk->sk_dst_cache
   64d9b03d082a dccp: fix undefined behavior with 'cwnd' shift in ccid2_cwnd_restart()
   4cea13b66144 Linux 4.14.65
   3f2e4f5dd834 x86/speculation/l1tf: Exempt zeroed PTEs from inversion
   7251bd56d925 Linux 4.14.64
   21ed56ef827e x86/mm: Add TLB purge to free pmd/pte page interfaces
   a34806961be4 ioremap: Update pgtable free interfaces with addr
   6e2c702e797c Bluetooth: hidp: buffer overflow in hidp_process_report
   9efed51870be ASoC: Intel: cht_bsw_max98090_ti: Fix jack initialization
   643a9d6d4ff7 ASoC: msm8916-wcd-digital: fix RX2 MIX1 and RX3 MIX1
   1a2d99218d87 block, bfq: fix wrong init of saved start time for weight raising
   3f745fe61ac6 clk: sunxi-ng: Fix missing CLK_SET_RATE_PARENT in ccu-sun4i-a10.c
   c13fddcb9822 ASoC: rsnd: fix ADG flags
   de59521d508a fw_cfg: fix driver remove
   13f12749af15 sched/debug: Fix task state recording/printout
   e5f4bae2e3c8 ACPI / APEI: Remove ghes_ioremap_area
   7e179bffb681 crypto: skcipher - fix crash flushing dcache in error path
   0f2981ee03ff crypto: skcipher - fix aligning block size in skcipher_copy_iv()
   68432fd1665b crypto: ablkcipher - fix crash flushing dcache in error path
   2cde72d94f0a crypto: blkcipher - fix crash flushing dcache in error path
   e7aefb13e61c crypto: vmac - separate tfm and request context
   ef70d14553ed crypto: vmac - require a block cipher with 128-bit block size
   e73828389b1c crypto: x86/sha256-mb - fix digest copy in sha256_mb_mgr_get_comp_job_avx2()
   50123ab8c47d kbuild: verify that $DEPMOD is installed
   3d0170b8af8d x86/mm: Disable ioremap free page handling on x86-PAE
   7985292f97b4 x86: i8259: Add missing include file
   5f7a645432d6 x86/l1tf: Fix build error seen if CONFIG_KVM_INTEL is disabled

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index 24e3f0703682..d5b285e7b79d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "517929399b9fd48c9e86fe6724097532ff779f9b"
-SRCREV_meta ?= "8a3be7d783a39b56796e1d5197cb9f757e38f22f"
+SRCREV_machine ?= "af1b926c9160b0dbf2bbe41b166a8a7b07191fd2"
+SRCREV_meta ?= "c43c9e19a22367b48c0f62764c8555643d2a6844"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.62"
+LINUX_VERSION ?= "4.14.67"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index 05ce90c2e86e..c9e6e412be31 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -4,7 +4,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.14.62"
+LINUX_VERSION ?= "4.14.67"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
@@ -12,8 +12,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2b98ddc7546b7c880361c9e13e1c11393fb8b0e1"
-SRCREV_meta ?= "8a3be7d783a39b56796e1d5197cb9f757e38f22f"
+SRCREV_machine ?= "74ecbeb03ebfc2b9a73a6554924b043b903295f5"
+SRCREV_meta ?= "c43c9e19a22367b48c0f62764c8555643d2a6844"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index 02c42c400869..91a2845a727d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "v4.14/standard/base"
 KBRANCH_qemux86-64 ?= "v4.14/standard/base"
 KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "fcfdd4f0304cfddb3703ddbb38099a424102d5ed"
-SRCREV_machine_qemuarm64 ?= "ff1b393ffe88c42d06185ae3ffbbc76856516631"
-SRCREV_machine_qemumips ?= "f7a7823cf33e772e9fd73239e57bac2b6a57cd87"
-SRCREV_machine_qemuppc ?= "97d3f96ea2ed5efda4663fd0f0c4e0c21e43c863"
-SRCREV_machine_qemux86 ?= "1839f1b10cf9895ac0e31631eaa9a5ed5c63ede0"
-SRCREV_machine_qemux86-64 ?= "1839f1b10cf9895ac0e31631eaa9a5ed5c63ede0"
-SRCREV_machine_qemumips64 ?= "db539ae62da0b5fe7d065830c2709abc01a5591d"
-SRCREV_machine ?= "1839f1b10cf9895ac0e31631eaa9a5ed5c63ede0"
-SRCREV_meta ?= "8a3be7d783a39b56796e1d5197cb9f757e38f22f"
+SRCREV_machine_qemuarm ?= "93d58c0c59d1dcdba6ff76ef093de7de339414a8"
+SRCREV_machine_qemuarm64 ?= "888066bc1b9cc5f596da8237cbf74417106e8f22"
+SRCREV_machine_qemumips ?= "a9d862bb92707f39c0cf2b2cc6f1645e88a99eb9"
+SRCREV_machine_qemuppc ?= "d8ced31602b65fb92487865502da595bd113a329"
+SRCREV_machine_qemux86 ?= "084af9624d268ddf4fd65b2f9e8e50ca2f22e62b"
+SRCREV_machine_qemux86-64 ?= "084af9624d268ddf4fd65b2f9e8e50ca2f22e62b"
+SRCREV_machine_qemumips64 ?= "44e1719a8f4fe10e88c13b9ec6c1fa1d041efaed"
+SRCREV_machine ?= "084af9624d268ddf4fd65b2f9e8e50ca2f22e62b"
+SRCREV_meta ?= "c43c9e19a22367b48c0f62764c8555643d2a6844"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.62"
+LINUX_VERSION ?= "4.14.67"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.5.0


