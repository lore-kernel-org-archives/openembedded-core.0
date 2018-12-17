Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B131E7BE13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 03:39:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBH3dTf4029807
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Dec 2018 19:39:29 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 16 Dec 2018 19:39:29 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 16 Dec 2018 22:38:19 -0500
Message-ID: <4b2fad9156ed6a62bd97e8a47a23cd8a2ddb9ba0.1545017774.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1545017774.git.bruce.ashfield@windriver.com>
References: <cover.1545017774.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/17] linux-yocto/4.18: update to v4.18.17
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
X-List-Received-Date: Mon, 17 Dec 2018 03:39:29 -0000
Content-Type: text/plain

Integrating the korg -stable updates that comprise the following
commits:

   2237effd7edc Linux 4.18.17
   1757ec69500e net: bridge: remove ipv6 zero address check in mcast queries
   2ec673dbb0cd sparc: Throttle perf events properly.
   12176be9fc14 sparc: Fix syscall fallback bugs in VDSO.
   366187ea2b33 sparc: Fix single-pcr perf event counter management.
   4ce6adbc410a sparc64: Wire up compat getpeername and getsockname.
   a756494fb7bd sparc64: Set %l4 properly on trap return after handling signals.
   1a47e59c4471 sparc64: Make proc_id signed.
   f64ff34d414e sparc64: Make corrupted user stacks more debuggable.
   69e6b8f41fbf sparc64: Export __node_distance.
   6a84bdb84df3 mlxsw: core: Fix devlink unregister flow
   2d484ce0a878 net/mlx5: WQ, fixes for fragmented WQ buffers API
   f8e70fa84f76 net: fix pskb_trim_rcsum_slow() with odd trim offset
   4eb937395873 net: drop skb on failure in ip_check_defrag()
   dc4526d3bfeb net: bpfilter: use get_pid_task instead of pid_task
   79a6dd1cb8e3 mlxsw: spectrum_switchdev: Don't ignore deletions of learned MACs
   f235cdcf4fc4 net/smc: fix smc_buf_unuse to use the lgr pointer
   d09a8fb16103 net/mlx5: Fix memory leak when setting fpga ipsec caps
   63f8939f793b sctp: not free the new asoc when sctp_wait_for_connect returns err
   c1b1e96cffd2 sctp: fix the data size calculation in sctp_data_size
   81e31abfa81d net/ipv6: Allow onlink routes to have a device mismatch if it is the default route
   c5038b492cb1 net/sched: cls_api: add missing validation of netlink attributes
   45675e6e6344 net: sched: Fix for duplicate class dump
   11681b07d320 net: bcmgenet: Poll internal PHY for GENETv5
   b9a30ce087b4 net/mlx5: Take only bit 24-26 of wqe.pftype_wq for page fault type
   739b2449f0cf net: ipmr: fix unresolved entry dumps
   f8c96597387e openvswitch: Fix push/pop ethernet validation
   0b73d75ab52f ip6_tunnel: Fix encapsulation layout
   2f75b5a2c832 bonding: fix length of actor system
   03e00d0609eb ethtool: fix a privilege escalation bug
   e30293d0a03a virtio_net: avoid using netif_tx_disable() for serializing tx routine
   c75d697c8197 vhost: Fix Spectre V1 vulnerability
   886de7239b16 udp6: fix encap return code for resubmitting
   b3c2e8e106df tipc: fix unsafe rcu locking when accessing publication list
   721933262ef7 sctp: fix race on sctp_id2asoc
   2645237c90e7 rtnetlink: Disallow FDB configuration for non-Ethernet device
   9ae97da02a54 r8169: fix NAPI handling under high load
   6c5f9c2de021 net: udp: fix handling of CHECKSUM_COMPLETE packets
   cbfb26f3eb03 net: stmmac: Fix stmmac_mdio_reset() when building stmmac as modules
   a04092cebd73 net: socket: fix a missing-check bug
   ea824d70d673 net: sched: gred: pass the right attribute to gred_change_table_def()
   7344adab32c7 net/mlx5e: fix csum adjustments caused by RXFCS
   60a2c3b4a991 net/ipv6: Fix index counter for unicast addresses in in6_dump_addrs
   4dcde3a4c5ea net: fec: don't dump RX FIFO register when not available
   cc30c16a04cb llc: set SOCK_RCU_FREE in llc_sap_add_socket()
   23b5d05d9114 ipv6: rate-limit probes for neighbourless routes
   9198d01eb02d ipv6/ndisc: Preserve IPv6 control buffer if protocol error handlers are called
   558af64846ca ipv6: mcast: fix a use-after-free in inet6_mc_check
   9801a672beb6 bridge: do not add port to router list when receives query with source 0.0.0.0
   b13411edcf71 perf tools: Disable parallelism for 'make clean'
   f1f040bf29b7 Revert "netfilter: ipv6: nf_defrag: drop skb dst before queueing"
   d496cdeede28 Revert "mm: slowly shrink slabs with a relatively small number of objects"
   4afb03f48e7e fs/fat/fatent.c: add cond_resched() to fat_count_free_clusters()
   9721f5af4d23 afs: Fix cell proc list
   9277b65e04d6 vmlinux.lds.h: Fix linker warnings about orphan .LPBX sections
   e266c397e724 vmlinux.lds.h: Fix incomplete .text.exit discards
   c4659254b987 selftests: udpgso_bench.sh explicitly requires bash
   92e648292600 selftests: rtnetlink.sh explicitly requires bash.
   941a8d0b8409 rds: RDS (tcp) hangs on sendto() to unresponding address
   87113db1242c IB/mlx5: Unmap DMA addr from HCA before IOMMU
   e14b8b11ac50 gpio: Assign gpio_irq_chip::parents to non-stack pointer
   e7579cb736ec net: ena: fix NULL dereference due to untimely napi initialization
   2abc117c9799 net: ena: fix rare bug when failed restart/resume is followed by driver removal
   b0af327d145f net: ena: fix warning in rmmod caused by double iounmap
   6be48d8274ef KVM: x86: support CONFIG_KVM_AMD=y with CONFIG_CRYPTO_DEV_CCP_DD=m
   98154205f7a9 rxrpc: Fix connection-level abort handling
   47af9661cc87 rxrpc: Only take the rwind and mtu values from latest ACK
   54776c736d41 rxrpc: Carry call state out of locked section in rxrpc_rotate_tx_window()
   e3dcbf121240 rxrpc: Don't check RXRPC_CALL_TX_LAST after calling rxrpc_rotate_tx_window()
   903fb78f7436 perf record: Use unmapped IP for inline callchain cursors
   37e241d14094 perf python: Use -Wno-redundant-decls to build with PYTHON=python3
   2b401f26406f ARM: dts: imx53-qsb: disable 1.2GHz OPP
   755b72711bbc compiler.h: Allow arch-specific asm/compiler.h
   ff78e12f6587 HID: i2c-hid: Remove RESEND_REPORT_DESCR quirk and its handling
   e911f46c0cc5 tls: Fix improper revert in zerocopy_from_iter
   2033959b7421 perf report: Don't try to map ip to invalid map
   15ea940bc3fb libertas: call into generic suspend code before turning off power
   d33c4297bac5 clk: mvebu: armada-37xx-periph: Remove unused var num_parents
   e7f8508aca5e x86/paravirt: Fix some warning messages
   3b917cecac61 mm/migrate.c: split only transparent huge pages when allocation fails
   28d6d2236564 mm/gup_benchmark: fix unsigned comparison to zero in __gup_benchmark_ioctl
   203711a8820b ocfs2: fix crash in ocfs2_duplicate_clusters_by_page()
   72c25b9bf77d yam: fix a missing-check bug
   4c8345b62cfe net: cxgb3_main: fix a missing-check bug
   3397d28b3e27 powerpc/numa: Skip onlining a offline node in kdump path
   a7af3a2ae488 be2net: don't flip hw_features when VXLANs are added/deleted
   43cb734246c0 drm/amd/display: Signal hw_done() after waiting for flip_done()
   76c84d0a2313 locking/ww_mutex: Fix runtime warning in the WW mutex selftest
   1ac18a1dbc3f Revert "serial: 8250_dw: Fix runtime PM handling"
   0cf9edba8270 RISCV: Fix end PFN for low memory
   5278d9550d4d declance: Fix continuation with the adapter identification message
   c770ce978ac2 net: fec: fix rare tx timeout
   5613fc70844b thunderbolt: Initialize after IOMMUs
   1699207e9c7c thunderbolt: Do not handle ICM events after domain is stopped
   14ad1e0af45f perf/x86/amd/uncore: Set ThreadMask and SliceMask for L3 Cache perf events
   9f1aaaae92ff perf/x86/intel/uncore: Fix PCI BDF address of M3UPI on SKX
   8764955cc03e perf/ring_buffer: Prevent concurent ring buffer access
   3617d16a5744 perf/x86/intel/uncore: Use boot_cpu_data.phys_proc_id instead of hardcorded physical package ID 0
   d318ef466d5f perf/core: Fix perf_pmu_unregister() locking
   2f56f220a61e KVM: nVMX: Fix emulation of VM_ENTRY_LOAD_BNDCFGS
   3c81fff77cfd KVM: x86: Do not use kvm_x86_ops->mpx_supported() directly
   82ba86c25383 KVM: nVMX: Do not expose MPX VMX controls when guest MPX disabled
   2dbf48f8ffb3 cfg80211: fix use-after-free in reg_process_hint()
   9069c847f3fe smsc95xx: Check for Wake-on-LAN modes
   4f1268db2975 smsc75xx: Check for Wake-on-LAN modes
   e3935fa141b8 r8152: Check for supported Wake-on-LAN Modes
   e8f4ce7df75e sr9800: Check for supported Wake-on-LAN modes
   35c636108bc4 lan78xx: Check for supported Wake-on-LAN modes
   58d2f3f743a1 ax88179_178a: Check for supported Wake-on-LAN modes
   afc7b1940200 asix: Check for supported Wake-on-LAN modes
   723b7d86877d netfilter: avoid erronous array bounds warning
   8d3156b3c109 netfilter: nft_set_rbtree: add missing rb_erase() in GC routine
   18cb92701a5d rxrpc: Fix error distribution
   4ca2cf672c5b rxrpc: Fix transport sockopts to get IPv4 errors on an IPv6 socket
   1a75026c857a rxrpc: Fix RTT gathering
   6a14d1c9336f rxrpc: Fix checks as to whether we should set up a new call
   605c374d8d70 scsi: qedi: Initialize the stats mutex lock
   aa1945964a7c nl80211: Fix possible Spectre-v1 for CQM RSSI thresholds
   7a9bda693628 qed: Avoid implicit enum conversion in qed_iwarp_parse_rx_pkt
   d627d3b8bed3 qed: Avoid constant logical operation warning in qed_vf_pf_acquire
   02e2aef498f7 qed: Avoid implicit enum conversion in qed_roce_mode_to_flavor
   b65e69499980 qed: Fix mask parameter in qed_vf_prep_tunn_req_tlv
   a2b1a38ad02b qed: Avoid implicit enum conversion in qed_set_tunn_cls_info
   b9e005da34ff pxa168fb: prepare the clock
   6c2222c8f039 Bluetooth: SMP: fix crash in unpairing
   68fd462426c4 mac80211_hwsim: do not omit multicast announce of first added radio
   5b79f65376d3 mac80211_hwsim: fix race in radio destruction from netlink notifier
   a245a12394fe mac80211_hwsim: fix locking when iterating radios during ns exit
   de835e3911a3 nl80211: Fix possible Spectre-v1 for NL80211_TXRATE_HT
   4417f9e05c28 soc: fsl: qe: Fix copy/paste bug in ucc_get_tdm_sync_shift()
   d87e83a55f4b soc: fsl: qbman: qman: avoid allocating from non existing gen_pool
   da5e35d2f776 net: macb: Clean 64b dma addresses if they are not detected
   5499ce65ff9c ARM: dts: BCM63xx: Fix incorrect interrupt specifiers
   a958dc5482c1 arm64: hugetlb: Fix handling of young ptes
   eaab185b06cd netfilter: conntrack: get rid of double sizeof
   044c43754741 netfilter: bridge: Don't sabotage nf_hook calls from an l3mdev
   6b7174a50fb2 drm/i2c: tda9950: set MAX_RETRIES for errors only
   4abac4cf573a drm/i2c: tda9950: fix timeout counter check
   9981ca44ae4b xfrm: validate template mode
   3dc70478360e ARM: 8799/1: mm: fix pci_ioremap_io() offset check
   c473a489d409 xfrm: Fix NULL pointer dereference when skb_dst_force clears the dst_entry.
   53d617654c50 mac80211: fix TX status reporting for ieee80211s
   fd6b693e1d94 mac80211: TDLS: fix skb queue/priority assignment
   a9489521a39c cfg80211: Address some corner cases in scan result channel updating
   2c4739102f0e mac80211: fix pending queue hang due to TX_DROP
   2953d28476c3 cfg80211: reg: Init wiphy_idx in regulatory_hint_core()
   e20c2a6a7144 mac80211: Always report TX status
   c3767729df27 xfrm: reset crypto_done when iterating over multiple input xfrms
   fdb06c787b34 xfrm: reset transport header back to network header after all input transforms ahave been applied
   401979de6e8b xfrm6: call kfree_skb when skb is toobig
   36ad133bf987 xfrm: Validate address prefix lengths in the xfrm selector.
   6b3252287aa2 Linux 4.18.16
   645ad2d5cccc ARC: build: Don't set CROSS_COMPILE in arch's Makefile
   dfed0698a22e ARC: build: Get rid of toolchain check
   d80183541e60 mremap: properly flush TLB before releasing the page
   94d2da5ba1dd Revert "vfs: fix freeze protection in mnt_want_write_file() for overlayfs"
   7fde798123ef x86/boot: Fix kexec booting failure in the SEV bit detection code
   44e564aa4525 iommu/amd: Return devid as alias for ACPI HID devices
   0e963ecefb72 powerpc/numa: Use associativity if VPHN hcall is successful
   4a079f0a5398 powerpc/tm: Avoid possible userspace r1 corruption on reclaim
   8725b910e72d powerpc/tm: Fix userspace r13 corruption
   b0b901600550 pinctrl/amd: poll InterruptEnable bits in amd_gpio_irq_set_type
   0fe04d27b5e3 iommu/rockchip: Free irqs in shutdown handler
   1e23af485f89 RISC-V: include linux/ftrace.h in asm-prototypes.h
   086906d90bae RDMA/bnxt_re: Fix system crash during RDMA resource initialization
   87e75317fe81 clocksource/drivers/fttmr010: Fix set_next_event handler
   323ad7436184 net/mlx4: Use cpumask_available for eq->affinity_mask
   bcb2acdf27b3 bpf: test_maps, only support ESTABLISHED socks
   19e43942cbb7 bpf: sockmap, fix transition through disconnect without close
   60c302b7aea5 bpf: sockmap only allow ESTABLISHED sock state
   019a15f9bd44 scsi: sd: don't crash the host on invalid commands
   6dba1e338b6e scsi: ipr: System hung while dlpar adding primary ipr adapter back
   ce32caf41e53 drm: mali-dp: Call drm_crtc_vblank_reset on device init
   fab5471586f4 scsi: lpfc: Synchronize access to remoteport via rport
   7dc74b2622c2 RDMA/uverbs: Fix validity check for modify QP
   2c93f6f118ad PCI: dwc: Fix scheduling while atomic issues
   1093a05b5828 qed: Do not add VLAN 0 tag to untagged frames in multi-function mode.
   c23f22169cac qed: Fix populating the invalid stag value in multi function mode.
   9bdac39234d0 net/smc: fix sizeof to int comparison
   4b238ea05476 net/smc: fix non-blocking connect problem
   6b7d727a2d18 ravb: do not write 1 to reserved bits
   14bbe1ab20ac net: emac: fix fixed-link setup for the RTL8363SB switch
   66acb86c0905 selftests: pmtu: properly redirect stderr to /dev/null
   6a08cbb10aac Input: atakbd - fix Atari CapsLock behaviour
   ef17628c07da Input: atakbd - fix Atari keymap
   462809659a39 intel_th: pci: Add Ice Lake PCH support
   ee43eeb4d1b9 scsi: ibmvscsis: Ensure partition name is properly NUL terminated
   10ad9dcade4b scsi: ibmvscsis: Fix a stringop-overflow warning
   bb59249268cf clocksource/drivers/ti-32k: Add CLOCK_SOURCE_SUSPEND_NONSTOP flag for non-am43 SoCs
   385ce0611598 cxgb4: fix abort_req_rss6 struct
   413baacefef9 batman-adv: fix hardif_neigh refcount on queue_work() failure
   04125a63ea54 batman-adv: fix backbone_gw refcount on queue_work() failure
   39b0e1c4c79f batman-adv: Prevent duplicated tvlv handler
   c25ae7c479af batman-adv: Prevent duplicated global TT entry
   71d6d75e5801 batman-adv: Prevent duplicated softif_vlan entry
   2d1749b0fab0 batman-adv: Prevent duplicated nc_node entry
   d8ed2b187456 batman-adv: Prevent duplicated gateway_node entry
   eddab21dd463 batman-adv: Fix segfault when writing to sysfs elp_interval
   54231bb59a9a batman-adv: Fix segfault when writing to throughput_override
   52406f34bbb6 batman-adv: Avoid probe ELP information leak
   26c0bac0c117 spi: gpio: Fix copy-and-paste error
   affb1840c578 media: af9035: prevent buffer overflow on write
   1228a75335e0 soundwire: Fix acquiring bus lock twice during master release
   ad9107d7e1c7 soundwire: Fix incorrect exit after configuring stream
   b1bafbe4ff2d soundwire: Fix duplicate stream state assignment
   2724bf10255a Linux 4.18.15
   4a15f8a1de59 KVM: PPC: Book3S HV: Avoid crash from THP collapse during radix page fault
   726c11216e33 i2c: i2c-scmi: fix for i2c_smbus_write_block_data
   a249cdf8fc74 mm: Preserve _PAGE_DEVMAP across mprotect() calls
   7230bb7c98c1 filesystem-dax: Fix dax_layout_busy_page() livelock
   3c3bb028a3b7 mm/thp: fix call to mmu_notifier in set_pmd_migration_entry() v2
   ffa4d6624e1a mm/mmap.c: don't clobber partially overlapping VMA with MAP_FIXED_NOREPLACE
   53abe5164894 arm64: perf: Reject stand-alone CHAIN events for PMUv3
   59d9c7cba4ba pinctrl: mcp23s08: fix irq and irqchip setup order
   3df1331f63cd mmc: block: avoid multiblock reads for the last sector in SPI mode
   7088776eb06a drm/nouveau/drm/nouveau: Grab runtime PM ref in nv50_mstc_detect()
   ca45da09bc32 Input: xpad - add support for Xbox1 PDP Camo series gamepad
   d8408e8fc720 cgroup: Fix dom_cgrp propagation when enabling threaded mode
   012e6bceab53 dm linear: fix linear_end_io conditional definition
   996a427d8683 dm linear: eliminate linear_end_io call if CONFIG_DM_ZONED disabled
   689ba84574c2 dm: fix report zone remapping to account for partition offset
   e725141c0f4e dm cache: destroy migration_cache if cache target registration failed
   d8e15b143e4d s390/cio: Fix how vfio-ccw checks pinned pages
   b51943f088e5 perf script python: Fix export-to-sqlite.py sample columns
   cfb08fb1815f perf script python: Fix export-to-postgresql.py occasional failure
   37e64cb69f0f percpu: stop leaking bitmap metadata blocks
   71cfcc667ffa vsprintf: Fix off-by-one bug in bstr_printf() processing dereferenced pointers
   254754169d9d mach64: detect the dot clock divider correctly on sparc
   e4882348eaa9 MIPS: VDSO: Always map near top of user memory
   baa63c6a5b11 MIPS: Fix CONFIG_CMDLINE handling
   84a397478153 afs: Fix clearance of reply
   b28b1a5f8653 afs: Fix afs_server struct leak
   04473bb7793b mm/vmstat.c: fix outdated vmstat_text
   62aad93f09c1 mm: slowly shrink slabs with a relatively small number of objects
   3792c002b9ff drm/amdkfd: Fix ATS capablity was not reported correctly on some APUs
   c2fd5b21cbd9 drm/amdkfd: Change the control stack MTYPE from UC to NC on GFX9
   2d3966dd95dc drm/amdgpu: Fix SDMA HQD destroy error on gfx_v7
   1c9f357d3ebb x86/kvm/lapic: always disable MMIO interface in x2APIC mode
   5d85d4e0e105 pinctrl: cannonlake: Fix gpio base for GPP-E
   9f8318a1c50c clk: x86: Stop marking clocks as CLK_IS_CRITICAL
   81b8b9dffca8 clk: x86: add "ether_clk" alias for Bay Trail / Cherry Trail
   b25a8dd9895b PCI: hv: support reporting serial number as slot information
   aed5429279f8 ARM: dts: at91: add new compatibility string for macb on sama5d3
   ee62a5d3ea8a net: macb: disable scatter-gather for macb on sama5d3
   53035808c294 net: ethernet: ti: add missing GENERIC_ALLOCATOR dependency
   8be050c4011b hwmon: (nct6775) Use different register to get fan RPM for fan7
   1d753e689276 stmmac: fix valid numbers of unicast filter entries
   d8eeee24ced8 hwmon: (nct6775) Fix RPM output for fan7 on NCT6796D
   510dc356ff2c hwmon: (nct6775) Fix virtual temperature sources for NCT6796D
   4dc76c13f297 bpf: use __GFP_COMP while allocating page
   d2440a0b0672 bpf: btf: Fix end boundary calculation for type section
   aeaca3563bea sound: don't call skl_init_chip() to reset intel skl soc
   9761976f8e01 sound: enable interrupt after dma buffer initialization
   a1d77f9cd10a scsi: qla2xxx: Fix an endian bug in fcpcmd_is_corrupted()
   9ac4572a7374 scsi: iscsi: target: Don't use stack buffer for scatterlist
   970f5df113b1 KVM: PPC: Book3S HV: Don't use compound_order to determine host mapping size
   ba73c6ed5010 mfd: omap-usb-host: Fix dts probe of children
   e7c4c41389ff Bluetooth: hci_ldisc: Free rw_semaphore on close
   0d95a3d1fcf6 Bluetooth: Use correct tfm to generate OOB data
   3194c412f471 Bluetooth: SMP: Fix trying to use non-existent local OOB data
   5421ce8b59bc drm/pl111: Make sure of_device_id tables are NULL terminated
   d0200873bc9c ASoC: AMD: Ensure reset bit is cleared before configuring
   5d1a5a5eed92 Fix cg_read_strcmp()
   636dd4536009 hwmon: (nct6775) Fix access to fan pulse registers
   59fcb2491ca0 ASoC: rsnd: don't fallback to PIO mode when -EPROBE_DEFER
   ee3953f7b81c ASoC: rsnd: adg: care clock-frequency size
   b7bad669da54 selftests: memory-hotplug: add required configs
   9a90b9e380c5 selftests/efivarfs: add required kernel configs
   40299ec565fa selftests: add headers_install to lib.mk
   36a89768d19f ASoC: q6routing: initialize data correctly
   64458ca97124 ASoC: sigmadsp: safeload should not have lower byte limit
   4a7f15b6d5fa ASoC: wm8804: Add ACPI support
   55261a2cddb5 ASoC: max98373: Added 10ms sleep after amp software reset
   686da99baa28 selftests: kselftest: Remove outdated comment
   6a4d1b70e323 selftests: android: move config up a level
   334411face5a ASoC: rt5514: Fix the issue of the delay volume applied again
   e4c577698c7c ASoC: max98373: Added speaker FS gain cotnrol register to volatile.
   6e6b32ed0413 ASoC: dapm: Fix NULL pointer deference on CODEC to CODEC DAIs
   ffac8fa2bee5 vxlan: fill ttl inherit info
   241e5a13a5ad r8169: set RX_MULTI_EN bit in RxConfig for 8168F-family chips
   87441df1e19e r8169: fix network stalls due to missing bit TXCFG_AUTO_FIFO
   761ea5beff71 qed: Fix shmem structure inconsistency between driver and the mfw.
   6133d8e499e6 net: mscc: fix the frame extraction into the skb
   d29a558b56ee net/ipv6: stop leaking percpu memory in fib6 info
   e3827b9bc3ba net/ipv6: Remove extra call to ip6_convert_metrics for multipath case
   47049f54f89d bnxt_en: get the reduced max_irqs by the ones used by RDMA
   dce53396b52d bnxt_en: Fix enables field in HWRM_QUEUE_COS2BW_CFG request
   23631aa634ef net/mlx5: Check for SQ and not RQ state when modifying hairpin SQ
   6691a126ed63 net: ipv4: don't let PMTU updates increase route MTU
   530a9463cbe6 bnxt_en: Fix VNIC reservations on the PF.
   5d4fe8e6344b rtnetlink: Fail dump if target netnsid is invalid
   36298c66d8dc net: dsa: b53: Keep CPU port as tagged in all VLANs
   efef3f2073d1 inet: make sure to grab rcu_read_lock before using ireq->ireq_opt
   9fd4b0122ac3 tcp/dccp: fix lockdep issue when SYN is backlogged
   54d72415f8b2 sfp: fix oops with ethtool -m
   24205e4e62dd net: phy: phylink: fix SFP interface autodetection
   37b309773a67 net-ethtool: ETHTOOL_GUFO did not and should not require CAP_NET_ADMIN
   2402fbb7aa01 bnxt_en: don't try to offload VLAN 'modify' action
   f219cd971281 nfp: avoid soft lockups under control message storm
   2b4588d75b89 net: stmmac: Rework coalesce timer and fix multi-queue races
   8f389cd37d10 bonding: fix warning message
   5fb48fe95e41 bonding: pass link-local packets to bonding master also.
   92a2a40c876f net/mlx5: E-Switch, Fix out of bound access when setting vport rate
   02e16d375ee6 net: aquantia: memory corruption on jumbo frames
   6db3fc2839be net/mlx5e: Set vlan masks for all offloaded TC rules
   42296a164196 net: dsa: bcm_sf2: Fix unbind ordering
   53afeb0b222b net/packet: fix packet drop as of virtio gso
   75ebeb2e6a60 net: stmmac: Fixup the tail addr setting in xmit path
   0c5eff9c2cf2 tun: napi flags belong to tfile
   d013c6b952f0 tun: initialize napi_mutex unconditionally
   7d96410f397b tun: remove unused parameters
   095a5309c6c6 net: qualcomm: rmnet: Fix incorrect allocation flag in receive path
   9db5df4c92dd net: qualcomm: rmnet: Fix incorrect allocation flag in transmit
   3283c92e91f7 net: qualcomm: rmnet: Skip processing loopback packets
   3ab83c6a1fb4 udp: Unbreak modules that rely on external __skb_recv_udp() availability
   4f6017d6ef53 tipc: fix flow control accounting for implicit connect
   0240ca1b11d3 team: Forbid enslaving team device to itself
   375c63d4a70c sctp: update dst pmtu with the correct daddr
   2ac4b03c0fcc rtnl: limit IFLA_NUM_TX_QUEUES and IFLA_NUM_RX_QUEUES to 4096
   5369306f960f rtnetlink: fix rtnl_fdb_dump() for ndmsg header
   7f4a4fa5fa58 qmi_wwan: Added support for Gemalto's Cinterion ALASxx WWAN interface
   cbf2e16dd724 qlcnic: fix Tx descriptor corruption on 82xx devices
   0993dc028ed2 net/usb: cancel pending work when unbinding smsc75xx
   a308452e12c0 net: systemport: Fix wake-up interrupt race during resume
   6da1bd2d008f net: sched: cls_u32: fix hnode refcounting
   57ad6586fd57 net: sched: Add policy validation for tc attributes
   94d93e549eb1 net: mvpp2: fix a txq_done race condition
   ac521a40054c net: mvpp2: Extract the correct ethtype from the skb for tx csum offload
   dbbae2c07809 netlabel: check for IPV4MASK in addrinfo_get
   e4a00db35924 net/ipv6: Display all addresses in output of /proc/net/if_inet6
   ff34695ced21 net: ipv4: update fnhe_pmtu when first hop's MTU changes
   87d57bb87dd8 net: hns: fix for unmapping problem when SMMU is on
   1ae21378ab43 net: dsa: bcm_sf2: Call setup during switch resume
   08e8e22b6d3a ipv6: take rcu lock in rawv6_send_hdrinc()
   18ea575f665d ipv4: fix use-after-free in ip_cmsg_recv_dstaddr()
   fa111ec2d2c5 ip_tunnel: be careful when accessing the inner header
   84b262a5a008 ip6_tunnel: be careful when accessing the inner header
   1b420a9999f0 bonding: avoid possible dead-lock
   2fc26dfba49d bnxt_en: free hwrm resources, if driver probe fails.
   f462adcb0638 bnxt_en: Fix TX timeout during netpoll.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 20 ++++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index cd685bd5b6a5..4bb25488d94e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8334c6cfdac2036631caa877ffad8d3ec424a265"
