Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.17006.1627890765018628590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193002094"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193002094"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:20 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478653477"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:18 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 21/37] linux-yocto/5.10: update to v5.10.52
Date: Mon,  2 Aug 2021 15:52:08 +0800
Message-Id: <f1cdacd94be25830965fcd87843bf100aa51718c.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    2cd5fe24a7f0 Linux 5.10.52
    174c34d9cda1 seq_file: disallow extremely large seq buffer allocations
    b33aa0dbd72f scsi: scsi_dh_alua: Fix signedness bug in alua_rtpg()
    e09c9b558436 MIPS: vdso: Invalid GIC access through VDSO
    20f79ce2b1ab mips: disable branch profiling in boot/decompress.o
    4e2764e96a15 mips: always link byteswap helpers into decompressor
    53c5c2496fc9 static_call: Fix static_call_text_reserved() vs __init
    59ae35884c5e jump_label: Fix jump_label_text_reserved() vs __init
    143a6b8ec5c6 sched/uclamp: Ignore max aggregation if rq is idle
    43b89ef7bc4a scsi: be2iscsi: Fix an error handling path in beiscsi_dev_probe()
    f71f13034f3b arm64: dts: rockchip: Re-add regulator-always-on for vcc_sdio for rk3399-roc-pc
    b3231050c75c arm64: dts: rockchip: Re-add regulator-boot-on, regulator-always-on for vdd_gpu on rk3399-roc-pc
    9436e9001d40 firmware: turris-mox-rwtm: show message about HWRNG registration
    b2a5949a91a7 firmware: turris-mox-rwtm: fail probing when firmware does not support hwrng
    ddf380b0941f firmware: turris-mox-rwtm: report failures better
    271c12dbeb62 firmware: turris-mox-rwtm: fix reply status decoding function
    804aabb50990 thermal/drivers/rcar_gen3_thermal: Fix coefficient calculations
    dae777523234 ARM: dts: imx6q-dhcom: Add gpios pinctrl for i2c bus recovery
    936446f15aef ARM: dts: imx6q-dhcom: Fix ethernet plugin detection problems
    f12a456f1c3b ARM: dts: imx6q-dhcom: Fix ethernet reset time properties
    b1995806d008 thermal/drivers/sprd: Add missing MODULE_DEVICE_TABLE
    4d9ea2858607 ARM: dts: am437x: align ti,pindir-d0-out-d1-in property with dt-shema
    6641724d68fd ARM: dts: am335x: align ti,pindir-d0-out-d1-in property with dt-shema
    0724764c085a ARM: dts: dra7: Fix duplicate USB4 target module node
    6cd58375c532 arm64: dts: allwinner: a64-sopine-baseboard: change RGMII mode to TXID
    b5789e23773f memory: fsl_ifc: fix leak of private memory on probe failure
    8d071d270afb memory: fsl_ifc: fix leak of IO mapping on probe failure
    1479998d8027 arm64: dts: ti: k3-j721e-main: Fix external refclk input to SERDES
    668ca468702e arm64: dts: renesas: r8a779a0: Drop power-domains property from GIC node
    884d09d1f18c reset: bail if try_module_get() fails
    8c07e1a8c57c ARM: dts: BCM5301X: Fixup SPI binding
    db4e87ab60e8 dt-bindings: i2c: at91: fix example for scl-gpios
    4b4c61049ec5 firmware: arm_scmi: Reset Rx buffer to max size during async commands
    c381e695cfcd firmware: tegra: Fix error return code in tegra210_bpmp_init()
    f58a3bc94aae arm64: dts: qcom: trogdor: Add no-hpd to DSI bridge node
    d99524d13df9 ARM: dts: stm32: Rework LAN8710Ai PHY reset on DHCOM SoM
    91df7f4a0410 ARM: dts: stm32: Connect PHY IRQ line on DH STM32MP1 SoM
    c4218acd688e arm64: dts: renesas: r8a7796[01]: Fix OPP table entry voltages
    305df11389cb arm64: dts: renesas: Add missing opp-suspend properties
    55fd1d3ca578 arm64: dts: ti: j7200-main: Enable USB2 PHY RX sensitivity workaround
    b8d350b4ac1e ARM: dts: r8a7779, marzen: Fix DU clock names
    b02a65061e97 arm64: dts: renesas: v3msk: Fix memory size
    ab4d76eb7737 rtc: fix snprintf() checking in is_rtc_hctosys()
    e35246365403 ARM: dts: sun8i: h3: orangepi-plus: Fix ethernet phy-mode
    3199ff7b9f54 memory: pl353: Fix error return code in pl353_smc_probe()
    fc7a8347ce49 reset: brcmstb: Add missing MODULE_DEVICE_TABLE
    3f526ea670d8 memory: atmel-ebi: add missing of_node_put for loop iteration
    84fa4a10631a memory: stm32-fmc2-ebi: add missing of_node_put for loop iteration
    c385d93c3c1a ARM: dts: exynos: fix PWM LED max brightness on Odroid XU4
    b7016870feea ARM: dts: exynos: fix PWM LED max brightness on Odroid HC1
    640105e7c08d ARM: dts: exynos: fix PWM LED max brightness on Odroid XU/XU3
    6870bc426796 ARM: exynos: add missing of_node_put for loop iteration
    85dd41383b36 reset: a10sr: add missing of_match_table reference
    685ec4c0f27c reset: RESET_INTEL_GW should depend on X86
    2ca912471db4 reset: RESET_BRCMSTB_RESCAL should depend on ARCH_BRCMSTB
    f75cec5c2048 ARM: dts: gemini-rut1xx: remove duplicate ethernet node
    f11508ecc696 hexagon: use common DISCARDS macro
    f7121692795c hexagon: handle {,SOFT}IRQENTRY_TEXT in linker script
    4aa17d058a9b NFSv4/pNFS: Don't call _nfs4_pnfs_v3_ds_connect multiple times
    885c0cc2acfe NFSv4/pnfs: Fix layoutget behaviour after invalidation
    a668a77e6aed NFSv4/pnfs: Fix the layout barrier update
    6ccccc03f87a vdpa/mlx5: Clear vq ready indication upon device reset
    0e5f204ea595 ALSA: isa: Fix error return code in snd_cmi8330_probe()
    6612c412336c nfsd: Reduce contention for the nfsd_file nf_rwsem
    89047f0089cd nvme-tcp: can't set sk_user_data without write_lock
    4b3fd33f580f virtio_net: move tx vq operation under tx queue lock
    8795692f0d6c vdpa/mlx5: Fix possible failure in umem size calculation
    63272b1ffdb0 vdpa/mlx5: Fix umem sizes assignments on VQ create
    e22051e7c9f7 PCI: tegra194: Fix tegra_pcie_ep_raise_msi_irq() ill-defined shift
    527bb29eb183 pwm: imx1: Don't disable clocks at device remove time
    12d84de59da0 PCI: intel-gw: Fix INTx enable
    b5859dacd29e x86/fpu: Limit xstate copy size in xstateregs_set()
    07b760a79170 x86/fpu: Fix copy_xstate_to_kernel() gap handling
    aa7fccd383de f2fs: fix to avoid adding tab before doc section
    607caa080119 PCI: iproc: Support multi-MSI only on uniprocessor kernel
    54dc6fcce3de PCI: iproc: Fix multi-MSI base vector number allocation
    ac2e498ab222 ubifs: Set/Clear I_LINKABLE under i_lock for whiteout inode
    4b515308ab87 nfs: fix acl memory leak of posix_acl_create()
    b8eace7d3b9c SUNRPC: prevent port reuse on transports which don't request it.
    5577eece796f watchdog: jz4740: Fix return value check in jz4740_wdt_probe()
    3b93d520ac53 watchdog: aspeed: fix hardware timeout calculation
    412ef737be65 ubifs: journal: Fix error return code in ubifs_jnl_write_inode()
    6bcc0590cb91 ubifs: Fix off-by-one error
    aab881d7f074 um: fix error return code in winch_tramp()
    9bb3f31b25b2 um: fix error return code in slip_open()
    0bfb6d49497c misc: alcor_pci: fix inverted branch condition
    5c7ef8a37055 NFSv4: Fix an Oops in pnfs_mark_request_commit() when doing O_DIRECT
    ff4023d01942 NFSv4: Initialise connection to the server in nfs4_alloc_client()
    36291fd6279f power: supply: rt5033_battery: Fix device tree enumeration
    ae56850d3657 PCI/sysfs: Fix dsm_label_utf16s_to_utf8s() buffer overrun
    6594d0aa1c22 remoteproc: k3-r5: Fix an error message
    d3c150978ead f2fs: compress: fix to disallow temp extension
    43cefd126450 f2fs: add MODULE_SOFTDEP to ensure crc32 is included in the initramfs
    74569cb9ed7b x86/signal: Detect and prevent an alternate signal stack overflow
    f0e905df68d6 NFSD: Fix TP_printk() format specifier in nfsd_clid_class
    2830dd2faa53 f2fs: atgc: fix to set default age threshold
    f6ec306b93dc virtio_console: Assure used length from device is limited
    09a94a89d74f virtio_net: Fix error handling in virtnet_restore()
    cd24da0db9f7 virtio-blk: Fix memory leak among suspend/resume procedure
    d420b1166643 PCI: rockchip: Register IRQ handlers after device and data are ready
    424fc30298cb ACPI: video: Add quirk for the Dell Vostro 3350
    4f2b140658cd ACPI: AMBA: Fix resource name in /proc/iomem
    9dcc9ad34348 pwm: tegra: Don't modify HW state in .remove callback
    3d82361abd03 pwm: img: Fix PM reference leak in img_pwm_enable()
    b3205768cd1a drm/amdkfd: fix sysfs kobj leak
    687875fa9c3b power: supply: ab8500: add missing MODULE_DEVICE_TABLE
    e88d524c662b power: supply: charger-manager: add missing MODULE_DEVICE_TABLE
    89786fbc4d1e NFS: nfs_find_open_context() may only select open files
    0fedfa72aedc drm/gma500: Add the missed drm_gem_object_put() in psb_user_framebuffer_create()
    59d912fe9bb9 ceph: remove bogus checks and WARN_ONs from ceph_set_page_dirty
    3c586f825576 orangefs: fix orangefs df output.
    6e43cdcbb715 PCI: tegra: Add missing MODULE_DEVICE_TABLE
    2df1abffc474 remoteproc: core: Fix cdev remove and rproc del
    f3a56cd3eaf6 x86/fpu: Return proper error codes from user access functions
    39ed17de8c6f watchdog: iTCO_wdt: Account for rebooting on second timeout
    9cc9f5de281b watchdog: imx_sc_wdt: fix pretimeout
    66ba9cf929b1 watchdog: Fix possible use-after-free by calling del_timer_sync()
    a173e3b62cf6 watchdog: sc520_wdt: Fix possible use-after-free in wdt_turnoff()
    a397cb4576fc watchdog: Fix possible use-after-free in wdt_startup()
    96c0bf09125e PCI: pciehp: Ignore Link Down/Up caused by DPC
    497064740406 NFSv4: Fix delegation return in cases where we have to retry
    b05c555c8d4d PCI/P2PDMA: Avoid pci_get_slot(), which may sleep
    8e3f27bb7fdd ARM: 9087/1: kprobes: test-thumb: fix for LLVM_IAS=1
    9d829ca43b08 power: reset: gpio-poweroff: add missing MODULE_DEVICE_TABLE
    efc6443c1abe power: supply: max17042: Do not enforce (incorrect) interrupt trigger type
    7667cdc4b7e8 PCI: hv: Fix a race condition when removing the device
    14016c172820 power: supply: ab8500: Avoid NULL pointers
    0df49cdc7c15 PCI: ftpci100: Rename macro name collision
    e133435232ed pwm: spear: Don't modify HW state in .remove callback
    15a19c5a9292 power: supply: sc2731_charger: Add missing MODULE_DEVICE_TABLE
    d7897890bade power: supply: sc27xx: Add missing MODULE_DEVICE_TABLE
    6ed9f9899b66 kcov: add __no_sanitize_coverage to fix noinstr for all architectures
    ff53dfb32349 lib/decompress_unlz4.c: correctly handle zero-padding around initrds.
    b85b43c3e4b8 phy: intel: Fix for warnings due to EMMC clock 175Mhz change in FIP
    a9d986be494e i2c: core: Disable client irq on reboot/shutdown
    9c6c65704719 intel_th: Wait until port is in reset before programming it
    45f1de1fff2b staging: rtl8723bs: fix macro value for 2.4Ghz only device
    1f577093c843 leds: turris-omnia: add missing MODULE_DEVICE_TABLE
    ff8f11860e43 ALSA: firewire-motu: fix detection for S/PDIF source on optical interface in v2 protocol
    9ada4baae639 ALSA: usb-audio: scarlett2: Fix 6i6 Gen 2 line out descriptions
    fb7c8bfa2e3c ALSA: hda: Add IRQ check for platform_get_irq()
    63c49cfa2f0c backlight: lm3630a: Fix return code of .update_status() callback
    719c45a41cdb ASoC: Intel: kbl_da7219_max98357a: shrink platform_id below 20 characters
    692e16958f48 powerpc/boot: Fixup device-tree on little endian
    b41cb0e4af0b usb: gadget: hid: fix error return code in hid_bind()
    309b44d31667 usb: gadget: f_hid: fix endianness issue with descriptors
    16668cc65601 ALSA: usb-audio: scarlett2: Fix scarlett2_*_ctl_put() return values
    3005d48b40e5 ALSA: usb-audio: scarlett2: Fix data_mutex lock
    8f075c61ea8d ALSA: usb-audio: scarlett2: Fix 18i8 Gen 2 PCM Input count
    3b7bd795cbef ALSA: bebob: add support for ToneWeal FW66
    90cd79aa9ac7 Input: hideep - fix the uninitialized use in hideep_nvm_unlock()
    a50b56ffc0c8 s390/mem_detect: fix tprot() program check new psw handling
    7e1e0235b3db s390/mem_detect: fix diag260() program check new psw handling
    c25be19aa957 s390/ipl_parm: fix program check new psw handling
    3794633dfdd8 s390/processor: always inline stap() and __load_psw_mask()
    f22649cf90c3 habanalabs: remove node from list before freeing the node
    25ddb0a42f3a habanalabs/gaudi: set the correct cpu_id on MME2_QM failure
    3dd2a9daa765 ASoC: soc-core: Fix the error return code in snd_soc_of_parse_audio_routing()
    8e18158ea787 powerpc/mm/book3s64: Fix possible build error
    ed0b4b56a922 gpio: pca953x: Add support for the On Semi pca9655
    b7f4423c7de8 selftests/powerpc: Fix "no_handler" EBB selftest
    c7f2112e7ada ALSA: ppc: fix error return code in snd_pmac_probe()
    1004c52e3c51 scsi: storvsc: Correctly handle multiple flags in srb_status
    b3d3a2466e74 gpio: zynq: Check return value of irq_get_irq_data
    3d2b0818daa4 gpio: zynq: Check return value of pm_runtime_get_sync
    71f8d7fbfe8e ASoC: soc-pcm: fix the return value in dpcm_apply_symmetry()
    43d1aaa1965f iommu/arm-smmu: Fix arm_smmu_device refcount leak in address translation
    c4007596fbda iommu/arm-smmu: Fix arm_smmu_device refcount leak when arm_smmu_rpm_get fails
    f8763ab3fb86 powerpc/ps3: Add dma_mask to ps3_dma_region
    0e54f8ee6bff ALSA: sb: Fix potential double-free of CSP mixer elements
    52d242f2bffe selftests: timers: rtcpie: skip test if default RTC device does not exist
    7b18f26d8277 s390: disable SSP when needed
    78cddc9aa6be s390/sclp_vt220: fix console name to match device
    2f4e7363a998 serial: tty: uartlite: fix console setup
    dc9db4629210 fsi: Add missing MODULE_DEVICE_TABLE
    0c67c2e20366 ASoC: img: Fix PM reference leak in img_i2s_in_probe()
    af8b891cd339 mfd: cpcap: Fix cpcap dmamask not set warnings
    d339f6a0d1a1 mfd: da9052/stmpe: Add and modify MODULE_DEVICE_TABLE
    5dd2955565e8 scsi: qedi: Fix cleanup session block/unblock use
    6f36afa1550a scsi: qedi: Fix TMF session block/unblock use
    57fa983ea736 scsi: qedi: Fix race during abort timeouts
    afa1c8ee7e63 scsi: qedi: Fix null ref during abort handling
    fa7adae4b577 scsi: iscsi: Fix shost->max_id use
    89812e7957ab scsi: iscsi: Fix conn use after free during resets
    21962a5dd6b4 scsi: iscsi: Add iscsi_cls_conn refcount helpers
    5ac2428f2b96 scsi: megaraid_sas: Handle missing interrupts while re-enabling IRQs
    422fb12054f4 scsi: megaraid_sas: Early detection of VD deletion through RaidMap update
    0680db6f4192 scsi: megaraid_sas: Fix resource leak in case of probe failure
    c851de0215eb fs/jfs: Fix missing error code in lmLogInit()
    7207cd708eb3 scsi: scsi_dh_alua: Check for negative result value
    6bad74b2b49f scsi: core: Fixup calling convention for scsi_mode_sense()
    b4fd2ab0a91b scsi: mpt3sas: Fix deadlock while cancelling the running firmware event
    7a80f71601af tty: serial: 8250: serial_cs: Fix a memory leak in error handling path
    75452cc77668 ALSA: ac97: fix PM reference leak in ac97_bus_remove()
    664695a75468 scsi: core: Cap scsi_host cmd_per_lun at can_queue
    21d8b90cec7e scsi: lpfc: Fix crash when lpfc_sli4_hba_setup() fails to initialize the SGLs
    2626d5ed6b5c scsi: lpfc: Fix "Unexpected timeout" error in direct attach topology
    bb1d1c214948 scsi: hisi_sas: Propagate errors in interrupt_init_v1_hw()
    024550409022 scsi: arcmsr: Fix doorbell status being updated late on ARC-1886
    20c62caf2eaf w1: ds2438: fixing bug that would always get page0
    8e8d910e9a3a usb: common: usb-conn-gpio: fix NULL pointer dereference of charger
    b30a115e4af5 Revert "ALSA: bebob/oxfw: fix Kconfig entry for Mackie d.2 Pro"
    7d7f30cf182e ALSA: usx2y: Don't call free_pages_exact() with NULL address
    f4997bf6c448 ALSA: usx2y: Avoid camelCase
    1b1d6aa1a8cf iio: magn: bmc150: Balance runtime pm + use pm_runtime_resume_and_get()
    5ecb0acc45e8 iio: gyro: fxa21002c: Balance runtime pm + use pm_runtime_resume_and_get().
    5f69841c220a partitions: msdos: fix one-byte get_unaligned()
    a8c3d1a515b9 ASoC: intel/boards: add missing MODULE_DEVICE_TABLE
    58f69684ba03 misc: alcor_pci: fix null-ptr-deref when there is no PCI bridge
    b9c87ce3bc63 misc/libmasm/module: Fix two use after free in ibmasm_init_one
    4f3c807739e3 serial: fsl_lpuart: disable DMA for console and fix sysrq
    6942fbc00981 tty: serial: fsl_lpuart: fix the potential risk of division or modulo by zero
    35a35909ec19 rcu: Reject RCU_LOCKDEP_WARN() false positives
    23597afbe096 srcu: Fix broken node geometry after early ssp init
    4d395142d96f scsi: arcmsr: Fix the wrong CDB payload report to IOP
    22d22fef9cbc dmaengine: fsl-qdma: check dma_set_mask return value
    32064330708b ASoC: Intel: sof_sdw: add mutual exclusion between PCH DMIC and RT715
    164a3880a76a leds: tlc591xx: fix return value check in tlc591xx_probe()
    9ebcc60565f2 net: bridge: multicast: fix MRD advertisement router port marking race
    664cc645bdd8 net: bridge: multicast: fix PIM hello router port marking race
    b3aea76efe90 Revert "drm/ast: Remove reference to struct drm_device.pdev"
    b3f8120039d5 drm/ingenic: Switch IPU plane to type OVERLAY
    8f6dcc4dd731 drm/ingenic: Fix non-OSD mode
    cae871baa4f3 drm/dp_mst: Add missing drm parameters to recently added call to drm_dbg_kms()
    16fb4e9c39b9 drm/dp_mst: Avoid to mess up payload table by ports in stale topology
    3462bc8b1a1f drm/dp_mst: Do not set proposed vcpi directly
    087bff9acd2e fbmem: Do not delete the mode that is still in use
    811763e3beb6 cgroup: verify that source is a string
    0728df804806 drm/i915/gt: Fix -EDEADLK handling regression
    81dd2d60f677 drm/i915/gtt: drop the page table optimisation
    905169794d9c tracing: Do not reference char * as a string in histograms
    e1261c7a846e scsi: zfcp: Report port fc_security as unknown early during remote cable pull
    ea518b70ed5e scsi: core: Fix bad pointer dereference when ehandler kthread is invalid
    8b2ae2de536c KVM: X86: Disable hardware breakpoints unconditionally before kvm_x86->run()
    bedc5d091138 KVM: nSVM: Check the value written to MSR_VM_HSAVE_PA
    5b779e597cb7 KVM: x86/mmu: Do not apply HPA (memory encryption) mask to GPAs
    1a1a5e440953 KVM: x86: Use guest MAXPHYADDR from CPUID.0x8000_0008 iff TDP is enabled
    679837dc0aba KVM: mmio: Fix use-after-free Read in kvm_vm_ioctl_unregister_coalesced_mmio
    72797ffca1bd cifs: handle reconnect of tcon when there is no cached dfs referral
    b93f9499427c certs: add 'x509_revocation_list' to gitignore
    f68261346518 Linux 5.10.51
    86786603014e f2fs: fix to avoid racing on fsync_entry_slab by multi filesystem instances
    5e4f5138bd85 ext4: fix memory leak in ext4_fill_super
    3780348c1a0e smackfs: restrict bytes count in smk_set_cipso()
    801893695036 jfs: fix GPF in diFree
    fcb041ca5c77 drm/ast: Remove reference to struct drm_device.pdev
    3785f3c1e3c7 pinctrl: mcp23s08: Fix missing unlock on error in mcp23s08_irq()
    b716ccffbc8d dm writecache: write at least 4k when committing
    090588059c30 io_uring: fix clear IORING_SETUP_R_DISABLED in wrong function
    aa57b2d6b37e media: uvcvideo: Fix pixel format change for Elgato Cam Link 4K
    31874b6b63dd media: gspca/sunplus: fix zero-length control requests
    de95c0bd797a media: gspca/sq905: fix control-request direction
    c57bfd8000d7 media: zr364xx: fix memory leak in zr364xx_start_readpipe
    dbd58d397844 media: dtv5100: fix control-request directions
    db317a37229b media: subdev: disallow ioctl for saa6588/davinci
    e2c1218ddc5f PCI: aardvark: Implement workaround for the readback value of VEND_ID
    130919708990 PCI: aardvark: Fix checking for PIO Non-posted Request
    f147115018aa PCI: Leave Apple Thunderbolt controllers on for s2idle or standby
    ba47e65a5de3 dm btree remove: assign new_root only when removal succeeds
    1b5918b087b1 dm writecache: flush origin device when writing and cache is full
    cbc03ffec260 dm zoned: check zone capacity
    35c1c4bd2d59 coresight: tmc-etf: Fix global-out-of-bounds in tmc_update_etf_buffer()
    048624ad564c coresight: Propagate symlink failure
    0c2bc1489104 ipack/carriers/tpci200: Fix a double free in tpci200_pci_probe
    eb81b5a37dc5 tracing: Resize tgid_map to pid_max, not PID_MAX_DEFAULT
    3cda5b7f4e29 tracing: Simplify & fix saved_tgids logic
    8cc58a6e2c39 rq-qos: fix missed wake-ups in rq_qos_throttle try two
    f9fb4986f4d8 seq_buf: Fix overflow in seq_buf_putmem_hex()
    418b333afbd5 extcon: intel-mrfld: Sync hardware and software state on init
    af092ec16e06 selftests/lkdtm: Fix expected text for CR4 pinning
    0af643fa7e74 lkdtm/bugs: XFAIL UNALIGNED_LOAD_STORE_WRITE
    baedb1f5a08c nvmem: core: add a missing of_node_put
    f0a079c0ba87 mfd: syscon: Free the allocated name field of struct regmap_config
    a8a2e506ea2f power: supply: ab8500: Fix an old bug
    38dde03eb239 ubifs: Fix races between xattr_{set|get} and listxattr operations
    690a11fb4e9f thermal/drivers/int340x/processor_thermal: Fix tcc setting
    ef5066f95c15 ipmi/watchdog: Stop watchdog timer when the current action is 'none'
    7ade84f8df8f qemu_fw_cfg: Make fw_cfg_rev_attr a proper kobj_attribute
    02671eda9ab9 i40e: fix PTP on 5Gb links
    ab9d7c5fc9c6 ASoC: tegra: Set driver_name=tegra for all machine drivers
    e0d9beb44abd fpga: stratix10-soc: Add missing fpga_mgr_free() call
    5a5ebf5d4822 clocksource/arm_arch_timer: Improve Allwinner A64 timer workaround
    b5e26be407e6 cpu/hotplug: Cure the cpusets trainwreck
    a11a457820fb arm64: tlb: fix the TTL value of tlb_get_level
    0afa6ad0c49a ata: ahci_sunxi: Disable DIPM
    5543f61e2e0c mmc: core: Allow UHS-I voltage switch for SDSC cards if supported
    b53b0ca4a4ec mmc: core: clear flags before allowing to retune
    658f58189a4f mmc: sdhci: Fix warning message when accessing RPMB in HS400 mode
    5ced01c0e855 mmc: sdhci-acpi: Disable write protect detection on Toshiba Encore 2 WT8-B
    3f9c2a058e61 drm/i915/display: Do not zero past infoframes.vsc
    8abf5eec0ebd drm/nouveau: Don't set allow_fb_modifiers explicitly
    42a333ea4b4f drm/arm/malidp: Always list modifiers
    0bcc074f90d2 drm/msm/mdp4: Fix modifier support enabling
    4d61ddd74041 drm/tegra: Don't set allow_fb_modifiers explicitly
    c6016936171a drm/amd/display: Reject non-zero src_y and src_x for video planes
    7d3053889400 pinctrl/amd: Add device HID for new AMD GPIO controller
    b13574fa83ac drm/amd/display: fix incorrrect valid irq check
    3c8216b3503a drm/rockchip: dsi: remove extra component_del() call
    2998599fb16c drm/dp: Handle zeroed port counts in drm_dp_read_downstream_info()
    98bd09d928b3 drm/vc4: hdmi: Prevent clock unbalance
    a2b8835cb4d1 drm/vc4: crtc: Skip the TXP
    293e520d2043 drm/vc4: txp: Properly set the possible_crtcs mask
    0d50d93d05d6 drm/radeon: Call radeon_suspend_kms() in radeon_pci_shutdown() for Loongson64
    7aa28f2f6742 drm/radeon: Add the missed drm_gem_object_put() in radeon_user_framebuffer_create()
    2674ffcad0ae drm/amdgpu: enable sdma0 tmz for Raven/Renoir(V2)
    8f933b27cbf1 drm/amdgpu: Update NV SIMD-per-CU to 2
    97ebbfe445cd powerpc/powernv/vas: Release reference to tgid during window close
    a024e88f8ab7 powerpc/barrier: Avoid collision with clang's __lwsync macro
    d2e52d466409 powerpc/mm: Fix lockup on kernel exec fault
    4ad382bc4abc scsi: iscsi: Fix iSCSI cls conn state
    221b7e1e76fb scsi: iscsi: Fix race condition between login and sync thread
    907318883508 io_uring: convert io_buffer_idr to XArray
    c5a50a220a41 io_uring: Convert personality_idr to XArray
    cb2985feb118 io_uring: simplify io_remove_personalities()
    7d4f96158852 mm,hwpoison: return -EBUSY when migration fails
    fd6625a1ec40 loop: fix I/O error on fsync() in detached loop devices
    88f0bc830c52 arm64: dts: rockchip: Enable USB3 for rk3328 Rock64
    421aff50af5e arm64: dts: rockchip: add rk3328 dwc3 usb controller node
    8eb12fa96bc5 ath11k: unlock on error path in ath11k_mac_op_add_interface()
    9706c5343346 MIPS: MT extensions are not available on MIPS32r1
    6cf2e905b1a0 selftests/resctrl: Fix incorrect parsing of option "-t"
    10f8fca6761b MIPS: set mips32r5 for virt extensions
    ff4762bcb95e MIPS: loongsoon64: Reserve memory below starting pfn to prevent Oops
    6ef81a5c0e22 sctp: add size validation when walking chunks
    d4dbef7046e2 sctp: validate from_addr_param return
    e83f312114a0 flow_offload: action should not be NULL when it is referenced
    a61af0114118 bpf: Fix false positive kmemleak report in bpf_ringbuf_area_alloc()
    20285dc2711c sched/fair: Ensure _sum and _avg values stay consistent
    e2296a4365f2 Bluetooth: btusb: fix bt fiwmare downloading failure issue for qca btsoc.
    8d7a3989c14d Bluetooth: mgmt: Fix the command returns garbage parameter value
    05298f1733c6 Bluetooth: btusb: Add support USB ALT 3 for WBS
    cc49ab24ec37 Bluetooth: L2CAP: Fix invalid access on ECRED Connection response
    79a313086426 Bluetooth: L2CAP: Fix invalid access if ECRED Reconfigure fails
    c4a9967e4d09 Bluetooth: btusb: Add a new QCA_ROME device (0cf3:e500)
    60789afc02f5 Bluetooth: Shutdown controller after workqueues are flushed or cancelled
    5147d86c4a5b Bluetooth: Fix alt settings for incoming SCO with transparent coding format
    8f939b4c2563 Bluetooth: Fix the HCI to MGMT status conversion table
    5f5f8022c1aa Bluetooth: btusb: Fixed too many in-token issue for Mediatek Chip.
    3d08b5917984 RDMA/cma: Fix rdma_resolve_route() memory leak
    a8585fdf42b5 net: ip: avoid OOM kills with large UDP sends over loopback
    04177aa99a93 media, bpf: Do not copy more entries than user space requested
    d8bb134d808c IB/isert: Align target max I/O size to initiator size
    d330f5f8dff7 mac80211_hwsim: add concurrent channels scanning support over virtio
    97f067722669 mac80211: consider per-CPU statistics if present
    1b728869a134 cfg80211: fix default HE tx bitrate mask in 2G band
    0a7ba5d373f1 wireless: wext-spy: Fix out-of-bounds warning
    c1ad55b6a1f4 sfc: error code if SRIOV cannot be disabled
    1013dc896d99 sfc: avoid double pci_remove of VFs
    7cd6986f2de5 iwlwifi: pcie: fix context info freeing
    b98ec6d8b34d iwlwifi: pcie: free IML DMA memory allocation
    78eadadff3d1 iwlwifi: mvm: fix error print when session protection ends
    1e1bb1efd60e iwlwifi: mvm: don't change band on bound PHY contexts
    1df36030393a RDMA/rxe: Don't overwrite errno from ib_umem_get()
    ee33c042f492 vsock: notify server to shutdown when client has pending signal
    38bc2ebf344c atm: nicstar: register the interrupt handler in the right place
    90efb7f1006a atm: nicstar: use 'dma_free_coherent' instead of 'kfree'
    1d304c7ddd36 net: fec: add ndo_select_queue to fix TX bandwidth fluctuations
    c7a31ae63e2c MIPS: add PMD table accounting into MIPS'pmd_alloc_one
    50ce920fe113 rtl8xxxu: Fix device info for RTL8192EU devices
    a10e871b73b4 mt76: mt7915: fix IEEE80211_HE_PHY_CAP7_MAX_NC for station mode
    4cd713e48c27 drm/amdkfd: Walk through list with dqm lock hold
    a2122e079204 drm/amdgpu: fix bad address translation for sienna_cichlid
    932be4cf2ba2 io_uring: fix false WARN_ONCE
    92a9fb51e5ec net: sched: fix error return code in tcf_del_walker()
    d2801d111829 net: ipa: Add missing of_node_put() in ipa_firmware_load()
    5cc0cf735f13 net: fix mistake path for netdev_features_strings
    891db094a0aa mt76: mt7615: fix fixed-rate tx status reporting
    090b06b25afe ice: mark PTYPE 2 as reserved
    b88a90783043 ice: fix incorrect payload indicator on PTYPE
    2e66c36f1308 bpf: Fix up register-based shifts in interpreter to silence KUBSAN
    0e72b151e394 drm/amdkfd: Fix circular lock in nocpsch path
    cd29db48bb65 drm/amdkfd: fix circular locking on get_wave_state
    9d21abc8fd20 cw1200: add missing MODULE_DEVICE_TABLE
    c5e4a10d7bd5 wl1251: Fix possible buffer overflow in wl1251_cmd_scan
    5a3d373c4a33 wlcore/wl12xx: Fix wl12xx get_mac error if device is in ELP
    ad7083a95d8a dm writecache: commit just one block, not a full page
    57f7ed25bd16 xfrm: Fix error reporting in xfrm_state_construct.
    a5f8862967c4 drm/amd/display: Verify Gamma & Degamma LUT sizes in amdgpu_dm_atomic_check
    db3c3643d55e r8169: avoid link-up interrupt issue on RTL8106e if user enables ASPM
    f38371821c25 selinux: use __GFP_NOWARN with GFP_NOWAIT in the AVC
    0a244be95bca fjes: check return value after calling platform_get_resource()
    378c156f9dd0 drm/amdkfd: use allowed domain for vmbo validation
    fb3b4bcdd3bc net: sgi: ioc3-eth: check return value after calling platform_get_resource()
    e613f67f1b51 selftests: Clean forgotten resources as part of cleanup()
    8a4318c14ace net: phy: realtek: add delay to fix RXC generation issue
    c71de31b2e0f drm/amd/display: Fix off-by-one error in DML
    afa06442d23d drm/amd/display: Set DISPCLK_MAX_ERRDET_CYCLES to 7
    02f444321b3a drm/amd/display: Release MST resources on switch from MST to SST
    01d6a6931965 drm/amd/display: Update scaling settings on modeset
    57c63b47d6f1 drm/amd/display: Fix DCN 3.01 DSCCLK validation
    8e4da401425b net: moxa: Use devm_platform_get_and_ioremap_resource()
    278dc34b7112 net: micrel: check return value after calling platform_get_resource()
    ce1307ec621b net: mvpp2: check return value after calling platform_get_resource()
    49b3a7f38a9b net: bcmgenet: check return value after calling platform_get_resource()
    92820a12823e net: mscc: ocelot: check return value after calling platform_get_resource()
    f3b96f4b6b2d virtio_net: Remove BUG() to avoid machine dead
    87c39048ec7f ice: fix clang warning regarding deadcode.DeadStores
    e352556acef9 ice: set the value of global config lock timeout longer
    b5f2982e0609 pinctrl: mcp23s08: fix race condition in irq handler
    a4a86400c68c net: bridge: mrp: Update ring transitions.
    cc4f0a9d5aa1 dm: Fix dm_accept_partial_bio() relative to zone management commands
    939f750215b8 dm writecache: don't split bios when overwriting contiguous cache content
    65e780667cf3 dm space maps: don't reset space map allocation cursor when committing
    313d9f25804c RDMA/cxgb4: Fix missing error code in create_qp()
    f9c67c179e3b net: tcp better handling of reordering then loss cases
    8fa6473a61ec drm/amdgpu: remove unsafe optimization to drop preamble ib
    c5b518f4b98d drm/amd/display: Avoid HDCP over-read and corruption
    3c172f6e444b MIPS: ingenic: Select CPU_SUPPORTS_CPUFREQ && MIPS_EXTERNAL_TIMER
    0903ac8f09c6 MIPS: cpu-probe: Fix FPU detection on Ingenic JZ4760(B)
    8f939b795797 ipv6: use prandom_u32() for ID generation
    c92298d228f6 virtio-net: Add validation for used length
    5e039a80a76b drm: bridge: cdns-mhdp8546: Fix PM reference leak in
    d1eaf4cb4408 clk: tegra: Ensure that PLLU configuration is applied properly
    dc5bacea9462 clk: tegra: Fix refcounting of gate clocks
    315988817aa7 RDMA/rtrs: Change MAX_SESS_QUEUE_DEPTH
    4f6a0f31c627 net: stmmac: the XPCS obscures a potential "PHY not found" error
    a7d608bb786c drm: rockchip: add missing registers for RK3066
    d89ea206e99c drm: rockchip: add missing registers for RK3188
    e54b4a534845 net/mlx5: Fix lag port remapping logic
    62137d1ae5f8 net/mlx5e: IPsec/rep_tc: Fix rep_tc_update_skb drops IPsec packet
    219150485d73 clk: renesas: r8a77995: Add ZA2 clock
    0680344d7131 drm/bridge: cdns: Fix PM reference leak in cdns_dsi_transfer()
    95f8ce9f18cb igb: fix assignment on big endian machines
    66d593aa3aea igb: handle vlan types with checker enabled
    ffb865715a0f e100: handle eeprom as little endian
    f06ea024c176 drm/vc4: hdmi: Fix PM reference leak in vc4_hdmi_encoder_pre_crtc_co()
    48c96d5bacc0 drm/vc4: Fix clock source for VEC PixelValve on BCM2711
    21bf1414580c udf: Fix NULL pointer dereference in udf_symlink function
    0687411e2a88 drm/sched: Avoid data corruptions
    5ed8c298b2e1 drm/scheduler: Fix hang when sched_entity released
    73ac001f060b pinctrl: equilibrium: Add missing MODULE_DEVICE_TABLE
    1b832bd77799 net/sched: cls_api: increase max_reclassify_loop
    6ceb0182b087 net: mdio: provide shim implementation of devm_of_mdiobus_register
    d2d17ca924f4 drm/virtio: Fix double free on probe failure
    69a71b59b18c reiserfs: add check for invalid 1st journal block
    c5073100dc4f drm/bridge: lt9611: Add missing MODULE_DEVICE_TABLE
    b5713dac1916 net: mdio: ipq8064: add regmap config to disable REGCACHE
    c0dd36bcb67f drm/mediatek: Fix PM reference leak in mtk_crtc_ddp_hw_init()
    3393405257ed net: Treat __napi_schedule_irqoff() as __napi_schedule() on PREEMPT_RT
    a7f7c42e3115 atm: nicstar: Fix possible use-after-free in nicstar_cleanup()
    b7ee9ae1e0cf mISDN: fix possible use-after-free in HFC_cleanup()
    e759ff76ebbb atm: iphase: fix possible use-after-free in ia_module_exit()
    2292d9691ce9 hugetlb: clear huge pte during flush function on mips platform
    a74872106e78 clk: renesas: rcar-usb2-clock-sel: Fix error handling in .probe()
    3ca86d44b902 drm/amd/display: fix use_max_lb flag for 420 pixel formats
    5953b984c3e4 net: pch_gbe: Use proper accessors to BE data in pch_ptp_match()
    fb960728f8f1 drm/bridge: nwl-dsi: Force a full modeset when crtc_state->active is changed to be true
    796554d3d68f drm/vc4: fix argument ordering in vc4_crtc_get_margins()
    b025bc07c947 drm/amd/amdgpu/sriov disable all ip hw status by default
    fb7479d64d77 drm/amd/display: fix HDCP reset sequence on reinitialize
    d055669e669a drm/ast: Fixed CVE for DP501
    95c3133bc8eb drm/zte: Don't select DRM_KMS_FB_HELPER
    b60ae0fab550 drm/mxsfb: Don't select DRM_KMS_FB_HELPER

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9cec9a92c3e8451d1b9875e97e63c24543a6f787)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 1d5cd23bf5..133b1f6fe3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8185fa4151aa2a85f022120557b4dd521a96593e"
-SRCREV_meta ?= "44498529cd41b235e527c48e48272d9af64fdf7d"
+SRCREV_machine ?= "dad5434fab65cdd316f940c5e9bd46e0d0607b5a"
+SRCREV_meta ?= "c3900f83a5679b563adff82c24fdeb02096ed736"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.50"
+LINUX_VERSION ?= "5.10.52"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 7ef9de45d7..238123a42f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.50"
+LINUX_VERSION ?= "5.10.52"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "57b63241fa9ac731bc3ea6b0bb816a55196edd96"
-SRCREV_machine ?= "5b5bdf7d435d62fbab15eb66881dc43445f2778c"
-SRCREV_meta ?= "44498529cd41b235e527c48e48272d9af64fdf7d"
+SRCREV_machine_qemuarm ?= "faa3b7802d0ee1fe0217283ecaf2c54c9503fa20"
+SRCREV_machine ?= "240422889570d39c3f7d63808159c8e743117a1d"
+SRCREV_meta ?= "c3900f83a5679b563adff82c24fdeb02096ed736"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 1af77e7c4e..40a2a5e3b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ac3dc3fddbea1db1d6cde9681b408f4d04541951"
-SRCREV_machine_qemuarm64 ?= "de7626dcc41204d22682fa5c424c4bddd587ee97"
-SRCREV_machine_qemumips ?= "ab2cde78ab5c1def7ab03d21c8986c794c6f69ce"
-SRCREV_machine_qemuppc ?= "d9a946c583b56ccdcf4ccd228d64129138e698e6"
-SRCREV_machine_qemuriscv64 ?= "3d78eb65b99aa6a6aaaf4de890b262f4dcb88623"
-SRCREV_machine_qemuriscv32 ?= "3d78eb65b99aa6a6aaaf4de890b262f4dcb88623"
-SRCREV_machine_qemux86 ?= "3d78eb65b99aa6a6aaaf4de890b262f4dcb88623"
-SRCREV_machine_qemux86-64 ?= "3d78eb65b99aa6a6aaaf4de890b262f4dcb88623"
-SRCREV_machine_qemumips64 ?= "793a200e51c176cad7416603b995c2ec30d6ddde"
-SRCREV_machine ?= "3d78eb65b99aa6a6aaaf4de890b262f4dcb88623"
-SRCREV_meta ?= "44498529cd41b235e527c48e48272d9af64fdf7d"
+SRCREV_machine_qemuarm ?= "96a6083817785461bcabad63f3872d0a08b21c29"
+SRCREV_machine_qemuarm64 ?= "c8d8b20a749f476020d0844d76f63cd9e4cca644"
+SRCREV_machine_qemumips ?= "acdebd5080a846f3906ba1d5343d5af5c4b76522"
+SRCREV_machine_qemuppc ?= "afd31d567447f4693b7c9af35f09bb37cc0c0fa4"
+SRCREV_machine_qemuriscv64 ?= "c2dc854ee7392d43728093bfc206a2ade98c76dd"
+SRCREV_machine_qemuriscv32 ?= "c2dc854ee7392d43728093bfc206a2ade98c76dd"
+SRCREV_machine_qemux86 ?= "c2dc854ee7392d43728093bfc206a2ade98c76dd"
+SRCREV_machine_qemux86-64 ?= "c2dc854ee7392d43728093bfc206a2ade98c76dd"
+SRCREV_machine_qemumips64 ?= "efad0ca4150cddffa6d052ffb53fec0553de4da8"
+SRCREV_machine ?= "c2dc854ee7392d43728093bfc206a2ade98c76dd"
+SRCREV_meta ?= "c3900f83a5679b563adff82c24fdeb02096ed736"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.50"
+LINUX_VERSION ?= "5.10.52"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.31.1

