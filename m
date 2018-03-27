Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 857C77859F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 15:03:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2RF3Sr4016098
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Mar 2018 08:03:28 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 27 Mar 2018 08:03:27 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 27 Mar 2018 11:03:18 -0400
Message-ID: <37126f1c8d7556686f55019a52265f0e1c85e2ff.1522162765.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1522162765.git.bruce.ashfield@windriver.com>
References: <cover.1522162765.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/4.14: update to v4.14.30
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
X-List-Received-Date: Tue, 27 Mar 2018 15:03:28 -0000
Content-Type: text/plain

Integrating the korg -stable releases for v4.14, which comprise the
following commits:

   de8cdc557231 Linux 4.14.30
   5019b23699f4 RDMA/vmw_pvrdma: Fix usage of user response structures in ABI file
   957435b566c9 kbuild: fix linker feature test macros when cross compiling with Clang
   e82496fbe3a0 RDMA/ucma: Don't allow join attempts for unsupported AF family
   ce3e82c0630f RDMA/ucma: Fix access to non-initialized CM_ID object
   712b442c68c2 clk: migrate the count of orphaned clocks at init
   02db484a0583 RDMA/core: Do not use invalid destination in determining port reuse
   8b0c4a2e04f7 serial: 8250_pci: Don't fail on multiport card class
   00fb52a3828d IB/mlx5: Fix out-of-bounds read in create_raw_packet_qp_rq
   cf1eb16eef13 IB/mlx5: Fix integer overflows in mlx5_ib_create_srq
   3748694f1b91 scsi: mpt3sas: wait for and flush running commands on shutdown/unload
   9d72b2696e0a scsi: mpt3sas: fix oops in error handlers after shutdown/unload
   0493d72ee4d6 dmaengine: ti-dma-crossbar: Fix event mapping for TPCC_EVT_MUX_60_63
   e618ff1ac59c crypto: artpec6 - set correct iv size for gcm(aes)
   53555c8fc8a2 clk: si5351: Rename internal plls to avoid name collisions
   fa97cdb4c71e clk: axi-clkgen: Correctly handle nocount bit in recalc_rate()
   9e9d9b1a3dbf clk: Don't touch hardware when reparenting during registration
   24c92f975cb2 clk: at91: pmc: Wait for clocks when resuming
   14d920fc4579 nfsd4: permit layoutget of executable-only files
   1de82078a0c0 ARM: dts: aspeed-evb: Add unit name to memory node
   e434a6eaed8c RDMA/ocrdma: Fix permissions for OCRDMA_RESET_STATS
   7b7e076f8cad scsi: lpfc: Fix issues connecting with nvme initiator
   1626beb0b5d8 scsi: lpfc: Fix SCSI LUN discovery when SCSI and NVME enabled
   6f4649f3bef8 soc: qcom: smsm: fix child-node lookup
   f1f225794a41 ip_gre: fix potential memory leak in erspan_rcv
   9cd6c84e9377 ip_gre: fix error path when erspan_rcv failed
   e6cfc525163e ip6_vti: adjust vti mtu according to mtu of lower device
   f2b32ce1ccef iommu/vt-d: clean up pr_irq if request_threaded_irq fails
   915bd53d68f6 pinctrl: rockchip: enable clock when reading pin direction register
   130e535210ba pinctrl: Really force states during suspend/resume
   06299bd0cf73 media: davinci: fix a debug printk
   fea718819c69 PCI: rcar: Handle rcar_pcie_parse_request_of_pci_ranges() failures
   e1645629785b PCI: endpoint: Fix find_first_zero_bit() usage
   194b5ce11968 PCI: designware-ep: Fix ->get_msi() to check MSI_EN bit
   d67d7bf8f12d coresight: Fix disabling of CoreSight TPIU
   f16a65befe74 pty: cancel pty slave port buf's work in tty_release
   728e120d1786 drm/omap: DMM: Check for DMM readiness after successful transaction commit
   9967208b4f6c mmc: sdhci-xenon: wait 5ms after set 1.8V signal enable
   83a2960ff6d1 omapdrm: panel: fix compatible vendor string for td028ttec1
   f7eda23c2990 vgacon: Set VGA struct resource types
   58668d153baf iser-target: avoid reinitializing rdma contexts for isert commands
   a3e4b8fe6479 IB/umem: Fix use of npages/nmap fields
   251695a39f05 RDMA/cma: Use correct size when writing netlink stats
   a4ac7cb593ad IB/ipoib: Avoid memory leak if the SA returns a different DGID
   9766562956fd rtc: ac100: Fix multiple race conditions
   badf37254bc7 media: s5p-mfc: Fix lock contention - request_firmware() once
   639dab36edbd sfp: fix non-detection of PHY
   1a6610de8c1b sfp: fix EEPROM reading in the case of non-SFF8472 SFPs
   1b485793ce84 net: phy: meson-gxl: check phy_write return value
   ea60e54b22aa /dev/mem: Add bounce buffer for copy-out
   79a49fcc0768 mmc: block: fix logical error to avoid memory leak
   9dd93e524955 mmc: avoid removing non-removable hosts during suspend
   c1326c691f4d drm/tilcdc: ensure nonatomic iowrite64 is not used
   e2a6f2967f67 dmaengine: zynqmp_dma: Fix race condition in the probe
   f4a0f85594ba platform/chrome: Use proper protocol transfer function
   71233e2541a4 watchdog: Fix kref imbalance seen if handle_boot_enabled=0
   08b810901020 watchdog: Fix potential kref imbalance when opening watchdog
   008029510ac8 cros_ec: fix nul-termination for firmware build info
   79c3f5cf466d serial: 8250_dw: Disable clock on error
   f1be26620373 tty: goldfish: Enable 'earlycon' only if built-in
   5ff0741646fd qmi_wwan: set FLAG_SEND_ZLP to avoid network initiated disconnect
   a9a14b17f72c media: [RESEND] media: dvb-frontends: Add delay to Si2168 restart
   057ee30417e5 ath10k: handling qos at STA side based on AP WMM enable/disable
   824f8613ea62 media: bt8xx: Fix err 'bt878_probe()'
   2159db50a572 rtlwifi: always initialize variables given to RT_TRACE()
   9f180c6db58e rtlwifi: rtl_pci: Fix the bug when inactiveps is enabled.
   9854881c225a spi: sh-msiof: Avoid writing to registers from spi_master.setup()
   6467b3e25447 hv_netvsc: Fix the TX/RX buffer default sizes
   8dc11c413557 hv_netvsc: Fix the receive buffer size limit
   e53e85d5082c RDMA/iwpm: Fix uninitialized error code in iwpm_send_mapinfo()
   4df82a41e819 drm/msm: fix leak in failed get_pages
   b3cff08483d0 media: c8sectpfe: fix potential NULL pointer dereference in c8sectpfe_timer_interrupt
   b453f9d8c55e cpufreq: longhaul: Revert transition_delay_us to 200 ms
   e59e19dc4086 Bluetooth: btqcomsmd: Fix skb double free corruption
   5b58533858e3 Bluetooth: hci_qca: Avoid setup failure on missing rampatch
   23081c335df9 staging: android: ashmem: Fix possible deadlock in ashmem_ioctl
   23e73e2ab4d2 scsi: megaraid_sas: Do not use 32-bit atomic request descriptor for Ventura controllers
   809607940362 Linux 4.14.29
   f2216e3e1d64 usb: dwc3: Fix GDBGFIFOSPACE_TYPE values
   3914aae2ae24 USB: gadget: udc: Add missing platform_device_put() on error in bdc_pci_probe()
   c209d68794e6 scsi: qla2xxx: Fix crashes in qla2x00_probe_one on probe failure
   91cb90636e03 scsi: qla2xxx: Fix logo flag for qlt_free_session_done()
   31de69d5c9b8 scsi: qla2xxx: Fix NULL pointer access for fcport structure
   8cdd1908c174 scsi: qla2xxx: Fix smatch warning in qla25xx_delete_{rsp|req}_que
   1a8902505673 btrfs: Fix memory barriers usage with device stats counters
   d35115930d84 btrfs: remove spurious WARN_ON(ref->count < 0) in find_parent_nodes
   cb6945546b52 btrfs: Fix use-after-free when cleaning up fs_devs with a single stale device
   0136bd7238b2 btrfs: alloc_chunk: fix DUP stripe size handling
   7e7fbff126d1 btrfs: add missing initialization in btrfs_check_shared
   e625797168ce btrfs: Fix NULL pointer exception in find_bio_stripe
   e01cf461f1d0 irqchip/gic-v3-its: Ensure nr_ites >= nr_lpis
   1f4b6d083dc6 RDMAVT: Fix synchronization around percpu_ref
   cd21b3400bc1 fs/aio: Use RCU accessors for kioctx_table->table[]
   076c7c06801a fs/aio: Add explicit RCU grace period when freeing kioctx
   b071bce3ff7e lock_parent() needs to recheck if dentry got __dentry_kill'ed under it
   e693f1331c4c KVM: arm/arm64: vgic: Don't populate multiple LRs with the same vintid
   b85437d007f4 kvm: arm/arm64: vgic-v3: Tighten synchronization for guests using v2 on v3
   2ffe95e3aa1e KVM: arm/arm64: Reduce verbosity of KVM init log
   0481f001d9c1 fs: Teach path_connected to handle nfs filesystems with multiple roots.
   690291bccba9 drm/amdgpu/dce: Don't turn off DP sink when disconnected
   1a50b5f07acf drm/radeon: fix prime teardown order
   b4a9192c74ad drm/amdgpu: fix prime teardown order
   bdbd0a2082d5 drm/nouveau/bl: Fix oops on driver unbind
   3d1ef6fbdc22 ALSA: seq: Clear client entry before deleting else at closing
   0609022631b3 ALSA: seq: Fix possible UAF in snd_seq_check_queue()
   c0cafa62d780 ALSA: hda - Revert power_save option default value
   5ee6abaa5370 ALSA: pcm: Fix UAF in snd_pcm_oss_get_formats()
   a9cf8b6fe73b parisc: Handle case where flush_cache_range is called with no context
   6fcb523eafa0 x86/mm: Fix vmalloc_fault to use pXd_large
   4b428e9998c1 KVM: x86: Fix device passthrough when SME is active
   732f9a89fc1e x86/speculation: Remove Skylake C2 from Speculation Control microcode blacklist
   76aaa3978252 x86/speculation, objtool: Annotate indirect calls/jumps for objtool on 32-bit kernels
   68ce99300659 x86/vm86/32: Fix POPF emulation
   602e52e66fbe selftests/x86/entry_from_vm86: Add test cases for POPF
   102c51c63494 selftests/x86: Add tests for the STR and SLDT instructions
   6d3789cafd00 selftests/x86: Add tests for User-Mode Instruction Prevention
   9ad561690f83 selftests/x86/entry_from_vm86: Exit with 1 if we fail
   4cf4908d1d4e x86/cpufeatures: Add Intel PCONFIG cpufeature
   828ba3c7fd5a x86/cpufeatures: Add Intel Total Memory Encryption cpufeature
   42b96e19dddd Linux 4.14.28
   1c8b6717a268 drm/i915/glk: Disable Guc and HuC on GLK
   e09475d69826 dmaengine: qcom_hidma: check pending interrupts
   4f33fcc68abe IB/mlx5: revisit -Wmaybe-uninitialized warning
   fd6170bf4381 ima: relax requiring a file signature for new files with zero length
   c02dd004559c locking/locktorture: Fix num reader/writer corner cases
   09e59383eb1c rcutorture/configinit: Fix build directory error message
   17c8c5998857 ipvlan: add L2 check for packets arriving via virtual devices
   0ced0c46b418 Fix misannotated out-of-line _copy_to_user()
   4117e8971923 mmc: mmc_test: Ensure command queue is disabled for testing
   b45ccc79b04a ASoC: nuc900: Fix a loop timeout test
   00be5b299063 crypto: caam/qi - use correct print specifier for size_t
   8077cba5b1f0 mac80211: remove BUG() when interface type is invalid
   f6ae26c08033 mac80211_hwsim: enforce PS_MANUAL_POLL to be set after PS_ENABLED
   9bece8dda367 agp/intel: Flush all chipset writes after updating the GGTT
   4df57c45f762 arm64: dts: renesas: salvator-common: Add EthernetAVB PHY reset
   9281b0856dcd powerpc/64: Don't trace irqs-off at interrupt return to soft-disabled context
   d744153d67fd powerpc/modules: Don't try to restore r2 after a sibling call
   12848af16f9e drm/amdkfd: Fix memory leaks in kfd topology
   30d45938f2a5 veth: set peer GSO values
   a80de288d6c5 net: sched: drop qdisc_reset from dev_graft_qdisc
   127bda4b0912 virtio_net: Disable interrupts if napi_complete_done rescheduled napi
   623f21858691 media: davinci: vpif_capture: add NULL check on devm_kzalloc return value
   b6b70d70331f media: cpia2: Fix a couple off by one bugs
   8834a75d8acb dm raid: fix raid set size revalidation
   77ec30a0b35e media: vsp1: Prevent suspending and resuming DRM pipelines
   32097005dd78 scsi: dh: add new rdac devices
   97b8a9a87832 scsi: devinfo: apply to HP XP the same flags as Hitachi VSP
   a60a3523b398 scsi: core: scsi_get_device_flags_keyed(): Always return device flags
   677794fb0ca2 bnxt_en: Don't print "Link speed -1 no longer supported" messages.
   564030343299 spi: sun6i: disable/unprepare clocks on remove
   4309a1e0d1c3 tools/usbip: fixes build with musl libc toolchain
   9c0a007d1efc ath10k: fix invalid STS_CAP_OFFSET_MASK
   0c2fa288cfc3 mwifiex: cfg80211: do not change virtual interface during scan processing
   1a7e2b546b0f clk: qcom: msm8916: fix mnd_width for codec_digcodec
   6d6a5eae5600 drm/amdgpu:fix virtual dce bug
   bd301e538bd6 iwlwifi: mvm: avoid dumping assert log when device is stopped
   e6fb81cb22b7 perf annotate: Fix objdump comment parsing for Intel mov dissassembly
   f9b186caa071 perf annotate: Fix unnecessary memory allocation for s390x
   9334b702531d pinctrl: sh-pfc: r8a7795-es1: Fix MOD_SEL1 bit[25:24] to 0x3 when using STP_ISEN_1_D
   162ee473a0cb pinctrl: sh-pfc: r8a7791: Add can_clk function
   81a16b68d254 drm/sun4i: Fix format mask in DE2 driver
   5dc7257b7ca7 pwm: stmpe: Fix wrong register offset for hwpwm=2 case
   65722e73086d scsi: ses: don't ask for diagnostic pages repeatedly during probe
   5d8c64ea75f3 drm/amdgpu:fix random missing of FLR NOTIFY
   0049457bfde6 cpufreq: Fix governor module removal race
   bde5c6dca065 ath10k: update tdls teardown state to target
   6af44accf4ff iio: health: max30102: Add power enable parameter to get_temp function
   975486d1f138 iio: adc: ina2xx: Shift bus voltage register to mask flag bits
   cb334409bb02 drm/etnaviv: make THERMAL selectable
   893bfd501781 power: supply: ab8500_charger: Bail out in case of error in 'ab8500_charger_init_hw_registers()'
   487d43596072 power: supply: ab8500_charger: Fix an error handling path
   7579edac03e6 leds: pm8058: Silence pointer to integer size warning
   ab3db1af4210 xfrm: Fix xfrm_replay_overflow_offload_esn
   5aac93adff9c userns: Don't fail follow_automount based on s_user_ns
   926b261b1ed5 mtd: nand: ifc: update bufnum mask for ver >= 2.0.0
   2f1f60c4b903 ARM: dts: omap3-n900: Fix the audio CODEC's reset pin
   0ed43f944a40 ARM: dts: am335x-pepper: Fix the audio CODEC's reset pin
   5132282f9c4b net: thunderx: Set max queue count taking XDP_TX into account
   4ab1fcc7a5f7 mtd: nand: fix interpretation of NAND_CMD_NONE in nand_command[_lp]()
   bd174cd107d0 net: xfrm: allow clearing socket xfrm policies.
   f113f794410a rtc: brcmstb-waketimer: fix error handling in brcmstb_waketmr_probe()
   31a0f4502108 net: ieee802154: adf7242: Fix bug if defined DEBUG
   00c7a2690dcc test_firmware: fix setting old custom fw path back on exit
   919ba939de1a crypto: cavium - fix memory leak on info
   90cf769aeb5a crypto: ecc - Fix NULL pointer deref. on no default_rng
   cebb9043093e sched: Stop resched_cpu() from sending IPIs to offline CPUs
   9c2825526d96 sched: Stop switched_to_rt() from sending IPIs to offline CPUs
   872181a79b35 USB: ledtrig-usbport: fix of-node leak
   b9faab6a01e9 typec: tcpm: fusb302: Resolve out of order messaging events
   dc3173bf6ccb staging: rtl8822be: fix missing null check on dev_alloc_skb return
   0e2685fef97d drm/amdgpu: fix get_max_engine_clock_in_mhz
   dc743e973895 ARM: dts: exynos: Correct Trats2 panel reset line
   7299cd29f12c clk: meson: gxbb: fix wrong clock for SARADC/SANA
   9ac03f5260e4 ARM: dts: koelsch: Move cec_clock to root node
   cc218843b44d iwlwifi: mvm: rs: don't override the rate history in the search cycle
   f0ab595c2de0 HID: elo: clear BTN_LEFT mapping
   addf1ae9fcb2 HID: multitouch: Only look at non touch fields in first packet of a frame
   d2bbda4c374c video/hdmi: Allow "empty" HDMI infoframes
   182c594668e7 dma-buf/fence: Fix lock inversion within dma-fence-array
   e19df194b50e drm/edid: set ELD connector type in drm_edid_to_eld()
   2b0509fa4afe Revert "btrfs: use proper endianness accessors for super_copy"
   d916e453942b dm mpath: fix passing integrity data
   dbacf552cdbf earlycon: add reg-offset to physical address before mapping
   0da58aed9edc serial: core: mark port as initialized in autoconfig
   099d055f8ab9 serial: 8250_pci: Add Brainboxes UC-260 4 port serial device
   e52fb772cb1d usb: dwc3: Fix lock-up on ID change during system suspend/resume
   99d7fb05c1e9 usb: gadget: f_fs: Fix use-after-free in ffs_fs_kill_sb()
   59b0613d3f40 usb: usbmon: Read text within supplied buffer size
   42b8dfefbb1b usb: quirks: add control message delay for 1b1c:1b20
   d4f0bf4525fd usbip: vudc: fix null pointer dereference on udc->lock
   f8187fd2aeda USB: storage: Add JMicron bridge 152d:2567 to unusual_devs.h
   6de9ee2f3020 staging: android: ashmem: Fix lockdep issue during llseek
   4c2d71dd0f90 staging: comedi: fix comedi_nsamples_left.
   fdd0f1b2efc7 uas: fix comparison for error code
   3c8e0474f543 tty/serial: atmel: add new version check for usart
   a6a8916de0db serial: sh-sci: prevent lockup on full TTY buffers
   d03fbfded594 xhci: fix endpoint context tracer output
   d7c3836cd166 xhci: Fix front USB ports on ASUS PRIME B350M-A
   490869f59f58 usb: host: xhci-rcar: add support for r8a77965
   92d770524625 ASoC: rt5651: Fix regcache sync errors on resume
   57e2eb2d13db ASoC: wm_adsp: For TLV controls only register TLV get/set
   90442512a6c6 ASoC: sgtl5000: Fix suspend/resume
   577ad1c9bcfd ASoC: sun4i-i2s: Fix RX slot number of SUN8I
   a971fc44c94b x86: Treat R_X86_64_PLT32 as R_X86_64_PC32
   6bccf8962b78 net: phy: Restore phy_resume() locking assumption
   76fbc152cd8c net: phy: fix resume handling
   9b1fb9cc922d Linux 4.14.27
   24e955e59100 x86/kprobes: Fix kernel crash when probing .entry_trampoline code
   e8be8ff1f757 objtool: Fix 32-bit build
   a617f2e36d67 objtool: Fix another switch table detection issue
   c3b9f72606ac objtool, retpolines: Integrate objtool with retpoline support more closely
   a69898c9eb0a objtool: Add module specific retpoline rules
   3945bbe1525f kbuild: move cc-option and cc-disable-warning after incl. arch Makefile
   6288eb92cae8 kbuild: Set KBUILD_CFLAGS before incl. arch Makefile
   cfe39acafbaf kbuild: re-order the code to not parse unnecessary variables
   e6993149fa4d objtool: Add retpoline validation
   8c2768139ffb objtool: Use existing global variables for options
   f9be9ef91a14 x86/mm/sme, objtool: Annotate indirect call in sme_encrypt_execute()
   4d840d9a1742 x86/boot, objtool: Annotate indirect jump in secondary_startup_64()
   6fceef2e7feb x86/paravirt, objtool: Annotate indirect calls
   5065490489ee x86/speculation: Move firmware_restrict_branch_speculation_*() from C to CPP
   945e3d00ecdc x86/speculation, objtool: Annotate indirect calls/jumps for objtool
   e76a9431f21a x86/retpoline: Support retpoline builds with Clang
   c3ffdb5a2ed4 x86/speculation: Use IBRS if available before calling into firmware
   a66fe0437d85 Revert "x86/retpoline: Simplify vmexit_fill_RSB()"
   8cb411344339 x86-64/realmode: Add instruction suffix
   cd9547e51503 x86/LDT: Avoid warning in 32-bit builds with older gcc
   e793e30063b9 x86/asm: Improve how GEN_*_SUFFIXED_RMWcc() specify clobbers
   c507f00d2b5e x86/mm: Remove stale comment about KMEMCHECK
   5f9d19a6c9e1 x86/entry/64: Use 'xorl' for faster register clearing
   b690fda31a47 x86/entry: Reduce the code footprint of the 'idtentry' macro
   2e19277e1df5 nospec: Include <asm/barrier.h> dependency
   bebe3994ddaf nospec: Kill array_index_nospec_mask_check()
   dc2f0da8350e MIPS: CPC: Map registers using DT in mips_cpc_default_phys_base()
   20b4c7f86df9 dt-bindings: Document mti,mips-cpc binding
   608d96fc43a3 scsi: qla2xxx: Fix recursion while sending terminate exchange
   8540351ee8a4 scsi: qla2xxx: Fix NULL pointer crash due to probe failure
   3deecffb1b78 ALSA: hda: add dock and led support for HP ProBook 640 G2
   f2ba41eb6290 ALSA: hda: add dock and led support for HP EliteBook 820 G3
   818b447d14e4 ALSA: hda - Fix a wrong FIXUP for alc289 on Dell machines
   6d3a7dcba8c5 ALSA: seq: More protection for concurrent write and ioctl races
   d9c724729d0d ALSA: seq: Don't allow resizing pool in use
   7b4e500bada3 ALSA: hda/realtek - Make dock sound work on ThinkPad L570
   816ee317d8a2 ALSA: hda/realtek - Fix dock line-out volume on Dell Precision 7520
   3c69eccc1ab1 ALSA: hda/realtek: Limit mic boost on T480
   37872f84cc2d ALSA: hda/realtek - Add headset mode support for Dell laptop
   2c269a2557a9 ALSA: hda/realtek - Add support headset mode for DELL WYSE
   c5bd1ad601d1 x86/spectre_v2: Don't check microcode versions when running under hypervisors
   c192a793f056 perf tools: Fix trigger class trigger_on()
   5c1c405d3936 x86/MCE: Serialize sysfs changes
   859334041d04 x86/MCE: Save microcode revision in machine check records
   c6a1c0caf2d0 bcache: don't attach backing with duplicate UUID
   14c2230b83bc bcache: fix crashes in duplicate cache device register
   f1833eb13078 IB/mlx5: Fix incorrect size of klms in the memory region
   525673339fb1 dm bufio: avoid false-positive Wmaybe-uninitialized warning
   ffced04184f5 kbuild: Handle builtin dtb file names containing hyphens
   e3a8c7b5d707 IB/core: Fix missing RDMA cgroups release in case of failure to register device
   c1badd7b65c4 arm64: mm: fix thinko in non-global page table attribute check
   3da2a62a61d1 KVM: s390: fix memory overwrites when not using SCA entries
   583cc79b7380 virtio_ring: fix num_free handling in error case
   5f9113db06a4 loop: Fix lost writes caused by missing flag
   7f18a19b2113 Documentation/sphinx: Fix Directive import error
   88b3e6acbae0 mm/memblock.c: hardcode the end_pfn being -1
   d50cb5cedb6f lib/bug.c: exclude non-BUG/WARN exceptions from report_bug()
   89d3fccd8bab Input: matrix_keypad - fix race when disabling interrupts
   91e019af29cd PCI: dwc: Fix enumeration end when reaching root subordinate
   d90bb7c6806b MIPS: OCTEON: irq: Check for null return on kzalloc allocation
   e06fe5925771 MIPS: ath25: Check for kzalloc allocation failure
   26f1a4666090 MIPS: BMIPS: Do not mask IPIs during suspend
   6c6f1e60b5e4 drm/amdgpu:Always save uvd vcpu_bo in VM Mode
   783fd8eb86fc drm/amdgpu:Correct max uvd handles
   e919af14fa17 drm/amdgpu: fix KV harvesting
   f641c63d750a drm/radeon: fix KV harvesting
   755e5527e57f drm/amdgpu: Notify sbios device ready before send request
   20f3ff9738c0 drm/amdgpu: used cached pcie gen info for SI (v2)
   26078a2d862d drm/amd/powerplay: fix power over limit on Fiji
   9c1192dcb7ba drm/radeon: insist on 32-bit DMA for Cedar on PPC64/PPC64LE
   1dd93412438e Revert "drm/radeon/pm: autoswitch power state when in balanced mode"
   cfc381d215af drm/amd/powerplay/vega10: allow mclk switching with no displays
   396ff3687674 drm/amd/powerplay/smu7: allow mclk switching with no displays
   9b9a82c0e2e1 drm/nouveau: prefer XBGR2101010 for addfb ioctl
   e6a23183d800 drm/amdgpu: Fix deadlock on runtime suspend
   9c1508eff805 drm/radeon: Fix deadlock on runtime suspend
   8c13b37c887d drm/nouveau: Fix deadlock on runtime suspend
   c261d5a4e5bf drm: Allow determining if current task is output poll worker
   363e3fd5fa49 workqueue: Allow retrieval of current task's work struct
   0547d1135081 drm/i915: Always call to intel_display_set_init_power() in resume_early.
   07b749546521 scsi: qla2xxx: Fix NULL pointer crash due to active timer for ABTS
   4dbc3e4d8b28 scsi: core: Avoid that ATA error handling can trigger a kernel hang or oops
   2e5033364e0d drm/i915/perf: fix perf stream opening lock
   c16a67695cd6 drm/i915: Try EDID bitbanging on HDMI after failed read
   d3accc34d793 drm/i915: Update watermark state correctly in sanitize_watermarks
   7b3f881e41c5 drm/i915: Disable DC states around GMBUS on GLK
   492056f2944e drm/i915: Clear the in-use marker on execbuf failure
   f306b12928b9 drm/i915: Fix rsvd2 mask when out-fence is returned
   4b26a307391f regulator: stm32-vrefbuf: fix check on ready flag
   bba05fb6a13b net/smc: fix NULL pointer dereference on sock_create_kern() error path
   e0486b303556 IB/uverbs: Improve lockdep_check
   dbfed071633c RDMA/mlx5: Fix integer overflow while resizing CQ
   01b8c0e36063 RDMA/ucma: Check that user doesn't overflow QP state
   9b2d784a39d4 RDMA/ucma: Limit possible option size
   7b7574e9b209 NFS: Fix unstable write completion
   e131a6d68cd5 pNFS: Prevent the layout header refcount going to zero in pnfs_roc()
   2bca2c58d83b NFS: Fix an incorrect type in struct nfs_direct_req
   29060ff7c1ed scsi: qla2xxx: Fix memory leak in dual/target mode
   0393270e9e58 scsi: qla2xxx: Fix system crash in qlt_plogi_ack_unref
   e62c1051a4fd scsi: qla2xxx: Remove aborting ELS IOCB call issued as part of timeout.
   f5ff7098d906 scsi: qla2xxx: Defer processing of GS IOCB calls
   1bc43df12141 scsi: qla2xxx: Clear loop id after delete
   21e4e9c6d8ab scsi: qla2xxx: Fix scan state field for fcport
   0b42928ca54c scsi: qla2xxx: Replace fcport alloc with qla2x00_alloc_fcport
   11739154e650 scsi: qla2xxx: Fix abort command deadlock due to spinlock
   4929c452336c scsi: qla2xxx: Fix PRLI state check
   f92ec32f33ba scsi: qla2xxx: Fix Relogin being triggered too fast
   1411448e0a1b scsi: qla2xxx: Fix NPIV host cleanup in target mode
   4274e4a3bee9 scsi: qla2xxx: Fix login state machine stuck at GPDB
   585f4ebd9e66 scsi: qla2xxx: Serialize GPNID for multiple RSCN
   a6d50e89f119 scsi: qla2xxx: Retry switch command on time out
   8e6cbe51afee scsi: qla2xxx: Fix re-login for Nport Handle in use
   fae72a271001 scsi: qla2xxx: Skip IRQ affinity for Target QPairs
   2cd1f76b293e scsi: qla2xxx: Move session delete to driver work queue
   e0be82d7801a scsi: qla2xxx: Fix gpnid error processing
   f58abb5bbd23 scsi: qla2xxx: Fix system crash for Notify ack timeout handling
   7b6f41b7377a tpm: only attempt to disable the LPC CLKRUN if is already enabled
   30c3b70e8d83 tpm: remove unused variables
   1ef7d99cc897 tpm: delete the TPM_TIS_CLK_ENABLE flag
   7cea3381216a tpm: Keep CLKRUN enabled throughout the duration of transmit_cmd()
   f1bb2393fcd0 tpm_tis: Move ilb_base_addr to tpm_tis_data
   9131a1b3d9c8 netfilter: use skb_to_full_sk in ip6_route_me_harder
   39f154faecc2 netfilter: ipv6: fix use-after-free Write in nf_nat_ipv6_manip_pkt
   2d7e07003950 netfilter: bridge: ebt_among: add missing match size checks
   eaa06bfba8ea netfilter: ebtables: CONFIG_COMPAT: don't trust userland offsets
   c89e04e5c06e netfilter: IDLETIMER: be syzkaller friendly
   53f94e6110aa netfilter: nat: cope with negative port range
   ab737b02b2fd netfilter: x_tables: fix missing timer initialization in xt_LED
   2a7ebc07a153 netfilter: xt_hashlimit: fix lock imbalance
   4514a597aa43 netfilter: ipt_CLUSTERIP: fix a race condition of proc file creation
   638c2e4eff89 netfilter: add back stackpointer size checks
   310f286ded5f ASoC: Intel: kbl: fix jack name
   314b54aae2ad ASoC: Intel: Skylake: Fix jack name format substitution
   c116baf79f0e ARM: omap2: hide omap3_save_secure_ram on non-OMAP3 builds
   77fbdd1e2a0c watchdog: hpwdt: Remove legacy NMI sourcing.
   41da51dbc372 watchdog: hpwdt: fix unused variable warning
   d40d7b332592 watchdog: hpwdt: Check source of NMI
   9a07f4a6befc watchdog: hpwdt: SMBIOS check
   31c4bc6e01e5 kbuild: move "_all" target out of $(KBUILD_SRC) conditional
   96427a5164f3 Linux 4.14.26
   dc6fb79de47d KVM: x86: fix backward migration with async_PF
   a91064ff43a2 bpf, ppc64: fix out of bounds access in tail call
   3e272a8cd57a bpf: allow xadd only on aligned memory
   e1760b3563fb bpf: add schedule points in percpu arrays management
   03549a3476e1 bpf, arm64: fix out of bounds access in tail call
   7e657aa3b4f7 bpf, x64: implement retpoline for tail call
   853223c2caf4 bpf: fix rcu lockdep warning for lpm_trie map_free callback
   62a2caa5027f bpf: fix memory leak in lpm_trie map_free callback function
   d9fd73c60bc9 bpf: fix mlock precharge on arraymaps
   8773f9bfa9e8 Linux 4.14.25
   df11c2268c39 nvme-rdma: don't suppress send completions
   9474d8fa7ac4 md: only allow remove_and_add_spares when no sync_thread running.
   4df591f704a2 ARM: dts: LogicPD Torpedo: Fix I2C1 pinmux
   2b8446579c1b ARM: dts: LogicPD SOM-LV: Fix I2C1 pinmux
   b2190cc39184 ACPI / bus: Parse tables as term_list for Dell XPS 9570 and Precision M5530
   b95f8ca8d719 KVM/x86: remove WARN_ON() for when vm_munmap() fails
   615462370ab6 KVM/x86: Fix wrong macro references of X86_CR0_PG_BIT and X86_CR4_PAE_BIT in kvm_valid_sregs()
   db98acd6f859 PCI/ASPM: Deal with missing root ports in link state handling
   b4830f3ad9c5 KVM: x86: fix vcpu initialization with userspace lapic
   1f17daea7026 KVM/VMX: Optimize vmx_vcpu_run() and svm_vcpu_run() by marking the RDMSR path as unlikely()
   03d62460c731 KVM: x86: move LAPIC initialization after VMCS creation
   0d62a56dc454 KVM/x86: Remove indirect MSR op calls from SPEC_CTRL
   7135aaf3ed63 KVM: mmu: Fix overlap between public and private memslots
   1ebf9ab6c4a0 KVM: X86: Fix SMRAM accessing even if VM is shutdown
   f925158cb0d2 KVM: x86: extend usage of RET_MMIO_PF_* constants
   e0c7b2b16666 ARM: kvm: fix building with gcc-8
   fc6be8bc1216 ARM: mvebu: Fix broken PL310_ERRATA_753970 selects
   4c02f0164b0e ARM: dts: rockchip: Remove 1.8 GHz operation point from phycore som
   8dc356e5b936 ARM: orion: fix orion_ge00_switch_board_info initialization
   b20d1086410a x86/mm: Fix {pmd,pud}_{set,clear}_flags()
   656772cb7233 nospec: Allow index argument to have const-qualified type
   81a158d21498 KVM: s390: consider epoch index on TOD clock syncs
   dbab3751bcc7 KVM: s390: consider epoch index on hotplugged CPUs
   58a5d1ac69a7 KVM: s390: provide only a single function for setting the tod (fix SCK)
   c09ea9a8da5b KVM: s390: take care of clock-comparator sign control
   bd3ead457638 EDAC, sb_edac: Fix out of bound writes during DIMM configuration on KNL
   1ba2b9e01dbf media: m88ds3103: don't call a non-initalized function
   ccddee811eba blk-mq: don't call io sched's .requeue_request when requeueing rq to ->dispatch
   c5f32462f0df s390/qeth: fix IPA command submission race
   eae17c406390 s390/qeth: fix IP address lookup for L3 devices
   87c4789f452d Revert "s390/qeth: fix using of ref counter for rxip addresses"
   56f662db7f56 s390/qeth: fix double-free on IP add/remove race
   027637104ddf s390/qeth: fix IP removal on offline cards
   fa4919e37f8e s390/qeth: fix overestimated count of buffer elements
   128c7e692333 s390/qeth: fix SETIP command handling
   fcdfb9d80dc9 s390/qeth: fix underestimated count of buffer elements
   99a781947c2a virtio-net: disable NAPI only when enabled during XDP set
   5134b919cc2c tuntap: disable preemption during XDP processing
   1903344b6320 tuntap: correctly add the missing XDP flush
   abb4a8b870b5 tcp: purge write queue upon RST
   eec434c573e7 netlink: put module reference if dump start fails
   abd7663b5d1c mlxsw: spectrum_router: Do not unconditionally clear route offload indication
   ebadf888288c cls_u32: fix use after free in u32_destroy_key()
   fb8a84cb9f6a amd-xgbe: Restore PCI interrupt enablement setting on resume
   e7b316ac78e2 net/mlx5e: Verify inline header size do not exceed SKB linear size
   cbd173b8105c bridge: Fix VLAN reference count problem
   00ec3b0ca32f sctp: fix dst refcnt leak in sctp_v6_get_dst()
   97ba6e5ff684 net: ipv4: Set addr_type in hash_keys for forwarded case
   73cb791fe41c mlxsw: spectrum_router: Fix error path in mlxsw_sp_vr_create
   0ab87ec99e99 tcp: revert F-RTO extension to detect more spurious timeouts
   cc8dadb8c0f4 tcp: revert F-RTO middle-box workaround
   36728a6b39c1 sctp: do not pr_err for the duplicated node in transport rhlist
   54d6bc97b4c9 net/sched: cls_u32: fix cls_u32 on filter replace
   a01550d778a4 net_sched: gen_estimator: fix broken estimators based on percpu stats
   5b5be45ed1f2 net/mlx5e: Fix loopback self test when GRO is off
   ff01f118d168 doc: Change the min default value of tcp_wmem/tcp_rmem.
   d6a76199e851 tcp_bbr: better deal with suboptimal GSO
   f0a04a0e1ab4 rxrpc: Fix send in rxrpc_send_data_packet()
   17634603d494 tcp: Honor the eor bit in tcp_mtu_probe
   dcb5da20ee3f net: phy: fix phy_start to consider PHY_IGNORE_INTERRUPT
   f26693d38760 net/mlx5e: Specify numa node when allocating drop rq
   2229dd5dd6c6 mlxsw: spectrum_switchdev: Check success of FDB add operation
   9f02a069bfdd sctp: fix dst refcnt leak in sctp_v4_get_dst
   bf014cc18a3c net/mlx5e: Fix TCP checksum in LRO buffers
   fecb84a83f84 udplite: fix partial checksum initialization
   1fc74a57a8ae sctp: verify size of a new chunk in _sctp_make_chunk()
   5775f7876467 ppp: prevent unregistered channels from connecting to PPP units
   795f3deff199 net: sched: report if filter is too large to dump
   60b28d5ef3e3 netlink: ensure to loop over all netns in genlmsg_multicast_allns()
   3bcf69f8e786 net: ipv4: don't allow setting net.ipv4.route.min_pmtu below 68
   f80c28a585b5 net: fix race on decreasing number of TX queues
   da260080c2e3 net: ethernet: ti: cpsw: fix net watchdog timeout
   94870df33c9b net: amd-xgbe: fix comparison to bitshift when dealing with a mask
   c3d7d3a099f6 ipv6 sit: work around bogus gcc-8 -Wrestrict warning
   2cdc12a498fc hdlc_ppp: carrier detect ok, don't turn off negotiation
   4a5048e7fdeb fib_semantics: Don't match route with mismatching tclassid
   4c13e689e5f0 bridge: check brport attr show in brport_show
   71978491bb66 x86/cpu_entry_area: Sync cpu_entry_area to initial_page_table
   f70befc397a6 x86/platform/intel-mid: Handle Intel Edison reboot correctly
   e521a723fd3f x86/xen: Zero MSR_IA32_SPEC_CTRL before suspend
   93e1f7fc77e6 direct-io: Fix sleep in atomic due to sync AIO
   0ba6c33b3287 dax: fix vma_is_fsdax() helper
   3379a37a7409 cpufreq: s3c24xx: Fix broken s3c_cpufreq_init()
   d5168ce35434 vfio: disable filesystem-dax page pinning
   7f43f610c4bb block: kyber: fix domain token leak during requeue
   17644a0bbb19 block: fix the count of PGPGOUT for WRITE_SAME
   eae6179f5539 btrfs: use proper endianness accessors for super_copy
   dabf89052e8e parisc: Fix ordering of cache and TLB flushes
   47e7fc96cddc parisc: Reduce irq overhead when run in qemu
   90c3f0d36000 parisc: Use cr16 interval timers unconditionally on qemu
   6b218ed6bd07 timers: Forward timer base before migrating timers
   ec274a65154a mmc: dw_mmc: Fix out-of-bounds access for slot's caps
   e03d46a156d9 mmc: dw_mmc: Factor out dw_mci_init_slot_caps
   4d5123a0b37c mmc: dw_mmc: Avoid accessing registers in runtime suspended state
   cb65fc21f387 mmc: dw_mmc-k3: Fix out-of-bounds access through DT alias
   33b42aa617d1 mmc: sdhci-pci: Fix S0i3 for Intel BYT-based controllers
   e2c3f7270218 ALSA: hda - Fix pincfg at resume on Lenovo T470 dock
   34516912bfd7 ALSA: hda: Add a power_save blacklist
   e5e9a08e151f ALSA: x86: Fix missing spinlock and mutex initializations
   a2102a155f3d ALSA: control: Fix memory corruption risk in snd_ctl_elem_read
   ebc24a828a2f ALSA: usb-audio: Add a quirck for B&W PX headphones
   e5966192439e tpm_tis_spi: Use DMA-safe memory for SPI transfers
   fbb6fba47c05 tpm: constify transmit data pointers
   f8e331c508c2 tpm_tis: fix potential buffer overruns caused by bit glitches on the bus
   37dfbccd4b22 tpm_i2c_nuvoton: fix potential buffer overruns caused by bit glitches on the bus
   e9951ab03f51 tpm_i2c_infineon: fix potential buffer overruns caused by bit glitches on the bus
   648b62fda1a3 tpm: fix potential buffer overruns caused by bit glitches on the bus
   703fca31ac31 tpm: st33zp24: fix potential buffer overruns caused by bit glitches on the bus
   972b19e615a2 ixgbe: fix crash in build_skb Rx code path
   971039cc4da1 Bluetooth: btusb: Use DMI matching for QCA reset_resume quirking

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index 07ad6bad3267..dfbde660b053 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "26443228033c81f99bf75e5b75eec662f39243b1"
-SRCREV_meta ?= "53a4d48a80a127a3a14a0d3d81f52989fbbf9645"
+SRCREV_machine ?= "620ed070a13e614e8e550998fae123318eeb881a"
+SRCREV_meta ?= "f8232ce8e9f759b961e4e3836472de54e96b50da"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.24"
+LINUX_VERSION ?= "4.14.30"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index a9aa571540bf..e5941a7ea043 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.14.24"
+LINUX_VERSION ?= "4.14.30"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ff658b2ac6a54d40fcf17a9d5d8d854b80067d49"
-SRCREV_meta ?= "53a4d48a80a127a3a14a0d3d81f52989fbbf9645"
+SRCREV_machine ?= "40adf66d7c45b8252a1d3f904b5027a495e41725"
+SRCREV_meta ?= "f8232ce8e9f759b961e4e3836472de54e96b50da"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index 2904ef65f8bd..ff5472561345 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "v4.14/standard/base"
 KBRANCH_qemux86-64 ?= "v4.14/standard/base"
 KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "91bb6027a9a8aff1dd06f4fc4704b9c87c77a7c8"