-SRCREV_meta ?= "ed1978c99214b03740a8989d46f175252435ddc2"
+SRCREV_machine ?= "5b9223498c5870c46d9c8bb87db649d00dad7abe"
+SRCREV_meta ?= "5a99020e693eebe662ae0c4c08b65afedbd5cde3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.18.14"
+LINUX_VERSION ?= "4.18.17"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index 145992e5d75e..d8e0a40f7b69 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.18.14"
+LINUX_VERSION ?= "4.18.17"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "fad657599d15977f1ecb5cdf1719526dacf5f529"
-SRCREV_machine ?= "2ba9a28434f83c917ad3cfb8b4f7db6066c26a99"
-SRCREV_meta ?= "ed1978c99214b03740a8989d46f175252435ddc2"
+SRCREV_machine_qemuarm ?= "5b8abdbe6fb783fe30c835ff63008eb43257f32c"
+SRCREV_machine ?= "218a2500084b70dfe9cedd3856ec572563d55ace"
+SRCREV_meta ?= "5a99020e693eebe662ae0c4c08b65afedbd5cde3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index 70fadcc10456..6097e434154a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -11,21 +11,21 @@ KBRANCH_qemux86  ?= "v4.18/standard/base"
 KBRANCH_qemux86-64 ?= "v4.18/standard/base"
 KBRANCH_qemumips64 ?= "v4.18/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "285677060e108d00ed786b5347d447807d94a963"
