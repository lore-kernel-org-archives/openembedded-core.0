Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11052C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:14:11 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.26624.1646662445881657083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:14:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=aOooqEuW;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662450; x=1678198450;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=YBaad2Ra+w4ReKtAdhcvtG1UGCQCfLTpNBBBu5QqFFc=;
  b=aOooqEuWC0GsIS7xDquA86B7pDIUXw4TnV3N345FJhcXKJMGYQCmiTOa
   cxaUdAfVQmSE4IKjk4Mv9V1MTKcf3bzP8AOB16AAHiNAg32YT50uw6ORj
   r2H/jd/rmgEhv8+C0a/VffDijEZqPVYxd+n84szWFlY4vHu6Lu6gFdrlD
   Be9AOeTPyqLX90SRQL9jkRe+ITgFS8thDsZ8TYRnf+8DbcITKYqnUJBFT
   kcUqitVhe+06Re0waTd2oGRfB8kMLhmOPFPaGE5z9JnZslCTCwLmthl2f
   OuxPwK5MfmlZILvuWkLXkOmf06o839kxo/jr/Cme0MdxPINk50gqJ8xDE
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112609"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112609"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:45 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070953"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:43 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 24/25] linux-yocto/5.10: update to v5.10.103
Date: Mon,  7 Mar 2022 22:10:00 +0800
Message-Id: 
 <d573ee9b1c0a932b5f8337549133c000213f1218.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:14:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162845

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    915a747ac7f3 Linux 5.10.103
    78706b051a8a memblock: use kfree() to release kmalloced memblock regions
    4185b788d3ad gpio: tegra186: Fix chip_data type confusion
    bb2e0a77235a tty: n_gsm: fix deadlock in gsmtty_open()
    e4c8cb95d035 tty: n_gsm: fix wrong tty control line for flow control
    1f0641dd0b6c tty: n_gsm: fix NULL pointer access due to DLCI release
    1e35cb9e1271 tty: n_gsm: fix proper link termination after failed open
    90b47e617fb2 tty: n_gsm: fix encoding of control signal octet bit DV
    9e2dbc31e367 riscv: fix oops caused by irqsoff latency tracer
    e098933866f9 thermal: int340x: fix memory leak in int3400_notify()
    5b1cef5798b4 RDMA/cma: Do not change route.addr.src_addr outside state checks
    8fe4da55246a driver core: Free DMA range map when device is released
    214824764308 xhci: Prevent futile URB re-submissions due to incorrect return value.
    0b0a229da1f2 xhci: re-initialize the HC during resume if HCE was set
    328faee6d409 usb: dwc3: gadget: Let the interrupt handler disable bottom halves.
    e57bdee8661e usb: dwc3: pci: Fix Bay Trail phy GPIO mappings
    99b2425d9178 usb: dwc2: drd: fix soft connect when gadget is unconfigured
    c7866880377b USB: serial: option: add Telit LE910R1 compositions
    220ba174f192 USB: serial: option: add support for DW5829e
    3a1dd56e566f tracefs: Set the group ownership in apply_options() not parse_options()
    bfa8ffbaaaaf USB: gadget: validate endpoint index for xilinx udc
    4ce247af3f30 usb: gadget: rndis: add spinlock for rndis response list
    ddc254fc8873 Revert "USB: serial: ch341: add new Product ID for CH341A"
    d3fce1b6bd95 ata: pata_hpt37x: disable primary channel on HPT371
    18701d8afaa1 sc16is7xx: Fix for incorrect data being transmitted
    d5ddd7343adf iio: Fix error handling for PM
    eabcc609cb8a iio: imu: st_lsm6dsx: wait for settling time in st_lsm6dsx_read_oneshot
    b8d411a96227 iio: adc: ad7124: fix mask used for setting AIN_BUFP & AIN_BUFM bits
    1aa12ecfdcba iio: adc: men_z188_adc: Fix a resource leak in an error handling path
    afbeee13beb5 tracing: Have traceon and traceoff trigger honor the instance
    99eb8d694174 RDMA/ib_srp: Fix a deadlock
    a7ab53d3c27d configfs: fix a race in configfs_{,un}register_subsystem()
    0ecd3e35d78e RDMA/rtrs-clt: Move free_permit from free_clt to rtrs_clt_close
    b0ecf9e59414 RDMA/rtrs-clt: Kill wait_for_inflight_permits
    8260f1800f83 RDMA/rtrs-clt: Fix possible double free in error case
    dc64aa4c7dc0 regmap-irq: Update interrupt clear register for proper reset
    2efece1368ae spi: spi-zynq-qspi: Fix a NULL pointer dereference in zynq_qspi_exec_mem_op()
    67819b983eb3 net/mlx5e: kTLS, Use CHECKSUM_UNNECESSARY for device-offloaded packets
    be55d3e76c0e net/mlx5: Fix wrong limitation of metadata match on ecpf
    8d617110d78e net/mlx5: Fix possible deadlock on rule deletion
    1c5912895545 udp_tunnel: Fix end of loop test in udp_tunnel_nic_unregister()
    a184f4dd9b33 surface: surface3_power: Fix battery readings on batteries without a serial number
    91f56a85278e net/smc: Use a mutex for locking "struct smc_pnettable"
    7e9880e81d3f netfilter: nf_tables: fix memory leak during stateful obj update
    af4bc921d39d nfp: flower: Fix a potential leak in nfp_tunnel_add_shared_mac()
    58a6d5f24f49 net: Force inlining of checksum functions in net/checksum.h
    550d98ab3007 net: ll_temac: check the return value of devm_kmalloc()
    0fc184735996 net/sched: act_ct: Fix flow table lookup after ct clear or switching zones
    bc8f768af342 net/mlx5e: Fix wrong return value on ioctl EEPROM query failure
    fd020eaaa24a drm/edid: Always set RGB444
    1df9d552fe84 openvswitch: Fix setting ipv6 fields causing hw csum failure
    dac2490d9ee0 gso: do not skip outer ip header in case of ipip and net_failover
    b692d5dc6f54 tipc: Fix end of loop tests for list_for_each_entry()
    c5722243d0e5 net: __pskb_pull_tail() & pskb_carve_frag_list() drop_monitor friends
    4a93c6594613 io_uring: add a schedule point in io_add_buffers()
    7ef94bfb08fb bpf: Add schedule points in batch ops
    4f5d47e6b43f selftests: bpf: Check bpf_msg_push_data return value
    d0caa7218d76 bpf: Do not try bpf_msg_push_data with len 0
    962b2a3188bf hwmon: Handle failure to register sensor with thermal zone correctly
    d8b78314c5ba bnxt_en: Fix active FEC reporting to ethtool
    7e1eae5d1a7c bnx2x: fix driver load from initrd
    51e96061c66c perf data: Fix double free in perf_session__delete()
    5419b5be883b ping: remove pr_err from ping_lookup
    5da17865c7f3 optee: use driver internal tee_context for some rpc
    eb354613847d tee: export teedev_open() and teedev_close_context()
    bae7fc6f0dc6 x86/fpu: Correct pkru/xstate inconsistency
    68f19845f580 netfilter: nf_tables_offload: incorrect flow offload action array size
    69560efa0013 CDC-NCM: avoid overflow in sanity checking
    2aeba1ea7ce8 USB: zaurus: support another broken Zaurus
    4f5f5411f0c1 sr9700: sanity check for packet length
    55eec5c630ea drm/i915: Correctly populate use_sagv_wm for all pipes
    ff9134882dfa drm/amdgpu: disable MMHUB PG for Picasso
    72fdfc75d421 KVM: x86/mmu: make apf token non-zero to fix bug
    646b532f32ea parisc/unaligned: Fix ldw() and stw() unalignment handlers
    397b5433f742 parisc/unaligned: Fix fldd and fstd unaligned handlers on 32-bit kernel
    698dc7d13c4e vhost/vsock: don't check owner in vhost_vsock_stop() while releasing
    84e303b4d53f clk: jz4725b: fix mmc0 clock gating
    72a5b01875b2 btrfs: tree-checker: check item_size for dev_item
    5c967dd07311 btrfs: tree-checker: check item_size for inode_item
    fcec42dd28d6 cgroup/cpuset: Fix a race between cpuset_attach() and cpu hotplug
    47667effb7d2 Linux 5.10.102
    6062d1267ff3 lockdep: Correct lock_classes index mapping
    f333c1916fd6 i2c: brcmstb: fix support for DSL and CM variants
    9fee985f9afa copy_process(): Move fd_install() out of sighand->siglock critical section
    e3fdbc40b750 i2c: qcom-cci: don't put a device tree node before i2c_add_adapter()
    b5b2a9211713 i2c: qcom-cci: don't delete an unregistered adapter
    3b6d25d1b6a2 dmaengine: sh: rcar-dmac: Check for error num after dma_set_max_seg_size
    2c35c95d3640 dmaengine: stm32-dmamux: Fix PM disable depth imbalance in stm32_dmamux_probe
    4f907b6eb701 dmaengine: sh: rcar-dmac: Check for error num after setting mask
    797b380f0756 net: sched: limit TC_ACT_REPEAT loops
    595c259f75ae EDAC: Fix calculation of returned address and next offset in edac_align_ptr()
    f6ce4e328939 scsi: lpfc: Fix pt2pt NVMe PRLI reject LOGO loop
    3680b2b8104b kconfig: fix failing to generate auto.conf
    b6787e284d3d net: macb: Align the dma and coherent dma masks
    439171a2917c net: usb: qmi_wwan: Add support for Dell DW5829e
    15616ba17d02 tracing: Fix tp_printk option related with tp_printk_stop_on_boot
    5a253a23d9f1 drm/rockchip: dw_hdmi: Do not leave clock enabled in error case
    1e7433fb95cc xprtrdma: fix pointer derefs in error cases of rpcrdma_ep_create
    a21f472fb5cc soc: aspeed: lpc-ctrl: Block error printing on probe defer cases
    fecb05b1ce6b ata: libata-core: Disable TRIM on M88V29
    b19ec7afa929 lib/iov_iter: initialize "flags" in new pipe_buffer
    30455322787a kconfig: let 'shell' return enough output for deep path names
    e05dde47f52a selftests: fixup build warnings in pidfd / clone3 tests
    531a56c2e0bf pidfd: fix test failure due to stack overflow on some arches
    429ef36c4fc4 arm64: dts: meson-g12: drop BL32 region from SEI510/SEI610
    1415f22ee541 arm64: dts: meson-g12: add ATF BL32 reserved-memory region
    605080f19eb7 arm64: dts: meson-gx: add ATF BL32 reserved-memory region
    eefb68794f94 netfilter: conntrack: don't refresh sctp entries in closed state
    1ab48248573b irqchip/sifive-plic: Add missing thead,c900-plic match string
    98bc06c46d1f phy: usb: Leave some clocks running during suspend
    717f2fa85822 ARM: OMAP2+: adjust the location of put_device() call in omapdss_init_of
    6932353af74c ARM: OMAP2+: hwmod: Add of_node_put() before break
    521dcc107e39 NFS: Don't set NFS_INO_INVALID_XATTR if there is no xattr cache
    fb00319afb72 KVM: x86/pmu: Use AMD64_RAW_EVENT_MASK for PERF_TYPE_RAW
    0ee4bb8ce8b8 KVM: x86/pmu: Don't truncate the PerfEvtSeln MSR when creating a perf event
    99cd2a043760 KVM: x86/pmu: Refactoring find_arch_event() to pmc_perf_hw_id()
    91d8866ca552 Drivers: hv: vmbus: Fix memory leak in vmbus_add_channel_kobj
    a176d559e826 mtd: rawnand: brcmnand: Fixed incorrect sub-page ECC status
    1a49b1b0b0cb mtd: rawnand: qcom: Fix clock sequencing in qcom_nandc_probe()
    8c848744c11b tty: n_tty: do not look ahead for EOL character past the end of the buffer
    8daa0436ce79 NFS: Do not report writeback errors in nfs_getattr()
    f9b7385c0f62 NFS: LOOKUP_DIRECTORY is also ok with symlinks
    598dbaf74b64 block/wbt: fix negative inflight counter when remove scsi device
    dc6faa0ede4d ASoC: tas2770: Insert post reset delay
    9dcedbe943be KVM: SVM: Never reject emulation due to SMAP errata for !SEV guests
    a4eeeaca5019 mtd: rawnand: gpmi: don't leak PM reference in error path
    fb26219b4046 powerpc/lib/sstep: fix 'ptesync' build error
    54f76366cd01 ASoC: ops: Fix stereo change notifications in snd_soc_put_volsw_range()
    0df1badfdfcd ASoC: ops: Fix stereo change notifications in snd_soc_put_volsw()
    1ef76832fef3 ALSA: hda: Fix missing codec probe on Shenker Dock 15
    c72c3b597a79 ALSA: hda: Fix regression on forced probe mask option
    63b1602c2fd5 ALSA: hda/realtek: Fix deadlock by COEF mutex
    b6a5e8f45f89 ALSA: hda/realtek: Add quirk for Legion Y9000X 2019
    67de71b94331 selftests/exec: Add non-regular to TEST_GEN_PROGS
    d3018a196221 perf bpf: Defer freeing string after possible strlen() on it
    016e3ca9c588 dpaa2-eth: Initialize mutex used in one step timestamping path
    50f3b00d4c7b libsubcmd: Fix use-after-free for realloc(..., 0)
    ffa8df4f0e8f bonding: fix data-races around agg_select_timer
    d9bd9d4c60c3 net_sched: add __rcu annotation to netdev->qdisc
    877a05672f95 drop_monitor: fix data-race in dropmon_net_event / trace_napi_poll_hit
    a0e004e6206e bonding: force carrier update when releasing slave
    8dec3c4e7350 ping: fix the dif and sdif check in ping_lookup
    6793a9b028ce net: ieee802154: ca8210: Fix lifs/sifs periods
    f48bd3413771 net: dsa: lantiq_gswip: fix use after free in gswip_remove()
    d9b2203e5a30 net: dsa: lan9303: fix reset on probe
    4f523f15e5d7 ipv6: per-netns exclusive flowlabel checks
    100344200a0c netfilter: nft_synproxy: unregister hooks on init error path
    26931971db5f selftests: netfilter: fix exit value for nft_concat_range
    b26ea3f6b7b0 iwlwifi: pcie: gen2: fix locking when "HW not ready"
    8867f993790d iwlwifi: pcie: fix locking when "HW not ready"
    f3c1910257c8 drm/i915/gvt: Make DRM_I915_GVT depend on X86
    87cd1bbd6677 vsock: remove vsock from connected table when connect is interrupted by a signal
    eb7bf11e8ef1 drm/i915/opregion: check port number bounds for SWSCI display power state
    5564d83ebc1b drm/radeon: Fix backlight control on iMac 12,1
    008508c16af0 iwlwifi: fix use-after-free
    44b81136e868 kbuild: lto: Merge module sections if and only if CONFIG_LTO_CLANG is enabled
    8b53e5f737bc kbuild: lto: merge module sections
    45102b538a9e random: wake up /dev/random writers after zap
    143aaf79bafa gcc-plugins/stackleak: Use noinstr in favor of notrace
    de55891e162c Revert "module, async: async_synchronize_full() on module init iff async is used"
    3c958dbcba18 x86/Xen: streamline (and fix) PV CPU enumeration
    e76d0a9692c5 drm/amdgpu: fix logic inversion in check
    324f5bdc52ec nvme-rdma: fix possible use-after-free in transport error_recovery work
    e192184cf8bc nvme-tcp: fix possible use-after-free in transport error_recovery work
    0ead57ceb21b nvme: fix a possible use-after-free in controller reset during load
    fe9ac3eaa2e3 scsi: pm8001: Fix use-after-free for aborted SSP/STP sas_task
    d872e7b5fe38 scsi: pm8001: Fix use-after-free for aborted TMF sas_task
    1e73f5cfc160 quota: make dquot_quota_sync return errors from ->sync_fs
    c405640aad56 vfs: make freeze_super abort when sync_filesystem returns error
    b9a229fd48bf ax25: improve the incomplete fix to avoid UAF and NPD bugs
    139fce2992ee selftests: skip mincore.check_file_mmap when fs lacks needed support
    204a2390da42 selftests: openat2: Skip testcases that fail with EOPNOTSUPP
    2be48bfac713 selftests: openat2: Add missing dependency in Makefile
    74a30666b4b5 selftests: openat2: Print also errno in failure messages
    bfc84cfd909b selftests/zram: Adapt the situation that /dev/zram0 is being used
    f0eba714c11d selftests/zram01.sh: Fix compression ratio calculation
    7bb704b69fb1 selftests/zram: Skip max_comp_streams interface on newer kernel
    0fd484644c68 net: ieee802154: at86rf230: Stop leaking skb's
    0c18a751930c kselftest: signal all child processes
    1136141f19ab selftests: rtc: Increase test timeout so that all tests run
    79175b6ee658 platform/x86: ISST: Fix possible circular locking dependency detected
    066c905ed06c platform/x86: touchscreen_dmi: Add info for the RWC NANOTE P8 AY07J 2-in-1
    0b17d4b51c63 btrfs: send: in case of IO error log it
    78a68bbebdcc parisc: Add ioread64_lo_hi() and iowrite64_lo_hi()
    ade1077c7fc0 PCI: hv: Fix NUMA node assignment when kernel boots with custom NUMA topology
    254090925e16 mm: don't try to NUMA-migrate COW pages that have other uses
    ab2b4e65a130 mmc: block: fix read single on recovery logic
    775671687299 parisc: Fix sglist access in ccio-dma.c
    f8f519d7df66 parisc: Fix data TLB miss in sba_unmap_sg
    4d569b959e54 parisc: Drop __init from map_pages declaration
    8e3f9a098eca serial: parisc: GSC: fix build when IOSAPIC is not set
    fe383750d40d Revert "svm: Add warning message for AVIC IPI invalid target"
    126382b5565f HID:Add support for UGTABLET WP5540
    f100e758cef5 scsi: lpfc: Fix mailbox command failure during driver initialization
    4578b979ef61 can: isotp: add SF_BROADCAST support for functional addressing
    5d42865fc311 can: isotp: prevent race between isotp_bind() and isotp_setsockopt()
    db3f3636e4ae fs/proc: task_mmu.c: don't read mapcount for migration entry
    0849f83e4782 fget: clarify and improve __fget_files() implementation
    657991fb06a4 rcu: Do not report strict GPs for outgoing CPUs
    8c8385972ea9 mm: memcg: synchronize objcg lists with a dedicated spinlock
    d0f4aa2d978f drm/nouveau/pmu/gm200-: use alternate falcon reset sequence

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1e234210aa40655d14cf6c5b12cd5d39b460b1e9)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index d9e91856ce..70b572e808 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b8dfdbe4d5a7b790bd2ecdb2889846e036469d25"
-SRCREV_meta ?= "f323785b54712f92ad8cae06e2711a01d66d4fdf"
+SRCREV_machine ?= "abd24ddc62072fcc5ecf12cf8feadd2e6fda59bd"
+SRCREV_meta ?= "792f1272dd0d68d5dba0ff35949b2094f818227e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.101"
+LINUX_VERSION ?= "5.10.103"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index dbc0a6e90d..9e954e45de 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.101"
+LINUX_VERSION ?= "5.10.103"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "e6fb3720c9823cc706e8c6441cfd382b52bf7ae5"
-SRCREV_machine ?= "57631093be11dd9606bbe8916b9f35bc9b6fe130"
-SRCREV_meta ?= "f323785b54712f92ad8cae06e2711a01d66d4fdf"
+SRCREV_machine:qemuarm ?= "682b9a24accb1e3a305957dec28f7f565db95369"
+SRCREV_machine ?= "5e844e753c3e1f153af9dfee6b88e5dc1e57f30f"
+SRCREV_meta ?= "792f1272dd0d68d5dba0ff35949b2094f818227e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index bbca0ffed5..86d9559469 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "778c2d4c9a4798b90ed3b5609ccbc2fa8b785778"
-SRCREV_machine:qemuarm64 ?= "6c6e9a984aa0a6bb2a11528c27023c588064422d"
-SRCREV_machine:qemumips ?= "3bcde31e0d5e48a2fd21f7d6300a7b5d625e5760"
-SRCREV_machine:qemuppc ?= "20fb5e330325ade20c8c3c2de7a64d9994298af6"
-SRCREV_machine:qemuriscv64 ?= "253c752ed120276124a8463d996b30af0db6f547"
-SRCREV_machine:qemuriscv32 ?= "253c752ed120276124a8463d996b30af0db6f547"
-SRCREV_machine:qemux86 ?= "253c752ed120276124a8463d996b30af0db6f547"
-SRCREV_machine:qemux86-64 ?= "253c752ed120276124a8463d996b30af0db6f547"
-SRCREV_machine:qemumips64 ?= "89e951f3655bd59f7564bd09c106186833702f12"
-SRCREV_machine ?= "253c752ed120276124a8463d996b30af0db6f547"
-SRCREV_meta ?= "f323785b54712f92ad8cae06e2711a01d66d4fdf"
+SRCREV_machine:qemuarm ?= "56cfcfb12870782355bacaf8bcde9e268f422140"
+SRCREV_machine:qemuarm64 ?= "3aab5bb12bc180d582a6f82e4a085f45a7b0c283"
+SRCREV_machine:qemumips ?= "d76ec4c19a876a3235567ab2cee2e33f2875f79a"
+SRCREV_machine:qemuppc ?= "513a8885de593e8b1f3c24595c015bb9b1d55563"
+SRCREV_machine:qemuriscv64 ?= "de1b3b1aef1a5c3dec0676e152f6801e1cc309e5"
+SRCREV_machine:qemuriscv32 ?= "de1b3b1aef1a5c3dec0676e152f6801e1cc309e5"
+SRCREV_machine:qemux86 ?= "de1b3b1aef1a5c3dec0676e152f6801e1cc309e5"
+SRCREV_machine:qemux86-64 ?= "de1b3b1aef1a5c3dec0676e152f6801e1cc309e5"
+SRCREV_machine:qemumips64 ?= "b63b87635569c07343f25194abf008f1e27c0bca"
+SRCREV_machine ?= "de1b3b1aef1a5c3dec0676e152f6801e1cc309e5"
+SRCREV_meta ?= "792f1272dd0d68d5dba0ff35949b2094f818227e"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.101"
+LINUX_VERSION ?= "5.10.103"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.35.1


