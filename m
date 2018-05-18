Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8707A750ED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 15:07:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4IF6SkO004330
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 May 2018 08:07:04 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 18 May 2018 08:06:59 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 18 May 2018 11:05:52 -0400
Message-ID: <1242402ba1747f0ebc9bdcd6e3c74b7a5fe6565e.1526655802.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1526655802.git.bruce.ashfield@windriver.com>
References: <cover.1526655802.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-yocto/4.15: update to v4.15.18
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
X-List-Received-Date: Fri, 18 May 2018 15:07:23 -0000
Content-Type: text/plain

Updating v4.15 to the final korg -stable for the v4.15 series. It comprises
the following commits:

   a8ec862fd39d Linux 4.15.18
   c4f45cf301e6 ovl: set lower layer st_dev only if setting lower st_ino
   9def916c750d rtl8187: Fix NULL pointer dereference in priv->conf_mutex
   7a2a6d71eed4 Bluetooth: hci_bcm: Treat Interrupt ACPI resources as always being active-low
   154b354f3171 Bluetooth: Fix connection if directed advertising and privacy is used
   4eb2f39266ac getname_kernel() needs to make sure that ->name != ->iname in long case
   84f086ee4e6a mm/gup_benchmark: handle gup failures
   7e255357ef66 get_user_pages_fast(): return -EFAULT on access_ok failure
   4d03a2e6b9b6 s390/compat: fix setup_frame32
   e025da42c8e6 s390/ipl: ensure loadparm valid flag is set
   0d4e77fe0659 s390/qdio: don't merge ERROR output buffers
   f3eae28761c3 s390/qdio: don't retry EQBS after CCQ 96
   4f2217cbe648 nfit: fix region registration vs block-data-window ranges
   3adc135469c8 block/loop: fix deadlock after loop_set_status
   9d8a3dc99219 apparmor: fix resource audit messages when auditing peer
   93d36bc65698 apparmor: fix display of .ns_name for containers
   5f7dc7d33ed3 apparmor: fix logging of the existence test for signals
   b88779931388 scsi: qla2xxx: Fix small memory leak in qla2x00_probe_one on probe failure
   e4e64ce3fbc4 nfsd: fix incorrect umasks
   f6b213293ed9 hugetlbfs: fix bug in pgoff overflow checking
   004f2df3ae48 xen: xenbus_dev_frontend: Fix XS_TRANSACTION_END handling
   ff37d99aebb3 ovl: fix lookup with middle layer opaque dir and absolute path redirects
   645840a17612 blk-mq: don't keep offline CPUs mapped to hctx 0
   01e12511b9e9 blk-mq: order getting budget and driver tag
   3e0b25015e05 lib: fix stall in __bitmap_parselist()
   a8ce442c67ff nvme: Skip checking heads without namespaces
   c5f1f15ab5f1 block: Change a rcu_read_{lock,unlock}_sched() pair into rcu_read_{lock,unlock}()
   54e869fce691 f2fs: fix heap mode to reset it back
   418a68e55acb sunrpc: remove incorrect HMAC request initialization
   1ff02d3465dc x86/apic: Fix signedness bug in APIC ID validity checks
   84ad0b9e121f ath9k: Protect queue draining by rcu_read_lock()
   70146f28e419 hwmon: (ina2xx) Fix access to uninitialized mutex
   717b489baaf0 x86/mce/AMD: Get address from already initialized block
   ab0ed342375f perf/core: Fix use-after-free in uprobe_perf_close()
   aa9cf90591f8 KVM: PPC: Book3S HV: trace_tlbie must not be called in realmode
   02c74a999d69 PCI: hv: Fix 2 hang issues in hv_compose_msi_msg()
   b5f7ba13889a PCI: hv: Serialize the present and eject work items
   4d12fdda9978 Drivers: hv: vmbus: do not mark HV_PCIE as perf_device
   ed7308bce0a2 parisc: Fix HPMC handler by increasing size to multiple of 16 bytes
   2cad1487248d parisc: Fix out of array access in match_pci_device()
   351b3d90c18d ipmi: Fix some error cleanup issues
   9bb8f59e6ba0 media: v4l: vsp1: Fix header display list status check in continuous mode
   2276552990c4 media: v4l2-compat-ioctl32: don't oops on overlay
   44f9357a588e lan78xx: Correctly indicate invalid OTP
   a6f8bdd9b583 vhost: Fix vhost_copy_to_user()
   5c877c58589f ip_gre: clear feature flags when incompatible o_flags are set
   a818b1e8182e l2tp: fix race in duplicate tunnel detection
   186fab54f609 l2tp: fix races in tunnel creation
   d6b25a259ef9 vhost: fix vhost_vq_access_ok() log check
   f76f647e536b slip: Check if rstate is initialized before uncompressing
   89a990000cd5 rds: MP-RDS may use an invalid c_path
   14fb3c646653 cdc_ether: flag the Cinterion AHS8 modem by gemalto as WWAN
   17da5b1d0a46 netfilter: ipset: Missing nfnl_lock()/nfnl_unlock() is added to ip_set_net_exit()
   7b3f3fa2bdeb drm/i915/edp: Do not do link training fallback or prune modes on EDP
   b22a1fa1b34f Linux 4.15.17
   9e6ee870ad5a net/mlx4_core: Fix memory leak while delete slave's resources
   94f1b8485ce3 vhost_net: add missing lock nesting notation
   a17ab0a5c81c team: move dev_mc_sync after master_upper_dev_link in team_port_add
   0f9e7b328bff route: check sysctl_fib_multipath_use_neigh earlier than hash
   13ed54d5252e vhost: validate log when IOTLB is enabled
   2030a5c0ab13 net/mlx5e: Fix traffic being dropped on VF representor
   2b9260fb6f35 net/mlx4_en: Fix mixed PFC and Global pause user control requests
   e2b83b778065 strparser: Fix sign of err codes
   73a697b3ef62 net/sched: fix NULL dereference on the error path of tcf_skbmod_init()
   39eab2e79f81 net/sched: fix NULL dereference in the error path of tunnel_key_init()
   d6bda9865d4c net/mlx5e: Sync netdev vxlan ports at open
   75744bdbce5f net/mlx5e: Don't override vport admin link state in switchdev mode
   5dfa4fb5cd26 ipv6: sr: fix seg6 encap performances with TSO enabled
   d0f3ccf5293c nfp: use full 40 bits of the NSP buffer address
   9d49e497222c net/sched: fix NULL dereference in the error path of tcf_sample_init()
   e95cdaee3d7d net/mlx5e: Fix memory usage issues in offloading TC flows
   07c70edfbefd net/mlx5e: Avoid using the ipv6 stub in the TC offload neigh update path
   5075e98fb92f net/sched: fix NULL dereference in the error path of tcf_vlan_init()
   a61bf7ba7f9f net_sched: fix a missing idr_remove() in u32_delete_key()
   8c09a81ed1b9 net/mlx5e: Set EQE based as default TX interrupt moderation mode
   34eb1263d97f vti6: better validate user provided tunnel names
   4fba1a669a9a ip6_tunnel: better validate user provided tunnel names
   efcc90fcf90a ip6_gre: better validate user provided tunnel names
   c64153772333 ipv6: sit: better validate user provided tunnel names
   bc4718fcee7c ip_tunnel: better validate user provided tunnel names
   764975439e8b net: fool proof dev_valid_name()
   b9c36c30ccac bonding: process the err returned by dev_set_allmulti properly in bond_enslave
   1999253e11b6 bonding: move dev_mc_sync after master_upper_dev_link in bond_enslave
   4021b1a4ef73 bonding: fix the err path for dev hwaddr sync in bond_enslave
   088d65ddf9c5 vrf: Fix use after free and double free in vrf_finish_output
   51c6ba0d8d71 vlan: also check phy_driver ts_info for vlan's real device
   25d45c0fd16c vhost: correctly remove wait queue during poll failure
   3407271beb99 sky2: Increase D3 delay to sky2 stops working after suspend
   7e72ce101da8 sctp: sctp_sockaddr_af must check minimal addr length for AF_INET6
   9db59791e2b7 sctp: do not leak kernel memory to user space
   cb2b72372ab2 r8169: fix setting driver_data after register_netdev
   3b1c6b30170e pptp: remove a buggy dst release in pptp_connect()
   db714a1ff359 net/sched: fix NULL dereference in the error path of tcf_bpf_init()
   c7aea3ee65f1 net sched actions: fix dumping which requires several messages to user space
   ae4d4eb29e54 net/mlx5e: Verify coalescing parameters in range
   7102de5aef56 netlink: make sure nladdr has correct size in netlink_connect()
   bbf5fab136f6 net/ipv6: Increment OUTxxx counters after netfilter hook
   e3b4bc07821c net/ipv6: Fix route leaking between VRFs
   202f1915fa1d net: fix possible out-of-bound read in skb_network_protocol()
   7dd65ec55e31 net: dsa: Discard frames from unused ports
   14fed02e94a8 lan78xx: Crash in lan78xx_writ_reg (Workqueue: events lan78xx_deferred_multicast_write)
   dad8b0244bac ipv6: the entire IPv6 header chain must fit the first fragment
   30d032b72d06 arp: fix arp_filter on l3slave devices
   fea978223b59 x86/microcode: Fix CPU synchronization routine
   32bfd224e9d6 x86/microcode: Attempt late loading only when new microcode is present
   8e1161f94614 x86/microcode: Synchronize late microcode loading
   7bc523cc535e x86/microcode: Request microcode on the BSP
   194ed6edd93f x86/microcode/intel: Look into the patch cache first
   399c019ea77c x86/microcode: Do not upload microcode if CPUs are offline
   1089ac9dda39 x86/microcode/intel: Writeback and invalidate caches before updating microcode
   1c1f5b2cd2cf x86/microcode/intel: Check microcode revision before updating sibling threads
   abb00ec05909 x86/microcode: Get rid of struct apply_microcode_ctx
   5cea945c5a3b x86/CPU: Check CPU feature bits after microcode upgrade
   1a6150b2bad3 x86/CPU: Add a microcode loader callback
   e280980606e7 x86/microcode: Propagate return value from updating functions
   d3839c26e68d drm/i915/cnp: Properly handle VBT ddc pin out of bounds.
   1710c3baec14 drm/i915/cnp: Ignore VBT request for know invalid DDC pin.
   87ef4d6fc6b0 thermal: int3400_thermal: fix error handling in int3400_thermal_probe()
   452aecd060f2 tcmu: release blocks for partially setup cmds
   46279ed31169 perf tools: Fix copyfile_offset update of output offset
   feb5c349feb5 crypto: aes-generic - build with -Os on gcc-7+
   50dbed12aaa7 mtd: mtd_oobtest: Handle bitflips during reads
   dad8f5220c5d Input: goodix - disable IRQs while suspended
   d7c122fd723f ibmvnic: Don't handle RX interrupts when not up.
   82c353ad3da1 sdhci: Advertise 2.0v supply on SDIO host controller
   55a0ef8d9d71 x86/gart: Exclude GART aperture from vmcore
   6a68ef47bea6 gpio: thunderx: fix error return code in thunderx_gpio_probe()
   27fac1611fdd RDMA/cma: Fix rdma_cm path querying for RoCE
   ce87afbbada6 scsi: megaraid_sas: unload flag should be set after scsi_remove_host is called
   458419bb8429 scsi: megaraid_sas: Error handling for invalid ldcount provided by firmware in RAID map
   edde080c5e33 PM / domains: Don't skip driver's ->suspend|resume_noirq() callbacks
   3018e3d5171e cxgb4vf: Fix SGE FL buffer initialization logic for 64K pages
   b2320552d1f5 drm/amd/powerplay: fix memory leakage when reload (v2)
   70557b7f58db i40evf: don't rely on netif_running() outside rtnl_lock()
   6e80af54604d Bluetooth: hci_bcm: Make shutdown and device wake GPIO optional
   d8d843fe374b Bluetooth: hci_bcm: Validate IRQ before using it
   e34b75c7db20 Bluetooth: hci_bcm: Mandate presence of shutdown and device wake GPIO
   3ca4e49e9be7 uio_hv_generic: check that host supports monitor page
   f0e9997e06a5 EDAC, mv64x60: Fix an error handling path
   7018cb0149d1 serdev: Fix serdev_uevent failure on ACPI enumerated serdev-controllers
   3af99e83a278 block, bfq: put async queues for root bfq groups too
   a551b16c4903 tty: n_gsm: Allow ADM response in addition to UA for control dlci
   13ba69ddf542 blk-mq: fix kernel oops in blk_mq_tag_idle()
   1aa0564aae9e net/mlx5e: IPoIB, Use correct timestamp in child receive flow
   d4beec7ede2a scsi: libsas: initialize sas_phy status according to response of DISCOVER
   a8e93148d4e6 scsi: libsas: fix error when getting phy events
   c16490ba27bb scsi: libsas: fix memory leak in sas_smp_get_phy_events()
   614361530f03 net: Fix netdev_WARN_ONCE macro
   088ebc83060e scsi: libsas: Use dynamic alloced work to avoid sas event lost
   eead4cd85fe3 bcache: segregate flash only volume write streams
   9390f52f68a8 bcache: stop writeback thread after detaching
   18303da51818 bcache: ret IOERR when read meets metadata error
   2300dbc6d1f3 net: hns3: fix for changing MTU
   dfa20d9d7fa9 net: hns3: Fix an error macro definition of HNS3_TQP_STAT
   f55dc2a4c18d net: hns3: Fix a loop index error of tqp statistics query
   4434e6f5820f net: hns3: Fix an error of total drop packet statistics
   c8de98d55dc4 net/mlx5: Fix race for multiple RoCE enable
   717df1176636 wl1251: check return from call to wl1251_acx_arp_ip_filter
   eb49779a13d9 rt2x00: do not pause queue unconditionally on error path
   14d7f455a4da power: supply: axp288_charger: Properly stop work on probe-error / remove
   c9ec5c8ac418 ASoC: Intel: sst: Fix the return value of 'sst_send_byte_stream_mrfld()'
   b00f942fef90 staging: lustre: disable preempt while sampling processor id.
   731edfbaf9e5 perf report: Fix a no annotate browser displayed issue
   4c4f48c3e5d7 tpm: return a TPM_RC_COMMAND_CODE response if command is not implemented
   0a592432e6e9 nvme_fcloop: fix abort race condition
   513f897ed6e5 nvme_fcloop: disassocate local port structs
   9d0b9e874ecf pinctrl: baytrail: Enable glitch filter for GPIOs used as interrupts
   ab0ba11b94b5 nvme-fabrics: don't check for non-NULL module in nvmf_register_transport
   2c624d6fede9 nvme-fabrics: protect against module unload during create_ctrl
   3d4d30ecc250 backlight: tdo24m: Fix the SPI CS between transfers
   3f9ae3bb4dca blk-mq: fix race between updating nr_hw_queues and switching io sched
   f86fd0585e8e blk-mq: avoid to map CPU into stale hw queue
   5be1bc32b82d IB/rdmavt: Allocate CQ memory on the correct node
   a5a2a6bd5d4a powernv-cpufreq: Add helper to extract pstate from PMSR
   618d78622811 arm64: asid: Do not replace active_asids if already 0
   a257594a30d3 gpio: label descriptors using the device name
   b2b11aebe49e crypto: crypto4xx - perform aead icv check in the driver
   56d3fab6bc64 vfb: fix video mode and line_length being set when loaded
   7f12c3f9eec6 mac80211: Fix setting TX power on monitor interfaces
   110909d7a0c9 ACPI: EC: Fix debugfs_create_*() usage
   03e965ebd983 irqchip/gic-v3: Fix the driver probe() fail due to disabled GICC entry
   c97d465daddd irqchip/ompic: fix return value check in ompic_of_init()
   f885f0701f6d scsi: mpt3sas: Proper handling of set/clear of "ATA command pending" flag.
   f212235717ed scsi: libiscsi: Allow sd_shutdown on bad transport
   f4fecf24ae66 RDMA/hns: Update the usage of sr_max and rr_max field
   311b60b294b4 spi: sh-msiof: Fix timeout failures for TX-only DMA transfers
   902dae240b4a IB/ipoib: Fix for notify send CQ failure messages
   3ca14535c781 drm/msm: Fix NULL deref in adreno_load_gpu
   70a6a6877a88 ASoC: Intel: cht_bsw_rt5645: Analog Mic support
   df85cc29794a ASoC: Intel: Skylake: Disable clock gating during firmware and library download
   4577c7f85eda media: videobuf2-core: don't go out of the buffer range
   a8d3eea33c25 clk: sunxi-ng: a83t: Add M divider to TCON1 clock
   e0870e5401ee f2fs: fix lock dependency in between dio_rwsem & i_mmap_sem
   bde6301dbf14 hwmon: (ina2xx) Make calibration register value fixed
   2bddcdd33e3a RDMA/cma: Mark end of CMA ID messages
   7f0880203e52 thermal/drivers/hisi: Remove bogus const from function return type
   a696e385ac75 selftests/net: fix bugs in address and port initialization
   abf63e3cb1a8 net_sch: red: Fix the new offload indication
   ffc544a91a0f gpiolib: don't dereference a desc before validation
   ebc5545383f7 PM / devfreq: Fix potential NULL pointer dereference in governor_store
   34e1b76c57d0 clk: divider: fix incorrect usage of container_of
   5218e11fbd2f watchdog: dw_wdt: add stop watchdog operation
   3a0289a45385 VFS: close race between getcwd() and d_move()
   827fe75987f1 IB/mlx5: Report inner RSS capability
   b644c41acce1 net/mlx4_en: Change default QoS settings
   965736ee654d ACPI / video: Default lcd_only to true on Win8-ready and newer machines
   ce6b782c6f38 rds; Reset rs->rs_bound_addr in rds_add_bound() failure path
   e78a6e9aee5b l2tp: fix missing print session offset info
   d8ffa7dfceb5 net: hns3: add Asym Pause support to phy default features
   353900b83514 net: hns3: fix for getting auto-negotiation state in hclge_get_autoneg
   4edd8be70f11 net: hns3: free the ring_data structrue when change tqps
   295c02ce3322 perf evsel: Enable ignore_missing_thread for pid option
   88d7e9f141c3 perf evsel: Fix swap for samples with raw data
   9ab8894f195d perf probe: Add warning message if there is unexpected event name
   ef0fa7a1ec6e perf probe: Find versioned symbols from map
   2dffefdf975a thermal: power_allocator: fix one race condition issue for thermal_instances list
   4dfb698be2a5 ipv6: Reinject IPv6 packets if IPsec policy matches after SNAT
   542f2cc70fe6 Bluetooth: Add a new 04ca:3015 QCA_ROME device
   7ee903fb3a1b ARM: dts: ls1021a: add "fsl,ls1021a-esdhc" compatible string to esdhc node
   9f8a75a2299e clk: meson: mpll: use 64-bit maths in params_from_rate
   be7835d54626 i40iw: Validate correct IRD/ORD connection parameters
   551ace11e153 i40iw: Correct Q1/XF object count equation
   c2f3d4bf8e4b i40iw: Fix sequence number for the first partial FPDU
   49859d3c5536 Linux 4.15.16
   b36c97615b98 Revert "ip6_vti: adjust vti mtu according to mtu of lower device"
   f4c360885236 Revert "cpufreq: Fix governor module removal race"
   2dae6069c488 Revert "ARM: dts: omap3-n900: Fix the audio CODEC's reset pin"
   0dd269e2a25b Revert "ARM: dts: am335x-pepper: Fix the audio CODEC's reset pin"
   657fda9505c8 Fix slab name "biovec-(1<<(21-12))"
   8282afd8abee net: hns: Fix ethtool private flags
   84c68b621e90 ARM: dts: DRA76-EVM: Set powerhold property for tps65917
   3d07d9f2eebb vt: change SGR 21 to follow the standards
   48eaa5be295c Input: i8042 - enable MUX on Sony VAIO VGN-CS series to fix touchpad
   fd50992f99c2 Input: i8042 - add Lenovo ThinkPad L460 to i8042 reset list
   ec46704f08e8 Input: ALPS - fix TrackStick detection on Thinkpad L570 and Latitude 7370
   9abdc666b793 Revert "base: arch_topology: fix section mismatch build warnings"
   f1fcba111d9e staging: comedi: ni_mio_common: ack ai fifo error interrupts.
   21f07630e75f Btrfs: fix unexpected cow in run_delalloc_nocow
   e847da275f04 crypto: x86/cast5-avx - fix ECB encryption when long sg follows short one
   860783c283c8 crypto: arm,arm64 - Fix random regeneration of S_shipped
   493601f76734 crypto: ccp - return an actual key size from RSA max_size callback
   7abca04ef3a0 crypto: caam - Fix null dereference at error path
   48b9d82caba8 crypto: ahash - Fix early termination in hash walk
   4010d75d2eb4 crypto: talitos - fix IPsec cipher in length
   05c93fe33f94 crypto: testmgr - Fix incorrect values in PKCS#1 test vector
   c3c97a9f2f52 crypto: inside-secure - fix clock management
   7bc247d1fd68 crypto: talitos - don't persistently map req_ctx->hw_context and req_ctx->buf
   27036ade0732 crypto: lrw - Free rctx->ext with kzfree
   5afddba2aaae parport_pc: Add support for WCH CH382L PCI-E single parallel port card.
   39fd6d094397 media: usbtv: prevent double free in error case
   9b664c6a9f68 /dev/mem: Avoid overwriting "err" in read_mem()
   3cde7e2ccec6 mei: remove dev_err message on an unsupported ioctl
   29361c257631 serial: 8250: Add Nuvoton NPCM UART
   ffed9ae46844 USB: serial: cp210x: add ELDAT Easywave RX09 id
   b8541b3dc59c USB: serial: ftdi_sio: add support for Harman FirmwareHubEmulator
   6693f178c9ab USB: serial: ftdi_sio: add RT Systems VX-8 cable
   b5abde6ca2d2 bitmap: fix memset optimization on big-endian systems
   7b2dcf7cc456 drm/i915/dp: Write to SET_POWER dpcd to enable MST hub.
   886125faf5d1 Bluetooth: Fix missing encryption refresh on Security Request
   8f723a276a4d phy: qcom-ufs: add MODULE_LICENSE tag
   a192706b71fa netfilter: x_tables: add and use xt_check_proc_name
   7ab7e3e2a0d4 netfilter: drop template ct when conntrack is skipped.
   c16c62bb4d9f l2tp: fix races with ipv4-mapped ipv6 addresses
   dd19573992b5 netfilter: bridge: ebt_among: add more missing match size checks
   8f4ed22f6b5e netfilter: x_tables: make allocation less aggressive
   5bb3f4acc8aa percpu: add __GFP_NORETRY semantics to the percpu balancing path
   c7f2bd1850a8 xfrm: Refuse to insert 32 bit userspace socket policies on 64 bit systems
   94f84ba56f3d net: xfrm: use preempt-safe this_cpu_read() in ipcomp_alloc_tfms()
   e13d781171fb ipv6: fix possible deadlock in rt6_age_examine_exception()
   b2bf2cb68880 RDMA/ucma: Introduce safer rdma_addr_size() variants
   f55b41ce03a7 RDMA/ucma: Check that device exists prior to accessing it
   c0cbbca14176 RDMA/ucma: Check that device is connected prior to access it
   c88aaa5ab28a RDMA/rdma_cm: Fix use after free race with process_one_req
   5eb56dd0ba03 RDMA/ucma: Ensure that CM_ID exists prior to access it
   0b17ac3f080d RDMA/ucma: Fix use-after-free access in ucma_close
   a6474d6ef156 RDMA/ucma: Check AF family prior resolving address
   7df65ad1d45a xfrm_user: uncoditionally validate esn replay attribute struct
   abb971a27ed5 partitions/msdos: Unable to mount UFS 44bsd partitions
   cc842a34bfb2 powerpc/64s: Fix i-side SLB miss bad address handler saving nonvolatile GPRs
   f8e68e8f8db5 powerpc/64s: Fix lost pending interrupt due to race causing lost update to irq_happened
   5c0b4a907396 powerpc/mm: Workaround Nest MMU bug with TLB invalidations
   d657375f3616 powerpc/mm: Add tracking of the number of coprocessors using a context
   b61312ebb1c9 i2c: i2c-stm32f7: fix no check on returned setup
   19254443adf9 ipc/shm.c: add split function to shm_vm_ops
   f2fb59601631 ceph: only dirty ITER_IOVEC pages for direct read
   9b5b7c382e11 perf/hwbp: Simplify the perf-hwbp code, fix documentation
   a408b211f579 x86/platform/uv/BAU: Add APIC idt entry
   740aa1579526 ALSA: pcm: potential uninitialized return values
   4321a749661b ALSA: pcm: Use dma_bytes as size parameter in dma_mmap_coherent()
   5891c83b01ad ALSA: usb-audio: Add native DSD support for TEAC UD-301
   6aa2e5ddc3cd mtd: nand: atmel: Fix get_sectorsize() function
   e80deb59802c mtd: jedec_probe: Fix crash in jedec_read_mfr()
   26692e9a0aaf ARM: dts: sun6i: a31s: bpi-m2: add missing regulators
   acc7f0201fc3 ARM: dts: sun6i: a31s: bpi-m2: improve pmic properties
   955901702381 ARM: 8746/1: vfp: Go back to clearing vfp_current_hw_state[]
   37496fe93169 ARM: OMAP: Fix SRAM W+X mapping
   ae0a11b2bd33 Linux 4.15.15
   ab58638491e1 team: Fix double free in error path
   a21aaaf921ab skbuff: Fix not waking applications when errors are enqueued
   0a5c5886c3b4 qede: Fix qedr link update
   71aa561fa21b net: systemport: Rewrite __bcm_sysport_tx_reclaim()
   347de2ecf61b net: Only honor ifindex in IP_PKTINFO if non-0
   ffa24344d004 netlink: avoid a double skb free in genlmsg_mcast()
   b471f6727288 net/iucv: Free memory obtained by kzalloc
   24f6021c26ef net: fec: Fix unbalanced PM runtime calls
   fbc1ee88e866 net: ethernet: ti: cpsw: add check for in-band mode setting with RGMII PHY interface
   41d133c01d20 net: ethernet: arc: Fix a potential memory leak if an optional regulator is deferred
   8e903f508390 l2tp: do not accept arbitrary sockets
   f1c344162052 ipv6: fix access to non-linear packet in ndisc_fill_redirect_hdr_option()
   5df0f40809d4 dccp: check sk for closed state in dccp_sendmsg()
   01a82ba817fc dpaa_eth: remove duplicate increment of the tx_errors counter
   8e84c72fe1b7 dpaa_eth: increment the RX dropped counter when needed
   d50884855ed0 dpaa_eth: remove duplicate initialization
   e9b0efd5940c dpaa_eth: fix error in dpaa_remove()
   5b10a404419f soc/fsl/qbman: fix issue in qman_delete_cgr_safe()
   2a00d08da9ff s390/qeth: on channel error, reject further cmd requests
   e992c8b81cd0 s390/qeth: lock read device while queueing next buffer
   4b6cd4820c66 s390/qeth: when thread completes, wake up all waiters
   657a7148bd4b s390/qeth: free netdevice when removing a card
   aac53ed860ee net: Fix hlist corruptions in inet_evict_bucket()
   5eb1b63557d8 net: use skb_to_full_sk() in skb_update_prio()
   7d7d04a6e6d5 ieee802154: 6lowpan: fix possible NULL deref in lowpan_device_event()
   a69b268ae27d sch_netem: fix skb leak in netem_enqueue()
   b6b64dea97e0 kcm: lock lower socket in kcm_attach
   b1bb7e6aa293 test_rhashtable: add test case for rhltable with duplicate objects
   93589a0ae7e7 rhashtable: Fix rhlist duplicates insertion
   8b24af17d5fc ppp: avoid loop in xmit recursion detection code
   a1209e98ff49 net sched actions: return explicit error when tunnel_key mode is not specified
   37c446138df8 ipv6: Reflect MTU changes on PMTU of exceptions for MTU-less routes
   9401d455a739 net: phy: Tell caller result of phy_change()
   33dcdffc31e5 mlxsw: spectrum_buffers: Set a minimum quota for CPU port traffic
   af1ba7e5e0cd ipv6: sr: fix scheduling in RCU when creating seg6 lwtunnel state
   68e01f404461 ipv6: sr: fix NULL pointer dereference when setting encap source address
   7340d647447f ipv6: old_dport should be a __be16 in __ip6_datagram_connect()
   812cb9e2340d net: ipv6: keep sk status consistent after datagram connect failure
   f09036d3d61c macvlan: filter out unsupported feature flags
   2076d28a639e devlink: Remove redundant free on error path
   9c94855066d3 net: phy: relax error checking when creating sysfs link netdev->phydev
   956c93369149 sysfs: symlink: export sysfs_create_link_nowarn()
   986468a18f78 qed: Fix non TCP packets should be dropped on iWARP ll2 connection
   960058fe1963 tcp: purge write queue upon aborting the connection
   10849a12c052 qed: Fix MPA unalign flow in case header is split across two packets.
   cce2b12ee5af openvswitch: meter: fix the incorrect calculation of max delta_t
   1759a5455f7d net: dsa: Fix dsa_is_user_port() test inversion
   0ba3b3aac901 Linux 4.15.14
   9c5ee9934c90 bpf, x64: increase number of passes
   18a9e4d888d6 bpf: skip unnecessary capability check
   700082a54165 kbuild: disable clang's default use of -fmerge-all-constants
   c7674a71bc38 staging: android: ion: Zero CMA allocated memory
   e8689b8bbae9 iio: imu: st_lsm6dsx: introduce conf_lock mutex
   0757dce21913 iio: imu: st_lsm6dsx: fix endianness in st_lsm6dsx_read_oneshot()
   b7a6e26b331d iio: ABI: Fix name of timestamp sysfs file
   b844443b8e89 perf/x86/intel/uncore: Fix multi-domain PCI CHA enumeration bug on Skylake servers
   190e67640d20 perf/x86/intel: Don't accidentally clear high bits in bdw_limit_period()
   a002966e849b trace/bpf: remove helper bpf_perf_prog_read_value from tracepoint type programs
   e623ff1aceff perf/core: Fix ctx_event_type in ctx_resched()
   f736f6560e04 perf stat: Fix CVS output format for non-supported counters
   b42e3e521999 perf/x86/intel/uncore: Fix Skylake UPI event format
   7d4e27d30070 hwmon: (k10temp) Add temperature offset for Ryzen 1900X
   1a0d6102cd02 hwmon: (k10temp) Only apply temperature offset if result is positive
   591b6ad1ddbc x86/boot/64: Verify alignment of the LOAD segment
   b3d1a5bc0e47 x86/build/64: Force the linker to use 2MB page size
   8c42170a40fb kvm/x86: fix icebp instruction handling
   ab26ea17a6dc posix-timers: Protect posix clock array access against speculation
   cd7abf600406 x86/efi: Free efi_pgd with free_pages()
   279ebed98bb2 x86/vsyscall/64: Use proper accessor to update P4D entry
   1e4ed1727e2a selftests/x86/ptrace_syscall: Fix for yet more glibc interference
   69a71b6b418c x86/entry/64: Don't use IST entry for #BP stack
   64c98ba6ddb5 tty: vt: fix up tabstops properly
   dfde88160d7b can: cc770: Fix use after free in cc770_tx_interrupt()
   89fc6c01aae9 can: cc770: Fix queue stall & dropped RTR reply
   f543d85120e1 can: cc770: Fix stalls on rt-linux, remove redundant IRQ ack
   f29397c91e05 can: ifi: Check core revision upon probe
   717885b66fb8 can: ifi: Repair the error handling
   4f39b4fd443c can: peak/pcie_fd: remove useless code when interface starts
   054317e751c7 can: peak/pcie_fd: fix echo_skb is occupied! bug
   9a6730ae707b staging: ncpfs: memory corruption in ncp_read_kernel()
   7b6f657ad598 mtd: nand: fsl_ifc: Read ECCSTAT0 and ECCSTAT1 registers for IFC 2.0
   7cc7ee831a35 mtd: nand: fsl_ifc: Fix eccstat array overflow for IFC ver >= 2.0.0
   1d65c538a1e1 mtd: nand: fsl_ifc: Fix nand waitfunc return value
   a49c7c336348 mtdchar: fix usage of mtd_ooblayout_ecc()
   9b474cd0749d tracing: probeevent: Fix to support minus offset from symbol
   d2e051d5d636 rtlwifi: rtl8723be: Fix loss of signal
   8c210a84ed36 brcmfmac: fix P2P_DEVICE ethernet address generation
   6b7ece4accf1 libnvdimm, {btt, blk}: do integrity setup before add_disk()
   0cb158fadfd5 ACPI / watchdog: Fix off-by-one error at resource assignment
   b0b2d4f74b72 acpi, numa: fix pxm to online numa node associations
   517f745e5e64 module: propagate error in modules_open()
   c8f7955b5493 mm/vmscan: wake up flushers for legacy cgroups too
   01592437b0ec drm: udl: Properly check framebuffer mmap offsets
   1554edbbb723 drm: Reject getfb for multi-plane framebuffers
   f6b53a429e65 drm/amd/display: Add one to EDID's audio channel count when passing to DC
   fa81f6281879 drm/amd/display: We shouldn't set format_default on plane as atomic driver
   19f2fd88d999 drm/radeon: Don't turn off DP sink when disconnected
   5001c04d08bb drm/vmwgfx: Fix a destoy-while-held mutex problem.
   b7c3cc858b02 drm/vmwgfx: Fix black screen and device errors when running without fbdev
   f981611c4ae3 Revert "mm: page_alloc: skip over regions of invalid pfns where possible"
   d3d155da63b9 mm/shmem: do not wait for lock_page() in shmem_unused_huge_shrink()
   29c11d86b74f mm/thp: do not wait for lock_page() in deferred_split_scan()
   babe10f62b6b mm/khugepaged.c: convert VM_BUG_ON() to collapse fail
   63da3be586bb x86/mm: implement free pmd/pte page interfaces
   0454e2fad930 mm/vmalloc: add interfaces to free unmapped page table
   6104f7df1e22 h8300: remove extraneous __BIG_ENDIAN definition
   e0fdb5385c4b hugetlbfs: check for pgoff value overflow
   2800f9c188c7 media: tegra-cec: reset rx_buf_cnt when start bit detected
   0f44e9da465e nfsd: remove blocked locks on client teardown
   401c02d7c9b5 cgroup: fix rule checking for threaded mode switching
   6823e0efcb01 sched, cgroup: Don't reject lower cpu.max on ancestors
   aa0832d01611 libata: Modify quirks for MX100 to limit NCQ_TRIM quirk to MU01 version
   85fd780b26aa libata: Make Crucial BX100 500GB LPM quirk apply to all firmware versions
   a3121f28e584 libata: Apply NOLPM quirk to Crucial M500 480 and 960GB SSDs
   a51206d6a1c3 libata: Enable queued TRIM for Samsung SSD 860
   2cd5b672744b libata: disable LPM for Crucial BX100 SSD 500GB drive
   3c23829899da libata: Apply NOLPM quirk to Crucial MX100 512GB SSDs
   0f849a36c2c3 libata: don't try to pass through NCQ commands to non-NCQ devices
   25af1a9219d6 libata: remove WARN() for DMA or PIO command without data
   b679d0e7d685 libata: fix length validation of ATAPI-relayed SCSI commands
   7ec32f585fef Bluetooth: btusb: Fix quirk for Atheros 1525/QCA6174
   a7f0ce743bfe Bluetooth: btusb: Add Dell OptiPlex 3060 to btusb_needs_reset_resume_table
   ee1195515988 Bluetooth: btusb: Remove Yoga 920 from the btusb_needs_reset_resume_table
   6c927e37a857 pinctrl: samsung: Validate alias coming from DT
   98bb0e40fa7f Drivers: hv: vmbus: Fix ring buffer signaling
   8fe98b2177a9 RDMA/mlx5: Fix crash while accessing garbage pointer and freed memory
   808176cd9eeb clk: sunxi-ng: a31: Fix CLK_OUT_* clock ops
   c3c66b380218 clk: bcm2835: Protect sections updating shared registers
   318078995410 clk: bcm2835: Fix ana->maskX definitions
   cb5cfed66ebc lockdep: fix fs_reclaim warning
   b5f2a5c3c09c ahci: Add PCI-id for the Highpoint Rocketraid 644L card
   23a6254a4ddf PCI: Add function 1 DMA alias quirk for Highpoint RocketRAID 644L
   5b863a4deb8b mmc: dw_mmc: fix falling from idmac to PIO mode when dw_mci_reset occurs
   8049c2c413da mmc: dw_mmc: exynos: fix the suspend/resume issue for exynos5433
   b4a2de90aeb6 mmc: dw_mmc: Fix the DTO/CTO timeout overflow calculation for 32-bit systems
   40888f31f9cf mmc: block: fix updating ext_csd caches on ioctl call
   836b7527a839 mmc: core: Disable HPI for certain Micron (Numonyx) eMMC cards
   1e0ca4f53915 mmc: core: Fix tracepoint print of blk_addr and blksz
   b49428a00020 ALSA: hda/realtek - Always immediately update mute LED with pin VREF
   291bebca94a0 ALSA: hda/realtek - Fix Dell headset Mic can't record
   953434bdd33e ALSA: hda/realtek - Fix speaker no sound after system resume
   1082b81751dd ALSA: hda - Force polling mode on CFL for fixing codec communication
   33cc51d03b60 ALSA: aloop: Fix access to not-yet-ready substream via cable
   66ef51a5c402 ALSA: aloop: Sync stale timer before release
   771782b6fb94 ALSA: usb-audio: Fix parsing descriptor of UAC2 processing unit
   32e6d1ee98ab iio: adc: meson-saradc: unlock on error in meson_sar_adc_lock()
   e1db7d19c6fa iio: st_pressure: st_accel: pass correct platform data to init
   805a995cb8a3 iio: chemical: ccs811: Corrected firmware boot/application mode transition
   f047d3d7f86d MIPS: lantiq: ase: Enable MFD_SYSCON
   ea8cbb7cc71b MIPS: lantiq: Enable AHB Bus for USB
   6b26df694632 MIPS: lantiq: Fix Danube USB clock
   2dcbf520510c MIPS: ralink: Fix booting on MT7621
   fb43da3ac012 MIPS: ralink: Remove ralink_halt()

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
index c5d3ee03fd28..004f3b666f90 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "91084d030bc841c483c31e8664289c7940aa5506"
-SRCREV_meta ?= "939d935b0c992c6f1e51a7a1c9e4fbe6ef3c3174"
+SRCREV_machine ?= "260fd9356917fb3bd73abd36a6bdd7df402ef1a1"
+SRCREV_meta ?= "125963a34eebf4ee3d2b62d97c8090d912c8eb03"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.15.13"
+LINUX_VERSION ?= "4.15.18"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
index 05b9ca38b2df..575d3fe04648 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.15.13"
+LINUX_VERSION ?= "4.15.18"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "91084d030bc841c483c31e8664289c7940aa5506"
-SRCREV_meta ?= "939d935b0c992c6f1e51a7a1c9e4fbe6ef3c3174"
+SRCREV_machine ?= "260fd9356917fb3bd73abd36a6bdd7df402ef1a1"
+SRCREV_meta ?= "125963a34eebf4ee3d2b62d97c8090d912c8eb03"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
index 70bd7118bd01..f1233fd9faf8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "v4.15/standard/base"
 KBRANCH_qemux86-64 ?= "v4.15/standard/base"
 KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "4b6902b42f47593928117b2ff0900cd965cf6443"