-SRCREV_machine_qemuarm64 ?= "2ba9a28434f83c917ad3cfb8b4f7db6066c26a99"
-SRCREV_machine_qemumips ?= "cbfe1fd6157ff4a1497dad50164bd493cb680f17"
-SRCREV_machine_qemuppc ?= "2ba9a28434f83c917ad3cfb8b4f7db6066c26a99"
-SRCREV_machine_qemux86 ?= "2ba9a28434f83c917ad3cfb8b4f7db6066c26a99"
-SRCREV_machine_qemux86-64 ?= "2ba9a28434f83c917ad3cfb8b4f7db6066c26a99"
-SRCREV_machine_qemumips64 ?= "090c1efbf5d1e9267f73eec102a53ea7b155d7c1"
-SRCREV_machine ?= "2ba9a28434f83c917ad3cfb8b4f7db6066c26a99"
-SRCREV_meta ?= "ed1978c99214b03740a8989d46f175252435ddc2"
+SRCREV_machine_qemuarm ?= "eb0ef26f2bac0cd84961eba7038e8ff10c6a6fb1"
+SRCREV_machine_qemuarm64 ?= "218a2500084b70dfe9cedd3856ec572563d55ace"
+SRCREV_machine_qemumips ?= "7f7ea78d7b783413033d6adf45ec8952f8c98d60"
+SRCREV_machine_qemuppc ?= "218a2500084b70dfe9cedd3856ec572563d55ace"
+SRCREV_machine_qemux86 ?= "218a2500084b70dfe9cedd3856ec572563d55ace"
+SRCREV_machine_qemux86-64 ?= "218a2500084b70dfe9cedd3856ec572563d55ace"
+SRCREV_machine_qemumips64 ?= "db0ce433d9b74830d5b8dd3171ffbd7b1119cbfa"
+SRCREV_machine ?= "218a2500084b70dfe9cedd3856ec572563d55ace"
+SRCREV_meta ?= "5a99020e693eebe662ae0c4c08b65afedbd5cde3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.18.14"
+LINUX_VERSION ?= "4.18.17"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.5.0


