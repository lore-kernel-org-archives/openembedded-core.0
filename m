Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A312A77E12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 16:49:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6DGnCuU007223
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Jul 2017 09:49:12 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 13 Jul 2017 09:49:12 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 13 Jul 2017 12:49:11 -0400
Message-ID: <1499964551-22966-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [v2 PATCH] linux-yocto/4.1: update to v4.1.42
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
X-List-Received-Date: Thu, 13 Jul 2017 16:49:11 -0000
Content-Type: text/plain

Integrating the korg -stable update that comprises the following
commits:

   2ac51e21d8c5 Linux 4.1.42
   dcda279dede7 mm: fix new crash in unmapped_area_topdown()
   8b18c6b2a0dd mm: larger stack guard gap, between vmas
   55e6060ddd5f alarmtimer: Rate limit periodic intervals
   cedbfb3dc38c MIPS: Fix bnezc/jialc return address calculation
   d490b0caf87f usb: dwc3: exynos fix axius clock error path to do cleanup
   61e04a644bd8 genirq: Release resources in __setup_irq() error path
   ec8376b633c9 swap: cond_resched in swap_cgroup_prepare()
   331720703ebb mm/memory-failure.c: use compound_head() flags for huge pages
   e28840566853 USB: gadgetfs, dummy-hcd, net2280: fix locking for callbacks
   7ed474c302c1 usb: xhci: ASMedia ASM1042A chipset need shorts TX quirk
   235efbf2e58c drivers/misc/c2port/c2port-duramar2150.c: checking for NULL instead of IS_ERR()
   d5db08763ef2 usb: r8a66597-hcd: decrease timeout
   152c8dcf311c usb: r8a66597-hcd: select a different endpoint on timeout
   08e1f9869489 USB: gadget: dummy_hcd: fix hub-descriptor removable fields
   0758e6a95a00 [media] pvrusb2: reduce stack usage pvr2_eeprom_analyze()
   bdc69cc86e01 usb: core: fix potential memory leak in error path during hcd creation
   11f00c7e1194 USB: hub: fix SS max number of ports
   e507356624f1 iio: proximity: as3935: recalibrate RCO after resume
   fe9474901810 staging: rtl8188eu: prevent an underflow in rtw_check_beacon_data()
   94bfe4f31f46 mfd: omap-usb-tll: Fix inverted bit use for USB TLL mode
   49919278f4ce x86/mm/32: Set the '__vmalloc_start_set' flag in initmem_init()
   daccc774edf2 serial: efm32: Fix parity management in 'efm32_uart_console_get_options()'
   394dc0f7c2ae mac80211: don't send SMPS action frame in AP mode when not needed
   8373afb6cb12 mac80211: fix IBSS presp allocation size
   26e7f9d274cf mac80211: fix CSA in IBSS mode
   5125e4a41299 mac80211/wpa: use constant time memory comparison for MACs
   1a8dacfbbbe7 mac80211: don't look at the PM bit of BAR frames
   61df07cce8eb [media] vb2: Fix an off by one error in 'vb2_plane_vaddr'
   6ea9210c046f can: gs_usb: fix memory leak in gs_cmd_reset()
   d30248c41364 configfs: Fix race between create_link and configfs_rmdir
   9307fb9f34e1 sparc64: make string buffers large enough
   b865f707d7c6 xtensa: don't use linux IRQ #0
   ddda59580e10 tipc: ignore requests when the connection state is not CONNECTED
   1b98bab153c7 proc: add a schedule point in proc_pid_readdir()
   a20b7cab8735 romfs: use different way to generate fsid for BLOCK or MTD
   3e335922279b mn10300: fix build error of missing fpu_save()
   86e9b2ee9cc6 sctp: sctp_addr_id2transport should verify the addr before looking up assoc
   5fbc861ad7eb r8152: re-schedule napi for tx
   41e0083c7ddb drm/ast: Fixed system hanged if disable P2A
   9b50bb2bc343 drm/nouveau: Don't enabling polling twice on runtime resume
   c29b8f7d2d1e parisc, parport_gsc: Fixes for printk continuation lines
   8cc579971086 net: adaptec: starfire: add checks for dma mapping errors
   6d43352435ba net/mlx4_core: Avoid command timeouts during VF driver device shutdown
   295a19f594e8 drm/nouveau/fence/g84-: protect against concurrent access to semaphore buffers
   510c29634e35 fscache: Clear outstanding writes when disabling a cookie
   42c32ac3cec6 ethtool: do not vzalloc(0) on registers dump
   eaabe4b74095 log2: make order_base_2() behave correctly on const input value zero
   8bc30cf03ca1 kasan: respect /proc/sys/kernel/traceoff_on_warning
   acd666657821 jump label: pass kbuild_cflags when checking for asm goto support
   cb2098ab876e PM / runtime: Avoid false-positive warnings from might_sleep_if()
   d3121ad14562 ARM: defconfigs: make NF_CT_PROTO_SCTP and NF_CT_PROTO_UDPLITE built-in
   4c8eb6278488 ipv6: Fix IPv6 packet loss in scenarios involving roaming + snooping switches
   0def8e45d25f sierra_net: Add support for IPv6 and Dual-Stack Link Sense Indications
   0c2950fa861d sierra_net: Skip validating irrelevant fields for IDLE LSIs
   a9cbb7cd1868 NET: mkiss: Fix panic
   d914dc3b811d NET: Fix /proc/net/arp for AX.25
   68978d69ea6f ipv6: Inhibit IPv4-mapped src address on the wire.
   197082364320 ipv6: Handle IPv4-mapped src to in6addr_any dst.
   dd4d061cf1f6 net: xilinx_emaclite: fix receive buffer overflow
   742e7978eaba net: xilinx_emaclite: fix freezes due to unordered I/O
   afae1d9da32e partitions/msdos: FreeBSD UFS2 file systems are not recognized
   7f6abe4c0560 PCI/PM: Add needs_resume flag to avoid suspend complete optimization
   cd1c4f855f68 usercopy: Adjust tests to deal with SMAP/PAN
   9da808668b58 arm64: entry: improve data abort handling of tagged pointers
   47e49f2d1eda drivers: char: mem: Fix wraparound check to allow mappings up to the end
   bb3556c1d155 ASoC: Fix use-after-free at card unregistration
   88c41586db86 ALSA: timer: Fix missing queue indices reset at SNDRV_TIMER_IOCTL_SELECT
   5d28ba6eecde ALSA: timer: Fix race between read and ioctl
   29837be8e922 drm/vmwgfx: Handle vmalloc() failure in vmw_local_fifo_reserve()
   d6f90404eaa0 perf/core: Drop kernel samples even though :u is specified
   f44556278b79 powerpc/hotplug-mem: Fix missing endian conversion of aa_index
   7ee9689e6b68 powerpc/numa: Fix percpu allocations to be NUMA aware
   eecbbd835e2e scsi: qla2xxx: don't disable a not previously enabled PCI device
   4a213a0fe0b3 KVM: arm/arm64: Handle possible NULL stage2 pud when ageing pages
   951269f95603 btrfs: fix memory leak in update_space_info failure path
   d42014c8d4ce btrfs: use correct types for page indices in btrfs_page_exists_in_range
   cc558c203ce1 cxl: Fix error path on bad ioctl
   c58e11d1da35 ufs: set correct ->s_maxsize
   7ba100d53ebc fix ufs_isblockset()
   7f8053503ed2 cpuset: consider dying css as offline
   51037ec2ee8e iio: proximity: as3935: fix AS3935_INT mask
   60e9d774dc8e staging/lustre/lov: remove set_fs() call from lov_getstripe()
   6f4f7e81b18e usb: chipidea: debug: check before accessing ci_role
   9738b3df00b1 usb: chipidea: udc: fix NULL pointer dereference if udc_start failed
   db87e41d61aa usb: gadget: f_mass_storage: Serialize wake and sleep execution
   926295793364 ext4: keep existing extra fields when inode expands
   4d1adc2ada19 ext4: fix SEEK_HOLE
   8406f302e985 KVM: async_pf: avoid async pf injection when in guest mode
   fdb67b2a3a16 arm: KVM: Allow unaligned accesses at HYP
   1e8dabb6aa14 KVM: cpuid: Fix read/write out-of-bounds vulnerability in cpuid emulation
   702eb8d270f2 kvm: async_pf: fix rcu_irq_enter() with irqs enabled
   4b1bf4b008ca nfsd4: fix null dereference on replay
   026ed759f4f4 crypto: gcm - wait for crypto op not signal safe
   e02ed52dd2d3 KEYS: fix freeing uninitialized memory in key_update()
   a38f69cb4a22 ptrace: Properly initialize ptracer_cred on fork
   94d53c5028a3 arch/sparc: support NR_CPUS = 4096
   252bf31f5d91 sparc64: delete old wrap code
   0837a0481106 sparc64: new context wrap
   169dc5fd241d sparc64: add per-cpu mm of secondary contexts
   ccadb4e680e9 sparc64: redefine first version
   5203c6c92724 sparc64: combine activate_mm and switch_mm
   317a444875fd sparc64: reset mm cpumask after wrap
   a2334e23c296 sparc: Machine description indices can vary
   8ee93884863e sparc64: mm: fix copy_tsb to correctly copy huge page TSBs
   246fa51013e3 net: ethoc: enable NAPI before poll may be scheduled
   169a7e245c7f net: ping: do not abuse udp_poll()
   59dc08f8f5e7 ipv6: Fix leak in ipv6_gso_segment().
   f257e5d318a5 tcp: disallow cwnd undo when switching congestion control
   fa95ca65fb86 cxgb4: avoid enabling napi twice to the same queue
   cd276bb4fe54 ipv6: xfrm: Handle errors reported by xfrm6_find_1stfragopt()
   e616f6da095e bnx2x: Fix Multi-Cos
   d600ccd7fd21 xfs: fix unaligned access in xfs_btree_visit_blocks
   20d07bb1567a xfs: bad assertion for delalloc an extent that start at i_size
   45ed7e2f2f82 xfs: fix indlen accounting error on partial delalloc conversion
   1a229fd5ae97 xfs: wait on new inodes during quotaoff dquot release
   b822f03516c9 xfs: update ag iterator to support wait on new inodes
   821afaaed81d xfs: support ability to wait on new inodes
   9b1260c216af xfs: fix up quotacheck buffer list error handling
   022e9b0e554b xfs: prevent multi-fsb dir readahead from reading random blocks
   641967d1f903 xfs: handle array index overrun in xfs_dir2_leaf_readbuf()
   17d031b4add7 xfs: fix over-copying of getbmap parameters from userspace
   74d27999c51e xfs: use dedicated log worker wq to avoid deadlock with cil wq
   ddf2f45b3344 xfs: fix kernel memory exposure problems
   9bf638a08ad2 mm/migrate: fix refcount handling when !hugepage_migration_supported()
   c7dbf874d6b5 drm/radeon/ci: disable mclk switching for high refresh rates (v2)
   9fcaaa87e08c fs/ufs: Set UFS default maximum bytes per file
   b36188f229d6 sparc: Fix -Wstringop-overflow warning
   80f68f7daeb3 sctp: fix ICMP processing if skb is non-linear
   01426eb3503d tcp: avoid fastopen API to be used on AF_UNSPEC
   a10f1d6ad744 virtio-net: enable TSO/checksum offloads for Q-in-Q vlans
   a05aec67cd6b be2net: Fix offload features for Q-in-Q packets
   b7b05a3b40e8 vlan: Fix tcp checksum offloads in Q-in-Q vlans
   d78ddec4e7fb ipv6: fix out of bound writes in __ip6_append_data()
   acf388f77791 qmi_wwan: add another Lenovo EM74xx device ID
   7144c12e891d ipv6: Check ip6_find_1stfragopt() return value properly.
   e7f05ff30b0c ipv6: Prevent overrun when parsing v6 header options
   3e674773cb5e tcp: eliminate negative reordering in tcp_clean_rtx_queue
   e7b4f3d39f46 sctp: do not inherit ipv6_{mc|ac|fl}_list from parent
   61d62ee79cec tcp: avoid fragmenting peculiar skbs in SACK
   93dcd4929d18 net: fix compile error in skb_orphan_partial()
   7a230cfdf208 netem: fix skb_orphan_partial()
   8404b686a33c s390/qeth: avoid null pointer dereference on OSN
   89b9ca1dd7d0 s390/qeth: unbreak OSM and OSN support
   0b651772fed7 s390/qeth: handle sysfs error during initialization
   4e0ecb773276 dccp/tcp: do not inherit mc_list from parent
   4bd4cfc5210e Linux 4.1.41
   c1dd3f51ad77 mm/huge_memory.c: respect FOLL_FORCE/FOLL_COW for thp
   afeb39160249 xc2028: Fix use-after-free bug properly
   5eef36af5974 iio: proximity: as3935: fix as3935_write
   e8701e0f6768 ipx: call ipxitf_put() in ioctl error path
   709dcf11a353 sched/fair: Initialize throttle_count for new task-groups lazily
   0f665ed5581f sched/fair: Do not announce throttled next buddy in dequeue_task_fair()
   953334de0819 iio: dac: ad7303: fix channel description
   60e2e499e37d mwifiex: pcie: fix cmd_buf use-after-free in remove/reset
   036ab4111761 rtlwifi: rtl8821ae: setup 8812ae RFE according to device type
   df8198865a0f ARM: tegra: paz00: Mark panel regulator as enabled on boot
   fda7c899dd76 fs/xattr.c: zero out memory copied to userspace in getxattr
   273225634fef vfio/type1: Remove locked page accounting workqueue
   358fa411ba9a crypto: algif_aead - Require setkey before accept(2)
   e0b7d5eae185 staging: gdm724x: gdm_mux: fix use-after-free on module unload
   47655216cdf4 drm/ttm: fix use-after-free races in vm fault handling
   46527f8d11fa f2fs: sanity check segment count
   2b674f4ecce8 ipv6: reorder ip6_route_dev_notifier after ipv6_dev_notf
   4aaeda7f5c4f ipv6: initialize route null entry in addrconf_init()
   1d9afaa5c0a8 rtnetlink: NUL-terminate IFLA_PHYS_PORT_NAME string
   226d200531f4 ipv4, ipv6: ensure raw socket message is big enough to hold an IP header
   14e82f4ce5bb tcp: fix wraparound issue in tcp_lp
   38853e5c3775 tcp: do not underestimate skb->truesize in tcp_trim_head()
   918d8536e126 ALSA: hda - Fix deadlock of controller device lock at unbinding
   1c370084c6f3 staging: emxx_udc: remove incorrect __init annotations
   8602853345b7 staging: wlan-ng: add missing byte order conversion
   bd253cf63929 brcmfmac: Make skb header writable before use
   c4efbc9ce69d brcmfmac: Ensure pointer correctly set if skb data location changes
   62494116045e MIPS: R2-on-R6 MULTU/MADDU/MSUBU emulation bugfix
   48ea252abd40 scsi: mac_scsi: Fix MAC_SCSI=m option when SCSI=m
   ddfc6a095d10 serial: 8250_omap: Fix probe and remove for PM runtime
   2c7105e86e3d USB: serial: io_edgeport: fix descriptor error handling
   00f244650faf USB: serial: mct_u232: fix modem-status error handling
   0379d54281fc USB: serial: quatech2: fix control-message error handling
   e2eaebce9d20 USB: serial: ftdi_sio: fix latency-timer error handling
   e7ccc604153b USB: serial: ark3116: fix open error handling
   b5b985c3a0bd USB: serial: ti_usb_3410_5052: fix control-message error handling
   dc7697bad3f6 USB: serial: io_edgeport: fix epic-descriptor handling
   4e78688b4cb3 USB: serial: ssu100: fix control-message error handling
   0f5e27457f1a USB: serial: digi_acceleport: fix incomplete rx sanity check
   5d7985765271 USB: serial: keyspan_pda: fix receive sanity checks
   9de980a19940 usb: host: ohci-exynos: Decrese node refcount on exynos_ehci_get_phy() error paths
   08fd577b4b0f usb: host: ehci-exynos: Decrese node refcount on exynos_ehci_get_phy() error paths
   0a9f0af48e3f KVM: nVMX: initialize PML fields in vmcs02
   4736ccc83dfc Revert "KVM: nested VMX: disable perf cpuid reporting"
   7a07dbb8c25c x86/platform/intel-mid: Correct MSI IRQ line for watchdog device
   92e01bd47512 kprobes/x86: Fix kernel panic when certain exception-handling addresses are probed
   19d416eaccbb x86/pci-calgary: Fix iommu_free() comparison of unsigned expression >= 0
   ae0f7bd8e226 mwifiex: Avoid skipping WEP key deletion for AP
   34390bea46f7 mwifiex: remove redundant dma padding in AMSDU
   a5a09b34dab1 mwifiex: debugfs: Fix (sometimes) off-by-1 SSID print
   039747b6ef2d power: supply: bq24190_charger: Install irq_handler_thread() at end of probe()
   f3b0fe6bfcbf power: supply: bq24190_charger: Call set_mode_host() on pm_resume()
   0ba15a289c67 power: supply: bq24190_charger: Fix irq trigger to IRQF_TRIGGER_FALLING
   ab1b642339b3 powerpc/powernv: Fix opal_exit tracepoint opcode
   5d1767ceff1f cpupower: Fix turbo frequency reporting for pre-Sandy Bridge cores
   16968228efa5 9p: fix a potential acl leak
   c41e1ba87961 net: tg3: avoid uninitialized variable warning
   95660aa2822d mtd: avoid stack overflow in MTD CFI code
   b9e4b97eb9a0 drbd: avoid redefinition of BITS_PER_PAGE
   1de253cbd35b ALSA: ppc/awacs: shut up maybe-uninitialized warning
   db14464180fa timerfd: Protect the might cancel mechanism proper
   11d54db42149 ftrace/x86: Fix triple fault with graph tracing and suspend-to-ram
   77ded373242b ipv6: check raw payload size correctly in ioctl
   0c8f1722d1d6 ip6mr: fix notification device destruction
   7f4ab2ced0a7 netpoll: Check for skb->queue_mapping
   74c4460b6482 sctp: listen on the sock only when it's state is listening or closed
   7d1a0fdd41f8 net: ipv4: fix multipath RTM_GETROUTE behavior when iif is given
   6824dcd302fd l2tp: take reference on sessions being dumped
   cc09115fb0b9 net/packet: fix overflow in check for tp_reserve
   fed853407cc2 net/packet: fix overflow in check for tp_frame_nr
   9ba240219c96 l2tp: purge socket queues in the .destruct() callback
   28bad8a652e9 net: phy: handle state correctly in phy_stop_machine
   b39245e33e95 net: neigh: guard against NULL solicit() method
   9ffb20a69946 sparc64: Fix kernel panic due to erroneous #ifdef surrounding pmd_write()
   1acc886c425e sparc64: kern_addr_valid regression
   5023f12103b9 xen/x86: don't lose event interrupts
   b64d082304fe usb: gadget: f_midi: Fixed a bug when buflen was smaller than wMaxPacketSize
   e7211d1ff579 RDS: Fix the atomicity for congestion map update
   92bf6b466b99 MIPS: Fix crash registers on non-crashing CPUs
   d0388c0e2556 md:raid1: fix a dead loop when read from a WriteMostly disk
   f364181f7aa2 crypto: testmgr - fix out of bound read in __test_aead()
   9800a9a4b17a [media] xc2028: unlock on error in xc2028_set_config()
   c5ef0e9f70d1 f2fs: do more integrity verification for superblock
   5f1cef9e823a ping: implement proper locking
   9c90c093b98f staging/android/ion : fix a race condition in the ion driver
   073e9973d48b vfio/pci: Fix integer overflows, bitmask check
   e21b00fe6cc7 [media] xc2028: avoid use after free
   c8580e3dcd00 tipc: fix random link resets while adding a second bearer
   5eb668f8442e gfs2: avoid uninitialized variable warning
   6013c31fb7e1 hostap: avoid uninitialized variable use in hfa384x_get_rid
   56c3cd096747 tty: nozomi: avoid a harmless gcc warning
   39a978c3e192 tipc: re-enable compensation for socket receive buffer double counting
   0c28e96f0fec block: fix del_gendisk() vs blkdev_ioctl crash
   0c4670d5a6a4 Drivers: hv: balloon: account for gaps in hot add regions
   2cbbeec3e5a7 Drivers: hv: balloon: keep track of where ha_region starts
   5b9ab933c369 x86/mce/AMD: Give a name to MCA bank 3 when accessed with legacy MSRs
   749cab856042 Drivers: hv: vmbus: Reduce the delay between retries in vmbus_post_msg()
   38f9c4b9176a Drivers: hv: don't leak memory in vmbus_establish_gpadl()
   9f4a8ebb750b net: ipv6: check route protocol when deleting routes
   5ce729a895b0 tty/serial: atmel: RS485 half duplex w/DMA: enable RX after TX is done
   9d86a569dbd7 catc: Use heap buffer for memory size test
   4d7726afea37 catc: Combine failure cleanup code in catc_probe()
   61bd90b31be7 rtl8150: Use heap buffers for all register access
   7b69bee71416 pegasus: Use heap buffers for all register access
   0dd8a4702cbc virtio-console: avoid DMA from stack
   eb618d2eb22b mm: Tighten x86 /dev/mem with zeroing reads
   187887b3dbae rtc: tegra: Implement clock handling
   ea215d798bc2 platform/x86: acer-wmi: setup accelerometer when machine has appropriate notify event
   4473dc376c48 [media] dvb-usb-v2: avoid use-after-free
   68e9c254f662 kvm: fix page struct leak in handle_vmon
   f800bcede54d char: lack of bool string made CONFIG_DEVPORT always on
   d1cdf638cde8 char: Drop bogus dependency of DEVPORT on !M68K
   6d1174d8ff9d net/mlx4_core: Fix when to save some qp context flags for dynamic VST to VGT transitions
   8a8878b16056 net/mlx4_en: Fix bad WQE issue
   037948b4f092 usb: hub: Wait for connection to be reestablished after port reset
   dd07486ceba4 net/packet: fix overflow in check for priv area size
   c9d0eb33ba82 MIPS: Select HAVE_IRQ_EXIT_ON_IRQ_STACK
   cd7de3163c8c MIPS: Only change $28 to thread_info if coming from user mode
   aa7ae7fee5d6 mtd: bcm47xxpart: fix parsing first block after aligned TRX
   1669925abfce usb: dwc3: gadget: delay unmap of bounced requests
   aa612d59c08f mm/mempolicy.c: fix error handling in set_mempolicy and mbind.
   00fc586ea741 mlock: fix mlock count can not decrease in race condition
   001360714b85 mm/memory-failure: introduce get_hwpoison_page() for consistent refcount handling
   da7cbd0c660c mm/memory-failure: split thp earlier in memory error handling
   aeb3435b4987 slub/memcg: cure the brainless abuse of sysfs attributes
   afc6ec14b863 blkcg: use blkg_free() in blkcg_init_queue() failure path
   f9fac98fc753 blkcg: always create the blkcg_gq for the root blkcg
   712b6a6dceb2 iscsi-target: Use shash and ahash
   1bd31de39e62 target/iscsi: Use proper SGL accessors for digest computation
   89ff28d0d690 iscsi-target: Fix initial login PDU asynchronous socket close OOPs
   09cb399b6219 target/iscsi: Fix indentation in iscsi_target_start_negotiation()
   68185cb17f7e iscsi-target: Fix early sk_data_ready LOGIN_FLAGS_READY race
   5df474e63ca5 cpufreq: cpufreq_register_driver() should return -ENODEV if init fails
   7e144ca4d77a drm/msm: Expose our reservation object when exporting a dmabuf.
   7e185e0063bc xfs: Fix missed holes in SEEK_HOLE implementation
   59acce815cd6 xfs: fix off-by-one on max nr_pages in xfs_find_get_desired_pgoff()
   b96e5f18eb81 drm/radeon: Unbreak HPD handling for r600+
   81402e4033a7 dmaengine: ep93xx: Don't drain the transfers in terminate_all()
   1a45b842de71 dmaengine: ep93xx: Always start from BASE0
   72a5ed836013 drm/gma500/psb: Actually use VBT mode when it is found
   4f268a106e88 PCI / PM: Avoid resuming more devices during system suspend
   b060ae49eb94 PCI: Add quirk for Intel DH895xCC VF PCI config erratum
   e0bda32c5bc5 ALSA: hda - apply STAC_9200_DELL_M22 quirk for Dell Latitude D430
   9dbe42c5ae46 mmc: sdhci-iproc: suppress spurious interrupt with Multiblock read
   0210333e202b i2c: i2c-tiny-usb: fix buffer not being DMA capable
   8852d28b3f06 x86/mce: Don't use percpu workqueues
   94d42e8811f4 osf_wait4(): fix infoleak
   156c18c7d9ed KVM: X86: Fix read out-of-bounds vulnerability in kvm pio emulation
   e8b80de6d76e watchdog: pcwd_usb: fix NULL-deref at probe
   9ef27e6ccbe0 drivers: char: mem: Check for address space wraparound with mmap()
   682182e924ea serial: core: fix crash in uart_suspend_port
   b614900e0650 tty: Fix GPF in flush_to_ldisc()
   2e279b7d786c tty: fix data race in flush_to_ldisc
   3e984ccc90f8 serial: ifx6x60: fix use-after-free on module unload
   191c13c554e5 serial: ifx6x60: Remove dangerous spi_driver casts
   95a639d15067 Revert "tty_port: register tty ports with serdev bus"
   1520f7e76d45 tty_port: register tty ports with serdev bus
   0095625438b2 usb: musb: tusb6010_omap: Do not reset the other direction's packet size
   d7cc01aa1796 usb: host: xhci-plat: propagate return value of platform_get_irq()
   1458bfaae6c8 USB: xhci: fix lock-inversion problem
   a0334d0ba6ad usb: host: xhci: simplify irq handler return
   8732affeaf37 usb: host: xhci-mem: allocate zeroed Scratchpad Buffer
   2f68fe68ad96 xhci: apply PME_STUCK_QUIRK and MISSING_CAS quirk for Denverton
   e17762c03b3e tracing/kprobes: Enforce kprobes teardown after testing
   78de28c67c8f of: fdt: add missing allocation-failure check
   ac38837324c2 USB: serial: qcserial: add more Lenovo EM74xx device IDs
   2a3835ffa5ed USB: hub: fix non-SS hub-descriptor handling
   c5922c99f193 USB: hub: fix SS hub-descriptor handling
   de90980c52da USB: iowarrior: fix info ioctl on big-endian hosts
   46b3a375a926 uwb: fix device quirk on big-endian hosts
   8ace7b038603 USB: core: replace %p with %pK
   083112faaf11 USB: ene_usb6250: fix DMA to the stack
   a3670852d2fb USB: serial: ftdi_sio: add Olimex ARM-USB-TINY(H) PIDs
   d0e929a4e63f char: lp: fix possible integer overflow in lp_setup()
   da6d8dbb5da7 dm bufio: make the parameter "retain_bytes" unsigned long
   b9805634c6de genirq: Introduce struct irq_common_data to host shared irq data
   073bc325fdc4 usb: dwc3: make dwc3_debugfs_init return value be void
   83204fd38a02 kvm arm: Move fake PGD handling to arch specific files
   060e39373d8a ARM: KVM: Remove pointless void pointer cast
   0bef2bd6fa64 dmaengine: usb-dmac: Fix DMAOR AE bit definition
   873bdf5cd492 dm space map disk: fix some book keeping in the disk space map
   a42b975f484e dm thin metadata: call precommit before saving the roots
   2cd394cd1046 USB: serial: io_ti: fix div-by-zero in set_termios
   a1dfb5701675 USB: serial: mct_u232: fix big-endian baud-rate handling
   391f2e944624 USB: serial: ftdi_sio: fix setting latency for unprivileged users
   048a9813c3e5 usb: serial: option: add Telit ME910 support
   092c6f1e1630 ARM: dts: imx6sx-sdb: Remove OPP override
   ba640473d7c9 ARM: dts: imx6sx-sdb: Add 198MHz operational point
   4bb916c171fa cgroup: use bitmask to filter for_each_subsys
   034dd596324d sched, cgroup: reorganize threadgroup locking
   0e521eabd7a3 pid_ns: Sleep in TASK_INTERRUPTIBLE in zap_pid_ns_processes
   57cd95a5dcbc net: irda: irda-usb: fix firmware name on big-endian hosts
   38f915577c6e s390/cputime: fix incorrect system time
   98442999b967 dccp: fix freeing skb too early for IPV6_RECVPKTINFO
   56d847e3ef94 Linux 4.1.40
   5c564705d3f0 udp: properly support MSG_PEEK with truncated buffers
   f97e5ec81364 nfsd: encoders mustn't use unitialized values in error cases
   a7b4cdeb22f5 arm64: uaccess: ensure extension of access_ok() addr
   ed3ffd7c7fb9 arm64: documentation: document tagged pointer stack constraints
   f8a4b26e261d target/fileio: Fix zero-length READ and WRITE handling
   9d68722df885 CIFS: add misssing SFM mapping for doublequote
   14f24a466cd1 iscsi-target: Set session_fall_back_to_erl0 when forcing reinstatement
   3aa99b61c099 target: Fix compare_and_write_callback handling for non GOOD status
   0c5623052d48 of: fix sparse warning in of_pci_range_parser_one
   3e9e9c708f10 ceph: fix memory leak in __ceph_setxattr()
   009a83913e29 SMB3: Work around mount failure when using SMB3 dialect to Macs
   ffd28faab493 CIFS: fix mapping of SFM_SPACE and SFM_PERIOD
   ae5175c8dba4 fs/block_dev: always invalidate cleancache in invalidate_bdev()
   e895a1054e25 um: Fix PTRACE_POKEUSER on x86_64
   327d78550aea metag/uaccess: Check access_ok in strncpy_from_user
   31390049dfd2 Set unicode flag on cifs echo request to avoid Mac error
   3ea80afb2dce metag/uaccess: Fix access_ok()
   17535d260b75 target: Fix VERIFY and WRITE VERIFY command parsing
   edd3ad16ead4 dm bufio: check new buffer allocation watermark every 30 seconds
   bbe86592f9c3 dm bufio: avoid a possible ABBA deadlock
   9575253a91e6 Bluetooth: Fix user channel for 32bit userspace on 64bit kernel
   ca38d087f1b0 ext4: evict inline data when writing to memory map
   3a9700b0709e proc: Fix unbalanced hard link numbers
   2279c8b917f7 dm ioctl: prevent stack leak in dm ioctl call
   5afff19d82af nfsd: stricter decoding of write-like NFSv2/v3 ops
   24c3569dd195 nfsd4: minor NFSv2/v3 write decoding cleanup
   c9bb9f02b048 nfsd: check for oversized NFSv2/v3 arguments
   6a5e61496c48 usb: Make sure usb/phy/of gets built-in
   372323131cd0 ASoC: intel: Fix PM and non-atomic crash in bytcr drivers
   b583cc935477 Input: i8042 - add Clevo P650RS to the i8042 reset list
   56e191701252 dm era: save spacemap metadata root after the pre-commit
   6a887571cad2 dm btree: fix for dm_btree_find_lowest_key()
   2ad7696baa06 powerpc/pseries: Fix of_node_put() underflow during DLPAR remove
   e756dc9e7bfb IB/mlx4: Fix ib device initialization error flow
   50f63ac752b8 x86/boot: Fix BSS corruption/overwrite bug in early x86 kernel startup
   51cad4572c02 ring-buffer: Have ring_buffer_iter_empty() return true when empty
   2933c0ba9193 ACPI / power: Avoid maybe-uninitialized warning
   f7f44f588722 tracing: Allocate the snapshot buffer before enabling probe
   73270592d94b usb: host: xhci: print correct command ring address
   5ba52c08d1d1 [media] ttusb2: limit messages to buffer size
   e1dfe98dda6a USB: serial: ftdi_sio: add device ID for Microsemi/Arrow SF2PLUS Dev Kit
   00461b9f4817 PCI: Freeze PME scan before suspending devices
   57b8e3a6524b regulator: tps65023: Fix inverted core enable logic.
   1ff629068e6e [media] zr364xx: enforce minimum size when reading header
   a0f82864854a KEYS: fix keyctl_set_reqkey_keyring() to not leak thread keyrings
   86d961e25888 KEYS: Change the name of the dead type to ".dead" to prevent user access
   4ef48e49b1c5 KEYS: Disallow keyrings beginning with '.' to be joined as session keyrings
   369cd3933506 powerpc/kprobe: Fix oops when kprobed on 'stdu' instruction
   199ea04d7d01 cifs: Do not send echoes before Negotiate is complete
   b291f2ed870a p9_client_readdir() fix
   98ae917fd128 ARM: dts: at91: sama5d3_xplained: not all ADC channels are available
   429957317eac ARM: dts: at91: sama5d3_xplained: fix ADC vref
   c7f3669caa0b zram: do not use copy_page with non-page aligned address
   ac87ea2ff7d7 zram: fix operator precedence to get offset
   7bee1c58a629 ALSA: seq: Don't break snd_use_lock_sync() loop by timeout
   93dfafeefbb6 MIPS: KGDB: Use kernel context for sleeping threads
   22afb4fc42e4 PCI: Fix pci_mmap_fits() for HAVE_PCI_RESOURCE_TO_USER platforms
   1ecc90c7e6b4 MIPS: Avoid BUG warning in arch_check_elf
   396f0fe4cc1b s390/mm: fix CMMA vs KSM vs others
   fab0b034bd91 serial: omap: suspend device on probe errors
   0ea0b8f3adbe serial: omap: fix runtime-pm handling on unbind
   113cc52cf9fe CIFS: store results of cifs_reopen_file to avoid infinite wait
   5c6d0e841556 CIFS: remove bad_network_name flag
   417dc40ebaf2 Input: xpad - add support for Razer Wildcat gamepad
   3a5df486f2e1 x86/vdso: Plug race between mapping and ELF header setup
   7ec71e0bb16d md: update slab_cache before releasing new stripes when stripes resizing
   2da764d4c67b padata: free correct variable
   ce0e21e44f97 crypto: ahash - Fix EINPROGRESS notification callback
   4ee5f3baad19 [media] cx231xx-audio: fix NULL-deref at probe
   8b6c66045c33 [media] cx231xx-audio: fix init error path
   5a4e9221b31b [media] cx231xx-cards: fix NULL-deref at probe
   a44bcf6b4c54 [media] usbvision: fix NULL-deref at probe
   c7bcf82e59ea [media] dib0700: fix NULL-deref at probe
   27a0c2317453 serial: samsung: Use right device for DMA-mapping calls
   5eb0c97fc835 sysfs: be careful of error returns from ops->show()
   dad2a28d46e7 staging: android: ashmem: lseek failed due to no FMODE_LSEEK.
   4ac302f8832f usb: misc: add missing continue in switch
   34a2eb59fc13 ptrace: fix PTRACE_LISTEN race corrupting task->state
   8624aeaec37d scsi: sd: Fix capacity calculation with 32-bit sector_t
   9535300dd7e2 scsi: sr: Sanity check returned mode data
   21ebc869930a ipmi: Fix kernel panic at ipmi_ssif_thread()
   82bfc1d9bc5d xen, fbfront: fix connecting to backend
   8dd5c1281e98 Reset TreeId to zero on SMB2 TREE_CONNECT
   3707e32c8fcc [media] s5p-mfc: Fix unbalanced call to clock management
   01ea8f2396af [media] gspca: konica: add missing endpoint sanity check
   206374212c28 IB/IPoIB: ibX: failed to create mcg debug file
   f585e26312b5 metag/usercopy: Add missing fixups
   c31ac9be1dc2 metag/usercopy: Fix src fixup in from user rapf loops
   09e3cca03b29 metag/usercopy: Set flags before ADDZ
   7c3a804c24cc metag/usercopy: Zero rest of buffer from copy_from_user
   f58b27f0ce36 metag/usercopy: Add early abort to copy_to_user
   fde1ed807fc6 metag/usercopy: Fix alignment error checking
   59465f2b425d metag/usercopy: Drop unused macros
   8da28861bfab ring-buffer: Fix return value check in test_ringbuffer()
   4cc0a6f14611 crypto: caam - fix RNG deinstantiation error checking
   c94b3a0d7a27 powerpc/mm: Add missing global TLB invalidate if cxl is active
   ca4f5edccb94 ath9k_htc: fix NULL-deref at probe
   783494a2cf45 powerpc: Don't try to fix up misaligned load-with-reservation instructions
   ea42f85ce0a6 kvm: arm/arm64: Fix locking for kvm_free_stage2_pgd
   407526d5f5cc tpm: add sleep only for retry in i2c_nuvoton_write_status()
   779a96681b4b tpm_crb: check for bad response size
   331f718a9746 tpm: msleep() delays - replace with usleep_range() in i2c nuvoton driver
   e43c2447f8ed iscsi-target: Drop work-around for legacy GlobalSAN initiator
   d2762e9848bb cdc-acm: fix possible invalid access when processing notification
   4d8a7de65c82 mm, hugetlb: use pte_present() instead of pmd_present() in follow_huge_pmd()
   5c9eddc3db73 ALSA: hda - fix a problem for lineout on a Dell AIO machine
   d91a91d8f6ba drm/vmwgfx: fix integer overflow in vmw_surface_define_ioctl()
   6431059d9e0f drm/vmwgfx: Remove getparam error message
   b31c507e2c3b drm/vmwgfx: avoid calling vzalloc with a 0 size in vmw_get_cap_3d_ioctl()
   13b52a46a677 drm/vmwgfx: NULL pointer dereference in vmw_surface_define_ioctl()
   55f1d24ac1ab drm/vmwgfx: Type-check lookups of fence objects
   18bcea4e8d2e iscsi-target: Fix TMR reference leak during session shutdown
   bfa5d70414f2 ubi/upd: Always flush after prepared for an update
   c127ce428b73 s390/uaccess: get_user() should zero on failure (again)
   0d2f98e74d4f USB: Proper handling of Race Condition when two USB class drivers try to call init_usb_class simultaneously
   6842ff6056ea ACPI: Fix incompatibility with mcount-based function graph tracing
   e5dcf4e37e91 ACPI: Do not create a platform_device for IOAPIC/IOxAPIC
   e2b3e7de14ba virtio_balloon: init 1st buffer in stats vq
   a205b2e5a2a0 powerpc: Disable HFSCR[TM] if TM is not supported
   f8889a244545 drm/radeon: Override fpfn for all VRAM placements in radeon_evict_flags
   848f94592710 USB: fix linked-list corruption in rh_call_control()
   3492352e1f34 ALSA: seq: Fix race during FIFO resize
   55e9d9474816 [media] mceusb: fix NULL-deref at probe
   91848cdb7ae7 xen/acpi: upload PM state from init-domain to Xen
   970a7a72b32d pinctrl: qcom: Don't clear status bit on irq_unmask
   fbb9dd5123de mmc: sdhci: Do not disable interrupts while waiting for clock
   a2f7beb42427 usb: hub: Do not attempt to autosuspend disconnected devices
   041fad219db7 usb: gadget: f_uvc: Fix SuperSpeed companion descriptor's wBytesPerInterval
   d4cbbe1460c4 s390/decompressor: fix initrd corruption caused by bss clear
   f1c9472e3dce ALSA: seq: Fix racy cell insertions during snd_seq_pool_done()
   d57b1afab5a8 scsi: libsas: fix ata xfer length
   972d4b4f2c7b arm/arm64: KVM: Take mmap_sem in kvm_arch_prepare_memory_region
   474d78d49b8b arm/arm64: KVM: Take mmap_sem in stage2_unmap_vm
   d59cf3fa94db USB: serial: qcserial: add Dell DW5811e
   6338e370099a x86/perf: Fix CR4.PCE propagation to use active_mm instead of mm
   1b9537d72610 tty: pty: Fix ldisc flush after userspace become aware of the data already
   44705deddafe usb: hub: Fix crash after failure to read BOS descriptor
   09b3048b2880 ACM gadget: fix endianness in notifications
   861b5c18bb14 scsi: sg: check length passed to SG_NEXT_CMD_LEN
   7268eabd5b5f Input: sur40 - validate number of endpoints before using them
   84a91ce02105 Input: kbtab - validate number of endpoints before using them
   f1ba9cf02776 Input: hanwang - validate number of endpoints before using them
   36d425fcc164 Input: yealink - validate number of endpoints before using them
   79cae616c940 Input: ims-pcu - validate number of endpoints before using them
   6585effe7d22 Input: cm109 - validate number of endpoints before using them
   76d981017361 Input: iforce - validate number of endpoints before using them
   edf3bd9562a9 mmc: ushc: fix NULL-deref at probe
   93d21fdc17e5 drm/radeon: reinstate oland workaround for sclk
   71a1c9d004ed perf/core: Fix event inheritance on fork()
   4da3251aac57 cpufreq: Fix and clean up show_cpuinfo_cur_freq()
   85fa60732c80 drm/radeon/si: add dpm quirk for Oland
   772653bea403 ext4: mark inode dirty after converting inline directory
   e8959ed1fd07 futex: Add missing error handling to FUTEX_REQUEUE_PI
   33fcd6ecaf0f futex: Fix potential use-after-free in FUTEX_REQUEUE_PI
   56d75a164c87 ARM: at91: pm: cpu_idle: switch DDR to power-down mode
   ce6df3d36d07 usb: musb: cppi41: don't check early-TX-interrupt for Isoch transfer
   ed4b286d254b usb-core: Add LINEAR_FRAME_INTR_BINTERVAL USB quirk
   599dc7743f74 uwb: i1480-dfu: fix NULL-deref at probe
   50c372bd694d uwb: hwa-rc: fix NULL-deref at probe
   7896de4f8b00 USB: wusbcore: fix NULL-deref at probe
   0b3718017641 USB: uss720: fix NULL-deref at probe
   aee563c5ffb5 USB: lvtest: fix NULL-deref at probe
   a2574cf7887d USB: idmouse: fix NULL-deref at probe
   13cd0c011e73 isdn/gigaset: fix NULL-deref at probe
   027a48c195e1 fat: fix using uninitialized fields of fat_inode/fsinfo_inode
   c4743e805d43 md/raid1/10: fix potential deadlock
   6eea126f9d6d usb: host: xhci-plat: Fix timeout on removal of hot pluggable xhci controllers
   92b280212adf USB: iowarrior: fix NULL-deref in write
   c4b516612312 USB: iowarrior: fix NULL-deref at probe
   4db7a852b417 ath9k_htc: Add support of AirTies 1eda:2315 AR9271 device
   394e5f4a60c1 USB: serial: safe_serial: fix information leak in completion handler
   e0f57e1a406c USB: serial: io_ti: fix information leak in completion handler
   5dfb04937689 USB: serial: omninet: fix reference leaks at open
   6aed13b2c40e USB: serial: io_ti: fix NULL-deref in interrupt callback
   92fbcbfe994f MIPS: ralink: Fix typos in rt3883 pinctrl
   7ba49ba6dd09 MIPS: End spinlocks with .insn
   d7f84ae03ff3 MIPS: Force o32 fp64 support on 32bit MIPS64r6 kernels
   248e94265dd0 target: Fix VERIFY_16 handling in sbc_parse_cdb
   452c3c927325 target/pscsi: Fix TYPE_TAPE + TYPE_MEDIMUM_CHANGER export
   076df4623c10 scsi: lpfc: Add shutdown method for kexec
   e04d8b65f412 powerpc/boot: Fix zImage TOC alignment
   5c8f767c657b serial: samsung: Continue to work if DMA request fails
   46df5258a521 Input: i8042 - add noloop quirk for Dell Embedded Box PC 3000
   9d3698c9b85c ima: accept previously set IMA_NEW_FILE
   86525f9f4474 percpu: acquire pcpu_lock when updating pcpu_nr_empty_pop_pages
   42ece5f50098 usb: gadget: dummy_hcd: clear usb_gadget region before registration
   7ccd5568eab8 USB: serial: digi_acceleport: fix OOB-event processing
   6842c8457292 staging: comedi: jr3_pci: cope with jiffies wraparound
   29e34e47fadf staging: comedi: jr3_pci: fix possible null pointer dereference
   c48408dff998 usb: gadget: function: f_fs: pass companion descriptor along
   757895c336d6 usb: dwc3: gadget: make Set Endpoint Configuration macros safe
   2e9d3a921000 tracing: Add #undef to fix compile error
   bd38086c6b2a can: usb_8dev: Fix memory leak of priv->cmd_msg_buffer
   99d3d49197e1 powerpc: Emulation support for load/store instructions on LE
   381785176cc1 KVM: s390: Fix guest migration for huge guests resulting in panic
   7caf29dc038c xtensa: move parse_tag_fdt out of #ifdef CONFIG_BLK_DEV_INITRD
   14abcbaa3f0d scsi: libiscsi: add lock around task lists to fix list corruption regression
   28d5d8b2db22 ALSA: seq: Fix link corruption by event error handling
   b78e49c3057a ALSA: hda - Add subwoofer support for Dell Inspiron 17 7000 Gaming
   d19f6529f1c1 ALSA: timer: Reject user params with too small ticks
   3d35f4422582 drm/ast: Call open_key before enable_mmio in POST code
   2188c2b367c6 drm/ast: Fix test for VGA enabled
   e8b120e25fbc drm/ast: Fix AST2400 POST failure without BMC FW or VBIOS
   c9cf983337a0 ipc/shm: Fix shmat mmap nil-page protection
   1827f7e6062b mac80211: flush delayed work when entering suspend
   0dad072cfc1d ALSA: hda - Fix micmute hotkey problem for a lenovo AIO machine
   e5ee49ad28a0 mm: do not access page->mapping directly on page_endio
   21a6489deda1 mm: vmpressure: fix sending wrong events on underflow
   091e3373d97f mm/page_alloc: fix nodes for reclaim in fast path
   7ec8bd575e7b s390: TASK_SIZE for kernel threads
   01592a4b8ba8 NFSv4: fix getacl ERANGE for some ACL buffer sizes
   bb9e115a5e85 NFSv4: fix getacl head length estimation
   05365e1fdea9 scsi: aacraid: Reorder Adapter status check
   f90e6f9a26ba rdma_cm: fail iwarp accepts w/o connection params
   a60c9ff335a1 IB/srp: Avoid that duplicate responses trigger a kernel bug
   3cac36b0423b MIPS: BCM47XX: Fix button inversion for Asus WL-500W
   512cbc94607b MIPS: OCTEON: Fix copy_from_user fault handling for large buffers
   9b4ed3674858 MIPS: Fix special case in 64 bit IP checksumming.
   85050844c0b9 dm cache: fix corruption seen when using cache > 2TB
   c0601ca14e10 Bluetooth: Add another AR3012 04ca:3018 device
   da1324e7080d regulator: Fix regulator_summary for deviceless consumers
   01f9734353be ALSA: hda - fix Lewisburg audio issue
   b57d6c457569 goldfish: Sanitize the broken interrupt handler
   c1dbd97d8a2a x86/platform/goldfish: Prevent unconditional loading
   58cec2bdba91 ath9k: use correct OTP register offsets for the AR9340 and AR9550
   9aabd8dbacd8 powerpc/xmon: Fix data-breakpoint
   c2fd678ea234 nlm: Ensure callback code also checks that the files match
   e53554da9daf drivers: hv: Turn off write permission on the hypercall page
   5fdf59513019 USB: serial: mos7840: fix another NULL-deref at open
   61f3d2296678 NFSv4: Fix memory and state leak in _nfs4_open_and_get_state
   95f495896ad8 drm/atomic: fix an error code in mode_fixup()
   04df6689f870 ktest: Fix child exit code processing
   a52f3859b78c ath9k: fix race condition in enabling/disabling IRQs
   db5051f86016 rtlwifi: rtl8192c-common: Fix "BUG: KASAN:
   f59f883503b7 USB: serial: ftdi_sio: fix line-status over-reporting
   4a34581ed021 KVM: s390: Disable dirty log retrieval for UCONTROL guests
   6631e70a42ff USB: serial: cp210x: add new IDs for GE Bx50v3 boards
   31ac2f17fd85 serial: 8250_pci: Add MKS Tenta SCOM-0800 and SCOM-0801 cards
   4c47ad359cc8 jbd2: don't leak modified metadata buffers on an aborted journal
   2b24a8367068 s390/qdio: clear DSCI prior to scanning multiple input queues
   36e4f568b8f1 s390/dcssblk: fix device size calculation in dcssblk_direct_access()
   5e6ef5ef6eaf mnt: Tuck mounts under others instead of creating shadow/side mounts.
   54195f1a32ee rtc: sun6i: Switch to the external oscillator
   cdb2a7f22913 rtc: sun6i: Add some locking
   af1af02352ee USB: serial: digi_acceleport: fix OOB data sanity check
   adb1da2a98a2 [media] media: fix dm1105.c build error
   c845c73b8396 bcma: use (get|put)_device when probing/removing device driver
   e1d467993c45 [media] am437x-vpfe: always assign bpp variable
   c53e17083e91 arm/arm64: KVM: Enforce unconditional flush to PoC when mapping to stage-2
   75f37dab088e ext4: trim allocation requests to group size
   07b79ed1e82c drm/radeon: handle vfct with multiple vbios images
   1efa8e2ac68b drm/ttm: Make sure BOs being swapped out are cacheable
   a99df0713f43 usb: gadget: udc: fsl: Add missing complete function.
   8c06df5655c7 USB: serial: ftdi_sio: fix extreme low-latency setting
   de143f74af3e w1: don't leak refcount on slave attach failure in w1_attach_slave_device()
   271ce5038fbc w1: ds2490: USB transfer buffers need to be DMAable
   57389faf841f ARM: dts: at91: Enable DMA on sama5d4_xplained console
   61b067fb433a staging: rtl: fix possible NULL pointer dereference
   434c09afa6c9 USB: serial: opticon: fix CTS retrieval at open
   700b2315c254 USB: serial: spcp8x5: fix modem-status handling
   da3a3becb7a8 USB: serial: ftdi_sio: fix modem-status error handling
   270ffbd14d81 USB: serial: ark3116: fix register-accessor error handling
   131d81690f18 IB/ipoib: Fix deadlock between rmmod and set_mode
   24104f6ae3b4 RDMA/core: Fix incorrect structure packing for booleans
   fc47912f44a7 ath5k: drop bogus warning on drv_set_key with unsupported cipher
   c2e65cde1bd7 tty: serial: msm: Fix module autoload
   ccb2e5cdaffa hv: init percpu_list in hv_synic_alloc()
   fbb6950ea08a samples/seccomp: fix 64-bit comparison macros
   33b9ac915dba scsi: storvsc: properly handle SRB_ERROR when sense message is present
   f0cd3119dcd0 scsi: storvsc: use tagged SRB requests if supported by the device
   88e4685b51d3 MIPS: Handle microMIPS jumps in the same way as MIPS32/MIPS64 jumps
   a6c4b18bdb3a MIPS: Calculate microMIPS ra properly when unwinding the stack
   339da589697a MIPS: Fix is_jump_ins() handling of 16b microMIPS instructions
   4556bdd21af3 MIPS: Fix get_frame_info() handling of microMIPS function size
   7c6a61c004ad MIPS: Prevent unaligned accesses during stack unwinding
   39fffbc9b371 MIPS: Clear ISA bit correctly in get_frame_info()
   e9ef2a32a2ec drm/i915/dsi: Do not clear DPOUNIT_CLOCK_GATE_DISABLE from vlv_init_display_clock_gating

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---

