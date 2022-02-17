Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6597C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 14:18:38 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.318.1645107508890252839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 06:18:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=hFPS4YhE;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645107518; x=1676643518;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=NgIL4bujgXnkZehnAvja8qG5qxJhgsvjjR5DSDRKOak=;
  b=hFPS4YhELDNUaQ1UQIWzFx2VzdUvZ80uiQX0aB/v4QtYcCg3z8TRMPkn
   Xgd1lXRL++AKbtiWJoDQ38FO1sC5K0dU09uiWgjNogrGq0VfI8pMhA8eC
   opAzqSB+QQChyptWwZM4kPONJz0Ho+7eP074XcMRjle4hcr2x7F3wOa84
   YwFmMEqqD2nmh+6Iul6LxxNLWdkeunrVIdHiGGsDXNWkzeyxjqIBngoxL
   9jkEq5uw3deGqzzTTUf3pwLDyc8mwsVpFusK+yi7U4nYtnE9KtoRuvZt6
   j009C2rjdgoqMTIIFi4RcVj28djmvyvQpqBdK8WbUeUKwXxxms2Uy3bRJ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="250617996"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600";
   d="scan'208";a="250617996"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:18:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600";
   d="scan'208";a="530249256"
Received: from kkoay3-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.130.102])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:18:35 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 06/14] linux-yocto/5.10: update to v5.10.96
Date: Thu, 17 Feb 2022 22:18:15 +0800
Message-Id: 
 <5e9acfd90afd80bb2188e5e4e93ee786c41714e7.1645106980.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645106980.git.anuj.mittal@intel.com>
