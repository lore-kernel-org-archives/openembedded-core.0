Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B7AEE77DB6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 15:04:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6BF4Sf5005943
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Jul 2017 08:04:28 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 11 Jul 2017 08:04:27 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 11 Jul 2017 11:04:20 -0400
Message-ID: <2d458f4eb6fda069a63ca02fd94c42cc6befc802.1499784588.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1499784588.git.bruce.ashfield@windriver.com>
References: <cover.1499784588.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/4.9: update to v4.9.36
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
X-List-Received-Date: Tue, 11 Jul 2017 15:04:27 -0000
Content-Type: text/plain

Integrating the -stable release with the following commits:

   9f86f302ec0e Linux 4.9.36
   a29fd27ca268 KVM: nVMX: Fix exception injection
   d1d3756f07da KVM: x86: zero base3 of unusable segments
   f3c3ec96e5fb KVM: x86/vPMU: fix undefined shift in intel_pmu_refresh()
   1eeb79426332 KVM: x86: fix emulation of RSM and IRET instructions
   982d8d92f256 arm64: fix NULL dereference in have_cpu_die()
   a4bfcab30928 mtd: nand: brcmnand: Check flash #WP pin status before nand erase/program
   de5862335ed7 i2c: brcmstb: Fix START and STOP conditions
   8ee785016d5a brcmfmac: avoid writing channel out of allocated array
   65fc82cea84f infiniband: hns: avoid gcc-7.0.1 warning for uninitialized data
   3e51ccbadd15 objtool: Fix another GCC jump table detection issue
   92e66676523a clk: scpi: don't add cpufreq device if the scpi dvfs node is disabled
   8a6f400a374c cpufreq: s3c2416: double free on driver init error path
   1781a29b31fa iommu/amd: Fix interrupt remapping when disable guest_mode
   0e55856b8f29 iommu/amd: Fix incorrect error handling in amd_iommu_bind_pasid()
   f0c31c674abd iommu/dma: Don't reserve PCI I/O windows
   d7fcb303d1ee iommu: Handle default domain attach failure
   c19bfc6765d4 iommu/vt-d: Don't over-free page table directories
   d5c5e8ba5d9d ocfs2: o2hb: revert hb threshold to keep compatible
   8af88a950b42 x86/mm: Fix flush_tlb_page() on Xen
   3667dafd6c04 x86/mpx: Correctly report do_mpx_bt_fault() failures to user-space
   b287ade87c91 x86/boot/KASLR: Fix kexec crash due to 'virt_addr' calculation bug
   15541e64163c tools arch: Sync arch/x86/lib/memcpy_64.S with the kernel
   a2c222bef08f ARM: 8685/1: ensure memblock-limit is pmd-aligned
   7661b19687b2 ARM64/ACPI: Fix BAD_MADT_GICC_ENTRY() macro implementation
   4efe34b500a7 ARM: dts: OMAP3: Fix MFG ID EEPROM
   07bb2c7e7ea3 ARM: OMAP2+: omap_device: Sync omap_device and pm_runtime after probe defer
   e57aa416ca4c regulator: tps65086: Fix DT node referencing in of_parse_cb
   88baad2e7159 regulator: tps65086: Fix expected switch DT node names
   9846c67974d6 spi: fix device-node leaks
   c52829f60f5f spi: When no dma_chan map buffers with spi_master's parent
   478273e11521 sched/loadavg: Avoid loadavg spikes caused by delayed NO_HZ accounting
   eea0261db8ef watchdog: bcm281xx: Fix use of uninitialized spinlock.
   4211442b2088 netfilter: use skb_to_full_sk in ip_route_me_harder
   ac2730234cc1 xfrm: Oops on error in pfkey_msg2xfrm_state()
   c460f2beb6f0 xfrm: NULL dereference on allocation failure
   1e1666257cb6 xfrm: fix stack access out of bounds with CONFIG_XFRM_SUB_POLICY
   647f605276c0 mm/vmalloc.c: huge-vmap: fail gracefully on unexpected huge vmap mappings
   f9f73c58feef ravb: Fix use-after-free on `ifconfig eth0 down`
   adfe95fe5b42 ip6_tunnel, ip6_gre: fix setting of DSCP on encapsulated packets
   168bd51ec5ef sctp: check af before verify address in sctp_addr_id2transport
   399566f8a4fb net/mlx4_core: Eliminate warning messages for SRQ_LIMIT under SRIOV
   b6f75b986a7f perf probe: Fix to probe on gcc generated functions in modules
   9f8ffe4e0952 tipc: allocate user memory with GFP_KERNEL flag
   18b200e0c8ee net: phy: dp83867: allow RGMII_TXID/RGMII_RXID interface types
   e1eac347d971 perf probe: Fix to show correct locations for events on modules
   cc439964fab1 be2net: fix MAC addr setting on privileged BE3 VFs
   02434def6fd0 be2net: don't delete MAC on close on unprivileged BE3 VFs
   fa1dbf505aef be2net: fix status check in be_cmd_pmac_add()
   5f54c4e1e2af usb: dwc2: gadget: Fix GUSBCFG.USBTRDTIM value
   0e9867b7113c s390/ctl_reg: make __ctl_load a full memory barrier
   9d00195bc0af swiotlb: ensure that page-sized mappings are page-aligned
   68a5dc385735 coredump: Ensure proper size of sparse core files
   d21816c24591 aio: fix lock dep warning
   82835fb33ce5 perf/x86: Reject non sampling events with precise_ip
   1c68633329d2 perf/core: Fix sys_perf_event_open() vs. hotplug
   48131dd0f2b1 x86/mpx: Use compatible types in comparison to fix sparse error
   283994074501 x86/tsc: Add the Intel Denverton Processor to native_calibrate_tsc()
   6baa8c92dab9 mac80211: initialize SMPS field in HT capabilities
   8eaaf66d41ad pmem: return EIO on read_pmem() failure
   25319ae8e8a7 drm/amd/powerplay: refine vce dpm update code on Cz.
   f275ac7fc5d2 drm/amd/powerplay: fix vce cg logic error on CZ/St.
   77e82094a3c9 drm/radeon/si: load special ucode for certain MC configs
   4ae8dc6acb71 net: thunderx: acpi: fix LMAC initialization
   f88f06e18318 arm64: assembler: make adr_l work in modules under KASLR
   aabb797b4c12 spi: davinci: use dma_mapping_error()
   c32462d0b523 scsi: lpfc: avoid double free of resource identifiers
   582c1ca0ea1d HID: i2c-hid: Add sleep between POWER ON and RESET
   c78b8de5c05c perf/x86/intel: Use ULL constant to prevent undefined shift behaviour
   6130fac99481 mac80211: recalculate min channel width on VHT opmode changes
   d48cb21fd50b net: phy: marvell: fix Marvell 88E1512 used in SGMII mode
   849f2d0665e0 pinctrl: intel: Set pin direction properly
   3a6edbc95ba0 perf/x86/intel/uncore: Fix hardcoded socket 0 assumption in the Haswell init code
   b8c5e7b12413 drm/etnaviv: trick drm_mm into giving out a low IOVA
   2bc8fcd633d8 Documentation: devicetree: change the mediatek ethernet compatible string
   c5c8743642ae kernel/panic.c: add missing \n
   00f468f51dd5 ibmveth: Add a proper check for the availability of the checksum features
   32bd4d2ed9d8 vxlan: do not age static remote mac entries
   b07bf2364605 ip6_tunnel: must reload ipv6h in ip6ip6_tnl_xmit()
   7fdc81f6e1a9 virtio_net: fix PAGE_SIZE > 64k
   a6c3e01bf32e mlxsw: spectrum_router: Correctly reallocate adjacency entries
   ff3b1dd026bb vfio/spapr: fail tce_iommu_attach_group() when iommu_data is null
   8895ef4e5357 drm/amdgpu: check ring being ready before using
   e5a2ba9af818 net: dsa: Check return value of phy_connect_direct()
   c6f284899e01 amd-xgbe: Check xgbe_init() return code
   e99d86d76eed platform/x86: ideapad-laptop: handle ACPI event 1
   e9a87e0f5bbb iwlwifi: fix kernel crash when unregistering thermal zone
   322baf72eed5 scsi: virtio_scsi: Reject commands when virtqueue is broken
   5d5c293af834 xen-netfront: Fix Rx stall during network stress and OOM
   72191c7d82e7 swiotlb-xen: update dev_addr after swapping pages
   884baf2abf6d virtio_console: fix a crash in config_work_handler
   c3eab85ff11a Btrfs: fix truncate down when no_holes feature is enabled
   e8b5068b64d0 Btrfs: Fix deadlock between direct IO and fast fsync
   83571e9ef7c9 gianfar: Do not reuse pages from emergency reserve
   c48a862c47d4 objtool: Fix IRET's opcode
   251d00bf1309 bpf: don't trigger OOM killer under pressure with map alloc
   a7a2a6d34fe7 bnxt_en: Fix "uninitialized variable" bug in TPA code path.
   da805bc788b0 xen-netback: protect resource cleaning on XenBus disconnect
   7bdccaa5da12 xen-netback: fix memory leaks on XenBus disconnect
   5dcd08594276 net: ethtool: Initialize buffer when querying device channel settings
   6e315b2b10b6 powerpc/eeh: Enable IO path on permanent error
   ea7b808165a5 net: korina: Fix NAPI versus resources freeing
   fded17be01ab perf/x86/intel: Handle exclusive threadid correctly on CPU hotplug
   3eeb3459b7e6 net: phy: dp83848: add DP83620 PHY support
   10c24e89b2b8 drm/amdgpu: add support for new hainan variants
   9f2a36a7504c drm/amdgpu: fix program vce instance logic error.
   0c9626619777 qla2xxx: Fix erroneous invalid handle message
   8cfcaa2899f3 qla2xxx: Terminate exchange if corrupted
   42a1d5b47594 scsi: lpfc: Set elsiocb contexts to NULL after freeing it
   7782ab228f64 stmmac: add missing of_node_put
   ee4494c6bda8 scsi: sd: Fix wrong DPOFUA disable in sd_read_cache_type
   80b1a1180e4e KVM: x86: fix fixing of hypercalls
   afaee3ef5136 xen/blkback: don't free be structure too early
   13fa36f9fbc8 ARM64: dts: meson-gxbb-odroidc2: fix GbE tx link breakage
   8bface142a8d dt: bindings: net: use boolean dt properties for eee broken modes
   3897ae12b706 net: phy: use boolean dt properties for eee broken modes
   40373d91a0f7 net: phy: fix sign type error in genphy_config_eee_advert
   752ba680eb70 dt-bindings: net: add EEE capability constants
   97ace183074d net: phy: add an option to disable EEE advertisement
   0e8eca987e27 net: ethtool: add support for 2500BaseT and 5000BaseT link modes
   8886196a7320 sparc64: Zero pages on allocation for mondo and error queues.
   41172b772da4 sparc64: Handle PIO & MEM non-resumable errors.
   2aa6d036b716 mm: numa: avoid waiting on freed migrated pages
   08cb8e5f83fd l2tp: take a reference on sessions used in genetlink handlers
   599e6f038777 l2tp: hold session while sending creation notifications
   d9face6fc62a l2tp: fix duplicate session creation
   806e98835683 l2tp: ensure session can't get removed during pppol2tp_session_ioctl()
   6539c4f991c2 l2tp: fix race in l2tp_recv_common()
   d2da8d394147 usb: gadget: f_fs: Fix possibe deadlock
   ed96148d7f8e x86/mm: Fix boot crash caused by incorrect loop count calculation in sync_global_pgds()
   1c0fa383b339 dm thin: do not queue freed thin mapping for next stage processing
   466877f2d257 drm/vmwgfx: Free hash table allocated by cmdbuf managed res mgr
   78c4244f8bdb gpiolib: fix filtering out unwanted events
   cb2c6fdf620f NFSv4.1: Fix a race in nfs4_proc_layoutget
   7d0e27fe24c5 ALSA: hda - set input_path bitmap to zero after moving it to new place
   093750c3dec4 ALSA: hda - Fix endless loop of codec configure
   dad3135e762b MIPS: Fix IRQ tracing & lockdep when rescheduling
   e9e24faf823e MIPS: pm-cps: Drop manual cache-line alignment of ready_count
   f7d3d40ea124 MIPS: Avoid accidental raw backtrace
   3d4ac49a9538 MIPS: head: Reorder instructions missing a delay slot
   b1355226a64e mm, swap_cgroup: reschedule when neeed in swap_cgroup_swapoff()
   dbc808362b6c drm/ast: Handle configuration without P2A bridge
   8dc9f9dede5b xen/blkback: don't use xen_blkif_get() in xen-blkback kthread
   4ebe28d23d35 NFSv4.x/callback: Create the callback service through svc_create_pooled
   955f270b6f5d NFSv4: fix a reference leak caused WARNING messages
   b89bd0c715c1 netfilter: synproxy: fix conntrackd interaction
   ced7689be60d netfilter: xt_TCPMSS: add more sanity tests on tcph->doff
   8e2316399b8f rtnetlink: add IFLA_GROUP to ifla_policy
   b9ca9b0f5510 ipv6: Do not leak throw route references
   e4089baa08c4 sfc: provide dummy definitions of vswitch functions
   08058c258afb net: 8021q: Fix one possible panic caused by BUG_ON in free_netdev
   f1a0e7d172b0 decnet: always not take dst->__refcnt when inserting dst into hash table
   c7d422d68fe9 net/mlx5e: Fix timestamping capabilities reporting
   25ff35074e27 net/mlx5: Wait for FW readiness before initializing command interface
   176b9874a203 net/mlx5e: Avoid doing a cleanup call if the profile doesn't have it
   4c246863e7b4 sctp: return next obj by passing pos + 1 into sctp_transport_get_idx
   fded2d74a350 ipv6: fix calling in6_ifa_hold incorrectly for dad work
   cac2a9bb4034 igmp: add a missing spin_lock_init()
   ecd6627f48bd igmp: acquire pmc lock for ip_mc_clear_src()
   059686754c18 proc: snmp6: Use correct type in memset
   78b24ab695ab net/mlx5e: Fix wrong indications in DIM due to counter wraparound
   9854e5865990 net/mlx5e: Added BW check for DIM decision mechanism
   57360bc3c7a6 net: tipc: Fix a sleep-in-atomic bug in tipc_msg_reverse
   bb566ce3a60e net: caif: Fix a sleep-in-atomic bug in cfpkt_create_pfx
   8cda426a7cfa sctp: disable BH in sctp_for_each_endpoint
   c6d4ff85722b Fix an intermittent pr_emerg warning about lo becoming free.
   bb84290cd296 af_unix: Add sockaddr length checks before accessing sa_family in bind and connect handlers
   386ed38f0f28 net: vrf: Make add_fib_rules per network namespace flag
   b5cc68e0c190 net: Zero ifla_vf_info in rtnl_fill_vfinfo()
   fd9b13e6c175 decnet: dn_rtmsg: Improve input length sanitization in dnrmg_receive_user_skb
   d2f459e3feb0 net: don't call strlen on non-terminated string in dev_set_alias()
   98184bbb8dae ipv6: release dst on error in ip6_dst_lookup_tail
   92905e331aea Linux 4.9.35
   855b08e57777 brcmfmac: fix uninitialized warning in brcmf_usb_probe_phase2()
   21eaaa76b701 jump label: fix passing kbuild_cflags when checking for asm goto support
   ffa96c1a6afe net: phy: fix marvell phy status reading
   5da6415e427b spi: double time out tolerance
   25c7794ed046 dmaengine: bcm2835: Fix cyclic DMA period splitting
   81135c71bde3 net: phy: Initialize mdio clock at probe function
   948c4f17ab7e rt2x00: avoid introducing a USB dependency in the rt2x00lib module
   225969acc0f1 usb: gadget: f_fs: avoid out of bounds access on comp_desc
   5306119473b2 mtd: spi-nor: fix spansion quad enable
   dcd015f733a7 of: Add check to of_scan_flat_dt() before accessing initial_boot_params
   f20603874211 rxrpc: Fix several cases where a padded len isn't checked in ticket decode
   581659a87820 drm/amdgpu: adjust default display clock
   217e035d5120 drm/amdgpu/atom: fix ps allocation size for EnableDispPowerGating
   e4b8d1e84410 drm/radeon: add a quirk for Toshiba Satellite L20-183
   61ea7c2817bd drm/radeon: add a PX quirk for another K53TK variant
   3900f24aa6fa iscsi-target: Reject immediate data underflow larger than SCSI transfer length
   463440e6de4a iscsi-target: Fix delayed logout processing greater than SECONDS_FOR_LOGOUT_COMP
   1f576d53d854 target: Fix kref->refcount underflow in transport_cmd_finish_abort
   99f66b5182a4 arm64/vdso: Fix nsec handling for CLOCK_MONOTONIC_RAW
   a53bfdda06ac time: Fix CLOCK_MONOTONIC_RAW sub-nanosecond accounting
   02a37ccd6347 time: Fix clock->read(clock) race around clocksource changes
   c81d034bd09a brcmfmac: unbind all devices upon failure in firmware callback
   ba2d8d67875c brcmfmac: use firmware callback upon failure to load
   1dd15bd62221 brcmfmac: add parameter to pass error code in firmware callback
   20d8f785f974 Input: i8042 - add Fujitsu Lifebook AH544 to notimeout list
   8eaa481dfb4c powerpc/64s: Handle data breakpoints in Radix mode
   414f51ceb6ff powerpc/kprobes: Pause function_graph tracing during jprobes handling
   f719f20abe2a signal: Only reschedule timers on signals timers have sent
   99afebe8fef9 HID: Add quirk for Dell PIXART OEM mouse
   cdf300d6105d cxgb4: notify uP to route ctrlq compl to rdma rspq
   fb6dc831b5cf CIFS: Improve readdir verbosity
   2f1527e359f4 KVM: PPC: Book3S HV: Context-switch EBB registers properly
   468aa930c0a2 KVM: PPC: Book3S HV: Preserve userspace HTM state properly
   df3a787b3a71 KVM: s390: gaccess: fix real-space designation asce handling for gmap shadows
   5220378bd91c perf/x86/intel: Add 1G DTLB load/store miss support for SKL
   7c679fe729c2 lib/cmdline.c: fix get_options() overflow while parsing ranges
   bc6eecff3d95 autofs: sanity check status reported with AUTOFS_DEV_IOCTL_FAIL
   4b660fcbc64e powerpc/perf: Fix oops when kthread execs user process
   3d6848e491df fs/exec.c: account for argv/envp pointers
   552a14a572a2 ALSA: pcm: Don't treat NULL chmap as a fatal error
   8c9c55a0f576 ALSA: firewire-lib: Fix stall of process context at packet error
   4ae2cb91a636 xen-blkback: don't leak stack data via response ring
   e5c49c1703ae xen/blkback: fix disconnect while I/Os in flight
   0e051f17bd04 clk: sunxi-ng: a31: Correct lcd1-ch1 clock register offset
   493ecd5cd73e Linux 4.9.34
   ce7fe8595902 mm: fix new crash in unmapped_area_topdown()
   5d10ad629726 Allow stack to grow up to address space limit
   cfc0eb403816 mm: larger stack guard gap, between vmas
   04651048c79a alarmtimer: Rate limit periodic intervals
   b355b899c74a crypto: Work around deallocated stack frame reference gcc bug on sparc.
   7dfe7ca9ec12 vTPM: Fix missing NULL check
   ecae47331a43 MIPS: .its targets depend on vmlinux
   6b706cbb16e9 MIPS: Fix bnezc/jialc return address calculation
   22921a9e232a usb: dwc3: exynos fix axius clock error path to do cleanup
   f0ee203c864f usb: gadget: composite: Fix function used to free memory
   8ee7f06f4dca alarmtimer: Prevent overflow of relative timers
   766283254b67 genirq: Release resources in __setup_irq() error path
   8a48b7eace4d sched/core: Idle_task_exit() shouldn't use switch_mm_irqs_off()
   cf6ac3abb323 iio: imu: inv_mpu6050: add accel lpf setting for chip >= MPU6500
   f7ae7d2229d2 swap: cond_resched in swap_cgroup_prepare()
   1419b8752153 mm/memory-failure.c: use compound_head() flags for huge pages
   0c0d3d8730db USB: gadgetfs, dummy-hcd, net2280: fix locking for callbacks
   3ff5f4f6a8a7 USB: gadget: fix GPF in gadgetfs
   06178662474c usb: xhci: ASMedia ASM1042A chipset need shorts TX quirk
   4581d7dd44f3 usb: xhci: Fix USB 3.1 supported protocol parsing
   2abac4084fb9 drivers/misc/c2port/c2port-duramar2150.c: checking for NULL instead of IS_ERR()
   f28ba80c6a3e misc: mic: double free on ioctl error path
   02d009e865a8 ath10k: fix napi crash during rmmod when probe firmware fails
   07612c1227e8 usb: r8a66597-hcd: decrease timeout
   f75f4d196ab5 usb: r8a66597-hcd: select a different endpoint on timeout
   c8091f0e8549 USB: gadget: dummy_hcd: fix hub-descriptor removable fields
   374aceef5912 pvrusb2: reduce stack usage pvr2_eeprom_analyze()
   9ae5dac225e2 USB: usbip: fix nonconforming hub descriptor
   7b5bce3a5128 usb: core: fix potential memory leak in error path during hcd creation
   12bfbe157d06 USB: hub: fix SS max number of ports
   cb53a4e03b2f usb: gadget: udc: renesas_usb3: lock for PN_ registers access
   dd65c0958b77 usb: gadget: udc: renesas_usb3: fix deadlock by spinlock
   723bd3b9f83f usb: gadget: udc: renesas_usb3: fix pm_runtime functions calling
   b51e4b0ac661 IB/mlx5: Fix kernel to user leak prevention logic
   dca02651cee7 iio: adc: ti_am335x_adc: allocating too much in probe
   cf308c15103e iio: proximity: as3935: recalibrate RCO after resume
   56251d138570 iio: st_pressure: Fix data sign
   a1d51f7abf71 staging: iio: tsl2x7x_core: Fix standard deviation calculation
   773fdcdc0957 staging: rtl8188eu: prevent an underflow in rtw_check_beacon_data()
   ed13a9c6464b mfd: omap-usb-tll: Fix inverted bit use for USB TLL mode
   caa6f1c7bcbe x86/mm/32: Set the '__vmalloc_start_set' flag in initmem_init()
   ad3faea03fdf serial: sh-sci: Fix late enablement of AUTORTS
   a50aacf5de52 serial: efm32: Fix parity management in 'efm32_uart_console_get_options()'
   879d61f218a9 drm/vc4: Fix OOPSes from trying to cache a partially constructed BO.
   5899b635ecc7 drm/mediatek: fix mtk_hdmi_setup_vendor_specific_infoframe mistake
   5b754c994f38 mac80211: don't send SMPS action frame in AP mode when not needed
   3e8c503d0a16 mac80211: fix dropped counter in multiqueue RX
   6568f8f70152 mac80211: strictly check mesh address extension mode
   c8143269c9c4 mac80211: fix IBSS presp allocation size
   841e4e775bb1 mac80211: fix packet statistics for fast-RX
   f79d740f3289 mac80211: fix CSA in IBSS mode
   bd3f89002e52 usb: musb: dsps: keep VBUS on for host-only mode
   a317afc0c1ce drm/i915: Fix GVT-g PVINFO version compatibility check
   7f7bb1173db8 drm/amdgpu: Fix overflow of watermark calcs at > 4k resolutions.
   f6e99a2efc03 mac80211/wpa: use constant time memory comparison for MACs
   2ec5b68bf62e mac80211: don't look at the PM bit of BAR frames
   63d34ea7042a vb2: Fix an off by one error in 'vb2_plane_vaddr'
   5d5605cc5833 cpufreq: conservative: Allow down_threshold to take values from 1 to 10
   47537bceb7b7 ila_xlat: add missing hash secret initialization
   95f47cd7d7d8 can: gs_usb: fix memory leak in gs_cmd_reset()
   a6d6282040b7 configfs: Fix race between create_link and configfs_rmdir
   222aa34e5d79 fs: pass on flags in compat_writev
   050639ef5810 Linux 4.9.33
   bdc9a03fd9ce sparc64: make string buffers large enough
   933b9b11f7ca drm/i915: Always recompute watermarks when distrust_bios_wm is set, v2.
   4f59a7a895c4 drm/i915: Workaround VLV/CHV DSI scanline counter hardware fail
   8e1a4006ff92 s390/kvm: do not rely on the ILC on kvm host protection fauls
   a2f68276822c xtensa: don't use linux IRQ #0
   57211e84dda0 RDMA/qedr: Return max inline data in QP query result
   c5ea7aa57e24 RDMA/qedr: Don't spam dmesg if QP is in error state
   13a87589af5f RDMA/qedr: Don't reset QP when queues aren't flushed
   bbf61096e42c RDMA/qedr: Fix and simplify memory leak in PD alloc
   a4fa249385b6 RDMA/qedr: Dispatch port active event from qedr_add
   c47538f61016 netfilter: nft_log: restrict the log prefix length to 127
   fefdd79403e8 netfilter: nf_tables: fix set->nelems counting with no NLM_F_EXCL
   f68a45776a62 tipc: fix nametbl_lock soft lockup at node/link events
   1d6e36d730ed tipc: add subscription refcount to avoid invalid delete
   9f8df4f86a3f tipc: fix connection refcount error
   c7a552e771cc tipc: ignore requests when the connection state is not CONNECTED
   2552e2c11575 ARCv2: smp-boot: wake_flag polling by non-Masters needs to be uncached
   8cb6045ec40d ARC: smp-boot: Decouple Non masters waiting API from jump to entry point
   ae36f6a65af6 vhost/vsock: handle vhost_vq_init_access() error
   b13b3b706a9d kernel/watchdog: prevent false hardlockup on overloaded system
   0ce66ee6aec1 kernel/watchdog.c: move shared definitions to nmi.h
   b969a240448b kernel/watchdog.c: move hardlockup detector to separate file
   dbd9eee1aaaf userfaultfd: fix SIGBUS resulting from false rwsem wakeups
   9618fba26499 proc: add a schedule point in proc_pid_readdir()
   e23b1c05a50f frv: add missing atomic64 operations
   918684681dc2 frv: add atomic64_add_unless()
   013bbbc3e902 romfs: use different way to generate fsid for BLOCK or MTD
   093d494c6d1d mn10300: fix build error of missing fpu_save()
   5e4cafca06bf usb: musb: Fix external abort on non-linefetch for musb_irq_work()
   fb72eca1333c sctp: sctp_addr_id2transport should verify the addr before looking up assoc
   bf812fe92683 sctp: sctp gso should set feature with NETIF_F_SG when calling skb_segment
   12a583ddf02a bnxt_en: Fix RTNL lock usage on bnxt_get_port_module_status().
   66deb409251c bnxt_en: Fix RTNL lock usage on bnxt_update_link().
   e89ffe41e9a6 bnxt_en: Enhance autoneg support.
   710ea9b028de bnxt_en: Fix bnxt_reset() in the slow path task.
   cb7188295d18 net-next: ethernet: mediatek: change the compatible string
   e9ace99c4bb0 r8152: avoid start_xmit to schedule napi when napi is disabled
   c1a7106b3b01 r8152: fix rtl8152_post_reset function
   9507910ca46d r8152: re-schedule napi for tx
   4242f0bce47e r8152: check rx after napi is enabled
   993ba7ffcf6e r8152: avoid start_xmit to call napi_schedule during autosuspend
   6149abe7f404 nvmet-rdma: Fix missing dma sync to nvme data structures
   5a0d41409b4d nfs: Fix "Don't increment lock sequence ID after NFS4ERR_MOVED"
   d16268259683 ravb: unmap descriptors when freeing rings
   47c362f147aa drm/ast: Fixed system hanged if disable P2A
   bfa4d2e461da drm/nouveau: Fix drm poll_helper handling
   c94e2edacea7 drm/nouveau: Don't enabling polling twice on runtime resume
   c7a29cf6c34a drm/nouveau: Handle fbcon suspend/resume in seperate worker
   d2beb1a9dd82 drm/nouveau: Rename acpi_work to hpd_work
   ef66745a1bd2 drm/nouveau: Intercept ACPI_VIDEO_NOTIFY_PROBE
   eb846414674c gtp: add genl family modules alias
   7dddbfcd96e2 net: phy: micrel: add support for KSZ8795
   2f970b437e86 parisc, parport_gsc: Fixes for printk continuation lines
   4038524f7fef net/mlx5: Return EOPNOTSUPP when failing to get steering name-space
   b445ecbdff83 net/mlx5: E-Switch, Err when retrieving steering name-space fails
   2bcbe747629e drm/i915: Check for NULL i915_vma in intel_unpin_fb_obj()
   e6549f36278c net: adaptec: starfire: add checks for dma mapping errors
   a15bbf44ab2f pinctrl: berlin-bg4ct: fix the value for "sd1a" of pin SCRD0_CRD_PRES
   326fdffd7078 drm: Don't race connector registration
   82b6693bd415 drm: prevent double-(un)registration for connectors
   d934fe02ba17 cec: fix wrong last_la determination
   62614714e30a pinctrl: baytrail: Rectify debounce support (part 2)
   3564d41e5c84 gianfar: synchronize DMA API usage by free_skb_rx_queue w/ gfar_new_page
   581e4003bf12 net/mlx4_core: Avoid command timeouts during VF driver device shutdown
   c33f1bd7f289 drm/nouveau/fence/g84-: protect against concurrent access to semaphore buffers
   cf336eea809d drm/nouveau: prevent userspace from deleting client object
   16f733d8db52 ipv6: fix flow labels when the traffic class is non-0
   0542f9791246 FS-Cache: Initialise stores_lock in netfs cookie
   34f1a4626bad fscache: Clear outstanding writes when disabling a cookie
   11696dcea282 fscache: Fix dead object requeue
   f4d2d05ffb8b net: fix ndo_features_check/ndo_fix_features comment ordering
   3a6ebd3f963c net: phy: Fix PHY module checks and NULL deref in phy_attach_direct()
   ea14fabd43a5 net: phy: Fix lack of reference count on PHY driver
   2fba4f5b70f3 ethtool: do not vzalloc(0) on registers dump
   8de6ea44af5c log2: make order_base_2() behave correctly on const input value zero
   5331baaeb7e6 kasan: respect /proc/sys/kernel/traceoff_on_warning
   8936b74fd339 shmem: fix sleeping from atomic context
   3ec4141c68de jump label: pass kbuild_cflags when checking for asm goto support
   36d9659cde0d PM / runtime: Avoid false-positive warnings from might_sleep_if()
   40f6d71c0a09 ARM: defconfigs: make NF_CT_PROTO_SCTP and NF_CT_PROTO_UDPLITE built-in
   1cadd394bbf9 ipv6: Fix IPv6 packet loss in scenarios involving roaming + snooping switches
   d536202202ee vfio/spapr_tce: Set window when adding additional groups to container
   d385ed7ad307 ipv6: addrconf: fix generation of new temporary addresses
   d7b2b380c08d net: thunderx: Fix PHY autoneg for SGMII QLM mode
   baaa84b43608 kernel/ucount.c: mark user_header with kmemleak_ignore()
   c419fe260b54 powerpc/powernv: Properly set "host-ipi" on IPIs
   47a5aabc3424 i2c: piix4: Fix request_region size
   c1a4306f24a0 i2c: piix4: Request the SMBUS semaphore inside the mutex
   7a6fcf38fabb sierra_net: Add support for IPv6 and Dual-Stack Link Sense Indications
   9217eeefee15 sierra_net: Skip validating irrelevant fields for IDLE LSIs
   bed8b8627a33 net: hns: Fix the device being used for dma mapping during TX
   008798746e6e NET: mkiss: Fix panic
   ae0b63eb344e ibmvnic: Initialize completion variables before starting work
   4544ba3173b7 ibmvnic: Call napi_disable instead of napi_enable in failure path
   74e24d1ea1a4 NET: Fix /proc/net/arp for AX.25
   2557969fb4f7 gfs2: Use rhashtable walk interface in glock_hash_walk
   44bc7cae6031 tipc: Fix tipc_sk_reinit race conditions
   cb351da6f2ba ipv6: Inhibit IPv4-mapped src address on the wire.
   12ec2560d467 ipv6: Handle IPv4-mapped src to in6addr_any dst.
   116589a5a7e0 tcp: tcp_probe: use spin_lock_bh()
   a2901d01a6c7 net: xilinx_emaclite: fix receive buffer overflow
   bff3001afae7 net: xilinx_emaclite: fix freezes due to unordered I/O
   65e72723add0 ibmvnic: Fix endian error when requesting device capabilities
   b5a1aa812a16 ibmvnic: Fix endian errors in error reporting output
   d864e675c789 netfilter: nf_conntrack_sip: fix wrong memory initialisation
   220b67a16fde partitions/msdos: FreeBSD UFS2 file systems are not recognized
   7a7b2d5f65a7 drm/i915: Prevent the system suspend complete optimization
   b372d35a5226 PCI/PM: Add needs_resume flag to avoid suspend complete optimization
   05afd4c0af6a Linux 4.9.32
   3eb235a1af14 netfilter: nft_set_rbtree: handle element re-addition after deletion
   a8fc3159ee2c cpufreq: schedutil: Fix per-CPU structure initialization in sugov_start()
   afe8d4a51c76 cpufreq: schedutil: move cached_raw_freq to struct sugov_policy
   09fcb3561d9e drm/i915/vbt: split out defaults that are set when there is no VBT
   555c443a1ab9 drm/i915/vbt: don't propagate errors from intel_bios_init()
   a6a7d8ade88c usercopy: Adjust tests to deal with SMAP/PAN
   eefa5e13dff9 ARM: 8637/1: Adjust memory boundaries after reservations
   1df21f45fd55 ARM: 8636/1: Cleanup sanity_check_meminfo
   9e09d90ac5ac arm64: entry: improve data abort handling of tagged pointers
   1d61ccb5ac27 arm64: hw_breakpoint: fix watchpoint matching for tagged pointers
   791d94ef40f6 arm64: traps: fix userspace cache maintenance emulation on a tagged pointer
   d95202487334 serial: sh-sci: Fix panic when serial console and DMA are enabled
   9ff4a1a36a58 drivers: char: mem: Fix wraparound check to allow mappings up to the end
   106c77e82572 cpu/hotplug: Drop the device lock on error
   eb8fa317cb01 ASoC: Fix use-after-free at card unregistration
   82ecd2f054bd ALSA: timer: Fix missing queue indices reset at SNDRV_TIMER_IOCTL_SELECT
   66e982d8f1a1 ALSA: timer: Fix race between read and ioctl
   aae14f569f5d drm/nouveau/tmr: fully separate alarm execution/pending lists
   7860d0e5e2bf drm/vmwgfx: Make sure backup_handle is always valid
   a76ff847013a drm/vmwgfx: limit the number of mip levels in vmw_gb_surface_define_ioctl()
   64c21af51d71 drm/vmwgfx: Handle vmalloc() failure in vmw_local_fifo_reserve()
   3743c0e1276d perf/core: Drop kernel samples even though :u is specified
   6e6d89e18e53 powerpc/kernel: Initialize load_tm on task creation
   2cfdf4fd3292 powerpc/kernel: Fix FP and vector register restoration
   cbf687acc1e1 powerpc/hotplug-mem: Fix missing endian conversion of aa_index
   b4624ff952ec powerpc/numa: Fix percpu allocations to be NUMA aware
   bb0a300f18ce powerpc/sysdev/simple_gpio: Fix oops in gpio save_regs function
   59d9a40b5839 scsi: qla2xxx: Fix mailbox pointer error in fwdump capture
   64dc431432ec scsi: qla2xxx: Set bit 15 for DIAG_ECHO_TEST MBC
   ab2b484e8038 scsi: qla2xxx: Modify T262 FW dump template to specify same start/end to debug customer issues
   fe42472e53eb scsi: qla2xxx: don't disable a not previously enabled PCI device
   f75e09ebd3e4 KVM: arm/arm64: Handle possible NULL stage2 pud when ageing pages
   66d6448475c6 btrfs: fix memory leak in update_space_info failure path
   4d15ab90ec2b btrfs: use correct types for page indices in btrfs_page_exists_in_range
   3fd1233dabd5 cxl: Avoid double free_irq() for psl,slice interrupts
   172c70d1cd82 cxl: Fix error path on bad ioctl
   84bef90a454f ufs_getfrag_block(): we only grab ->truncate_mutex on block creation path
   3d4922b5bb5b ufs_extend_tail(): fix the braino in calling conventions of ufs_new_fragments()
   55a00f816bd7 ufs: set correct ->s_maxsize
   aed005fb7956 ufs: restore maintaining ->i_blocks
   bf7bfef3eee3 fix ufs_isblockset()
   4896c87d2464 ufs: restore proper tail allocation
   61604a2626a3 fs: add i_blocksize()
   829a1cab22c4 cpuset: consider dying css as offline
   5aa8f833ca78 Input: elantech - add Fujitsu Lifebook E546/E557 to force crc_enabled
   dff4c8bb1397 cgroup: Prevent kill_css() from being called more than once
   b59ec7072c84 ahci: Acer SA5-271 SSD Not Detected Fix
   b3a42bb630bd drm/msm: Expose our reservation object when exporting a dmabuf.
   974a4eb16e84 target: Re-add check to reject control WRITEs with overflow data
   96d7b43b42ba cpufreq: cpufreq_register_driver() should return -ENODEV if init fails
   acd8f9173960 mei: make sysfs modalias format similar as uevent modalias
   716dd37398ad iio: proximity: as3935: fix iio_trigger_poll issue
   bad3b49b01aa iio: proximity: as3935: fix AS3935_INT mask
   8067c911c5e9 iio: light: ltr501 Fix interchanged als/ps register field
   e33679f994db iio: adc: bcm_iproc_adc: swap primary and secondary isr handler's
   c5a8004434f0 staging/lustre/lov: remove set_fs() call from lov_getstripe()
   5404b0c0ea85 usb: chipidea: debug: check before accessing ci_role
   59db536f5812 usb: chipidea: udc: fix NULL pointer dereference if udc_start failed
   405ac24a0aec usb: gadget: f_mass_storage: Serialize wake and sleep execution
   1308eeec2fc5 drm: Fix oops + Xserver hang when unplugging USB drm devices
   c404f0dee7a8 ext4: fix fdatasync(2) after extent manipulation operations
   2e16921d1743 ext4: fix data corruption with EXT4_GET_BLOCKS_ZERO
   9890b9cb75c9 ext4: keep existing extra fields when inode expands
   9850844e0a0e ext4: fix SEEK_HOLE
   9636c086532b xen/privcmd: Support correctly 64KB page granularity when mapping memory
   08229c119c42 cfq-iosched: fix the delay of cfq_group's vdisktime under iops mode
   1f67d28d2707 dmaengine: mv_xor_v2: set DMA mask to 40 bits
   eb5afaba6177 dmaengine: mv_xor_v2: remove interrupt coalescing
   b2c8bb06bc83 dmaengine: mv_xor_v2: fix tx_submit() implementation
   0d0918504a96 dmaengine: mv_xor_v2: enable XOR engine after its configuration
   e2a092eab8a5 dmaengine: mv_xor_v2: do not use descriptors not acked by async_tx
   67b1684c4a5e dmaengine: mv_xor_v2: properly handle wrapping in the array of HW descriptors
   f08c84d4c745 dmaengine: mv_xor_v2: handle mv_xor_v2_prep_sw_desc() error properly
   f2e9d10bf1a2 dmaengine: ep93xx: Don't drain the transfers in terminate_all()
   b7e7a4d52a95 dmaengine: ep93xx: Always start from BASE0
   cd0ef520aa70 dmaengine: usb-dmac: Fix DMAOR AE bit definition
   3e7a76b290f1 KVM: arm/arm64: vgic-v2: Do not use Active+Pending state for a HW interrupt
   2a5c08a4d3fe KVM: arm/arm64: vgic-v3: Do not use Active+Pending state for a HW interrupt
   81555e45852a KVM: async_pf: avoid async pf injection when in guest mode
   85c19308cb37 arm: KVM: Allow unaligned accesses at HYP
   8abce1e49c82 arm64: KVM: Allow unaligned accesses at EL2
   b9824dd75fcf arm64: KVM: Preserve RES1 bits in SCTLR_EL2
   19c9a115085e KVM: cpuid: Fix read/write out-of-bounds vulnerability in cpuid emulation
   78f87ce2a17f kvm: async_pf: fix rcu_irq_enter() with irqs enabled
   4809f0e56d98 efi: Don't issue error message when booted under Xen
   e273ed246617 nfsd: Fix up the "supattr_exclcreat" attributes
   bfeac838043f nfsd4: fix null dereference on replay
   34bae9b3ba98 drm/amdgpu/ci: disable mclk switching for high refresh rates (v2)
   d4783eb9f082 crypto: gcm - wait for crypto op not signal safe
   2d0280070e6c crypto: drbg - wait for crypto op not signal safe
   d24c1c1977d8 KEYS: encrypted: avoid encrypting/decrypting stack buffers
   24369761029a KEYS: fix freeing uninitialized memory in key_update()
   1b253e023f8f KEYS: fix dereferencing NULL payload with nonzero length
   0e479742e8d1 crypto: asymmetric_keys - handle EBUSY due to backlog correctly
   7c24a70c70b7 ptrace: Properly initialize ptracer_cred on fork
   3802abc6e0df serial: ifx6x60: fix use-after-free on module unload
   04ac452dadbf arch/sparc: support NR_CPUS = 4096
   433a50e681df sparc64: delete old wrap code
   b6bb22de0c9e sparc64: new context wrap
   975f3cdc3915 sparc64: add per-cpu mm of secondary contexts
   7932bfad0e82 sparc64: redefine first version
   65e3443b61a8 sparc64: combine activate_mm and switch_mm
   e7590a1b15c8 sparc64: reset mm cpumask after wrap
   b3ad7a3e57b3 sparc: Machine description indices can vary
   8d665e039e66 sparc64: mm: fix copy_tsb to correctly copy huge page TSBs
   4b684e6474d0 sparc64: Add __multi3 for gcc 7.x and later.
   0255284edddc net: bridge: start hello timer only if device is up
   3dd4daf112fd net: stmmac: fix completely hung TX when using TSO
   a83564d12863 net: ethoc: enable NAPI before poll may be scheduled
   a97f807363d4 net/ipv6: Fix CALIPSO causing GPF with datagram support
   0aa89f1b07de net: ping: do not abuse udp_poll()
   599a4478d8cb ipv6: Fix leak in ipv6_gso_segment().
   c242e1a8140e vxlan: fix use-after-free on deletion
   3ee35b96825e tcp: disallow cwnd undo when switching congestion control
   61c92d5a533c cxgb4: avoid enabling napi twice to the same queue
   abbcb731d69c ipv6: xfrm: Handle errors reported by xfrm6_find_1stfragopt()
   b5e9b7ad0dd4 vxlan: eliminate cached dst leak
   96d145216b58 bnx2x: Fix Multi-Cos

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index f0e9180ac13c..6e18bd9628a2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ab749ed8fd7beb6c63ec62a808eac8678db83810"
-SRCREV_meta ?= "299f12a06ca1d6fd90b24450dae3b9f257a536be"
+SRCREV_machine ?= "1fb4e1d1e3f727fc20963fc631a259665bd4665b"
+SRCREV_meta ?= "0db0b4a408f05cfed359983d7ff63b1a6e29be2c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.31"
+LINUX_VERSION ?= "4.9.36"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 482e38c8ce8e..da5b2ea970aa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.9.31"
+LINUX_VERSION ?= "4.9.36"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d2de43e42bb8a270e680aab1c8f2447bff0b3552"
-SRCREV_meta ?= "299f12a06ca1d6fd90b24450dae3b9f257a536be"
+SRCREV_machine ?= "24572abb2cad341dd79e6aafcb9cdd1a7f8a0c1e"
+SRCREV_meta ?= "0db0b4a408f05cfed359983d7ff63b1a6e29be2c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index acfae37fb631..563c33d1ca16 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "734cdab9878ac73dbf43d8e7d14b07b9e3498c32"
-SRCREV_machine_qemuarm64 ?= "d2de43e42bb8a270e680aab1c8f2447bff0b3552"
-SRCREV_machine_qemumips ?= "59f4ca90a4bb47ce9c81508e3b8458b87f411d59"
-SRCREV_machine_qemuppc ?= "d2de43e42bb8a270e680aab1c8f2447bff0b3552"
-SRCREV_machine_qemux86 ?= "d2de43e42bb8a270e680aab1c8f2447bff0b3552"
-SRCREV_machine_qemux86-64 ?= "d2de43e42bb8a270e680aab1c8f2447bff0b3552"
-SRCREV_machine_qemumips64 ?= "5b396803703aa5c1bd1e6f5cc7ac02de05cd0d08"
-SRCREV_machine ?= "d2de43e42bb8a270e680aab1c8f2447bff0b3552"
-SRCREV_meta ?= "299f12a06ca1d6fd90b24450dae3b9f257a536be"
+SRCREV_machine_qemuarm ?= "a4390ba8db101907133990f8e31ebcd56869ac3b"
+SRCREV_machine_qemuarm64 ?= "24572abb2cad341dd79e6aafcb9cdd1a7f8a0c1e"
+SRCREV_machine_qemumips ?= "580682c29df5023d2cecaf6c4074d401c4b57b94"
+SRCREV_machine_qemuppc ?= "24572abb2cad341dd79e6aafcb9cdd1a7f8a0c1e"
+SRCREV_machine_qemux86 ?= "24572abb2cad341dd79e6aafcb9cdd1a7f8a0c1e"
+SRCREV_machine_qemux86-64 ?= "24572abb2cad341dd79e6aafcb9cdd1a7f8a0c1e"
+SRCREV_machine_qemumips64 ?= "7c9ce18e05e1d84df17e677b26133671ec0430f5"
+SRCREV_machine ?= "24572abb2cad341dd79e6aafcb9cdd1a7f8a0c1e"
+SRCREV_meta ?= "0db0b4a408f05cfed359983d7ff63b1a6e29be2c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.31"
+LINUX_VERSION ?= "4.9.36"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


