Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 96700784F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 15:03:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2RF3UbQ018342
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Mar 2018 08:03:31 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 27 Mar 2018 08:03:28 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 27 Mar 2018 11:03:19 -0400
Message-ID: <87709afa965dcdf8e5d1bad2ec0b874f8fc6131b.1522162765.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1522162765.git.bruce.ashfield@windriver.com>
References: <cover.1522162765.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] linux-yocto/4.15: update to v4.15.13
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
X-List-Received-Date: Tue, 27 Mar 2018 15:03:30 -0000
Content-Type: text/plain

Integrating the korg stable updates comprising the following commits:

eb666a896f99 Linux 4.15.13
7717224bbcbb RDMA/ucma: Don't allow join attempts for unsupported AF family
93462def6848 RDMA/ucma: Fix access to non-initialized CM_ID object
7ea20f4df7fc clk: migrate the count of orphaned clocks at init
f73d0b37846a RDMA/core: Do not use invalid destination in determining port reuse
f8ea417273f2 serial: 8250_pci: Don't fail on multiport card class
719f7ae076e0 RDMA/vmw_pvrdma: Fix usage of user response structures in ABI file
bd6281eb9113 IB/mlx5: Fix out-of-bounds read in create_raw_packet_qp_rq
23896b7c08f5 IB/mlx5: Fix integer overflows in mlx5_ib_create_srq
f9496d45cd87 dmaengine: ti-dma-crossbar: Fix event mapping for TPCC_EVT_MUX_60_63
e36bb4076f37 hwrng: core - Clean up RNG list when last hwrng is unregistered
233f5fee86c3 crypto: artpec6 - set correct iv size for gcm(aes)
dbb1b3477bc0 clk: si5351: Rename internal plls to avoid name collisions
39888ce9ff0a clk: axi-clkgen: Correctly handle nocount bit in recalc_rate()
3a99b645e127 clk: Don't touch hardware when reparenting during registration
17e583cba3b6 clk: at91: pmc: Wait for clocks when resuming
a6d04b465659 nfsd4: permit layoutget of executable-only files
140cb7a3de12 ARM: dts: aspeed-evb: Add unit name to memory node
114355528fcd RDMA/ocrdma: Fix permissions for OCRDMA_RESET_STATS
2b7453a76bac scsi: lpfc: Fix issues connecting with nvme initiator
bfcb0d5e7dc7 scsi: lpfc: Fix SCSI LUN discovery when SCSI and NVME enabled
cef86432a08e soc: qcom: smsm: fix child-node lookup
70559f800f62 ip_gre: fix potential memory leak in erspan_rcv
09d5f2bb8fc7 ip_gre: fix error path when erspan_rcv failed
813b2dad2cb5 ip6_vti: adjust vti mtu according to mtu of lower device
7a77ba6b6900 iommu/vt-d: clean up pr_irq if request_threaded_irq fails
424d4a6a5ebd pinctrl: rockchip: enable clock when reading pin direction register
35e54f441f0e pinctrl: Really force states during suspend/resume
f64b3c51d512 clk: use round rate to bail out early in set_rate
b96b31ce0517 dt-bindings: display: panel: Fix compatible string for Toshiba LT089AC29000
48228438f263 clk: check ops pointer on clock register
887fa839ee74 media: davinci: fix a debug printk
10843b30c385 PCI: rcar: Handle rcar_pcie_parse_request_of_pci_ranges() failures
61cbbb4f20d1 PCI: endpoint: Fix find_first_zero_bit() usage
d306bb6c7952 PCI: designware-ep: Fix ->get_msi() to check MSI_EN bit
29a84f9707b1 coresight: Fix disabling of CoreSight TPIU
71b009c13528 pty: cancel pty slave port buf's work in tty_release
e7b4a5ba3259 drm/omap: DMM: Check for DMM readiness after successful transaction commit
eafa4cd4d112 mmc: sdhci-xenon: wait 5ms after set 1.8V signal enable
a9b4a01508a9 omapdrm: panel: fix compatible vendor string for td028ttec1
00aa57830cb5 vgacon: Set VGA struct resource types
18e595d70f17 PCI/ASPM: Calculate LTR_L1.2_THRESHOLD from device characteristics
3c4ffeae6510 bpf/cgroup: fix a verification error for a CGROUP_DEVICE type prog
3a23663bda89 iser-target: avoid reinitializing rdma contexts for isert commands
20dbecabd107 IB/umem: Fix use of npages/nmap fields
4d529564d326 RDMA/cma: Use correct size when writing netlink stats
f333c18b5434 IB/ipoib: Avoid memory leak if the SA returns a different DGID
80ac31ac404a rtc: ac100: Fix multiple race conditions
1835bd639fa7 media: s5p-mfc: Fix lock contention - request_firmware() once
e9f486d7a859 sfp: fix non-detection of PHY
b03b5f94dcf4 sfp: fix EEPROM reading in the case of non-SFF8472 SFPs
1d40cdd339cb net: phy: meson-gxl: check phy_write return value
f9e0be9def10 /dev/mem: Add bounce buffer for copy-out
176fb28073c9 mmc: block: fix logical error to avoid memory leak
ca6b159fd207 mmc: avoid removing non-removable hosts during suspend
75157d4e4d15 drm/tilcdc: ensure nonatomic iowrite64 is not used
73f483aa65d6 dmaengine: zynqmp_dma: Fix race condition in the probe
c78feb5f451c platform/chrome: Use proper protocol transfer function
449c24e264d9 watchdog: Fix kref imbalance seen if handle_boot_enabled=0
3122d2f18ed9 watchdog: Fix potential kref imbalance when opening watchdog
68c1248b9a2d cros_ec: fix nul-termination for firmware build info
0a607a064565 serial: 8250_dw: Disable clock on error
42c35b150365 tty: goldfish: Enable 'earlycon' only if built-in
ccf304a6607a qmi_wwan: set FLAG_SEND_ZLP to avoid network initiated disconnect
7bc49ffb1067 media: [RESEND] media: dvb-frontends: Add delay to Si2168 restart
784d1114823c ath10k: handling qos at STA side based on AP WMM enable/disable
db80bd4d5f62 media: bt8xx: Fix err 'bt878_probe()'
06647fbb496e rtlwifi: always initialize variables given to RT_TRACE()
3104c12838b2 rtlwifi: rtl_pci: Fix the bug when inactiveps is enabled.
b5817721ecea libbpf: prefer global symbols as bpf program name source
340f5832b6a6 spi: sh-msiof: Avoid writing to registers from spi_master.setup()
7f5739939eb3 tcp: allow TLP in ECN CWR
df365ce541c4 hv_netvsc: Fix the TX/RX buffer default sizes
8fbec85ecd00 hv_netvsc: Fix the receive buffer size limit
3669331be6fd RDMA/iwpm: Fix uninitialized error code in iwpm_send_mapinfo()
be176a5c98e7 IB/ipoib: Warn when one port fails to initialize
09a00a4b1e8b drm/msm: fix leak in failed get_pages
aa5397213cc1 media: c8sectpfe: fix potential NULL pointer dereference in c8sectpfe_timer_interrupt
3cb311196e5f cpufreq: longhaul: Revert transition_delay_us to 200 ms
e16154e6868b Bluetooth: btqcomsmd: Fix skb double free corruption
b646aada058d Bluetooth: hci_qca: Avoid setup failure on missing rampatch
5ec3e522c556 drm/amdgpu: use polling mem to set SDMA3 wptr for VF
bcaf449b5809 staging: android: ashmem: Fix possible deadlock in ashmem_ioctl
1d60b7802104 scsi: megaraid_sas: Do not use 32-bit atomic request descriptor for Ventura controllers
cfc8d40be91d Linux 4.15.12
c3306c7f8f97 phy: phy-brcm-usb-init: Power down USB 3.0 PHY when XHCI disabled
5fb7cf9b1ca0 phy: phy-brcm-usb-init: DRD mode can cause crash on startup
048fd682b2b8 phy: phy-brcm-usb-init: Some Low Speed keyboards fail on 7271
43bcdded80fd phy: phy-brcm-usb: Fix two DT properties to match bindings doc
2007a7097ce1 usb: gadget: udc: renesas_usb3: fix oops in renesas_usb3_remove()
95918af96116 usb: dwc3: of-simple: fix oops by unbalanced clk disable call
b9fac2b8326d usb: dwc3: core: Power-off core/PHYs on system_suspend in host mode
cad33fd60fde usb: dwc3: Fix GDBGFIFOSPACE_TYPE values
41d3763d9942 USB: gadget: udc: Add missing platform_device_put() on error in bdc_pci_probe()
f21951e27402 dt-bindings: usb: fix the STM32F7 DWC2 OTG HS core binding
7e9122d4e1af usb: dwc2: fix STM32F7 USB OTG HS compatible
bb5159f40c22 scsi: qla2xxx: Fix crashes in qla2x00_probe_one on probe failure
0bbf2aa0f9e2 scsi: qla2xxx: Fix logo flag for qlt_free_session_done()
84f1972c3c5d scsi: qla2xxx: Fix NULL pointer access for fcport structure
1675cbb32906 scsi: qla2xxx: Fix smatch warning in qla25xx_delete_{rsp|req}_que
71103f2b9fd2 btrfs: Fix memory barriers usage with device stats counters
005155e22a0b btrfs: remove spurious WARN_ON(ref->count < 0) in find_parent_nodes
7a42df9f0394 btrfs: Fix use-after-free when cleaning up fs_devs with a single stale device
ce1ac9c8ebe0 btrfs: alloc_chunk: fix DUP stripe size handling
d0505842848e btrfs: add missing initialization in btrfs_check_shared
fef1dad2a985 btrfs: Fix NULL pointer exception in find_bio_stripe
428da4f87e1d xfs: preserve i_rdev when recycling a reclaimable inode
1c7453ec86ce nvme: fix subsystem multiple controllers support check
69f0542a7bef irqchip/gic-v3-its: Ensure nr_ites >= nr_lpis
fdb574d9a7e0 RDMAVT: Fix synchronization around percpu_ref
0b68e9ccaf0b fs/aio: Use RCU accessors for kioctx_table->table[]
b5b8b8be7808 fs/aio: Add explicit RCU grace period when freeing kioctx
2fa76b885ece lock_parent() needs to recheck if dentry got __dentry_kill'ed under it
9c7b569aec95 KVM: arm/arm64: vgic: Don't populate multiple LRs with the same vintid
3bf14279499c kvm: arm/arm64: vgic-v3: Tighten synchronization for guests using v2 on v3
885310132995 KVM: arm/arm64: Reset mapped IRQs on VM reset
1368ba16c8e6 KVM: arm/arm64: Reduce verbosity of KVM init log
ad3edd3c4047 fs: Teach path_connected to handle nfs filesystems with multiple roots.
ab2660381a80 drm/amdgpu/dce: Don't turn off DP sink when disconnected
fa2192eea5c0 drm/radeon: fix prime teardown order
d747af9a681f drm/amdgpu: fix prime teardown order
69b9106f97ce drm/nouveau/mmu: ALIGN_DOWN correct variable
ba753a894a53 drm/nouveau/bl: Fix oops on driver unbind
18d8a34ac890 ALSA: seq: Clear client entry before deleting else at closing
1d63f1fc63f4 ALSA: seq: Fix possible UAF in snd_seq_check_queue()
cdcecd3415a1 ALSA: hda - Revert power_save option default value
eb0e7a1f5687 ALSA: pcm: Fix UAF in snd_pcm_oss_get_formats()
bf724633cfda parisc: Handle case where flush_cache_range is called with no context
d7d57946c5f5 x86/mm: Fix vmalloc_fault to use pXd_large
4abf8650d693 KVM: x86: Fix device passthrough when SME is active
da0812b49895 x86/speculation: Remove Skylake C2 from Speculation Control microcode blacklist
8449802675b3 x86/speculation, objtool: Annotate indirect calls/jumps for objtool on 32-bit kernels
7a73ba591708 x86/vm86/32: Fix POPF emulation
cfb3f12e5a01 selftests/x86/entry_from_vm86: Add test cases for POPF
673d00d2cc16 selftests/x86/entry_from_vm86: Exit with 1 if we fail
733307cf6ba6 x86/cpufeatures: Add Intel PCONFIG cpufeature
a21fcb396718 x86/cpufeatures: Add Intel Total Memory Encryption cpufeature
51d480eafd15 Linux 4.15.11
ddfd9b3a41ae drm/i915/glk: Disable Guc and HuC on GLK
5ae4953dc072 dmaengine: qcom_hidma: check pending interrupts
7aeb9a55a385 IB/mlx5: revisit -Wmaybe-uninitialized warning
41ba470820b3 ima: relax requiring a file signature for new files with zero length
45ecf3400006 locking/locktorture: Fix num reader/writer corner cases
a95958907b4a rcutorture/configinit: Fix build directory error message
0ff7ed13f2a7 ipvlan: add L2 check for packets arriving via virtual devices
f00f5f5598cc Fix misannotated out-of-line _copy_to_user()
b19715a17b62 mmc: mmc_test: Ensure command queue is disabled for testing
be5494a8f85b ASoC: nuc900: Fix a loop timeout test
03f6344f6981 crypto: caam/qi - use correct print specifier for size_t
64d5680d3b4d mac80211: remove BUG() when interface type is invalid
0fca555446a1 mac80211_hwsim: enforce PS_MANUAL_POLL to be set after PS_ENABLED
d7b6747b2198 agp/intel: Flush all chipset writes after updating the GGTT
5123e87faf12 arm64: dts: renesas: salvator-common: Add EthernetAVB PHY reset
5f426784d0b4 powerpc/64: Don't trace irqs-off at interrupt return to soft-disabled context
3d1d39090fda powerpc/modules: Don't try to restore r2 after a sibling call
77592d6abc1b drm/amdkfd: Fix memory leaks in kfd topology
26ef25f35b9b veth: set peer GSO values
e8abc1292671 net: sched: drop qdisc_reset from dev_graft_qdisc
ae8cafc2813e virtio_net: Disable interrupts if napi_complete_done rescheduled napi
33964687ffd1 media: davinci: vpif_capture: add NULL check on devm_kzalloc return value
1ed91b10c4e4 media: cpia2: Fix a couple off by one bugs
b85bea6de405 dm raid: fix raid set size revalidation
3e8cbf84d434 media: vsp1: Prevent suspending and resuming DRM pipelines
74b1383a2a32 staging: fsl-dpaa2/eth: Fix access to FAS field
83810e8aa67a clk: renesas: r8a77970: Add LVDS clock
d641b64a0fcf scsi: dh: add new rdac devices
151c46ea1a6b scsi: devinfo: apply to HP XP the same flags as Hitachi VSP
a60c9f5bdf0a scsi: core: scsi_get_device_flags_keyed(): Always return device flags
d6549484c1bc bnxt_en: Don't print "Link speed -1 no longer supported" messages.
fd92108e8970 spi: sun6i: disable/unprepare clocks on remove
fedc177b4267 tools/usbip: fixes build with musl libc toolchain
1a1aa7f83d9f ath10k: fix invalid STS_CAP_OFFSET_MASK
2dc42ad1a816 mwifiex: cfg80211: do not change virtual interface during scan processing
eb0bd8399f30 clk: qcom: msm8916: fix mnd_width for codec_digcodec
736e6ed8e417 bnxt_en: Uninitialized variable in bnxt_tc_parse_actions()
196c8a893cc3 drm/amdgpu: fix amdgpu_sync_resv v2
d43f79d8bfa3 drm/amdgpu:fix virtual dce bug
84afaae95878 iwlwifi: mvm: avoid dumping assert log when device is stopped
7024c04ba773 perf annotate: Fix objdump comment parsing for Intel mov dissassembly
7090ac4bc551 perf annotate: Fix unnecessary memory allocation for s390x
4bc53614a08f pinctrl: sh-pfc: r8a7795-es1: Fix MOD_SEL1 bit[25:24] to 0x3 when using STP_ISEN_1_D
dc061955ca09 pinctrl: sh-pfc: r8a7791: Add can_clk function
4bccfe79cd4d drm/sun4i: Fix format mask in DE2 driver
e5e6a10251f8 pwm: stmpe: Fix wrong register offset for hwpwm=2 case
42957cf0a77d scsi: ses: don't ask for diagnostic pages repeatedly during probe
7d6f70a8758a scsi: lpfc: Fix crash during driver unload with running nvme traffic
9280348b2696 drm/amdgpu:fix random missing of FLR NOTIFY
eff913587989 KVM: X86: Restart the guest when insn_len is zero and SEV is enabled
a853301f77b5 cpufreq: Fix governor module removal race
b545efb25a3f ath10k: update tdls teardown state to target
4971e6535840 iio: health: max30102: Add power enable parameter to get_temp function
b0fdcac4f68d iio: adc: ina2xx: Shift bus voltage register to mask flag bits
056c35957ea2 drm/etnaviv: make THERMAL selectable
3079e5ffa141 power: supply: ab8500_charger: Bail out in case of error in 'ab8500_charger_init_hw_registers()'
4e074cd9323a power: supply: ab8500_charger: Fix an error handling path
fadaf4240360 power: supply: sbs-message: double left shift bug in sbsm_select()
8a7474805a53 bpf: fix stack state printing in verifier log
e99d334f6d7f leds: pm8058: Silence pointer to integer size warning
b116b9ca82d8 xfrm: Fix xfrm_replay_overflow_offload_esn
52e0006fb425 userns: Don't fail follow_automount based on s_user_ns
daf8ff677a34 mtd: nand: ifc: update bufnum mask for ver >= 2.0.0
c91a50176871 ARM: dts: omap3-n900: Fix the audio CODEC's reset pin
cc578825b46e ARM: dts: am335x-pepper: Fix the audio CODEC's reset pin
8215dde215a2 net: thunderx: Set max queue count taking XDP_TX into account
df2bc9f0c7d9 mtd: nand: fix interpretation of NAND_CMD_NONE in nand_command[_lp]()
71dc53969aa9 gpiolib: don't allow OPEN_DRAIN & OPEN_SOURCE flags simultaneously
3c1133294733 net: xfrm: allow clearing socket xfrm policies.
8aa7072cc386 perf report: Fix -D output for user metadata events
ccf7f3f1bfe2 rtc: brcmstb-waketimer: fix error handling in brcmstb_waketmr_probe()
82e2dc52e103 net: ieee802154: adf7242: Fix bug if defined DEBUG
d0426ddc5a59 drm/vblank: Fix vblank timestamp debugs
6e3b18f9ef52 test_firmware: fix setting old custom fw path back on exit
2067278ed4a1 crypto: cavium - fix memory leak on info
b58c90c3a2c1 crypto: keywrap - Add missing ULL suffixes for 64-bit constants
f8ed29310ff5 crypto: ecc - Fix NULL pointer deref. on no default_rng
4fc44467b7d4 crypto: chelsio - Fix an error code in chcr_hash_dma_map()
fc82675c04f8 sched: Stop resched_cpu() from sending IPIs to offline CPUs
55a6c1e2842a sched: Stop switched_to_rt() from sending IPIs to offline CPUs
ccacabf0e911 dt-bindings: serial: Add common rs485 binding for RTS polarity
038f81410b9f USB: ledtrig-usbport: fix of-node leak
661d71fec957 typec: tcpm: fusb302: Resolve out of order messaging events
c702f9b72820 staging: rtl8822be: fix missing null check on dev_alloc_skb return
6fe526b2e82b drm/amdgpu: fix get_max_engine_clock_in_mhz
8c57c57a7d79 ARM: dts: exynos: Correct Trats2 panel reset line
941a8e4061b5 clk: meson: gxbb: fix wrong clock for SARADC/SANA
2037f15e1d02 ARM: dts: koelsch: Move cec_clock to root node
1320369874e0 iwlwifi: mvm: rs: don't override the rate history in the search cycle
bc7f19a1687d HID: elo: clear BTN_LEFT mapping
7b341f3287da KVM: PPC: Book3S HV: Fix typo in kvmppc_hv_get_dirty_log_radix()
6f97dd22c852 video/hdmi: Allow "empty" HDMI infoframes
e0749d1e1f10 dma-buf/fence: Fix lock inversion within dma-fence-array
df0204154557 drm/edid: set ELD connector type in drm_edid_to_eld()
c15aa9a93c05 KVM: PPC: Book3S HV: Avoid shifts by negative amounts
21764b41f1c8 HID: multitouch: Only look at non touch fields in first packet of a frame
6f6444502fa9 spi: imx: Fix failure path leak on GPIO request error correctly
d1cc4fe3e8b7 drm/panel: rpi-touchscreen: propagate errors in rpi_touchscreen_i2c_read()
ae53e57f5911 gfs2: Fixes to "Implement iomap for block_map" (2)
105cd2ef03be gfs2: Clean up {lookup,fillup}_metapath
7a4fe65843fd Revert "btrfs: use proper endianness accessors for super_copy"
3cd0aa9f35fe dm mpath: fix passing integrity data
701ba5478225 earlycon: add reg-offset to physical address before mapping
c3a2fe0fc8a0 serial: core: mark port as initialized in autoconfig
16415f03eb6e serial: 8250_pci: Add Brainboxes UC-260 4 port serial device
306c08c6d659 usb: dwc3: Fix lock-up on ID change during system suspend/resume
11e2d13d3f9e usb: gadget: f_fs: Fix use-after-free in ffs_fs_kill_sb()
b42aa204e111 usb: usbmon: Read text within supplied buffer size
5d4203a6d5a2 usb: quirks: add control message delay for 1b1c:1b20
1fc47d0380b5 usbip: vudc: fix null pointer dereference on udc->lock
b2029b7dbe6b USB: storage: Add JMicron bridge 152d:2567 to unusual_devs.h
aa05ee5fa75b scsi: sd_zbc: Fix potential memory leak
c9ff6a8a1e0f staging: android: ashmem: Fix lockdep issue during llseek
1c5bfd980303 staging: comedi: fix comedi_nsamples_left.
8e6c082909d5 uas: fix comparison for error code
2667d707c420 tty/serial: atmel: add new version check for usart
60003884f6c4 serial: sh-sci: prevent lockup on full TTY buffers
a0972dac1125 xhci: fix endpoint context tracer output
a0722d7b9d67 xhci: Fix front USB ports on ASUS PRIME B350M-A
73848b68f99b usb: host: xhci-rcar: add support for r8a77965
b7beb59aa066 ASoC: rt5651: Fix regcache sync errors on resume
aa6655a68f0a ASoC: wm_adsp: For TLV controls only register TLV get/set
9afc3ec1f2e7 ASoC: sgtl5000: Fix suspend/resume
6b57662274bd ASoC: sun4i-i2s: Fix RX slot number of SUN8I
699f7359e599 x86: Treat R_X86_64_PLT32 as R_X86_64_PC32
df57458873da Linux 4.15.10
2aaa158bc127 NFS: Fix unstable write completion
0fa7083df399 pNFS: Prevent the layout header refcount going to zero in pnfs_roc()
ff32fd5e2dce NFS: Fix an incorrect type in struct nfs_direct_req
085bac793f1c scsi: qla2xxx: Fix memory leak in dual/target mode
0e7a62c3cfb6 scsi: qla2xxx: Fix system crash in qlt_plogi_ack_unref
bf4ec02855d9 scsi: qla2xxx: Remove aborting ELS IOCB call issued as part of timeout.
33d13a80a374 scsi: qla2xxx: Defer processing of GS IOCB calls
b57851dc489f scsi: qla2xxx: Clear loop id after delete
ef5b3c623eec scsi: qla2xxx: Fix scan state field for fcport
f7b257f9e10a scsi: qla2xxx: Replace fcport alloc with qla2x00_alloc_fcport
3629d122f770 scsi: qla2xxx: Fix abort command deadlock due to spinlock
c6247675c8b2 scsi: qla2xxx: Fix PRLI state check
9a1e9130f25f scsi: qla2xxx: Fix Relogin being triggered too fast
41929d9b2363 scsi: qla2xxx: Relogin to target port on a cable swap
3ab51d1da782 scsi: qla2xxx: Fix NPIV host cleanup in target mode
6c609c375ca6 scsi: qla2xxx: Fix login state machine stuck at GPDB
1bb465e619eb scsi: qla2xxx: Serialize GPNID for multiple RSCN
99e33bd8bdfa scsi: qla2xxx: Retry switch command on time out
b40e693ce7b5 scsi: qla2xxx: Fix re-login for Nport Handle in use
e947c1c575aa scsi: qla2xxx: Skip IRQ affinity for Target QPairs
9685a797a564 scsi: qla2xxx: Move session delete to driver work queue
b340fe8a83f6 scsi: qla2xxx: Fix gpnid error processing
96a18fc96c22 scsi: qla2xxx: Fix system crash for Notify ack timeout handling
5858d59b8629 x86/xen: Calculate __max_logical_packages on PV domains
218ce9890104 tpm: only attempt to disable the LPC CLKRUN if is already enabled
9e49b027f787 tpm: remove unused variables
191f9cb91d12 tpm: delete the TPM_TIS_CLK_ENABLE flag
8fa99a629bd7 tpm: Keep CLKRUN enabled throughout the duration of transmit_cmd()
f84cbaff9004 tpm_tis: Move ilb_base_addr to tpm_tis_data
baf882cbcc43 netfilter: use skb_to_full_sk in ip6_route_me_harder
e8cd5a8ea2dd netfilter: ipv6: fix use-after-free Write in nf_nat_ipv6_manip_pkt
d0a52c094d57 netfilter: bridge: ebt_among: add missing match size checks
5c06b89df419 netfilter: ebtables: CONFIG_COMPAT: don't trust userland offsets
36dabaf091e7 netfilter: IDLETIMER: be syzkaller friendly
8ba14bacf620 netfilter: nat: cope with negative port range
4260816d4785 netfilter: x_tables: fix missing timer initialization in xt_LED
ea2699504d33 netfilter: xt_hashlimit: fix lock imbalance
cbd6bb0e28c9 netfilter: ipt_CLUSTERIP: fix a race condition of proc file creation
ec6b058c5431 netfilter: add back stackpointer size checks
831b5146892e watchdog: hpwdt: Remove legacy NMI sourcing.
52769861e99b watchdog: hpwdt: fix unused variable warning
af1537404670 watchdog: hpwdt: Check source of NMI
2ade2293099d watchdog: hpwdt: SMBIOS check
7e9c540258af x86/kprobes: Fix kernel crash when probing .entry_trampoline code
d9f1b1fd3728 objtool: Fix 32-bit build
58e0bb003523 objtool: Fix another switch table detection issue
d5f6877f0af8 objtool, retpolines: Integrate objtool with retpoline support more closely
871caad2a47b objtool: Add module specific retpoline rules
40693bd709b5 objtool: Add retpoline validation
e1861c9e9568 objtool: Use existing global variables for options
90dbf1101e65 x86/mm/sme, objtool: Annotate indirect call in sme_encrypt_execute()
8882e40f66ed x86/boot, objtool: Annotate indirect jump in secondary_startup_64()
2425b3ea0afa x86/paravirt, objtool: Annotate indirect calls
468e2a80446c x86/speculation: Move firmware_restrict_branch_speculation_*() from C to CPP
d9a1668e7535 x86/speculation, objtool: Annotate indirect calls/jumps for objtool
5d2055f00ca3 x86/retpoline: Support retpoline builds with Clang
f7d74d9aa741 x86/speculation: Use IBRS if available before calling into firmware
4049a8836273 Revert "x86/retpoline: Simplify vmexit_fill_RSB()"
f1c9e2394888 x86-64/realmode: Add instruction suffix
071ee9dbac4a x86/LDT: Avoid warning in 32-bit builds with older gcc
108d29575df1 x86/IO-APIC: Avoid warning in 32-bit builds
c7cbca42ac4a x86/asm: Improve how GEN_*_SUFFIXED_RMWcc() specify clobbers
a6e01bb7e6e0 x86/mm: Remove stale comment about KMEMCHECK
93e18c11ff91 x86/entry/64: Use 'xorl' for faster register clearing
e76bc364ce66 x86/entry: Reduce the code footprint of the 'idtentry' macro
0a58c796685c nospec: Include <asm/barrier.h> dependency
392fa7504294 nospec: Kill array_index_nospec_mask_check()
7a676d14cc09 MIPS: CPC: Map registers using DT in mips_cpc_default_phys_base()
b1d0c4b8e92e dt-bindings: Document mti,mips-cpc binding
25285f83f127 scsi: qla2xxx: Fix recursion while sending terminate exchange
7142b10b87d5 scsi: qla2xxx: Fix NULL pointer crash due to probe failure
8c4ae767a189 ALSA: hda: add dock and led support for HP ProBook 640 G2
245b88be66ce ALSA: hda: add dock and led support for HP EliteBook 820 G3
34ef89ff1759 ALSA: hda - Fix a wrong FIXUP for alc289 on Dell machines
6fc2d5416fda ALSA: seq: More protection for concurrent write and ioctl races
4271b3a41813 ALSA: seq: Don't allow resizing pool in use
27fb3754587a ALSA: hda/realtek - Make dock sound work on ThinkPad L570
ade62f0b3cf9 ALSA: hda/realtek - Fix dock line-out volume on Dell Precision 7520
6751bbdcc95a ALSA: hda/realtek: Limit mic boost on T480
7436dc94195d ALSA: hda/realtek - Add headset mode support for Dell laptop
c09ba221370b ALSA: hda/realtek - Add support headset mode for DELL WYSE
031fd7b4ed4a x86/spectre_v2: Don't check microcode versions when running under hypervisors
eaf9b6377a6e perf tools: Fix trigger class trigger_on()
291a0c2764e4 x86/MCE: Serialize sysfs changes
f89515c2e039 x86/MCE: Save microcode revision in machine check records
c56e9870f927 bcache: don't attach backing with duplicate UUID
dca776a05c50 bcache: fix crashes in duplicate cache device register
9fc9e1ed7335 IB/mlx5: Fix incorrect size of klms in the memory region
ca75c1477c2d dm bufio: avoid false-positive Wmaybe-uninitialized warning
b2171934ddc4 kbuild: Handle builtin dtb file names containing hyphens
822996a14a2f Revert "nvme: create 'slaves' and 'holders' entries for hidden controllers"
4a60df94905a IB/core: Fix missing RDMA cgroups release in case of failure to register device
88bf8f7eb708 arm64: mm: fix thinko in non-global page table attribute check
718a44de2712 KVM: s390: fix memory overwrites when not using SCA entries
4e5d6d3cc5e4 virtio_ring: fix num_free handling in error case
49de2e7b6670 loop: Fix lost writes caused by missing flag
342c720d9a4f Documentation/sphinx: Fix Directive import error
920a9205d268 mm/memblock.c: hardcode the end_pfn being -1
0b683939d50a lib/bug.c: exclude non-BUG/WARN exceptions from report_bug()
e9f84db183af bug: use %pB in BUG and stack protector failure
9f30ff6fa1a4 Revert "Input: synaptics - Lenovo Thinkpad T460p devices should use RMI"
1bceb2ec8956 Input: matrix_keypad - fix race when disabling interrupts
ed800b0773b1 PCI: dwc: Fix enumeration end when reaching root subordinate
77e2735ad398 MIPS: OCTEON: irq: Check for null return on kzalloc allocation
df441ada39cd MIPS: ath25: Check for kzalloc allocation failure
3eaedec0cd82 MIPS: BMIPS: Do not mask IPIs during suspend
809a9bf143f7 ovl: redirect_dir=nofollow should not follow redirect for opaque lower
75d0d16e1cda drm/amdgpu:Always save uvd vcpu_bo in VM Mode
b6ce72324e14 drm/amdgpu:Correct max uvd handles
83756e094108 drm/amdgpu: fix KV harvesting
692f415886d3 drm/radeon: fix KV harvesting
871aee09c102 drm/amdgpu: Notify sbios device ready before send request
adcdc9dd593d drm/amdgpu: used cached pcie gen info for SI (v2)
8679c019d168 drm/amd/display: Default HDMI6G support to true. Log VBIOS table error.
dd18defa55e4 drm/amd/powerplay: fix power over limit on Fiji
98bb81bb0f7b drm/radeon: insist on 32-bit DMA for Cedar on PPC64/PPC64LE
fde4dbd2a6cb drm/amd/display: check for ipp before calling cursor operations
80167d87e14f Revert "drm/radeon/pm: autoswitch power state when in balanced mode"
6cd6ec67d323 drm/amd/powerplay/vega10: allow mclk switching with no displays
8b6db1eed6d8 drm/amd/powerplay/smu7: allow mclk switching with no displays
f3d86614c99d drm/nouveau: prefer XBGR2101010 for addfb ioctl
273b6c8deabe drm/amdgpu: Fix deadlock on runtime suspend
ae78cada27a5 drm/radeon: Fix deadlock on runtime suspend
edf309e744c0 drm/nouveau: Fix deadlock on runtime suspend
51b269211a8c drm: Allow determining if current task is output poll worker
72bfcad05183 workqueue: Allow retrieval of current task's work struct
0adf0556bebd drm/i915: Always call to intel_display_set_init_power() in resume_early.
9e2d259c4e02 scsi: qla2xxx: Fix NULL pointer crash due to active timer for ABTS
44d646d03785 scsi: core: Avoid that ATA error handling can trigger a kernel hang or oops
a7423bbfb0d1 drm/i915/perf: fix perf stream opening lock
d723c32a04ca drm/i915: Try EDID bitbanging on HDMI after failed read
24791fc09ea3 drm/i915: Update watermark state correctly in sanitize_watermarks
5b79f7227aac drm/i915: Disable DC states around GMBUS on GLK
281a7778a32b drm/i915: Clear the in-use marker on execbuf failure
3ea5145064e2 drm/i915: Fix rsvd2 mask when out-fence is returned
47f84ed164c9 drm/i915/audio: fix check for av_enc_map overflow
35a66d32de2c drm/i915: Check for fused or unused pipes
b7e042c88b2c regulator: stm32-vrefbuf: fix check on ready flag
644ec8e097e9 net/smc: fix NULL pointer dereference on sock_create_kern() error path
bf18bf8d610f mac80211_hwsim: don't use WQ_MEM_RECLAIM
0a1c56f01811 IB/uverbs: Improve lockdep_check
056700807d82 bpf: cpumap: use GFP_KERNEL instead of GFP_ATOMIC in __cpu_map_entry_alloc()
45c0604dbeae RDMA/mlx5: Fix integer overflow while resizing CQ
1414d3fd4616 RDMA/ucma: Check that user doesn't overflow QP state
5d07104bc91b RDMA/ucma: Limit possible option size
3eae9e93d492 Linux 4.15.9
c0d3435d7fa0 KVM: x86: fix backward migration with async_PF
fa1f98c84c6b scsi: mpt3sas: wait for and flush running commands on shutdown/unload
2928c03a245f scsi: mpt3sas: fix oops in error handlers after shutdown/unload
6ff2082e4544 bpf, ppc64: fix out of bounds access in tail call
bc9d150b9bf1 bpf: allow xadd only on aligned memory
8c4626bf15ba bpf: add schedule points in percpu arrays management
18fa1b102cc2 bpf, arm64: fix out of bounds access in tail call
5882764e48ed bpf, x64: implement retpoline for tail call
519f40bb7fc9 bpf: fix rcu lockdep warning for lpm_trie map_free callback
f154de29a46b bpf: fix memory leak in lpm_trie map_free callback function
da43a222a759 bpf: fix mlock precharge on arraymaps
968369e0e44d Linux 4.15.8
ddf33af2f815 platform/x86: dell-laptop: fix kbd_get_state's request value
344fb4360638 md: only allow remove_and_add_spares when no sync_thread running.
f946a7289f2c powerpc/64s/radix: Boot-time NULL pointer protection using a guard-PID
39f428ebf4f1 ARM: dts: LogicPD Torpedo: Fix I2C1 pinmux
6dcd8259f418 ARM: dts: LogicPD SOM-LV: Fix I2C1 pinmux
97086e143e20 ACPI / bus: Parse tables as term_list for Dell XPS 9570 and Precision M5530
f1bf982a4fea KVM/x86: remove WARN_ON() for when vm_munmap() fails
21043b0e128e KVM: x86: fix vcpu initialization with userspace lapic
100b8cbd68b1 KVM/VMX: Optimize vmx_vcpu_run() and svm_vcpu_run() by marking the RDMSR path as unlikely()
16f7730b611a KVM: x86: move LAPIC initialization after VMCS creation
2ccf7f43562b KVM/x86: Remove indirect MSR op calls from SPEC_CTRL
1b7168079777 KVM: mmu: Fix overlap between public and private memslots
0a5e830dc933 KVM: X86: Fix SMRAM accessing even if VM is shutdown
4c1a4f2e0f9f ARM: kvm: fix building with gcc-8
f83ed2a349e6 ARM: mvebu: Fix broken PL310_ERRATA_753970 selects
2dc5b6bbd897 ARM: dts: rockchip: Remove 1.8 GHz operation point from phycore som
6e5bcbc089fc ARM: orion: fix orion_ge00_switch_board_info initialization
d95636d18120 x86/mm: Fix {pmd,pud}_{set,clear}_flags()
f48c77b42e12 nospec: Allow index argument to have const-qualified type
adfc51106c08 KVM: s390: consider epoch index on TOD clock syncs
b06b16f7ca6b KVM: s390: consider epoch index on hotplugged CPUs
35b8a4dfde70 KVM: s390: provide only a single function for setting the tod (fix SCK)
96819fb1cfee KVM: s390: take care of clock-comparator sign control
1c7cfc790da1 EDAC, sb_edac: Fix out of bound writes during DIMM configuration on KNL
9b144500e91c media: m88ds3103: don't call a non-initalized function
ced72e7e3fdc blk-mq: don't call io sched's .requeue_request when requeueing rq to ->dispatch
edd27ed8978b tcp: revert F-RTO extension to detect more spurious timeouts
34ffbd0f604c tcp: revert F-RTO middle-box workaround
46884f60c4ec s390/qeth: fix IPA command submission race
5df9e78c3dff s390/qeth: fix IP address lookup for L3 devices
f99053f7b122 Revert "s390/qeth: fix using of ref counter for rxip addresses"
6e757a122107 s390/qeth: fix double-free on IP add/remove race
50f613e92572 s390/qeth: fix IP removal on offline cards
c3238669b34f s390/qeth: fix overestimated count of buffer elements
1818aac9f31b s390/qeth: fix SETIP command handling
841c19a5cc54 s390/qeth: fix underestimated count of buffer elements
549ddc83ad5e l2tp: fix tunnel lookup use-after-free race
08ffa7bbb46e l2tp: fix race in pppol2tp_release with session object destroy
18bdaefc715b l2tp: fix races with tunnel socket close
8a319b57cc5c l2tp: don't use inet_shutdown on ppp session destroy
bb364485dfa2 l2tp: don't use inet_shutdown on tunnel destroy
333502ffcfee tcp: tracepoint: only call trace_tcp_send_reset with full socket
8421bd1de6af net: phy: Restore phy_resume() locking assumption
4f217494ee7a net/mlx5: Fix error handling when adding flow rules
bbc06dee4ac6 cxgb4: fix trailing zero in CIM LA dump
dec498f1c88e virtio-net: disable NAPI only when enabled during XDP set
fad7f95c5a30 tuntap: disable preemption during XDP processing
85e1944293c7 tuntap: correctly add the missing XDP flush
12b552b1f7b7 tcp: purge write queue upon RST
069018b93412 netlink: put module reference if dump start fails
acc97d6c2bb5 mlxsw: spectrum_router: Do not unconditionally clear route offload indication
58cea8e8f1c0 cls_u32: fix use after free in u32_destroy_key()
ba34386c3a5f amd-xgbe: Restore PCI interrupt enablement setting on resume
c5f3a16c047d tls: Use correct sk->sk_prot for IPV6
7e7a3ddb1a47 net/mlx5e: Verify inline header size do not exceed SKB linear size
738d0533e316 bridge: Fix VLAN reference count problem
e7b63f0b9981 sctp: fix dst refcnt leak in sctp_v6_get_dst()
fcff1213761a net: ipv4: Set addr_type in hash_keys for forwarded case
11cc4753e279 mlxsw: spectrum_router: Fix error path in mlxsw_sp_vr_create
6fe1cee8331d sctp: do not pr_err for the duplicated node in transport rhlist
76d0b2028297 net/sched: cls_u32: fix cls_u32 on filter replace
b933df76437b net_sched: gen_estimator: fix broken estimators based on percpu stats
03bbd6797f0b net/mlx5e: Fix loopback self test when GRO is off
edb7471e93d2 doc: Change the min default value of tcp_wmem/tcp_rmem.
3f62339aa796 tcp_bbr: better deal with suboptimal GSO
5c783a7f0203 rxrpc: Fix send in rxrpc_send_data_packet()
f3d48615d322 tcp: Honor the eor bit in tcp_mtu_probe
88ff57617d0d net: phy: fix phy_start to consider PHY_IGNORE_INTERRUPT
0ef5cb5705f2 net/mlx5e: Specify numa node when allocating drop rq
1b1a55b29fe2 mlxsw: spectrum_switchdev: Check success of FDB add operation
c7cf3921eb5f sctp: fix dst refcnt leak in sctp_v4_get_dst
9b8444159a4c net/mlx5e: Fix TCP checksum in LRO buffers
1e4661b4d107 udplite: fix partial checksum initialization
4fadd1aa760e sctp: verify size of a new chunk in _sctp_make_chunk()
9b7006aabf2b ppp: prevent unregistered channels from connecting to PPP units
f15602876538 net: sched: report if filter is too large to dump
70ecf3334923 netlink: ensure to loop over all netns in genlmsg_multicast_allns()
9784795d3f03 net: ipv4: don't allow setting net.ipv4.route.min_pmtu below 68
30535af95cf2 net: fix race on decreasing number of TX queues
214284730b09 net: ethernet: ti: cpsw: fix net watchdog timeout
21e6097dd04a net: amd-xgbe: fix comparison to bitshift when dealing with a mask
adf7429c2267 ipv6 sit: work around bogus gcc-8 -Wrestrict warning
6811b97ecd35 hdlc_ppp: carrier detect ok, don't turn off negotiation
16883c9d55c1 fib_semantics: Don't match route with mismatching tclassid
842874ee8ec1 bridge: check brport attr show in brport_show
1b89874c3856 x86/cpu_entry_area: Sync cpu_entry_area to initial_page_table
64982714bc3f x86/platform/intel-mid: Handle Intel Edison reboot correctly
d7445fa22a11 x86/xen: Zero MSR_IA32_SPEC_CTRL before suspend
6450d9cd79e9 direct-io: Fix sleep in atomic due to sync AIO
1fa58410574b dax: fix vma_is_fsdax() helper
1666ac0ce06f cpufreq: s3c24xx: Fix broken s3c_cpufreq_init()
483c2bdccca7 vfio: disable filesystem-dax page pinning
eef09bb03fcb block: pass inclusive 'lend' parameter to truncate_inode_pages_range
ea402611ed03 block: kyber: fix domain token leak during requeue
8882f981b717 block: fix the count of PGPGOUT for WRITE_SAME
e4c2c02c50b3 btrfs: use proper endianness accessors for super_copy
9a13579b3034 parisc: Hide virtual kernel memory layout
4aa930d5820a parisc: Fix ordering of cache and TLB flushes
24316676e3c7 parisc: Reduce irq overhead when run in qemu
60e756984554 parisc: Use cr16 interval timers unconditionally on qemu
ee5e1ffab408 timers: Forward timer base before migrating timers
4ee6ac4141dd mmc: dw_mmc: Fix out-of-bounds access for slot's caps
500fb6fc6f76 mmc: dw_mmc: Factor out dw_mci_init_slot_caps
d9aedd0eeff7 mmc: dw_mmc: Avoid accessing registers in runtime suspended state
89c12efb97e7 mmc: dw_mmc-k3: Fix out-of-bounds access through DT alias
77a4aeb4ce78 mmc: sdhci-pci: Fix S0i3 for Intel BYT-based controllers
05d161055a54 ALSA: hda - Fix pincfg at resume on Lenovo T470 dock
953cadb747c1 ALSA: hda: Add a power_save blacklist
b7b0967e09f8 ALSA: x86: Fix missing spinlock and mutex initializations
a2eeb5a466e4 ALSA: control: Fix memory corruption risk in snd_ctl_elem_read
9d1e69dd320d ALSA: usb-audio: Add a quirck for B&W PX headphones
45bc38a35106 tpm_tis: fix potential buffer overruns caused by bit glitches on the bus
97277fda41a5 tpm_i2c_nuvoton: fix potential buffer overruns caused by bit glitches on the bus
a46deb414510 tpm_i2c_infineon: fix potential buffer overruns caused by bit glitches on the bus
e47b9cb5a31b tpm: fix potential buffer overruns caused by bit glitches on the bus
3f0ef47f20be tpm: st33zp24: fix potential buffer overruns caused by bit glitches on the bus
fdfcd0ace151 ixgbe: fix crash in build_skb Rx code path
eeef553eef5e Bluetooth: btusb: Use DMI matching for QCA reset_resume quirking
7ef82fc6dd01 powerpc/pseries: Enable RAS hotplug events later
c58c4d2d192d platform/x86: dell-laptop: Allocate buffer on heap rather than globally
5263849bc9e7 ipmi_si: Fix error handling of platform device
d3b7976e60c6 hrtimer: Ensure POSIX compliance (relative CLOCK_REALTIME hrtimers)
816433b1879a vsprintf: avoid misleading "(null)" for %px

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
index 9da16b5afcfd..19c07ddf1dc9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "12f3957167b0001adc7c2c8b3d45127aafc37e6b"
-SRCREV_meta ?= "fd79a455524e39c31ea2b8ed7674834d2e4933f4"
+SRCREV_machine ?= "f73fd8783a3e7529902366ba75aafb81c19ec3c9"
+SRCREV_meta ?= "6918258c9e46ad8471210354159eb42f127c7374"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.15.7"
+LINUX_VERSION ?= "4.15.13"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
index 23b5f5387842..6cddb7ecfcf8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
@@ -18,13 +18,13 @@ SRCREV_machine_qemuppc ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
 SRCREV_machine_qemux86 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
 SRCREV_machine_qemux86-64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
 SRCREV_machine_qemumips64 ?= "f9a3a72209bde080e4ecb4fbe7a0f99954643131"
