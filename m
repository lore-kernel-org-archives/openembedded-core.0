Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 00CCB7BDBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 03:40:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBH3delE003598
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Dec 2018 19:39:50 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 16 Dec 2018 19:39:29 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 16 Dec 2018 22:38:20 -0500
Message-ID: <55a84d2458fb18698b8d3efc45ee870bb3f1f197.1545017774.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1545017774.git.bruce.ashfield@windriver.com>
References: <cover.1545017774.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/17] linux-yocto/4.14: update to v4.14.79
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
X-List-Received-Date: Mon, 17 Dec 2018 03:40:15 -0000
Content-Type: text/plain

Integrating the -stable releases the comprise the following changes:

   50961e4888a1 Linux 4.14.79
   fe54a7c4f0d1 net/mlx5: Fix build break when CONFIG_SMP=n
   b0ee9bd40d74 net/sched: cls_api: add missing validation of netlink attributes
   c8c2df18eedf net: bcmgenet: Poll internal PHY for GENETv5
   71944eb54288 net: ipmr: fix unresolved entry dumps
   4ca72d6336df rtnetlink: Disallow FDB configuration for non-Ethernet device
   ac65fd7094ac net/mlx5e: fix csum adjustments caused by RXFCS
   855cb69f4e6d net: fix pskb_trim_rcsum_slow() with odd trim offset
   623670a9f207 net: drop skb on failure in ip_check_defrag()
   fd090ba395fb net: sched: Fix for duplicate class dump
   bc4787003687 net/mlx5: Take only bit 24-26 of wqe.pftype_wq for page fault type
   1d50b74a33d0 openvswitch: Fix push/pop ethernet validation
   f288424ea85e ip6_tunnel: Fix encapsulation layout
   8a865095d399 bonding: fix length of actor system
   95c337646585 ethtool: fix a privilege escalation bug
   574af67123c3 virtio_net: avoid using netif_tx_disable() for serializing tx routine
   b522f279f91b vhost: Fix Spectre V1 vulnerability
   189771d69e14 udp6: fix encap return code for resubmitting
   606694e5ec81 sctp: fix race on sctp_id2asoc
   aa8d067c8547 r8169: fix NAPI handling under high load
   0ecebdfb2e3a net: udp: fix handling of CHECKSUM_COMPLETE packets
   441d0e754082 net: stmmac: Fix stmmac_mdio_reset() when building stmmac as modules
   7d58456872c4 net: socket: fix a missing-check bug
   29d871195e9e net: sched: gred: pass the right attribute to gred_change_table_def()
   e581e28f9dcb net/ipv6: Fix index counter for unicast addresses in in6_dump_addrs
   ff96a3977440 net: fec: don't dump RX FIFO register when not available
   6bb1381cc865 llc: set SOCK_RCU_FREE in llc_sap_add_socket()
   1e42e97af983 ipv6/ndisc: Preserve IPv6 control buffer if protocol error handlers are called
   5d4c5861211f ipv6: mcast: fix a use-after-free in inet6_mc_check
   c3cf86dac56d net: bridge: remove ipv6 zero address check in mcast queries
   1bd68d5612af bridge: do not add port to router list when receives query with source 0.0.0.0
   b6534b3e08e8 drm/i915/gvt: fix memory leak of a cmd_entry struct on error exit path
   2980235974cd perf tools: Disable parallelism for 'make clean'
   ac7c2bb59870 Revert "netfilter: ipv6: nf_defrag: drop skb dst before queueing"
   ee66ad5896ae ALSA: usx2y: Fix invalid stream URBs
   e75194d29442 media: uvcvideo: Fix driver reference counting
   cdb44bdafc3a ARM: dts: r8a7790: Correct critical CPU temperature
   871424f0c3cf kvm: x86: fix WARN due to uninitialized guest FPU state
   3642e3544749 mtd: spi-nor: Add support for is25wp series chips
   bd6df7a19559 sch_netem: restore skb->dev after dequeuing from the rbtree
   3d69b85e14be fs/fat/fatent.c: add cond_resched() to fat_count_free_clusters()
   5309191ec049 selftests: rtnetlink.sh explicitly requires bash.
   1e4f8315a5c8 net: ena: fix NULL dereference due to untimely napi initialization
   ba4cf1eefd54 net: ena: fix warning in rmmod caused by double iounmap
   252869e5fb49 rxrpc: Fix connection-level abort handling
   f1d27ff6e027 rxrpc: Only take the rwind and mtu values from latest ACK
   9a6d45700adf rxrpc: Don't check RXRPC_CALL_TX_LAST after calling rxrpc_rotate_tx_window()
   4fdaadbce403 perf python: Use -Wno-redundant-decls to build with PYTHON=python3
   c005e014fbc6 ARM: dts: imx53-qsb: disable 1.2GHz OPP
   3c3bec81e267 compiler.h: Allow arch-specific asm/compiler.h
   b8f4d375cd1e perf tests: Fix indexing when invoking subtests
   543f1084b67f libertas: call into generic suspend code before turning off power
   48f1b3b56ee4 kconfig: fix the rule of mainmenu_stmt symbol
   cbc38304947e net: stmmac: mark PM functions as __maybe_unused
   726f05951941 x86/paravirt: Fix some warning messages
   aa3aff5b469b net: phy: phylink: Don't release NULL GPIO
   f72388e3670e btrfs: quota: Set rescan progress to (u64)-1 if we hit last leaf
   3c92c7e96fc4 scsi: sd: Remember that READ CAPACITY(16) succeeded
   5aa0d86363b2 scsi: ibmvfc: Avoid unnecessary port relogin
   07e2121f4f2b selftests/powerpc: Add ptrace hw breakpoint test
   672fdbd5966e iio: buffer: fix the function signature to match implementation
   1bee5f3d9530 enic: do not overwrite error code
   b9627a218e2b lan78xx: Don't reset the interface on open
   f18ed65d70f0 MIPS: Workaround GCC __builtin_unreachable reordering bug
   f274c57f0479 mmc: dw_mmc-rockchip: correct property names in debug
   e6df57b60b86 IB/usnic: Update with bug fixes from core code
   d29f27192a2d xen-netfront: Fix mismatched rtnl_unlock
   a0fcefb70022 xen-netfront: Update features after registering netdev
   9de255666ce3 tpm: tpm_crb: relinquish locality on error path.
   3c0cff34e91e bpf: sockmap, map_release does not hold refcnt for pinned maps
   db9d15988afb tpm: move the delay_msec increment after sleep in tpm_transmit()
   c1fdafea627c sparc64: Fix regression in pmdp_invalidate().
   090246ff5f6c KVM: x86: Update the exit_qualification access bits while walking an address
   7d768c84ec31 test_bpf: Fix testing with CONFIG_BPF_JIT_ALWAYS_ON=y on other arches
   8f041940aaf2 cifs: Use ULL suffix for 64-bit constant
   5c097f55e980 l2tp: remove configurable payload offset
   b39ac5421519 ARM: tegra: Fix ULPI regression on Tegra20
   579493b9f689 IB/mlx5: Avoid passing an invalid QP type to firmware
   6cfb67394a42 kbuild: set no-integrated-as before incl. arch Makefile
   a972222a6a30 scsi: qla2xxx: Avoid double completion of abort command
   651f11a83af3 net/mlx5e: Refine ets validation function
   8b882dbba717 net: phy: Add general dummy stubs for MMD register access
   8d9d7f018464 net: phy: realtek: Use the dummy stubs for MMD register access for rtl8211b
   4fbd26a1484c dm integrity: fail early if required HMAC key is not available
   aa2a0c23c9b7 powerpc/pseries: Add empty update_numa_cpu_lookup_table() for NUMA=n
   71a9d1240a30 net/mlx5: Fix mlx5_get_vector_affinity function
   049fee28bba3 s390/qeth: fix error handling in adapter command callbacks
   18addd960fe8 IB/rxe: put the pool on allocation failure
   8c954368de69 IB/ipoib: Fix lockdep issue found on ipoib_ib_dev_heavy_flush
   c750773f3942 scsi: aacraid: address UBSAN warning regression
   3b6c6d9cbdea usbip: vhci_hcd: update 'status' file header and format
   e37e383a4e66 tools/testing/nvdimm: unit test clear-error commands
   18a83c013392 iwlwifi: fix the ALIVE notification layout
   4187fbd60c39 iwlwifi: dbg: allow wrt collection before ALIVE
   d1efab095c20 iwlwifi: mvm: check for short GI only for OFDM
   f83f38fcf17f ocfs2: fix crash in ocfs2_duplicate_clusters_by_page()
   d0539c56391d yam: fix a missing-check bug
   ec4e9618d1fd net: cxgb3_main: fix a missing-check bug
   049b662eeadd be2net: don't flip hw_features when VXLANs are added/deleted
   45894023bee9 locking/ww_mutex: Fix runtime warning in the WW mutex selftest
   a0ab962b674d net: qualcomm: rmnet: Skip processing loopback packets
   3095f0c98c6a declance: Fix continuation with the adapter identification message
   1837dbb25cc5 net: fec: fix rare tx timeout
   784f8395895f perf/x86/amd/uncore: Set ThreadMask and SliceMask for L3 Cache perf events
   40568f21f235 perf/x86/intel/uncore: Fix PCI BDF address of M3UPI on SKX
   a18e2159c3ff perf/ring_buffer: Prevent concurent ring buffer access
   ffc3cb561ece perf/core: Fix perf_pmu_unregister() locking
   492a81318e8c cfg80211: fix use-after-free in reg_process_hint()
   35ffbd523797 smsc95xx: Check for Wake-on-LAN modes
   9e3a0366365b smsc75xx: Check for Wake-on-LAN modes
   9eaabc0a7779 r8152: Check for supported Wake-on-LAN Modes
   4301fb3391ed sr9800: Check for supported Wake-on-LAN modes
   9f0962c0f6f7 lan78xx: Check for supported Wake-on-LAN modes
   a0fc06335530 ax88179_178a: Check for supported Wake-on-LAN modes
   eef5935c2d7a asix: Check for supported Wake-on-LAN modes
   915670c48eb3 nl80211: Fix possible Spectre-v1 for CQM RSSI thresholds
   b93393d63d8f qed: Avoid implicit enum conversion in qed_iwarp_parse_rx_pkt
   ee86b4d659c2 qed: Avoid constant logical operation warning in qed_vf_pf_acquire
   935d441968b1 qed: Avoid implicit enum conversion in qed_roce_mode_to_flavor
   ab7998abfea2 qed: Fix mask parameter in qed_vf_prep_tunn_req_tlv
   76f86190774e qed: Avoid implicit enum conversion in qed_set_tunn_cls_info
   865741554925 pxa168fb: prepare the clock
   0f8a689c6a2f Bluetooth: SMP: fix crash in unpairing
   db2a11e706bf mac80211_hwsim: do not omit multicast announce of first added radio
   c7b66583c9ed nl80211: Fix possible Spectre-v1 for NL80211_TXRATE_HT
   fa1578ec411d soc: fsl: qe: Fix copy/paste bug in ucc_get_tdm_sync_shift()
   795b13034224 soc: fsl: qbman: qman: avoid allocating from non existing gen_pool
   d9e742766c76 net: macb: Clean 64b dma addresses if they are not detected
   a5bdfc6892b5 ARM: dts: BCM63xx: Fix incorrect interrupt specifiers
   1241679ce248 arm64: hugetlb: Fix handling of young ptes
   1157713407a6 netfilter: bridge: Don't sabotage nf_hook calls from an l3mdev
   26c6b9da7a00 xfrm: validate template mode
   5d7bf7b4d022 ARM: 8799/1: mm: fix pci_ioremap_io() offset check
   73c6f8606070 xfrm: Fix NULL pointer dereference when skb_dst_force clears the dst_entry.
   35507aabf0e5 mac80211: fix TX status reporting for ieee80211s
   ebec37ed21a2 mac80211: TDLS: fix skb queue/priority assignment
   9da59d2e283d cfg80211: Address some corner cases in scan result channel updating
   574be53ab82c mac80211: fix pending queue hang due to TX_DROP
   d46c334f07f5 cfg80211: reg: Init wiphy_idx in regulatory_hint_core()
   b0be0d83fc68 mac80211: Always report TX status
   64f38286c7be xfrm: reset crypto_done when iterating over multiple input xfrms
   a95d9004fbde xfrm: reset transport header back to network header after all input transforms ahave been applied
   2a55e64d5c5e xfrm6: call kfree_skb when skb is toobig
   3b5d512831af xfrm: Validate address prefix lengths in the xfrm selector.
   e7405910ca55 Linux 4.14.78
   6edd85a7870a IB/hfi1: Fix destroy_qp hang after a link down
   4d5af836674f i2c: rcar: handle RXDMA HW behaviour on Gen3
   faf578e3593e drm/i915/glk: Add Quirk for GLK NUC HDMI port issues.
   2a797fd8f8ae mm: disallow mappings that conflict for devm_memremap_pages()
   8e6173c12467 staging: ccree: check DMA pool buf !NULL before free
   61377bc80861 drm/i915: Nuke the LVDS lid notifier
   e896a2adba93 HID: quirks: fix support for Apple Magic Keyboards
   7b9f716d5550 ARC: build: Don't set CROSS_COMPILE in arch's Makefile
   b6d06b180ff8 ARC: build: Get rid of toolchain check
   541500abfe9e mremap: properly flush TLB before releasing the page
   f473bf921696 Revert "vfs: fix freeze protection in mnt_want_write_file() for overlayfs"
   e261faa2eccb powerpc/lib/feature-fixups: use raw_patch_instruction()
   f78ae314c6e3 iommu/amd: Return devid as alias for ACPI HID devices
   62c15d061f5f powerpc/tm: Avoid possible userspace r1 corruption on reclaim
   256707d3b89b powerpc/tm: Fix userspace r13 corruption
   4f5dbf26a1bd clocksource/drivers/fttmr010: Fix set_next_event handler
   f75ad0441a0a net/mlx4: Use cpumask_available for eq->affinity_mask
   4c0e2e4a4b54 scsi: sd: don't crash the host on invalid commands
   b6b5bc245dc2 scsi: ipr: System hung while dlpar adding primary ipr adapter back
   26377fe2f7b0 drm: mali-dp: Call drm_crtc_vblank_reset on device init
   940d35f3a572 PCI: dwc: Fix scheduling while atomic issues
   48047b847808 ravb: do not write 1 to reserved bits
   997cdc46f436 net: emac: fix fixed-link setup for the RTL8363SB switch
   1c22d2cbd9f2 Input: atakbd - fix Atari CapsLock behaviour
   8b8ab47a093d Input: atakbd - fix Atari keymap
   2b8b339c53d2 intel_th: pci: Add Ice Lake PCH support
   3353c04dd4d7 scsi: ibmvscsis: Ensure partition name is properly NUL terminated
   40e49c155313 scsi: ibmvscsis: Fix a stringop-overflow warning
   89450e431a63 clocksource/drivers/ti-32k: Add CLOCK_SOURCE_SUSPEND_NONSTOP flag for non-am43 SoCs
   498c536f5931 batman-adv: fix hardif_neigh refcount on queue_work() failure
   3e9f714fb58b batman-adv: fix backbone_gw refcount on queue_work() failure
   2b1c4897f256 batman-adv: Prevent duplicated tvlv handler
   b46fd722b7bc batman-adv: Prevent duplicated global TT entry
   2a544b2da44b batman-adv: Prevent duplicated softif_vlan entry
   18733cfe4126 batman-adv: Prevent duplicated nc_node entry
   3b38bed3304d batman-adv: Prevent duplicated gateway_node entry
   c553f7e514b9 batman-adv: Fix segfault when writing to sysfs elp_interval
   acdaf28d8cf5 batman-adv: Fix segfault when writing to throughput_override
   fa04cc5e7b81 batman-adv: Avoid probe ELP information leak
   88be243901ff media: af9035: prevent buffer overflow on write
   8263087bf627 Linux 4.14.77
   d0c9f9f9fb44 perf tools: Fix snprint warnings for gcc 8
   57bff812c4e2 ARM: spectre-v1: mitigate user accesses
   4a1948d692f1 ARM: spectre-v1: use get_user() for __get_user()
   f64824a3d475 ARM: use __inttype() in get_user()
   70b96be10d15 ARM: oabi-compat: copy semops using __copy_from_user()
   38752f417487 ARM: vfp: use __copy_from_user() when restoring VFP state
   faac72dc9150 ARM: signal: copy registers using __copy_from_user()
   b690ec0dc735 ARM: spectre-v1: fix syscall entry
   4186f7cfa1d6 ARM: spectre-v1: add array_index_mask_nospec() implementation
   f6909113ad1f ARM: spectre-v1: add speculation barrier (csdb) macros
   e7fc401a8800 ARM: KVM: report support for SMCCC_ARCH_WORKAROUND_1
   8502541ee216 ARM: KVM: Add SMCCC_ARCH_WORKAROUND_1 fast handling
   ee4e537d3aa1 ARM: spectre-v2: KVM: invalidate icache on guest exit for Brahma B15
   1df9a0a8201b ARM: KVM: invalidate icache on guest exit for Cortex-A15
   75e48eff8aae ARM: KVM: invalidate BTB on guest exit for Cortex-A12/A17
   6d75fe7ed2f6 ARM: spectre-v2: warn about incorrect context switching functions
   510155b2d95b ARM: spectre-v2: add firmware based hardening
   5ab8c6e8879c ARM: spectre-v2: harden user aborts in kernel space
   81b215a5b80b ARM: spectre-v2: add Cortex A8 and A15 validation of the IBE bit
   3e52aff79d5e ARM: spectre-v2: harden branch predictor on context switches
   c0f64070a310 ARM: spectre: add Kconfig symbol for CPUs vulnerable to Spectre
   0d5360ee15e9 ARM: bugs: add support for per-processor bug checking
   c7825c277bad ARM: bugs: hook processor bug checking into SMP and suspend paths
   9a42b70744b1 ARM: bugs: prepare processor bug infrastructure
   1789de335428 ARM: add more CPU part numbers for Cortex and Brahma B15 CPUs
   d62b8ac8cd54 mm: don't show nr_indirectly_reclaimable in /proc/vmstat
   5de69d648a09 mm: treat indirectly reclaimable memory as free in overcommit logic
   6d7942377c88 dcache: account external names as indirectly reclaimable memory
   dc09a5b68d83 mm: treat indirectly reclaimable memory as available in MemAvailable
   c605894c84b9 mm: introduce NR_INDIRECTLY_RECLAIMABLE_BYTES
   7a4f9efdb213 xhci: Don't print a warning when setting link state for disabled ports
   74a960430a8d i2c: i2c-scmi: fix for i2c_smbus_write_block_data
   1b7ff5208d2f mm: Preserve _PAGE_DEVMAP across mprotect() calls
   68ba0bdfe494 mm/thp: fix call to mmu_notifier in set_pmd_migration_entry() v2
   3e6275d940a4 arm64: perf: Reject stand-alone CHAIN events for PMUv3
   b3e4b3c70a0a pinctrl: mcp23s08: fix irq and irqchip setup order
   d5833a50c6a3 mmc: block: avoid multiblock reads for the last sector in SPI mode
   bc183079ddfd cgroup: Fix dom_cgrp propagation when enabling threaded mode
   c339fab172a9 dm linear: fix linear_end_io conditional definition
   efd6537984d5 dm linear: eliminate linear_end_io call if CONFIG_DM_ZONED disabled
   261f2cba100b dm: fix report zone remapping to account for partition offset
   6c8faa19e9cc dm cache: destroy migration_cache if cache target registration failed
   8d2f62cb2d46 s390/cio: Fix how vfio-ccw checks pinned pages
   e3f725f5c46a perf script python: Fix export-to-sqlite.py sample columns
   82ac2740aa74 perf script python: Fix export-to-postgresql.py occasional failure
   54886c978397 percpu: stop leaking bitmap metadata blocks
   6c8f4babb57b mach64: detect the dot clock divider correctly on sparc
   86717a97f921 MIPS: VDSO: Always map near top of user memory
   8676e0b4a28f mm/vmstat.c: fix outdated vmstat_text
   059726864271 drm/amdgpu: Fix SDMA HQD destroy error on gfx_v7
   e4865b46e195 x86/kvm/lapic: always disable MMIO interface in x2APIC mode
   88659387b9d5 clk: x86: Stop marking clocks as CLK_IS_CRITICAL
   ba54417f8d01 clk: x86: add "ether_clk" alias for Bay Trail / Cherry Trail
   cac34c122cf3 PCI: hv: support reporting serial number as slot information
   18918ed70db9 ARM: dts: at91: add new compatibility string for macb on sama5d3
   c77295d6fa1c net: macb: disable scatter-gather for macb on sama5d3
   3265bda5bd9f stmmac: fix valid numbers of unicast filter entries
   1826e5562516 hv_netvsc: fix schedule in RCU context
   37ca1cc8d4c0 sound: don't call skl_init_chip() to reset intel skl soc
   2af2b70c107b sound: enable interrupt after dma buffer initialization
   a5733703e38c scsi: qla2xxx: Fix an endian bug in fcpcmd_is_corrupted()
   254cc00e53d7 scsi: iscsi: target: Don't use stack buffer for scatterlist
   5d53f0d897c3 mfd: omap-usb-host: Fix dts probe of children
   e3583d7b1bd9 Bluetooth: hci_ldisc: Free rw_semaphore on close
   bac561137155 ASoC: rsnd: don't fallback to PIO mode when -EPROBE_DEFER
   ad9ad950a37b ASoC: rsnd: adg: care clock-frequency size
   6d52f3e1e729 selftests: memory-hotplug: add required configs
   e121efd796c9 selftests/efivarfs: add required kernel configs
   c5f7b0d2ce9e ASoC: sigmadsp: safeload should not have lower byte limit
   c08a99325a56 ASoC: wm8804: Add ACPI support
   a15fac93a3e6 ASoC: rt5514: Fix the issue of the delay volume applied again
   c5df58138946 inet: make sure to grab rcu_read_lock before using ireq->ireq_opt
   17af5475aef3 tcp/dccp: fix lockdep issue when SYN is backlogged
   4b7b26024f52 net-ethtool: ETHTOOL_GUFO did not and should not require CAP_NET_ADMIN
   98c77f2eef29 bnxt_en: don't try to offload VLAN 'modify' action
   eb79c31aac15 nfp: avoid soft lockups under control message storm
   f578e5b34c38 bonding: fix warning message
   90a3d8afe1f4 bonding: pass link-local packets to bonding master also.
   83eb2fdd0483 net/mlx5: E-Switch, Fix out of bound access when setting vport rate
   7aa339e90994 net: aquantia: memory corruption on jumbo frames
   7ba8867fb3a7 net/mlx5e: Set vlan masks for all offloaded TC rules
   431a4fee7114 net: dsa: bcm_sf2: Fix unbind ordering
   5150140b4ea7 net/packet: fix packet drop as of virtio gso
   5e7bb38dc696 net: stmmac: Fixup the tail addr setting in xmit path
   7976e6b70ecf udp: Unbreak modules that rely on external __skb_recv_udp() availability
   49984ca4e60e tipc: fix flow control accounting for implicit connect
   66c1b9cfa07d team: Forbid enslaving team device to itself
   d63d3995d7db sctp: update dst pmtu with the correct daddr
   a8b0f004eb90 rtnl: limit IFLA_NUM_TX_QUEUES and IFLA_NUM_RX_QUEUES to 4096
   5f999abba33f rtnetlink: fix rtnl_fdb_dump() for ndmsg header
   72675512fb1a qmi_wwan: Added support for Gemalto's Cinterion ALASxx WWAN interface
   0d5b9edea995 qlcnic: fix Tx descriptor corruption on 82xx devices
   133aea0f2108 net/usb: cancel pending work when unbinding smsc75xx
   3e80ad8cbf22 net: systemport: Fix wake-up interrupt race during resume
   d9057423312e net: sched: Add policy validation for tc attributes
   85ebbc5a2543 net: mvpp2: fix a txq_done race condition
   d9bf6699aee8 net: mvpp2: Extract the correct ethtype from the skb for tx csum offload
   19c5e73c745c netlabel: check for IPV4MASK in addrinfo_get
   335c37612f9f net/ipv6: Display all addresses in output of /proc/net/if_inet6
   9b4869cf385a net: ipv4: update fnhe_pmtu when first hop's MTU changes
   6c61dae979ae net: hns: fix for unmapping problem when SMMU is on
   8193b775247a net: dsa: bcm_sf2: Call setup during switch resume
   48c14f2ea5c5 ipv6: take rcu lock in rawv6_send_hdrinc()
   32b193216e18 ipv4: fix use-after-free in ip_cmsg_recv_dstaddr()
   deb33b68f40e ip_tunnel: be careful when accessing the inner header
   18bf9a724362 ip6_tunnel: be careful when accessing the inner header
   94402f23659f bonding: avoid possible dead-lock
   e73b51a995ac bnxt_en: free hwrm resources, if driver probe fails.
   67d1ee6c7b76 bnxt_en: Fix TX timeout during netpoll.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index 7e7911aea039..4189fc8d173c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "eafe398ca1404953c2a01559c83d3a983f8717b1"