-SRCREV_machine_qemuarm64 ?= "91084d030bc841c483c31e8664289c7940aa5506"
-SRCREV_machine_qemumips ?= "19ba2d843750ff65d8fe590acdfc99aea6153945"
-SRCREV_machine_qemuppc ?= "91084d030bc841c483c31e8664289c7940aa5506"
-SRCREV_machine_qemux86 ?= "91084d030bc841c483c31e8664289c7940aa5506"
-SRCREV_machine_qemux86-64 ?= "91084d030bc841c483c31e8664289c7940aa5506"
-SRCREV_machine_qemumips64 ?= "97000c3f4664643bac7828bbdc048f7ec216cc31"
-SRCREV_machine ?= "91084d030bc841c483c31e8664289c7940aa5506"
-SRCREV_meta ?= "939d935b0c992c6f1e51a7a1c9e4fbe6ef3c3174"
+SRCREV_machine_qemuarm ?= "5400ff2d394e933487c7d3d16d1a295d850232e5"
+SRCREV_machine_qemuarm64 ?= "260fd9356917fb3bd73abd36a6bdd7df402ef1a1"
+SRCREV_machine_qemumips ?= "9e9b14f6ef913ea00a01dc0766666f2c86f5bc63"
+SRCREV_machine_qemuppc ?= "260fd9356917fb3bd73abd36a6bdd7df402ef1a1"
+SRCREV_machine_qemux86 ?= "260fd9356917fb3bd73abd36a6bdd7df402ef1a1"
+SRCREV_machine_qemux86-64 ?= "260fd9356917fb3bd73abd36a6bdd7df402ef1a1"
+SRCREV_machine_qemumips64 ?= "0175d25d470adf5604a59b020a6de86493b1a78e"
+SRCREV_machine ?= "260fd9356917fb3bd73abd36a6bdd7df402ef1a1"
+SRCREV_meta ?= "125963a34eebf4ee3d2b62d97c8090d912c8eb03"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.15.13"
+LINUX_VERSION ?= "4.15.18"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.5.0


