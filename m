Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62841C433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 02:36:17 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.31654.1653878172131745638
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 19:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=fNDUIruJ;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653878174; x=1685414174;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=4kEjTqY2VJOwcI1TWx/01C8kvn/o1O3siY5X5eWZYAg=;
  b=fNDUIruJhjJBVMqd2sT6Mx6jdpTSob7dtQujcLfMy5uTFfXVyqlTD1i2
   GCR9jovufk+cS1SddjzHogGaKYcDSIHOGBenfAuFqcxWDj8mmG9qfgcIj
   02hguNlwgJlT5Jt2Sy1ox4kBNb33Qjz4XvA1ZNTPaxfG1TtNtnTbGtzUq
   JOQQVuEqIpX/QhmYQ+BJ4xm9CdkSm7iI7Bav43JNeBvq96fDN/2xwDXHi
   L08BvSgpBttOI6nc+zaoZCiKH8R7EuKzYUOnBdCZSTeXm5VzF50PqlplI
   nOubOq0potDHqffXj7aZaKOr9sYSBTvaXPrUMwsCg8Z5yX5ubxeUfRlez
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="274876428"
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="274876428"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:13 -0700
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="666313522"
Received: from jngkeatx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.254.254])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:11 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 04/12] linux-yocto/5.10: update to v5.10.110
Date: Mon, 30 May 2022 10:35:54 +0800
Message-Id: 
 <13684fd8f1c56f33991372f0f98272d55bbb3cdf.1653877872.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1653877872.git.anuj.mittal@intel.com>