-SRCREV_machine_qemuarm64 ?= "1665bf9e7532c6e9bd59d08c6dffa3819c621195"
-SRCREV_machine_qemumips ?= "9e29cfdcd4823d3dec0bb0d803b5e3be2bc73ffa"
-SRCREV_machine_qemuppc ?= "e22e4b39c0d97706f0298d8313e0a51ba22af65a"
-SRCREV_machine_qemux86 ?= "6ba0d6a225af558654be7619655b0c32ca866bc7"
-SRCREV_machine_qemux86-64 ?= "6ba0d6a225af558654be7619655b0c32ca866bc7"
-SRCREV_machine_qemumips64 ?= "d8c7e535a8dcc7b30213c628e4c4c98e56daad6b"
-SRCREV_machine ?= "6ba0d6a225af558654be7619655b0c32ca866bc7"
-SRCREV_meta ?= "53a4d48a80a127a3a14a0d3d81f52989fbbf9645"
+SRCREV_machine_qemuarm ?= "73815e83e4f6bc22e88f4eb3bd4ee5483198ff0d"
+SRCREV_machine_qemuarm64 ?= "b0bf285405cf0369ecc7e0b923d776138b0bcf84"
+SRCREV_machine_qemumips ?= "47b99cfeaf68526ab28e657ac8fa681b0c78103a"
+SRCREV_machine_qemuppc ?= "2219819c5473dd238913e4c0ca077798d531eaf4"
+SRCREV_machine_qemux86 ?= "1d50ce210b0536eb9a66d1e56ae215f92176444a"
+SRCREV_machine_qemux86-64 ?= "1d50ce210b0536eb9a66d1e56ae215f92176444a"
+SRCREV_machine_qemumips64 ?= "37b40335aa0cd149c7664fe6d9b0d63b5c34e150"
+SRCREV_machine ?= "1d50ce210b0536eb9a66d1e56ae215f92176444a"
+SRCREV_meta ?= "f8232ce8e9f759b961e4e3836472de54e96b50da"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.24"
+LINUX_VERSION ?= "4.14.30"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