References: <cover.1645106980.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 14:18:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161806

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    f255ac9e8776 Linux 5.10.96
    b43e9d2f6fc7 mtd: rawnand: mpc5121: Remove unused variable in ads5121_select_chip()
    b63e120189fd block: Fix wrong offset in bio_truncate()
    0b4e82403c84 fsnotify: invalidate dcache before IN_DELETE event
    8bae6db29c7f usr/include/Makefile: add linux/nfc.h to the compile-test coverage
    f36554de7897 dt-bindings: can: tcan4x5x: fix mram-cfg RX FIFO config
    446ff1fc37c7 net: bridge: vlan: fix memory leak in __allowed_ingress
    bc58a5bb9e6c ipv4: remove sparse error in ip_neigh_gw4()
    ebc5b8e471e5 ipv4: tcp: send zero IPID in SYNACK messages
    58f72918f942 ipv4: raw: lock the socket in raw_bind()
    9ffc94a81b0f net: bridge: vlan: fix single net device option dumping
    869f1704f1c2 Revert "ipv6: Honor all IPv6 PIO Valid Lifetime values"
    699eef4ed910 net: hns3: handle empty unknown interrupt for VF
    c9c81b393c74 net: cpsw: Properly initialise struct page_pool_params
    729e54636b3e yam: fix a memory leak in yam_siocdevprivate()
    93a6e920d8cc drm/msm/dpu: invalid parameter check in dpu_setup_dspp_pcc
    0b7d8db87d0b drm/msm/hdmi: Fix missing put_device() call in msm_hdmi_get_phy
    d1d4616d3e75 video: hyperv_fb: Fix validation of screen resolution
    0a60d04abc62 ibmvnic: don't spin in tasklet
    55258b505996 ibmvnic: init ->running_cap_crqs early
    b469cf91fb63 ipv4: fix ip option filtering for locally generated fragments
    9b4444197252 net: ipv4: Fix the warning for dereference
    2f56c4845df9 net: ipv4: Move ip_options_fragment() out of loop
    55402a461872 powerpc/perf: Fix power_pmu_disable to call clear_pmi_irq_pending only if PMI is pending
    0bdbf93ee253 hwmon: (lm90) Mark alert as broken for MAX6654
    c534287a57dc efi/libstub: arm64: Fix image check alignment at entry
    3572205b194c rxrpc: Adjust retransmission backoff
    5067f5699de7 octeontx2-pf: Forward error codes to VF
    bd024e36f681 phylib: fix potential use-after-free
    a839a79f4d6b net: phy: broadcom: hook up soft_reset for BCM54616S
    57b2f3632b2f sched/pelt: Relax the sync of util_sum with util_avg
    91b04e83c710 perf: Fix perf_event_read_local() time
    cffed7e631b5 kernel: delete repeated words in comments
    1af995c98b81 netfilter: conntrack: don't increment invalid counter on NF_REPEAT
    129c71829d7f powerpc64/bpf: Limit 'ldbrx' to processors compliant with ISA v2.06
    7a32824f7a9c NFS: Ensure the server has an up to date ctime before renaming
    666f6ab882ea NFS: Ensure the server has an up to date ctime before hardlinking
    4cd0ef621509 ipv6: annotate accesses to fn->fn_sernum
    79c0b5287ded drm/msm/dsi: invalid parameter check in msm_dsi_phy_enable
    3ab44a408bba drm/msm/dsi: Fix missing put_device() call in dsi_get_phy
    82c310d04b0f drm/msm: Fix wrong size calculation
    f57a99c9a55c net-procfs: show net devices bound packet types
    87880e3803ce NFSv4: nfs_atomic_open() can race when looking up a non-regular file
    ce8c552b88ca NFSv4: Handle case where the lookup of a directory fails
    b48a05cee2c0 hwmon: (lm90) Reduce maximum conversion rate for G781
    b26fed25e67b ipv4: avoid using shared IP generator for connected sockets
    283aa5a5afbc ping: fix the sk_bound_dev_if match in ping_lookup
    7bcb0c19abf4 hwmon: (lm90) Mark alert as broken for MAX6680
    925cbd596aa2 hwmon: (lm90) Mark alert as broken for MAX6646/6647/6649
    db044d97460e net: fix information leakage in /proc/net/ptype
    feb770cc00a8 ipv6_tunnel: Rate limit warning messages
    00849de10f79 scsi: bnx2fc: Flush destroy_work queue before calling bnx2fc_interface_put()
    fcaf94c49a84 rpmsg: char: Fix race between the release of rpmsg_eptdev and cdev
    1dbb206730f3 rpmsg: char: Fix race between the release of rpmsg_ctrldev and cdev
    20f667582189 usb: roles: fix include/linux/usb/role.h compile issue
    6aeff8a7c742 i40e: fix unsigned stat widths
    d2ed5997a94b i40e: Fix for failed to init adminq while VF reset
    768eb705e638 i40e: Fix queues reservation for XDP
    39896710f732 i40e: Fix issue when maximum queues is exceeded
    9068bcb2195b i40e: Increase delay to 1 s after global EMP reset
    b4c9b6afa3a7 powerpc/32: Fix boot failure with GCC latent entropy plugin
    50f5d0a8bd0e powerpc/32s: Fix kasan_init_region() for KASAN
    5d3af1dfdf0f powerpc/32s: Allocate one 256k IBAT instead of two consecutives 128k IBATs
    08f090bb9b69 x86/MCE/AMD: Allow thresholding interface updates after init
    791e5d5daa2c sched/membarrier: Fix membarrier-rseq fence command missing from query bitmask
    afbde455ebf4 ocfs2: fix a deadlock when commit trans
    97f75e7d4c30 jbd2: export jbd2_journal_[grab|put]_journal_head
    3921d081c9c3 ucsi_ccg: Check DEV_INT bit only when starting CCG4
    598a884c772c usb: typec: tcpm: Do not disconnect while receiving VBUS off
    e3b131e30e61 USB: core: Fix hang in usb_kill_urb by adding memory barriers
    3ca928c82427 usb: gadget: f_sourcesink: Fix isoc transfer for USB_SPEED_SUPER_PLUS
    053274bc6baa usb: common: ulpi: Fix crash in ulpi_match()
    20c51a4c5220 usb: xhci-plat: fix crash when suspend if remote wake enable
    38d1bf67a310 usb-storage: Add unusual-devs entry for VL817 USB-SATA bridge
    e0fcae7bd72b tty: Add support for Brainboxes UC cards.
    7079283d32a2 tty: n_gsm: fix SW flow control encoding/handling
    2683b0d5d7d5 serial: stm32: fix software flow control transfer
    4628b26df51c serial: 8250: of: Fix mapped region size when using reg-offset property
    94b23988c305 netfilter: nft_payload: do not update layer 4 checksum when mangling fragments
    bf0d4ae5c6c2 arm64: errata: Fix exec handling in erratum 1418040 workaround
    e92cac1dd803 KVM: x86: Update vCPU's runtime CPUID on write to MSR_IA32_XSS
    6b55af102b39 drm/etnaviv: relax submit size limits
    7a32d17fb73a perf/x86/intel/uncore: Fix CAS_COUNT_WRITE issue for ICX
    a2c8e1d9e41b Revert "KVM: SVM: avoid infinite loop on NPF from bad address"
    abae88fb37bf fsnotify: fix fsnotify hooks in pseudo filesystems
    6ceac38e9b0c ceph: set pool_ns in new inode layout for async creates
    e7be12ca7d39 ceph: properly put ceph_string reference after async create attempt
    39986696fef5 tracing: Don't inc err_log entry count if entry allocation fails
    d71b06aa9950 tracing/histogram: Fix a potential memory leak for kstrdup()
    561a22d44acc PM: wakeup: simplify the output logic of pm_show_wakelocks()
    b0f1cc093bc2 efi: runtime: avoid EFIv2 runtime services on Apple x86 machines
    de7cc8bcca90 udf: Fix NULL ptr deref when converting from inline format
    0a3cfd258923 udf: Restore i_lenAlloc when inode expansion fails
    f08801252d26 scsi: zfcp: Fix failed recovery on gone remote port with non-NPIV FCP devices
    ff6bdc205fd0 bpf: Guard against accessing NULL pt_regs in bpf_get_task_stack()
    6520fedfcebb s390/hypfs: include z/VM guests with access control group set
    c10e0627c71c s390/module: fix loading modules with a lot of relocations
    ba7c71a777c1 net: stmmac: skip only stmmac_ptp_register when resume from suspend
    11191406f2f1 net: sfp: ignore disabled SFP node
    e651772adced media: venus: core: Drop second v4l2 device unregister
    83d5196b65d1 Bluetooth: refactor malicious adv data check
    77656fde3c01 Linux 5.10.95
    ae2b20f27732 drm/vmwgfx: Fix stale file descriptors on failed usercopy
    11ba2c6dfb90 select: Fix indefinitely sleeping task in poll_schedule_timeout()
    a447d7f786ec KVM: x86/mmu: Fix write-protection of PTs mapped by the TDP MMU
    12d3389b7af6 rcu: Tighten rcu_advance_cbs_nowake() checks
    4d63363c88e3 bnx2x: Invalidate fastpath HSI version for VFs
    fdcfabd0952d bnx2x: Utilize firmware 7.13.21.0
    6a6acf927895 drm/i915: Flush TLBs before releasing backing store
    c525532e4f87 Linux 5.10.94
    c76c132444df scripts: sphinx-pre-install: Fix ctex support on Debian
    133cef0b6154 scripts: sphinx-pre-install: add required ctex dependency
    15ce9329a532 ath10k: Fix the MTU size on QCA9377 SDIO
    25b1a6d33039 mtd: nand: bbt: Fix corner case in bad block table handling
    8104e589fa4a lib/test_meminit: destroy cache in kmem_cache_alloc_bulk() test
    629250370052 mm/hmm.c: allow VM_MIXEDMAP to work with hmm_range_fault
    33bb7f027b06 lib82596: Fix IRQ check in sni_82596_probe
    078b5a4498e0 scripts/dtc: dtx_diff: remove broken example from help text
    21513c461557 dt-bindings: watchdog: Require samsung,syscon-phandle for Exynos7
    23bcf3615be7 dt-bindings: display: meson-vpu: Add missing amlogic,canvas property
    66467cc87a35 dt-bindings: display: meson-dw-hdmi: add missing sound-name-prefix property
    4496e4a427a0 net: mscc: ocelot: fix using match before it is set
    ee64479c9ce6 net: sfp: fix high power modules without diagnostic monitoring
    819e76bc572e net: ethernet: mtk_eth_soc: fix error checking in mtk_mac_config()
    4691c9f047a8 bcmgenet: add WOL IRQ check
    6973b38b9dba net_sched: restore "mpu xxx" handling
    20949c381646 net: bonding: fix bond_xmit_broadcast return value error bug
    799730d182d1 arm64: dts: qcom: msm8996: drop not documented adreno properties
    f6d4c0e017ec devlink: Remove misleading internal_flags from health reporter dump
    2e51a761b7ab perf probe: Fix ppc64 'perf probe add events failed' case
    59b44f77601d dmaengine: at_xdmac: Fix at_xdmac_lld struct definition
    0078f053714d dmaengine: at_xdmac: Fix lld view setting
    7ab120636d4e dmaengine: at_xdmac: Fix concurrency over xfers_list
    b5b27c5e3315 dmaengine: at_xdmac: Print debug message after realeasing the lock
    c536b351a75f dmaengine: at_xdmac: Start transfer for cyclic channels in issue_pending
    cd22e22e8eac dmaengine: at_xdmac: Don't start transactions at tx_submit level
    68a83051c8b1 perf script: Fix hex dump character output
    7b9d40e9f60d libcxgb: Don't accidentally set RTO_ONLINK in cxgb_find_route()
    cd5c24d2230f gre: Don't accidentally set RTO_ONLINK in gre_fill_metadata_dst()
    7f2ca96bd266 xfrm: Don't accidentally set RTO_ONLINK in decode_session4()
    2b1415c60b2e netns: add schedule point in ops_exit_list()
    edc09548ffc5 inet: frags: annotate races around fqdir->dead and fqdir->high_thresh
    69e7e979ed66 taskstats: Cleanup the use of task->exit_code
    56daa21414e9 virtio_ring: mark ring unused on error
    0c4ebcb00d88 vdpa/mlx5: Fix wrong configuration of virtio_version_1_0
    c736ec01a2fc rtc: pxa: fix null pointer dereference
    8b8ff4c793ee HID: vivaldi: fix handling devices not using numbered reports
    d7544cf6939c net: axienet: increase default TX ring size to 128
    557829d42d1f net: axienet: fix for TX busy handling
    41831d496772 net: axienet: fix number of TX ring slots for available check
    6301f3566aef net: axienet: Fix TX ring slot available check
    7a3d3d7f6d7b net: axienet: limit minimum TX ring size
    2f548489d64d net: axienet: add missing memory barriers
    bcc5d57e6091 net: axienet: reset core on initialization prior to MDIO access
    46c0ccaff285 net: axienet: Wait for PhyRstCmplt after core reset
    34942a228aec net: axienet: increase reset timeout
    a66b9bccf732 net/smc: Fix hung_task when removing SMC-R devices
    51b52cf35485 clk: si5341: Fix clock HW provider cleanup
    fe40f7aef387 clk: Emit a stern warning with writable debugfs enabled
    38221afa03af af_unix: annote lockless accesses to unix_tot_inflight & gc_in_progress
    a49e402f2309 f2fs: fix to reserve space for IO align feature
    39ad0581176d f2fs: compress: fix potential deadlock of compress file
    e1840365ed4f parisc: pdc_stable: Fix memory leak in pdcs_register_pathentries
    d806eb5f4e23 net/fsl: xgmac_mdio: Fix incorrect iounmap when removing module
    38c798384b90 net/fsl: xgmac_mdio: Add workaround for erratum A-009885
    734f4b0f831e ipv4: avoid quadratic behavior in netns dismantle
    86f0587f7432 ipv4: update fib_info_cnt under spinlock protection
    10e99ae9b5da perf evsel: Override attr->sample_period for non-libpfm4 events
    58fa3e900255 xdp: check prog type before updating BPF link
    38ee417f59c8 bpftool: Remove inclusion of utilities.mak from Makefiles
    2bcab471a26f block: Fix fsync always failed if once failed
    5e59f885353e powerpc/fsl/dts: Enable WA for erratum A-009885 on fman3l MDIO buses
    19aaef651948 powerpc/cell: Fix clang -Wimplicit-fallthrough warning
    4cb7aba1e086 Revert "net/mlx5: Add retry mechanism to the command entry index allocation"
    78cf5f63a3a9 dmaengine: stm32-mdma: fix STM32_MDMA_CTBR_TSEL_MASK
    16ad0aa917c9 RDMA/rxe: Fix a typo in opcode name
    885860717c29 RDMA/hns: Modify the mapping attribute of doorbell to device
    57cd8597c3ef dmaengine: uniphier-xdmac: Fix type of address variables
    4fe77b7cd272 scsi: core: Show SCMD_LAST in text form
    b30240911da4 Bluetooth: hci_sync: Fix not setting adv set duration
    55698d11c8da Documentation: fix firewire.rst ABI file path error
    5d38cbf66dd7 Documentation: refer to config RANDOMIZE_BASE for kernel address-space randomization
    abecf9d74836 Documentation: ACPI: Fix data node reference documentation
    d1e85fcd73b5 Documentation: dmaengine: Correctly describe dmatest with channel unset
    f6736bd81db4 media: correct MEDIA_TEST_SUPPORT help text
    55b10b88ac86 drm/vc4: hdmi: Make sure the device is powered with CEC
    81ac08a800b0 media: rcar-csi2: Optimize the selection PHTW register
    0baa3729d2eb can: mcp251xfd: mcp251xfd_tef_obj_read(): fix typo in error message
    f62bf6ee4fa3 firmware: Update Kconfig help text for Google firmware
    12224c0d19f3 of: base: Improve argument length mismatch error
    7bb99c7e13f8 drm/radeon: fix error handling in radeon_driver_open_kms
    0ca7ec6db20c ext4: don't use the orphan list when migrating an inode
    679fb065326b ext4: fix null-ptr-deref in '__ext4_journal_ensure_credits'
    d60e9daba29e ext4: destroy ext4_fc_dentry_cachep kmemcache on module removal
    f26b24b4c115 ext4: fast commit may miss tracking unwritten range during ftruncate
    04b562730677 ext4: use ext4_ext_remove_space() for fast commit replay delete range
    53998b3f6dcd ext4: Fix BUG_ON in ext4_bread when write quota data
    da364ab35892 ext4: set csum seed in tmp inode while migrating to extents
    e4221629d5e1 ext4: fix fast commit may miss tracking range for FALLOC_FL_ZERO_RANGE
    720508dd118d ext4: initialize err_blk before calling __ext4_get_inode_loc
    f9ed0ea0a9fc ext4: fix a possible ABBA deadlock due to busy PA
    115b762b48ab ext4: make sure quota gets properly shutdown on error
    762e4c33e9e5 ext4: make sure to reset inode lockdep class when quota enabling fails
    f8c3ec2e21b9 btrfs: respect the max size in the header when activating swap file
    e7764bccae77 btrfs: check the root node for uptodate before returning it
    09e0ef287e93 btrfs: fix deadlock between quota enable and other quota operations
    56f974d583fc xfrm: fix policy lookup for ipv6 gre packets
    84166c1177f3 PCI: pci-bridge-emul: Set PCI_STATUS_CAP_LIST for PCIe device
    7aeeb9fe9ca0 PCI: pci-bridge-emul: Correctly set PCIe capabilities
    af1d0acdaca7 PCI: pci-bridge-emul: Fix definitions of reserved bits
    0f2ae6691e73 PCI: pci-bridge-emul: Properly mark reserved PCIe bits in PCI config space
    2a0d437d8a76 PCI: pci-bridge-emul: Make expansion ROM Base Address register read-only
    def2825b09ec PCI: pciehp: Use down_read/write_nested(reset_lock) to fix lockdep errors
    6cbe8f8deb62 PCI: xgene: Fix IB window setup
    e09f47e77b6e powerpc/64s/radix: Fix huge vmap false positive
    eb44b1386af5 parisc: Fix lpa and lpa_user defines
    9b78ee2341d4 drm/bridge: analogix_dp: Make PSR-exit block less
    8cbbf4a6f1ac drm/nouveau/kms/nv04: use vzalloc for nv04_display
    605583fcccb5 drm/etnaviv: limit submit sizes
    6c1e3d8b1bff device property: Fix fwnode_graph_devcon_match() fwnode leak
    ecb71f7bd584 s390/mm: fix 2KB pgtable release race
    798754ba48b7 iwlwifi: mvm: Increase the scan timeout guard to 30 seconds
    c524f4cfb3e5 tracing/kprobes: 'nmissed' not showed correctly for kretprobe
    b72075e395b3 cputime, cpuacct: Include guest time in user time in cpuacct.stat
    13518f058fde serial: Fix incorrect rs485 polarity on uart open
    9668cf9e4af0 fuse: Pass correct lend value to filemap_write_and_wait_range()
    9fbaddd783fd xen/gntdev: fix unmap notification order
    67b078d996f7 spi: uniphier: Fix a bug that doesn't point to private data correctly
    05026c4e94c9 tpm: fix NPE on probe for missing device
    76006d33f1c8 ubifs: Error path in ubifs_remount_rw() seems to wrongly free write buffers
    4f0762ac32b5 crypto: caam - replace this_cpu_ptr with raw_cpu_ptr
    9e6ff2d5725b crypto: stm32/crc32 - Fix kernel BUG triggered in probe()
    2031e0246e45 crypto: omap-aes - Fix broken pm_runtime_and_get() usage
    43e94431c313 rpmsg: core: Clean up resources on announce_create failure.
    082ff9e12b4a phy: mediatek: Fix missing check in mtk_mipi_tx_probe
    ff08cf1e34a1 ASoC: mediatek: mt8183: fix device_node leak
    f28672eef4a9 ASoC: mediatek: mt8173: fix device_node leak
    0df51040089d scsi: sr: Don't use GFP_DMA
    de9a936b04c5 MIPS: Octeon: Fix build errors using clang
    da7df943e254 i2c: designware-pci: Fix to change data types of hcnt and lcnt parameters
    f09f7ccb28bb irqchip/gic-v4: Disable redistributors' view of the VPE table at boot time
    bc2d961d821b MIPS: OCTEON: add put_device() after of_find_device_by_node()
    ce34b03a71b6 udf: Fix error handling in udf_new_inode()
    15be042e7fd9 powerpc/fadump: Fix inaccurate CPU state info in vmcore generated with panic
    f2e658d9bda2 powerpc: handle kdump appropriately with crash_kexec_post_notifiers option
    044164b4198e selftests/powerpc/spectre_v2: Return skip code when miss_percent is high
    21125e011620 powerpc/40x: Map 32Mbytes of memory at startup
    c330442f46ea MIPS: Loongson64: Use three arguments for slti
    af8d07735083 ALSA: seq: Set upper limit of processed events
    297210783a7a scsi: lpfc: Trigger SLI4 firmware dump before doing driver cleanup
    dfde7afed711 dm: fix alloc_dax error handling in alloc_dev
    2e2086f49e08 nvmem: core: set size for sysfs bin file
    4a273a94bda8 w1: Misuse of get_user()/put_user() reported by sparse
    87e91d6c6a5e KVM: PPC: Book3S: Suppress failed alloc warning in H_COPY_TOFROM_GUEST
    23bb3f01ceb5 KVM: PPC: Book3S: Suppress warnings when allocating too big memory slots
    03c1595a181c powerpc/powermac: Add missing lockdep_register_key()
    df29c01b9fbe clk: meson: gxbb: Fix the SDM_EN bit for MPLL0 on GXBB
    30d35a1abd9e i2c: mpc: Correct I2C reset procedure
    4b25aad655c9 powerpc/smp: Move setup_profiling_timer() under CONFIG_PROFILING
    25714ad6bf5e i2c: i801: Don't silently correct invalid transfer size
    75e2cfa5fae9 powerpc/watchdog: Fix missed watchdog reset due to memory ordering race
    a83639521a4f powerpc/btext: add missing of_node_put
    fc10d8f00a89 powerpc/cell: add missing of_node_put
    297ff7d5f157 powerpc/powernv: add missing of_node_put
    c83ba875d7be powerpc/6xx: add missing of_node_put
    d240b08d8ac4 x86/kbuild: Enable CONFIG_KALLSYMS_ALL=y in the defconfigs
    3681e9f3f0f7 parisc: Avoid calling faulthandler_disabled() twice
    f2a27dd7a2de random: do not throw away excess input to crng_fast_load
    f8fdebfb4b37 serial: core: Keep mctrl register state and cached copy in sync
    a03fd1b19891 serial: pl010: Drop CR register reset on set_termios
    40ac33892630 regulator: qcom_smd: Align probe function with rpmh-regulator
    3dc751213fe9 net: gemini: allow any RGMII interface mode
    1063de897563 net: phy: marvell: configure RGMII delays for 88E1118
    00580670b98b mlxsw: pci: Avoid flow control for EMAD packets
    eaf8cffcf5d5 dm space map common: add bounds check to sm_ll_lookup_bitmap()
    5850bef8e955 dm btree: add a defensive bounds check to insert_at()
    754b663ea916 mac80211: allow non-standard VHT MCS-10/11
    e8da60b3a629 net: mdio: Demote probed message to debug print
    6b22c9824ddb btrfs: remove BUG_ON(!eie) in find_parent_nodes
    623c65bc7336 btrfs: remove BUG_ON() in find_parent_nodes()
    44cbd2a16a07 ACPI: battery: Add the ThinkPad "Not Charging" quirk
    7b6dc07c6e69 amdgpu/pm: Make sysfs pm attributes as read-only for VFs
    516e332d6fce drm/amdgpu: fixup bad vram size on gmc v8
    ee88ff140de2 ACPICA: Hardware: Do not flush CPU cache when entering S4 and S5
    8544074762e2 ACPICA: Fix wrong interpretation of PCC address
    e70be176961d ACPICA: Executer: Fix the REFCLASS_REFOF case in acpi_ex_opcode_1A_0T_1R()
    8ea9216d20b7 ACPICA: Utilities: Avoid deleting the same object twice in a row
    fcfd8282c5d2 ACPICA: actypes.h: Expand the ACPI_ACCESS_ definitions
    e3a51d6c90a8 jffs2: GC deadlock reading a page that is used in jffs2_write_begin()
    e35cb5b122fc drm/etnaviv: consider completed fence seqno in hang check
    a0b13335a342 xfrm: rate limit SA mapping change message to user space
    0b7beb2fea8f Bluetooth: vhci: Set HCI_QUIRK_VALID_LE_STATES
    6ac117edac18 ath11k: Fix napi related hang
    756a7188b277 um: registers: Rename function names to avoid conflicts and build problems
    d817d10f7a00 iwlwifi: pcie: make sure prph_info is set when treating wakeup IRQ
    f266e1c5bf88 iwlwifi: mvm: Fix calculation of frame length
    6e44b600543c iwlwifi: remove module loading failure message
    febab6b60d61 iwlwifi: fix leaks/bad data after failed firmware load
    81d2e96ababb PM: AVS: qcom-cpr: Use div64_ul instead of do_div
    c0a1d844e3e7 rtw88: 8822c: update rx settings to prevent potential hw deadlock
    3ef25f3122c0 ath9k: Fix out-of-bound memcpy in ath9k_hif_usb_rx_stream
    e10de3105547 usb: hub: Add delay for SuperSpeed hub resume to let links transit to U0
    282286c632a2 cpufreq: Fix initialization of min and max frequency QoS requests
    37b25de3af10 PM: runtime: Add safety net to supplier device release
    5dfc6fa0b8c2 arm64: tegra: Adjust length of CCPLEX cluster MMIO region
    b68c56a149e4 arm64: dts: ls1028a-qds: move rtc node to the correct i2c bus
    b6f7f0ad5af5 audit: ensure userspace is penalized the same as the kernel when under pressure
    5d54ed155031 mmc: core: Fixup storing of OCR for MMC_QUIRK_NONSTD_SDIO
    51a5156bb779 media: saa7146: hexium_gemini: Fix a NULL pointer dereference in hexium_attach()
    f6bc6b178ce1 media: igorplugusb: receiver overflow should be reported
    d698e024be2e HID: quirks: Allow inverting the absolute X/Y values
    59f03633463f bpf: Do not WARN in bpf_warn_invalid_xdp_action()
    0e8805f73b69 net: bonding: debug: avoid printing debug logs when bond is not notifying peers
    8c72de32ff13 x86/mce: Mark mce_read_aux() noinstr
    1ad3e60f1fec x86/mce: Mark mce_end() noinstr
    f21ca973b43f x86/mce: Mark mce_panic() noinstr
    de360d944386 x86/mce: Allow instrumentation during task work queueing
    af371e0abb6c ath11k: Avoid false DEADLOCK warning reported by lockdep
    aec69e2f33b4 selftests/ftrace: make kprobe profile testcase description unique
    07ecabf15ad3 gpio: aspeed: Convert aspeed_gpio.lock to raw_spinlock
    7e09f9d15e43 net: phy: prefer 1000baseT over 1000baseKX
    443133330a5d net-sysfs: update the queue counts in the unregistration path
    58b4c1ce8328 ath10k: Fix tx hanging
    fcba0bce3357 ath11k: avoid deadlock by change ieee80211_queue_work for regd_update_work
    93a108d466f8 iwlwifi: mvm: avoid clearing a just saved session protection id
    ec01e0fe2184 iwlwifi: mvm: synchronize with FW after multicast commands
    c1976a424807 thunderbolt: Runtime PM activate both ends of the device link
    830e5d1b4344 media: m920x: don't use stack on USB reads
    c33f0f22bfea media: saa7146: hexium_orion: Fix a NULL pointer dereference in hexium_attach()
    526b6c9b4521 media: rcar-vin: Update format alignment constraints
    74e60c1dce06 media: uvcvideo: Increase UVC_CTRL_CONTROL_TIMEOUT to 5 seconds.
    d0e3ab637de1 drm: rcar-du: Fix CRTC timings when CMM is used
    e61aa46d0f27 x86/mm: Flush global TLB when switching to trampoline page-table
    0946fdd9290a floppy: Add max size check for user space request
    409d45bcd381 usb: uhci: add aspeed ast2600 uhci support
    d0aec428c072 arm64: dts: ti: j7200-main: Fix 'dtbs_check' serdes_ln_ctrl node
    fcb45ac39f90 ACPI / x86: Add not-present quirk for the PCI0.SDHB.BRC1 device on the GPD win
    b8b2e74a8751 ACPI / x86: Allow specifying acpi_device_override_status() quirks by path
    cda755506df4 ACPI: Change acpi_device_always_present() into acpi_device_override_status()
    b029625063c1 ACPI / x86: Drop PWM2 device on Lenovo Yoga Book from always present table
    cf3b1a160dc2 media: venus: avoid calling core_clk_setrate() concurrently during concurrent video sessions
    adbe14867277 ath11k: Avoid NULL ptr access during mgmt tx cleanup
    ab523ea096ef rsi: Fix out-of-bounds read in rsi_read_pkt()
    752587675068 rsi: Fix use-after-free in rsi_rx_done_handler()
    6036500fdf77 mwifiex: Fix skb_over_panic in mwifiex_usb_recv()
    8a6371d84c5f crypto: jitter - consider 32 LSB for APT
    240cf5d3cb5e HSI: core: Fix return freed object in hsi_new_client
    f4295b7dca87 gpiolib: acpi: Do not set the IRQ type if the IRQ is already in use
    f0653cd4da66 tty: serial: imx: disable UCR4_OREN in .stop_rx() instead of .shutdown()
    b8d10f601f22 drm/bridge: megachips: Ensure both bridges are probed before registration
    43fc9e267e2e mlxsw: pci: Add shutdown method in PCI driver
    b2e921fa9219 soc: ti: pruss: fix referenced node in error message
    07fbbc4dc79d drm/amdgpu/display: set vblank_disable_immediate for DC
    019fe9723a83 drm/amd/display: check top_pipe_to_program pointer
    3c3c0b6c4ae9 ARM: imx: rename DEBUG_IMX21_IMX27_UART to DEBUG_IMX27_UART
    f54d8cd831be EDAC/synopsys: Use the quirk for version instead of ddr version
    0b85d73fdbc8 media: b2c2: Add missing check in flexcop_pci_isr:
    c978d39a8b14 HID: apple: Do not reset quirks when the Fn key is not found
    2df002e3276b drm: panel-orientation-quirks: Add quirk for the Lenovo Yoga Book X91F/L
    5aa57672c66c usb: gadget: f_fs: Use stream_open() for endpoint files
    129e8faaee97 ath11k: Fix crash caused by uninitialized TX ring
    e8b271f2aadd media: atomisp: handle errors at sh_css_create_isp_params()
    ebe9c978d9e7 batman-adv: allow netlink usage in unprivileged containers
    ff452db96163 ARM: shmobile: rcar-gen2: Add missing of_node_put()
    ff2138d6c2a3 media: atomisp-ov2680: Fix ov2680_set_fmt() clobbering the exposure
    51ef6582a218 media: atomisp: set per-device's default mode
    ac08140677c0 media: atomisp: fix try_fmt logic
    518e059789f6 drm/nouveau/pmu/gm200-: avoid touching PMU outside of DEVINIT/PREOS/ACR
    e3ba02b043f2 drm/bridge: dw-hdmi: handle ELD when DRM_BRIDGE_ATTACH_NO_CONNECTOR
    2f13f10fddf4 ar5523: Fix null-ptr-deref with unexpected WDCMSG_TARGET_START reply
    a9d2ccfc7d2c selftests/bpf: Fix bpf_object leak in skb_ctx selftest
    b207356933f4 drm/lima: fix warning when CONFIG_DEBUG_SG=y & CONFIG_DMA_API_DEBUG=y
    db1e878373bf fs: dlm: filter user dlm messages for kernel locks
    f9c9a46efd94 Bluetooth: Fix debugfs entry leak in hci_register_dev()
    852d7d436fd1 ARM: dts: omap3-n900: Fix lp5523 for multi color
    b5793aff11d7 of: base: Fix phandle argument length mismatch error message
    e16e836d510c clk: bm1880: remove kfrees on static allocations
    36d46e21c9c4 ASoC: fsl_asrc: refine the check of available clock divider
    5a6864e2e6ab RDMA/cxgb4: Set queue pair state when being queried
    80524c8cdf29 ASoC: fsl_mqs: fix MODULE_ALIAS
    74988d017dd1 powerpc/xive: Add missing null check after calling kmalloc
    588e0b81ce38 mips: bcm63xx: add support for clk_set_parent()
    e3de89d010c0 mips: lantiq: add support for clk_set_parent()
    8f8468a089b0 arm64: tegra: Remove non existent Tegra194 reset
    702902fc7fb0 arm64: tegra: Fix Tegra194 HDA {clock,reset}-names ordering
    24b047d72c77 counter: stm32-lptimer-cnt: remove iio counter abi
    a39460610452 misc: lattice-ecp3-config: Fix task hung when firmware load failed
    696a50abbc7c ASoC: samsung: idma: Check of ioremap return value
    d491a2c2cf96 ASoC: mediatek: Check for error clk pointer
    c73ccdd62d21 phy: uniphier-usb3ss: fix unintended writing zeros to PHY register
    d781f4cd8c71 scsi: block: pm: Always set request queue runtime active in blk_post_runtime_resume()
    6e2a16954459 iommu/iova: Fix race between FQ timeout and teardown
    57bc8985753c ASoC: Intel: catpt: Test dmaengine_submit() result before moving on
    676049a3d2c6 iommu/amd: Restore GA log/tail pointer on host resume
    c2bd7c31de1a iommu/amd: Remove iommu_init_ga()
    62ea255f2bde dmaengine: pxa/mmp: stop referencing config->slave_id
    0be9ae1e532e mips: fix Kconfig reference to PHYS_ADDR_T_64BIT
    88d78b25db1f mips: add SYS_HAS_CPU_MIPS64_R5 config for MIPS Release 5 support
    51b8e814bcef clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after system enter shell
    dff359e04260 of: unittest: 64 bit dma address test requires arch support
    918105df78b7 of: unittest: fix warning on PowerPC frame size warning
    0e04518b1dd9 ASoC: rt5663: Handle device_property_read_u32_array error codes
    7c0d9c815ce8 RDMA/cma: Let cma_resolve_ib_dev() continue search even after empty entry
    2432d325f946 RDMA/core: Let ib_find_gid() continue search even after empty entry
    d77916df161b powerpc/powermac: Add additional missing lockdep_register_key()
    8b3783e517f6 PCI/MSI: Fix pci_irq_vector()/pci_irq_get_affinity()
    7be2a0bcaf8e RDMA/qedr: Fix reporting max_{send/recv}_wr attrs
    e19469468b7b scsi: ufs: Fix race conditions related to driver data
    ed43b2e048fe iommu/io-pgtable-arm: Fix table descriptor paddr formatting
    e9e4d1fb4590 openrisc: Add clone3 ABI wrapper
    551a785c26f6 binder: fix handling of error during copy
    88ddf033a5e4 char/mwave: Adjust io port register size
    8937aee4c0fa ALSA: usb-audio: Drop superfluous '0' in Presonus Studio 1810c's ID
    bcd533417fd0 ALSA: oss: fix compile error when OSS_DEBUG is enabled
    fd99aeb97845 clocksource: Avoid accidental unstable marking of clocksources
    cacc6c30e3eb clocksource: Reduce clocksource-skew threshold
    86ad478c99d2 powerpc/32s: Fix shift-out-of-bounds in KASAN init
    ef798cd035f3 powerpc/perf: Fix PMU callbacks to clear pending PMI before resetting an overflown PMC
    58014442a9e8 powerpc/irq: Add helper to set regs->softe
    c9ffa84a3bd1 powerpc/perf: move perf irq/nmi handling details into traps.c
    a0758b3be46d powerpc/perf: MMCR0 control for PMU registers under PMCC=00
    f4df6db5b0b8 powerpc/64s: Convert some cpu_setup() and cpu_restore() functions to C
    a9c9d2ff6423 dt-bindings: thermal: Fix definition of cooling-maps contribution property
    2bd8d937957f ASoC: uniphier: drop selecting non-existing SND_SOC_UNIPHIER_AIO_DMA
    5a821af769bb powerpc/prom_init: Fix improper check of prom_getprop()
    9ca761ef946d clk: imx8mn: Fix imx8mn_clko1_sels
    999528d8a749 scsi: pm80xx: Update WARN_ON check in pm8001_mpi_build_cmd()
    c5f414d69ac9 RDMA/hns: Validate the pkey index
    04a032ea2498 RDMA/bnxt_re: Scan the whole bitmap when checking if "disabling RCFW with pending cmd-bit"
    84cd5c029d48 ALSA: hda: Add missing rwsem around snd_ctl_remove() calls
    180e9d7384c6 ALSA: PCM: Add missing rwsem around snd_ctl_remove() calls
    49d76154ba8d ALSA: jack: Add missing rwsem around snd_ctl_remove() calls
    f871cd8ee0f0 ext4: avoid trim error on fs with small groups
    99590e820feb net: mcs7830: handle usb read errors properly
    2b948524ae65 iwlwifi: mvm: Use div_s64 instead of do_div in iwl_mvm_ftm_rtt_smoothing()
    04ce9e2aeda7 pcmcia: fix setting of kthread task states
    5064bfe046b0 can: xilinx_can: xcan_probe(): check for error irq
    b6dd1577bc92 can: softing: softing_startstop(): fix set but not used variable warning
    b9ac866c23bb tpm_tis: Fix an error handling path in 'tpm_tis_core_init()'
    fb46223c9f94 tpm: add request_locality before write TPM_INT_ENABLE
    20edf903a3a5 can: mcp251xfd: add missing newline to printed strings
    d71fca5d0167 regmap: Call regmap_debugfs_exit() prior to _init()
    838acddcdf75 netrom: fix api breakage in nr_setsockopt()
    0d04479857bc ax25: uninitialized variable in ax25_setsockopt()
    27e9910c4516 spi: spi-meson-spifc: Add missing pm_runtime_disable() in meson_spifc_probe
    9d6350cf8e5a Bluetooth: L2CAP: uninitialized variables in l2cap_sock_setsockopt()
    9defd7d4c084 lib/mpi: Add the return value check of kcalloc()
    e801f81cee3c net/mlx5: Set command entry semaphore up once got index free
    d2b9ce705d79 Revert "net/mlx5e: Block offload of outer header csum for UDP tunnels"
    67e1a449a165 net/mlx5e: Don't block routes with nexthop objects in SW
    cc40fa05c0a6 net/mlx5e: Fix page DMA map/unmap attributes
    b3dda01d1d47 debugfs: lockdown: Allow reading debugfs files that are not world readable
    b9b5da3e187e HID: hid-uclogic-params: Invalid parameter check in uclogic_params_frame_init_v1_buttonpad
    541c3a044b46 HID: hid-uclogic-params: Invalid parameter check in uclogic_params_huion_init
    c47f842e0c3c HID: hid-uclogic-params: Invalid parameter check in uclogic_params_get_str_desc
    cf5ad827ee69 HID: hid-uclogic-params: Invalid parameter check in uclogic_params_init
    94177fcecc35 usb: dwc3: qcom: Fix NULL vs IS_ERR checking in dwc3_qcom_probe
    4579954bf4cc Bluetooth: hci_qca: Fix NULL vs IS_ERR_OR_NULL check in qca_serdev_probe
    f6bf3d66393b Bluetooth: hci_bcm: Check for error irq
    f5e4f68d57d6 fsl/fman: Check for null pointer after calling devm_ioremap
    60aca6fdc167 staging: greybus: audio: Check null pointer
    a1068bfee47a rocker: fix a sleeping in atomic bug
    2db344725e17 ppp: ensure minimum packet size in ppp_write()
    45643b1b6ce1 netfilter: nft_set_pipapo: allocate pcpu scratch maps on clone
    8772700a9f1e bpf: Fix SO_RCVBUF/SO_SNDBUF handling in _bpf_setsockopt().
    342332fb0be6 bpf: Don't promote bogus looking registers after null check.
    0036c78c492a netfilter: ipt_CLUSTERIP: fix refcount leak in clusterip_tg_check()
    2e718389b986 power: reset: mt6397: Check for null res pointer
    4210c35fe81b pcmcia: rsrc_nonstatic: Fix a NULL pointer dereference in nonstatic_find_mem_region()
    2dee347f356d pcmcia: rsrc_nonstatic: Fix a NULL pointer dereference in __nonstatic_find_io_region()
    0f03132191ba ACPI: scan: Create platform device for BCM4752 and LNV4752 ACPI nodes
    595e1ec55b30 x86/mce/inject: Avoid out-of-bounds write when setting flags
    df1268181928 hwmon: (mr75203) fix wrong power-up delay value
    aea5302d9ddc x86/boot/compressed: Move CLANG_FLAGS to beginning of KBUILD_CFLAGS
    70eec71f32eb Bluetooth: hci_qca: Stop IBS timer during BT OFF
    1d4e722b62d2 software node: fix wrong node passed to find nargs_prop
    f8f3c1720d77 backlight: qcom-wled: Respect enabled-strings in set_brightness
    de79bcbfaf4d backlight: qcom-wled: Use cpu_to_le16 macro to perform conversion
    c79f9b8d8e26 backlight: qcom-wled: Override default length with qcom,enabled-strings
    bf4daf6153c9 backlight: qcom-wled: Fix off-by-one maximum with default num_strings
    09aed85e8c98 backlight: qcom-wled: Pass number of elements to read to read_u32_array
    f4ed4fc504fd backlight: qcom-wled: Validate enabled string indices in DT
    e668ac6506d3 bpftool: Enable line buffering for stdout
    009bb7ee1577 Bluetooth: L2CAP: Fix using wrong mode
    1a2241ad400b um: virtio_uml: Fix time-travel external time propagation
    8411722e5652 um: fix ndelay/udelay defines
    b2b1b490bd29 selinux: fix potential memleak in selinux_add_opt()
    3253cf091464 mmc: meson-mx-sdio: add IRQ check
    decb2099549d mmc: meson-mx-sdhc: add IRQ check
    bdc6c9fc5f78 iwlwifi: mvm: test roc running status bits before removing the sta
    a750fcd604a6 iwlwifi: mvm: fix 32-bit build in FTM
    86b0122d2682 ARM: dts: armada-38x: Add generic compatible to UART nodes
    1f5428e43806 arm64: dts: marvell: cn9130: enable CP0 GPIO controllers
    874b97e86278 arm64: dts: marvell: cn9130: add GPIO and SPI aliases
    407ef1db4036 usb: ftdi-elan: fix memory leak on device disconnect
    2a65da5a1ea3 ARM: 9159/1: decompressor: Avoid UNPREDICTABLE NOP encoding
    47dd693c94bf xfrm: state and policy should fail if XFRMA_IF_ID 0
    db369047e3b3 xfrm: interface with if_id 0 should return error
    37441ddadc1e media: hantro: Fix probe func error path
    3849ec830bf7 drm/tegra: vic: Fix DMA API misuse
    b230114bc57a drm/bridge: ti-sn65dsi86: Set max register for regmap
    db97fc2c4425 drm/msm/dpu: fix safe status debugfs file
    3580055d1fca arm64: dts: qcom: ipq6018: Fix gpio-ranges property
    6f20a5a98a90 arm64: dts: qcom: c630: Fix soundcard setup
    394ee480aa3e ath11k: Fix a NULL pointer dereference in ath11k_mac_op_hw_scan()
    f6e4a6cbdb6f media: coda/imx-vdoa: Handle dma_set_coherent_mask error codes
    1a8869de328a media: msi001: fix possible null-ptr-deref in msi001_probe()
    a79327bb0191 media: dw2102: Fix use after free
    958a8819d414 ARM: dts: gemini: NAS4220-B: fis-index-block with 128 KiB sectors
    3e51460638a6 ath11k: Fix deleting uninitialized kernel timer during fragment cache flush
    b35263f000a5 crypto: stm32 - Revert broken pm_runtime_resume_and_get changes
    1f5b81874f27 crypto: stm32/cryp - fix bugs and crash in tests
    1f6151b0774b crypto: stm32/cryp - fix lrw chaining mode
    2bd40e3a3aa2 crypto: stm32/cryp - fix double pm exit
    533af1621d1c crypto: stm32/cryp - check early input data
    5deb24e50372 crypto: stm32/cryp - fix xts and race condition in crypto_engine requests
    e9e0dd5da8ca crypto: stm32/cryp - fix CTR counter carry
    c40b1bc851e0 crypto: stm32 - Fix last sparse warning in stm32_cryp_check_ctr_counter
    93033bbbdc25 selftests: harness: avoid false negatives if test has no ASSERTs
    f568fd97d751 selftests: clone3: clone3: add case CLONE3_ARGS_NO_TEST
    d21b47c60737 x86/uaccess: Move variable into switch case statement
    3e801ea43c4b xfrm: fix a small bug in xfrm_sa_len()
    b87034d7a2a8 mwifiex: Fix possible ABBA deadlock
    0836f9404017 rcu/exp: Mark current CPU as exp-QS in IPI loop second pass
    027165c491e4 drm/msm/dp: displayPort driver need algorithm rational
    268f35245650 sched/rt: Try to restart rt period timer when rt runtime exceeded
    bb0579ab5077 wireless: iwlwifi: Fix a double free in iwl_txq_dyn_alloc_dma
    b4b911b1648c media: si2157: Fix "warm" tuner state detection
    7009a5fbc589 media: saa7146: mxb: Fix a NULL pointer dereference in mxb_attach()
    df79d2bf95e0 media: dib8000: Fix a memleak in dib8000_init()
    f0cb43a2c674 arm64: clear_page() shouldn't use DC ZVA when DCZID_EL0.DZP == 1
    88ed31aab481 arm64: lib: Annotate {clear, copy}_page() as position-independent
    69e402a98541 bpf: Remove config check to enable bpf support for branch records
    924886fa2246 bpf: Disallow BPF_LOG_KERNEL log level for bpf(BPF_BTF_LOAD)
    218d952160f7 bpf: Adjust BTF log size limit.
    b77ef5b4ead6 sched/fair: Fix per-CPU kthread and wakee stacking for asym CPU capacity
    d7d5b3bc5263 sched/fair: Fix detection of per-CPU kthreads waking a task
    ec121517ac8d Bluetooth: btmtksdio: fix resume failure
    2a7edcb3ef72 staging: rtl8192e: rtllib_module: fix error handle case in alloc_rtllib()
    49f5cd2b7c41 staging: rtl8192e: return error code from rtllib_softmac_init()
    04fdd426cef2 floppy: Fix hang in watchdog when disk is ejected
    45bbe008013f serial: amba-pl011: do not request memory region twice
    8409d2394cca tty: serial: uartlite: allow 64 bit address
    a001a15ab374 arm64: dts: ti: k3-j7200: Correct the d-cache-sets info
    75919207c16a arm64: dts: ti: k3-j721e: Fix the L2 cache sets
    2dcfa3c76596 arm64: dts: ti: k3-j7200: Fix the L2 cache sets
    f277978d6c46 drm/radeon/radeon_kms: Fix a NULL pointer dereference in radeon_driver_open_kms()
    3ca1b3b82fe7 drm/amdgpu: Fix a NULL pointer dereference in amdgpu_connector_lcd_native_mode()
    96e05d2d9370 thermal/drivers/imx8mm: Enable ADC when enabling monitor
    ef72449e2d79 ACPI: EC: Rework flushing of EC work while suspended to idle
    c0acd5a09796 cgroup: Trace event cgroup id fields should be u64
    e7e178e26418 arm64: dts: qcom: msm8916: fix MMC controller aliases
    894d91c6334b netfilter: bridge: add support for pppoe filtering
    13f64bbe4255 thermal/drivers/imx: Implement runtime PM support
    c3a59f34e87c media: venus: core: Fix a resource leak in the error handling path of 'venus_probe()'
    50c4244906d6 media: venus: core: Fix a potential NULL pointer dereference in an error handling path
    eeefa2eae8fc media: venus: core, venc, vdec: Fix probe dependency error
    53f65afc260f media: venus: pm_helpers: Control core power domain manually
    89f518b153d1 media: coda: fix CODA960 JPEG encoder buffer overflow
    1da628d351a9 media: mtk-vcodec: call v4l2_m2m_ctx_release first when file is released
    2028fb832da6 media: si470x-i2c: fix possible memory leak in si470x_i2c_probe()
    e8d78f924f02 media: imx-pxp: Initialize the spinlock prior to using it
    621e8ce75d66 media: rcar-csi2: Correct the selection of hsfreqrange
    ad52b9890b83 mfd: atmel-flexcom: Use .resume_noirq
    46d6a2311409 mfd: atmel-flexcom: Remove #ifdef CONFIG_PM_SLEEP
    f93c9aa1d36f tty: serial: atmel: Call dma_async_issue_pending()
    755a6c873b9c tty: serial: atmel: Check return code of dmaengine_submit()
    bd85b2e77aa9 arm64: dts: ti: k3-j721e: correct cache-sets info
    32e9947e6639 ath11k: Use host CE parameters for CE interrupts configuration
    6a49acfacab5 crypto: qat - fix undetected PFVF timeout in ACK loop
    475ac5c5653f crypto: qat - make pfvf send message direction agnostic
    ee1c74c3c9c2 crypto: qat - remove unnecessary collision prevention step in PFVF
    472f76835200 crypto: qat - fix spelling mistake: "messge" -> "message"
    ae766527e6b7 ARM: dts: stm32: fix dtbs_check warning on ili9341 dts binding on stm32f429 disco
    eab4204588a0 mtd: hyperbus: rpc-if: fix bug in rpcif_hb_remove
    867d4ace48da crypto: qce - fix uaf on qce_skcipher_register_one
    e19b3c1b5768 crypto: qce - fix uaf on qce_ahash_register_one
    5de640f59f99 media: dmxdev: fix UAF when dvb_register_device() fails
    1d64e2bd2222 arm64: dts: renesas: cat875: Add rx/tx delays
    a33eef23a658 drm/vboxvideo: fix a NULL vs IS_ERR() check
    43220a61e7b8 fs: dlm: fix build with CONFIG_IPV6 disabled
    0d7c5d10e7db tee: fix put order in teedev_close_context()
    097e601eb887 ath11k: reset RSN/WPA present state for open BSS
    fa51addd391d ath11k: clear the keys properly via DISABLE_KEY
    df94b37e902b ath11k: Fix ETSI regd with weather radar overlap
    ffc9019bd991 Bluetooth: stop proccessing malicious adv data
    3273541fed60 memory: renesas-rpc-if: Return error in case devm_ioremap_resource() fails
    55917db35976 fs: dlm: don't call kernel_getpeername() in error_report()
    98923ebb034b fs: dlm: use sk->sk_socket instead of con->sock
    6edd1bd8e3d8 arm64: dts: meson-gxbb-wetek: fix missing GPIO binding
    eb1f75fa2458 arm64: dts: meson-gxbb-wetek: fix HDMI in early boot
    6f012f2c445b arm64: dts: amlogic: Fix SPI NOR flash node name for ODROID N2/N2+
    96d710b1c6ff arm64: dts: amlogic: meson-g12: Fix GPU operating point table node name
    0b57480ed51a media: aspeed: Update signal status immediately to ensure sane hw state
    0ff0ae69d27c media: em28xx: fix memory leak in em28xx_init_dev
    b441d9428735 media: aspeed: fix mode-detect always time out at 2nd run
    8d132d9dd8ba media: atomisp: fix uninitialized bug in gmin_get_pmic_id_and_addr()
    fc2b95e7aeae media: atomisp: fix enum formats logic
    6e5353238c55 media: atomisp: add NULL check for asd obtained from atomisp_video_pipe
    6cbabad304c4 media: staging: media: atomisp: pci: Balance braces around conditional statements in file atomisp_cmd.c
    22b0b68f7d9f media: atomisp: fix ifdefs in sh_css.c
    0bf5e8af6eb6 media: atomisp: fix inverted error check for ia_css_mipi_is_source_port_valid()
    3cb3e66f583c media: atomisp: do not use err var when checking port validity for ISP2400
    08e43223fb4e media: atomisp: fix inverted logic in buffers_needed()
    fb370f6dc7d5 media: atomisp: fix punit_ddr_dvfs_enable() argument for mrfld_power up case
    1daacf9bb69a media: atomisp: add missing media_device_cleanup() in atomisp_unregister_entities()
    e1da9301cf54 media: videobuf2: Fix the size printk format
    90807ab437e8 mtd: hyperbus: rpc-if: Check return value of rpcif_sw_init()
    9bfed11dcf59 ath11k: Send PPDU_STATS_CFG with proper pdev mask to firmware
    2fe056d9791a wcn36xx: fix RX BD rate mapping for 5GHz legacy rates
    22406ed4e389 wcn36xx: populate band before determining rate on RX
    92fea7bd5af3 wcn36xx: Put DXE block into reset before freeing memory
    0d53c47f6ab5 wcn36xx: Release DMA channel descriptor allocations
    1850195a852d wcn36xx: Fix DMA channel enable/disable cycle
    38a7842889f5 wcn36xx: Indicate beacon not connection loss on MISSED_BEACON_IND
    fcb267bb9577 wcn36xx: ensure pairing of init_scan/finish_scan and start_scan/end_scan
    e53ff4dd7095 drm/vc4: hdmi: Set a default HSM rate
    b9c2343373f6 clk: bcm-2835: Remove rounding up the dividers
    836dd37fe2bb clk: bcm-2835: Pick the closest clock rate
    88f1b613c37f Bluetooth: cmtp: fix possible panic when cmtp_init_sockets() fails
    9ddfa1c19191 drm/rockchip: dsi: Reconfigure hardware on resume()
    58904ed18628 drm/rockchip: dsi: Disable PLL clock on bind error
    6215cde02085 drm/rockchip: dsi: Hold pm-runtime across bind/unbind
    8ccaafa1caf0 drm/rockchip: dsi: Fix unbalanced clock on probe error
    9bc19022aa08 drm/panel: innolux-p079zca: Delete panel on attach() failure
    b01b7b868479 drm/panel: kingdisplay-kd097d04: Delete panel on attach() failure
    0499c863a8db drm: fix null-ptr-deref in drm_dev_init_release()
    7798757013ec drm/bridge: display-connector: fix an uninitialized pointer in probe()
    cb5813b0e591 Bluetooth: L2CAP: Fix not initializing sk_peer_pid
    ed0b1fd3ec6e drm/ttm: Put BO in its memory manager's lru list
    7b9fa915a58d shmem: fix a race between shmem_unused_huge_shrink and shmem_evict_inode
    6c6f86bb618b mm/page_alloc.c: do not warn allocation failure on zone DMA if no managed pages
    e04b1dfe15ce dma/pool: create dma atomic pool only if dma zone has managed pages
    d2e572411738 mm_zone: add function to check if managed dma zone exists
    2142a7e9bd1f PCI: Add function 1 DMA alias quirk for Marvell 88SE9125 SATA controller
    45c74f4f54db dma_fence_array: Fix PENDING_ERROR leak in dma_fence_array_signaled()
    191a24ceae75 gpu: host1x: Add back arm_iommu_detach_device()
    068067453690 iommu/io-pgtable-arm-v7s: Add error handle for page table allocation failure
    3dae11f8e381 lkdtm: Fix content of section containing lkdtm_rodata_do_nothing()
    e4a2c924a17e iio: adc: ti-adc081c: Partial revert of removal of ACPI IDs
    256302cb2f86 can: softing_cs: softingcs_probe(): fix memleak on registration failure
    aa57725e2d2a media: cec-pin: fix interrupt en/disable handling
    2e566cacc321 media: stk1160: fix control-message timeouts
    1a0ca711dff6 media: pvrusb2: fix control-message timeouts
    2dbf430ead59 media: redrat3: fix control-message timeouts
    6e9c120bf956 media: dib0700: fix undefined behavior in tuner shutdown
    5e98ac260de6 media: s2255: fix control-message timeouts
    09b0b918a69b media: cpia2: fix control-message timeouts
    d90833106c09 media: em28xx: fix control-message timeouts
    2182575c83f9 media: mceusb: fix control-message timeouts
    460525acc953 media: flexcop-usb: fix control-message timeouts
    7cac8a562427 media: v4l2-ioctl.c: readbuffers depends on V4L2_CAP_READWRITE
    1da0b1cd4212 rtc: cmos: take rtc_lock while reading from CMOS
    14f6cfe0d790 tools/nolibc: fix incorrect truncation of exit code
    5e258640ba54 tools/nolibc: i386: fix initial stack alignment
    06f7528d641b tools/nolibc: x86-64: Fix startup code bug
    98259dd54e8e x86/gpu: Reserve stolen memory for first integrated Intel GPU
    e2a17dcad56e mtd: rawnand: davinci: Rewrite function description
    8933138a6660 mtd: rawnand: davinci: Avoid duplicated page read
    677764634b42 mtd: rawnand: davinci: Don't calculate ECC when reading page
    a8a607b0049d mtd: Fixed breaking list in __mtd_del_partition.
    ff10cd7bb295 mtd: rawnand: gpmi: Remove explicit default gpmi clock setting for i.MX6
    538a5e208e7d mtd: rawnand: gpmi: Add ERR007117 protection for nfc_apply_timings
    777a700ccfa6 nfc: llcp: fix NULL error pointer dereference on sendmsg() after failed bind()
    08283b076f4e f2fs: fix to do sanity check in is_alive()
    57cfc965e375 HID: wacom: Avoid using stale array indicies to read contact count
    7fd22c99bbed HID: wacom: Ignore the confidence flag when a touch is removed
    9a4800e0f6a5 HID: wacom: Reset expected and received contact counts at the same time
    c2e39d5df028 HID: uhid: Fix worker destroying device without any protection
    aa1346113c75 KVM: VMX: switch blocked_vcpu_on_cpu_lock to raw spinlock

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9bebdb447d39b9bca340f087bff6a008f199f34b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 48d2694995..4ee93cdd8b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ba47a407fe04203adb0ab5e164597c958cd9e334"
-SRCREV_meta ?= "7df27e6d296dfa16f289883c0661eed45059360c"
+SRCREV_machine ?= "8aebbbd41d16fc564ff99709d4f01a116d07e7a4"
+SRCREV_meta ?= "0db3f511b2a553a5ea31ac45249a42f084fc287c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.93"
+LINUX_VERSION ?= "5.10.96"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index eb42c407fa..0bde6e5c7f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.93"
+LINUX_VERSION ?= "5.10.96"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "ceb1f194e59c9dd3bdd83d51bb0994f3db23bf61"
-SRCREV_machine ?= "878e5c1469550bb0f8778d16d4adbe7d48b0b28d"
-SRCREV_meta ?= "7df27e6d296dfa16f289883c0661eed45059360c"
+SRCREV_machine_qemuarm ?= "ca361e2633ab577333303359eb2f7b0040647e5e"
+SRCREV_machine ?= "36f032fc87112de000ca01b6e8a41313d418dcd9"
+SRCREV_meta ?= "0db3f511b2a553a5ea31ac45249a42f084fc287c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index e67bf54c98..64b4ab5879 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "50c0e06718fb2b264619ce8d82608877d1e62a81"
-SRCREV_machine_qemuarm64 ?= "7907c5eb81e9a51307b5269d546999ebf47d9d59"
-SRCREV_machine_qemumips ?= "e9c51de36554662082afc08c6e54599b310c7951"
-SRCREV_machine_qemuppc ?= "77f361ea5eb293dcfe122ecb65f33ba32fd12501"
-SRCREV_machine_qemuriscv64 ?= "a1bbb29fe30c94c21309aa8b8c0d06fa12f3368d"
-SRCREV_machine_qemuriscv32 ?= "a1bbb29fe30c94c21309aa8b8c0d06fa12f3368d"
-SRCREV_machine_qemux86 ?= "a1bbb29fe30c94c21309aa8b8c0d06fa12f3368d"
-SRCREV_machine_qemux86-64 ?= "a1bbb29fe30c94c21309aa8b8c0d06fa12f3368d"
-SRCREV_machine_qemumips64 ?= "b668a352c94a8c29e585608e8302cacb1350f5ed"
-SRCREV_machine ?= "a1bbb29fe30c94c21309aa8b8c0d06fa12f3368d"
-SRCREV_meta ?= "7df27e6d296dfa16f289883c0661eed45059360c"
+SRCREV_machine_qemuarm ?= "7ad48434f8e0e848f7fe4891ee7ba670700c36fc"
+SRCREV_machine_qemuarm64 ?= "932cd0e7a66273eba2da54b4ac67e3c6e384e614"
+SRCREV_machine_qemumips ?= "27d7f99a1211d8eca210a84c88a9058772a751a5"
+SRCREV_machine_qemuppc ?= "914396443522268b332c8efe83b3b0306befd1cb"
+SRCREV_machine_qemuriscv64 ?= "74244dd30b3a2415a785d2228ab5abdef4536f03"
+SRCREV_machine_qemuriscv32 ?= "74244dd30b3a2415a785d2228ab5abdef4536f03"
+SRCREV_machine_qemux86 ?= "74244dd30b3a2415a785d2228ab5abdef4536f03"
+SRCREV_machine_qemux86-64 ?= "74244dd30b3a2415a785d2228ab5abdef4536f03"
+SRCREV_machine_qemumips64 ?= "ba30b538c1750a9fe5db275260862c99a5ed356a"
+SRCREV_machine ?= "74244dd30b3a2415a785d2228ab5abdef4536f03"
+SRCREV_meta ?= "0db3f511b2a553a5ea31ac45249a42f084fc287c"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.93"
+LINUX_VERSION ?= "5.10.96"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.35.1