-SRCREV_meta ?= "19c174f547e63ca9ce71ca9861bfada0a5a98fc3"
+SRCREV_machine ?= "82ac7b2b8048b537481bf16b8acda1cc9bfe9565"
+SRCREV_meta ?= "6a3254e7b370cbb86c1f73379dcf38885c1c69e0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.76"
+LINUX_VERSION ?= "4.14.79"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index b67b80c0cbd4..71f5c4716a17 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -4,7 +4,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.14.76"
+LINUX_VERSION ?= "4.14.79"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
@@ -12,8 +12,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c5aca000e387da12ce375251c829f653503d32b4"
-SRCREV_meta ?= "19c174f547e63ca9ce71ca9861bfada0a5a98fc3"
+SRCREV_machine ?= "6ce17eae5d962b30846a5258956246438d68d60a"
+SRCREV_meta ?= "6a3254e7b370cbb86c1f73379dcf38885c1c69e0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index e287868a442e..65b24440982d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "v4.14/standard/base"
 KBRANCH_qemux86-64 ?= "v4.14/standard/base"
 KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "91251c7c3d5e9ba9bb527130db440c00bec30fe6"
-SRCREV_machine_qemuarm64 ?= "72e2b6e07170fd84a93469830c69c31c9fa1c1dd"
-SRCREV_machine_qemumips ?= "fe1a03895bd26473b6e60e76ed54d021561374a7"
-SRCREV_machine_qemuppc ?= "e1d81834af552e5caf6c968d2f755866cee19d4e"
-SRCREV_machine_qemux86 ?= "2c5caa7e84311f2a0097974a697ac1f59030530e"
-SRCREV_machine_qemux86-64 ?= "2c5caa7e84311f2a0097974a697ac1f59030530e"
-SRCREV_machine_qemumips64 ?= "512b0a8df98e49746548444cc4c9543ef0c23369"
-SRCREV_machine ?= "2c5caa7e84311f2a0097974a697ac1f59030530e"
-SRCREV_meta ?= "19c174f547e63ca9ce71ca9861bfada0a5a98fc3"
+SRCREV_machine_qemuarm ?= "8752b8421efe8b5a478f17fbffacf4af974ec703"
+SRCREV_machine_qemuarm64 ?= "ac66474ba7f7e93d16ae3ea005f214113bb127c5"
+SRCREV_machine_qemumips ?= "ab031b267e2a79fcd48da5d10d503f4d065f4821"
+SRCREV_machine_qemuppc ?= "f47c3945e8dd230ea37771bcacc836245fc79d22"
+SRCREV_machine_qemux86 ?= "f1d93b219bde37a8a286cd18d6af2dcf0d02c1a8"
+SRCREV_machine_qemux86-64 ?= "f1d93b219bde37a8a286cd18d6af2dcf0d02c1a8"
+SRCREV_machine_qemumips64 ?= "8063a7258fc670a361fed85b858fabb237485f1c"
+SRCREV_machine ?= "f1d93b219bde37a8a286cd18d6af2dcf0d02c1a8"
+SRCREV_meta ?= "6a3254e7b370cbb86c1f73379dcf38885c1c69e0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.76"
+LINUX_VERSION ?= "4.14.79"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.5.0