v2: changes

 - this previously had the shortlog of update to v4.1.41, which
   was incorrect. It should have been v4.1.42. The shortlog, longlog
   and hashes have been fixed in this version.

 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 2df6d3fee964..4d40fd1b02bf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ec0bfadaeac24cc63fa05521c6608b79b26a5e5d"
-SRCREV_meta ?= "c55c877244b49a12c7f1bcf7e05d44e64e10046f"
+SRCREV_machine ?= "798e2cbf3dec954f37cb84463bc0b0a95cb54c8f"
+SRCREV_meta ?= "9f9c9a66ef3452343586adf150137967e955d71a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.39"
+LINUX_VERSION ?= "4.1.42"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index b77b7ff9d4a4..4f2f647975d9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.39"
+LINUX_VERSION ?= "4.1.42"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "398d1785c6bde0085b99f00f346e199a15fbdcef"
-SRCREV_meta ?= "c55c877244b49a12c7f1bcf7e05d44e64e10046f"
+SRCREV_machine ?= "e2bea2e96fcbbbb9b1efc3bc7505ac42e39bb5c0"
+SRCREV_meta ?= "9f9c9a66ef3452343586adf150137967e955d71a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 9a2bf15425b2..b5a3cc8a9fd8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "3b0fd24797cb11aae54010b1bbc09dd2ae8a108e"
-SRCREV_machine_qemuarm64 ?= "398d1785c6bde0085b99f00f346e199a15fbdcef"
-SRCREV_machine_qemumips ?= "7420516ff545f8ab3e2471cf08bf851744264a6a"
-SRCREV_machine_qemuppc ?= "6952f5a70bc8a84a4c4d926cdec93e7a39878f32"
-SRCREV_machine_qemux86 ?= "398d1785c6bde0085b99f00f346e199a15fbdcef"
-SRCREV_machine_qemux86-64 ?= "398d1785c6bde0085b99f00f346e199a15fbdcef"
-SRCREV_machine_qemumips64 ?= "59727538774860381f42bcfb6ec05fe21facd319"
-SRCREV_machine ?= "398d1785c6bde0085b99f00f346e199a15fbdcef"
-SRCREV_meta ?= "c55c877244b49a12c7f1bcf7e05d44e64e10046f"
+SRCREV_machine_qemuarm ?= "f100a3d840596ac0dc47416336f34d8bf7b5ffa8"
+SRCREV_machine_qemuarm64 ?= "e2bea2e96fcbbbb9b1efc3bc7505ac42e39bb5c0"
+SRCREV_machine_qemumips ?= "4005321dfa890df693c12e902e48fd0dde88fee7"
+SRCREV_machine_qemuppc ?= "1e29490accfb0547e3a854ac6ec9a6754cd47204"
+SRCREV_machine_qemux86 ?= "e2bea2e96fcbbbb9b1efc3bc7505ac42e39bb5c0"
+SRCREV_machine_qemux86-64 ?= "e2bea2e96fcbbbb9b1efc3bc7505ac42e39bb5c0"
+SRCREV_machine_qemumips64 ?= "87c0f4d5bec646565e493d39bf57c3500151ed68"
+SRCREV_machine ?= "e2bea2e96fcbbbb9b1efc3bc7505ac42e39bb5c0"
+SRCREV_meta ?= "9f9c9a66ef3452343586adf150137967e955d71a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.39"
+LINUX_VERSION ?= "4.1.42"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