-SRCREV_machine ?= "12f3957167b0001adc7c2c8b3d45127aafc37e6b"
-SRCREV_meta ?= "fd79a455524e39c31ea2b8ed7674834d2e4933f4"
+SRCREV_machine ?= "f73fd8783a3e7529902366ba75aafb81c19ec3c9"
+SRCREV_meta ?= "6918258c9e46ad8471210354159eb42f127c7374"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.15.7"
+LINUX_VERSION ?= "4.15.13"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
index 023577d946a2..7e25a3d58de8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "v4.15/standard/base"
 KBRANCH_qemux86-64 ?= "v4.15/standard/base"
 KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "8b07f34007acee0fc978cec49e2fcf63026ebd43"
-SRCREV_machine_qemuarm64 ?= "12f3957167b0001adc7c2c8b3d45127aafc37e6b"
-SRCREV_machine_qemumips ?= "d4b3984ac600d413a017e9890efbfc55948d6d0a"
-SRCREV_machine_qemuppc ?= "12f3957167b0001adc7c2c8b3d45127aafc37e6b"
-SRCREV_machine_qemux86 ?= "12f3957167b0001adc7c2c8b3d45127aafc37e6b"
-SRCREV_machine_qemux86-64 ?= "12f3957167b0001adc7c2c8b3d45127aafc37e6b"
-SRCREV_machine_qemumips64 ?= "77ae4b3b45eab133a5daf1e90828e5dfe62062e1"
-SRCREV_machine ?= "12f3957167b0001adc7c2c8b3d45127aafc37e6b"
-SRCREV_meta ?= "fd79a455524e39c31ea2b8ed7674834d2e4933f4"
+SRCREV_machine_qemuarm ?= "e98391b2cf78ebdc41c229359d35d9e6ca96dde3"
+SRCREV_machine_qemuarm64 ?= "f73fd8783a3e7529902366ba75aafb81c19ec3c9"
+SRCREV_machine_qemumips ?= "e99c1fc0e84dba772531ba02373a28350056211a"
+SRCREV_machine_qemuppc ?= "f73fd8783a3e7529902366ba75aafb81c19ec3c9"
+SRCREV_machine_qemux86 ?= "f73fd8783a3e7529902366ba75aafb81c19ec3c9"
+SRCREV_machine_qemux86-64 ?= "f73fd8783a3e7529902366ba75aafb81c19ec3c9"
+SRCREV_machine_qemumips64 ?= "0789d1f7734d5408de3130f9305f2ca4abc93025"
+SRCREV_machine ?= "f73fd8783a3e7529902366ba75aafb81c19ec3c9"
+SRCREV_meta ?= "6918258c9e46ad8471210354159eb42f127c7374"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.15.7"
+LINUX_VERSION ?= "4.15.13"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.5.0


