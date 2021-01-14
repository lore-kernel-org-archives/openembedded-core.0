Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3701.1610640599644781266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 08:10:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: I1/5f8jU9jrScWCf1i9qlTNYYVm3scGOvzCDIRJaeJZHVUXaBWFVWgbI3NK6+Ij7dDraNoY/m6
 fQ2Y3s1ebXgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="166062697"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="166062697"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:10:11 -0800
IronPort-SDR: i5zwcIa+lq2ko0M0yhC/EQRTPj4cdXaWOg4ZMUOC6/96zXK+NcEi6abCgEoWl0gr61VToeOd4G
 V81oOph03pIQ==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="424986656"
Received: from ykoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.50])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:10:10 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 12/14] linux-yocto/5.4: update to v5.4.87
Date: Fri, 15 Jan 2021 00:09:46 +0800
Message-Id: <9d49791d06624c932a77af72474c02543e328d1d.1610639458.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610639458.git.anuj.mittal@intel.com>
References: <cover.1610639458.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    b3f656a592f3 Linux 5.4.87
    41ae3e574ccf dm verity: skip verity work if I/O error when system is shutting down
    8b3c00977264 ALSA: pcm: Clear the full allocated memory at hw_params
    480abac78e03 tick/sched: Remove bogus boot "safety" check
    1dab82dd202d um: ubd: Submit all data segments atomically
    d32747bb687d fs/namespace.c: WARN if mnt_count has become negative
    9f4e8026d202 module: delay kobject uevent until after module init call
    86db71810a27 f2fs: avoid race condition for shrinker count
    dbe184f6be1e NFSv4: Fix a pNFS layout related use-after-free race when freeing the inode
    d52faa7fb12f i3c master: fix missing destroy_workqueue() on error in i3c_master_register
    22f815627c64 powerpc: sysdev: add missing iounmap() on error in mpic_msgr_probe()
    a95049c51417 rtc: pl031: fix resource leak in pl031_probe
    e2926630f653 quota: Don't overflow quota file offsets
    1842dde0dd13 module: set MODULE_STATE_GOING state when a module fails to load
    569da7c3d9a3 rtc: sun6i: Fix memleak in sun6i_rtc_clk_init
    642c2d74c365 fcntl: Fix potential deadlock in send_sig{io, urg}()
    5b2f1ad6b12b bfs: don't use WARNING: string when it's just info.
    3a2a5e197a84 ALSA: rawmidi: Access runtime->avail always in spinlock
    8d2204a05391 ALSA: seq: Use bool for snd_seq_queue internal flags
    4250fe65b2e6 f2fs: fix shift-out-of-bounds in sanity_check_raw_super()
    28a29e3a658a media: gp8psk: initialize stats at power control logic
    750627d36f84 misc: vmw_vmci: fix kernel info-leak by initializing dbells in vmci_ctx_get_chkpt_doorbells()
    01be033cc127 reiserfs: add check for an invalid ih_entry_count
    18e1101b0ee9 Bluetooth: hci_h5: close serdev device and free hu in h5_close
    b726f8602207 scsi: cxgb4i: Fix TLS dependency
    57ba2c7a50bf cgroup: Fix memory leak when parsing multiple source parameters
    8ddf02859c69 of: fix linker-section match-table corruption
    8ec95e308418 null_blk: Fix zone size initialization
    7c3d8d73bafd tools headers UAPI: Sync linux/const.h with the kernel headers
    376c3111413c uapi: move constants from <linux/kernel.h> to <linux/const.h>
    af07e4dd0783 scsi: block: Fix a race in the runtime power management code
    9ce7ac5ed53b jffs2: Fix NULL pointer dereference in rp_size fs option parsing
    3a83e289e4b7 jffs2: Allow setting rp_size to zero during remounting
    ee78e7d93e35 powerpc/bitops: Fix possible undefined behaviour with fls() and fls64()
    7cb6087b4536 KVM: x86: reinstate vendor-agnostic check on SPEC_CTRL cpuid bits
    3d4a05894500 KVM: SVM: relax conditions for allowing MSR_IA32_SPEC_CTRL accesses
    d77c1ab54c9e KVM: x86: avoid incorrect writes to host MSR_IA32_SPEC_CTRL
    11459136a107 ext4: don't remount read-only with errors=continue on reboot
    6b0a4f603d5b btrfs: fix race when defragmenting leads to unnecessary IO
    30aea96ff142 vfio/pci: Move dummy_resources_list init in vfio_pci_probe()
    29c2d3e91e3d fscrypt: remove kernel-internal constants from UAPI header
    34f000524d33 fscrypt: add fscrypt_is_nokey_name()
    eddc69467e39 f2fs: prevent creating duplicate encrypted filenames
    6fe20a5204a6 ubifs: prevent creating duplicate encrypted filenames
    3ebfed353afd ext4: prevent creating duplicate encrypted filenames
    faa72d97c3e3 thermal/drivers/cpufreq_cooling: Update cpufreq_state only if state has changed
    d3076d054f3e md/raid10: initialize r10_bio->read_slot before use.
    c71c512f4a65 net/sched: sch_taprio: reset child qdiscs before freeing them
    dfce803cd87d Linux 5.4.86
    8302bd9afd4b x86/CPU/AMD: Save AMD NodeId as cpu_die_id
    6001db0272da Revert: "ring-buffer: Remove HAVE_64BIT_ALIGNED_ACCESS"
    33afcf723a0e rtc: ep93xx: Fix NULL pointer dereference in ep93xx_rtc_read_time
    7e0f7a293608 regulator: axp20x: Fix DLDO2 voltage control register mask for AXP22x
    be23b04074b1 PCI: Fix pci_slot_release() NULL pointer dereference
    b1f9419d5e6c platform/x86: intel-vbtn: Allow switch events on Acer Switch Alpha 12
    c16b5849352c libnvdimm/namespace: Fix reaping of invalidated block-window-namespace labels
    68d139a97415 xenbus/xenbus_backend: Disallow pending watch messages
    d3eaea062b51 xen/xenbus: Count pending messages for each watch
    c45b0a8d2a68 xen/xenbus/xen_bus_type: Support will_handle watch callback
    7da6db982e53 xen/xenbus: Add 'will_handle' callback support in xenbus_watch_path()
    eac0c12e329d xen/xenbus: Allow watches discard events before queueing
    8f3f6de44f7c xen-blkback: set ring->xenblkd to NULL after kthread_stop()
    383c60c16dd8 dma-buf/dma-resv: Respect num_fences when initializing the shared fence list.
    b16a6a46e0b2 device-dax/core: Fix memory leak when rmmod dax.ko
    f3ede933fbc7 clk: tegra: Do not return 0 on failure
    f133bfbe1201 clk: mvebu: a3700: fix the XTAL MODE pin to MPP1_9
    ca4fd0284cb3 clk: ingenic: Fix divider calculation with div tables
    13e6b6259e6d pinctrl: sunxi: Always call chained_irq_{enter, exit} in sunxi_pinctrl_irq_handler
    2fb550de7563 md/cluster: fix deadlock when node is doing resync job
    7523d147087b md/cluster: block reshape with remote resync job
    27b58f6adad8 iio:adc:ti-ads124s08: Fix alignment and data leak issues.
    2d7229c037d1 iio:adc:ti-ads124s08: Fix buffer being too long.
    d6ea1d559027 iio:imu:bmi160: Fix too large a buffer.
    91b7b231f5e7 iio:pressure:mpl3115: Force alignment of buffer
    9607d22e71d1 iio:magnetometer:mag3110: Fix alignment and data leak issues.
    71a326dcd2a8 iio:light:st_uvis25: Fix timestamp alignment and prevent data leak.
    c18fc255187f iio:light:rpr0521: Fix timestamp alignment and prevent data leak.
    860ab67cd81e iio: adc: rockchip_saradc: fix missing clk_disable_unprepare() on error in rockchip_saradc_resume
    0fa2b43b0a2a iio: buffer: Fix demux update
    82af6e44b7d4 scsi: lpfc: Re-fix use after free in lpfc_rq_buf_free()
    7ec7630548dc scsi: lpfc: Fix invalid sleeping context in lpfc_sli4_nvmet_alloc()
    6822575cf204 scsi: qla2xxx: Fix crash during driver load on big endian machines
    1b26af7e4c7f mtd: rawnand: meson: fix meson_nfc_dma_buffer_release() arguments
    c5f3e5ca8116 mtd: rawnand: qcom: Fix DMA sync on FLASH_STATUS register read
    2aea2b22b6f9 mtd: parser: cmdline: Fix parsing of part-names with colons
    4290a73c9d67 mtd: spinand: Fix OOB read
    b22739509dcb soc: qcom: smp2p: Safely acquire spinlock without IRQs
    ddcb518dee78 spi: atmel-quadspi: Fix AHB memory accesses
    96f7bd39f56f spi: atmel-quadspi: Disable clock in probe error path
    8f295baae53d spi: mt7621: Don't leak SPI master in probe error path
    0818aab8a82b spi: mt7621: Disable clock in probe error path
    cad189512c38 spi: synquacer: Disable clock in probe error path
    4051e5b7741b spi: st-ssc4: Fix unbalanced pm_runtime_disable() in probe error path
    3c0e28f2881e spi: sc18is602: Don't leak SPI master in probe error path
    819f9edaaeb9 spi: rb4xx: Don't leak SPI master in probe error path
    c5491ac11559 spi: pic32: Don't leak DMA channels in probe error path
    3ea835ac604b spi: mxic: Don't leak SPI master in probe error path
    0da7709f5ea3 spi: gpio: Don't leak SPI master in probe error path
    ee1d2aef1c13 spi: fsl: fix use of spisel_boot signal on MPC8309
    614f2529c8ea spi: davinci: Fix use-after-free on unbind
    c6b9bfb0c477 spi: atmel-quadspi: Fix use-after-free on unbind
    bd6d736dbf36 spi: spi-sh: Fix use-after-free on unbind
    17360c3af129 spi: pxa2xx: Fix use-after-free on unbind
    c5ae864c148c drm/i915: Fix mismatch between misplaced vma check and vma insert
    1e684ad37047 drm/dp_aux_dev: check aux_dev before use in drm_dp_aux_dev_get_by_minor()
    e1b1f10c3404 drm/amd/display: Fix memory leaks in S3 resume
    b966771b0d69 platform/x86: mlx-platform: remove an unused variable
    cbeb61258186 jfs: Fix array index bounds check in dbAdjTree
    8ee70b6db882 jffs2: Fix ignoring mounting options problem during remounting
    00e45efaf9ff jffs2: Fix GC exit abnormally
    ea1e4ba032c5 ubifs: wbuf: Don't leak kernel memory to flash
    32825fe72cb3 SMB3: avoid confusing warning message on mount to Azure
    f22f743a2af2 ceph: fix race in concurrent __ceph_remove_cap invocations
    a7b014b54c16 um: Remove use of asprinf in umid.c
    26d72a8460dc ima: Don't modify file descriptor mode on the fly
    a89b91fcb07c powerpc/powernv/memtrace: Fix crashing the kernel when enabling concurrently
    45bf367c8550 powerpc/powernv/memtrace: Don't leak kernel memory to user space
    59334d821e8a powerpc/powernv/npu: Do not attempt NPU2 setup on POWER8NVL NPU
    c7f66ad880a9 powerpc/mm: Fix verification of MMU_FTR_TYPE_44x
    32e29541b5aa powerpc/8xx: Fix early debug when SMC1 is relocated
    15c9e56b41d0 powerpc/xmon: Change printk() to pr_cont()
    c7b89d0d7186 powerpc/feature: Add CPU_FTR_NOEXECUTE to G2_LE
    0f157acd436c powerpc/rtas: Fix typo of ibm,open-errinjct in RTAS filter
    30a58a3f7c85 powerpc: Fix incorrect stw{, ux, u, x} instructions in __set_pte_at
    3ee6a2bc1428 xprtrdma: Fix XDRBUF_SPARSE_PAGES support
    2504e407a39f ARM: dts: at91: sama5d2: fix CAN message ram offset and size
    789246b9afe8 ARM: dts: pandaboard: fix pinmux for gpio user button of Pandaboard ES
    6ee6e4e5a4cf KVM: arm64: Introduce handling of AArch32 TTBCR2 traps
    8635f0fe06c5 ext4: fix deadlock with fs freezing and EA inodes
    c90a5f4851a8 ext4: fix a memory leak of ext4_free_data
    e21d630a2c0d btrfs: trim: fix underflow in trim length to prevent access beyond device boundary
    1d11ed122f6f btrfs: do not shorten unpin len for caching block groups
    af7414836d88 USB: serial: keyspan_pda: fix write unthrottling
    7dae22ba62b2 USB: serial: keyspan_pda: fix tx-unthrottle use-after-free
    f99817ab5821 USB: serial: keyspan_pda: fix write-wakeup use-after-free
    a07b690e1976 USB: serial: keyspan_pda: fix stalled writes
    0f13247fabaf USB: serial: keyspan_pda: fix write deadlock
    ebd9857a5bd4 USB: serial: keyspan_pda: fix dropped unthrottle interrupts
    89fb2b91a9da USB: serial: digi_acceleport: fix write-wakeup deadlocks
    08c24438fb10 USB: serial: mos7720: fix parallel-port state restore
    6eab3f646b1a cpuset: fix race between hotplug work and later CPU offline
    066d115fdd29 EDAC/amd64: Fix PCI component registration
    f4ce4a53c4e4 EDAC/i10nm: Use readl() to access MMIO registers
    f9189a3bb5f9 crypto: arm/aes-ce - work around Cortex-A57/A72 silion errata
    36a58bda87cd crypto: ecdh - avoid unaligned accesses in ecdh_set_secret()
    f26f0e7770a1 powerpc/perf: Exclude kernel samples while counting events in user space.
    8096a2c6b9f6 perf/x86/intel: Fix rtm_abort_event encoding on Ice Lake
    aa3cce9ceff0 perf/x86/intel: Add event constraint for CYCLE_ACTIVITY.STALLS_MEM_ANY
    1e3de428d155 staging: comedi: mf6x4: Fix AI end-of-conversion detection
    ee0bcb1721a5 ASoC: cx2072x: Fix doubly definitions of Playback and Capture streams
    5fbf84689f11 binder: add flag to clear buffer on txn complete
    a7c256a9fd18 s390/dasd: fix list corruption of lcu list
    9c40d69a3be2 s390/dasd: fix list corruption of pavgroup group list
    042683917f4b s390/dasd: prevent inconsistent LCU device data
    c8acd8d55bb9 s390/dasd: fix hanging device offline processing
    3038bbd1bb33 s390/kexec_file: fix diag308 subcode when loading crash kernel
    c185f13918b4 s390/smp: perform initial CPU reset also for SMT siblings
    48d3f12869ef ALSA: core: memalloc: add page alignment for iram
    cd3ff2a46d9c ALSA: usb-audio: Disable sample read check if firmware doesn't give back
    b1e3c2fb0fbe ALSA: usb-audio: Add VID to support native DSD reproduction on FiiO devices
    58cb166b1f8a ALSA: hda/realtek: Apply jack fixup for Quanta NL3
    b61b2aa91f2b ALSA: hda/realtek: Add quirk for MSI-GP73
    89d429ed2cdf ALSA/hda: apply jack fixup for the Acer Veriton N4640G/N6640G/N2510G
    0bf907442c5f ALSA: pcm: oss: Fix a few more UBSAN fixes
    11cd11af4058 ALSA: hda/realtek - Add supported for more Lenovo ALC285 Headset Button
    da723248c5f8 ALSA: hda/realtek - Enable headset mic of ASUS Q524UQK with ALC255
    010a784a1a27 ALSA: hda/realtek - Enable headset mic of ASUS X430UN with ALC256
    0fc8e6b85680 ALSA: hda/realtek: make bass spk volume adjustable on a yoga laptop
    52d09e0cdb78 ALSA: hda/ca0132 - Fix AE-5 rear headphone pincfg.
    1ca2437530e5 ALSA: hda: Fix regressions on clear and reconfig sysfs
    2c6c6001d077 ACPI: PNP: compare the string length in the matching_id()
    772dd826a44b Revert "ACPI / resources: Use AE_CTRL_TERMINATE to terminate resources walks"
    b9d93a666656 PM: ACPI: PCI: Drop acpi_pm_set_bridge_wakeup()
    670b1b7e0d53 ALSA: hda/ca0132 - Change Input Source enum strings.
    8f827adb9bbc Input: cyapa_gen6 - fix out-of-bounds stack access
    98c956a6d9f7 media: ipu3-cio2: Make the field on subdev format V4L2_FIELD_NONE
    f05ac76139e6 media: ipu3-cio2: Validate mbus format in setting subdev format
    44cb512a020e media: ipu3-cio2: Serialise access to pad format
    a47bc844f436 media: ipu3-cio2: Return actual subdev format
    7dc40e1f8044 media: ipu3-cio2: Remove traces of returned buffers
    d7e6b7b6a7f7 media: netup_unidvb: Don't leak SPI master in probe error path
    0bfbb8393e51 media: sunxi-cir: ensure IR is handled when it is continuous
    124dc7d4f4b6 media: gspca: Fix memory leak in probe
    f97b54c8152d vfio/pci/nvlink2: Do not attempt NPU2 setup on POWER8NVL NPU
    df308380cbf3 Input: goodix - add upside-down quirk for Teclast X98 Pro tablet
    070bd3a8ac55 initramfs: fix clang build failure
    f252a9953249 Input: cros_ec_keyb - send 'scancodes' in addition to key events
    2686041cef06 drm/amdkfd: Fix leak in dmabuf import
    dc06432d9304 drm/amd/display: Prevent bandwidth overflow
    ca49d919d79c lwt: Disable BH too in run_lwt_bpf()
    b8dfee234581 fix namespaced fscaps when !CONFIG_SECURITY
    5350b833bb0a cfg80211: initialize rekey_data
    ec15d0700709 ARM: sunxi: Add machine match for the Allwinner V3 SoC
    d629b50f9fdc perf probe: Fix memory leak when synthesizing SDT probes
    cbcb176b6016 kconfig: fix return value of do_error_if()
    6e8beb020d5c clk: sunxi-ng: Make sure divider tables have sentinel
    3cdeedf801b5 clk: s2mps11: Fix a resource leak in error handling paths in the probe function
    ef56621a579a clk: at91: sam9x60: remove atmel,osc-bypass support
    e01dfcc08b55 virtio_ring: Fix two use after free bugs
    2d65ff873d06 virtio_net: Fix error code in probe()
    5f70910832c7 virtio_ring: Cut and paste bugs in vring_create_virtqueue_packed()
    372f06cd6b89 qlcnic: Fix error code in probe
    c16e42c93241 perf record: Fix memory leak when using '--user-regs=?' to list registers
    ceadde18f69a pwm: lp3943: Dynamically allocate PWM chip base
    6bf2ef4bd38d pwm: zx: Add missing cleanup in error path
    d4515a24a802 clk: ti: Fix memleak in ti_fapll_synth_setup
    572eba1ce574 watchdog: coh901327: add COMMON_CLK dependency
    2b1575e28906 watchdog: qcom: Avoid context switch in restart handler
    fad88d462596 libnvdimm/label: Return -ENXIO for no slot in __blk_label_update
    b6c680755d22 net: korina: fix return value
    19e73c9ff0bf net: allwinner: Fix some resources leak in the error handling path of the probe and in the remove function
    226bcdbb4a60 net: bcmgenet: Fix a resource leak in an error handling path in the probe functin
    efc570073cbe lan743x: fix rx_napi_poll/interrupt ping-pong
    9f5b56b5a71d checkpatch: fix unescaped left brace
    b32c5e0ae6f7 mm: don't wake kswapd prematurely when watermark boosting is disabled
    c3bf90c6aac5 sparc: fix handling of page table constructor failure
    6ef298e1cebd powerpc/ps3: use dma_mapping_error()
    d864e7e8270a nfc: s3fwrn5: Release the nfc firmware
    7a3d6a5dfc78 RDMA/cma: Don't overwrite sgid_attr after device is released
    2d01f3d75013 sunrpc: fix xs_read_xdr_buf for partial pages receive
    4acbc03e4fed um: chan_xterm: Fix fd leak
    1bbd5678c0b4 um: tty: Fix handling of close in tty lines
    1355bbe3a717 um: Monitor error events in IRQ controller
    a37d283825a4 ubifs: Fix error return code in ubifs_init_authentication()
    d4dbcfb7e158 watchdog: Fix potential dereferencing of null pointer
    4e091ff107be watchdog: sprd: check busy bit before new loading rather than after that
    4c8cffffc926 watchdog: sprd: remove watchdog disable from resume fail path
    4a4b31e8b5a7 watchdog: sirfsoc: Add missing dependency on HAS_IOMEM
    4d5aea30c1cd watchdog: armada_37xx: Add missing dependency on HAS_IOMEM
    849270acd7b6 irqchip/alpine-msi: Fix freeing of interrupts on allocation error path
    aca4d1bd7e19 ASoC: wm_adsp: remove "ctl" from list on error in wm_adsp_create_control()
    297e48ccf166 mac80211: don't set set TDLS STA bandwidth wider than possible
    d07972d764e8 crypto: atmel-i2c - select CONFIG_BITREVERSE
    f71984fc4482 extcon: max77693: Fix modalias string
    a4fd2da3e85e mtd: rawnand: gpmi: Fix the random DMA timeout issue
    86f6e53642fa mtd: rawnand: meson: Fix a resource leak in init
    5e8715b2383a mtd: rawnand: gpmi: fix reference count leak in gpmi ops
    9c5b041ba20a clk: tegra: Fix duplicated SE clock entry
    1ba196a73c45 remoteproc: qcom: Fix potential NULL dereference in adsp_init_mmio()
    6f597c451e07 remoteproc: qcom: fix reference leak in adsp_start
    f61bce4bc833 remoteproc: q6v5-mss: fix error handling in q6v5_pds_enable
    9b54e31fd08f RDMA/core: Do not indicate device ready when device enablement fails
    e6323070bdc7 can: m_can: m_can_config_endisable(): remove double clearing of clock stop request bit
    6daf2d466380 erofs: avoid using generic_block_bmap
    35e2bec96488 iwlwifi: mvm: hook up missing RX handlers
    857b1403c3e5 s390/cio: fix use-after-free in ccw_device_destroy_console
    be4d879cb7c4 bus: fsl-mc: fix error return code in fsl_mc_object_allocate()
    9b4f327c0746 platform/chrome: cros_ec_spi: Don't overwrite spi::mode
    070c57885ec3 x86/kprobes: Restore BTF if the single-stepping is cancelled
    353b19562a03 nfs_common: need lock during iterate through the list
    48ed3e57ad58 nfsd: Fix message level for normal termination
    b4ac244716f3 speakup: fix uninitialized flush_lock
    989d52723643 usb: oxu210hp-hcd: Fix memory leak in oxu_create
    2addd726083f usb: ehci-omap: Fix PM disable depth umbalance in ehci_hcd_omap_probe
    3f72486cecec powerpc/mm: sanity_check_fault() should work for all, not only BOOK3S
    a696ed262e83 ASoC: amd: change clk_get() to devm_clk_get() and add missed checks
    972db497be45 drm/mediatek: avoid dereferencing a null hdmi_phy on an error message
    ef55a3c384cc powerpc/pseries/hibernation: remove redundant cacheinfo update
    c4115721d1f0 powerpc/pseries/hibernation: drop pseries_suspend_begin() from suspend ops
    570697132c2c platform/x86: mlx-platform: Fix item counter assignment for MSN2700, MSN24xx systems
    a247efe47743 scsi: fnic: Fix error return code in fnic_probe()
    0e724f2e80ba seq_buf: Avoid type mismatch for seq_buf_init
    0b93626d3965 scsi: pm80xx: Fix error return in pm8001_pci_probe()
    79e14f1c323c scsi: qedi: Fix missing destroy_workqueue() on error in __qedi_probe
    172bb906202f arm64: dts: meson: g12a: x96-max: fix PHY deassert timing requirements
    13f4c61d2f5c ARM: dts: meson: fix PHY deassert timing requirements
    154105c0ba56 arm64: dts: meson: fix PHY deassert timing requirements
    62b240d2644e Bluetooth: btmtksdio: Add the missed release_firmware() in mtk_setup_firmware()
    097c4d9921b2 Bluetooth: btusb: Add the missed release_firmware() in btusb_mtk_setup_firmware()
    3d3caa8e971d cpufreq: scpi: Add missing MODULE_ALIAS
    6e34c9478fe5 cpufreq: loongson1: Add missing MODULE_ALIAS
    3e3feeb0d2ba cpufreq: sun50i: Add missing MODULE_DEVICE_TABLE
    ef802b5a5e26 cpufreq: st: Add missing MODULE_DEVICE_TABLE
    742697643c94 cpufreq: qcom: Add missing MODULE_DEVICE_TABLE
    c9d204c02825 cpufreq: mediatek: Add missing MODULE_DEVICE_TABLE
    f3754eec127d cpufreq: highbank: Add missing MODULE_DEVICE_TABLE
    e32836221017 cpufreq: ap806: Add missing MODULE_DEVICE_TABLE
    3b6ba2fe6524 clocksource/drivers/arm_arch_timer: Correct fault programming of CNTKCTL_EL1.EVNTI
    b4219894d154 clocksource/drivers/arm_arch_timer: Use stable count reader in erratum sne
    e223cf39b928 phy: renesas: rcar-gen3-usb2: disable runtime pm in case of failure
    675b3ba9cc96 dm ioctl: fix error return code in target_message
    d863d76536df ASoC: jz4740-i2s: add missed checks for clk_get()
    1b760dc9d967 net/mlx5: Properly convey driver version to firmware
    a64822872957 MIPS: Don't round up kernel sections size for memblock_add()
    33eeb395515d memstick: r592: Fix error return in r592_probe()
    e39b37d6a2ce arm64: dts: rockchip: Fix UART pull-ups on rk3328
    33892a3797f1 pinctrl: falcon: add missing put_device() call in pinctrl_falcon_probe()
    08e22710601a bpf: Fix bpf_put_raw_tracepoint()'s use of __module_address()
    e02d218aa63d ARM: dts: at91: sama5d2: map securam as device
    da8890329599 iio: hrtimer-trigger: Mark hrtimer to expire in hard interrupt context
    d903b80e1abc clocksource/drivers/cadence_ttc: Fix memory leak in ttc_setup_clockevent()
    742d5de6c2fc clocksource/drivers/orion: Add missing clk_disable_unprepare() on error path
    40f9ac2b0295 powerpc/64: Fix an EMIT_BUG_ENTRY in head_64.S
    4968cc5ed0c0 powerpc/perf: Fix crash with is_sier_available when pmu is not set
    b0483a32d163 media: saa7146: fix array overflow in vidioc_s_audio()
    bfdf000e5dd9 hwmon: (ina3221) Fix PM usage counter unbalance in ina3221_write_enable
    a0f07c9ad72d vfio-pci: Use io_remap_pfn_range() for PCI IO memory
    5ac81a4e5fa3 selftests/seccomp: Update kernel config
    0588b8a03469 NFS: switch nfsiod to be an UNBOUND workqueue.
    1094bd2edaa2 lockd: don't use interval-based rebinding over TCP
    cbb0a57326b8 net: sunrpc: Fix 'snprintf' return value check in 'do_xprt_debugfs'
    a0842124422e NFSv4: Fix the alignment of page data in the getdeviceinfo reply
    73892eef6d9e SUNRPC: xprt_load_transport() needs to support the netid "rdma6"
    2823b8979375 NFSv4.2: condition READDIR's mask for security label based on LSM state
    04e9c169810c SUNRPC: rpc_wake_up() should wake up tasks in the correct order
    a3ac7dd8b16b ath10k: Release some resources in an error handling path
    6b6edd2c072b ath10k: Fix an error handling path
    e856abba7fca ath10k: Fix the parsing error in service available event
    f4935d3c7b57 platform/x86: dell-smbios-base: Fix error return code in dell_smbios_init
    3d64e8ce592b ARM: dts: at91: at91sam9rl: fix ADC triggers
    09347a537cc7 soc: amlogic: canvas: add missing put_device() call in meson_canvas_get()
    8424a5b661ca arm64: dts: meson-sm1: fix typo in opp table
    f4951cb10668 arm64: dts: meson: fix spi-max-frequency on Khadas VIM2
    49b563bfdd66 PCI: iproc: Fix out-of-bound array accesses
    4ef5a46d2964 PCI: Fix overflow in command-line resource alignment requests
    048b98083c27 PCI: Bounds-check command-line resource alignment requests
    72577f162cae arm64: dts: qcom: c630: Polish i2c-hid devices
    a554b68baf27 arm64: dts: ls1028a: fix ENETC PTP clock input
    a85f3e7cb717 genirq/irqdomain: Don't try to free an interrupt that has no mapping
    2f00dcc6ce7a power: supply: bq24190_charger: fix reference leak
    e230e193c966 power: supply: axp288_charger: Fix HP Pavilion x2 10 DMI matching
    8e9678d9d131 arm64: dts: rockchip: Set dr_mode to "host" for OTG on rk3328-roc-cc
    11f007a5583d arm64: dts: armada-3720-turris-mox: update ethernet-phy handle name
    5a551ef11669 ARM: dts: Remove non-existent i2c1 from 98dx3236
    15305a5b103d HSI: omap_ssi: Don't jump to free ID in ssi_add_controller()
    ec30659ea631 slimbus: qcom-ngd-ctrl: Avoid sending power requests without QMI
    76170933d3da media: max2175: fix max2175_set_csm_mode() error code
    5873beee8744 mips: cdmm: fix use-after-free in mips_cdmm_bus_discover
    51795c385f73 media: imx214: Fix stop streaming
    ceff135b9d93 samples: bpf: Fix lwt_len_hist reusing previous BPF map
    4dc1360203c4 platform/x86: mlx-platform: Remove PSU EEPROM from MSN274x platform configuration
    3432883ae896 platform/x86: mlx-platform: Remove PSU EEPROM from default platform configuration
    c14a740743f7 media: siano: fix memory leak of debugfs members in smsdvb_hotplug
    6b93d6c5a888 arm64: tegra: Fix DT binding for IO High Voltage entry
    b0f1878c2d88 dmaengine: mv_xor_v2: Fix error return code in mv_xor_v2_probe()
    46f8c7961168 cw1200: fix missing destroy_workqueue() on error in cw1200_init_common
    f2e7f608b274 rsi: fix error return code in rsi_reset_card()
    f7a6e378fc17 qtnfmac: fix error return code in qtnf_pcie_probe()
    d2b95947720d orinoco: Move context allocation after processing the skb
    e39908568b40 mmc: pxamci: Fix error return code in pxamci_probe
    65f0d3c81c9f ARM: dts: at91: sama5d3_xplained: add pincontrol for USB Host
    c2aab53d1be5 ARM: dts: at91: sama5d4_xplained: add pincontrol for USB Host
    8ce91557023e memstick: fix a double-free bug in memstick_check
    4279ff6deaf3 RDMA/cxgb4: Validate the number of CQEs
    d3ff603c2e38 clk: meson: Kconfig: fix dependency for G12A
    2fbd2b0dd7d1 Input: omap4-keypad - fix runtime PM error handling
    ff3a152243f8 drivers: soc: ti: knav_qmss_queue: Fix error return code in knav_queue_probe
    e16e8cde2bb1 soc: ti: Fix reference imbalance in knav_dma_probe
    475b489b0713 soc: ti: knav_qmss: fix reference leak in knav_queue_probe
    82b9934e1e7a spi: fix resource leak for drivers without .remove callback
    70e19fccf680 crypto: omap-aes - Fix PM disable depth imbalance in omap_aes_probe
    c549355105d9 crypto: crypto4xx - Replace bitwise OR with logical OR in crypto4xx_build_pd
    3e08a61b2f94 EDAC/mce_amd: Use struct cpuinfo_x86.cpu_die_id for AMD NodeId
    0789349204a6 powerpc/feature: Fix CPU_FTRS_ALWAYS by removing CPU_FTRS_GENERIC_32
    90b39366d834 powerpc: Avoid broken GCC __attribute__((optimize))
    8f6e6ec101dd selftests/bpf: Fix broken riscv build
    6f8c6e70738a spi: mxs: fix reference leak in mxs_spi_probe
    5df04553ee8c usb/max3421: fix return error code in max3421_probe()
    e6405aad3592 Input: ads7846 - fix unaligned access on 7845
    920c379029f9 Input: ads7846 - fix integer overflow on Rt calculation
    c7ac50927300 Input: ads7846 - fix race that causes missing releases
    86398df4b283 drm/omap: dmm_tiler: fix return error code in omap_dmm_probe()
    e8cd88c3ab00 video: fbdev: atmel_lcdfb: fix return error code in atmel_lcdfb_of_init()
    953379fb7ba3 media: solo6x10: fix missing snd_card_free in error handling case
    c64d2e159829 scsi: core: Fix VPD LUN ID designator priorities
    efb57c87d8d8 ASoC: meson: fix COMPILE_TEST error
    2c06ac46f81c media: v4l2-fwnode: Return -EINVAL for invalid bus-type
    d8d35c1ea883 media: mtk-vcodec: add missing put_device() call in mtk_vcodec_init_enc_pm()
    c8adf58057b6 media: mtk-vcodec: add missing put_device() call in mtk_vcodec_release_dec_pm()
    c5c403db137f media: mtk-vcodec: add missing put_device() call in mtk_vcodec_init_dec_pm()
    06a3c11c173b media: tm6000: Fix sizeof() mismatches
    1638c7e3985b staging: gasket: interrupt: fix the missed eventfd_ctx_put() in gasket_interrupt.c
    aa1d8b959455 staging: greybus: codecs: Fix reference counter leak in error handling
    5daf659fdf47 crypto: qat - fix status check in qat_hal_put_rel_rd_xfer()
    38017f2c06cf MIPS: BCM47XX: fix kconfig dependency bug for BCM47XX_BCMA
    9e779e6fae58 RDMa/mthca: Work around -Wenum-conversion warning
    648b9dd270ff ASoC: arizona: Fix a wrong free in wm8997_probe
    7e8200d44200 spi: sprd: fix reference leak in sprd_spi_remove
    c786bc725d8c ASoC: wm8998: Fix PM disable depth imbalance on error
    06fa588c7921 selftest/bpf: Add missed ip6ip6 test back
    dab5973ada6b mwifiex: fix mwifiex_shutdown_sw() causing sw reset failure
    404aadf45c71 spi: bcm63xx-hsspi: fix missing clk_disable_unprepare() on error in bcm63xx_hsspi_resume
    769c2fecefd1 spi: tegra114: fix reference leak in tegra spi ops
    47595d68cee2 spi: tegra20-sflash: fix reference leak in tegra_sflash_resume
    f9e5e84eb49f spi: tegra20-slink: fix reference leak in slink ops of tegra20
    0a3196271b40 spi: mt7621: fix missing clk_disable_unprepare() on error in mt7621_spi_probe
    a2cf358aacf5 spi: spi-ti-qspi: fix reference leak in ti_qspi_setup
    25b5a48adabf Bluetooth: hci_h5: fix memory leak in h5_close
    5cf3c2e7892e Bluetooth: Fix null pointer dereference in hci_event_packet()
    d92b81fad01c arm64: dts: exynos: Correct psci compatible used on Exynos7
    da8d84637522 arm64: dts: exynos: Include common syscon restart/poweroff for Exynos7
    8f14da44523c brcmfmac: Fix memory leak for unpaired brcmf_{alloc/free}
    5c5b92c1d6ab spi: stm32: fix reference leak in stm32_spi_resume
    c807042f2d58 selinux: fix inode_doinit_with_dentry() LABEL_INVALID error handling
    ae54a6d99478 ASoC: pcm: DRAIN support reactivation
    009a982ea25b spi: spi-mem: fix reference leak in spi_mem_access_start
    68ad1bd244bd drm/msm/dsi_pll_10nm: restore VCO rate during restore_state
    0a8f14baed8e f2fs: call f2fs_get_meta_page_retry for nat page
    311da238f2f7 spi: img-spfi: fix reference leak in img_spfi_resume
    4e20cee19c2e powerpc/64: Set up a kernel stack for secondaries before cpu_restore()
    3988d96589d9 drm/amdgpu: fix build_coefficients() argument
    a4110e76e550 ARM: dts: aspeed: tiogapass: Remove vuart
    129df833e15c ASoC: sun4i-i2s: Fix lrck_period computation for I2S justified mode
    9edff753ade7 crypto: inside-secure - Fix sizeof() mismatch
    7044a69699f3 crypto: talitos - Fix return type of current_desc_hdr()
    8a73ee0a0a1e crypto: talitos - Endianess in current_desc_hdr()
    b9b8429042bd drm/amdgpu: fix incorrect enum type
    52f525f2bdc7 sched: Reenable interrupts in do_sched_yield()
    35975f2e83a5 sched/deadline: Fix sched_dl_global_validate()
    a3ec54b95c1a x86/apic: Fix x2apic enablement without interrupt remapping
    b7ec74246c32 ARM: p2v: fix handling of LPAE translation in BE mode
    0a72e7286c67 x86/mm/ident_map: Check for errors from ident_pud_init()
    0fd78ab5ef71 RDMA/rxe: Compute PSN windows correctly
    35f18561616f ARM: dts: aspeed: s2600wf: Fix VGA memory region location
    4aae08a71e68 selinux: fix error initialization in inode_doinit_with_dentry()
    de49a51e7938 rtc: pcf2127: fix pcf2127_nvmem_read/write() returns
    57df1b39d990 RDMA/bnxt_re: Set queue pair state when being queried
    e11c7d39fa7e Revert "i2c: i2c-qcom-geni: Fix DMA transfer race"
    4b3ee79fbe77 soc: qcom: geni: More properly switch to DMA mode
    d3bed198333a soc: mediatek: Check if power domains can be powered on at boot time
    fcb0be5ba2e9 soc: renesas: rmobile-sysc: Fix some leaks in rmobile_init_pm_domains()
    38cded30497a arm64: dts: renesas: cat875: Remove rxc-skew-ps from ethernet-phy node
    14be28959f69 arm64: dts: renesas: hihope-rzg2-ex: Drop rxc-skew-ps from ethernet-phy node
    c2712546a6e0 drm/tve200: Fix handling of platform_get_irq() error
    f61e9dbb56ba drm/mcde: Fix handling of platform_get_irq() error
    29f34feb3860 drm/aspeed: Fix Kconfig warning & subsequent build errors
    37028b8bc53d drm/gma500: fix double free of gma_connector
    de630248e740 md: fix a warning caused by a race between concurrent md_ioctl()s
    054be9aed847 crypto: af_alg - avoid undefined behavior accessing salg_name
    5a225303a68f media: msi2500: assign SPI bus number dynamically
    01182045346a quota: Sanity-check quota file headers on load
    df95ea1228cc Bluetooth: Fix slab-out-of-bounds read in hci_le_direct_adv_report_evt()
    cda2f222e7e4 serial_core: Check for port state when tty is in error state
    863cab3017bc HID: i2c-hid: add Vero K147 to descriptor override
    fd819f54065c scsi: megaraid_sas: Check user-provided offsets
    152631f0273f coresight: etb10: Fix possible NULL ptr dereference in etb_enable_perf()
    4c461e8d0e88 coresight: tmc-etr: Fix barrier packet insertion for perf buffer
    e81884d45a70 coresight: tmc-etr: Check if page is valid before dma_map_page()
    ec13738c6ec6 coresight: tmc-etf: Fix NULL ptr dereference in tmc_enable_etf_sink_perf()
    d923c0ec1292 ARM: dts: exynos: fix USB 3.0 pins supply being turned off on Odroid XU
    43598dbdcbf0 ARM: dts: exynos: fix USB 3.0 VBUS control and over-current pins on Exynos5410
    2c6f6cd2cdfb ARM: dts: exynos: fix roles of USB 3.0 ports on Odroid XU
    4202cbbd2c4d usb: chipidea: ci_hdrc_imx: Pass DISABLE_DEVICE_STREAMING flag to imx6ul
    8e19cfae3bb0 USB: gadget: f_rndis: fix bitrate for SuperSpeed and above
    8c124b35a53b usb: gadget: f_fs: Re-use SS descriptors for SuperSpeedPlus
    3389281e0e6e USB: gadget: f_midi: setup SuperSpeed Plus descriptors
    0ddb1d96a5db USB: gadget: f_acm: add support for SuperSpeed Plus
    9ad41aa399db USB: serial: option: add interface-number sanity check to flag handling
    57e22590c41b usb: mtu3: fix memory corruption in mtu3_debugfs_regset()
    80cb94507054 soc/tegra: fuse: Fix index bug in get_process_id
    037c65990d76 kbuild: avoid split lines in .mod files
    a803ea15b0dc perf/x86/intel: Check PEBS status correctly
    12db619c91d7 drm/amd/display: Init clock value by current vbios CLKs
    c137a880ae6c iwlwifi: pcie: add one missing entry for AX210
    e124c5afaf88 dm table: Remove BUG_ON(in_interrupt())
    8a89abb26e30 scsi: mpt3sas: Increase IOCInit request timeout to 30s
    cd14a53938e0 vxlan: Copy needed_tailroom from lowerdev
    0b9ce087f75b vxlan: Add needed_headroom for lower device
    230290dca255 arm64: syscall: exit userspace before unmasking exceptions
    34c07547dbe5 habanalabs: put devices before driver removal
    be063ce1004c drm/tegra: sor: Disable clocks on error in tegra_sor_init()
    9b6ebb202bbb kernel/cpu: add arch override for clear_tasks_mm_cpumask() mm handling
    d8baf15b2196 drm/tegra: replace idr_init() by idr_init_base()
    76812738841c net: mvpp2: add mvpp2_phylink_to_port() helper
    6aa270eb2f90 selftests: fix poll error in udpgro.sh
    0e2b048ffe44 ixgbe: avoid premature Rx buffer reuse
    75bbe7bd9003 i40e: avoid premature Rx buffer reuse
    b05fdd74ffb7 i40e: optimise prefetch page refcount
    405bfd36f072 i40e: Refactor rx_bi accesses
    6935f5385f75 RDMA/cm: Fix an attempt to use non-valid pointer when cleaning timewait
    2107658d6d62 selftests/bpf/test_offload.py: Reset ethtool features after failed setting
    3b79aea56dff netfilter: nft_ct: Remove confirmation check for NFT_CT_ID
    0a652b181d75 gpio: eic-sprd: break loop when getting NULL device resource
    2ebb2df149d4 Revert "gpio: eic-sprd: Use devm_platform_ioremap_resource()"
    64795af3bdc7 afs: Fix memory leak when mounting with multiple source parameters
    6581512f0afc netfilter: nft_dynset: fix timeouts later than 23 days
    810bc556e347 netfilter: nft_compat: make sure xtables destructors have run
    b17244cebb24 netfilter: x_tables: Switch synchronization to RCU
    22faec182eec pinctrl: aspeed: Fix GPIO requests on pass-through banks
    f7e6636831df blk-mq: In blk_mq_dispatch_rq_list() "no budget" is a reason to kick
    4f3e3fa6239d block: factor out requeue handling from dispatch code
    9e54ca3d4f9d block: Simplify REQ_OP_ZONE_RESET_ALL handling
    71e0f9c5c3df clk: renesas: r9a06g032: Drop __packed for portability
    43a373488e92 can: softing: softing_netdev_open(): fix error handling
    36f460d51ac5 xsk: Replace datagram_poll by sock_poll_wait
    50ae52e07d2b xsk: Fix xsk_poll()'s return type
    369ed255958f scsi: bnx2i: Requires MMU
    e190d1b3c4d2 gpio: mvebu: fix potential user-after-free on probe
    ec64dea576d5 gpio: zynq: fix reference leak in zynq_gpio functions
    823f42bd6193 PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter
    74e38f86ab53 ARM: dts: imx6qdl-kontron-samx6i: fix I2C_PM scl pin
    f7fbde0f0b14 ARM: dts: imx6qdl-wandboard-revd1: Remove PAD_GPIO_6 from enetgrp
    4b008707bac4 ARM: dts: sun7i: pcduino3-nano: enable RGMII RX/TX delay on PHY
    76c475d5d788 ARM: dts: sun8i: v3s: fix GIC node memory range
    9ebc986a2ea5 pinctrl: baytrail: Avoid clearing debounce value when turning it off
    e2556e022897 pinctrl: merrifield: Set default bias in case no particular value given
    2ec85a7a5adf ARM: dts: sun8i: v40: bananapi-m2-berry: Fix ethernet node
    9f69f6f85288 ARM: dts: sun8i: r40: bananapi-m2-berry: Fix dcdc1 regulator
    389033996cec ARM: dts: sun7i: bananapi: Enable RGMII RX/TX delay on Ethernet PHY

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b29d1016f2761aefa15e38a86263fb03c46ec1d7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index d505949eb8..f6dd97c9b4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "baf3ccf7c7cfaf9515d8c8b3b639d7bbb0564594"
-SRCREV_meta ?= "1c358e19696827b594de26a221f110fc2647dfa8"
+SRCREV_machine ?= "b82b3d52ee94caf6165eda89d3294a561bfb4f0b"
+SRCREV_meta ?= "bc855ca4626f33c38c1398d48c71df10334a9132"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.85"
+LINUX_VERSION ?= "5.4.87"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index fea9ae26c1..05edcfa63d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.85"
+LINUX_VERSION ?= "5.4.87"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "f7f4bcebdd599197cde6f1d1985cb1ef1f3e8a54"
-SRCREV_machine ?= "4f2b484a791fac88262922aa26ddd5ac3df9720f"
-SRCREV_meta ?= "1c358e19696827b594de26a221f110fc2647dfa8"
+SRCREV_machine_qemuarm ?= "18b82a8554b25c86cbf31af312765832edca3498"
+SRCREV_machine ?= "292d752af8e4015e40e7c523641983bac543e2b4"
+SRCREV_meta ?= "bc855ca4626f33c38c1398d48c71df10334a9132"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index a3feeae966..ba8660d5d3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "888fe3a6f7776f5732c3c4cf4c862447e646c25e"
-SRCREV_machine_qemuarm64 ?= "4f2b484a791fac88262922aa26ddd5ac3df9720f"
-SRCREV_machine_qemumips ?= "459ad51fb16465be3d291217a10bcb9d055f5775"
-SRCREV_machine_qemuppc ?= "4f2b484a791fac88262922aa26ddd5ac3df9720f"
-SRCREV_machine_qemuriscv64 ?= "4f2b484a791fac88262922aa26ddd5ac3df9720f"
-SRCREV_machine_qemux86 ?= "4f2b484a791fac88262922aa26ddd5ac3df9720f"
-SRCREV_machine_qemux86-64 ?= "4f2b484a791fac88262922aa26ddd5ac3df9720f"
-SRCREV_machine_qemumips64 ?= "7eff01977ef77715ebc3e5a126534c39fe4ac918"
-SRCREV_machine ?= "4f2b484a791fac88262922aa26ddd5ac3df9720f"
-SRCREV_meta ?= "1c358e19696827b594de26a221f110fc2647dfa8"
+SRCREV_machine_qemuarm ?= "03f94e8a96d027da980f2cc2ad6e95bbb45e22c5"
+SRCREV_machine_qemuarm64 ?= "292d752af8e4015e40e7c523641983bac543e2b4"
+SRCREV_machine_qemumips ?= "0b055d3e2e8d41743b00cd84975ff383e35f1ae9"
+SRCREV_machine_qemuppc ?= "292d752af8e4015e40e7c523641983bac543e2b4"
+SRCREV_machine_qemuriscv64 ?= "292d752af8e4015e40e7c523641983bac543e2b4"
+SRCREV_machine_qemux86 ?= "292d752af8e4015e40e7c523641983bac543e2b4"
+SRCREV_machine_qemux86-64 ?= "292d752af8e4015e40e7c523641983bac543e2b4"
+SRCREV_machine_qemumips64 ?= "126e385b2dd8580a266fe15907c3725d2da12458"
+SRCREV_machine ?= "292d752af8e4015e40e7c523641983bac543e2b4"
+SRCREV_meta ?= "bc855ca4626f33c38c1398d48c71df10334a9132"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.85"
+LINUX_VERSION ?= "5.4.87"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.29.2

