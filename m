Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB9B877DB6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 15:04:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6BF4RYA028102
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 11 Jul 2017 08:04:27 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 11 Jul 2017 08:04:26 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 11 Jul 2017 11:04:19 -0400
Message-ID: <2457e66a389827b1adc633ae32040ea56e86cab5.1499784588.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1499784588.git.bruce.ashfield@windriver.com>
References: <cover.1499784588.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto/4.4: update to v4.4.76
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jul 2017 15:04:26 -0000
Content-Type: text/plain

Integrating the -stable commit with the following changes:

   4282d39575bf Linux 4.4.76
   be8c39b47061 KVM: nVMX: Fix exception injection
   77d977dd78b3 KVM: x86: zero base3 of unusable segments
   3b1609f6c436 KVM: x86/vPMU: fix undefined shift in intel_pmu_refresh()
   b9b3eb5c774e KVM: x86: fix emulation of RSM and IRET instructions
   3491a0b59fcd cpufreq: s3c2416: double free on driver init error path
   aad7041e721e iommu/amd: Fix incorrect error handling in amd_iommu_bind_pasid()
   48952c6d517a iommu: Handle default domain attach failure
   3de9630abe3b iommu/vt-d: Don't over-free page table directories
   404ef3b4bf62 ocfs2: o2hb: revert hb threshold to keep compatible
   5d650fcef901 x86/mm: Fix flush_tlb_page() on Xen
   6fb3b322307e x86/mpx: Correctly report do_mpx_bt_fault() failures to user-space
   7cd8c4903171 ARM: 8685/1: ensure memblock-limit is pmd-aligned
   d4960d58158b ARM64/ACPI: Fix BAD_MADT_GICC_ENTRY() macro implementation
   6ca11db55f62 sched/loadavg: Avoid loadavg spikes caused by delayed NO_HZ accounting
   f6115ec09225 watchdog: bcm281xx: Fix use of uninitialized spinlock.
   f99737ce2e56 xfrm: Oops on error in pfkey_msg2xfrm_state()
   ac78351c96e8 xfrm: NULL dereference on allocation failure
   398ac7a19f17 xfrm: fix stack access out of bounds with CONFIG_XFRM_SUB_POLICY
   736b342cc9b4 jump label: fix passing kbuild_cflags when checking for asm goto support
   53ae0c2ffef7 ravb: Fix use-after-free on `ifconfig eth0 down`
   db1323b77c2b sctp: check af before verify address in sctp_addr_id2transport
   d521e9c384f9 net/mlx4_core: Eliminate warning messages for SRQ_LIMIT under SRIOV
   9837392c2b3e perf probe: Fix to show correct locations for events on modules
   0593fa8f34a2 be2net: fix status check in be_cmd_pmac_add()
   5416a88c2fef s390/ctl_reg: make __ctl_load a full memory barrier
   9a536d587246 swiotlb: ensure that page-sized mappings are page-aligned
   878f37efac3e coredump: Ensure proper size of sparse core files
   c20bdc08af9b x86/mpx: Use compatible types in comparison to fix sparse error
   14339b018bc2 mac80211: initialize SMPS field in HT capabilities
   11dd9e2c4803 spi: davinci: use dma_mapping_error()
   be91b09750bf scsi: lpfc: avoid double free of resource identifiers
   4ac60b20f703 HID: i2c-hid: Add sleep between POWER ON and RESET
   70f41003b9d1 kernel/panic.c: add missing \n
   e4272ebefc83 ibmveth: Add a proper check for the availability of the checksum features
   8fa301abb31a vxlan: do not age static remote mac entries
   00e83abf8e62 virtio_net: fix PAGE_SIZE > 64k
   c64f4194a65b vfio/spapr: fail tce_iommu_attach_group() when iommu_data is null
   d3be5e0471ab drm/amdgpu: check ring being ready before using
   58a766c460b1 net: dsa: Check return value of phy_connect_direct()
   3d2cbbcbde3d amd-xgbe: Check xgbe_init() return code
   dac30e3dbd72 platform/x86: ideapad-laptop: handle ACPI event 1
   666c821b0ae3 scsi: virtio_scsi: Reject commands when virtqueue is broken
   230fe9c7d814 xen-netfront: Fix Rx stall during network stress and OOM
   8df98ff6c394 swiotlb-xen: update dev_addr after swapping pages
   23c7f01691a1 virtio_console: fix a crash in config_work_handler
   6e1116a0b3e2 Btrfs: fix truncate down when no_holes feature is enabled
   961efcd54e5b gianfar: Do not reuse pages from emergency reserve
   477a2359c881 powerpc/eeh: Enable IO path on permanent error
   e1db592de735 net: bgmac: Remove superflous netif_carrier_on()
   e66647f0e1ff net: bgmac: Start transmit queue in bgmac_open
   f01babed64e6 net: bgmac: Fix SOF bit checking
   992048f8ae84 bgmac: Fix reversed test of build_skb() return value.
   ebfa83ab5a53 mtd: bcm47xxpart: don't fail because of bit-flips
   1124701061d8 bgmac: fix a missing check for build_skb
   11e4bb957f1a mtd: bcm47xxpart: limit scanned flash area on BCM47XX (MIPS) only
   e025a30dd8b0 MIPS: ralink: fix MT7628 wled_an pinmux gpio
   cd1fe5c31e91 MIPS: ralink: fix MT7628 pinmux typos
   c9336bbdd924 MIPS: ralink: Fix invalid assignment of SoC type
   ad310161f513 MIPS: ralink: fix USB frequency scaling
   9a23a35a4fc6 MIPS: ralink: MT7688 pinmux fixes
   e1688f1677e6 net: korina: Fix NAPI versus resources freeing
   ef0cb4c9d496 MIPS: ath79: fix regression in PCI window initialization
   753be27f77eb net: mvneta: Fix for_each_present_cpu usage
   0012ba253767 ARM: dts: BCM5301X: Correct GIC_PPI interrupt flags
   50e18570d8ea qla2xxx: Fix erroneous invalid handle message
   8c721e38055a scsi: lpfc: Set elsiocb contexts to NULL after freeing it
   5c982bac211c scsi: sd: Fix wrong DPOFUA disable in sd_read_cache_type
   b92f9f6a2c09 KVM: x86: fix fixing of hypercalls
   cdbf92675fad mm: numa: avoid waiting on freed migrated pages
   21d7c733251a block: fix module reference leak on put_disk() call for cgroups throttle
   2449a71eb982 sysctl: enable strict writes
   1e0f216195a6 usb: gadget: f_fs: Fix possibe deadlock
   04686ab28a35 drm/vmwgfx: Free hash table allocated by cmdbuf managed res mgr
   c70e2006d06a ALSA: hda - set input_path bitmap to zero after moving it to new place
   11327be3570e ALSA: hda - Fix endless loop of codec configure
   db60a2ec9acc MIPS: Fix IRQ tracing & lockdep when rescheduling
   93206654a0b2 MIPS: pm-cps: Drop manual cache-line alignment of ready_count
   cb611ead80a2 MIPS: Avoid accidental raw backtrace
   74de12dbfa7c mm, swap_cgroup: reschedule when neeed in swap_cgroup_swapoff()
   a9e5044b6804 drm/ast: Handle configuration without P2A bridge
   542442710021 NFSv4: fix a reference leak caused WARNING messages
   e052be55a598 netfilter: synproxy: fix conntrackd interaction
   234e649840d1 netfilter: xt_TCPMSS: add more sanity tests on tcph->doff
   095a41128cb6 rtnetlink: add IFLA_GROUP to ifla_policy
   640a09c64ec6 ipv6: Do not leak throw route references
   9de17701a3bc sfc: provide dummy definitions of vswitch functions
   1f8bb6053249 net: 8021q: Fix one possible panic caused by BUG_ON in free_netdev
   f50f2e0cb1a3 decnet: always not take dst->__refcnt when inserting dst into hash table
   93911697a9f2 net/mlx5: Wait for FW readiness before initializing command interface
   0d1effe95ebe ipv6: fix calling in6_ifa_hold incorrectly for dad work
   4feb6121aa5e igmp: add a missing spin_lock_init()
   ee8d5f9fd17e igmp: acquire pmc lock for ip_mc_clear_src()
   7de53eed6fda net: caif: Fix a sleep-in-atomic bug in cfpkt_create_pfx
   030a77d2f904 Fix an intermittent pr_emerg warning about lo becoming free.
   0fc0fad07722 af_unix: Add sockaddr length checks before accessing sa_family in bind and connect handlers
   e2c3ee003280 net: Zero ifla_vf_info in rtnl_fill_vfinfo()
   dedb088a1d18 decnet: dn_rtmsg: Improve input length sanitization in dnrmg_receive_user_skb
   e79948e2d90b net: don't call strlen on non-terminated string in dev_set_alias()
   d68a4e380ff5 ipv6: release dst on error in ip6_dst_lookup_tail
   6ee496d7218a Linux 4.4.75
   cb7be08dee4e nvme: apply DELAY_BEFORE_CHK_RDY quirk at probe time too
   bddc80274a12 nvme/quirk: Add a delay before checking for adapter readiness
   e5f87c733842 net: phy: fix marvell phy status reading
   9b54821d5184 net: phy: Initialize mdio clock at probe function
   889caad4fbe4 usb: gadget: f_fs: avoid out of bounds access on comp_desc
   db7130d63fd8 powerpc/slb: Force a full SLB flush when we insert for a bad EA
   8fcb215c5426 mtd: spi-nor: fix spansion quad enable
   7dfea167fc1d of: Add check to of_scan_flat_dt() before accessing initial_boot_params
   eab38dfd66d7 rxrpc: Fix several cases where a padded len isn't checked in ticket decode
   800d7454e50f USB: usbip: fix nonconforming hub descriptor
   525e496a9722 drm/amdgpu: adjust default display clock
   526527847355 drm/amdgpu/atom: fix ps allocation size for EnableDispPowerGating
   4f3d0f468552 drm/radeon: add a quirk for Toshiba Satellite L20-183
   f8242fa8119b drm/radeon: add a PX quirk for another K53TK variant
   fe8003da6113 iscsi-target: Reject immediate data underflow larger than SCSI transfer length
   d374be75f4c7 target: Fix kref->refcount underflow in transport_cmd_finish_abort
   1fecf3977def time: Fix clock->read(clock) race around clocksource changes
   255ad85b5ecc Input: i8042 - add Fujitsu Lifebook AH544 to notimeout list
   3ee9033e228d powerpc/kprobes: Pause function_graph tracing during jprobes handling
   bc7b3e9984a8 signal: Only reschedule timers on signals timers have sent
   005253ffe4ad HID: Add quirk for Dell PIXART OEM mouse
   63ba840a53d6 CIFS: Improve readdir verbosity
   824b9506e4f2 KVM: PPC: Book3S HV: Preserve userspace HTM state properly
   7b88f761929e lib/cmdline.c: fix get_options() overflow while parsing ranges
   b95aa98e77d7 autofs: sanity check status reported with AUTOFS_DEV_IOCTL_FAIL
   1d3d0f8b7cf7 fs/exec.c: account for argv/envp pointers
   22da7ca81a3a Linux 4.4.74
   1f2284fac218 mm: fix new crash in unmapped_area_topdown()
   f41512c6acb7 Allow stack to grow up to address space limit
   4b359430674c mm: larger stack guard gap, between vmas
   26605a06dd92 alarmtimer: Rate limit periodic intervals
   c24159adf222 MIPS: Fix bnezc/jialc return address calculation
   94695386c79c usb: dwc3: exynos fix axius clock error path to do cleanup
   aac7fa215e8f alarmtimer: Prevent overflow of relative timers
   4d4d501cd707 genirq: Release resources in __setup_irq() error path
   6af90091b610 swap: cond_resched in swap_cgroup_prepare()
   bfbd244c5f18 mm/memory-failure.c: use compound_head() flags for huge pages
   f5dc61753d0e USB: gadgetfs, dummy-hcd, net2280: fix locking for callbacks
   89c15994a06d usb: xhci: ASMedia ASM1042A chipset need shorts TX quirk
   5efd37fe7218 drivers/misc/c2port/c2port-duramar2150.c: checking for NULL instead of IS_ERR()
   ab29b21a47ae usb: r8a66597-hcd: decrease timeout
   4c7a6dd205cc usb: r8a66597-hcd: select a different endpoint on timeout
   42c8b4b5fdca USB: gadget: dummy_hcd: fix hub-descriptor removable fields
   dc6ecba3f6c1 pvrusb2: reduce stack usage pvr2_eeprom_analyze()
   e33e866d1593 usb: core: fix potential memory leak in error path during hcd creation
   ec443ee0c2aa USB: hub: fix SS max number of ports
   7e2ad8b207f2 iio: proximity: as3935: recalibrate RCO after resume
   0c967139e832 staging: rtl8188eu: prevent an underflow in rtw_check_beacon_data()
   e59d91144545 mfd: omap-usb-tll: Fix inverted bit use for USB TLL mode
   93d022e25642 x86/mm/32: Set the '__vmalloc_start_set' flag in initmem_init()
   c79aab7007d8 serial: efm32: Fix parity management in 'efm32_uart_console_get_options()'
   daebcf9871eb mac80211: fix IBSS presp allocation size
   bb8428f4c954 mac80211: fix CSA in IBSS mode
   5f1f39023c2a mac80211/wpa: use constant time memory comparison for MACs
   156f00663af6 mac80211: don't look at the PM bit of BAR frames
   a8686c968fe3 vb2: Fix an off by one error in 'vb2_plane_vaddr'
   fa90f02d511d cpufreq: conservative: Allow down_threshold to take values from 1 to 10
   58ab7a86cdc2 can: gs_usb: fix memory leak in gs_cmd_reset()
   0ad134d81c07 configfs: Fix race between create_link and configfs_rmdir
   1bd30958ec55 Linux 4.4.73
   39e84dcd7876 sparc64: make string buffers large enough
   d80aa84235ff s390/kvm: do not rely on the ILC on kvm host protection fauls
   afb415f72daa xtensa: don't use linux IRQ #0
   8b1aa2679812 tipc: ignore requests when the connection state is not CONNECTED
   77d2b8dc9597 proc: add a schedule point in proc_pid_readdir()
   202776694c2a romfs: use different way to generate fsid for BLOCK or MTD
   50ef0e2e9abe sctp: sctp_addr_id2transport should verify the addr before looking up assoc
   70752628521d r8152: avoid start_xmit to schedule napi when napi is disabled
   5270bf63719c r8152: fix rtl8152_post_reset function
   a4877e5564a5 r8152: re-schedule napi for tx
   10bfb4c76c94 nfs: Fix "Don't increment lock sequence ID after NFS4ERR_MOVED"
   82ce18b09bf1 ravb: unmap descriptors when freeing rings
   3987a40362b7 drm/ast: Fixed system hanged if disable P2A
   ff20cc9a6086 drm/nouveau: Don't enabling polling twice on runtime resume
   711f4797a339 parisc, parport_gsc: Fixes for printk continuation lines
   9343894a8b3d net: adaptec: starfire: add checks for dma mapping errors
   3926d04ddec2 pinctrl: berlin-bg4ct: fix the value for "sd1a" of pin SCRD0_CRD_PRES
   6e3ea31dfb01 gianfar: synchronize DMA API usage by free_skb_rx_queue w/ gfar_new_page
   2b9f84ef46d8 net/mlx4_core: Avoid command timeouts during VF driver device shutdown
   6f0a81edb918 drm/nouveau/fence/g84-: protect against concurrent access to semaphore buffers
   9c7a11e6f994 drm/nouveau: prevent userspace from deleting client object
   1507ea6df42e ipv6: fix flow labels when the traffic class is non-0
   95a4659ee8d0 FS-Cache: Initialise stores_lock in netfs cookie
   38481d7d43dd fscache: Clear outstanding writes when disabling a cookie
   b421d230dfa1 fscache: Fix dead object requeue
   e6b15f0fc7a6 ethtool: do not vzalloc(0) on registers dump
   980660760aa7 log2: make order_base_2() behave correctly on const input value zero
   55d0f89a1a0c kasan: respect /proc/sys/kernel/traceoff_on_warning
   1948d0afe43e jump label: pass kbuild_cflags when checking for asm goto support
   266e02bc69a2 PM / runtime: Avoid false-positive warnings from might_sleep_if()
   8d228758f90f ipv6: Fix IPv6 packet loss in scenarios involving roaming + snooping switches
   ee0cd47799dd i2c: piix4: Fix request_region size
   68cac0741246 sierra_net: Add support for IPv6 and Dual-Stack Link Sense Indications
   d95ffdd39566 sierra_net: Skip validating irrelevant fields for IDLE LSIs
   716cca0a67ec net: hns: Fix the device being used for dma mapping during TX
   aacf9de1e239 NET: mkiss: Fix panic
   b9e9045d5e6b NET: Fix /proc/net/arp for AX.25
   23287661af3e ipv6: Inhibit IPv4-mapped src address on the wire.
   8faccb2b9442 ipv6: Handle IPv4-mapped src to in6addr_any dst.
   10a762977267 net: xilinx_emaclite: fix receive buffer overflow
   7f71f22a116f net: xilinx_emaclite: fix freezes due to unordered I/O
   2ba464a4b748 Call echo service immediately after socket reconnect
   691fe5610d58 staging: rtl8192e: rtl92e_fill_tx_desc fix write to mapped out memory.
   3fc4d70453ee ARM: dts: imx6dl: Fix the VDD_ARM_CAP voltage for 396MHz operation
   b28c21baf28a partitions/msdos: FreeBSD UFS2 file systems are not recognized
   0fb2a1fe6155 s390/vmem: fix identity mapping
   30c9187fa8ed Linux 4.4.72
   4e528eb9160b arm64: ensure extension of smp_store_release value
   01ce16f40c97 arm64: armv8_deprecated: ensure extension of addr
   51ff10e72fc2 usercopy: Adjust tests to deal with SMAP/PAN
   746d48934f51 RDMA/qib,hfi1: Fix MR reference count leak on write with immediate
   3ccf69562ac2 arm64: entry: improve data abort handling of tagged pointers
   4eaef3651815 arm64: hw_breakpoint: fix watchpoint matching for tagged pointers
   bc5f31d34eab Make __xfs_xattr_put_listen preperly report errors.
   e8a1086ae191 NFSv4: Don't perform cached access checks before we've OPENed the file
   533020828366 NFS: Ensure we revalidate attributes before using execute_ok()
   cb1fb15c8355 mm: consider memblock reservations for deferred memory initialization sizing
   52d8b8ad2b4b net: better skb->sender_cpu and skb->napi_id cohabitation
   3c0fcb52674a serial: sh-sci: Fix panic when serial console and DMA are enabled
   cc04a1433843 tty: Drop krefs for interrupted tty lock
   983c09ebdbc2 drivers: char: mem: Fix wraparound check to allow mappings up to the end
   9a9388953bdc ASoC: Fix use-after-free at card unregistration
   54d12fbf54d4 ALSA: timer: Fix missing queue indices reset at SNDRV_TIMER_IOCTL_SELECT
   f5bc918760c8 ALSA: timer: Fix race between read and ioctl
   5dffc1be6552 drm/nouveau/tmr: fully separate alarm execution/pending lists
   74276868b455 drm/vmwgfx: Make sure backup_handle is always valid
   619cc02fd85d drm/vmwgfx: limit the number of mip levels in vmw_gb_surface_define_ioctl()
   e4c05b3a751a drm/vmwgfx: Handle vmalloc() failure in vmw_local_fifo_reserve()
   e582b82c160a perf/core: Drop kernel samples even though :u is specified
   1cfe1e9da629 powerpc/hotplug-mem: Fix missing endian conversion of aa_index
   8c92870bdbf2 powerpc/numa: Fix percpu allocations to be NUMA aware
   fc7fb9430d70 powerpc/eeh: Avoid use after free in eeh_handle_special_event()
   93d03807f395 scsi: qla2xxx: don't disable a not previously enabled PCI device
   f267b064a6e9 KVM: arm/arm64: Handle possible NULL stage2 pud when ageing pages
   5c7955c8726c btrfs: fix memory leak in update_space_info failure path
   cc8c67cadc27 btrfs: use correct types for page indices in btrfs_page_exists_in_range
   8fe4345d6a1d cxl: Fix error path on bad ioctl
   f0d2e153147e ufs_getfrag_block(): we only grab ->truncate_mutex on block creation path
   34aa71cbd408 ufs_extend_tail(): fix the braino in calling conventions of ufs_new_fragments()
   d6bd1e7ec7d8 ufs: set correct ->s_maxsize
   4c516dff07d7 ufs: restore maintaining ->i_blocks
   1df45bb64396 fix ufs_isblockset()
   db9aafaf90b6 ufs: restore proper tail allocation
   044470266a50 fs: add i_blocksize()
   c8acec90d9dd cpuset: consider dying css as offline
   fff08d245263 Input: elantech - add Fujitsu Lifebook E546/E557 to force crc_enabled
   ba9fe2e8072f drm/msm: Expose our reservation object when exporting a dmabuf.
   934d0a9f9c65 target: Re-add check to reject control WRITEs with overflow data
   94d3dafe96f3 cpufreq: cpufreq_register_driver() should return -ENODEV if init fails
   2ff1edbbb29b stackprotector: Increase the per-task stack canary's random range from 32 bits to 64 bits on 64-bit platforms
   1025503bcee9 random: properly align get_random_int_hash
   baae8c3c2e2a drivers: char: random: add get_random_long()
   ff7739a28719 iio: proximity: as3935: fix AS3935_INT mask
   64276cdbd418 iio: light: ltr501 Fix interchanged als/ps register field
   a365c707d2ee staging/lustre/lov: remove set_fs() call from lov_getstripe()
   bd2e8f0a72c5 usb: chipidea: debug: check before accessing ci_role
   942dcb0ffa9d usb: chipidea: udc: fix NULL pointer dereference if udc_start failed
   6ff96a61bb20 usb: gadget: f_mass_storage: Serialize wake and sleep execution
   daa1357ff346 ext4: fix fdatasync(2) after extent manipulation operations
   7b9694cb7bf2 ext4: keep existing extra fields when inode expands
   08dc390b2745 ext4: fix SEEK_HOLE
   e9560c2df474 xen-netfront: cast grant table reference first to type int
   17a58bdf3d63 xen-netfront: do not cast grant table reference to signed short
   4467b3a14557 xen/privcmd: Support correctly 64KB page granularity when mapping memory
   3340c0e11086 dmaengine: ep93xx: Always start from BASE0
   3ff231a0d399 dmaengine: usb-dmac: Fix DMAOR AE bit definition
   445d08a6be93 KVM: async_pf: avoid async pf injection when in guest mode
   7b69d79732eb arm: KVM: Allow unaligned accesses at HYP
   c7740cbcc2c4 KVM: cpuid: Fix read/write out-of-bounds vulnerability in cpuid emulation
   a8bbdf1921fd kvm: async_pf: fix rcu_irq_enter() with irqs enabled
   e21ad4a956d4 nfsd: Fix up the "supattr_exclcreat" attributes
   6a9b72248814 nfsd4: fix null dereference on replay
   1f6791d4f208 drm/amdgpu/ci: disable mclk switching for high refresh rates (v2)
   a3a3a1cf538c crypto: gcm - wait for crypto op not signal safe
   8096a6748a92 KEYS: fix freeing uninitialized memory in key_update()
   bc6be3433e69 KEYS: fix dereferencing NULL payload with nonzero length
   c94bea2e4bf5 ptrace: Properly initialize ptracer_cred on fork
   dd6a4b53d026 serial: ifx6x60: fix use-after-free on module unload
   7816928f3435 arch/sparc: support NR_CPUS = 4096
   8554f96c1656 sparc64: delete old wrap code
   c9215ca71390 sparc64: new context wrap
   3e557fd99a22 sparc64: add per-cpu mm of secondary contexts
   7e5551fbb864 sparc64: redefine first version
   e72963317bf1 sparc64: combine activate_mm and switch_mm
   4c0cae481fae sparc64: reset mm cpumask after wrap
   7047c2009be9 sparc: Machine description indices can vary
   54e23c087f36 sparc64: mm: fix copy_tsb to correctly copy huge page TSBs
   0774a35802e9 net: bridge: start hello timer only if device is up
   9cbc6cbd9170 net: ethoc: enable NAPI before poll may be scheduled
   45202cd2199c net: ping: do not abuse udp_poll()
   406752726afc ipv6: Fix leak in ipv6_gso_segment().
   92d88e8a7adc vxlan: fix use-after-free on deletion
   f4c645f67e72 tcp: disallow cwnd undo when switching congestion control
   03994b4b858f cxgb4: avoid enabling napi twice to the same queue
   491809d0f8d8 ipv6: xfrm: Handle errors reported by xfrm6_find_1stfragopt()
   d02f4c962d35 bnx2x: Fix Multi-Cos

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index f423604f663f..04c6cb6a3776 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b0b44854bfb7f7ea10890ab8d8fff936be7e37da"
-SRCREV_meta ?= "d0e5ea0e199b591cc7588dc80b6ec07ea05f74b8"
+SRCREV_machine ?= "be70c37e4c370a8fe2ffef9e3300a266085588c4"
+SRCREV_meta ?= "fbb3579c4011befe15368fea05f600d37b3444ba"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.71"
+LINUX_VERSION ?= "4.4.76"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 868e70edc45a..28f197eba371 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.71"
+LINUX_VERSION ?= "4.4.76"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "268676407913f5d496cde6cbf4052eb5acaf6237"
-SRCREV_meta ?= "d0e5ea0e199b591cc7588dc80b6ec07ea05f74b8"
+SRCREV_machine ?= "2854678e4ccbb4bbd1bb4c243ac3e2571ef9834a"
+SRCREV_meta ?= "fbb3579c4011befe15368fea05f600d37b3444ba"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 48f4e94640e1..5194cf0b49cc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "dbf351c65cf492518339ac1ee0ecb02de4beb313"
-SRCREV_machine_qemuarm64 ?= "268676407913f5d496cde6cbf4052eb5acaf6237"
-SRCREV_machine_qemumips ?= "80509fd80a3457f74c716e5018378efb75a35934"
-SRCREV_machine_qemuppc ?= "268676407913f5d496cde6cbf4052eb5acaf6237"
-SRCREV_machine_qemux86 ?= "268676407913f5d496cde6cbf4052eb5acaf6237"
-SRCREV_machine_qemux86-64 ?= "268676407913f5d496cde6cbf4052eb5acaf6237"
-SRCREV_machine_qemumips64 ?= "dfd0bad7365562bf39b16630c59dcb4b18a09396"
-SRCREV_machine ?= "268676407913f5d496cde6cbf4052eb5acaf6237"
-SRCREV_meta ?= "d0e5ea0e199b591cc7588dc80b6ec07ea05f74b8"
+SRCREV_machine_qemuarm ?= "8b42f3bbf0818181eb444af119bd295029ea2caf"
+SRCREV_machine_qemuarm64 ?= "2854678e4ccbb4bbd1bb4c243ac3e2571ef9834a"
+SRCREV_machine_qemumips ?= "0afe3f8c5fb95ed9c9f87f7765be53f6e0b8fad6"
+SRCREV_machine_qemuppc ?= "2854678e4ccbb4bbd1bb4c243ac3e2571ef9834a"
+SRCREV_machine_qemux86 ?= "2854678e4ccbb4bbd1bb4c243ac3e2571ef9834a"
+SRCREV_machine_qemux86-64 ?= "2854678e4ccbb4bbd1bb4c243ac3e2571ef9834a"
+SRCREV_machine_qemumips64 ?= "45dd25b50163846c3346b93a21e967c68ab92b26"
+SRCREV_machine ?= "2854678e4ccbb4bbd1bb4c243ac3e2571ef9834a"
+SRCREV_meta ?= "fbb3579c4011befe15368fea05f600d37b3444ba"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.71"
+LINUX_VERSION ?= "4.4.76"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


