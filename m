Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.35995.1606144024845641793
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 07:07:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: n8ldnM+WopOczQ+greyMoZQ2GdAMCLram9R6aU6j/gDzAGYrj7YI3fxE7wB08iEjPgW9UT+1Ul
 QpL03iRMj4Iw==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="159547317"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="159547317"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:10 -0800
IronPort-SDR: WNFi1p17FcxyllVsO1O3MYwnN8ieRyNJTK3EBIwu83MX0MDEKT+KX503t9ZwflSWobUtGT7vVR
 SmZWWGK/aGWg==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="361475149"
Received: from kpteh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.244.15])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:08 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 06/21] linux-yocto/5.8: update to v5.8.17
Date: Mon, 23 Nov 2020 23:06:36 +0800
Message-Id: <75182dd3db60a78920aaff724f0c71e000a77260.1606111370.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606111370.git.anuj.mittal@intel.com>
References: <cover.1606111370.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.8 to the latest korg -stable release that comprises
the following commits:

    33156ccb29d9 Linux 5.8.17
    05981710aa5e usb: gadget: f_ncm: allow using NCM in SuperSpeed Plus gadgets.
    5a30d4a5afcc eeprom: at25: set minimum read/write access stride to 1
    d33abbe3b327 usb: cdns3: gadget: free interrupt after gadget has deleted
    5a118fc75b65 USB: cdc-wdm: Make wdm_flush() interruptible and add wdm_fsync().
    2e1905ce84a1 usb: cdc-acm: add quirk to blacklist ETAS ES58X devices
    3f7ebf3355ac usb: gadget: bcm63xx_udc: fix up the error of undeclared usb_debug_root
    3d53646d781b tty: serial: fsl_lpuart: fix lpuart32_poll_get_char
    40254b8d0f8b tty: serial: lpuart: fix lpuart32_write usage
    6a8a92d5770b s390/qeth: don't let HW override the configured port role
    941895dc705d net: korina: cast KSEG0 address to pointer in kfree
    574079593732 ath10k: check idx validity in __ath10k_htt_rx_ring_fill_n()
    f8ea12647fa6 dmaengine: dw: Activate FIFO-mode for memory peripherals only
    e106dc6c4c4d dmaengine: dw: Add DMA-channels mask cell support
    b6dead6f20e9 drm/amd/display: Screen corruption on dual displays (DP+USB-C)
    0666c173a061 scsi: ufs: ufs-qcom: Fix race conditions caused by ufs_qcom_testbus_config()
    4360db24d35a usb: core: Solve race condition in anchor cleanup functions
    19bcbc2ee12f brcm80211: fix possible memleak in brcmf_proto_msgbuf_attach
    044d8bfb9028 scsi: smartpqi: Avoid crashing kernel for controller issues
    651984d53d54 ASoC: Intel: sof_rt5682: override quirk data for tgl_max98373_rt5682
    85f1ad8c8644 ASoC: SOF: Add topology filename override based on dmi data match
    54e4b6262ca7 ALSA: hda/ca0132 - Add new quirk ID for SoundBlaster AE-7.
    4597e6f214c1 ALSA: hda/ca0132 - Add AE-7 microphone selection commands.
    5fa4faf96e44 mwifiex: don't call del_timer_sync() on uninitialized timer
    047a51bba8dc s390/qeth: strictly order bridge address events
    a527bf9df3af reiserfs: Fix memory leak in reiserfs_parse_options()
    72720eaa6c33 ipvs: Fix uninit-value in do_ip_vs_set_ctl()
    2e2b67844504 Bluetooth: btusb: Fix memleak in btusb_mtk_submit_wmt_recv_urb
    97811d992adb tty: ipwireless: fix error handling
    ffe1b711045f fbmem: add margin check to fb_check_caps()
    98d29fc2c451 scsi: qedi: Fix list_del corruption while removing active I/O
    ee3fc1103a40 scsi: qedi: Protect active command list to avoid list corruption
    5bbd0a791b7c scsi: qedi: Mark all connections for recovery on link down event
    95d42ebebc2c scsi: qedf: Return SUCCESS if stale rport is encountered
    3f07687e959e HID: ite: Add USB id match for Acer One S1003 keyboard dock
    0c1943f203c2 Fix use after free in get_capset_info callback.
    4d779accb71b rtl8xxxu: prevent potential memory leak
    437ee0e6c677 brcmsmac: fix memory leak in wlc_phy_attach_lcnphy
    445359b32632 selftests/bpf: Fix test_sysctl_loop{1, 2} failure due to clang change
    5ecc5ea6e1a7 scsi: qla2xxx: Warn if done() or free() are called on an already freed srb
    d6447b6646ef scsi: ibmvfc: Fix error return in ibmvfc_probe()
    458a89fa9015 iomap: fix WARN_ON_ONCE() from unprivileged users
    e653923ad7f1 drm/msm/a6xx: fix a potential overflow issue
    1d8181746a36 Bluetooth: Only mark socket zapped after unlocking
    76925b9ea722 drm: fix double free for gbo in drm_gem_vram_init and drm_gem_vram_create
    c64d4179f8ae usb: ohci: Default to per-port over-current protection
    0c0476d096d6 xfs: make sure the rt allocator doesn't run off the end
    0c35ab58c587 opp: Prevent memory leak in dev_pm_opp_attach_genpd()
    c31de74b342a reiserfs: only call unlock_new_inode() if I_NEW
    af90d9faf01a misc: rtsx: Fix memory leak in rtsx_pci_probe
    7a40d2814425 bpf: Limit caller's stack depth 256 for subprogs with tailcalls
    cc618717afdd drm/panfrost: add support for vendor quirk
    c246a3325c75 drm/panfrost: add amlogic reset quirk callback
    8159f330f25e drm/panfrost: add Amlogic GPU integration quirks
    7f5972267295 ath9k: hif_usb: fix race condition between usb_get_urb() and usb_kill_anchored_urbs()
    8951e760c038 HID: multitouch: Lenovo X1 Tablet Gen3 trackpoint and buttons
    3eb0b62e57c3 can: flexcan: flexcan_chip_stop(): add error handling and propagate error value
    5d2dd06ad8db habanalabs: cast to u64 before shift > 31 bits
    375d81cf16bb usb: dwc3: simple: add support for Hikey 970
    c373f8d5098f USB: cdc-acm: handle broken union descriptors
    739048988f1b rtw88: increse the size of rx buffer size
    eacaacfe8bd0 udf: Avoid accessing uninitialized data on failed inode read
    9a3d398af87d udf: Limit sparing table size
    6a71fc5ca9f5 rtw88: pci: Power cycle device during shutdown
    34f026263889 usb: gadget: function: printer: fix use-after-free in __lock_acquire
    b9c15de08dfd usb: dwc3: Add splitdisable quirk for Hisilicon Kirin Soc
    e7eec8654168 misc: vop: add round_up(x,4) for vring_size to avoid kernel panic
    226b5887720b mic: vop: copy data to kernel space then write to io memory
    f96fba04992c scsi: target: core: Add CONTROL field for trace events
    d805c83716ef scsi: mvumi: Fix error return in mvumi_io_attach()
    9f1960911919 PM: hibernate: remove the bogus call to get_gendisk() in software_resume()
    6cc0a248bcfa bpf: Use raw_spin_trylock() for pcpu_freelist_push/pop in NMI
    6afdaf29e4c2 libbpf: Close map fd if init map slots failed
    e1ec1c25b00e staging: wfx: fix handling of MMIC error
    858c56fa3741 mac80211: handle lack of sband->bitrates in rates
    148c3d23858d ip_gre: set dev->hard_header_len and dev->needed_headroom properly
    ec23aa8bb0e5 ntfs: add check for mft record size in superblock
    d5772580c109 media: venus: core: Fix runtime PM imbalance in venus_probe
    6ed15eebcb61 media: venus: core: Fix error handling in probe
    91cde7d5aa17 fs: dlm: fix configfs memory leak
    24f924dbf640 media: venus: fixes for list corruption
    6e5fdad5c10f media: atomisp: fix memleak in ia_css_stream_create
    93b6de835777 media: saa7134: avoid a shift overflow
    c0f64a9057e3 mmc: sdio: Check for CISTPL_VERS_1 buffer size
    60e8d95f72b5 media: uvcvideo: Ensure all probed info is returned to v4l2
    5b66aa6f52a1 x86/mce: Make mce_rdmsrl() panic on an inaccessible MSR
    9300f536c77e spi: fsi: Fix clock running too fast
    75d927fc5587 crypto: hisilicon - fixed memory allocation error
    cde267085992 x86/mce: Annotate mce_rd/wrmsrl() with noinstr
    71b3d6794ae7 media: media/pci: prevent memory leak in bttv_probe
    e4f08676d93c media: bdisp: Fix runtime PM imbalance on error
    bad248c1ec53 media: platform: sti: hva: Fix runtime PM imbalance on error
    59eb92867e9c media: platform: s3c-camif: Fix runtime PM imbalance on error
    9fa2286f1925 media: vsp1: Fix runtime PM imbalance on error
    2341407a05ea media: exynos4-is: Fix a reference count leak
    dcc6fbbab0dc media: exynos4-is: Fix a reference count leak due to pm_runtime_get_sync
    e7997018b45d media: exynos4-is: Fix several reference count leaks due to pm_runtime_get_sync
    30f5c4e91d14 media: sti: Fix reference count leaks
    236117a8bf3a media: st-delta: Fix reference count leak in delta_run_work
    fe8798e78292 media: ati_remote: sanity check for both endpoints
    49e06f165b9c media: firewire: fix memory leak
    ba3c07c18034 x86/mce: Add Skylake quirk for patrol scrub reported errors
    8336a00a5f4d x86/asm: Replace __force_order with a memory clobber
    5056a1b3f6fb crypto: ccp - fix error handling
    121ce5e30b64 x86/dumpstack: Fix misleading instruction pointer error message
    6337db2af4d1 block: ratelimit handle_bad_sector() message
    4c4b1a29c3d0 md/bitmap: fix memory leak of temporary bitmap
    44a58dd22c28 i2c: core: Restore acpi_walk_dep_device_list() getting called after registering the ACPI i2c devs
    c1c4b2d0dee1 perf: correct SNOOPX field offset
    c93a8cddf4d2 sched/features: Fix !CONFIG_JUMP_LABEL case
    62bb6c5a3cee ntb: intel: Fix memleak in intel_ntb_pci_probe
    06a3b0080eaa NTB: hw: amd: fix an issue about leak system resources
    990c91c323f3 KVM: ioapic: break infinite recursion on lazy EOI
    959d1d42f0b6 nvmet: fix uninitialized work for zero kato
    05eb719ac46a powerpc/pseries: Avoid using addr_to_pfn in real mode
    1eb1f681057b powerpc/powernv/dump: Fix race while processing OPAL dump
    cd85f97e424b lightnvm: fix out-of-bounds write to array devices->info[]
    bd396a2c1bc9 ARM: dts: meson8: remove two invalid interrupt lines from the GPU node
    68d2900fc0c8 arm64: dts: zynqmp: Remove additional compatible string for i2c IPs
    e1f385dfa255 drm/mediatek: reduce clear event
    632bf6c3b82b soc: mediatek: cmdq: add clear option in cmdq_pkt_wfe api
    fab5aff89c9e ARM: dts: iwg20d-q7-common: Fix touch controller probe failure
    a0b4366823d9 ARM: dts: stm32: Fix DH PDK2 display PWM channel
    abb56e08ed1d ARM: dts: stm32: Swap PHY reset GPIO and TSC2004 IRQ on DHCOM SOM
    937a5596d619 ARM: dts: stm32: Move ethernet PHY into DH SoM DT
    2e7e56a6af3f ARM: dts: stm32: lxa-mc1: Fix kernel warning about PHY delays
    f80f23f39e6b ARM: dts: stm32: Fix sdmmc2 pins on AV96
    1925f1fdf9a6 ARM: OMAP2+: Restore MPU power domain if cpu_cluster_pm_enter() fails
    fdb6b483eaaf soc: fsl: qbman: Fix return value on success
    342c29116aae ARM: dts: owl-s500: Fix incorrect PPI interrupt specifiers
    52c37b7f0e04 arm64: dts: actions: limit address range for pinctrl node
    251ab5b1f8e8 arm64: dts: mt8173: elm: Fix nor_flash node property
    6e4cd77c0235 arm64: dts: renesas: r8a774c0: Fix MSIOF1 DMA channels
    5c91fc9a6d16 arm64: dts: renesas: r8a77990: Fix MSIOF1 DMA channels
    70ca9a567129 dt-bindings: crypto: Specify that allwinner, sun8i-a33-crypto needs reset
    10c78d0a1a2f soc: qcom: apr: Fixup the error displayed on lookup failure
    e8bd4ce4e877 arm64: dts: qcom: msm8916: Fix MDP/DSI interrupts
    26a8ac2d6512 arm64: dts: qcom: pm8916: Remove invalid reg size from wcd_codec
    6747001ebcb5 arm64: dts: qcom: msm8916: Remove one more thermal trip point unit name
    64ca77e846b0 soc: qcom: pdr: Fixup array type of get_domain_list_resp message
    3ca890f0e5d2 arm64: dts: qcom: sc7180: Drop flags on mdss irqs
    d9aa6534e78b arm64: dts: imx8mq: Add missing interrupts to GPC
    6395b7702156 firmware: arm_scmi: Fix NULL pointer dereference in mailbox_chan_free
    afcd57ad541b memory: fsl-corenet-cf: Fix handling of platform_get_irq() error
    244c3ac190e3 arm64: dts: qcom: sc7180: Fix the LLCC base register size
    fe5a0679f7e7 memory: omap-gpmc: Fix build error without CONFIG_OF
    d69ca7a7dfa9 memory: omap-gpmc: Fix a couple off by ones
    cc0820957d0f arm64: dts: allwinner: h5: remove Mali GPU PMU module
    4f9e6b1be196 ARM: dts: sun8i: r40: bananapi-m2-ultra: Fix dcdc1 regulator
    9a3eb126861f ARM: s3c24xx: fix mmc gpio lookup tables
    ea25940ff19f ARM: at91: pm: of_node_put() after its usage
    ba11877a60f2 ARM: dts: imx6sl: fix rng node
    2c9966436d0e arm64: dts: meson: vim3: correct led polarity
    23e1e4451190 soc: xilinx: Fix error code in zynqmp_pm_probe()
    29e043f9016c netfilter: nf_fwd_netdev: clear timestamp in forwarding path
    735b4d75a1c7 netsec: ignore 'phy-mode' device property on ACPI systems
    51ba2945a8ef netfilter: ebtables: Fixes dropping of small packets in bridge nat
    ceb1eb6cbeaf netfilter: conntrack: connection timeout after re-register
    9dd95e294542 arm64: mm: use single quantity to represent the PA to VA translation
    4a0b1d0e70ac scsi: bfa: Fix error return in bfad_pci_init()
    bdde093c81f2 KVM: x86: emulating RDPID failure shall return #UD rather than #GP
    029525c89bf1 Input: sun4i-ps2 - fix handling of platform_get_irq() error
    e186019ad86f Input: twl4030_keypad - fix handling of platform_get_irq() error
    86f11d554a8c Input: omap4-keypad - fix handling of platform_get_irq() error
    d96fc374d241 Input: ep93xx_keypad - fix handling of platform_get_irq() error
    9b9746342d52 Input: stmfts - fix a & vs && typo
    0a721220eada Input: imx6ul_tsc - clean up some errors in imx6ul_tsc_resume()
    61b00bdcd281 Input: elants_i2c - fix typo for an attribute to show calibration count
    f81bd7468e3a platform/chrome: cros_ec_lightbar: Reduce ligthbar get version command
    565697e82267 SUNRPC: fix copying of multiple pages in gss_read_proxy_verf()
    f9fc8ae508e6 clk: imx8mq: Fix usdhc parents order
    7564d5bb2b11 vfio iommu type1: Fix memory leak in vfio_iommu_type1_pin_pages
    4f9ece8b888f vfio/pci: Clear token on bypass registration failure
    6d0590647b75 ext4: limit entries returned when counting fsmap records
    9ede401a6d21 ext4: disallow modifying DAX inode flag if inline_data has been set
    1da9c8a1784b ext4: discard preallocations before releasing group lock
    9cb6c6db999e ext4: fix dead loop in ext4_mb_new_blocks
    e38a4885c98f svcrdma: fix bounce buffers for unaligned offsets and multiple pages
    e8e81bf91992 watchdog: sp5100: Fix definition of EFCH_PM_DECODEEN3
    c3228ef8f8a3 watchdog: Use put_device on error
    f12e9c2f9708 watchdog: Fix memleak in watchdog_cdev_register
    e70232457bf1 kbuild: deb-pkg: do not build linux-headers package if CONFIG_MODULES=n
    9f94507374a3 clk: bcm2835: add missing release if devm_clk_hw_register fails
    2290bfef3bbe clk: at91: clk-main: update key before writing AT91_CKGR_MOR
    963fc20cf561 module: statically initialize init section freeing data
    28270e928bae clk: mediatek: add UART0 clock support
    cab8d1bde580 clk: rockchip: Initialize hw to error to avoid undefined behavior
    b6bd62dc59e7 PCI: hv: Fix hibernation in case interrupts are not re-created
    83cf3166bd72 remoteproc/mediatek: fix null pointer dereference on null scp pointer
    1642d9e7095c pwm: img: Fix null pointer access in probe
    8db3dfe46548 pwm: rockchip: Keep enabled PWMs running while probing
    ec87b61ac31a clk: keystone: sci-clk: fix parsing assigned-clock data during probe
    2e415af55c34 clk: qcom: gcc-sdm660: Fix wrong parent_map
    ed4ce310b712 vfio/type1: fix dirty bitmap calculation in vfio_dma_rw
    01bec5d78c05 vfio: fix a missed vfio group put in vfio_pin_pages
    a1e9faa0d7c5 vfio/pci: Decouple PCI_COMMAND_MEMORY bit checks from is_virtfn
    0cdb91a009fa s390/pci: Mark all VFs as not implementing PCI_COMMAND_MEMORY
    b40bd0d87d1a vfio: add a singleton check for vfio_group_pin_pages
    7e4f15f7c99b PCI/IOV: Mark VFs as not implementing PCI_COMMAND_MEMORY
    167b37558b7f rpmsg: Avoid double-free in mtk_rpmsg_register_device
    ce43542b46a5 rpmsg: smd: Fix a kobj leak in in qcom_smd_parse_edge()
    edd546b3222f PCI: iproc: Set affinity mask on MSI interrupts
    c1e465c1a4dc PCI: aardvark: Check for errors from pci_bridge_emul_init() call
    48cc5b57cc46 PCI: aardvark: Fix compilation on s390
    50c4627222c2 PCI: designware-ep: Fix the Header Type check
    4f515d03d4f9 clk: meson: g12a: mark fclk_div2 as critical
    66a5d399702c i2c: rcar: Auto select RESET_CONTROLLER
    d39ced9254b6 rtc: ds1307: Clear OSF flag on DS1388 when setting time
    5e2918d95f79 clk: meson: axg-audio: separate axg and g12a regmap tables
    0d921fec7e59 mailbox: avoid timer start from callback
    efa544eda19e rapidio: fix the missed put_device() for rio_mport_add_riodev
    8838ee6189c3 rapidio: fix error handling path
    0a80f93ccd61 ramfs: fix nommu mmap with gaps in the page cache
    8cc3277e8e28 lib/crc32.c: fix trivial typo in preprocessor condition
    546f36709441 mm/page_owner: change split_page_owner to take a count
    99d1a5c21305 RDMA/rxe: Handle skb_clone() failure in rxe_recv.c
    ab5faad5bd33 afs: Fix cell removal
    0b6392c7ad1d afs: Fix cell purging with aliases
    e44b8d2aa154 afs: Fix cell refcounting by splitting the usage counter
    45045b6253e9 afs: Fix rapid cell addition/removal by not using RCU on cells tree
    1ad93f42c484 f2fs: wait for sysfs kobject removal before freeing f2fs_sb_info
    a08401b32a3a selftests/powerpc: Fix eeh-basic.sh exit codes
    bb24e3cb31cd perf trace: Fix off by ones in memset() after realloc() in arches using libaudit
    c6a8b7714cd7 maiblox: mediatek: Fix handling of platform_get_irq() error
    66f6ea1e0ed3 um: time-travel: Fix IRQ handling in time_travel_handle_message()
    e3ee6ff237eb um: vector: Use GFP_ATOMIC under spin lock
    fe4b4e47125d f2fs: reject CASEFOLD inode flag without casefold feature
    982f2438ac82 RDMA/rxe: Fix skb lifetime in rxe_rcv_mcast_pkt()
    1407e22fb4ca IB/rdmavt: Fix sizeof mismatch
    aae2a43ace26 cpufreq: powernv: Fix frame-size-overflow in powernv_cpufreq_reboot_notifier
    a2b19fdbf29b powerpc/papr_scm: Add PAPR command family to pass-through command-set
    0e486cc3f8a2 i3c: master: Fix error return in cdns_i3c_master_probe()
    69a4718cb2bc perf stat: Fix out of bounds CPU map access when handling armv8_pmu events
    a4682cb94495 powerpc/perf/hv-gpci: Fix starting index value
    8d1d0dfb9df8 powerpc/perf: Exclude pmc5/6 from the irrelevant PMU group constraints
    bef320194790 powerpc/64: fix irq replay pt_regs->softe value
    281c47bcad03 powerpc/64: fix irq replay missing preempt
    938e97b946ec RDMA/ipoib: Set rtnl_link_ops for ipoib interfaces
    ea879d9c818e overflow: Include header file with SIZE_MAX declaration
    1519018b8c89 kdb: Fix pager search for multi-line strings
    473fb9250371 mtd: rawnand: ams-delta: Fix non-OF build warning
    dfc293422070 mtd: spinand: gigadevice: Add QE Bit
    ab0328ef3f83 mtd: spinand: gigadevice: Only one dummy byte in QUADIO
    86cb4ae61b64 mtd: rawnand: vf610: disable clk on error handling path in probe
    fbb2d15c177f mtd: rawnand: stm32_fmc2: fix a buffer overflow
    86e185a733a8 mtd: hyperbus: hbmc-am654: Fix direct mapping setup flash access
    3b5f3adce906 RDMA/hns: Fix missing sq_sig_type when querying QP
    69accfaa1033 RDMA/hns: Fix configuration of ack_req_freq in QPC
    d56447a8cdbb RDMA/hns: Fix the wrong value of rnr_retry when querying qp
    42ae1aebaaac RDMA/hns: Solve the overflow of the calc_pg_sz()
    5c80a3655565 RDMA/hns: Add check for the validity of sl configuration
    939faf121632 perf stat: Skip duration_time in setup_system_wide
    45397023c8c2 i40iw: Add support to make destroy QP synchronous
    fd8da32da3ee RDMA/mlx5: Disable IB_DEVICE_MEM_MGT_EXTENSIONS if IB_WR_REG_MR can't work
    7486a981eb88 RDMA/mlx5: Make mkeys always owned by the kernel's PD when not enabled
    af393dd73c14 RDMA/mlx5: Use set_mkc_access_pd_addr_fields() in reg_create()
    27ca3de942d1 RDMA/hns: Set the unsupported wr opcode
    dc8b27028c1c RDMA/qedr: Fix resource leak in qedr_create_qp
    be825f704b2f perf intel-pt: Fix "context_switch event has no tid" error
    b8d1adbff983 RDMA/cma: Fix use after free race in roce multicast join
    9ef5b6658d6b RDMA/cma: Consolidate the destruction of a cma_multicast in one place
    e3b942c76b24 RDMA/cma: Remove dead code for kernel rdmacm multicast
    7d31a74bcc01 RDMA/cma: Combine cma_ndev_work with cma_work
    d1926d0b50f5 powerpc/64s/radix: Fix mm_cpumask trimming race vs kthread_use_mm
    95219c4004fd powerpc/kasan: Fix CONFIG_KASAN_VMALLOC for 8xx
    ebeafdd0f221 powerpc/tau: Disable TAU between measurements
    19d39d5d682a powerpc/tau: Check processor type before enabling TAU interrupt
    c348ab2f7276 powerpc/tau: Remove duplicated set_thresholds() call
    b61bb0da35fc powerpc/tau: Convert from timer to workqueue
    d7f12e732190 powerpc/tau: Use appropriate temperature sample interval
    1c441d9aef74 powerpc/book3s64/hash/4k: Support large linear mapping range with 4K
    990cf02eb297 powerpc/watchpoint: Add hw_len wherever missing
    0fea340b870f powerpc/watchpoint: Fix handling of vector instructions
    b99d4986bc69 powerpc/watchpoint: Fix quadword instruction handling on p10 predecessors
    6f64ff9f30d1 powerpc/pseries/svm: Allocate SWIOTLB buffer anywhere in memory
    049ab4efdf9a RDMA/qedr: Fix inline size returned for iWARP
    b1010144c1eb RDMA/qedr: Fix return code if accept is called on a destroyed qp
    b3939bfc71ec RDMA/qedr: Fix use of uninitialized field
    fbe513321c49 RDMA/qedr: Fix doorbell setting
    e947bbb26f70 RDMA/qedr: Fix qp structure memory leak
    10200a0a5d3a RDMA/umem: Prevent small pages from being returned by ib_umem_find_best_pgsz()
    59f07434b297 RDMA/umem: Fix ib_umem_find_best_pgsz() for mappings that cross a page boundary
    7ac277a01f90 RDMA: Allow fail of destroy CQ
    7802648c1dad RDMA/core: Delete function indirection for alloc/free kernel CQ
    4a8e9dbc7fde RDMA/rtrs-srv: Incorporate ib_register_client into rtrs server init
    929cdbcce02f xfs: fix high key handling in the rt allocator's query_range function
    a6d831917953 nfs: add missing "posix" local_lock constant table definition
    6a5757946685 xfs: fix deadlock and streamline xfs_getfsmap performance
    29eedbf9e39d xfs: limit entries returned when counting fsmap records
    c32adb866dac ida: Free allocated bitmap in error path
    1e84d2a5c113 arc: plat-hsdk: fix kconfig dependency warning when !RESET_CONTROLLER
    bdb0da4659e3 m68knommu: include SDHC support only when hardware has it
    01d89b4a82a4 xfs: fix finobt btree block recovery ordering
    c85d7a847227 ARM: 9007/1: l2c: fix prefetch bits init in L2X0_AUX_CTRL using DT values
    93a6c893c4d6 tools feature: Add missing -lzstd to the fast path feature detection
    26b8aa1bec47 perf tools: Make GTK2 support opt-in
    a3872e54738b mtd: mtdoops: Don't write panic data twice
    0081545c66c1 RDMA/mlx5: Fix potential race between destroy and CQE poll
    2c9da663c149 pseries/drmem: don't cache node id in drmem_lmb struct
    b1cf3e9298de powerpc/pseries: explicitly reschedule during drmem_lmb list traversal
    78805c0d14f5 RDMA/umem: Fix signature of stub ib_umem_find_best_pgsz()
    9f101b8ad2fa RDMA/hns: Add a check for current state before modifying QP
    e91945de1531 mtd: lpddr: fix excessive stack usage with clang
    33c6484d377e RDMA/ucma: Add missing locking around rdma_leave_multicast()
    191627ddc46f RDMA/ucma: Fix locking for ctx->events_reported
    582da8e19991 rcutorture: Properly set rcu_fwds for OOM handling
    11539276e399 rcu/tree: Force quiescent state on callback overload
    3aee0ca521f0 powerpc/icp-hv: Fix missing of_node_put() in success path
    cc86827cef62 powerpc/pseries: Fix missing of_node_put() in rng_init()
    bcbeec5a9a19 IB/mlx4: Adjust delayed work when a dup is observed
    f735c10a4731 IB/mlx4: Fix starvation in paravirt mux/demux
    c5e25cf59765 i3c: master add i3c_master_attach_boardinfo to preserve boardinfo
    549642f490d2 tracing: Handle synthetic event array field type checking correctly
    826adb405a53 selftests/ftrace: Change synthetic event name for inter-event-combined test
    3b82bd94e0ec fs: fix NULL dereference due to data race in prepend_path()
    7871c282d292 mm, oom_adj: don't loop through tasks in __set_oom_adj when not necessary
    349fc836d5d1 mm/memcg: fix device private memcg accounting
    b9e60476c04f mm/swapfile.c: fix potential memory leak in sys_swapon
    43edc7232737 netfilter: nf_log: missing vlan offload tag and proto
    ebd09f1ad811 net: korina: fix kfree of rx/tx descriptor array
    733dcb4149ff bpf, sockmap: Remove skb_orphan and let normal skb_kfree do cleanup
    4cdfe55c067b ipvs: clear skb->tstamp in forwarding path
    2566242742c9 drm/panfrost: increase readl_relaxed_poll_timeout values
    87ea06ea9f8d mwifiex: fix double free
    a0f38fd8303e platform/x86: mlx-platform: Remove PSU EEPROM configuration
    455ecbd43d3a tracing: Fix parse_synth_field() error handling
    4372729d5201 ipmi_si: Fix wrong return value in try_smi_init()
    caa0fa6b36ca dmaengine: ioat: Allocate correct size for descriptor chunk
    3cdf3cbc3b48 scsi: be2iscsi: Fix a theoretical leak in beiscsi_create_eqs()
    4c35763fbb0c scsi: target: tcmu: Fix warning: 'page' may be used uninitialized
    03504f955527 usb: dwc2: Fix INTR OUT transfers in DDMA mode.
    0ff11535a204 nl80211: fix non-split wiphy information
    cff51e84cb83 ocxl: fix kconfig dependency warning for OCXL
    4a87896b4e91 bus: mhi: core: Fix the building of MHI module
    e44e0bea8b7b usb: gadget: u_ether: enable qmult on SuperSpeed Plus as well
    665ed7027a67 usb: gadget: u_serial: clear suspended flag when disconnecting
    ec69e8c7686b usb: gadget: f_ncm: fix ncm_bitrate for SuperSpeed and above.
    da0922d0f8b5 iwlwifi: dbg: run init_cfg function once per driver load
    2b021c85c224 iwlwifi: dbg: remove no filter condition
    be0f631711f9 iwlwifi: mvm: split a print to avoid a WARNING in ROC
    d97c35bd05dd ASoC: wm_adsp: Pass full name to snd_ctl_notify
    1ab21ba36a84 mfd: sm501: Fix leaks in probe()
    2eb24b3bf835 net: enic: Cure the enic api locking trainwreck
    cd29df4df421 iio: adc: stm32-adc: fix runtime autosuspend delay when slow polling
    5975fa6e0519 iommu/qcom: add missing put_device() call in qcom_iommu_of_xlate()
    a13766e01768 pinctrl: aspeed: Use the right pinconf mask
    a30a515f2773 qtnfmac: fix resource leaks on unsupported iftype error return path
    148a2543ca50 selftests: Remove fmod_ret from test_overhead
    c2ebc88260ff bpf: disallow attaching modify_return tracing functions to other BPF programs
    7c37b28e0b37 ibmvnic: set up 200GBPS speed
    4829beb0ce79 coresight: etm4x: Fix save and restore of TRCVMIDCCTLR1 register
    ccc73e031de6 coresight: cti: Fix bug clearing sysfs links on callback
    79589b73fb25 coresight: cti: Fix remove sysfs link error
    9d645e979fdf coresight: etm: perf: Fix warning caused by etm_setup_aux failure
    4d3adf453eec iomap: Use kzalloc to allocate iomap_page
    f5758f108b61 nl80211: fix OBSS PD min and max offset validation
    b6ca9ea12055 hv: clocksource: Add notrace attribute to read_hv_sched_clock_*() functions
    70f1f999e24d nvmem: core: fix possibly memleak when use nvmem_cell_info_to_nvmem_cell()
    b21749762534 tty: hvc: fix link error with CONFIG_SERIAL_CORE_CONSOLE=n
    f4e52bc14c84 HID: hid-input: fix stylus battery reporting
    aba2ee9e7425 ASoC: fsl_sai: Instantiate snd_soc_dai_driver
    184c5e17b926 slimbus: qcom-ngd-ctrl: disable ngd in qmi server down callback
    caf464017965 slimbus: core: do not enter to clock pause mode in core
    4d11ab5f0904 slimbus: core: check get_addr before removing laddr ida
    9da861400bfd quota: clear padding in v2r1_mem2diskdqb()
    3efc30bcd162 mt76: mt7915: fix possible memory leak in mt7915_mcu_add_beacon
    6f0f3ad5a602 rtw88: Fix potential probe error handling race with wow firmware loading
    762f48374c26 rtw88: Fix probe error handling race with firmware loading
    e611c92ab330 usb: dwc2: Add missing cleanups when usb_add_gadget_udc() fails
    f9a314f5aa59 usb: dwc3: core: Properly default unspecified speed
    0cf8eb3b9858 usb: dwc2: Fix parameter type in function pointer prototype
    21b7dcfbf378 ALSA: seq: oss: Avoid mutex lock for a long-time ioctl
    a0229d675455 misc: mic: scif: Fix error handling path
    3eb24fb8582c ASoC: cros_ec_codec: fix kconfig dependency warning for SND_SOC_CROS_EC_CODEC
    ed848b21eb91 dmaengine: dmatest: Check list for emptiness before access its last entry
    2dbfe8f6b97c phy: rockchip-dphy-rx0: Include linux/delay.h
    e43acbf29d76 drm: rcar-du: Put reference to VSP device
    0e8f4263125f ath6kl: wmi: prevent a shift wrapping bug in ath6kl_wmi_delete_pstream_cmd()
    5569ffd9e497 ath11k: Add checked value for ath11k_ahb_remove
    ec71c634dcbd spi: omap2-mcspi: Improve performance waiting for CHSTAT
    c00cdd1b966a ASoC: tas2770: Fix unbalanced calls to pm_runtime
    46701b00ed9d ASoC: SOF: control: add size checks for ext_bytes control .put()
    e06a18b78b43 net: dsa: rtl8366rb: Support all 4096 VLANs
    a8091e02962a ASoC: tlv320aic32x4: Fix bdiv clock rate derivation
    63ed07138636 ASoC: tas2770: Fix error handling with update_bits
    6ce4b0c4f3d5 ASoC: tas2770: Fix required DT properties in the code
    92cc64394bc9 ASoC: tas2770: Add missing bias level power states
    304c38230dfd ASoC: tas2770: Fix calling reset in probe
    da374cb21045 net: wilc1000: clean up resource in error path of init mon interface
    a74a1c39af96 net: dsa: rtl8366: Skip PVID setting if not requested
    b8d304cdf951 net: dsa: rtl8366: Refactor VLAN/PVID init
    6aa894ff3372 net: dsa: rtl8366: Check validity of passed VLANs
    701c56f56837 xhci: don't create endpoint debugfs entry before ring buffer is set.
    98d66a3bb9c0 selftests/bpf: Fix endianness issue in test_sockopt_sk
    f130c8a0eeac selftests/bpf: Fix endianness issue in sk_assign
    a1aff5c4417e selftests: mptcp: interpret \n as a new line
    6c87ffcb2bff nvmem: core: fix missing of_node_put() in of_nvmem_device_get()
    3a0f17922776 coresight: etm4x: Fix issues on trcseqevr access
    0c97523e87a8 coresight: etm4x: Handle unreachable sink in perf mode
    abea9d776fe9 coresight: cti: Write regsiters directly in cti_enable_hw()
    3857796b8b49 coresight: etm4x: Fix issues within reset interface of sysfs
    efd00a5ed569 coresight: etm4x: Ensure default perf settings filter user/kernel
    435fd705a501 coresight: cti: remove pm_runtime_get_sync() from CPU hotplug
    0d0d70e1b1da coresight: cti: disclaim device only when it's claimed
    9fe394b41ba6 coresight: fix offset by one error in counting ports
    3c5c980ece55 coresight: etm4x: Fix etm4_count race by moving cpuhp callbacks to init
    8f319155ef51 ASoC: tlv320adcx140: Fix digital gain range
    7d3dcc5d26e1 ASoC: topology: disable size checks for bytes_ext controls if needed
    4a4778394419 ima: Fix NULL pointer dereference in ima_file_hash
    453ed3d7f990 drm: mxsfb: check framebuffer pitch
    dec5fabe7202 cpufreq: armada-37xx: Add missing MODULE_DEVICE_TABLE
    f3ceea270494 xfs: force the log after remapping a synchronous-writes file
    5e78a6fe2d85 net: stmmac: use netif_tx_start|stop_all_queues() function
    be17fb81e944 net: stmmac: Fix incorrect location to set real_num_rx|tx_queues
    f817cdd6d1fd scsi: mpt3sas: Fix sync irqs
    3c33f586d090 net/mlx5: Don't call timecounter cyc2time directly from 1PPS flow
    9ba9292375df net/mlx5: Fix uninitialized variable warning
    b60c22ea6623 drm/msm/adreno: fix probe without iommu
    37c857ec136c pinctrl: devicetree: Keep deferring even on timeout
    151d4913e81e pinctrl: mcp23s08: Fix mcp23x17 precious range
    bbcbd596e676 pinctrl: mcp23s08: Fix mcp23x17_regmap initialiser
    dc7285e0f1f8 Bluetooth: Re-order clearing suspend tasks
    8141ec5a8f5a selftests/lkdtm: Use "comm" instead of "diff" for dmesg
    7c38731efb2f iomap: Mark read blocks uptodate in write_begin
    d69930b3ec0b iomap: Clear page error before beginning a write
    039ee8a6363d drm/panfrost: Ensure GPU quirks are always initialised
    dc48ca171bdc drm/msm: Avoid div-by-zero in dpu_crtc_atomic_check()
    b7d539816d06 HID: roccat: add bounds checking in kone_sysfs_write_settings()
    25529f1f6003 scsi: ufs: ufs-mediatek: Fix HOST_PA_TACTIVATE quirk
    8c230b3b3668 ASoC: fsl: imx-es8328: add missing put_device() call in imx_es8328_probe()
    7a702a885270 video: fbdev: radeon: Fix memleak in radeonfb_pci_register
    53d19f4bb131 video: fbdev: sis: fix null ptr dereference
    33b1e23741cb video: fbdev: vga16fb: fix setting of pixclock because a pass-by-value error
    d92db965ef66 ath11k: fix a double free and a memory leak
    c7072eda4093 drivers/virt/fsl_hypervisor: Fix error handling path
    38b319133226 pwm: lpss: Add range limit check for the base_unit register value
    25eb525f5bf9 pwm: lpss: Fix off by one error in base_unit math in pwm_lpss_prepare()
    04e819b2f765 pty: do tty_flip_buffer_push without port->lock in pty_write
    2e92899228ae tty: hvcs: Don't NULL tty->driver_data until hvcs_cleanup()
    45f20b6066c3 tty: serial: earlycon dependency
    5ec7b8a3b6e7 binder: Remove bogus warning on failed same-process transaction
    4f40c79cbe72 scsi: ufs: Make ufshcd_print_trs() consider UFSHCD_QUIRK_PRDT_BYTE_GRAN
    6852678afe96 selftests: vm: add fragment CONFIG_GUP_BENCHMARK
    e9f1340193b5 Bluetooth: Clear suspend tasks on unregister
    7a15bd2bae85 drm/crc-debugfs: Fix memleak in crc_control_write
    91c8e9e18580 samples/bpf: Fix to xdpsock to avoid recycling frames
    88b34c076be3 drm: panel: Fix bpc for OrtusTech COM43H4M85ULC panel
    71782955ade1 mm/error_inject: Fix allow_error_inject function signatures.
    9c5e9f50572e VMCI: check return value of get_user_pages_fast() for errors
    2e1356e81edd staging: emxx_udc: Fix passing of NULL to dma_alloc_coherent()
    ad5c72b65770 backlight: sky81452-backlight: Fix refcount imbalance on error
    39d464cdfe30 rtw88: don't treat NULL pointer as an array
    8976b0bf6d8b wilc1000: Fix memleak in wilc_bus_probe
    93feab00afca wilc1000: Fix memleak in wilc_sdio_probe
    2b87f9ce106e libbpf: Fix unintentional success return code in bpf_object__load
    6ff694ac40b9 scsi: csiostor: Fix wrong return value in csio_hw_prep_fw()
    d646554479f3 scsi: qla2xxx: Fix wrong return value in qla_nvme_register_hba()
    7e26ebb1a9d2 scsi: qla2xxx: Fix wrong return value in qlt_chk_unresolv_exchg()
    d1bfd5d44f4b scsi: qla2xxx: Fix the size used in a 'dma_free_coherent()' call
    66deb6aebe10 scsi: qla4xxx: Fix an error handling path in 'qla4xxx_get_host_stats()'
    34b42a17b99f drm/gma500: fix error check
    1b8b0d839d1b selftests/bpf: Fix test_vmlinux test to use bpf_probe_read_user()
    8135d168d84c drm/amd/display: fix potential integer overflow when shifting 32 bit variable bl_pwm
    c2f41d9b1d53 staging: rtl8192u: Do not use GFP_KERNEL in atomic context
    9959c2031233 mwifiex: Do not use GFP_KERNEL in atomic context
    027b25d74ffb brcmfmac: check ndev pointer
    e9e2a870a490 ath11k: Fix possible memleak in ath11k_qmi_init_service
    7d93d871e55b ASoC: qcom: lpass-cpu: fix concurrency issue
    41a33c66b6e6 ASoC: qcom: lpass-platform: fix memory leak
    d981fcece216 wcn36xx: Fix reported 802.11n rx_highest rate wcn3660/wcn3680
    2af670b21911 ath10k: Fix the size used in a 'dma_free_coherent()' call in an error handling path
    ef10e65b3d7e ath9k: Fix potential out of bounds in ath9k_htc_txcompletion_cb()
    7c81b8b6c0b3 ath6kl: prevent potential array overflow in ath6kl_add_new_sta()
    b395ec13f72b drm: panel: Fix bus format for OrtusTech COM43H4M85ULC panel
    31e3c7aefb96 drm/vkms: add missing platform_device_unregister() in vkms_init()
    199cb9d9336f drm/vgem: add missing platform_device_unregister() in vgem_init()
    2723170f9c1b drm/amd/display: Fix wrong return value in dm_update_plane_state()
    3fe978892ab4 Bluetooth: hci_uart: Cancel init work before unregistering
    0775947bf20b drm/vkms: fix xrgb on compute crc
    6a251056d920 ath10k: provide survey info as accumulated data
    1e2be69a0396 blk-mq: move cancel of hctx->run_work to the front of blk_exit_queue
    eb66ae00496f btrfs: add owner and fs_info to alloc_state io_tree
    6cc523c1ba7e hwmon: (bt1-pvt) Wait for the completion with timeout
    82f27fd04df6 hwmon: (bt1-pvt) Cache current update timeout
    f8896b1dc97f hwmon: (bt1-pvt) Test sensor power supply on probe
    283d31599577 spi: spi-s3c64xx: Check return values
    9c27047159fd spi: spi-s3c64xx: swap s3c64xx_spi_set_cs() and s3c64xx_enable_datapath()
    2d92aae41a06 pinctrl: bcm: fix kconfig dependency warning when !GPIOLIB
    96c6b5d57756 regulator: resolve supply after creating regulator
    539f606e1044 media: ti-vpe: Fix a missing check and reference count leak
    36ba112a7c8d media: stm32-dcmi: Fix a reference count leak
    344632d9b782 media: s5p-mfc: Fix a reference count leak
    00eff51ebd27 media: camss: Fix a reference count leak.
    445adb4113e8 media: platform: fcp: Fix a reference count leak.
    34b2032620a3 media: rockchip/rga: Fix a reference count leak.
    96b1dbdb92ad media: rcar-vin: Fix a reference count leak.
    0936f228c185 media: tc358743: cleanup tc358743_cec_isr
    e25e1421396d media: tc358743: initialize variable
    ffa1c6807c37 media: mx2_emmaprp: Fix memleak in emmaprp_probe
    19b283f0b3d4 crypto: sun8i-ce - handle endianness of t_common_ctl
    9748e867ac81 crypto: stm32/crc32 - Avoid lock if hardware is already used
    aee35828de88 cypto: mediatek - fix leaks in mtk_desc_ring_alloc
    abfdbdda990a hwmon: (w83627ehf) Fix a resource leak in probe
    20d16af9c0fb hwmon: (pmbus/max34440) Fix status register reads for MAX344{51,60,61}
    621368b5adfe crypto: omap-sham - fix digcnt register handling with export/import
    71452513b06b spi: dw-pci: free previously allocated IRQs if desc->setup() fails
    31a31b30b0f6 spi: fsi: Implement restricted size for certain controllers
    a2e41e4fcd8e spi: fsi: Fix use of the bneq+ sequencer instruction
    c2177e077841 spi: fsi: Handle 9 to 15 byte transfers lengths
    0f8c1ad5ed8f media: rcar-csi2: Allocate v4l2_async_subdev dynamically
    bd48c278ba33 media: rcar_drif: Allocate v4l2_async_subdev dynamically
    23b043e23923 media: rcar_drif: Fix fwnode reference leak when parsing DT
    c78cc511ff68 media: i2c: ov5640: Enable data pins on poweron for DVP mode
    d1bb697b085a media: i2c: ov5640: Separate out mipi configuration from s_power
    44046ac3fd90 media: i2c: ov5640: Remain in power down for DVP mode unless streaming
    2038c71aeea7 media: omap3isp: Fix memleak in isp_probe
    ae17eb2da566 media: staging/intel-ipu3: css: Correctly reset some memory
    fbd50e6e825f media: uvcvideo: Silence shift-out-of-bounds warning
    3eff11b54bac media: uvcvideo: Set media controller entity functions
    008efc8c2ec0 fscrypt: restrict IV_INO_LBLK_32 to ino_bits <= 32
    38cc20da3fd2 media: m5mols: Check function pointer in m5mols_sensor_power
    6cd272c1b1d3 media: ov5640: Correct Bit Div register in clock tree diagram
    3bc4af05a125 media: hantro: postproc: Fix motion vector space allocation
    841d6b2bb64a media: hantro: h264: Get the correct fallback reference buffer
    b076e6ad0081 media: Revert "media: exynos4-is: Add missed check for pinctrl_lookup_state()"
    2e35f75c9a14 crypto: ccree - fix runtime PM imbalance on error
    707041cc6852 media: tuner-simple: fix regression in simple_set_radio_freq
    1c1e39f91ffe media: vivid: Fix global-out-of-bounds read in precalculate_color()
    0ebbe42a9a4c crypto: picoxcell - Fix potential race condition bug
    5ec044fb819d crypto: ixp4xx - Fix the size used in a 'dma_free_coherent()' call
    df29e4415305 crypto: mediatek - Fix wrong return value in mtk_desc_ring_alloc()
    36c93e69cb80 crypto: algif_skcipher - EBUSY on aio should be an error
    ff57d46f868e perf/core: Fix race in the perf_mmap_close() function
    7e5248ec07bc perf/x86: Fix n_pair for cancelled txn
    2df4319976f9 pinctrl: qcom: Use return value from irq_set_wake() call
    9d371ffd8434 pinctrl: qcom: Set IRQCHIP_SET_TYPE_MASKED and IRQCHIP_MASK_ON_SUSPEND flags
    9a7d327326bd x86/events/amd/iommu: Fix sizeof mismatch
    5fd2c1240d75 x86/nmi: Fix nmi_handle() duration miscalculation
    6f9bc7071b53 perf/x86/intel/uncore: Fix the scale of the IMC free-running events
    32ce27005110 perf/x86/intel/uncore: Reduce the number of CBOX counters
    accdd0292919 perf/x86/intel/uncore: Update Ice Lake uncore units
    140596caef50 arm64: perf: Add missing ISB in armv8pmu_enable_counter()
    4792206af85f sched/fair: Use dst group while checking imbalance for NUMA balancer
    63829cb38a3c sched/fair: Fix wrong cpu selecting from isolated domain
    b75cbad81cfc drivers/perf: thunderx2_pmu: Fix memory resource error handling
    a071f86dd7c4 drivers/perf: xgene_pmu: Fix uninitialized resource struct
    e99cf7b5025a arm64: kprobe: add checks for ARMv8.3-PAuth combined instructions
    b45c14f9b0c6 x86/fpu: Allow multiple bits in clearcpuid= parameter
    4f596c780958 perf/x86/intel/ds: Fix x86_pmu_stop warning for large PEBS
    3b172044dc55 EDAC/ti: Fix handling of platform_get_irq() error
    0d0f50ecd85d EDAC/aspeed: Fix handling of platform_get_irq() error
    3a70ad440e20 EDAC/i5100: Fix error handling order in i5100_init_one()
    6411e8ea3086 microblaze: fix kbuild redundant file warning
    1b8e25772d8e sched/fair: Fix wrong negative conversion in find_energy_efficient_cpu()
    03e0226f1cfe RAS/CEC: Fix cec_init() prototype
    19212b1a2be3 crypto: caam/qi - add support for more XTS key lengths
    d0100d71efff crypto: caam/qi - add fallback for XTS with more than 8B IV
    b61aa1de53f4 crypto: algif_aead - Do not set MAY_BACKLOG on the async path
    dd5df0880122 ima: Don't ignore errors from crypto_shash_update()
    ee0e07130bd0 KVM: SVM: Initialize prev_ga_tag before use
    af216a426bcc KVM: x86: Intercept LA57 to inject #GP fault when it's reserved
    f7b5e3c6ab6e KVM: x86/mmu: Commit zap of remaining invalid pages when recovering lpages
    efd21b7274b0 KVM: nVMX: Reload vmcs01 if getting vmcs12's pages fails
    f7421220fd60 KVM: nVMX: Reset the segment cache when stuffing guest segs
    c5ec2a6618d3 KVM: nVMX: Morph notification vector IRQ on nested VM-Enter to pending PI
    dd6120a8e1f3 arm64: Make use of ARCH_WORKAROUND_1 even when KVM is not enabled
    cb6c316cd99a smb3: fix stat when special device file and mounted with modefromsid
    321cf0e88e25 smb3: do not try to cache root directory if dir leases not supported
    dd80b98bdf0a SMB3.1.1: Fix ids returned in POSIX query dir
    2ab6d3b441dd SMB3: Resolve data corruption of TCP server info fields
    55bf111d4e81 cifs: Return the error from crypt_message when enc/dec key not found.
    c5db0e593499 cifs: remove bogus debug code
    2d8b73fc38ae ALSA: hda/realtek: Enable audio jacks of ASUS D700SA with ALC887
    1fb41e21037e ALSA: hda/realtek - Add mute Led support for HP Elitebook 845 G7
    29050421372a ALSA: hda/realtek - set mic to auto detect on a HP AIO machine
    eba61e03eadf ALSA: hda/realtek - The front Mic on a HP machine doesn't work
    383fcddfbcaa ALSA: usb-audio: Line6 Pod Go interface requires static clock rate quirk
    70dcb923cc27 ALSA: hda - Fix the return value if cb func is already registered
    4e3c57b30473 ALSA: hda - Don't register a cb func if it is registered already
    618a54d780a5 net/sched: act_gate: Unlock ->tcfa_lock in tc_setup_flow_action()
    ed2c3b4a04c2 net: ethernet: mtk-star-emac: select REGMAP_MMIO
    9c70b53dda47 tcp: fix to update snd_wl1 in bulk receiver fast path
    e4d5d075c190 selftests: rtnetlink: load fou module for kci_test_encap_fou() test
    8ab1b9ef3974 selftests: forwarding: Add missing 'rp_filter' configuration
    11a3f1f851da r8169: fix operation under forced interrupt threading
    6c9e378d7579 nfc: Ensure presence of NFC_ATTR_FIRMWARE_NAME attribute in nfc_genl_fw_download()
    a81996aa6ee5 nexthop: Fix performance regression in nexthop deletion
    8672e0e1be10 net/sched: act_tunnel_key: fix OOB write in case of IPv6 ERSPAN tunnels
    e5b67266fb48 net/sched: act_ct: Fix adding udp port mangle operation
    f6bb7b012676 net: Properly typecast int values to set sk_max_pacing_rate
    08c6a8c61f9f net: hdlc_raw_eth: Clear the IFF_TX_SKB_SHARING flag after calling ether_setup
    6fe9d5ac3f76 net: hdlc: In hdlc_rcv, check to make sure dev is an HDLC device
    79a5e1726d4f net: ftgmac100: Fix Aspeed ast2600 TX hang issue
    7f0afe20abab mptcp: initialize mptcp_options_received's ahmac
    ec5c9273f731 icmp: randomize the global rate limiter
    ab91b97c5f92 ibmvnic: save changed mac address to adapter->mac_addr
    3f9420b4d3fc chelsio/chtls: fix writing freed memory
    d632d6da9724 chelsio/chtls: correct function return and return type
    ea95811a67e3 chelsio/chtls: Fix panic when listen on multiadapter
    8650467aa359 chelsio/chtls: fix panic when server is on ipv6
    e94a4b48d51b chelsio/chtls: correct netdevice for vlan interface
    958fc22dbc30 chelsio/chtls: fix socket lock
    eb7ee70b9226 tipc: fix incorrect setting window for bcast link
    a52c1d9114f1 tipc: re-configure queue limit for broadcast link
    760295f17597 ALSA: hda/hdmi: fix incorrect locking in hdmi_pcm_close
    2b7a2a0be104 ALSA: hda: fix jack detection with Realtek codecs when in D3
    f4b88ebd9b73 ALSA: bebob: potential info leak in hwdep_read()
    40d4418ea4db binder: fix UAF when releasing todo list
    dd5743391b5e r8169: fix data corruption issue on RTL8402
    7f1b0fa4805c net_sched: remove a redundant goto chain check
    f736e9e2f750 net/ipv4: always honour route mtu during forwarding
    7ef2b9748f88 net: j1939: j1939_session_fresh_new(): fix missing initialization of skbcnt
    3cda27a6e540 can: j1935: j1939_tp_tx_dat_new(): fix missing initialization of skbcnt
    46ebf7a3bdb0 can: m_can_platform: don't call m_can_class_suspend in runtime suspend
    575e9184885b socket: don't clear SOCK_TSTAMP_NEW when SO_TIMESTAMPNS is disabled
    d2bc51dbdecd socket: fix option SO_TIMESTAMPING_NEW
    a7d0ffde99d5 tipc: fix the skb_unshare() in tipc_buf_append()
    83e8af2ee339 net: usb: qmi_wwan: add Cellient MPL200 card
    01630fae60bd net/tls: sendfile fails with ktls offload
    91119131f8a8 net/smc: fix valid DMBE buffer sizes
    c0d0fad9bed7 net/smc: fix use-after-free of delayed events
    5e52ea477365 net: sched: Fix suspicious RCU usage while accessing tcf_tunnel_info
    b91a8c7486a3 net: mptcp: make DACK4/DACK8 usage consistent among all subflows
    a0f063a63afa net: ipa: skip suspend/resume activities if not set up
    8090c13d3e4b net: fix pos incrementment in ipv6_route_seq_next
    f17fe0c1addf net: fec: Fix PHY init after phy_reset_after_clk_enable()
    8a6ab151443c net: fec: Fix phy_device lookup for phy_reset_after_clk_enable()
    d6cc94152da1 net: dsa: microchip: fix race condition
    61d51568e43b mlx4: handle non-napi callers to napi_poll
    8536e300622a ipv4: Restore flowi4_oif update before call to xfrm_lookup_route
    bd0912cd125e ibmveth: Identify ingress large send packets.
    d673d278f59f ibmveth: Switch order of ibmveth_helper calls.
    68e3dec3c3e4 xgb4: handle 4-tuple PEDIT to NAT mode translation

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eab49834f263a2727fa699050a8d01715f1e9d21)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.8.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.8.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index 6dd8df6c3b..8b6a742834 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
-SRCREV_meta ?= "7b9ba93dfc39efa90056eed0b572e86909127aaa"
+SRCREV_machine ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
+SRCREV_meta ?= "cc4fd81dde0725d813f988fe3dd4787d2084f997"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.8.16"
+LINUX_VERSION ?= "5.8.17"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 69c292f275..5045f6aa5a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.8.16"
+LINUX_VERSION ?= "5.8.17"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "be316733dd181e972379b0c3b69e930c7e3637c5"
-SRCREV_machine ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
-SRCREV_meta ?= "7b9ba93dfc39efa90056eed0b572e86909127aaa"
+SRCREV_machine_qemuarm ?= "c548e45d83f9cdf224d2a7e318d68aecf390f3bd"
+SRCREV_machine ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
+SRCREV_meta ?= "cc4fd81dde0725d813f988fe3dd4787d2084f997"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index 8b70ee9283..d4f780ce44 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
 KBRANCH_qemux86-64 ?= "v5.8/standard/base"
 KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "483273f898cbdd3fa344f1d2f67ac52c991f1cb0"
