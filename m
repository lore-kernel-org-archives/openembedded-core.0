Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.4062.1623383461856029952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 20:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: kror41Qtqi7jMdaRLDkCd4O1sSLZIJI2ns1FifXv1vbbEOAnNK3lPXa3WYzPlJ3N53w7ICJXFr
 0wSan6eIWCeQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="192566059"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="192566059"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 20:51:13 -0700
IronPort-SDR: eId4OpDKGbE569XibgFnUZVI4Jo7YknFjq1WMRLkxnsvqY/KElflkYfvHtre8YTkboiogs/AKn
 gxzmIbSmMSFQ==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="403091650"
Received: from dlau-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.151.154])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 20:51:12 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 12/17] linux-yocto/5.10: update to v5.10.38
Date: Fri, 11 Jun 2021 11:50:45 +0800
Message-Id: <629dcc218c331a441be7ba1ad5b88b5eff73fb63.1623383318.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623383318.git.anuj.mittal@intel.com>
References: <cover.1623383318.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    689e89aee55c Linux 5.10.38
    ed350825e89a ASoC: rsnd: check all BUSIF status when error
    cd709c8e06b6 nvme: do not try to reconfigure APST when the controller is not live
    054add24a869 ext4: fix debug format string warning
    c5dffd422145 debugfs: Make debugfs_allow RO after init
    81cb4f36d62c dt-bindings: serial: 8250: Remove duplicated compatible strings
    c1514ad24c3e dt-bindings: media: renesas,vin: Make resets optional on R-Car Gen1
    c4e3d8cf615b i2c: mediatek: Fix send master code at more than 1MHz
    667627fa85a8 media: rkvdec: Remove of_match_ptr()
    b0402e785351 clk: exynos7: Mark aclk_fsys1_200 as critical
    805c990a9c54 drm/i915: Fix crash in auto_retire
    cd47b861d225 drm/i915/overlay: Fix active retire callback alignment
    a67c80dcb403 drm/i915: Read C0DRB3/C1DRB3 as 16 bits again
    17928443db88 drm/i915/gt: Fix a double free in gen8_preallocate_top_level_pdp
    20530f7fde75 kobject_uevent: remove warning in init_uevent_argv()
    6ece86e9e88f usb: typec: tcpm: Fix error while calculating PPS out values
    5d2f09c44ff2 ARM: 9027/1: head.S: explicitly map DT even if it lives in the first physical section
    ac421c7f90c8 ARM: 9020/1: mm: use correct section size macro to describe the FDT virtual address
    1eb77569029d ARM: 9012/1: move device tree mapping out of linear region
    6cdbafc2addd ARM: 9011/1: centralize phys-to-virt conversion of DT/ATAGS address
    6d5fda434b1f clocksource/drivers/timer-ti-dm: Handle dra7 timer wrap errata i940
    06470de53e4f clocksource/drivers/timer-ti-dm: Prepare to handle dra7 timer wrap issue
    462049cfb342 MIPS: Avoid handcoded DIVU in `__div64_32' altogether
    d17af8b19d99 MIPS: Avoid DIVU in `__div64_32' is result would be zero
    d2abb95bb1a4 MIPS: Reinstate platform `__div64_32' handler
    cfddf6a685e3 mm: fix struct page layout on 32-bit systems
    89bd62079870 iommu/vt-d: Remove WO permissions on second-level paging entries
    0160f627929c iommu/vt-d: Preset Access/Dirty bits for IOVA over FL
    a282b76166b1 Revert "iommu/vt-d: Preset Access/Dirty bits for IOVA over FL"
    c1f2d0beab5c Revert "iommu/vt-d: Remove WO permissions on second-level paging entries"
    31f29749ee97 KVM: VMX: Disable preemption when probing user return MSRs
    79abde761e05 KVM: VMX: Do not advertise RDPID if ENABLE_RDTSCP control is unsupported
    c8bf64e3fb77 KVM: nVMX: Always make an attempt to map eVMCS after migration
    2f86dd3d2bcf KVM: x86: Move RDPID emulation intercept to its own enum
    abbf8c99a9e1 KVM: x86: Emulate RDPID only if RDTSCP is supported
    8a7027f011c5 xen/gntdev: fix gntdev_mmap() error exit path
    652c9689f589 cdc-wdm: untangle a circular dependency between callback and softint
    12d16c24f35f iio: tsl2583: Fix division by a zero lux_val
    e8c6852bdba2 iio: gyro: mpu3050: Fix reported temperature value
    70698dda4bca xhci: Add reset resume quirk for AMD xhci controller.
    9d9526cc3c01 xhci: Do not use GFP_KERNEL in (potentially) atomic context
    ca043cc02a88 xhci-pci: Allow host runtime PM as default for Intel Alder Lake xHCI
    fa4b1363256d usb: typec: ucsi: Put fwnode in any case during ->probe()
    e5366bea0277 usb: typec: ucsi: Retrieve all the PDOs instead of just the first 4
    9bd96a2e77fd usb: dwc3: gadget: Return success always for kick transfer in ep queue
    45f37f54e7c1 usb: dwc3: gadget: Enable suspend events
    9238492b9a84 usb: core: hub: fix race condition about TRSMRCY of resume
    45ad6b592e64 usb: dwc2: Fix gadget DMA unmap direction
    7ad9256b49a6 usb: xhci: Increase timeout for HC halt
    42bb80ae0165 usb: dwc3: pci: Enable usb2-gadget-lpm-disable for Intel Merrifield
    95e3da5b53ba usb: dwc3: omap: improve extcon initialization
    3a96437f6bf8 blk-mq: Swap two calls in blk_mq_exit_queue()
    c9c1ed08c174 blk-mq: plug request for shared sbitmap
    cde4b55cfb24 nbd: Fix NULL pointer in flush_workqueue
    a9fc163514d2 f2fs: compress: fix to assign cc.cluster_idx correctly
    5639b73fd3bc f2fs: compress: fix race condition of overwrite vs truncate
    72b0f3077ebd f2fs: compress: fix to free compress page correctly
    64f3410c7bfc nvmet-rdma: Fix NULL deref when SEND is completed with error
    c98ecfb18296 nvmet: fix inline bio check for bdev-ns
    f8ae879b776c nvmet: add lba to sect conversion helpers
    54dbe2d2c1fc kyber: fix out of bounds access when preempted
    e2381174daea ACPI: scan: Fix a memory leak in an error handling path
    a8dc16bbfe29 usb: musb: Fix an error message
    550473900f80 hwmon: (occ) Fix poll rate limiting
    0becd19b211a usb: fotg210-hcd: Fix an error message
    2c3b4375e118 iio: hid-sensors: select IIO_TRIGGERED_BUFFER under HID_SENSOR_IIO_TRIGGER
    020fe6f80f4f iio: proximity: pulsedlight: Fix rumtime PM imbalance on error
    9db8ba3cac05 iio: light: gp2ap002: Fix rumtime PM imbalance on error
    1ea775021282 usb: dwc3: gadget: Free gadget structure only after freeing endpoints
    26c777470d57 perf tools: Fix dynamic libbpf link
    1d8d7e02f6d0 xen/unpopulated-alloc: fix error return code in fill_list()
    058122572676 xen/unpopulated-alloc: consolidate pgmap manipulation
    9eaa10be0c08 dax: Wake up all waiters after invalidating dax entry
    e9e70b78e163 dax: Add a wakeup mode parameter to put_unlocked_entry()
    b93d3410e789 dax: Add an enum for specifying dax wakup mode
    b9c663dc9a83 KVM: x86: Prevent deadlock against tk_core.seq
    8aa7227a5d9b KVM: x86: Cancel pvclock_gtod_work on module removal
    1fe269372244 drm/msm/dp: initialize audio_comp when audio starts
    2e0ce36d0bf6 KVM: LAPIC: Accurately guarantee busy wait for timer to expire when using hv_timer
    ce7639252357 kvm: exit halt polling on need_resched() as well
    970c978d0591 drm/i915: Avoid div-by-zero on gen2
    86cd6072157c drm/amd/display: Initialize attribute for hdcp_srm sysfs file
    5a6fe45a3a7f drm/radeon/dpm: Disable sclk switching on Oland when two 4K 60Hz monitors are connected
    bccb7dd137ad btrfs: fix race leading to unpersisted data and metadata on fsync
    d6d66dbd5adc arm64: Fix race condition on PG_dcache_clean in __sync_icache_dcache()
    d3bab7cbadfb arm64: mte: initialize RGSR_EL1.SEED in __cpu_setup
    70748bba5565 blk-iocost: fix weight updates of inner active iocgs
    014868616d48 mm/hugetlb: fix F_SEAL_FUTURE_WRITE
    fe5c0a63ad22 kasan: fix unit tests with CONFIG_UBSAN_LOCAL_BOUNDS enabled
    140cfd998012 userfaultfd: release page in error path to avoid BUG_ON
    2ed1d90162a0 squashfs: fix divide error in calculate_skip()
    adbd8a2a8cc0 hfsplus: prevent corruption in shrinking truncate
    d2e3590ca39c powerpc/64s: Fix crashes when toggling entry flush barrier
    51570beeb448 powerpc/64s: Fix crashes when toggling stf barrier
    cb3e286f22ff ARC: mm: Use max_high_pfn as a HIGHMEM zone border
    969de0f6599e ARC: mm: PAE: use 40-bit physical page mask
    af9e5364c617 ARC: entry: fix off-by-one error in syscall number validation
    23ecfe7f2c1f f2fs: avoid unneeded data copy in f2fs_ioc_move_range()
    758fd227ed84 mptcp: fix splat when closing unaccepted socket
    b8cf51a36da2 i40e: Fix PHY type identifiers for 2.5G and 5G adapters
    06ef93b776f7 i40e: fix the restart auto-negotiation after FEC modified
    829a713450b8 i40e: Fix use-after-free in i40e_client_subtask()
    2692bf13e646 i40e: fix broken XDP support
    72b49dd116ca netfilter: nftables: avoid overflows in nft_hash_buckets()
    f665dedeedc9 kernel/resource: make walk_mem_res() find all busy IORESOURCE_MEM resources
    1ec193255271 kernel/resource: make walk_system_ram_res() find all busy IORESOURCE_SYSTEM_RAM resources
    0886bb143cbb kernel: kexec_file: fix error return code of kexec_calculate_store_digests()
    d43be02fc40b fs/proc/generic.c: fix incorrect pde_is_permanent check
    f89b408d506e sched/fair: Fix unfairness caused by missing load decay
    f7347c85490b sched: Fix out-of-bound access in uclamp
    26359d362c93 can: m_can: m_can_tx_work_queue(): fix tx_skb race condition
    eecb4df8ec9f can: mcp251x: fix resume from sleep before interface was brought up
    02140d9d2712 can: mcp251xfd: mcp251xfd_probe(): add missing can_rx_offload_del() in error path
    2c784a500f5e netfilter: nftables: Fix a memleak from userdata error path in new objects
    403ccad066ec netfilter: nfnetlink_osf: Fix a missing skb_header_pointer() NULL check
    cee6592d444a smc: disallow TCP_ULP in smc_setsockopt()
    d6c635a8cc6a net: fix nla_strcmp to handle more then one trailing null character
    26b7924707a4 ethtool: fix missing NLM_F_MULTI flag when dumping
    673422b97ef3 mm/gup: check for isolation errors
    096c9482cea2 mm/gup: return an error on migration failure
    7df511ef376d mm/gup: check every subpage of a compound page during isolation
    87c4e386b612 ksm: fix potential missing rmap_item for stable_node
    aa0d6d1d3e77 mm/migrate.c: fix potential indeterminate pte entry in migrate_vma_insert_page()
    9639a754cce5 mm/hugeltb: handle the error case in hugetlb_fix_reserve_counts()
    14d45fb5a3fc khugepaged: fix wrong result value for trace_mm_collapse_huge_page_isolate()
    51524fa8b5f7 arm64: entry: always set GIC_PRIO_PSR_I_SET during entry
    c9f43423c41e arm64: entry: factor irq triage logic into macros
    93dcaa8cba65 drm/radeon: Avoid power table parsing memory leaks
    79208af94738 drm/radeon: Fix off-by-one power_state index heap overwrite
    f551068f5f32 net: stmmac: Clear receive all(RA) bit when promiscuous mode is off
    340de910d65e xsk: Fix for xp_aligned_validate_desc() when len == chunk_size
    75ea98246903 netfilter: xt_SECMARK: add new revision to fix structure layout
    db5f1c6f776d sctp: fix a SCTP_MIB_CURRESTAB leak in sctp_sf_do_dupcook_b
    7afdd6aba95c ethernet:enic: Fix a use after free bug in enic_hard_start_xmit
    3d808916d256 block/rnbd-clt: Check the return value of the function rtrs_clt_query
    c1a90296a9b5 block/rnbd-clt: Change queue_depth type in rnbd_clt_session to size_t
    4aae6eb6af7d libbpf: Fix signed overflow in ringbuf_process_ring
    60bb2cecf47f sunrpc: Fix misplaced barrier in call_decode
    208af7ffc351 RISC-V: Fix error code returned by riscv_hartid_to_cpuid()
    f01988ecf365 sctp: do asoc update earlier in sctp_sf_do_dupcook_a
    65084886c6ee net: hns3: disable phy loopback setting in hclge_mac_start_phy
    5aa957e2b5fc net: hns3: use netif_tx_disable to stop the transmit queue
    90120c475dd7 net: hns3: fix for vxlan gpe tx checksum bug
    7a476a8a9cb6 net: hns3: add check for HNS3_NIC_STATE_INITED in hns3_reset_notify_up_enet()
    bd4d527ea5f7 net: hns3: initialize the message content in hclge_get_link_mode()
    5d326e253501 net: hns3: fix incorrect configuration for igu_egu_hw_err
    494ade7aba11 rtc: ds1307: Fix wday settings for rx8130
    5515b85e1a01 scsi: ufs: core: Narrow down fast path in system suspend path
    e8295def80b7 scsi: ufs: core: Cancel rpm_dev_flush_recheck_work during system suspend
    591602738e00 scsi: ufs: core: Do not put UFS power into LPM if link is broken
    429ac0fb8375 scsi: qla2xxx: Prevent PRLI in target mode
    bf45c9fe99aa ceph: fix inode leak on getattr error in __fh_to_dentry
    a01572e21f09 swiotlb: Fix the type of index
    04dad2ca1f5e xprtrdma: rpcrdma_mr_pop() already does list_del_init()
    eddae8be7944 xprtrdma: Fix cwnd update ordering
    89a31bf85c7b xprtrdma: Avoid Receive Queue wrapping
    b22e8f427c3d pwm: atmel: Fix duty cycle calculation in .get_state()
    0a9decf2dd4d SUNRPC: fix ternary sign expansion bug in tracing
    dd41a0e51532 dmaengine: idxd: fix cdev setup and free device lifetime issues
    975c4b2b9976 dmaengine: idxd: fix dma device lifetime
    5756f757c725 dmaengine: idxd: Fix potential null dereference on pointer status
    0f9d467ff139 rtc: fsl-ftm-alarm: add MODULE_TABLE()
    90e8fa8bdfb3 nfsd: ensure new clients break delegations
    b4bf335acacc NFSv4.x: Don't return NFS4ERR_NOMATCHING_LAYOUT if we're unmounting
    5d254e17ca86 thermal/drivers/tsens: Fix missing put_device error
    4f86a0a5eb61 SUNRPC: Handle major timeout in xprt_adjust_timeout()
    8efd19bf754b SUNRPC: Remove trace_xprt_transmit_queued
    7b906077fd99 SUNRPC: Move fault injection call sites
    bfeb4e607d00 NFSv4.2 fix handling of sr_eof in SEEK's reply
    1fbea60ea658 pNFS/flexfiles: fix incorrect size check in decode_nfs_fh()
    fd65cac30d45 PCI: endpoint: Fix missing destroy_workqueue()
    d21a5950cca6 NFS: Deal correctly with attribute generation counter overflow
    cbc868ea28a8 NFSv4.2: Always flush out writes in nfs42_proc_fallocate()
    a09afbb63620 NFS: Fix attribute bitmask in _nfs42_proc_fallocate()
    ce2b470added NFS: nfs4_bitmask_adjust() must not change the server global bitmasks
    0627cbc9b875 rpmsg: qcom_glink_native: fix error return code of qcom_glink_rx_data()
    b59194c7ca29 f2fs: fix to avoid accessing invalid fio in f2fs_allocate_data_block()
    1fd6a0641040 f2fs: Fix a hungtask problem in atomic write
    98ccee81fe96 f2fs: fix to cover __allocate_new_section() with curseg_lock
    105155a8146d f2fs: fix to avoid touching checkpointed data in get_victim()
    bbed83d7060e PCI: endpoint: Fix NULL pointer dereference for ->get_features()
    d5e85b92b457 PCI: endpoint: Make *_free_bar() to return error codes on failure
    d98bfd4cc258 PCI: endpoint: Add helper API to get the 'next' unreserved BAR
    5974766170d8 PCI: endpoint: Make *_get_first_free_bar() take into account 64 bit BAR
    8c8f7c49930d f2fs: fix to update last i_size if fallocate partially succeeds
    74d2b0e74c3f f2fs: fix to align to section for fallocate() on pinned file
    630146203108 ARM: 9064/1: hw_breakpoint: Do not directly check the event's overflow_handler hook
    ee93cdcbe0b5 PCI: Release OF node in pci_scan_device()'s error path
    c5c0ede221d7 PCI: iproc: Fix return value of iproc_msi_irq_domain_alloc()
    1ce0d1d3656b remoteproc: qcom_q6v5_mss: Validate p_filesz in ELF loader
    2ec65063e45a remoteproc: qcom_q6v5_mss: Replace ioremap with memremap
    2d6d5b4fc498 f2fs: fix a redundant call to f2fs_balance_fs if an error occurs
    1c20a4896409 f2fs: fix panic during f2fs_resize_fs()
    81ba1634d1b6 f2fs: fix to allow migrating fully valid segment
    de2041d92d2a f2fs: fix compat F2FS_IOC_{MOVE,GARBAGE_COLLECT}_RANGE
    b7ff0885de7e f2fs: move ioctl interface definitions to separated file
    997d24a932a9 thermal: thermal_of: Fix error return code of thermal_of_populate_bind_params()
    a1b5fecedfa9 ASoC: rt286: Make RT286_SET_GPIO_* readable and writable
    5b66867966bc watchdog: fix barriers when printing backtraces from all CPUs
    a68c246065b6 watchdog/softlockup: remove logic that tried to prevent repeated reports
    9413b1ee3858 watchdog: explicitly update timestamp when reporting softlockup
    018655f8758a watchdog: rename __touch_watchdog() to a better descriptive name
    1dc55c3a4862 ia64: module: fix symbolizer crash on fdescr
    602795e247d1 bnxt_en: Add PCI IDs for Hyper-V VF devices.
    d0736af81151 kbuild: generate Module.symvers only when vmlinux exists
    9401b7ff91f9 selftests: mlxsw: Fix mausezahn invocation in ERSPAN scale test
    dfa0e8461e99 selftests: mlxsw: Increase the tolerance of backlog buildup
    99d9989ee53b net: ethernet: mtk_eth_soc: fix RX VLAN offload
    320c50ff84a0 iavf: remove duplicate free resources calls
    6289b028b5e2 powerpc/iommu: Annotate nested lock for lockdep
    bece6aea3653 qtnfmac: Fix possible buffer overflow in qtnf_event_handle_external_auth
    ededc7325dc2 wl3501_cs: Fix out-of-bounds warnings in wl3501_mgmt_join
    83a7ed5b891c wl3501_cs: Fix out-of-bounds warnings in wl3501_send_pkt
    f3a5dee0f30c crypto: ccp: Free SEV device if SEV init fails
    22ab352fcab7 mt76: mt7615: fix entering driver-own state on mt7663
    5b02d6efdb1b drm/amdgpu: Add mem sync flag for IB allocated by SA
    8be5e713f725 drm/amd/display: add handling for hdcp2 rx id list validation
    fa9952e854c4 drm/amd/display: fixed divide by zero kernel crash during dsc enablement
    d98b03bfd0c7 powerpc/pseries: Stop calling printk in rtas_stop_self()
    799c3950680a samples/bpf: Fix broken tracex1 due to kprobe argument change
    d4b0dc31df99 net: sched: tapr: prevent cycle_time == 0 in parse_taprio_schedule
    05916c62f54a ethtool: ioctl: Fix out-of-bounds warning in store_link_ksettings_for_user()
    b506357ab8bb ASoC: rt286: Generalize support for ALC3263 codec
    33eee468f83a powerpc/smp: Set numa node before updating mask
    245f5ab5ce52 flow_dissector: Fix out-of-bounds warning in __skb_flow_bpf_to_target()
    d5716625f185 sctp: Fix out-of-bounds warning in sctp_process_asconf_param()
    136b0261f119 ALSA: hda/hdmi: fix race in handling acomp ELD notification at resume
    4ac5823083fa ASoC: Intel: sof_sdw: add quirk for new ADL-P Rvp
    e3a2982bf63f ALSA: hda/realtek: Add quirk for Lenovo Ideapad S740
    cc1956f8b278 kconfig: nconf: stop endless search loops
    06b0037e6f02 selftests: Set CC to clang in lib.mk if LLVM is set
    f9bc5e3f3f75 drm/amd/display: Force vsync flip when reconfiguring MPCC
    63e9abe35df9 iommu/amd: Remove performance counter pre-initialization test
    1097ecf826bc Revert "iommu/amd: Fix performance counter initialization"
    a027e6155bb4 ASoC: rsnd: call rsnd_ssi_master_clk_start() from rsnd_ssi_init()
    cc748965313b powerpc/mm: Add cond_resched() while removing hpte mappings
    26f98b2d97a8 iwlwifi: pcie: make cfg vs. trans_cfg more robust
    2bfc47dec5b8 cuse: prevent clone
    2c20c7d96e45 virtiofs: fix userns
    87fe0ca09b26 fuse: invalidate attrs when page writeback completes
    f1c230d75b47 mt76: mt7915: fix txpower init for TSSI off chips
    7eb1e84cfe28 mt76: mt76x0: disable GTK offloading
    bbd3d0014cc4 mt76: mt7615: support loading EEPROM for MT7613BE
    32b3e7e303bd rtw88: 8822c: add LC calibration for RTL8822C
    28c2a1d65088 pinctrl: samsung: use 'int' for register masks in Exynos
    2eac474900d3 mac80211: clear the beacon's CRC after channel switch
    437a4746e47e IB/hfi1: Correct oversized ring allocation
    d7592a5c376b coresight: Do not scan for graph if none is present
    8f7806174fdb MIPS: Loongson64: Use _CACHE_UNCACHED instead of _CACHE_UNCACHED_ACCELERATED
    2c098ad786d3 i2c: Add I2C_AQ_NO_REP_START adapter quirk
    c6d2f8ffb145 ASoC: rt5670: Add a quirk for the Dell Venue 10 Pro 5055
    6c9b2de44812 Bluetooth: btusb: Enable quirk boolean flag for Mediatek Chip.
    c87b052deaa8 ice: handle increasing Tx or Rx ring sizes
    eb28709c07a6 ASoC: Intel: bytcr_rt5640: Add quirk for the Chuwi Hi8 tablet
    7bd851a6d369 ip6_vti: proper dev_{hold|put} in ndo_[un]init methods
    b502a6a44066 net: hns3: add handling for xmit skb with recursive fraglist
    c56804f431db net: hns3: remediate a potential overflow risk of bd_num_list
    286b3ff9fd98 powerpc/32: Statically initialise first emergency context
    b9f9313c7501 selftests/powerpc: Fix L1D flushing tests for Power10
    2033dde6aa01 Bluetooth: check for zapped sk before connecting
    6421cdfbb6fb net: bridge: when suppression is enabled exclude RARP packets
    fccb35bbf75f net/sched: cls_flower: use ntohs for struct flow_dissector_key_ports
    a019b8d7dfd5 Bluetooth: initialize skb_queue_head at l2cap_chan_create()
    e0dc9e93f7fd Bluetooth: Set CONF_NOT_COMPLETE as l2cap_chan default
    b972f345a17a ALSA: bebob: enable to deliver MIDI messages for multiple ports
    d398f25007d5 ALSA: rme9652: don't disable if not enabled
    9df07b0661e7 ALSA: hdspm: don't disable if not enabled
    a950cd8cb05d ALSA: hdsp: don't disable if not enabled
    faed3150a436 i2c: bail out early when RDWR parameters are wrong
    18df2bc13b1f Bluetooth: Fix incorrect status handling in LE PHY UPDATE event
    879a96d817ed ASoC: rsnd: core: Check convert rate in rsnd_hw_params
    a2aeb5de26c1 net: stmmac: Set FIFO sizes for ipq806x
    c0a62a441bbd net/mlx5e: Use net_prefetchw instead of prefetchw in MPWQE TX datapath
    2d17c58a3a4f ASoC: Intel: bytcr_rt5640: Enable jack-detect support on Asus T100TAF
    3d1bede85632 tipc: convert dest node's address to network order
    a407b5881686 fs: dlm: flush swork on shutdown
    ff58d1c72edf fs: dlm: check on minimum msglen size
    ca973d2aeaf7 fs: dlm: add errno handling to check callback
    06d59d21cb05 fs: dlm: fix debugfs dump
    bd6017a942b9 ath11k: fix thermal temperature read
    21756f878e82 kvm: Cap halt polling at kvm->max_halt_poll_ns
    53d7eed0315a cpufreq: intel_pstate: Use HWP if enabled by platform firmware
    182f1f72af2e PM: runtime: Fix unpaired parent child_count for force_resume
    e97da47e9be0 ACPI: PM: Add ACPI ID of Alder Lake Fan
    bfccc4eade2b KVM/VMX: Invoke NMI non-IST entry instead of IST entry
    21f317826e17 KVM: x86/mmu: Remove the defunct update_pte() paging hook
    53171e68a509 tpm, tpm_tis: Reserve locality in tpm_tis_resume()
    923866165610 tpm, tpm_tis: Extend locality handling to TPM2 in tpm_tis_gen_interrupt()
    8fe5a459186a tpm: fix error return code in tpm2_get_cc_attrs_tbl()
    31c9a4b24d86 KEYS: trusted: Fix memory leak on object td

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d9a05d2c6252f53819cc7b4c9d2062ebb64f4299)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index aa5136bdd3..98c438e08a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "bced2cdbd646996800d920c1604bffbb050a62ab"
-SRCREV_meta ?= "cd049697e9b2d3e9118110d476075ff8f87202cc"
+SRCREV_machine ?= "0ccf0db07a7247fb5303b3291e5c024cc52e3061"
+SRCREV_meta ?= "d38abd9180148fe29fc92b8d7fa4bb14a59328eb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.37"
+LINUX_VERSION ?= "5.10.38"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 2229651234..4bace3ca82 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.37"
+LINUX_VERSION ?= "5.10.38"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "8671a3ad43c8c3c86c6d68cbe37699bcdbefcf95"
-SRCREV_machine ?= "3e27efe3e870d43df01e9a9fdb06bf4221e82b51"
-SRCREV_meta ?= "cd049697e9b2d3e9118110d476075ff8f87202cc"
+SRCREV_machine_qemuarm ?= "0fb85b368f742ae428ecfabe7a1ca894149fdbdc"
+SRCREV_machine ?= "231125d238d5c59712afeff6524f33cad3eb7802"
+SRCREV_meta ?= "d38abd9180148fe29fc92b8d7fa4bb14a59328eb"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 910b38e874..eb9c7f59cc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "4709102e6293ec2ac641914495cf3dc3d91172dd"
-SRCREV_machine_qemuarm64 ?= "3e27efe3e870d43df01e9a9fdb06bf4221e82b51"
-SRCREV_machine_qemumips ?= "15f871db6d6e35e72e3a2bf15927cb99865218e1"
-SRCREV_machine_qemuppc ?= "3e27efe3e870d43df01e9a9fdb06bf4221e82b51"
-SRCREV_machine_qemuriscv64 ?= "3e27efe3e870d43df01e9a9fdb06bf4221e82b51"
-SRCREV_machine_qemuriscv32 ?= "3e27efe3e870d43df01e9a9fdb06bf4221e82b51"
-SRCREV_machine_qemux86 ?= "3e27efe3e870d43df01e9a9fdb06bf4221e82b51"
-SRCREV_machine_qemux86-64 ?= "3e27efe3e870d43df01e9a9fdb06bf4221e82b51"
-SRCREV_machine_qemumips64 ?= "5487fabea2c4601da8b1233d50a07a7b4e698c89"
-SRCREV_machine ?= "3e27efe3e870d43df01e9a9fdb06bf4221e82b51"
-SRCREV_meta ?= "cd049697e9b2d3e9118110d476075ff8f87202cc"
+SRCREV_machine_qemuarm ?= "55f7c2088de75a4e9588d014c8c7cf961dfcc2fa"
+SRCREV_machine_qemuarm64 ?= "231125d238d5c59712afeff6524f33cad3eb7802"
+SRCREV_machine_qemumips ?= "ac525be591a408dadbd2e95ef15f7de90a2f76e3"
+SRCREV_machine_qemuppc ?= "231125d238d5c59712afeff6524f33cad3eb7802"
+SRCREV_machine_qemuriscv64 ?= "231125d238d5c59712afeff6524f33cad3eb7802"
+SRCREV_machine_qemuriscv32 ?= "231125d238d5c59712afeff6524f33cad3eb7802"
+SRCREV_machine_qemux86 ?= "231125d238d5c59712afeff6524f33cad3eb7802"
+SRCREV_machine_qemux86-64 ?= "231125d238d5c59712afeff6524f33cad3eb7802"
+SRCREV_machine_qemumips64 ?= "4f4e62712a88a2460ae132059c6b51e6ff35299e"
+SRCREV_machine ?= "231125d238d5c59712afeff6524f33cad3eb7802"
+SRCREV_meta ?= "d38abd9180148fe29fc92b8d7fa4bb14a59328eb"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.37"
+LINUX_VERSION ?= "5.10.38"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.31.1

