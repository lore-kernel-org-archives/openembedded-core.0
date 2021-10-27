Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7B4C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:04 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.13168.1635347816645315769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456723"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456723"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:03 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617022"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:01 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 04/36] linux-yocto/5.4: update to v5.4.149
Date: Wed, 27 Oct 2021 23:16:12 +0800
Message-Id: 
 <dc059b70e9dff390c89775eeae9349c5b44f2746.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157520

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    e74e2950a0d6 Linux 5.4.149
    382526348612 drm/nouveau/nvkm: Replace -ENOSYS with -ENODEV
    409cb0b3d45a rtc: rx8010: select REGMAP_I2C
    43832bf76363 blk-throttle: fix UAF by deleteing timer in blk_throtl_exit()
    c37a34d7975f pwm: stm32-lp: Don't modify HW state in .remove() callback
    8a29e68ea8e8 pwm: rockchip: Don't modify HW state in .remove() callback
    ed60d2db3171 pwm: img: Don't modify HW state in .remove() callback
    b16f4acf6b65 nilfs2: fix memory leak in nilfs_sysfs_delete_snapshot_group
    594addd4369e nilfs2: fix memory leak in nilfs_sysfs_create_snapshot_group
    237ca37ca5ac nilfs2: fix memory leak in nilfs_sysfs_delete_##name##_group
    288c8b5ba52d nilfs2: fix memory leak in nilfs_sysfs_create_##name##_group
    dc70f0c8c3de nilfs2: fix NULL pointer in nilfs_##name##_attr_release
    9c3ba404881d nilfs2: fix memory leak in nilfs_sysfs_create_device_group
    fb4c7d2923de btrfs: fix lockdep warning while mounting sprout fs
    3f2d5c11bef8 ceph: lockdep annotations for try_nonblocking_invalidate
    3bbb11261a75 ceph: request Fw caps before updating the mtime in ceph_write_iter
    2c89a856fa49 dmaengine: xilinx_dma: Set DMA mask for coherent APIs
    2f3206199dc9 dmaengine: ioat: depends on !UML
    644f1e87fe73 dmaengine: sprd: Add missing MODULE_DEVICE_TABLE
    445a3379f6df parisc: Move pci_dev_is_behind_card_dino to where it is used
    2f7bfc07e386 drivers: base: cacheinfo: Get rid of DEFINE_SMP_CALL_CACHE_FUNCTION()
    a12743d07249 thermal/core: Fix thermal_cooling_device_register() prototype
    c7b9a866ee25 Kconfig.debug: drop selecting non-existing HARDLOCKUP_DETECTOR_ARCH
    3c1d9b650c08 net: stmmac: reset Tx desc base address before restarting Tx
    729f9d5ee374 phy: avoid unnecessary link-up delay in polling mode
    81e6b51709da pwm: lpc32xx: Don't modify HW state in .probe() after the PWM chip was registered
    b94def8a475f profiling: fix shift-out-of-bounds bugs
    7e98111cb28e nilfs2: use refcount_dec_and_lock() to fix potential UAF
    5607b1bae1c8 prctl: allow to setup brk for et_dyn executables
    b40301607ca8 9p/trans_virtio: Remove sysfs file on probe failure
    c3b45ea0a3c8 thermal/drivers/exynos: Fix an error code in exynos_tmu_probe()
    e1060803039d dmaengine: acpi: Avoid comparison GSI with Linux vIRQ
    93f8a98ad89c um: virtio_uml: fix memory leak on init failures
    4cd05e390a3b staging: rtl8192u: Fix bitwise vs logical operator in TranslateRxSignalStuff819xUsb()
    2f4b67bceb09 sctp: add param size validation for SCTP_PARAM_SET_PRIMARY
    cbd10b118902 sctp: validate chunk size in __rcv_asconf_lookup
    6a12918e9065 ARM: 9098/1: ftrace: MODULE_PLT: Fix build problem without DYNAMIC_FTRACE
    2f7974cd7b12 ARM: 9079/1: ftrace: Add MODULE_PLTS support
    1b27a03d1292 ARM: 9078/1: Add warn suppress parameter to arm_gen_branch_link()
    490be340c86c ARM: 9077/1: PLT: Move struct plt_entries definition to header
    278df0646003 apparmor: remove duplicate macro list_entry_is_head()
    f23763ab464f ARM: Qualify enabling of swiotlb_init()
    6bfdc3056ca8 s390/pci_mmio: fully validate the VMA before calling follow_pte()
    bd292c687390 console: consume APC, DM, DCS
    b0c813fbbf75 KVM: remember position in kvm->vcpus array
    5163578e9d0b PCI/ACPI: Add Ampere Altra SOC MCFG quirk
    ec29e33e5cba PCI: aardvark: Fix reporting CRS value
    3f0e275e43f6 PCI: pci-bridge-emul: Add PCIe Root Capabilities Register
    296895c4f0c8 PCI: aardvark: Indicate error in 'val' when config read fails
    2fcb7b7a1d20 PCI: pci-bridge-emul: Fix big-endian support
    07e5f23d3fa6 Linux 5.4.148
    54ac8339ae99 s390/bpf: Fix 64-bit subtraction of the -0x80000000 constant
    a5fc48000b0e s390/bpf: Fix optimizing out zero-extensions
    f7f1bac8983f net: renesas: sh_eth: Fix freeing wrong tx descriptor
    3d32ce5472bb ip_gre: validate csum_start only on pull
    f9b308f7302e qlcnic: Remove redundant unlock in qlcnic_pinit_from_rom
    93f54354ccc8 fq_codel: reject silly quantum parameters
    d448b240b175 netfilter: socket: icmp6: fix use-after-scope
    b79204169de5 net: dsa: b53: Fix calculating number of switch ports
    d5c0f016ae85 perf unwind: Do not overwrite FEATURE_CHECK_LDFLAGS-libunwind-{x86,aarch64}
    114bf5776f56 ARC: export clear_user_page() for modules
    9b63c27d6b70 mtd: rawnand: cafe: Fix a resource leak in the error handling path of 'cafe_nand_probe()'
    14e0fdc43ddf PCI: Sync __pci_register_driver() stub for CONFIG_PCI=n
    810f9b6f0a40 KVM: arm64: Handle PSCI resets before userspace touches vCPU state
    5f289dcf0b02 mfd: tqmx86: Clear GPIO IRQ resource when no IRQ is set
    e1746c27c373 PCI: Fix pci_dev_str_match_path() alloc while atomic bug
    beaf65f0fe0c mfd: axp20x: Update AXP288 volatile ranges
    4a6c7c818bcb NTB: perf: Fix an error code in perf_setup_inbuf()
    5a1614194963 NTB: Fix an error code in ntb_msit_probe()
    098069796940 ethtool: Fix an error code in cxgb2.c
    f336aa92b431 PCI: ibmphp: Fix double unmap of io_mem
    0f9550c4f40d block, bfq: honor already-setup queue merges
    b61a99dda392 net: usb: cdc_mbim: avoid altsetting toggling for Telit LN920
    79b584d85912 Set fc_nlinfo in nh_create_ipv4, nh_create_ipv6
    cf4168c4e0ec PCI: Add ACS quirks for Cavium multi-function devices
    b3435cd96848 tracing/probes: Reject events which have the same name of existing one
    32280649f044 mfd: Don't use irq_create_mapping() to resolve a mapping
    e904621ae0b7 fuse: fix use after free in fuse_read_interrupt()
    a1eaaa6b7d88 PCI: Add ACS quirks for NXP LX2xx0 and LX2xx2 platforms
    47c4490617d1 mfd: db8500-prcmu: Adjust map to reality
    88834a62539f dt-bindings: mtd: gpmc: Fix the ECC bytes vs. OOB bytes equation
    86565668215f mm/memory_hotplug: use "unsigned long" for PFN in zone_for_pfn_range()
    d291cca2c4f7 net: hns3: fix the timing issue of VF clearing interrupt sources
    65bcb8f73ae3 net: hns3: disable mac in flr process
    d8fe64c3511e net: hns3: change affinity_mask to numa node range
    dede0381da0b net: hns3: pad the short tunnel frame before sending to hardware
    4bf2c9605dff KVM: PPC: Book3S HV: Tolerate treclaim. in fake-suspend mode changing registers
    235f782d5e3b ibmvnic: check failover_pending in login response
    d3939844ebdc dt-bindings: arm: Fix Toradex compatible typo
    c642afd17ab5 qed: Handle management FW error
    9ebbb8b964f5 tcp: fix tp->undo_retrans accounting in tcp_sacktag_one()
    baf450477143 net: dsa: destroy the phylink instance on any error in dsa_slave_phy_setup
    498e765b8595 net/af_unix: fix a data-race in unix_dgram_poll
    e7332a1ac14e vhost_net: fix OoB on sendmsg() failure.
    172749c879f5 events: Reuse value read using READ_ONCE instead of re-reading it
    cd78d9c9968f net/mlx5: Fix potential sleeping in atomic context
    48e79555c22c net/mlx5: FWTrace, cancel work on alloc pd error flow
    4655f8a5afc2 perf machine: Initialize srcline string member in add_location struct
    6808e70a77e9 tipc: increase timeout in tipc_sk_enqueue()
    678787dcfe92 r6040: Restore MDIO clock frequency after MAC reset
    efe35db94897 net/l2tp: Fix reference count leak in l2tp_udp_recv_core
    5ab04a4ffed0 dccp: don't duplicate ccid when cloning dccp sock
    6c4b7a87ba79 ptp: dp83640: don't define PAGE0
    faf9d465425b net-caif: avoid user-triggerable WARN_ON(1)
    79ab38864d5e tipc: fix an use-after-free issue in tipc_recvmsg
    08f33350ed8a x86/mm: Fix kern_addr_valid() to cope with existing but not present entries
    fde4caf6fe4d s390/sclp: fix Secure-IPL facility detection
    15b674b1e581 drm/etnaviv: add missing MMU context put when reaping MMU mapping
    b2ec1e6f1d6f drm/etnaviv: reference MMU context when setting up hardware state
    5827dbac41c7 drm/etnaviv: fix MMU context leak on GPU reset
    5e67b3843540 drm/etnaviv: exec and MMU state is lost when resetting the GPU
    7068030d5e26 drm/etnaviv: keep MMU context across runtime suspend/resume
    a7970d4f0039 drm/etnaviv: stop abusing mmu_context as FE running marker
    ee52ccecfe2c drm/etnaviv: put submit prev MMU context when it exists
    a9bacefda031 drm/etnaviv: return context from etnaviv_iommu_context_get
    b56b6c51a919 drm/amd/amdgpu: Increase HWIP_MAX_INSTANCE to 10
    c221eb008a98 PCI: Add AMD GPU multi-function power dependencies
    d180a373a014 PM: base: power: don't try to use non-existing RTC for storing data
    484fbe9cc0d9 arm64/sve: Use correct size when reinitialising SVE state
    2f725420339e bnx2x: Fix enabling network interfaces without VFs
    66c88a479357 xen: reset legacy rtc flag for PV domU
    c7fab1f53603 btrfs: fix upper limit for max_inline for page size 64K
    b9cc70e3dcb4 drm/panfrost: Clamp lock region to Bifrost minimum
    9a6c88548935 drm/panfrost: Use u64 for size in lock_region
    6c635129bf49 drm/panfrost: Simplify lock_region calculation
    825ba38dfd6a drm/amdgpu: Fix BUG_ON assert
    d7a936da6389 drm/msi/mdp4: populate priv->kms in mdp4_kms_init
    90358cb02a6c net: dsa: lantiq_gswip: fix maximum frame length
    c1f12f440c0b lib/test_stackinit: Fix static initializer test
    3c232895b835 platform/chrome: cros_ec_proto: Send command again when timeout occurs
    0569920e4310 memcg: enable accounting for pids in nested pid namespaces
    d0ddb80bbf10 mm,vmscan: fix divide by zero in get_scan_count
    22b11dbbf94c mm/hugetlb: initialize hugetlb_usage in mm_init
    1dc6df795c9f s390/pv: fix the forcing of the swiotlb
    f3b57cf09012 cpufreq: powernv: Fix init_chip_info initialization in numa=off
    b5eb54c4a903 scsi: qla2xxx: Sync queue idx with queue_pair_map idx
    f499a9e9edde scsi: qla2xxx: Changes to support kdump kernel
    cfa459132875 scsi: BusLogic: Fix missing pr_cont() use
    a701ae9a0dd6 ovl: fix BUG_ON() in may_delete() when called from ovl_cleanup()
    1a2f728b034a parisc: fix crash with signals and alloca
    76bebc93e1c9 net: w5100: check return value after calling platform_get_resource()
    3179dd79dbcf fix array-index-out-of-bounds in taprio_change
    ef9a7867b25f net: fix NULL pointer reference in cipso_v4_doi_free
    88a4ed85e80f ath9k: fix sleeping in atomic context
    99b950d55e59 ath9k: fix OOB read ar9300_eeprom_restore_internal
    5f70ea4a5c84 parport: remove non-zero check on count
    c30ea33b03ff net/mlx5: DR, Enable QP retransmission
    c9095f788d03 iwlwifi: mvm: fix access to BSS elements
    f950996d64df iwlwifi: mvm: avoid static queue number aliasing
    2db5ae5b28e7 iwlwifi: mvm: fix a memory leak in iwl_mvm_mac_ctxt_beacon_changed
    3da13a1e2a45 drm/amdkfd: Account for SH/SE count when setting up cu masks.
    2af60889c88e ASoC: rockchip: i2s: Fixup config for DAIFMT_DSP_A/B
    98381f840f22 ASoC: rockchip: i2s: Fix regmap_ops hang
    a1c7bc02e192 usbip:vhci_hcd USB port can get stuck in the disabled state
    4f6095b0c9d5 usbip: give back URBs for unsent unlink requests during cleanup
    9a4a6805294f usb: musb: musb_dsps: request_irq() after initializing musb
    d24381e5a73b Revert "USB: xhci: fix U1/U2 handling for hardware with XHCI_INTEL_HOST quirk set"
    aa40cf19bfa9 cifs: fix wrong release in sess_alloc_buffer() failed path
    39111cbb7b7c mmc: core: Return correct emmc response in case of ioctl error
    26f55b60f22f selftests/bpf: Enlarge select() timeout for test_maps
    48f5a5f0276d mmc: rtsx_pci: Fix long reads when clock is prescaled
    4e773c5553b2 mmc: sdhci-of-arasan: Check return value of non-void funtions
    a73bbfabfe6f of: Don't allow __of_attached_node_sysfs() without CONFIG_SYSFS
    2fdf7d38ee86 ASoC: Intel: Skylake: Fix passing loadable flag for module
    f6ff4d5609ca ASoC: Intel: Skylake: Fix module configuration for KPB and MIXER
    736f60bd4883 btrfs: tree-log: check btrfs_lookup_data_extent return value
    53a72858bcae m68knommu: only set CONFIG_ISA_DMA_API for ColdFire sub-arch
    3710cff57d3c drm/exynos: Always initialize mapping in exynos_drm_register_dma()
    727c973ffe51 lockd: lockd server-side shouldn't set fl_ops
    a18cfd715e91 usb: chipidea: host: fix port index underflow and UBSAN complains
    8deedce385d2 gfs2: Don't call dlm after protocol is unmounted
    50cf8f1b6c39 staging: rts5208: Fix get_ms_information() heap buffer size
    8dfd785ae110 rpc: fix gss_svc_init cleanup on failure
    0bc818e0231a tcp: enable data-less, empty-cookie SYN with TFO_SERVER_COOKIE_NOT_REQD
    2918eca4970a serial: sh-sci: fix break handling for sysrq
    d02a1c5fd7d9 opp: Don't print an error if required-opps is missing
    d772d993b072 Bluetooth: Fix handling of LE Enhanced Connection Complete
    fb8593e8ed36 nvme-tcp: don't check blk_mq_tag_to_rq when receiving pdu data
    072660f6c688 arm64: dts: ls1046a: fix eeprom entries
    08825a784e56 arm64: tegra: Fix compatible string for Tegra132 CPUs
    a6b69a76c347 ARM: tegra: tamonten: Fix UART pad setting
    a66049c5ff74 mac80211: Fix monitor MTU limit so that A-MSDUs get through
    1e2842fb7ed3 drm/display: fix possible null-pointer dereference in dcn10_set_clock()
    cf82fe45bef9 gpu: drm: amd: amdgpu: amdgpu_i2c: fix possible uninitialized-variable access in amdgpu_i2c_router_select_ddc_port()
    bbaa21da550d net/mlx5: Fix variable type to match 64bit
    0d563020b8a3 Bluetooth: avoid circular locks in sco_sock_connect
    37d7ae2b0578 Bluetooth: schedule SCO timeouts with delayed_work
    c408efcb8ae6 selftests/bpf: Fix xdp_tx.c prog section name
    350e7501eee8 drm/msm: mdp4: drop vblank get/put from prepare/complete_commit
    e5450804778a net: ethernet: stmmac: Do not use unreachable() in ipq806x_gmac_probe()
    ed3400f22b58 arm64: dts: qcom: sdm660: use reg value for memory node
    52f8a30730ee ARM: dts: imx53-ppd: Fix ACHC entry
    e15afa6747fa media: tegra-cec: Handle errors of clk_prepare_enable()
    53d02b04098b media: TDA1997x: fix tda1997x_query_dv_timings() return value
    71de2779e52a media: v4l2-dv-timings.c: fix wrong condition in two for-loops
    d785cef384f1 media: imx258: Limit the max analogue gain to 480
    33bd83fe3ffd media: imx258: Rectify mismatch of VTS value
    8d179746b3f3 ASoC: Intel: bytcr_rt5640: Move "Platform Clock" routes to the maps for the matching in-/output
    37414bd6ec51 arm64: tegra: Fix Tegra194 PCIe EP compatible string
    5a24034ad87f bonding: 3ad: fix the concurrency between __bond_release_one() and bond_3ad_state_machine_handler()
    b6cee3583930 workqueue: Fix possible memory leaks in wq_numa_init()
    9b4f0170e03d Bluetooth: skip invalid hci_sync_conn_complete_evt
    7b1718666fb0 ata: sata_dwc_460ex: No need to call phy_exit() befre phy_init()
    76cbc142a546 samples: bpf: Fix tracex7 error raised on the missing argument
    917eb0bbb8d3 staging: ks7010: Fix the initialization of the 'sleep_status' structure
    44fd61a8bd0d serial: 8250_pci: make setup_port() parameters explicitly unsigned
    4beadefea857 hvsi: don't panic on tty_register_driver failure
    af0bd97b9d71 xtensa: ISS: don't panic in rs_init
    5418023f81cd serial: 8250: Define RX trigger levels for OxSemi 950 devices
    b050848bba7d s390: make PCI mio support a machine flag
    0dd8da8ad04b s390/jump_label: print real address in a case of a jump label bug
    91b4d44c7c4d flow_dissector: Fix out-of-bounds warnings
    8076709052e1 ipv4: ip_output.c: Fix out-of-bounds warning in ip_copy_addrs()
    faf0749c9062 video: fbdev: riva: Error out if 'pixclock' equals zero
    ae0d210aa717 video: fbdev: kyro: Error out if 'pixclock' equals zero
    98551f0a7b57 video: fbdev: asiliantfb: Error out if 'pixclock' equals zero
    9dff06c50572 bpf/tests: Do not PASS tests without actually testing the result
    58831317c9b1 bpf/tests: Fix copy-and-paste error in double word test
    a23430e79ef7 drm/amd/amdgpu: Update debugfs link_settings output link_rate field in hex
    9baa552b2f76 drm/amd/display: Fix timer_per_pixel unit error
    6c78ee1aecb9 tty: serial: jsm: hold port lock when reporting modem line changes
    7993ee173378 staging: board: Fix uninitialized spinlock when attaching genpd
    995567ded019 usb: gadget: composite: Allow bMaxPower=0 if self-powered
    44bbd4e6366f USB: EHCI: ehci-mv: improve error handling in mv_ehci_enable()
    7b96de5c3042 usb: gadget: u_ether: fix a potential null pointer dereference
    e1480bcb407e usb: host: fotg210: fix the actual_length of an iso packet
    33109bdf2c41 usb: host: fotg210: fix the endpoint's transactional opportunities calculation
    b190fdb93a9f igc: Check if num of q_vectors is smaller than max before array access
    f4bf2fdfe37b drm: avoid blocking in drm_clients_info's rcu section
    a1d12196c375 Smack: Fix wrong semantics in smk_access_entry()
    c454b1a2155c netlink: Deal with ESRCH error in nlmsg_notify()
    5adbbb27bb7c video: fbdev: kyro: fix a DoS bug by restricting user input
    4ee6cc0f52db ARM: dts: qcom: apq8064: correct clock names
    b9707a950492 iavf: fix locking of critical sections
    35429d3aa387 iavf: do not override the adapter state in the watchdog task
    ab03f15c1db4 iio: dac: ad5624r: Fix incorrect handling of an optional regulator.
    0de0c1673927 tipc: keep the skb in rcv queue until the whole data is read
    fe14f10c07c8 PCI: Use pci_update_current_state() in pci_enable_device_flags()
    7d356909744f crypto: mxs-dcp - Use sg_mapping_iter to copy data
    80bec14b4e09 media: dib8000: rewrite the init prbs logic
    4cab14bcff25 ASoC: atmel: ATMEL drivers don't need HAS_DMA
    4a7c6e9159be drm/amdgpu: Fix amdgpu_ras_eeprom_init()
    d766826eeec4 userfaultfd: prevent concurrent API initialization
    7bf2913a5bca kbuild: Fix 'no symbols' warning when CONFIG_TRIM_UNUSD_KSYMS=y
    0ac2ecb915e8 MIPS: Malta: fix alignment of the devicetree buffer
    debdff960034 f2fs: fix to unmap pages from userspace process in punch_hole()
    1c28c23dc82e f2fs: fix unexpected ENOENT comes from f2fs_map_blocks()
    1ca5b00782df f2fs: fix to account missing .skipped_gc_rwsem
    ec5cab379832 KVM: PPC: Fix clearing never mapped TCEs in realmode
    e46ce5a8aba5 clk: at91: clk-generated: Limit the requested rate to our range
    557f6445e37f clk: at91: clk-generated: pass the id of changeable parent at registration
    d93a37889e3a clk: at91: sam9x60: Don't use audio PLL
    57188e2cac47 fscache: Fix cookie key hashing
    e2e3758a2cf9 platform/x86: dell-smbios-wmi: Add missing kfree in error-exit from run_smbios_call
    ba5d4dc003b4 KVM: PPC: Book3S HV Nested: Reflect guest PMU in-use to L0 when guest SPRs are live
    a02309beb2b8 HID: i2c-hid: Fix Elan touchpad regression
    f934961bf4e2 scsi: target: avoid per-loop XCOPY buffer allocations
    389946024f0e powerpc/config: Renable MTD_PHYSMAP_OF
    db16408d52a8 scsi: qedf: Fix error codes in qedf_alloc_global_queues()
    5e56c8d843fa scsi: qedi: Fix error codes in qedi_alloc_global_queues()
    a90ef02f012a scsi: smartpqi: Fix an error code in pqi_get_raid_map()
    3365d41c0485 pinctrl: single: Fix error return code in pcs_parse_bits_in_pinctrl_entry()
    ef476b8d5a9c scsi: fdomain: Fix error return code in fdomain_probe()
    9ee7b45eddc4 SUNRPC: Fix potential memory corruption
    be09cbd6a35f dma-debug: fix debugfs initialization order
    9315497b1750 openrisc: don't printk() unconditionally
    f56ee9af23cc f2fs: reduce the scope of setting fsck tag when de->name_len is zero
    2a2afb6d26c6 f2fs: show f2fs instance in printk_ratelimited
    25ed0498915a RDMA/efa: Remove double QP type assignment
    b8bb4b28394a powerpc/stacktrace: Include linux/delay.h
    02889ac588bd vfio: Use config not menuconfig for VFIO_NOIOMMU
    b900cc481618 pinctrl: samsung: Fix pinctrl bank pin count
    e69c28362116 docs: Fix infiniband uverbs minor number
    fb42b9801e0a RDMA/iwcm: Release resources if iw_cm module initialization fails
    7930b1f98dd8 IB/hfi1: Adjust pkey entry in index 0
    2b1addd585a4 scsi: bsg: Remove support for SCSI_IOCTL_SEND_COMMAND
    a02982545e61 f2fs: quota: fix potential deadlock
    bd74d6de0b9e HID: input: do not report stylus battery state as "full"
    0656eb5e7ed8 PCI: aardvark: Fix masking and unmasking legacy INTx interrupts
    2b58db229eb6 PCI: aardvark: Increase polling delay to 1.5s while waiting for PIO response
    0f39f8429c82 PCI: aardvark: Fix checking for PIO status
    d810fa6f5f0f PCI: xilinx-nwl: Enable the clock through CCF
    d43ad02ad3a8 PCI: Return ~0 data on pciconfig_read() CAP_SYS_ADMIN failure
    3aa6d023c6d6 PCI: Restrict ASMedia ASM1062 SATA Max Payload Size Supported
    4d2bc69df9fa PCI/portdrv: Enable Bandwidth Notification only if port supports it
    0445da50b727 ARM: 9105/1: atags_to_fdt: don't warn about stack size
    8ec08f1431ce libata: add ATA_HORKAGE_NO_NCQ_TRIM for Samsung 860 and 870 SSDs
    7cfbf391e870 dmaengine: imx-sdma: remove duplicated sdma_load_context
    788122c99d85 Revert "dmaengine: imx-sdma: refine to load context only once"
    86e1abcd143f media: rc-loopback: return number of emitters rather than error
    9d91046f6b4e media: uvc: don't do DMA on stack
    1ccb1fa41f4c VMCI: fix NULL pointer dereference when unmapping queue pair
    80d167590330 dm crypt: Avoid percpu_counter spinlock contention in crypt_page_alloc()
    a6d4ac3f861b power: supply: max17042: handle fails of reading status register
    668370dd4c90 block: bfq: fix bfq_set_next_ioprio_data()
    cfdd25cd426d crypto: public_key: fix overflow during implicit conversion
    3411b481ed24 arm64: head: avoid over-mapping in map_memory
    991b64b89b66 soc: aspeed: p2a-ctrl: Fix boundary check for mmap
    2712f29c44f1 soc: aspeed: lpc-ctrl: Fix boundary check for mmap
    24c245de17ea soc: qcom: aoss: Fix the out of bound usage of cooling_devs
    603dbb1fa272 pinctrl: ingenic: Fix incorrect pull up/down info
    eda59ca42fde pinctrl: stmfx: Fix hazardous u8[] to unsigned long cast
    d4acec5e9454 tools/thermal/tmon: Add cross compiling support
    8a964aa6ed43 9p/xen: Fix end of loop tests for list_for_each_entry
    7d81fcc20316 include/linux/list.h: add a macro to test if entry is pointing to the head
    4bc0d1b535da xen: fix setting of max_pfn in shared_info
    27f3b7f5c6e0 powerpc/perf/hv-gpci: Fix counter value parsing
    7e9e6d0e07ec PCI/MSI: Skip masking MSI-X on Xen PV
    2edc06fa381a blk-zoned: allow BLKREPORTZONE without CAP_SYS_ADMIN
    8da22cc41ada blk-zoned: allow zone management send operations without CAP_SYS_ADMIN
    cd7b39e7c475 btrfs: reset replace target device to allocation state on close
    8554095328ac btrfs: wake up async_delalloc_pages waiters after submit
    d609c63a7165 rtc: tps65910: Correct driver module alias
    48a24510c328 Linux 5.4.147
    1f8ee024498d Revert "time: Handle negative seconds correctly in timespec64_to_ns()"
    dc15f641c6cc Revert "posix-cpu-timers: Force next expiration recalc after itimer reset"
    541e757944aa Revert "block: nbd: add sanity check for first_minor"
    5f3ecbf4d586 Revert "Bluetooth: Move shutdown callback before flushing tx and rx queue"
    245f15a48cdc Linux 5.4.146
    b40facee46db clk: kirkwood: Fix a clocking boot regression
    8810c51077b0 backlight: pwm_bl: Improve bootloader/kernel device handover
    5de2ee621bc4 fbmem: don't allow too huge resolutions
    4a95b04afab5 IMA: remove the dependency on CRYPTO_MD5
    c69935f0b0aa IMA: remove -Wmissing-prototypes warning
    85b0726d5bd7 fuse: flush extending writes
    8a98ced6e1c8 fuse: truncate pagecache on atomic_o_trunc
    06dad664d4ea KVM: nVMX: Unconditionally clear nested.pi_pending on nested VM-Enter
    1735cec1e83c KVM: x86: Update vCPU's hv_clock before back to guest when tsc_offset is adjusted
    20fff3ef33b2 KVM: s390: index kvm->arch.idle_mask by vcpu_idx
    0323ab5b254e x86/resctrl: Fix a maybe-uninitialized build warning treated as error
    51f4575ca182 perf/x86/amd/ibs: Extend PERF_PMU_CAP_NO_EXCLUDE to IBS Op
    03c3e977eeac tty: Fix data race between tiocsti() and flush_to_ldisc()
    7a25a0a94c8b time: Handle negative seconds correctly in timespec64_to_ns()
    ae968e270f2e bpf: Fix pointer arithmetic mask tightening under state pruning
    a0a4778feae1 bpf: verifier: Allocate idmap scratch in verifier env
    f5893af2704e bpf: Fix leakage due to insufficient speculative store bypass mitigation
    e80c3533c354 bpf: Introduce BPF nospec instruction for mitigating Spectre v4
    1c9424a765af ipv4: fix endianness issue in inet_rtm_getroute_build_skb()
    b3fe6d192126 octeontx2-af: Fix loop in free and unmap counter
    8216d7157bcf net: qualcomm: fix QCA7000 checksum handling
    4648917e499c net: sched: Fix qdisc_rate_table refcount leak when get tcf_block failed
    e46e23c289f6 ipv4: make exception cache less predictible
    f73cbdd1b8e7 ipv6: make exception cache less predictible
    aa167dcde4c7 brcmfmac: pcie: fix oops on failure to resume and reprobe
    5debec63a28f bcma: Fix memory leak for internally-handled cores
    574e563649ec ath6kl: wmi: fix an error code in ath6kl_wmi_sync_point()
    d946e685d6b7 ASoC: wcd9335: Disable irq on slave ports in the remove function
    f3ec07f832bb ASoC: wcd9335: Fix a memory leak in the error handling path of the probe function
    a6088f4ed3fc ASoC: wcd9335: Fix a double irq free in the remove function
    7bfa680f3b47 tty: serial: fsl_lpuart: fix the wrong mapbase value
    0f1375fa693b usb: bdc: Fix an error handling path in 'bdc_probe()' when no suitable DMA config is available
    06203abb7275 usb: ehci-orion: Handle errors of clk_prepare_enable() in probe
    a0a9ecca2dc4 i2c: mt65xx: fix IRQ check
    b444064a0e0e CIFS: Fix a potencially linear read overflow
    e37eeaf9506c bpf: Fix possible out of bound write in narrow load handling
    fb8e695e9cfa mmc: moxart: Fix issue with uninitialized dma_slave_config
    48b1f117e8d0 mmc: dw_mmc: Fix issue with uninitialized dma_slave_config
    57314d8414d1 ASoC: Intel: Skylake: Fix module resource and format selection
    92397571c243 ASoC: Intel: Skylake: Leave data as is when invoking TLV IPCs
    b58cf18e384d rsi: fix an error code in rsi_probe()
    d82fe3dd0b0f rsi: fix error code in rsi_load_9116_firmware()
    4be8deab6f0d i2c: s3c2410: fix IRQ check
    da3e5f32049a i2c: iop3xx: fix deferred probing
    2da3272ae0ea Bluetooth: add timeout sanity check to hci_inquiry
    70d71611eb83 mm/swap: consider max pages in iomap_swapfile_add_extent
    8f5e26053c46 usb: gadget: mv_u3d: request_irq() after initializing UDC
    eb3c6a25012f nfsd4: Fix forced-expiry locking
    81e69d3fdd9e lockd: Fix invalid lockowner cast after vfs_test_lock
    e1c02e2e6a7a mac80211: Fix insufficient headroom issue for AMSDU
    606668e24a0d usb: phy: tahvo: add IRQ check
    ecf18ac8ff76 usb: host: ohci-tmio: add IRQ check
    abbcd61d091f Bluetooth: Move shutdown callback before flushing tx and rx queue
    93ec1fd04f0f usb: gadget: udc: renesas_usb3: Fix soc_device_match() abuse
    30d9607bcd73 usb: phy: twl6030: add IRQ checks
    e1473ac28563 usb: phy: fsl-usb: add IRQ check
    9535f55d0cba usb: gadget: udc: at91: add IRQ check
    05e5b16b79dc drm/msm/dsi: Fix some reference counted resource leaks
    5ccb04c6e1fb Bluetooth: fix repeated calls to sco_sock_kill
    c2451d5439d0 counter: 104-quad-8: Return error when invalid mode during ceiling_write
    a1194b805c90 arm64: dts: exynos: correct GIC CPU interfaces address range on Exynos7
    1b6fcd10375a drm/msm/dpu: make dpu_hw_ctl_clear_all_blendstages clear necessary LMs
    156eaacba3d2 PM: EM: Increase energy calculation precision
    5537dc810b2a Bluetooth: increase BTNAMSIZ to 21 chars to fix potential buffer overflow
    c0faa638f016 debugfs: Return error during {full/open}_proxy_open() on rmmod
    f44714b4eb2a soc: qcom: smsm: Fix missed interrupts if state changes while masked
    e7997fe3e9ca PCI: PM: Enable PME if it can be signaled from D3cold
    9e570f3d4777 PCI: PM: Avoid forcing PCI_D0 for wakeup reasons inconsistently
    f865b316ccc6 media: venus: venc: Fix potential null pointer dereference on pointer fmt
    d2ea2f0725cc media: em28xx-input: fix refcount bug in em28xx_usb_disconnect
    ebf570042b5f leds: trigger: audio: Add an activate callback to ensure the initial brightness is set
    0a01dc77662c leds: lt3593: Put fwnode in any case during ->probe()
    e39c73563a38 i2c: highlander: add IRQ check
    fba783ddd945 net: cipso: fix warnings in netlbl_cipsov4_add_std
    9fdac650c413 cgroup/cpuset: Fix a partition bug with hotplug
    ffde05819953 net/mlx5e: Prohibit inner indir TIRs in IPoIB
    87f817c560e6 ARM: dts: meson8b: ec100: Fix the pwm regulator supply properties
    e55d7cbe1fe2 ARM: dts: meson8b: mxq: Fix the pwm regulator supply properties
    4b0bbc412b51 ARM: dts: meson8b: odroidc1: Fix the pwm regulator supply properties
    f7058060c01b ARM: dts: meson8: Use a higher default GPU clock frequency
    37ed461b52e9 tcp: seq_file: Avoid skipping sk during tcp_seek_last_pos
    952136275367 drm/amdgpu/acp: Make PM domain really work
    252fad3d0234 netns: protect netns ID lookups with RCU
    bd1cd32caa67 6lowpan: iphc: Fix an off-by-one check of array index
    c4895cf45fd5 Bluetooth: sco: prevent information leak in sco_conn_defer_accept()
    a96eb96ce4c1 media: coda: fix frame_mem_ctrl for YUV420 and YVU420 formats
    7163014d7d29 media: go7007: remove redundant initialization
    810149287981 media: dvb-usb: Fix error handling in dvb_usb_i2c_init
    fa8aaa769092 media: dvb-usb: fix uninit-value in vp702x_read_mac_addr
    88933f9c93a0 media: dvb-usb: fix uninit-value in dvb_usb_adapter_dvb_init
    f81c89614ee8 soc: qcom: rpmhpd: Use corner in power_off
    5b3987f58325 arm64: dts: renesas: r8a77995: draak: Remove bogus adv7511w properties
    6c106c73208a ARM: dts: aspeed-g6: Fix HVI3C function-group in pinctrl dtsi
    004778bf390a bpf: Fix potential memleak and UAF in the verifier.
    fa4802c54e69 bpf: Fix a typo of reuseport map in bpf.h.
    9a193caf9d79 media: cxd2880-spi: Fix an error handling path
    34106f526015 soc: rockchip: ROCKCHIP_GRF should not default to y, unconditionally
    b92893053003 media: TDA1997x: enable EDID support
    43282ca83ace drm/panfrost: Fix missing clk_disable_unprepare() on error in panfrost_clk_init()
    fc9cf2229087 EDAC/i10nm: Fix NVDIMM detection
    32d8a3684bba spi: spi-zynq-qspi: use wait_for_completion_timeout to make zynq_qspi_exec_mem_op not interruptible
    4206dbc9857b spi: sprd: Fix the wrong WDG_LOAD_VAL
    1f70517eac57 regulator: vctrl: Avoid lockdep warning in enable/disable ops
    d255d6a6457f regulator: vctrl: Use locked regulator_get_voltage in probe path
    013177ccc4c5 certs: Trigger creation of RSA module signing key if it's not an RSA key
    cc74533a47c9 crypto: qat - use proper type for vf_mask
    b3fa499d72a0 block: nbd: add sanity check for first_minor
    c60a31db3990 clocksource/drivers/sh_cmt: Fix wrong setting if don't request IRQ for clock source channel
    6b10d3d3a9ff lib/mpi: use kcalloc in mpi_resize
    57c8e2ea47bc genirq/timings: Fix error return code in irq_timings_test_irqs()
    2d00b22c8b81 spi: spi-pic32: Fix issue with uninitialized dma_slave_config
    b29593d0696d spi: spi-fsl-dspi: Fix issue with uninitialized dma_slave_config
    449884aeb358 sched: Fix UCLAMP_FLAG_IDLE setting
    67da2d9c9e99 m68k: emu: Fix invalid free in nfeth_cleanup()
    c68ba4a708fb s390/debug: fix debug area life cycle
    7a67a00ea8a7 s390/kasan: fix large PMD pages address alignment check
    98296eb3deca udf_get_extendedattr() had no boundary checks.
    ae4240d1f4bf fcntl: fix potential deadlock for &fasync_struct.fa_lock
    a6273c8c2aca crypto: qat - do not export adf_iov_putmsg()
    7dfa7bb69e13 crypto: qat - fix naming for init/shutdown VF to PF notifications
    843b4e713a80 crypto: qat - fix reuse of completion variable
    4a988264556c crypto: qat - handle both source of interrupt in VF ISR
    c2b3f81125a6 crypto: qat - do not ignore errors from enable_vf2pf_comms()
    1c189ccef0cf libata: fix ata_host_start()
    e55b627d6e1f s390/cio: add dev_busid sysfs entry for each subchannel
    0423517520d3 power: supply: max17042_battery: fix typo in MAx17042_TOFF
    eb45ae88bf10 nvmet: pass back cntlid on successful completion
    6cb5d6ae687d nvme-rdma: don't update queue count when failing to set io queues
    3073ec7f0642 nvme-tcp: don't update queue count when failing to set io queues
    93cf19b4d9b3 bcache: add proper error unwinding in bcache_device_init
    e55f20798f53 isofs: joliet: Fix iocharset=utf8 mount option
    0f5cd92e5eb5 udf: Fix iocharset=utf8 mount option
    86987cf0fbd2 udf: Check LVID earlier
    cc608af36e00 hrtimer: Ensure timerfd notification for HIGHRES=n
    a8457878307f hrtimer: Avoid double reprogramming in __hrtimer_start_range_ns()
    c322a963d522 posix-cpu-timers: Force next expiration recalc after itimer reset
    28996dbb8a74 rcu/tree: Handle VM stoppage in stall detection
    b7c560ae51c6 sched/deadline: Fix missing clock update in migrate_task_rq_dl()
    40db13e3efce crypto: omap-sham - clear dma flags only after omap_sham_update_dma_stop()
    ebf0f71ae3bd power: supply: axp288_fuel_gauge: Report register-address on readb / writeb errors
    bba2b82d1b48 sched/deadline: Fix reset_on_fork reporting of DL tasks
    53a6ef40c6bc crypto: mxs-dcp - Check for DMA mapping errors
    344a38789ab2 regmap: fix the offset of register error log
    a5e42516a61e locking/mutex: Fix HANDOFF condition
    a0f68fb55ebc Linux 5.4.145
    d83f0b39e72e PCI: Call Max Payload Size-related fixup quirks early
    0c8277e334da x86/reboot: Limit Dell Optiplex 990 quirk to early BIOS versions
    d31a4c35b925 xhci: fix unsafe memory usage in xhci tracing
    e00d39ca92bb usb: mtu3: fix the wrong HS mult value
    c3ffd3501470 usb: mtu3: use @mult for HS isoc or intr
    00b6325590a4 usb: host: xhci-rcar: Don't reload firmware after the completion
    7a74ae301c2c ALSA: usb-audio: Add registration quirk for JBL Quantum 800
    c1ea74f64209 Revert "btrfs: compression: don't try to compress if we don't have enough pages"
    f05c74e10463 x86/events/amd/iommu: Fix invalid Perf result due to IOMMU PMC power-gating
    b1ca1665e674 Revert "r8169: avoid link-up interrupt issue on RTL8106e if user enables ASPM"
    cf1222b877b0 mm/page_alloc: speed up the iteration of max_order
    17d409c83e76 net: ll_temac: Remove left-over debug message
    ccadb9143796 powerpc/boot: Delete unneeded .globl _zimage_start
    295501c77c4c ipv4/icmp: l3mdev: Perform icmp error route lookup on source device routing table (v2)
    6dec8e17b8db USB: serial: mos7720: improve OOM-handling in read_mos_reg()
    d84708451d90 igmp: Add ip_mc_list lock in ip_check_mc_rcu
    cd8ad6ed9ae5 media: stkwebcam: fix memory leak in stk_camera_probe
    9febc9153fdb ARC: wireup clone3 syscall
    417b11d3255c ALSA: pcm: fix divide error in snd_pcm_lib_ioctl
    cf28619cd9c6 ALSA: hda/realtek: Workaround for conflicting SSID on ASUS ROG Strix G17
    a8146f149028 ARM: 8918/2: only build return_address() if needed
    ebad44b6432e cryptoloop: add a deprecation warning
    d12526ddf5e3 perf/x86/amd/power: Assign pmu.module
    be1f76fceec4 perf/x86/amd/ibs: Work around erratum #1197
    861118d64e50 perf/x86/intel/pt: Fix mask of num_address_ranges
    40d23de514cd qede: Fix memset corruption
    468623f69683 net: macb: Add a NULL check on desc_ptp
    50f73f31ae63 qed: Fix the VF msix vectors flow
    92abb09f7ab7 reset: reset-zynqmp: Fixed the argument data type
    b820c4c651ea gpu: ipu-v3: Fix i.MX IPU-v3 offset calculations for (semi)planar U/V formats
    48051387fa80 xtensa: fix kconfig unmet dependency warning for HAVE_FUTEX_CMPXCHG
    56c77c1b5229 kthread: Fix PF_KTHREAD vs to_kthread() race
    af3cf928b998 ubifs: report correct st_size for encrypted symlinks
    aa4e216156e8 f2fs: report correct st_size for encrypted symlinks
    52d8e5b0abb9 ext4: report correct st_size for encrypted symlinks
    228a4203d8b6 fscrypt: add fscrypt_symlink_getattr() for computing st_size
    9b3849ba667a ext4: fix race writing to an inline_data file while its xattrs are changing

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 7589d8ee1a..4309554dd7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7f67141bca949eff8953f965c26475286d1a20cf"
-SRCREV_meta ?= "e4ccb53f204f722583178a9249fbf5d745f0d56a"
+SRCREV_machine ?= "4c265e0d0e3551dec36163b4e87fe1ce90bc3a40"
+SRCREV_meta ?= "6da37dca302efa8696e1164f14194af341c2808d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.144"
+LINUX_VERSION ?= "5.4.149"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 5ee1d359b2..3f8ce21024 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.144"
+LINUX_VERSION ?= "5.4.149"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "08336ce8b4ebc2b21c28488c85098c6816f3d99f"
-SRCREV_machine ?= "8220749d3e8643091b118d93a857333e2c91a1eb"
-SRCREV_meta ?= "e4ccb53f204f722583178a9249fbf5d745f0d56a"
+SRCREV_machine_qemuarm ?= "c0e6ebbecc2eba46d3d26b841519e518b93f8081"
+SRCREV_machine ?= "56ff0be143ef1eff47eb90eac6768e452700c070"
+SRCREV_meta ?= "6da37dca302efa8696e1164f14194af341c2808d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index b600211bde..e24c07b07c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "78a2f9d323a755a34cdc96af4bcf61ffd32a3db0"
-SRCREV_machine_qemuarm64 ?= "aa6ec6934e35c8b0948f6b7c9bdbdef45d72be35"
-SRCREV_machine_qemumips ?= "a892524441b30e5e8c491e22e36e3473fc6a0fe0"
-SRCREV_machine_qemuppc ?= "784ca7c7837811123b5bd97cde964e45fbf5179b"
-SRCREV_machine_qemuriscv64 ?= "e3134debcf01f0aa20103e22fe2ef5fc7c201120"
-SRCREV_machine_qemux86 ?= "e3134debcf01f0aa20103e22fe2ef5fc7c201120"
-SRCREV_machine_qemux86-64 ?= "e3134debcf01f0aa20103e22fe2ef5fc7c201120"
-SRCREV_machine_qemumips64 ?= "d765ea7455bf978a9a86e8e90e032336b0baf887"
-SRCREV_machine ?= "e3134debcf01f0aa20103e22fe2ef5fc7c201120"
-SRCREV_meta ?= "e4ccb53f204f722583178a9249fbf5d745f0d56a"
+SRCREV_machine_qemuarm ?= "02d9640a2cf032508b87ea5e8b021112e8327352"
+SRCREV_machine_qemuarm64 ?= "fb8d74b308e3ed71ee8a83794dfe13dff0f612bf"
+SRCREV_machine_qemumips ?= "42e53ea6e3bdb0dd3efeca6cb09310bce0d817d0"
+SRCREV_machine_qemuppc ?= "0aa4502926c02102c63f5a425dd31219eecf22b1"
+SRCREV_machine_qemuriscv64 ?= "328c6fa2267540825e756abd9d7eea8d55d6d3aa"
+SRCREV_machine_qemux86 ?= "328c6fa2267540825e756abd9d7eea8d55d6d3aa"
+SRCREV_machine_qemux86-64 ?= "328c6fa2267540825e756abd9d7eea8d55d6d3aa"
+SRCREV_machine_qemumips64 ?= "78bc22d494fdcbb71ecda4cb722a74feea923eb6"
+SRCREV_machine ?= "328c6fa2267540825e756abd9d7eea8d55d6d3aa"
+SRCREV_meta ?= "6da37dca302efa8696e1164f14194af341c2808d"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.144"
+LINUX_VERSION ?= "5.4.149"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.31.1