References: <cover.1653877872.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 02:36:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166248

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    3238bffaf992 Linux 5.10.110
    cf342cbfb37f PCI: xgene: Revert "PCI: xgene: Use inbound resources for setup"
    a25864c5bc20 arm64: Do not defer reserve_crashkernel() for platforms with no DMA memory zones
    558564db4475 coredump: Use the vma snapshot in fill_files_note
    b7933f145ad3 coredump/elf: Pass coredump_params into fill_note_info
    b043ae637a83 coredump: Remove the WARN_ON in dump_vma_snapshot
    936c8be4d144 coredump: Snapshot the vmas in do_coredump
    5318cdf4fd83 can: usb_8dev: usb_8dev_start_xmit(): fix double dev_kfree_skb() in error path
    869016a2938a can: m_can: m_can_tx_handler(): fix use after free of skb
    e90518d10c7d KVM: x86/mmu: do compare-and-exchange of gPTE via the user address
    e36c45263a30 openvswitch: Fixed nd target mask field in the flow dump.
    415edc68b652 docs: sysctl/kernel: add missing bit to panic_print
    272c74323dcc um: Fix uml_mconsole stop/go
    c0a6a547388e ARM: dts: spear13xx: Update SPI dma properties
    ea3912af8b8a ARM: dts: spear1340: Update serial node properties
    74f7971985bd ASoC: topology: Allow TLV control to be either read or write
    3ca47556d920 ubi: fastmap: Return error code if memory allocation fails in add_aeb()
    7704f243cbbd dt-bindings: spi: mxic: The interrupt property is not mandatory
    648ab1dcc119 dt-bindings: mtd: nand-controller: Fix a comment in the examples
    71917e45e1aa dt-bindings: mtd: nand-controller: Fix the reg property description
    73f2f37417b0 bpf: Fix comment for helper bpf_current_task_under_cgroup()
    90805175a206 bpf: Adjust BPF stack helper functions to accommodate skip > 0
    86489492e876 mm/usercopy: return 1 from hardened_usercopy __setup() handler
    81a04b9a32e4 mm/memcontrol: return 1 from cgroup.memory __setup() handler
    f321621f5c84 ARM: 9187/1: JIVE: fix return value of __setup handler
    d57feed3b114 mm/mmap: return 1 from stack_guard_gap __setup() handler
    73f7cbb15191 batman-adv: Check ptr for NULL before reducing its refcnt
    f6da750bfaf4 ASoC: soc-compress: Change the check for codec_dai
    d3f786b7cf81 staging: mt7621-dts: fix pinctrl-0 items to be size-1 items on ethernet
    12e380bb6f16 proc: bootconfig: Add null pointer check
    90ec1b1538d4 can: isotp: restore accidentally removed MSG_PEEK feature
    16960ac92b84 platform/chrome: cros_ec_typec: Check for EC device
    e5b681822cac ACPI: CPPC: Avoid out of bounds access when parsing _CPC data
    785a53373c22 riscv module: remove (NOLOAD)
    b27de7011cb3 io_uring: fix memory leak of uid in files registration
    20499ed3c041 ARM: iop32x: offset IRQ numbers by 1
    432b057f8e84 ubi: Fix race condition between ctrl_cdev_ioctl and ubi_cdev_ioctl
    f28a857a61eb ASoC: mediatek: mt6358: add missing EXPORT_SYMBOLs
    ecfc3f8a6350 pinctrl: nuvoton: npcm7xx: Use %zu printk format for ARRAY_SIZE()
    503868a7c006 pinctrl: nuvoton: npcm7xx: Rename DS() macro to DSTR()
    d9afc5146bd3 watchdog: rti-wdt: Add missing pm_runtime_disable() in probe function
    402b53dc7c46 pinctrl: pinconf-generic: Print arguments for bias-pull-*
    7169f6011091 watch_queue: Free the page array when watch_queue is dismantled
    e64dc94990fd crypto: arm/aes-neonbs-cbc - Select generic cbc and aes
    a16f5ae8ade1 mailbox: imx: fix wakeup failure from freeze mode
    051360e51341 rxrpc: Fix call timer start racing with call destruction
    a94d98e06eba net: hns3: fix software vlan talbe of vlan 0 inconsistent with hardware
    c73af4bc8a91 gfs2: Make sure FITRIM minlen is rounded up to fs block size
    33c204266c12 rtc: check if __rtc_read_time was successful
    381636f33fe4 XArray: Update the LRU list in xas_split()
    3b9fabe8f6e8 can: mcp251xfd: mcp251xfd_register_get_dev_id(): fix return of error value
    ef0acc514123 can: mcba_usb: properly check endpoint type
    0801a51d7938 can: mcba_usb: mcba_usb_start_xmit(): fix double dev_kfree_skb in error path
    1ac49c8fd49f XArray: Fix xas_create_range() when multi-order entry present
    49f77ab50a31 wireguard: socket: ignore v6 endpoints when ipv6 is disabled
    096f9d35cac0 wireguard: socket: free skb in send6 when ipv6 is disabled
    cd032f218c02 wireguard: queueing: use CFI-safe ptr_ring cleanup function
    8a0c70c238c5 ubifs: rename_whiteout: correct old_dir size computing
    c34ae24a2590 ubifs: Fix to add refcount once page is set private
    07a209fadee7 ubifs: Fix read out-of-bounds in ubifs_wbuf_write_nolock()
    d07a24216931 ubifs: setflags: Make dirtied_ino_d 8 bytes aligned
    13b2a8151e3b ubifs: Add missing iput if do_tmpfile() failed in rename whiteout
    83e42a78428f ubifs: Fix deadlock in concurrent rename whiteout and inode writeback
    a90e2dbe66d2 ubifs: rename_whiteout: Fix double free for whiteout_ui->data
    0c307349fe06 ASoC: SOF: Intel: Fix NULL ptr dereference when ENOMEM
    0fb470eb4889 KVM: SVM: fix panic on out-of-bounds guest IRQ
    cd8c2d7c7c49 KVM: x86: fix sending PV IPI
    eccfee44949d KVM: Prevent module exit until all VMs are freed
    09c771c45c12 KVM: x86: Forbid VMM to set SYNIC/STIMER MSRs when SynIC wasn't activated
    aea4ffdcf30f platform: chrome: Split trace include file
    d3a913ba1fea scsi: qla2xxx: Use correct feature type field during RFF_ID processing
    633450063c10 scsi: qla2xxx: Reduce false trigger to login
    dd48727cabe5 scsi: qla2xxx: Fix N2N inconsistent PLOGI
    0910a791a6d7 scsi: qla2xxx: Fix missed DMA unmap for NVMe ls requests
    f296e888e921 scsi: qla2xxx: Fix hang due to session stuck
    edea037716ff scsi: qla2xxx: Fix incorrect reporting of task management failure
    9dc104edd729 scsi: qla2xxx: Fix disk failure to rediscover
    f97316dd393b scsi: qla2xxx: Suppress a kernel complaint in qla_create_qpair()
    0e4a89efc223 scsi: qla2xxx: Check for firmware dump already collected
    ef10a7530c34 scsi: qla2xxx: Add devids and conditionals for 28xx
    bad77c9a47b4 scsi: qla2xxx: Fix device reconnect in loop topology
    8b52e20c22c2 scsi: qla2xxx: Fix warning for missing error code
    7c9745421d43 scsi: qla2xxx: Fix wrong FDMI data for 64G adapter
    7fef50214dd0 scsi: qla2xxx: Fix scheduling while atomic
    c45147018d7e scsi: qla2xxx: Fix stuck session in gpdb
    031547f4c603 powerpc: Fix build errors with newer binutils
    68fa67e939d8 powerpc/lib/sstep: Fix build errors with newer binutils
    ad806b402268 powerpc/lib/sstep: Fix 'sthcx' instruction
    f39a3309393a powerpc/kasan: Fix early region not updated correctly
    89e5a4268760 KVM: x86/mmu: Check for present SPTE when clearing dirty bit in TDP MMU
    a3ad4530088d ALSA: hda/realtek: Add alc256-samsung-headphone fixup
    aa2ad067cd74 media: atomisp: fix bad usage at error handling logic
    2412a5d29411 mmc: host: Return an error when ->enable_sdio_irq() ops is missing
    808990afd855 media: hdpvr: initialize dev->worker at hdpvr_register_videodev
    32582f82df2b media: Revert "media: em28xx: add missing em28xx_close_extension"
    b1c28577529c video: fbdev: sm712fb: Fix crash in smtcfb_write()
    e7bb29df2a14 ARM: mmp: Fix failure to remove sram device
    add823a9a5e2 ARM: tegra: tamonten: Fix I2C3 pad setting
    08ec8450f3e5 lib/test_lockup: fix kernel pointer check for separate address spaces
    40a5c93a7473 uaccess: fix type mismatch warnings from access_ok()
    a49b687a75d2 media: cx88-mpeg: clear interrupt status register before streaming video
    460635026801 ASoC: soc-core: skip zero num_dai component in searching dai name
    a840fc067e8c ARM: dts: bcm2711: Add the missing L1/L2 cache information
    681a317034b2 video: fbdev: udlfb: replace snprintf in show functions with sysfs_emit
    a7c624abf694 video: fbdev: omapfb: panel-tpo-td043mtea1: Use sysfs_emit() instead of snprintf()
    543dae0a46b0 video: fbdev: omapfb: panel-dsi-cm: Use sysfs_emit() instead of snprintf()
    910715c4b494 arm64: defconfig: build imx-sdma as a module
    14df2556a190 ARM: dts: imx7: Use audio_mclk_post_div instead audio_mclk_root_clk
    c241cfd0a55f ARM: ftrace: avoid redundant loads or clobbering IP
    41082d6432e5 media: atomisp: fix dummy_ptr check to avoid duplicate active_bo
    b554196e6d39 media: atomisp_gmin_platform: Add DMI quirk to not turn AXP ELDO2 regulator off on some boards
    370b50492e54 ASoC: madera: Add dependencies on MFD
    0020667edc06 ARM: dts: bcm2837: Add the missing L1/L2 cache information
    f040c0810291 ARM: dts: qcom: fix gic_irq_domain_translate warnings for msm8960
    da210b1b551c video: fbdev: omapfb: acx565akm: replace snprintf with sysfs_emit
    8c7e2141fb89 video: fbdev: cirrusfb: check pixclock to avoid divide by zero
    1e33f197468f video: fbdev: w100fb: Reset global state
    08dff4820127 video: fbdev: nvidiafb: Use strscpy() to prevent buffer overflow
    99e3f83539ca media: ir_toy: free before error exiting
    d658178b5ac2 media: staging: media: zoran: fix various V4L2 compliance errors
    bafec1a6ba4b media: staging: media: zoran: calculate the right buffer number for zoran_reap_stat_com
    bd01629315ff media: staging: media: zoran: move videodev alloc
    b230f2d9441a ntfs: add sanity check on allocation size
    f7e8aff06262 f2fs: compress: fix to print raw data size in error path of lz4 decompression
    d91d1e681c99 NFSD: Fix nfsd_breaker_owns_lease() return values
    498b7088db71 f2fs: fix to do sanity check on curseg->alloc_type
    330d0e44fc5a ext4: don't BUG if someone dirty pages without asking ext4 first
    cd6d719534af ext4: fix ext4_mb_mark_bb() with flex_bg with fast_commit
    69d2421b5527 ext4: correct cluster len and clusters changed accounting in ext4_mb_mark_bb
    ecd384c436fd locking/lockdep: Iterate lock_classes directly when reading lockdep files
    3ad817f1bd62 spi: tegra20: Use of_device_get_match_data()
    1c200c8bce08 nvme-tcp: lockdep: annotate in-kernel sockets
    7e4967e913ab parisc: Fix handling off probe non-access faults
    ede1ef1a7de9 PM: core: keep irq flags in device_pm_check_callbacks()
    227718c8bbd5 ACPI/APEI: Limit printable size of BERT table data
    cc051f497eac Revert "Revert "block, bfq: honor already-setup queue merges""
    1b69302bfae3 lib/raid6/test/Makefile: Use $(pound) instead of \# for Make 4.3
    1b87ce6a778e ACPICA: Avoid walking the ACPI Namespace if it is not there
    df6e00b1a53c bfq: fix use-after-free in bfq_dispatch_request
    dd85ed4af8f5 fs/binfmt_elf: Fix AT_PHDR for unusual ELF files
    9fc899ce5a20 irqchip/nvic: Release nvic_base upon failure
    4bbd910de18b irqchip/qcom-pdc: Fix broken locking
    f038185b6a62 Fix incorrect type in assignment of ipv6 port for audit
    012c572007c2 loop: use sysfs_emit() in the sysfs xxx show()
    448857f58009 selinux: allow FIOCLEX and FIONCLEX with policy capability
    4b9b60b5bfc8 selinux: use correct type for context length
    7507ead1e9d4 block, bfq: don't move oom_bfqq
    79b16d00de17 pinctrl: npcm: Fix broken references to chip->parent_device
    9d1d8e5e4294 gcc-plugins/stackleak: Exactly match strings instead of prefixes
    b0f2f89d741a regulator: rpi-panel: Handle I2C errors/timing to the Atmel
    2784604c8c6f LSM: general protection fault in legacy_parse_param
    e600b5973e80 fs: fix fd table size alignment properly
    327f07e3704c lib/test: use after free in register_test_dev_kmod()
    00d2b9fe5e02 fs: fd tables have to be multiples of BITS_PER_LONG
    1752fcd4045b net: dsa: bcm_sf2_cfp: fix an incorrect NULL check on list iterator
    edb91a475da5 NFSv4/pNFS: Fix another issue with a list iterator pointing to the head
    5c94b6205e87 net/x25: Fix null-ptr-deref caused by x25_disconnect
    4896c308a57d qlcnic: dcb: default to returning -EOPNOTSUPP
    2165d0ebfbac selftests: test_vxlan_under_vrf: Fix broken test case
    f98dc124a482 net: phy: broadcom: Fix brcm_fet_config_init()
    3e7a483af3bb net: hns3: fix bug when PF set the duplicate MAC address for VFs
    3eb92660e69a net: enetc: report software timestamping via SO_TIMESTAMPING
    e9445a7a59d8 xen: fix is_xen_pmu()
    af0c3ced2468 clk: Initialize orphan req_rate
    845e734f975f clk: qcom: gcc-msm8994: Fix gpll4 width
    e2a262539219 kdb: Fix the putarea helper function
    a9fa7d48a1cd NFSv4.1: don't retry BIND_CONN_TO_SESSION on session error
    8cd30d28da01 netfilter: nf_conntrack_tcp: preserve liberal flag in tcp options
    fbd56a61ceee jfs: fix divide error in dbNextAG
    acb96e62e690 driver core: dd: fix return value of __setup handler
    89748be18f77 firmware: google: Properly state IOMEM dependency
    3d934d7b9019 kgdbts: fix return value of __setup handler
    f65ba8b98846 serial: 8250: fix XOFF/XON sending when DMA is used
    45e95a7bf8c4 kgdboc: fix return value of __setup handler
    96038b1cf45e tty: hvc: fix return value of __setup handler
    566e30289d04 pinctrl/rockchip: Add missing of_node_put() in rockchip_pinctrl_probe
    669b05ff43bd pinctrl: nomadik: Add missing of_node_put() in nmk_pinctrl_probe
    9d095fe2fb8a pinctrl: mediatek: paris: Skip custom extra pin config dump for virtual GPIOs
    861946289d4a pinctrl: mediatek: paris: Fix pingroup pin config state readback
    7675fb2aaf88 pinctrl: mediatek: paris: Fix "argument" argument type for mtk_pinconf_get()
    901e192ac91e pinctrl: mediatek: paris: Fix PIN_CONFIG_BIAS_* readback
    72ea0fefea18 pinctrl: mediatek: Fix missing of_node_put() in mtk_pctrl_init
    fddbfe43bf07 staging: mt7621-dts: fix GB-PC2 devicetree
    00e0739ca126 staging: mt7621-dts: fix pinctrl properties for ethernet
    47c31fe8ca78 staging: mt7621-dts: fix formatting
    59ec187d7c08 staging: mt7621-dts: fix LEDs and pinctrl on GB-PC1 devicetree
    942f68bf2950 NFS: remove unneeded check in decode_devicenotify_args()
    e025c6638720 clk: tegra: tegra124-emc: Fix missing put_device() call in emc_ensure_emc_driver
    54c812829741 clk: clps711x: Terminate clk_div_table with sentinel element
    9ff533033d8e clk: loongson1: Terminate clk_div_table with sentinel element
    bb680cabf242 clk: actions: Terminate clk_div_table with sentinel element
    431f8a9cec07 nvdimm/region: Fix default alignment for small regions
    f7210ca29a78 remoteproc: qcom_q6v5_mss: Fix some leaks in q6v5_alloc_memory_region
    7a494580a89b remoteproc: qcom_wcnss: Add missing of_node_put() in wcnss_alloc_memory_region
    5c1d484d9661 remoteproc: qcom: Fix missing of_node_put in adsp_alloc_memory_region
    f95fd61dd85a dmaengine: hisi_dma: fix MSI allocate fail when reload hisi_dma
    d047d68ff031 clk: qcom: clk-rcg2: Update the frac table for pixel clock
    334720f418f5 clk: qcom: clk-rcg2: Update logic to calculate D value for RCG
    639744b2429f clk: at91: sama7g5: fix parents of PDMCs' GCLK
    0553ecbce95e clk: imx7d: Remove audio_mclk_root_clk
    867258d3f37d dma-debug: fix return value of __setup handlers
    2f3885514e41 NFS: Return valid errors from nfs2/3_decode_dirent()
    7b59afe84ad9 habanalabs: Add check for pci_enable_device
    afcbc6375233 iio: adc: Add check for devm_request_threaded_irq
    df2dc4cf71fa serial: 8250: Fix race condition in RTS-after-send handling
    469ce5119f22 NFS: Use of mapping_set_error() results in spurious errors
    659fe4d653a2 serial: 8250_lpss: Balance reference count for PCI DMA device
    0aebb3944ab1 serial: 8250_mid: Balance reference count for PCI DMA device
    c92bd51313bf phy: dphy: Correct lpx parameter and its derivatives(ta_{get,go,sure})
    80805f555e22 clk: qcom: ipq8074: Use floor ops for SDCC1 clock
    fd2601e3665e pinctrl: renesas: checker: Fix miscalculation of number of states
    c5cf977515b5 pinctrl: renesas: r8a77470: Reduce size for narrow VIN1 channel
    b5db33a81ee7 staging:iio:adc:ad7280a: Fix handing of device address bit reversing.
    f5b01abf5f65 iio: mma8452: Fix probe failing when an i2c_device_id is used
    8b89c9e68a01 clk: qcom: ipq8074: fix PCI-E clock oops
    a70d5dbe2e4e soundwire: intel: fix wrong register name in intel_shim_wake
    091704a9a7f4 cpufreq: qcom-cpufreq-nvmem: fix reading of PVS Valid fuse
    f90ad943221a misc: alcor_pci: Fix an error handling path
    553541c4531e fsi: Aspeed: Fix a potential double free
    cb212c3f0de7 fsi: aspeed: convert to devm_platform_ioremap_resource
    c0b3c06414c3 pwm: lpc18xx-sct: Initialize driver data and hardware before pwmchip_add()
    2cd05c38a27b mxser: fix xmit_buf leak in activate when LSR == 0xff
    8513c93eadc6 mfd: asic3: Add missing iounmap() on error asic3_mfd_probe
    084be6309f4f tipc: fix the timer expires after interval 100ms
    5d8162371ce8 openvswitch: always update flow key after nat
    4593c76a659d tcp: ensure PMTU updates are processed during fastopen
    b26091a02093 net: bcmgenet: Use stronger register read/writes to assure ordering
    9088614323f0 PCI: Avoid broken MSI on SB600 USB devices
    75a4a97b7463 selftests/bpf/test_lirc_mode2.sh: Exit with proper code
    0d3ad6142a05 i2c: mux: demux-pinctrl: do not deactivate a master that is not active
    c483f8002d17 i2c: meson: Fix wrong speed use from probe
    b0898362188e af_netlink: Fix shift out of bounds in group mask calculation
    40f3b8dadae8 ipv4: Fix route lookups when handling ICMP redirects and PMTU updates
    70a6cf749d9f Bluetooth: btmtksdio: Fix kernel oops in btmtksdio_interrupt
    b441fcdff2eb Bluetooth: call hci_le_conn_failed with hdev lock in hci_le_conn_failed
    876cfe1380c3 selftests/bpf: Fix error reporting from sock_fields programs
    ac1ec6f319c0 bareudp: use ipv6_mod_enabled to check if IPv6 enabled
    c037e135391c can: isotp: support MSG_TRUNC flag when reading from socket
    f402c4986519 can: isotp: return -EADDRNOTAVAIL when reading from unbound socket
    8a9d996d4edd USB: storage: ums-realtek: fix error code in rts51x_read_mem()
    f9a666100955 samples/bpf, xdpsock: Fix race when running for fix duration of time
    cd84ea3920ae bpf, sockmap: Fix double uncharge the mem of sk_msg
    7b812a369e64 bpf, sockmap: Fix more uncharged while msg has more_data
    bec34a91eba3 bpf, sockmap: Fix memleak in tcp_bpf_sendmsg while sk msg is full
    c98d903ff9e7 RDMA/mlx5: Fix memory leak in error flow for subscribe event routine
    a3587259ae55 mtd: rawnand: atmel: fix refcount issue in atmel_nand_controller_init
    fa3d44424579 MIPS: pgalloc: fix memory leak caused by pgd_free()
    8c4808ff9e10 MIPS: RB532: fix return value of __setup handler
    ef1728e3cb9e mips: cdmm: Fix refcount leak in mips_cdmm_phys_base
    315772133a4b ath10k: Fix error handling in ath10k_setup_msa_resources
    71f311b12380 vxcan: enable local echo for sent CAN frames
    3c2a39784974 powerpc: 8xx: fix a return value error in mpc8xx_pic_init
    956fab99ad26 platform/x86: huawei-wmi: check the return value of device_create_file()
    1ba28cb69218 selftests/bpf: Make test_lwt_ip_encap more stable and faster
    08ab4067815e libbpf: Unmap rings when umem deleted
    6fa8edfc9020 mfd: mc13xxx: Add check for mc13xxx_irq_request
    bcf93175ed84 powerpc/sysdev: fix incorrect use to determine if list is empty
    ab0a335b546e mips: DEC: honor CONFIG_MIPS_FP_SUPPORT=n
    bbd91cdb620e net: axienet: fix RX ring refill allocation failure handling
    9ec698984db2 PCI: Reduce warnings on possible RW1C corruption
    a84cb039d282 IB/hfi1: Allow larger MTU without AIP
    48d23ef90116 power: supply: wm8350-power: Add missing free in free_charger_irq
    9d3dab40af71 power: supply: wm8350-power: Handle error for wm8350_register_irq
    5cf1371628a4 i2c: xiic: Make bus names unique
    f01e08083c94 hv_balloon: rate-limit "Unhandled message" warning
    ba2c6e353b11 KVM: x86/emulator: Defer not-present segment check in __load_segment_descriptor()
    fa9089949dac KVM: x86: Fix emulation in writing cr8
    3e7e73ae2bbd powerpc/Makefile: Don't pass -mcpu=powerpc64 when building 32-bit
    05abd49972e1 powerpc/mm/numa: skip NUMA_NO_NODE onlining in parse_numa_properties()
    3e04a837dba7 libbpf: Skip forward declaration when counting duplicated type names
    6bb107332db2 gpu: host1x: Fix a memory leak in 'host1x_remove()'
    d1c7759304a1 bpf, arm64: Feed byte-offset into bpf line info
    694398af5fea bpf, arm64: Call build_prologue() first in first JIT pass
    06a0001366ac drm/bridge: cdns-dsi: Make sure to to create proper aliases for dt
    a3d53f000561 scsi: hisi_sas: Change permission of parameter prot_mask
    705c70399e06 power: supply: bq24190_charger: Fix bq24190_vbus_is_enabled() wrong false return
    1e06710c43a0 drm/tegra: Fix reference leak in tegra_dsi_ganged_probe
    9ffa07c699a7 ext2: correct max file size computing
    60605acf5bf8 TOMOYO: fix __setup handlers return values
    adb7c8d1de05 drm/amd/display: Remove vupdate_int_entry definition
    e462b0f518e9 RDMA/mlx5: Fix the flow of a miss in the allocation of a cache ODP MR
    279f318bd7d6 scsi: pm8001: Fix abort all task initialization
    780c668a2dd4 scsi: pm8001: Fix NCQ NON DATA command completion handling
    f7a3f9e4e81b scsi: pm8001: Fix NCQ NON DATA command task initialization
    f76bbee39eda scsi: pm8001: Fix le32 values handling in pm80xx_chip_sata_req()
    6bc86bca3502 scsi: pm8001: Fix le32 values handling in pm80xx_chip_ssp_io_req()
    27ccdcaa015d scsi: pm8001: Fix payload initialization in pm80xx_encrypt_update()
    6c0e850c2289 scsi: pm8001: Fix le32 values handling in pm80xx_set_sas_protocol_timer_config()
    edde1ede761e scsi: pm8001: Fix payload initialization in pm80xx_set_thermal_config()
    257a55622cc6 scsi: pm8001: Fix command initialization in pm8001_chip_ssp_tm_req()
    f55a7bc38f74 scsi: pm8001: Fix command initialization in pm80XX_send_read_log()
    5349cde1dfaa dm crypt: fix get_key_size compiler warning if !CONFIG_KEYS
    d4862bea088c drm/msm/dpu: fix dp audio condition
    7b52fb813cd1 drm/msm/dpu: add DSPP blocks teardown
    413c62697b61 drm/msm/dp: populate connector of struct dp_panel
    441a83ff270e iwlwifi: mvm: Fix an error code in iwl_mvm_up()
    c12692c3e979 iwlwifi: Fix -EIO error code that is never returned
    ec376f5c11c8 dax: make sure inodes are flushed before destroy cache
    5e6b030ac345 IB/cma: Allow XRC INI QPs to set their local ACK timeout
    9c384e1afa55 drm/amd/display: Add affected crtcs to atomic state for dsc mst unplug
    80b96ac9d2fb drm/amd/pm: enable pm sysfs write for one VF mode
    06e778d1849d iommu/ipmmu-vmsa: Check for error num after setting mask
    ab63b24ae632 HID: i2c-hid: fix GET/SET_REPORT for unnumbered reports
    879356a6a055 power: supply: ab8500: Fix memory leak in ab8500_fg_sysfs_init
    f03ef518c1c1 drm/bridge: dw-hdmi: use safe format when first in bridge chain
    e0e25e131d18 PCI: aardvark: Fix reading PCI_EXP_RTSTA_PME bit on emulated bridge
    b1af8b9ec032 livepatch: Fix build failure on 32 bits processors
    6f095441f808 scripts/dtc: Call pkg-config POSIXly correct
    080822563b35 net: dsa: mv88e6xxx: Enable port policy support on 6097
    2ac4f049db6e mt76: mt7615: check sta_rates pointer in mt7615_sta_rate_tbl_update
    2430af124125 mt76: mt7603: check sta_rates pointer in mt7603_sta_rate_tbl_update
    232c1cc98611 mt76: mt7915: use proper aid value in mt7915_mcu_sta_basic_tlv
    253cc4aafc21 mt76: mt7915: use proper aid value in mt7915_mcu_wtbl_generic_tlv in sta mode
    b5d363ff171e powerpc/perf: Don't use perf_hw_context for trace IMC PMU
    c18b53861796 KVM: PPC: Book3S HV: Check return value of kvmppc_radix_init
    8b64c158a07b powerpc: dts: t1040rdb: fix ports names for Seville Ethernet switch
    be703360ed35 ray_cs: Check ioremap return value
    43f2fe2a6995 power: reset: gemini-poweroff: Fix IRQ check in gemini_poweroff_probe
    da71a1483b6c i40e: respect metadata on XSK Rx to skb
    b2e48cd14110 i40e: don't reserve excessive XDP_PACKET_HEADROOM on XSK Rx to skb
    e8fe653fa7c6 KVM: PPC: Fix vmx/vsx mixup in mmio emulation
    11cb9eba06c8 RDMA/core: Set MR type in ib_reg_user_mr
    11f11ac281f0 ath9k_htc: fix uninit value bugs
    6e669baa3363 drm/amd/pm: return -ENOTSUPP if there is no get_dpm_ultimate_freq function
    19a7eba28479 drm/amd/display: Fix a NULL pointer dereference in amdgpu_dm_connector_add_common_modes()
    9abee5153411 drm/nouveau/acr: Fix undefined behavior in nvkm_acr_hsfw_load_bl()
    47402eaf888e ionic: fix type complaint in ionic_dev_cmd_clean()
    1ba10e5c39d4 drm/edid: Don't clear formats if using deep color
    d99e7feaed4c mtd: rawnand: gpmi: fix controller timings setting
    364b2eee6233 mtd: onenand: Check for error irq
    96ea88eb9ba3 Bluetooth: hci_serdev: call init_rwsem() before p->open()
    b267a8118c2b udmabuf: validate ubuf->pagecount
    56722aa77b3b libbpf: Fix possible NULL pointer dereference when destroying skeleton
    4a9c268a4044 drm/panfrost: Check for error num after setting mask
    5d1114ede5a1 ath10k: fix memory overwrite of the WoWLAN wakeup packet pattern
    fb2be762a49b drm: bridge: adv7511: Fix ADV7535 HPD enablement
    d9d61beb21d7 drm/bridge: nwl-dsi: Fix PM disable depth imbalance in nwl_dsi_probe
    064e7f75325c drm/bridge: Add missing pm_runtime_disable() in __dw_mipi_dsi_probe
    d8db734df6e6 drm/bridge: Fix free wrong object in sii8620_init_rcp_input_dev
    ec3924eab533 drm/meson: osd_afbcd: Add an exit callback to struct meson_afbcd_ops
    a1c665f5b7f9 ARM: configs: multi_v5_defconfig: re-enable CONFIG_V4L_PLATFORM_DRIVERS
    1f24716e3822 ASoC: codecs: wcd934x: Add missing of_node_put() in wcd934x_codec_parse_data
    abefbf602c6a ASoC: msm8916-wcd-analog: Fix error handling in pm8916_wcd_analog_spmi_probe
    90ac679aa6a0 ASoC: atmel: Fix error handling in sam9x5_wm8731_driver_probe
    ec26e3ce3c71 ASoC: atmel: sam9x5_wm8731: use devm_snd_soc_register_card()
    541251b90338 mmc: davinci_mmc: Handle error for clk_enable
    19eb5c7957e6 ASoC: msm8916-wcd-digital: Fix missing clk_disable_unprepare() in msm8916_wcd_digital_probe
    42042c7a3ddb ASoC: imx-es8328: Fix error return code in imx_es8328_probe()
    fe4db4ea2104 ASoC: fsl_spdif: Disable TX clock when stop
    86b6cf989437 ASoC: mxs: Fix error handling in mxs_sgtl5000_probe
    c8c981cfc06d ASoC: dmaengine: do not use a NULL prepare_slave_config() callback
    f452cff02531 ASoC: SOF: Add missing of_node_put() in imx8m_probe
    0d82401d4650 ASoC: rockchip: i2s: Fix missing clk_disable_unprepare() in rockchip_i2s_probe
    7e8b0fd0ebe0 ASoC: rockchip: i2s: Use devm_platform_get_and_ioremap_resource()
    b5664a584ea2 ivtv: fix incorrect device_caps for ivtvfb
    ebd4f1501e0b media: saa7134: fix incorrect use to determine if list is empty
    dd67315994c4 media: saa7134: convert list_for_each to entry variant
    066d9b48f949 video: fbdev: omapfb: Add missing of_node_put() in dvic_probe_of
    20da8404e464 ASoC: fsi: Add check for clk_enable
    db1c00a025c6 ASoC: wm8350: Handle error for wm8350_register_irq
    662ee5ac6b45 ASoC: atmel: Add missing of_node_put() in at91sam9g20ek_audio_probe
    663e7a72871f media: vidtv: Check for null return of vzalloc
    4d68603cc438 media: stk1160: If start stream fails, return buffers with VB2_BUF_STATE_QUEUED
    b02752d75300 m68k: coldfire/device.c: only build for MCF_EDMA when h/w macros are defined
    9ca3635a0af4 arm64: dts: rockchip: Fix SDIO regulator supply properties on rk3399-firefly
    7e6f5786621d ALSA: firewire-lib: fix uninitialized flag for AV/C deferred transaction
    64eee4127c23 memory: emif: check the pointer temp in get_device_details()
    330a9b0d38e6 memory: emif: Add check for setup_interrupts
    4639c1d97f38 ASoC: soc-compress: prevent the potentially use of null pointer
    a6ee60d4a98f ASoC: dwc-i2s: Handle errors for clk_enable
    39bee81e3083 ASoC: atmel_ssc_dai: Handle errors for clk_enable
    dc947d175c17 ASoC: mxs-saif: Handle errors for clk_enable
    a754ea0de369 printk: fix return value of printk.devkmsg __setup handler
    87a265e292f8 arm64: dts: broadcom: Fix sata nodename
    f63122803d66 arm64: dts: ns2: Fix spi-cpol and spi-cpha property
    5d6a0dc6bad4 ALSA: spi: Add check for clk_enable()
    039fae34f8cd ASoC: ti: davinci-i2s: Add check for clk_enable()
    94cb9fe5d86e ASoC: rt5663: check the return value of devm_kzalloc() in rt5663_parse_dp()
    7ce3e6e1036e uaccess: fix nios2 and microblaze get_user_8()
    19894751f657 ASoC: codecs: wcd934x: fix return value of wcd934x_rx_hph_mode_put
    f126dcbe7074 media: cedrus: h264: Fix neighbour info buffer size
    c011ae1665f8 media: cedrus: H265: Fix neighbour info buffer size
    44973633b006 media: usb: go7007: s2250-board: fix leak in probe()
    ec8a37b2d9a7 media: em28xx: initialize refcount before kref_get
    1b46f57d516f media: video/hdmi: handle short reads of hdmi info frame.
    170ad3942b7b ARM: dts: imx: Add missing LVDS decoder on M53Menlo
    2a0eb50d9afd ARM: dts: sun8i: v3s: Move the csi1 block to follow address order
    77406ac6efe4 soc: ti: wkup_m3_ipc: Fix IRQ check in wkup_m3_ipc_probe
    18b2ec361a68 firmware: ti_sci: Fix compilation failure when CONFIG_TI_SCI_PROTOCOL is not defined
    8395a17ef6ba arm64: dts: qcom: sm8150: Correct TCS configuration for apps rsc
    d19248e23fbe arm64: dts: qcom: sdm845: fix microphone bias properties and values
    2042c6fbfb0f soc: qcom: aoss: remove spurious IRQF_ONESHOT flags
    5a990a65d4a3 soc: qcom: ocmem: Fix missing put_device() call in of_get_ocmem
    b5d6eba71997 soc: qcom: rpmpd: Check for null return of devm_kcalloc
    0c11cb8db49a ARM: dts: qcom: ipq4019: fix sleep clock
    22474dfd0c17 firmware: qcom: scm: Remove reassignment to desc following initializer
    bf4bad1114a3 video: fbdev: fbcvt.c: fix printing in fb_cvt_print_name()
    6de6a64f23a6 video: fbdev: atmel_lcdfb: fix an error code in atmel_lcdfb_probe()
    64ec3e678d76 video: fbdev: smscufx: Fix null-ptr-deref in ufx_usb_probe()
    0dff86aeb191 video: fbdev: controlfb: Fix COMPILE_TEST build
    ec1c20b02ae0 video: fbdev: controlfb: Fix set but not used warnings
    f8bf19f7f311 video: fbdev: matroxfb: set maxvram of vbG200eW to the same as vbG200 to avoid black screen
    3187a1d4d5c5 media: aspeed: Correct value for h-total-pixels
    245561612b49 media: hantro: Fix overfill bottom register field name
    032b141a91a8 media: meson: vdec: potential dereference of null pointer
    d3e5106c6768 media: coda: Fix missing put_device() call in coda_get_vdoa_data
    c9f4586d9935 ASoC: generic: simple-card-utils: remove useless assignment
    2c357e027725 ASoC: xilinx: xlnx_formatter_pcm: Handle sysclk setting
    712dd2ac267a media: bttv: fix WARNING regression on tunerless devices
    bc2573abc691 media: mtk-vcodec: potential dereference of null pointer
    8a83731a09a5 media: v4l2-mem2mem: Apply DST_QUEUE_OFF_BASE on MMAP buffers across ioctls
    c76188715dfc media: staging: media: zoran: fix usage of vb2_dma_contig_set_max_seg_size
    f622bd0758bd kunit: make kunit_test_timeout compatible with comment
    9e63bcb71df9 selftests, x86: fix how check_cc.sh is being invoked
    d2c53e77b043 f2fs: fix compressed file start atomic write may cause data corruption
    1c4d94e4f0b1 f2fs: compress: remove unneeded read when rewrite whole cluster
    2c4741d1b0d2 btrfs: fix unexpected error path when reflinking an inline extent
    3ef3bc75cd3e f2fs: fix to avoid potential deadlock
    85cc399b650f nfsd: more robust allocation failure handling in nfsd_file_cache_init
    1a11a873749c f2fs: fix missing free nid in f2fs_handle_failed_inode
    c0cffc1fb38d perf/x86/intel/pt: Fix address filter config for 32-bit kernel
    13c8e37e1faf perf/core: Fix address filter parser for multiple filters
    a9faa5beda6b rseq: Remove broken uapi field layout on 32-bit little endian
    f0250e05e574 rseq: Optimise rseq_get_rseq_cs() and clear_rseq_cs()
    ecc17de4b99a sched/core: Export pelt_thermal_tp
    40732cab515d sched/debug: Remove mpol_get/put and task_lock/unlock from sched_show_numa
    2b5d41bcf28f f2fs: fix to enable ATGC correctly via gc_idle sysfs interface
    9d92be1a09fb watch_queue: Actually free the watch
    5ae75b4ed303 watch_queue: Fix NULL dereference in error cleanup
    509565faed7e io_uring: terminate manual loop iterator loop correctly for non-vecs
    44a77e52bd79 clocksource: acpi_pm: fix return value of __setup handler
    d678f002f0bc hwmon: (pmbus) Add Vin unit off handling
    7ca525b4cc65 hwrng: nomadik - Change clk_disable to clk_disable_unprepare
    e4c777fd8c37 amba: Make the remove callback return void
    1c6ac39763bc vfio: platform: simplify device removal
    c93017c8d5eb crypto: ccree - Fix use after free in cc_cipher_exit()
    78622926fe01 crypto: ccp - ccp_dmaengine_unregister release dma channels
    9eeee6f684e0 ACPI: APEI: fix return value of __setup handlers
    0b45bf165932 clocksource/drivers/timer-of: Check return value of of_iomap in timer_of_base_init()
    b33c753cff6c clocksource/drivers/timer-microchip-pit64b: Use notrace
    db9d00461bdf clocksource/drivers/exynos_mct: Handle DTS with higher number of interrupts
    d4e13c4a6f41 clocksource/drivers/exynos_mct: Refactor resources allocation
    42d331a279d0 clocksource/drivers/timer-ti-dm: Fix regression from errata i940 fix
    aedff03da4a5 crypto: vmx - add missing dependencies
    51939008ca5f crypto: amlogic - call finalize with bh disabled
    24857d87cc74 crypto: sun8i-ce - call finalize with bh disabled
    bf4814d58b1b crypto: sun8i-ss - call finalize with bh disabled
    a4067ccb97e5 hwrng: atmel - disable trng on failure path
    b7940bef6f21 spi: spi-zynqmp-gqspi: Handle error for dma_set_mask
    3928a04bc65a PM: suspend: fix return value of __setup handler
    052a218db0cb PM: hibernate: fix __setup handler error handling
    0b5924a14d64 block: don't delete queue kobject before its children
    40b288a86186 nvme: cleanup __nvme_check_ids
    32c4db2a5296 hwmon: (sch56xx-common) Replace WDOG_ACTIVE with WDOG_HW_RUNNING
    ec8536f7012e hwmon: (pmbus) Add mutex to regulator ops
    18a18594ae69 spi: pxa2xx-pci: Balance reference count for PCI DMA device
    55259cb37415 crypto: ccree - don't attempt 0 len DMA mappings
    d788ad472f83 EVM: fix the evm= __setup handler return value
    a137f93ae581 audit: log AUDIT_TIME_* records only from rules
    5e9501e60b8d crypto: rockchip - ECB does not need IV
    8265bea7d8cd selftests/x86: Add validity check and allow field splitting
    f7d9249af33c arm64/mm: avoid fixmap race condition when create pud mapping
    99a8dfce7c0b spi: tegra114: Add missing IRQ check in tegra_spi_probe
    71dba67138f6 thermal: int340x: Check for NULL after calling kmemdup()
    8e57117142bb crypto: mxs-dcp - Fix scatterlist processing
    ec1d372974ec crypto: authenc - Fix sleep in atomic context in decrypt_tail
    fdfaafeb4bf8 crypto: sun8i-ss - really disable hash on A80
    19693838c82f hwrng: cavium - HW_RANDOM_CAVIUM should depend on ARCH_THUNDER
    bc20294cc8da hwrng: cavium - Check health status while reading random data
    962d1f59d5f7 selinux: check return value of sel_make_avc_files
    1ae9b020ddfc regulator: qcom_smd: fix for_each_child.cocci warnings
    c20975954e96 PCI: xgene: Revert "PCI: xgene: Fix IB window setup"
    0f56f240157d PCI: pciehp: Clear cmd_busy bit in polling mode
    89ddcc81914a drm/i915/gem: add missing boundary check in vm_access
    b84857c06ef9 drm/i915/opregion: check port number bounds for SWSCI display power state
    88975951d4e0 brcmfmac: pcie: Fix crashes due to early IRQs
    1cbcf93a93e5 brcmfmac: pcie: Replace brcmf_pcie_copy_mem_todev with memcpy_toio
    f3820ddaf4f3 brcmfmac: pcie: Release firmwares in the brcmf_pcie_setup error path
    daa07f29027c brcmfmac: firmware: Allocate space for default boardrev in nvram
    1dd031eb9910 xtensa: fix xtensa_wsr always writing 0
    dac518bbcebf xtensa: fix stop_machine_cpuslocked call in patch_text
    20f974dce5df media: davinci: vpif: fix unbalanced runtime PM enable
    7c9b915b9463 media: davinci: vpif: fix unbalanced runtime PM get
    cde90e829190 media: gpio-ir-tx: fix transmit with long spaces on Orange Pi PC
    785ffce44a1f DEC: Limit PMAX memory probing to R3k systems
    8dde2296eca1 bcache: fixup multiple threads crash
    37d2b4fa5cdd crypto: rsa-pkcs1pad - fix buffer overread in pkcs1pad_verify_complete()
    b89fb8b88242 crypto: rsa-pkcs1pad - restore signature length check
    f38c318068ee crypto: rsa-pkcs1pad - correctly get hash from source scatterlist
    c1db3f44f252 crypto: rsa-pkcs1pad - only allow with rsa
    27a6f495b63a exec: Force single empty string when argv is empty
    b02d33171dfb lib/raid6/test: fix multiple definition linking error
    bf057eac9a34 thermal: int340x: Increase bitmap size
    86a926c3f00e pstore: Don't use semaphores in always-atomic-context code
    b26f400e4fe4 carl9170: fix missing bit-wise or operator for tx_params
    3aef4df6e1cc mgag200 fix memmapsl configuration in GCTL6 register
    ef1df9168532 ARM: dts: exynos: add missing HDMI supplies on SMDK5420
    3cde68a1ebbc ARM: dts: exynos: add missing HDMI supplies on SMDK5250
    5ac205c414c5 ARM: dts: exynos: fix UART3 pins configuration in Exynos5250
    7187c9beb702 ARM: dts: at91: sama5d2: Fix PMERRLOC resource size
    2ca2a5552a83 video: fbdev: atari: Atari 2 bpp (STe) palette bugfix
    72af8810922e video: fbdev: sm712fb: Fix crash in smtcfb_read()
    ba09b0417324 drm/edid: check basic audio support on CEA extension block
    ce1927b8cfed block: don't merge across cgroup boundaries if blkcg is enabled
    6e0d24598ca0 block: limit request dispatch loop duration
    958e9b56de7b mailbox: tegra-hsp: Flush whole channel
    f67a1400788f drivers: hamradio: 6pack: fix UAF bug caused by mod_timer()
    b35eb4847182 ext4: fix fs corruption when tring to remove a non-empty directory with IO error
    a1e6884b2d28 ext4: fix ext4_fc_stats trace point
    c119fb65f6ab coredump: Also dump first pages of non-executable ELF libraries
    7ad5ccc3da7a ACPI: properties: Consistently return -ENOENT if there are no more references
    ef3a87e0c4b0 arm64: dts: ti: k3-j7200: Fix gic-v3 compatible regs
    18864e8b837a arm64: dts: ti: k3-j721e: Fix gic-v3 compatible regs
    e85fa9f4e925 arm64: dts: ti: k3-am65: Fix gic-v3 compatible regs
    7ce550a01b83 arm64: signal: nofpsimd: Do not allocate fp/simd context when not available
    210e7b43d4da udp: call udp_encap_enable for v6 sockets when enabling encap
    e1a58498ef91 powerpc/kvm: Fix kvm_use_magic_page
    d72866a7f532 can: isotp: sanitize CAN ID checks in isotp_bind()
    fde8c5cad088 drbd: fix potential silent data corruption
    b101e74f9a72 dm integrity: set journal entry unused when shrinking device
    d5d5804acc16 mm/kmemleak: reset tag when compare object pointer
    bc2f58b8e47c mm,hwpoison: unmap poisoned page before invalidation
    608c501d70bf Revert "mm: madvise: skip unmapped vma holes passed to process_madvise"
    8b354e303260 mm: madvise: return correct bytes advised with process_madvise
    928c06c11408 mm: madvise: skip unmapped vma holes passed to process_madvise
    51f7557c3cb9 ALSA: hda/realtek: Fix audio regression on Mi Notebook Pro 2020
    9017201e8d8c ALSA: pcm: Fix potential AB/BA lock with buffer_mutex and mmap_lock
    7b7a03d8b5f8 ALSA: hda: Avoid unsol event during RPM suspending
    a55e2d74232f ALSA: cs4236: fix an incorrect NULL check on list iterator
    edefc4b2a8e8 cifs: fix NULL ptr dereference in smb2_ioctl_query_info()
    9963ccea6087 cifs: prevent bad output lengths in smb2_ioctl_query_info()
    b75198eddab1 Revert "Input: clear BTN_RIGHT/MIDDLE on buttonpads"
    34bc1f69bf56 riscv: Increase stack size under KASAN
    24b9b8e95ca1 riscv: Fix fill_callchain return value
    0f8c0bd0a4cb qed: validate and restrict untrusted VFs vlan promisc mode
    a3af3d431920 qed: display VF trust config
    aa28075f06b8 scsi: libsas: Fix sas_ata_qc_issue() handling of NCQ NON DATA commands
    4bcefc78c874 mempolicy: mbind_range() set_policy() after vma_merge()
    fa37c1714367 mm: invalidate hwpoison page cache page in fault path
    7188e7c96f39 mm/pages_alloc.c: don't create ZONE_MOVABLE beyond the end of a node
    51dbb5e36d59 jffs2: fix memory leak in jffs2_scan_medium
    607d3aab7349 jffs2: fix memory leak in jffs2_do_mount_fs
    7bb7428dd739 jffs2: fix use-after-free in jffs2_clear_xattr_subsystem
    b417f9c50586 can: ems_usb: ems_usb_start_xmit(): fix double dev_kfree_skb() in error path
    3a21ee89bc22 mtd: rawnand: protect access to rawnand devices while in suspend
    145a63201d00 spi: mxic: Fix the transmit path
    be22ebe79e64 pinctrl: samsung: drop pin banks references on error paths
    b97b305656a7 remoteproc: Fix count check in rproc_coredump_write()
    784630df174f f2fs: fix to do sanity check on .cp_pack_total_block_count
    e58ee6bd939b f2fs: quota: fix loop condition at f2fs_quota_sync()
    ec67040703c8 f2fs: fix to unlock page correctly in error path of is_alive()
    7af164fa2f1a NFSD: prevent integer overflow on 32 bit systems
    65e21cc042f4 NFSD: prevent underflow in nfssvc_decode_writeargs()
    b7b430104a14 SUNRPC: avoid race between mod_timer() and del_timer_sync()
    f51ab2f60a44 HID: intel-ish-hid: Use dma_alloc_coherent for firmware update
    a1df8e60f25a firmware: stratix10-svc: add missing callback parameter on RSU
    e94f5fbe7ab3 Documentation: update stable tree link
    f4bab992ee25 Documentation: add link to stable release candidate tree
    10ee5662d5a6 KEYS: fix length validation in keyctl_pkey_params_get_2()
    5a41a3033a93 ptrace: Check PTRACE_O_SUSPEND_SECCOMP permission on PTRACE_SEIZE
    2775d8e36436 clk: uniphier: Fix fixed-rate initialization
    25cd5872d9a7 greybus: svc: fix an error handling bug in gb_svc_hello()
    9f0cd8117457 iio: inkern: make a best effort on offset calculation
    19e533452fbe iio: inkern: apply consumer scale when no channel scale is available
    e10dbe7f6ac1 iio: inkern: apply consumer scale on IIO_VAL_INT cases
    9f4fffc2ab26 iio: afe: rescale: use s64 for temporary scale calculations
    9cd1b02655c7 coresight: Fix TRCCONFIGR.QE sysfs interface
    7b478cb67b8c mei: avoid iterator usage outside of list_for_each_entry
    ec8975417d71 mei: me: add Alder Lake N device id.
    0a0c61dd071d xhci: fix uninitialized string returned by xhci_decode_ctrl_ctx()
    811f40351949 xhci: make xhci_handshake timeout for xhci_reset() adjustable
    3a820d1ca123 xhci: fix runtime PM imbalance in USB2 resume
    c41387f96a22 xhci: fix garbage USBSTS being logged in some cases
    1e0f089f70db USB: usb-storage: Fix use of bitfields for hardware data in ene_ub6250.c
    39a70732eb52 virtio-blk: Use blk_validate_block_size() to validate block size
    290e05f346d1 tpm: fix reference counting for struct tpm_chip
    fcd3c31dd160 iommu/iova: Improve 32-bit free space estimate
    68c80088f52b locking/lockdep: Avoid potential access of invalid memory in lock_class
    f19d8dfad67b net: dsa: microchip: add spi_device_id tables
    8d3f4ad43054 af_key: add __GFP_ZERO flag for compose_sadb_supported in function pfkey_register
    ef1a6ab36dc3 Input: zinitix - do not report shadow fingers
    21680aabc4d3 spi: Fix erroneous sgs value with min_t()
    8fb7af1b5a83 Revert "gpio: Revert regression in sysfs-gpio (gpiolib.c)"
    18a4417a192f net:mcf8390: Use platform_get_irq() to get the interrupt
    102d7f6c2eff spi: Fix invalid sgs value
    a4f4ce3deedb gpio: Revert regression in sysfs-gpio (gpiolib.c)
    fc9a35627c3d ethernet: sun: Free the coherent when failing in probing
    3c8447192532 tools/virtio: fix virtio_test execution
    6d98dc2369b1 vdpa/mlx5: should verify CTRL_VQ feature exists for MQ
    c97ffb4184f0 virtio_console: break out of buf poll on remove
    0c00d38337ec ARM: mstar: Select HAVE_ARM_ARCH_TIMER
    a7e75e5ed417 xfrm: fix tunnel model fragmentation behavior
    e05ae08ea82f HID: logitech-dj: add new lightspeed receiver id
    ff919a7ad90c netdevice: add the case if dev is NULL
    c4dc584a2d4c hv: utils: add PTP_1588_CLOCK to Kconfig to fix build
    d136a2574a45 USB: serial: simple: add Nokia phone driver
    38e3d48ffebf USB: serial: pl2303: add IBM device IDs
    d4d975e79210 swiotlb: fix info leak with DMA_FROM_DEVICE

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f7e9526058bec6eafce8b1f62a1af798a0998bf4)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 3ff54b9ebb..b8a280a615 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "40a6731993d406d6c9fed43cb20c6a4f178ff2cc"
-SRCREV_meta ?= "2278ed571c14df6e87d8e01ac26f649d98020623"
+SRCREV_machine ?= "c11f8738640c3c52f4ffc2adf9aa8f6c097e4a4e"
+SRCREV_meta ?= "0959fd4d1eeb5312233be7a3c1f9a97104163f90"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.109"
+LINUX_VERSION ?= "5.10.110"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index bbaa0ebc00..bafa486d23 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.109"
+LINUX_VERSION ?= "5.10.110"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "9524d0ca0feeeb4cb698e3c984f4391ccb4b8e19"
-SRCREV_machine ?= "bccf3a5f14511fb8ce6a9dd990216508d2c2ec6e"
-SRCREV_meta ?= "2278ed571c14df6e87d8e01ac26f649d98020623"
+SRCREV_machine:qemuarm ?= "3851408a9f5d9d4531f29340056a1089debd5b58"
+SRCREV_machine ?= "0a47fd76cb0f7e22d47afcb88bf884c750ba5d92"
+SRCREV_meta ?= "0959fd4d1eeb5312233be7a3c1f9a97104163f90"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 0cf14b748f..72293768dd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "dfeff112cafaf3a04da6cd60301d297406e1b77f"
-SRCREV_machine:qemuarm64 ?= "3641e4234255c71c33cb2d9422f54c17b70c8941"
-SRCREV_machine:qemumips ?= "7eead19134a43cf9ccc0fa9d75c45be2a7743f13"
-SRCREV_machine:qemuppc ?= "6e1d66b2a871be0450722a50fc087ff8ccbcddd7"
-SRCREV_machine:qemuriscv64 ?= "d2f7a595bf0b752275d503046494b668549cb151"
-SRCREV_machine:qemuriscv32 ?= "d2f7a595bf0b752275d503046494b668549cb151"
-SRCREV_machine:qemux86 ?= "d2f7a595bf0b752275d503046494b668549cb151"
-SRCREV_machine:qemux86-64 ?= "d2f7a595bf0b752275d503046494b668549cb151"
-SRCREV_machine:qemumips64 ?= "279f142932679a8ba212ebae4b9db851636a1fab"
-SRCREV_machine ?= "d2f7a595bf0b752275d503046494b668549cb151"
-SRCREV_meta ?= "2278ed571c14df6e87d8e01ac26f649d98020623"
+SRCREV_machine:qemuarm ?= "57b5655b013a22f0113b6013a6bd5de54706ef9f"
+SRCREV_machine:qemuarm64 ?= "bf0139126d85c19b9dc24d4f00678d5af59f468c"
+SRCREV_machine:qemumips ?= "958e550bd92ce1daf6e0cb80b987d2baf29b0636"
+SRCREV_machine:qemuppc ?= "b7ba6c15206a602b008f34d358606bac062aa2e8"
+SRCREV_machine:qemuriscv64 ?= "a275cd6839513c72ceae989a575b6accbb262016"
+SRCREV_machine:qemuriscv32 ?= "a275cd6839513c72ceae989a575b6accbb262016"
+SRCREV_machine:qemux86 ?= "a275cd6839513c72ceae989a575b6accbb262016"
+SRCREV_machine:qemux86-64 ?= "a275cd6839513c72ceae989a575b6accbb262016"
+SRCREV_machine:qemumips64 ?= "36a2d17167ee66a2feda5fb1efee0a2ee2dc4740"
+SRCREV_machine ?= "a275cd6839513c72ceae989a575b6accbb262016"
+SRCREV_meta ?= "0959fd4d1eeb5312233be7a3c1f9a97104163f90"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.109"
+LINUX_VERSION ?= "5.10.110"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.35.3


