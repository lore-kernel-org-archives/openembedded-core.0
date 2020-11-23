Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.36702.1606144038537265324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 07:07:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 5I52jg7SjeaNOmGdeo2FzYuG9NGGqvhSeTTwm+6N39PG6lc7P/w/Lv4YtECwT3QGIQz29EPqq6
 Vlki+OoV3xuw==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="235920703"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="235920703"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:20 -0800
IronPort-SDR: G5mmjirPCIJyg60v7CwX7ktrjE02Vu2GqP1K1ryZeKZ9JaPQlqFR+j2WMLgRNxvjLX2AdHyg33
 T97JWh/hy42w==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="361475195"
Received: from kpteh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.244.15])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:19 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 12/21] linux-yocto/5.4: update to v5.4.75
Date: Mon, 23 Nov 2020 23:06:42 +0800
Message-Id: <daa8aa8af31dc74ba9c916525db348a393fe4f1e.1606111370.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606111370.git.anuj.mittal@intel.com>
References: <cover.1606111370.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    6e97ed6efa70 Linux 5.4.75
    6ce4da84e5f4 staging: octeon: Drop on uncorrectable alignment or FCS error
    b869f6b67274 staging: octeon: repair "fixed-link" support
    15506ee68893 staging: comedi: cb_pcidas: Allow 2-channel commands for AO subdevice
    4d934fe936fd staging: fieldbus: anybuss: jump to correct label in an error path
    8fd792948e76 KVM: arm64: Fix AArch32 handling of DBGD{CCINT,SCRext} and DBGVCR
    4cb29cdd5043 device property: Don't clear secondary pointer for shared primary firmware node
    26086875476f device property: Keep secondary firmware node secondary by type
    e793fc391351 ARM: s3c24xx: fix missing system reset
    2937774ef43a ARM: samsung: fix PM debug build with DEBUG_LL but !MMU
    0808ca98e67e arm: dts: mt7623: add missing pause for switchport
    f3d8023e0647 hil/parisc: Disable HIL driver when it gets stuck
    81190a9efde0 cachefiles: Handle readpage error correctly
    4bf2a744a4e7 arm64: berlin: Select DW_APB_TIMER_OF
    c2313d7818b9 tty: make FONTX ioctl use the tty pointer they were actually passed
    beb5d0dfc154 drm/amd/pm: increase mclk switch threshold to 200 us
    071b3300c951 mmc: sdhci: Use Auto CMD Auto Select only when v4_mode is true
    fb4e2a67e193 mmc: sdhci-of-esdhc: set timeout to max before tuning
    b7e1a637eae9 drm/ttm: fix eviction valuable range check.
    b60edf37d5d3 ext4: fix invalid inode checksum
    ae05fdc6d60a ext4: fix error handling code in add_new_gdb
    c0de3cf2f286 ext4: fix leaking sysfs kobject after failed mount
    b11e9dd66e3a vringh: fix __vringh_iov() when riov and wiov are different
    3cfbc13ab3f0 ring-buffer: Return 0 on success from ring_buffer_resize()
    0db6e7161e33 9P: Cast to loff_t before multiplying
    51135ffbb54d libceph: clear con->out_msg on Policy::stateful_server faults
    d4fdbedef767 ceph: promote to unsigned long long before shifting
    9cdccb4761e5 drm/amd/display: Fix kernel panic by dal_gpio_open() error
    d7e22dbc662d drm/amd/display: Don't invoke kgdb_breakpoint() unconditionally
    d1628cdacfb0 drm/amdgpu: increase the reserved VM size to 2MB
    adff3a805c97 drm/amd/display: Avoid MST manager resource leak.
    1e460aa7353d drm/amdkfd: Use same SQ prefetch setting as amdgpu
    d417026c4081 drm/amdgpu: correct the gpu reset handling for job != NULL case
    9887a48d49f0 drm/amd/display: Increase timeout for DP Disable
    987d3814c92c drm/amdgpu: don't map BO in reserved region
    2c58d5e0c754 i2c: imx: Fix external abort on interrupt in exit paths
    da3ccf5b2045 rtc: rx8010: don't modify the global rtc ops
    e17afa6d1de3 ia64: fix build error with !COREDUMP
    da3bb6fa23f1 ubi: check kthread_should_stop() after the setting of task state
    6d0beeebd15d ARC: perf: redo the pct irq missing in device-tree handling
    468811595833 perf python scripting: Fix printable strings in python3 scripts
    a99cbd20a5c5 ubifs: mount_ubifs: Release authentication resource in error handling path
    9ba6324ca9c4 ubifs: Don't parse authentication mount options in remount process
    748057df47b9 ubifs: Fix a memleak after dumping authentication mount options
    bc202c839b5d ubifs: journal: Make sure to not dirty twice for auth nodes
    a77927469760 ubifs: xattr: Fix some potential memory leaks while iterating entries
    213c836b2396 ubifs: dent: Fix some potential memory leaks while iterating entries
    c1ea3c4a4302 NFSD: Add missing NFSv2 .pc_func methods
    da86bb4c214f NFSv4.2: support EXCHGID4_FLAG_SUPP_FENCE_OPS 4.2 EXCHANGE_ID flag
    c342001cab7f NFSv4: Wait for stateid updates after CLOSE/OPEN_DOWNGRADE
    415043c3ec0d powerpc: Fix undetected data corruption with P9N DD2.1 VSX CI load emulation
    94e27f13694c powerpc/powermac: Fix low_sleep_handler with KUAP and KUEP
    61ed8c1b940d powerpc/powernv/elog: Fix race while processing OPAL error log event.
    7850dd0851a3 powerpc/memhotplug: Make lmb size 64bit
    3fa03b7f21a3 powerpc: Warn about use of smt_snooze_delay
    240baebeda09 powerpc/rtas: Restrict RTAS requests from userspace
    551bf7c4bc24 s390/stp: add locking to sysfs functions
    58a7dc5f521a MIPS: DEC: Restore bootmem reservation for firmware working memory area
    73597ab2a9b9 powerpc/drmem: Make lmb_size 64 bit
    829c0a9634b9 iio:gyro:itg3200: Fix timestamp alignment and prevent data leak.
    9f4f75df4b47 iio:adc:ti-adc12138 Fix alignment issue with timestamp
    96a5134423ae iio:adc:ti-adc0832 Fix alignment issue with timestamp
    a8c59abdbc6b iio: adc: gyroadc: fix leak of device node iterator
    ad877be5b983 iio:light:si1145: Fix timestamp alignment and prevent data leak.
    a4f02a81c7e6 dmaengine: dma-jz4780: Fix race in jz4780_dma_tx_status
    f707ccb2f10c udf: Fix memory leak when mounting
    93da9dcee2d2 HID: wacom: Avoid entering wacom_wac_pen_report for pad / battery
    87d398f348b8 vt: keyboard, extend func_buf_lock to readers
    eb4c460e2e06 vt: keyboard, simplify vt_kdgkbsent
    8c16ca600657 drm/i915: Force VT'd workarounds when running as a guest OS
    94478c1dc57d usb: host: fsl-mph-dr-of: check return of dma_set_mask()
    75d0d4ff5970 usb: typec: tcpm: reset hard_reset_count for any disconnect
    543432d078c0 usb: cdc-acm: fix cooldown mechanism
    2850f148cd7f usb: dwc3: gadget: END_TRANSFER before CLEAR_STALL command
    206dcd6ce82f usb: dwc3: gadget: Resume pending requests after CLEAR_STALL
    97224cdc0440 usb: dwc3: core: don't trigger runtime pm when remove driver
    726f638e7cd1 usb: dwc3: core: add phy cleanup for probe error handling
    f935b70cf724 usb: dwc3: gadget: Check MPS of the request length
    1c9e86c933ea usb: dwc3: ep0: Fix ZLP for OUT ep0 requests
    3468cbceb563 usb: dwc3: pci: Allow Elkhart Lake to utilize DSM method for PM functionality
    2600a131e1f6 usb: xhci: Workaround for S3 issue on AMD SNPS 3.0 xHC
    c964d386e849 btrfs: fix readahead hang and use-after-free after removing a device
    dfda50e882f5 btrfs: fix use-after-free on readahead extent after failure to create it
    834a61b2123b btrfs: tree-checker: validate number of chunk stripes and parity
    1cedc54ad3d4 btrfs: cleanup cow block on error
    d3ce2d0fb8b2 btrfs: tree-checker: fix false alert caused by legacy btrfs root item
    4b82b8aba08d btrfs: use kvzalloc() to allocate clone_roots in btrfs_ioctl_send()
    6ec4b82fc322 btrfs: send, recompute reference path after orphanization of a directory
    c2dcc9b03b7f btrfs: send, orphanize first all conflicting inodes when processing references
    e1cf034899b6 btrfs: reschedule if necessary when logging directory items
    223b462744b3 btrfs: improve device scanning messages
    c5f2a5091263 btrfs: qgroup: fix wrong qgroup metadata reserve for delayed inode
    1e2f16dd611b PM: runtime: Remove link state checks in rpm_get/put_supplier()
    a0bdb5b16392 scsi: qla2xxx: Fix crash on session cleanup with unload
    f0ef0e2299f5 scsi: mptfusion: Fix null pointer dereferences in mptscsih_remove()
    3fc2cbba4069 w1: mxc_w1: Fix timeout resolution problem leading to bus error
    a034ea12bdd4 acpi-cpufreq: Honor _PSD table setting on new AMD CPUs
    7f9d9a007e59 ACPI: EC: PM: Drop ec_no_wakeup check from acpi_ec_dispatch_gpe()
    0adf4dbae9c0 ACPI: EC: PM: Flush EC work unconditionally after wakeup
    e7f52fd6e0ef PCI/ACPI: Whitelist hotplug ports for D3 if power managed by ACPI
    6341984bef17 ACPI: debug: don't allow debugging when ACPI is disabled
    1a5f62a3c694 ACPI: video: use ACPI backlight for HP 635 Notebook
    9578d7381432 ACPI / extlog: Check for RDMSR failure
    5e25b44cc2eb ACPI: button: fix handling lid state changes when input device closed
    c75b77cb9f01 NFS: fix nfs_path in case of a rename retry
    f8a6a2ed4b7d fs: Don't invalidate page buffers in block_write_full_page()
    2f3cb993a6f2 media: uvcvideo: Fix uvc_ctrl_fixup_xu_info() not having any effect
    8ac92a5e5fd7 leds: bcm6328, bcm6358: use devres LED registering function
    a908e29705ee extcon: ptn5150: Fix usage of atomic GPIO with sleeping GPIO chips
    004fb028f22c spi: sprd: Release DMA channel also on probe deferral
    d789e1c5b1ce perf/x86/amd/ibs: Fix raw sample data accumulation
    2e2a324641f9 perf/x86/amd/ibs: Don't include randomized bits in get_ibs_op_count()
    f9a48ff99961 perf/x86/intel: Fix Ice Lake event constraint table
    3674b0445b70 selftests/x86/fsgsbase: Test PTRACE_PEEKUSER for GSBASE with invalid LDT GS
    2d1c48227780 seccomp: Make duplicate listener detection non-racy
    470c8c409e1c mmc: sdhci-acpi: AMDI0040: Set SDHCI_QUIRK2_PRESET_VALUE_BROKEN
    3f56e94b6f7c mmc: sdhci: Add LTR support for some Intel BYT based controllers
    b91d4797b3da md/raid5: fix oops during stripe resizing
    a7aa5d578fed nvme-rdma: fix crash when connect rejected
    c421c082088e sgl_alloc_order: fix memory leak
    742fd49cf811 nbd: make the config put is called before the notifying the waiter
    b71dbaf08f9f ARM: dts: s5pv210: remove dedicated 'audio-subsystem' node
    3ad1464467e7 ARM: dts: s5pv210: move PMU node out of clock controller
    8a9024f6e29f ARM: dts: s5pv210: move fixed clocks under root node
    8c1b47e8aa43 ARM: dts: s5pv210: remove DMA controller bus node name to fix dtschema warnings
    c6029d9bc68d memory: emif: Remove bogus debugfs error handling
    2f98e2843b69 ARM: dts: omap4: Fix sgx clock rate for 4430
    c70f909e7ad6 arm64: dts: renesas: ulcb: add full-pwr-cycle-in-suspend into eMMC nodes
    e2dca8845c37 cifs: handle -EINTR in cifs_setattr
    3c78eb161c26 gfs2: add validation checks for size of superblock
    9f7e4bfadfe9 gfs2: use-after-free in sysfs deregistration
    9b58c55ba81c KVM: PPC: Book3S HV: Do not allocate HPT for a nested guest
    d7d7920a7f66 ext4: Detect already used quota file early
    d01b63320799 drivers: watchdog: rdc321x_wdt: Fix race condition bugs
    229bdf0b1319 net: 9p: initialize sun_server.sun_path to have addr's value only when addr is valid
    660e2d9d1417 clk: ti: clockdomain: fix static checker warning
    f66125e1c4df rpmsg: glink: Use complete_all for open states
    dfcfccd05075 bnxt_en: Log unknown link speed appropriately.
    78452408bb3e md/bitmap: md_bitmap_get_counter returns wrong blocks
    4ebdad05129e btrfs: fix replace of seed device
    1f145a1193ea ARC: [dts] fix the errors detected by dtbs_check
    5759f38a63db drm/amd/display: HDMI remote sink need mode validation for Linux
    3ef6095d6587 power: supply: test_power: add missing newlines when printing parameters by sysfs
    cf5a6124f237 ACPI: HMAT: Fix handling of changes from ACPI 6.2 to ACPI 6.3
    37464a8a7f68 bus/fsl_mc: Do not rely on caller to provide non NULL mc_io
    0606a8df86fe drivers/net/wan/hdlc_fr: Correctly handle special skb->protocol values
    592cbc0a6a83 brcmfmac: Fix warning message after dongle setup failed
    cf9cc49cd881 ACPI: Add out of bounds and numa_off protections to pxm_to_node()
    5880a0d1c835 xfs: don't free rt blocks when we're doing a REMAP bunmapi call
    7551e2f4fddd can: flexcan: disable clocks during stop mode
    64129ad98b74 arm64/mm: return cpu_all_mask when node is NUMA_NO_NODE
    ea888a14ac6e SUNRPC: Mitigate cond_resched() in xprt_transmit()
    7f7f437277ac usb: xhci: omit duplicate actions when suspending a runtime suspended host.
    8fd52a21ab57 coresight: Make sysfs functional on topologies with per core sink
    2502107a9ccd uio: free uio id after uio file node is freed
    16b9e40d2989 USB: adutux: fix debugging
    65052761eeb9 cpufreq: sti-cpufreq: add stih418 support
    2eab702ee945 riscv: Define AT_VECTOR_SIZE_ARCH for ARCH_DLINFO
    7762afa04fd4 samples/bpf: Fix possible deadlock in xdpsock
    58c80462e467 selftests/bpf: Define string const as global for test_sysctl_prog.c
    8f71fb76a312 media: uvcvideo: Fix dereference of out-of-bound list iterator
    4801ffdd6962 bpf: Permit map_ptr arithmetic with opcode add and offset 0
    f7f7b77ee507 kgdb: Make "kgdbcon" work properly with "kgdb_earlycon"
    77fa5e15c933 ia64: kprobes: Use generic kretprobe trampoline handler
    b3142fe7ff63 printk: reduce LOG_BUF_SHIFT range for H8300
    80685a94f7c4 arm64: topology: Stop using MPIDR for topology information
    7975367a005f drm/bridge/synopsys: dsi: add support for non-continuous HS clock
    d3fb88a51c04 mmc: via-sdmmc: Fix data race bug
    67e18c92e081 media: imx274: fix frame interval handling
    448e5004ad85 media: tw5864: check status of tw5864_frameinterval_get
    47ab020f3290 usb: typec: tcpm: During PR_SWAP, source caps should be sent only after tSwapSourceStart
    5472c5d1d505 media: platform: Improve queue set up flow for bug fixing
    3a8568806285 media: videodev2.h: RGB BT2020 and HSV are always full range
    ac437801e3c2 selftests/x86/fsgsbase: Reap a forgotten child
    581940d9b9c8 drm/brige/megachips: Add checking if ge_b850v3_lvds_init() is working correctly
    ed0bd7b12939 ath10k: fix VHT NSS calculation when STBC is enabled
    b30a5c8d9def ath10k: start recovery process when payload length exceeds max htc length for sdio
    759721fb5886 video: fbdev: pvr2fb: initialize variables
    b2844ba3d37c xfs: fix realtime bitmap/summary file truncation when growing rt volume
    a10ed3b55fed power: supply: bq27xxx: report "not charging" on all types
    036b0f4d7671 NFS4: Fix oops when copy_file_range is attempted with NFS4.0 source
    13081d5ddb58 ARM: 8997/2: hw_breakpoint: Handle inexact watchpoint addresses
    df5b07f2172a f2fs: handle errors of f2fs_get_meta_page_nofail
    15c7ec03ddb8 um: change sigio_spinlock to a mutex
    fb9b18150e3f s390/startup: avoid save_area_sync overflow
    9804eda4a975 f2fs: fix to check segment boundary during SIT page readahead
    1544dcb514ad f2fs: fix uninit-value in f2fs_lookup
    40b357f7436d f2fs: add trace exit in exception path
    2eab8974aea8 sparc64: remove mm_cpumask clearing to fix kthread_use_mm race
    7d59323cff67 powerpc: select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
    82e93f94ac65 mm: fix exec activate_mm vs TLB shootdown and lazy tlb switching race
    dc17b990ee90 powerpc/powernv/smp: Fix spurious DBG() warning
    2db759037152 futex: Fix incorrect should_fail_futex() handling
    87d9ac94c7e7 ata: sata_nv: Fix retrieving of active qcs
    da8e2fbe458c RDMA/qedr: Fix memory leak in iWARP CM
    d90dd1599cf3 mlxsw: core: Fix use-after-free in mlxsw_emad_trans_finish()
    f7e7de28d106 x86/unwind/orc: Fix inactive tasks with stack pointer in %sp on GCC 10 compiled kernels
    6937c143e3d3 firmware: arm_scmi: Add missing Rx size re-initialisation
    aedcfe9a02f8 firmware: arm_scmi: Fix ARCH_COLD_RESET
    85d9d02a49e2 xen/events: block rogue events for some time
    1d628c330fa6 xen/events: defer eoi in case of excessive number of events
    25c23f033457 xen/events: use a common cpu hotplug hook for event channels
    b7d6a66e2172 xen/events: switch user event channels to lateeoi model
    48b533aa838d xen/pciback: use lateeoi irq binding
    9396de462aa6 xen/pvcallsback: use lateeoi irq binding
    5441639a38df xen/scsiback: use lateeoi irq binding
    e6ea898e5602 xen/netback: use lateeoi irq binding
    ade6bd5af7f9 xen/blkback: use lateeoi irq binding
    df54eca9ae8a xen/events: add a new "late EOI" evtchn framework
    44a455e06d87 xen/events: fix race in evtchn_fifo_unmask()
    4bea575a1069 xen/events: add a proper barrier to 2-level uevent unmasking
    a01379671d67 xen/events: avoid removing an event channel while handling it
    b300b28b7814 Linux 5.4.74
    847c86d7f1d5 phy: marvell: comphy: Convert internal SMCC firmware return codes to errno
    aa3410cc232c misc: rtsx: do not setting OC_POWER_DOWN reg in rtsx_pci_init_ocp()
    a6db3aab9c40 openrisc: Fix issue with get_user for 64-bit values
    f73328c3192e crypto: x86/crc32c - fix building with clang ias
    29bbc9cb0b27 xen/gntdev.c: Mark pages as dirty
    8f640cd8ee60 ata: sata_rcar: Fix DMA boundary mask
    9f531583c1f0 PM: runtime: Fix timer_expires data type on 32-bit arches
    870d910e1afb serial: pl011: Fix lockdep splat when handling magic-sysrq interrupt
    44ef3b63c788 serial: qcom_geni_serial: To correct QUP Version detection logic
    c274d1f8baaf mtd: lpddr: Fix bad logic in print_drs_error
    bc67eeb9781b RDMA/addr: Fix race with netevent_callback()/rdma_addr_cancel()
    ebb0adcfbb1f cxl: Rework error message for incompatible slots
    125a229e52e7 p54: avoid accessing the data mapped to streaming DMA
    801863f634c4 evm: Check size of security.evm before using it
    dd2f800e9074 bpf: Fix comment for helper bpf_current_task_under_cgroup()
    860448e73ba2 fuse: fix page dereference after free
    4e1a23779bde ata: ahci: mvebu: Make SATA PHY optional for Armada 3720
    7aae7466f5db x86/xen: disable Firmware First mode for correctable memory errors
    47a4d5406389 arch/x86/amd/ibs: Fix re-arming IBS Fetch
    95daf621291c erofs: avoid duplicated permission check for "trusted." xattrs
    b8321829036f bnxt_en: Invoke cancel_delayed_work_sync() for PFs also.
    b1b5efe574cd bnxt_en: Fix regression in workqueue cleanup logic in bnxt_remove_one().
    aa4dba4e2226 bnxt_en: Re-write PCI BARs after PCI fatal error.
    5c86cda6a529 net: hns3: Clear the CMDQ registers before unmapping BAR region
    30d628ede582 tipc: fix memory leak caused by tipc_buf_append()
    8cc351a3d444 tcp: Prevent low rmem stalls with SO_RCVLOWAT.
    7740774940fc ravb: Fix bit fields checking in ravb_hwtstamp_get()
    4939183bb28c r8169: fix issue with forced threading in combination with shared interrupts
    f1493ab33679 net/sched: act_mpls: Add softdep on mpls_gso.ko
    4bffc9618caf netem: fix zero division in tabledist
    13a4843d3938 mlxsw: core: Fix memory leak on module removal
    c90459593f55 ibmvnic: fix ibmvnic_set_mac
    e781c67629ed gtp: fix an use-before-init in gtp_newlink()
    0ea202010b40 cxgb4: set up filter action after rewrites
    3a0d5b5358d1 chelsio/chtls: fix tls record info to user
    c5db8069776f chelsio/chtls: fix memory leaks in CPL handlers
    a5b9b28b22ba chelsio/chtls: fix deadlock issue
    c17d5aea3395 bnxt_en: Send HWRM_FUNC_RESET fw command unconditionally.
    72c17fadf3f8 bnxt_en: Check abort error state in bnxt_open_nic().
    8e1b40e57dca efivarfs: Replace invalid slashes with exclamation marks in dentries.
    c3019695f1d8 x86/PCI: Fix intel_mid_pci.c build error when ACPI is not enabled
    57a88e44b512 arm64: link with -z norelro regardless of CONFIG_RELOCATABLE
    7736c61080f1 arm64: Run ARCH_WORKAROUND_2 enabling code on all CPUs
    114c6930b351 arm64: Run ARCH_WORKAROUND_1 enabling code on all CPUs
    2dcb0c6c3818 scripts/setlocalversion: make git describe output more reliable
    c8a5496bc747 objtool: Support Clang non-section symbols in ORC generation
    a45c8c0a31a7 socket: don't clear SOCK_TSTAMP_NEW when SO_TIMESTAMPNS is disabled
    bded4de4a5e1 netfilter: nftables_offload: KASAN slab-out-of-bounds Read in nft_flow_rule_create

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 16dc22108fcf7e53750424b90c0aeb8dba2dc5e5)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index d7e0072a30..183acce226 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "689799c6846313eb19566dd4afb69d30353dd351"
-SRCREV_meta ?= "e9a115873f55580929b3cd0232a70652666f5fff"
+SRCREV_machine ?= "e500e89811e268ab5c420744c41b10d12c9844a0"
+SRCREV_meta ?= "8d0ed83a864cc91eef4d2abbc90f13d4ecd1c213"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.73"
+LINUX_VERSION ?= "5.4.75"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 44646ebd84..f6190be8da 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.73"
+LINUX_VERSION ?= "5.4.75"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "f37a22c3ddab9db618ad302cce77825dae2cda87"
-SRCREV_machine ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
-SRCREV_meta ?= "e9a115873f55580929b3cd0232a70652666f5fff"
+SRCREV_machine_qemuarm ?= "2c7da912c6b5bd36d84f75e0aff4afd0814f1bd3"
+SRCREV_machine ?= "d0096198f08dd2aa4222ef5480d2fcdaf520b65b"
+SRCREV_meta ?= "8d0ed83a864cc91eef4d2abbc90f13d4ecd1c213"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index dea2d515e6..23fc5ea819 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "395c666f57d262a7a7c3553fd0eb40b8339cd9fe"
-SRCREV_machine_qemuarm64 ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
-SRCREV_machine_qemumips ?= "fe7fedf978258fca785ceae508f87f6563c37a27"
-SRCREV_machine_qemuppc ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
-SRCREV_machine_qemuriscv64 ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
-SRCREV_machine_qemux86 ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
-SRCREV_machine_qemux86-64 ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
-SRCREV_machine_qemumips64 ?= "536bda19159206ac7f60165f71bbf892cb8ad3fd"
-SRCREV_machine ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
-SRCREV_meta ?= "e9a115873f55580929b3cd0232a70652666f5fff"
+SRCREV_machine_qemuarm ?= "dbac8d2939bca0a92226cfd55543331715dd642d"
+SRCREV_machine_qemuarm64 ?= "d0096198f08dd2aa4222ef5480d2fcdaf520b65b"
+SRCREV_machine_qemumips ?= "819cf265755f21768f6bb98312cb568c6db8b1e8"
+SRCREV_machine_qemuppc ?= "d0096198f08dd2aa4222ef5480d2fcdaf520b65b"
+SRCREV_machine_qemuriscv64 ?= "d0096198f08dd2aa4222ef5480d2fcdaf520b65b"
+SRCREV_machine_qemux86 ?= "d0096198f08dd2aa4222ef5480d2fcdaf520b65b"
+SRCREV_machine_qemux86-64 ?= "d0096198f08dd2aa4222ef5480d2fcdaf520b65b"
+SRCREV_machine_qemumips64 ?= "bb9110d96ce8a2c56466e5b4314b93175af3d80d"
+SRCREV_machine ?= "d0096198f08dd2aa4222ef5480d2fcdaf520b65b"
+SRCREV_meta ?= "8d0ed83a864cc91eef4d2abbc90f13d4ecd1c213"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.73"
+LINUX_VERSION ?= "5.4.75"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.28.0