-SRCREV_machine_qemuarm64 ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
-SRCREV_machine_qemumips ?= "a87cd0744b74ada1d5f83cccae63c06d5a6e3eec"
-SRCREV_machine_qemuppc ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
-SRCREV_machine_qemuriscv64 ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
-SRCREV_machine_qemux86 ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
-SRCREV_machine_qemux86-64 ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
-SRCREV_machine_qemumips64 ?= "8cbec349bbcf94a5b37f44a43168db0bbec20af1"
-SRCREV_machine ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
-SRCREV_meta ?= "7b9ba93dfc39efa90056eed0b572e86909127aaa"
+SRCREV_machine_qemuarm ?= "3bb879f7650c06b97ee4d4b496d33bb5d62a4679"
+SRCREV_machine_qemuarm64 ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
+SRCREV_machine_qemumips ?= "6dd61d0707b17293a472f5717acb68d5a86e1e4d"
+SRCREV_machine_qemuppc ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
+SRCREV_machine_qemuriscv64 ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
+SRCREV_machine_qemux86 ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
+SRCREV_machine_qemux86-64 ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
+SRCREV_machine_qemumips64 ?= "a92b9df163d6e6b05bf1e7137d6868760537f326"
+SRCREV_machine ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
+SRCREV_meta ?= "cc4fd81dde0725d813f988fe3dd4787d2084f997"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.8.16"
+LINUX_VERSION ?= "5.8.17"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.28.0

