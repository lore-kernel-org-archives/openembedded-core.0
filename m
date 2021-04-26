Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.927.1619398452808593695
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: i39UMXY3T8mR26XtPnetLIaKLC+TeJYZVt4ob1fINtMxFhRc27e7DNmSMu4CcaLYsaVTQ5wDRD
 HQYPX4m4nl1Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818053"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818053"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:12 -0700
IronPort-SDR: e7G781bFWD+KnIZq4RjhLEOJeuNckEdyxb1hPeKwPdT5yyYbHJmtcP10RquLIE3ilnBccEDQ4E
 4n8YquWWqh+A==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067252"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:05 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 08/64] linux-yocto/5.10: update to v5.10.27
Date: Mon, 26 Apr 2021 08:52:39 +0800
Message-Id: <7724de7ba3aee83efc1d01e13c3365634ec6eb3c.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    472493c8a425 Linux 5.10.27
    3a1ca9bd4f5a xen-blkback: don't leak persistent grants from xen_blkbk_map()
    03a1c3253f25 can: peak_usb: Revert "can: peak_usb: add forgotten supported devices"
    f12d05f70282 nvme: fix the nsid value to print in nvme_validate_or_alloc_ns
    36478a9ec5af Revert "net: bonding: fix error return code of bond_neigh_init()"
    451ba16cc5b7 Revert "xen: fix p2m size in dom0 for disabled memory hotplug case"
    df61d3cff422 fs/ext4: fix integer overflow in s_log_groups_per_flex
    0229b5926dc9 ext4: add reclaim checks to xattr code
    25e809bf8bec mac80211: fix double free in ibss_leave
    39e1a35ea65a net: dsa: b53: VLAN filtering is global to all users
    d3b5a04b8ce5 r8169: fix DMA being used after buffer free if WoL is enabled
    8dc08a2962c8 can: dev: Move device back to init netns on owning netns delete
    24256b4d87eb ch_ktls: fix enum-conversion warning
    6f15c02ebbe9 fs/cachefiles: Remove wait_bit_key layout dependency
    002ea848d7fd mm/memcg: fix 5.10 backport of splitting page memcg
    2c163520e12b x86/mem_encrypt: Correct physical address calculation in __set_clr_pte_enc()
    c6c9bc4f261d locking/mutex: Fix non debug version of mutex_lock_io_nested()
    d4ce2a8f465d cifs: Adjust key sizes and key generation routines for AES256 encryption
    86cc799e1d9d smb3: fix cached file size problems in duplicate extents (reflink)
    2423511cc5ba scsi: mpt3sas: Fix error return code of mpt3sas_base_attach()
    6b977fea78de scsi: qedi: Fix error return code of qedi_alloc_global_queues()
    62bb066cdfb6 scsi: Revert "qla2xxx: Make sure that aborted commands are freed"
    fc062d21c011 block: recalculate segment count for multi-segment discards correctly
    dcf2dfc1614d io_uring: fix provide_buffers sign extension
    efb334c4e5ff perf synthetic events: Avoid write of uninitialized memory when generating PERF_RECORD_MMAP* records
    5febe60a8021 perf auxtrace: Fix auxtrace queue conflict
    4a5891992c68 ACPI: scan: Use unique number for instance_no
    2ba9964a9653 ACPI: scan: Rearrange memory allocation in acpi_device_add()
    c33f918758fa Revert "netfilter: x_tables: Update remaining dereference to RCU"
    de2e6b4e32d6 mm/mmu_notifiers: ensure range_end() is paired with range_start()
    42aa210795d8 dm table: Fix zoned model check and zone sectors check
    3fdebc2d8e79 netfilter: x_tables: Use correct memory barriers.
    520be4d1af9c Revert "netfilter: x_tables: Switch synchronization to RCU"
    87771c9b09bb net: phy: broadcom: Fix RGMII delays for BCM50160 and BCM50610M
    485335a637c8 net: phy: broadcom: Set proper 1000BaseX/SGMII interface mode for BCM54616S
    837a3ae33459 net: phy: broadcom: Avoid forward for bcm54xx_config_clock_delay()
    9a5267264fc2 net: phy: introduce phydev->port
    c4934e65c8bc net: axienet: Fix probe error cleanup
    3e08fd4a8298 net: axienet: Properly handle PCS/PMA PHY for 1000BaseX mode
    d65e7d0c7449 igb: avoid premature Rx buffer reuse
    c7eb3e12f18f net, bpf: Fix ip6ip6 crash with collect_md populated skbs
    0a245acbce89 net: Consolidate common blackhole dst ops
    33cd5f88b5bf bpf: Don't do bpf_cgroup_storage_set() for kuprobe/tp programs
    d95696f537d6 RDMA/cxgb4: Fix adapter LE hash errors while destroying ipv6 listening server
    b740e58324c8 xen/x86: make XEN_BALLOON_MEMORY_HOTPLUG_LIMIT depend on MEMORY_HOTPLUG
    889c56ea941e octeontx2-af: Fix memory leak of object buf
    558454ec5170 net: bridge: don't notify switchdev for local FDB addresses
    7d019b2d0f27 PM: EM: postpone creating the debugfs dir till fs_initcall
    08a5f812ad6c net/mlx5e: Fix error path for ethtool set-priv-flag
    624f0dc8f7f4 net/mlx5e: Offload tuple rewrite for non-CT flows
    c83207bb02d6 net/mlx5e: Allow to match on MPLS parameters only for MPLS over UDP
    0be13d01473a net/mlx5: Add back multicast stats for uplink representor
    65c021e73590 PM: runtime: Defer suspending suppliers
    3db5fc556515 arm64: kdump: update ppos when reading elfcorehdr
    447a011bb40d drm/msm: Fix suspend/resume on i.MX5
    c7552dee62a0 drm/msm: fix shutdown hook in case GPU components failed to bind
    0b7bc92c1986 can: isotp: tx-path: zero initialize outgoing CAN frames
    ccd5565feea3 bpf: Fix umd memory leak in copy_process()
    eeadce8811d3 libbpf: Fix BTF dump of pointer-to-array-of-struct
    7693b64ae508 selftests: forwarding: vxlan_bridge_1d: Fix vxlan ecn decapsulate value
    5ebb9947b488 selinux: vsock: Set SID for socket returned by accept()
    1e01729999c0 net: stmmac: dwmac-sun8i: Provide TX and RX fifo sizes
    961d9a6e47b9 r8152: limit the RX buffer size of RTL8153A for USB 2.0
    2330d46db081 igb: check timestamp validity
    421e0d731070 net: cdc-phonet: fix data-interface release on probe failure
    943e1583bf8a net: check all name nodes in __dev_alloc_name
    748a158359d7 octeontx2-af: fix infinite loop in unmapping NPC counter
    b553f45c76ec octeontx2-pf: Clear RSS enable flag on interace down
    11e94cfa9dd8 octeontx2-af: Fix irq free in rvu teardown
    da517ca38dc6 octeontx2-af: Remove TOS field from MKEX TX
    1055796ca031 octeontx2-af: Modify default KEX profile to extract TX packet fields
    f896ae2886d1 octeontx2-af: Formatting debugfs entry rsrc_alloc.
    5f64c4c550c8 ipv6: weaken the v4mapped source check
    9e48a3bc8ba2 ARM: dts: imx6ull: fix ubi filesystem mount failed
    b4c574e4b471 libbpf: Use SOCK_CLOEXEC when opening the netlink socket
    86e525bc04f2 libbpf: Fix error path in bpf_object__elf_init()
    4280132339ce netfilter: flowtable: Make sure GC works periodically in idle system
    186d8dc40a65 netfilter: nftables: allow to update flowtable flags
    4a741b4df032 netfilter: nftables: report EOPNOTSUPP on unsupported flowtable flags
    a96a8cb0500a net/sched: cls_flower: fix only mask bit check in the validate_ct_state
    6233c2d09633 ionic: linearize tso skb with too many frags
    7637048707e5 drm/msm/dsi: fix check-before-set in the 7nm dsi_pll code
    126aa8f23424 ftrace: Fix modify_ftrace_direct.
    29b8834cf828 nfp: flower: fix pre_tun mask id allocation
    47dae14b21f7 nfp: flower: add ipv6 bit to pre_tunnel control message
    259b0122dea5 nfp: flower: fix unsupported pre_tunnel flows
    aeff815e76ef selftests/net: fix warnings on reuseaddr_ports_exhausted
    bd63bd78d303 mac80211: Allow HE operation to be longer than expected.
    f865127b1d26 mac80211: fix rate mask reset
    48d0b548b49e can: m_can: m_can_rx_peripheral(): fix RX being blocked by errors
    afaca48e3017 can: m_can: m_can_do_rx_poll(): fix extraneous msg loss warning
    4fcf59c24990 can: c_can: move runtime PM enable/disable to c_can_platform
    524320e8034a can: c_can_pci: c_can_pci_remove(): fix use-after-free
    f9a5974b9719 can: kvaser_pciefd: Always disable bus load reporting
    af3e6c3dcf54 can: flexcan: flexcan_chip_freeze(): fix chip freeze for missing bitrate
    0cbadc0fb54c can: peak_usb: add forgotten supported devices
    3b3d9279be6c can: isotp: TX-path: ensure that CAN frame flags are initialized
    f88517dae95b can: isotp: isotp_setsockopt(): only allow to set low level TX flags for CAN-FD
    63f2a9bd3133 tcp: relookup sock for RST+ACK packets handled by obsolete req sock
    50f41f2e29ff tipc: better validate user input in tipc_nl_retrieve_key()
    ddeba5b39cca net: phylink: Fix phylink_err() function name error in phylink_major_config
    375f5169f231 net: hdlc_x25: Prevent racing between "x25_close" and "x25_xmit"/"x25_rx"
    ee39ee5f437c netfilter: ctnetlink: fix dump of the expect mask attribute
    d5380ceede6f selftests/bpf: Set gopt opt_class to 0 if get tunnel opt failed
    33cc382c5830 flow_dissector: fix byteorder of dissected ICMP ID
    fce6fb902189 net: qrtr: fix a kernel-infoleak in qrtr_recvmsg()
    6d3635ed12e7 net: ipa: terminate message handler arrays
    1701bd22b05d clk: qcom: gcc-sc7180: Use floor ops for the correct sdcc1 clk
    b50c46ef67d6 ftgmac100: Restart MAC HW once
    e64a5a5b8e93 net: phy: broadcom: Add power down exit reset state delay
    87378c850fee net/qlcnic: Fix a use after free in qlcnic_83xx_get_minidump_template
    648b62f10cec e1000e: Fix error handling in e1000_set_d0_lplu_state_82571
    8ed431fec355 e1000e: add rtnl_lock() to e1000_reset_task
    5994a096570f igc: Fix igc_ptp_rx_pktstamp()
    0963fadcf536 igc: Fix Supported Pause Frame Link Setting
    d5330d5cc3ad igc: Fix Pause Frame Advertising
    d85ffade499a igc: reinit_locked() should be called with rtnl_lock
    4c91fc60e3f6 net: dsa: bcm_sf2: Qualify phydev->dev_flags based on port
    f64270027928 net: sched: validate stab values
    400199d6e6f6 macvlan: macvlan_count_rx() needs to be aware of preemption
    2514c7ad115e drop_monitor: Perform cleanup upon probe registration failure
    7f041ee8effd ipv6: fix suspecious RCU usage warning
    61219de46413 net/mlx5e: Don't match on Geneve options in case option masks are all zero
    d0be25fa4f96 net/mlx5e: When changing XDP program without reset, take refs for XSK RQs
    60b5ff15b41d net/mlx5e: RX, Mind the MPWQE gaps when calculating offsets
    9857de932b30 libbpf: Fix INSTALL flag order
    f7c3d7615e6c bpf: Change inode_storage's lookup_elem return value from NULL to -EBADF
    926cde9eec67 veth: Store queue_mapping independently of XDP prog presence
    f47a9b2570ad soc: ti: omap-prm: Fix occasional abort on reset deassert for dra7 iva
    1f798907b435 ARM: OMAP2+: Fix smartreflex init regression after dropping legacy data
    965e6cb8d4c9 bus: omap_l3_noc: mark l3 irqs as IRQF_NO_THREAD
    921aae17bb0f dm ioctl: fix out of bounds array access when no devices
    d8b36c483d47 dm verity: fix DM_VERITY_OPTS_MAX value
    1e2d70d08ade drm/i915: Fix the GT fence revocation runtime PM logic
    da6a9b5b1799 drm/amdgpu: Add additional Sienna Cichlid PCI ID
    dc28098f40b4 drm/amdgpu/display: restore AUX_DPHY_TX_CONTROL for DCN2.x
    e02f765fa784 drm/amd/pm: workaround for audio noise issue
    f771b2b3eb2f drm/etnaviv: Use FOLL_FORCE for userptr
    546f7fcc451c integrity: double check iint_cache was initialized
    5f7b515df003 ARM: dts: at91-sama5d27_som1: fix phy address to 7
    2a0d35962ff1 ARM: dts: at91: sam9x60: fix mux-mask to match product's datasheet
    0b6cd8802d32 ARM: dts: at91: sam9x60: fix mux-mask for PA7 so it can be set to A, B and C
    1c103f512251 arm64: dts: ls1043a: mark crypto engine dma coherent
    4f35b64ba823 arm64: dts: ls1012a: mark crypto engine dma coherent
    3883f335b5ee arm64: dts: ls1046a: mark crypto engine dma coherent
    1ced45535d4b arm64: stacktrace: don't trace arch_stack_walk()
    53d3c8063590 ACPICA: Always create namespace nodes using acpi_ns_create_node()
    36fe73bd0af9 ACPI: video: Add missing callback back for Sony VPCEH3U1E
    1f5c9efad9fe gcov: fix clang-11+ support
    6e63cc1fe253 kasan: fix per-page tags for non-page_alloc pages
    fe03ccc3ce90 hugetlb_cgroup: fix imbalanced css_get and css_put pair for shared mappings
    269042e8ffed squashfs: fix xattr id and id lookup sanity checks
    61d72c5952c4 squashfs: fix inode lookup sanity checks
    1d215fcbc4ef z3fold: prevent reclaim/free race for headless pages
    e4642090734e psample: Fix user API breakage
    a4be7e4ed5d9 platform/x86: intel-vbtn: Stop reporting SW_DOCK events
    4f67d3e8c0ac netsec: restore phy power state after controller reset
    19c9967e495e selinux: fix variable scope issue in live sidtab conversion
    9731e08a3381 selinux: don't log MAC_POLICY_LOAD record on failed policy load
    3b87d0c5834b btrfs: fix sleep while in non-sleep context during qgroup removal
    771dfb3c531d KVM: x86: Protect userspace MSR filter with SRCU, and set atomically-ish
    394e4fd67946 static_call: Fix static_call_set_init()
    0fefb5f3e574 static_call: Fix the module key fixup
    a63068e93917 static_call: Allow module use without exposing static_call_key
    433cd7ca386c static_call: Pull some static_call declarations to the type headers
    533c293f737c ia64: fix ptrace(PTRACE_SYSCALL_INFO_EXIT) sign
    d76e207991c4 ia64: fix ia64_syscall_get_set_arguments() for break-based syscalls
    7077d5e7f074 mm/fork: clear PASID for new mm
    07feac84efc6 block: Suppress uevent for hidden device when removed
    9f704608010b nfs: we don't support removing system.nfs4_acl
    3dab008e23bd nvme-pci: add the DISABLE_WRITE_ZEROES quirk for a Samsung PM1725a
    8f0534c96ac8 nvme-rdma: Fix a use after free in nvmet_rdma_write_data_done
    c7b3f6db97c2 nvme-core: check ctrl css before setting up zns
    9083dc773d67 nvme-fc: return NVME_SC_HOST_ABORTED_CMD when a command has been aborted
    4d6aea29a795 nvme-fc: set NVME_REQ_CANCELLED in nvme_fc_terminate_exchange()
    7e62a89b51dd nvme: add NVME_REQ_CANCELLED flag in nvme_cancel_request()
    d8b17df7bf80 nvme: simplify error logic in nvme_validate_ns()
    b91230a0013f drm/radeon: fix AGP dependency
    35d4f0712828 drm/amdgpu: fb BO should be ttm_bo_type_device
    a255d14eb5dc drm/amd/display: Revert dram_clock_change_latency for DCN2.1
    d27b0964ade9 block: Fix REQ_OP_ZONE_RESET_ALL handling
    c9d1f6ad1e25 regulator: qcom-rpmh: Correct the pmic5_hfsmps515 buck
    6366a5bb888b kselftest: arm64: Fix exit code of sve-ptrace
    da5bc0c21c04 u64_stats,lockdep: Fix u64_stats_init() vs lockdep
    f89338395545 staging: rtl8192e: fix kconfig dependency on CRYPTO
    eb4154fb61e2 habanalabs: Call put_pid() when releasing control device
    f2b38f03a3f7 sparc64: Fix opcode filtering in handling of no fault loads
    58b34195b33f umem: fix error return code in mm_pci_probe()
    feaa91193ad3 kbuild: dummy-tools: fix inverted tests for gcc
    ede8be3ae078 kbuild: add image_name to no-sync-config-targets
    264bb27b9fe4 irqchip/ingenic: Add support for the JZ4760
    b684c380f0b9 cifs: change noisy error message to FYI
    758bca385a79 atm: idt77252: fix null-ptr-dereference
    f35954a3961b atm: uPD98402: fix incorrect allocation
    852143ed96e2 net: enetc: set MAC RX FIFO to recommended value
    697082b125b0 net: davicom: Use platform_get_irq_optional()
    e6946ef43848 net: wan: fix error return code of uhdlc_init()
    184dc037575c net: hisilicon: hns: fix error return code of hns_nic_clear_all_rx_fetch()
    9d1a5392aca1 NFS: Correct size calculation for create reply length
    2479c6b9ef36 nfs: fix PNFS_FLEXFILE_LAYOUT Kconfig default
    b48779c863c0 gpiolib: acpi: Add missing IRQF_ONESHOT
    9443aef16fca cpufreq: blacklist Arm Vexpress platforms in cpufreq-dt-platdev
    6d7dce3bdfc4 gfs2: fix use-after-free in trans_drain
    419ebba40dbf cifs: ask for more credit on async read/write code paths
    b8bfda6e08b8 gianfar: fix jumbo packets+napi+rx overrun crash
    2d0fba5a2e9f sun/niu: fix wrong RXMAC_BC_FRM_CNT_COUNT count
    81b1a8f14436 net: intel: iavf: fix error return code of iavf_init_get_resources()
    5f86016bdfa7 net: tehuti: fix error return code in bdx_probe()
    71b996c9b883 blk-cgroup: Fix the recursive blkg rwstat
    b171748b7953 scsi: ufs: ufs-qcom: Disable interrupt in reset path
    028210541b3c ixgbe: Fix memleak in ixgbe_configure_clsu32
    4dc123500c3b ALSA: hda: ignore invalid NHLT table
    18f27fc6bcc2 Revert "r8152: adjust the settings about MAC clock speed down for RTL8153"
    f8f6190094a3 atm: lanai: dont run lanai_dev_close if not open
    6f6e45947572 atm: eni: dont release is never initialized
    75e967a04d37 powerpc/4xx: Fix build errors from mfdcr()
    4a104e4d4d9d net: fec: ptp: avoid register access when ipg clock is disabled
    50c75680bdce net: stmmac: fix dma physical address of descriptor when display ring
    a9daba140178 mt76: fix tx skb error handling in mt76_dma_tx_queue_skb
    efb12c03fcd0 mm/memcg: set memcg when splitting page
    6143a1d193e9 mm/memcg: rename mem_cgroup_split_huge_fixup to split_page_memcg and add nr_pages argument
    856cd02bbdd4 Linux 5.10.26
    de1126ea44bb cifs: Fix preauth hash corruption
    21536d7b7e6f x86/apic/of: Fix CPU devicetree-node lookups
    95247d24c4d4 genirq: Disable interrupts for force threaded handlers
    80b2787789af firmware/efi: Fix a use after bug in efi_mem_reserve_persistent
    47ba0d4d2afb efi: use 32-bit alignment for efi_guid_t literals
    e5154ea8e48f static_call: Fix static_call_update() sanity check
    51ccdd25d7e5 MAINTAINERS: move the staging subsystem to lists.linux.dev
    4c9a74798ef1 MAINTAINERS: move some real subsystems off of the staging mailing list
    35ecf664fd6c ext4: fix rename whiteout with fast commit
    e8fa569465e5 ext4: fix potential error in ext4_do_update_inode
    6163a0662b79 ext4: do not try to set xattr into ea_inode if value is empty
    d130b802f98a ext4: stop inode update before return
    258db8e6ffdc ext4: find old entry again if failed to rename whiteout
    9689ecadf8a7 ext4: fix error handling in ext4_end_enable_verity()
    e4ea2a28d068 efivars: respect EFI_UNSUPPORTED return from firmware
    a548acde9608 x86: Introduce TS_COMPAT_RESTART to fix get_nr_restart_syscall()
    97c608959c27 x86: Move TS_COMPAT back to asm/thread_info.h
    4523e648b7b7 kernel, fs: Introduce and use set_restart_fn() and arch_set_restart_data()
    0e245256e34d x86/ioapic: Ignore IRQ2 again
    4fdf5f4ba61f perf/x86/intel: Fix unchecked MSR access error caused by VLBR_EVENT
    514ea597be8e perf/x86/intel: Fix a crash caused by zero PEBS status
    be1f58e58f76 PCI: rpadlpar: Fix potential drc_name corruption in store functions
    6d4e1fed18d0 counter: stm32-timer-cnt: fix ceiling miss-alignment with reload register
    cbc4c42dbec0 counter: stm32-timer-cnt: fix ceiling write max value
    dcdde25844d4 iio: hid-sensor-temperature: Fix issues of timestamp channel
    7de97c4bba51 iio: hid-sensor-prox: Fix scale not correct issue
    fd8efe16d867 iio: hid-sensor-humidity: Fix alignment issue of timestamp channel
    b477c121a287 iio: adc: adi-axi-adc: add proper Kconfig dependencies
    d894acab2844 iio: adc: ad7949: fix wrong ADC result due to incorrect bit mask
    533ee1e28455 iio: adc: ab8500-gpadc: Fix off by 10 to 3
    f8bfbd3917fa iio: gyro: mpu3050: Fix error handling in mpu3050_trigger_handler
    06c281c23ace iio: adis16400: Fix an error code in adis16400_initial_setup()
    531231485844 iio:adc:qcom-spmi-vadc: add default scale to LR_MUX2_BAT_ID channel
    3ce2e7b2d360 iio:adc:stm32-adc: Add HAS_IOMEM dependency
    6c3c90058b95 thunderbolt: Increase runtime PM reference count on DP tunnel discovery
    f4ca082e3f59 thunderbolt: Initialize HopID IDAs in tb_switch_alloc()
    c7bb96a37dd2 usb: dwc3: gadget: Prevent EP queuing while stopping transfers
    395d273f2998 usb: dwc3: gadget: Allow runtime suspend if UDC unbinded
    8b8a84234c38 usb: typec: tcpm: Invoke power_supply_changed for tcpm-source-psy-
    0ea3fb15a87e usb: typec: Remove vdo[3] part of tps6598x_rx_identity_reg struct
    0f882bcc6407 usb: gadget: configfs: Fix KASAN use-after-free
    22e85a6a35cc usbip: Fix incorrect double assignment to udc->ud.tcp_rx
    7046e5f7a2f6 usb-storage: Add quirk to defeat Kindle's automatic unload
    5a62d6d7afa0 powerpc: Force inlining of cpu_has_feature() to avoid build failure
    2bdef2b476e2 gfs2: bypass signal_our_withdraw if no journal
    a602e830ddaf gfs2: move freeze glock outside the make_fs_rw and _ro functions
    49787b1bba1f gfs2: Add common helper for holding and releasing the freeze glock
    db37238f3452 regulator: pca9450: Clear PRESET_EN bit to fix BUCK1/2/3 voltage setting
    cfbff8bd9efc regulator: pca9450: Enable system reset on WDOG_B assertion
    775691b94ce7 regulator: pca9450: Add SD_VSEL GPIO for LDO5
    9392b8219b62 net: bonding: fix error return code of bond_neigh_init()
    76f496681d6a io_uring: clear IOCB_WAITQ for non -EIOCBQUEUED return
    3c08f772ad0d io_uring: don't attempt IO reissue from the ring exit path
    40345b9c9d90 drm/amd/pm: fulfill the Polaris implementation for get_clock_by_type_with_latency()
    e8e99acd0830 s390/qeth: schedule TX NAPI on QAOB completion
    f3f6765fd0e8 ibmvnic: remove excessive irqsave
    96823c1e9997 media: cedrus: h264: Support profile controls
    1c20e9040f49 io_uring: fix inconsistent lock state
    e1a69079edc4 iwlwifi: Add a new card for MA family
    e7f6ebde21cf drm/amd/display: turn DPMS off on connector unplug
    559b842a64ff MIPS: compressed: fix build with enabled UBSAN
    8545519b1f51 net: phy: micrel: set soft_reset callback to genphy_soft_reset for KSZ8081
    33cafc7952a4 i40e: Fix endianness conversions
    41d4c889b274 powerpc/sstep: Fix darn emulation
    8a335142f1c5 powerpc/sstep: Fix load-store and update emulation
    8b4a797e86a0 RDMA/mlx5: Allow creating all QPs even when non RDMA profile is used
    bb38c1c03384 scsi: isci: Pass gfp_t flags in isci_port_bc_change_received()
    d74238028a11 scsi: isci: Pass gfp_t flags in isci_port_link_up()
    d9f5efd1afc4 scsi: isci: Pass gfp_t flags in isci_port_link_down()
    1eda358e37e5 scsi: mvsas: Pass gfp_t flags to libsas event notifiers
    58bdc321beb5 scsi: libsas: Introduce a _gfp() variant of event notifiers
    18c3c04e8e53 scsi: libsas: Remove notifier indirection
    29c5b80327b7 scsi: pm8001: Neaten debug logging macros and uses
    c4186c00adc1 scsi: pm80xx: Fix pm8001_mpi_get_nvmd_resp() race condition
    3e4b3770744d scsi: pm80xx: Make running_req atomic
    6075c84a98ce scsi: pm80xx: Make mpi_build_cmd locking consistent
    d802672c7f00 module: harden ELF info handling
    e2c8978a75e0 module: avoid *goto*s in module_sig_check()
    8587715b65fa module: merge repetitive strings in module_sig_check()
    c02a33f0fd28 RDMA/rtrs: Fix KASAN: stack-out-of-bounds bug
    904a52dd9e50 RDMA/rtrs: Introduce rtrs_post_send
    9e97c211b701 RDMA/rtrs-srv: Jump to dereg_mr label if allocate iu fails
    5abee8b1fc4f RDMA/rtrs: Remove unnecessary argument dir of rtrs_iu_free
    4ebd8f0c82a5 bpf: Declare __bpf_free_used_maps() unconditionally
    0e44f1e18398 serial: stm32: fix DMA initialization error handling
    5f8659adf7a2 tty: serial: stm32-usart: Remove set but unused 'cookie' variables
    20c0bd2b6579 ibmvnic: serialize access to work queue on remove
    f8ba6913c40a ibmvnic: add some debugs
    b4be6e6e2696 nvme-rdma: fix possible hang when failing to set io queues
    b3901ceb120d gpiolib: Assign fwnode to parent's if no primary one provided
    c5fe922eaf1a counter: stm32-timer-cnt: Report count function when SLAVE_MODE_DISABLED
    f854abe46b0e RISC-V: correct enum sbi_ext_rfence_fid
    359d8ff40a09 scsi: ufs: ufs-mediatek: Correct operator & -> &&
    38089ba4b20c scsi: myrs: Fix a double free in myrs_cleanup()
    eb9d08b34351 scsi: lpfc: Fix some error codes in debugfs
    e95c0d43509c riscv: Correct SPARSEMEM configuration
    04eb2b2fa12f cifs: fix allocation size on newly created files
    bb2e41e65c33 kbuild: Fix <linux/version.h> for empty SUBLEVEL or PATCHLEVEL again
    72714560fbc7 net/qrtr: fix __netdev_alloc_skb call
    6cae8095490c io_uring: ensure that SQPOLL thread is started for exit
    a7acb614287b pstore: Fix warning in pstore_kill_sb()
    5f7d470696ad i915/perf: Start hrtimer only if sampling the OA buffer
    cb14e99e886f sunrpc: fix refcount leak for rpc auth modules
    2ea2d3a79800 vhost_vdpa: fix the missing irq_bypass_unregister_producer() invocation
    3e5a1bb6ea20 vfio: IOMMU_API should be selected
    c2219627091c svcrdma: disable timeouts on rdma backchannel
    982b899ba672 NFSD: fix dest to src mount in inter-server COPY
    800369d61add NFSD: Repair misuse of sv_lock in 5.10.16-rt30.
    12628e7779f8 nfsd: don't abort copies early
    5ea0aa29ad4b nfsd: Don't keep looking up unhashed files in the nfsd file cache
    628f39a57a46 nvmet: don't check iosqes,iocqes for discovery controllers
    b4f911e3a982 nvme-tcp: fix a NULL deref when receiving a 0-length r2t PDU
    7089cdfce32f nvme-tcp: fix possible hang when failing to set io queues
    a83e5c6c35fa nvme-tcp: fix misuse of __smp_processor_id with preemption enabled
    fd9e2b999740 nvme: fix Write Zeroes limitations
    2d202085d2dd ALSA: usb-audio: Fix unintentional sign extension issue
    64195f022ae8 afs: Stop listxattr() from listing "afs.*" attributes
    78ba4793b084 afs: Fix accessing YFS xattrs on a non-YFS server
    07fa872bf79c ASoC: simple-card-utils: Do not handle device clock
    d1ab87e31761 ASoC: qcom: lpass-cpu: Fix lpass dai ids parse
    1ae54de79fba ASoC: codecs: wcd934x: add a sanity check in set channel map
    03079a0f1bf7 ASoC: qcom: sdm845: Fix array out of range on rx slim channels
    26b08c08a5f3 ASoC: qcom: sdm845: Fix array out of bounds access
    47a6cadb6cfd ASoC: SOF: intel: fix wrong poll bits in dsp power down
    b94b71a7a6f6 ASoC: SOF: Intel: unregister DMIC device on probe error
    4da5a9a73c4c ASoC: Intel: bytcr_rt5640: Fix HP Pavilion x2 10-p0XX OVCD current threshold
    118cfdc770cd ASoC: fsl_ssi: Fix TDM slot setup for I2S mode
    223dc51caa51 drm/amd/display: Correct algorithm for reversed gamma
    4daa70a80c68 vhost-vdpa: set v->config_ctx to NULL if eventfd_ctx_fdget() fails
    49ca3100fbaf vhost-vdpa: fix use-after-free of v->config_ctx
    2c8d6a9474f0 btrfs: fix slab cache flags for free space tree bitmap
    38ffe9eaeb7c btrfs: fix race when cloning extent buffer during rewind of an old root
    78486cf1f31e zonefs: fix to update .i_wr_refcnt correctly in zonefs_open_zone()
    9c1c5e81a002 zonefs: prevent use of seq files as swap file
    dfbdbf0f359a zonefs: Fix O_APPEND async write handling
    38c74f2f2318 s390/pci: fix leak of PCI device structure
    075e3034740c s390/pci: remove superfluous zdev->zbus check
    bd37d9b9c4fb s390/pci: refactor zpci_create_device()
    015916ca0266 s390/vtime: fix increased steal time accounting
    5c0a3a331dc5 Revert "PM: runtime: Update device status before letting suppliers suspend"
    68525e424175 ALSA: hda/realtek: fix mute/micmute LEDs for HP 850 G8
    f086deab2c64 ALSA: hda/realtek: fix mute/micmute LEDs for HP 440 G8
    7b00df1894c6 ALSA: hda/realtek: fix mute/micmute LEDs for HP 840 G8
    14af4bf8d481 ALSA: hda/realtek: Apply headset-mic quirks for Xiaomi Redmibook Air
    4c698a3b8fb7 ALSA: hda: generic: Fix the micmute led init state
    e6c7cdf0baf3 ALSA: hda/realtek: apply pin quirk for XiaomiNotebook Pro
    cd7b17ba8e4d ALSA: dice: fix null pointer dereference when node is disconnected
    422806f8d289 spi: cadence: set cqspi to the driver_data field of struct device
    f8d5ced57b07 ASoC: ak5558: Add MODULE_DEVICE_TABLE
    064a7289b445 ASoC: ak4458: Add MODULE_DEVICE_TABLE

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cbb5c4392c63f896f204c0c15b0cfa7a364feed2)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index cb34887cda..3e08b5aec5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "be2935bce35f9adb6d0e735d42651e81a5094adf"
-SRCREV_meta ?= "031f6c76e488a3563f35258c72ff1de3e25a512e"
+SRCREV_machine ?= "8262073e1b09920fb55a32d698c3a98c3af628eb"
+SRCREV_meta ?= "bbff9c3b4b30e741730c2ceb2365ab18639c246a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.25"
+LINUX_VERSION ?= "5.10.27"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 83e59b0ebb..92c15e9b5b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.25"
+LINUX_VERSION ?= "5.10.27"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "0f87ec9fea7a5695cd063d9d11d89751efa53ddd"
-SRCREV_machine ?= "cf5b0320cf4544d3db9ce3ddd6ddb7553a610651"
-SRCREV_meta ?= "031f6c76e488a3563f35258c72ff1de3e25a512e"
+SRCREV_machine_qemuarm ?= "2825075bb360f256c3a9dcdf3cf67b34423d657d"
+SRCREV_machine ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
+SRCREV_meta ?= "bbff9c3b4b30e741730c2ceb2365ab18639c246a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 026e69511a..f89f513878 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d8551cae1ccdbe062a5c6068ce39ea8f4e1c72db"
-SRCREV_machine_qemuarm64 ?= "cf5b0320cf4544d3db9ce3ddd6ddb7553a610651"
-SRCREV_machine_qemumips ?= "7f1f1ad2f2d90b1b070c6b0a82f0add9aa492e37"
-SRCREV_machine_qemuppc ?= "cf5b0320cf4544d3db9ce3ddd6ddb7553a610651"
-SRCREV_machine_qemuriscv64 ?= "cf5b0320cf4544d3db9ce3ddd6ddb7553a610651"
-SRCREV_machine_qemuriscv32 ?= "cf5b0320cf4544d3db9ce3ddd6ddb7553a610651"
-SRCREV_machine_qemux86 ?= "cf5b0320cf4544d3db9ce3ddd6ddb7553a610651"
-SRCREV_machine_qemux86-64 ?= "cf5b0320cf4544d3db9ce3ddd6ddb7553a610651"
-SRCREV_machine_qemumips64 ?= "fd5ac097b891642eea13659bea536f3ec5910d6d"
-SRCREV_machine ?= "cf5b0320cf4544d3db9ce3ddd6ddb7553a610651"
-SRCREV_meta ?= "031f6c76e488a3563f35258c72ff1de3e25a512e"
+SRCREV_machine_qemuarm ?= "0441d737d347be0b8bcf9bef0b7707d5ba2741a0"
+SRCREV_machine_qemuarm64 ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
+SRCREV_machine_qemumips ?= "5fbc41f5c569e11bf5e56beea77c432efa69b99e"
+SRCREV_machine_qemuppc ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
+SRCREV_machine_qemuriscv64 ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
+SRCREV_machine_qemuriscv32 ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
+SRCREV_machine_qemux86 ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
+SRCREV_machine_qemux86-64 ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
+SRCREV_machine_qemumips64 ?= "a60cf276769d28c6c495dbf2816a50871705d5eb"
+SRCREV_machine ?= "ca8e7981378c7ab461ae9e2b9b96d702fbb0af2a"
+SRCREV_meta ?= "bbff9c3b4b30e741730c2ceb2365ab18639c246a"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.25"
+LINUX_VERSION ?= "5.10.27"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.30.2

