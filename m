Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8187199D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 13:54:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0IDsdfb026307
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Jan 2017 05:54:39 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 18 Jan 2017 05:54:38 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 18 Jan 2017 08:54:23 -0500
Message-ID: <5e72327594a4989e5bcce2aa70a1e031329a529e.1484747560.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1484747560.git.bruce.ashfield@windriver.com>
References: <cover.1484747560.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/14] linux-yocto/4.8: -stable update to v4.8.17
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
X-List-Received-Date: Wed, 18 Jan 2017 13:54:39 -0000
Content-Type: text/plain

Updating to the korg 4.8.17 -stable release. Changes are as follows:

   3d8f8d06abb3 Linux 4.8.17
   adf363fd5ab9 drm/i915: skip the first 4k of stolen memory on everything >= gen8
   000e612673da drm/i915: Initialize dev_priv->atomic_cdclk_freq at init time
   22aba475d97b drm/i915: Fix cdclk vs. dev_cdclk mess when not recomputing things
   294bb3402c76 drm/i915/dsi: Do not clear DPOUNIT_CLOCK_GATE_DISABLE from vlv_init_display_clock_gating
   6a412ff3df87 drm/i915/dsi: Fix chv_exec_gpio disabling the GPIOs it is setting
   4803ec2a74c4 net: mvpp2: fix dma unmapping of TX buffers for fragments
   48f26edb689c sg_write()/bsg_write() is not fit to be called under KERNEL_DS
   d787c6b32c3f kconfig/nconf: Fix hang when editing symbol with a long prompt
   e141d1a21e31 target/user: Fix use-after-free of tcmu_cmds if they are expired
   29f3d1127c4b libnvdimm, pfn: fix align attribute
   3a4e4281b5cd powerpc/ps3: Fix system hang with GCC 5 builds
   e451d674bac5 powerpc/64e: Convert cmpi to cmpwi in head_64.S
   0349fbebd984 SUNRPC: fix refcounting problems with auth_gss messages.
   c513ade4ca56 pNFS: Fix a deadlock between read resends and layoutreturn
   abb2903f1ac2 pNFS: Clear NFS_LAYOUT_RETURN_REQUESTED when invalidating the layout stateid
   f061c76c1d56 pNFS: Don't clear the layout stateid if a layout return is outstanding
   7de1b81c27fd pNFS: On error, do not send LAYOUTGET until the LAYOUTRETURN has completed
   8f5ff877bf19 nfs_write_end(): fix handling of short copies
   1678adac85da libceph: verify authorize reply on connect
   1f93d1a77b17 PCI: Check for PME in targeted sleep state
   c75bc2bde102 i40iw: Use correct src address in memcpy to rdma stats counters
   7d0a6cf3e8c9 Input: drv260x - fix input device's parent assignment
   b7843712cbd2 v4l: tvp5150: Add missing break in set control handler
   4963b1910090 media: solo6x10: fix lockup by avoiding delayed register write
   88bfde25e60f s5p-mfc: fix failure path of s5p_mfc_alloc_memdev()
   c3fe33d185e0 mn88473: fix chip id check on probe
   84b2f664409c mn88472: fix chip id check on probe
   15d1d226eab4 IB/cma: Fix a race condition in iboe_addr_get_sgid()
   7b3721aff59b IB/rxe: Fix a memory leak in rxe_qp_cleanup()
   2a0aa77a54fb IB/multicast: Check ib_find_pkey() return value
   37d4adba02d3 IPoIB: Avoid reading an uninitialized member variable
   f079fc11f28e IB/mad: Fix an array index check
   e661b5d4b94f fgraph: Handle a case where a tracer ignores set_graph_notrace
   b2758da04d73 platform/x86: asus-nb-wmi.c: Add X45U quirk
   f61152e3bbf0 ftrace/x86_32: Set ftrace_stub to weak to prevent gcc from using short jumps to it
   8569aadeed3f vsock/virtio: fix src/dst cid format
   576ea9e5e92e fsnotify: Fix possible use-after-free in inode iteration on umount
   43983ce75e61 kvm: nVMX: Allow L1 to intercept software exceptions (#BP and #OF)
   9a5cf8c4b112 KVM: PPC: Book3S HV: Don't lose hardware R/C bit updates in H_PROTECT
   b751eb6e9d99 KVM: PPC: Book3S HV: Save/restore XER in checkpointed register state
   0773e9248ae3 scsi: aacraid: remove wildcard for series 9 controllers
   b202064f0b3f md/raid5: limit request size according to implementation limits
   47090341ec97 sc16is7xx: Drop bogus use of IRQF_ONESHOT
   c33e1abd2e31 arm64: KVM: pmu: Reset PMSELR_EL0.SEL to a sane value before entering the guest
   d3d61bb37afb s390/kexec: use node 0 when re-adding crash kernel memory
   9652b62af49d s390/vmlogrdr: fix IUCV buffer allocation
   f356ab038e78 firmware: fix usermode helper fallback loading
   5c98bf834d6f ARC: mm: arc700: Don't assume 2 colours for aliasing VIPT dcache
   cc328ce59a4a scsi: avoid a permanent stop of the scsi device's request queue
   6d675dffd425 scsi: zfcp: fix rport unblock race with LUN recovery
   057fe03d627e scsi: zfcp: do not trace pure benign residual HBA responses at default level
   5cebfea8080c scsi: zfcp: fix use-after-"free" in FC ingress path after TMF
   de8a06c673ac iscsi-target: Return error if unable to add network portal
   9c3928be0dba scsi: megaraid_sas: Do not set MPI2_TYPE_CUDA for JBOD FP path for FW which does not support JBOD sequence map
   dbd4e6c60b4f scsi: megaraid_sas: For SRIOV enabled firmware, ensure VF driver waits for 30secs before reset
   3863ab6d710d stm class: Fix device leak in open error path
   698ac693dbb4 vt: fix Scroll Lock LED trigger name
   6d8bb567102c block: protect iterate_bdevs() against concurrent close
   2695afd5e9c2 mei: me: add lewisburg device ids
   7be0a5f39d64 mei: request async autosuspend at the end of enumeration
   dfc3c8a0fa1b drivers/gpu/drm/ast: Fix infinite loop if read fails
   0f95e4a58ecd drm/amdgpu: fix init save/restore list in gfx_v8.0
   8bfa4f5e6395 drm/gma500: Add compat ioctl
   10b598df92d9 drm/radeon/si: load the proper firmware on 0x87 oland boards
   cdb7aaaaecff drm/radeon: add additional pci revision to dpm workaround
   1f884ec818a6 drm/radeon: Hide the HW cursor while it's out of bounds
   6fb94229b2f6 drm/radeon: Also call cursor_move_locked when the cursor size changes
   9c6fb7bf404d drm/nouveau/fifo/gf100-: protect channel preempt with subdev mutex
   2a7a43772bff drm/nouveau/i2c/gk110b,gm10x: use the correct implementation
   28d186430686 drm/nouveau/ttm: wait for bo fence to signal before unmapping vmas
   82d9824d9446 drm/nouveau/ltc: protect clearing of comptags with mutex
   ce71868acee2 drm/nouveau/bios: require checksum to match for fast acpi shadow method
   764e8e8af190 drm/nouveau/kms: lvds panel strap moved again on maxwell
   00e1fb138ffa drm/nouveau/gr: fallback to legacy paths during firmware lookup
   fef542735a48 drm/amd/amdgpu: enable GUI idle INT after enabling CGCG
   bab520835f81 ACPI / video: Add force_native quirk for HP Pavilion dv6
   b7eea51a3a5c ACPI / video: Add force_native quirk for Dell XPS 17 L702X
   ce8100660364 staging: comedi: ni_mio_common: fix E series ni_ai_insn_read() data
   689d59259385 staging: comedi: ni_mio_common: fix M Series ni_ai_insn_read() data mask
   823c5c94f716 hv: acquire vmbus_connection.channel_mutex in vmbus_free_channels()
   235394e1625c docs: sphinx-extensions: make rstFlatTable work with docutils 0.13
   a26a016a4e2f thermal: hwmon: Properly report critical temperature in sysfs
   def2c87dc7ac clk: bcm2835: Avoid overwriting the div info when disabling a pll_div clk
   2f885dafe704 arm64: tegra: Add VDD_GPU regulator to Jetson TX1
   bd12562fceb4 gpio: chardev: Return error for seek operations
   61d0b7139cf9 timekeeping_Force_unsigned_clocksource_to_nanoseconds_conversion
   95d2a43e5a59 regulator: stw481x-vmmc: fix ages old enable error
   52980ceb1832 mmc: sdhci: Fix recovery from tuning timeout
   0ed0b2592437 ath9k: Really fix LED polarity for some Mini PCI AR9220 MB92 cards.
   d80ff7cb5d06 ath9k: fix ath9k_hw_gpio_get() to return 0 or 1 on success
   42e76c596c93 cfg80211/mac80211: fix BSS leaks when abandoning assoc attempts
   d2546f653bb0 rtl8xxxu: Work around issue with 8192eu and 8723bu devices not reconnecting
   2abcc023a460 perf/x86/intel/cstate: Prevent hotplug callback leak
   7b9e1a16a1b0 perf/x86: Fix exclusion of BTS and LBR for Goldmont
   e24523a80c19 rtlwifi: Fix enter/exit power_save
   c9fce6ba9c09 ssb: Fix error routine when fallback SPROM fails
   c65ed08dcc04 Linux 4.8.16
   645897231f96 driver core: fix race between creating/querying glue dir and its cleanup
   f199bdbaab37 Revert "netfilter: move nat hlist_head to nf_conn"
   99d6d4e0c50c Revert "netfilter: nat: convert nat bysrc hash to rhashtable"
   774225699b4d arm64: mark reserved memblock regions explicitly in iomem
   587e89bd56c1 xfs: set AGI buffer type in xlog_recover_clear_agi_bucket
   959e363eaf14 arm/xen: Use alloc_percpu rather than __alloc_percpu
   6fbd3fb6c4df xen/gntdev: Use VM_MIXEDMAP instead of VM_IO to avoid NUMA balancing
   883f12a20583 tpm xen: Remove bogus tpm_chip_unregister
   8419f5215db3 kernel/debug/debug_core.c: more properly delay for secondary CPUs
   63b33e0885d6 watchdog: qcom: fix kernel panic due to external abort on non-linefetch
   bf902ead61d8 watchdog: mei_wdt: request stop on reboot to prevent false positive event
   2f826a72ea8b kernel/watchdog: use nmi registers snapshot in hardlockup handler
   bbf23f00d55e CIFS: Fix a possible memory corruption in push locks
   9f1f5076149a CIFS: Fix missing nls unload in smb2_reconnect()
   ff04da387c10 CIFS: Fix a possible memory corruption during reconnect
   6cb589c7529f ASoC: intel: Fix crash at suspend/resume without card registration
   769c0922d4a6 dm space map metadata: fix 'struct sm_metadata' leak on failed create
   ab10ab0a2a3d dm raid: fix discard support regression
   454b98d3f2b5 dm rq: fix a race condition in rq_completed()
   26011e67339e dm crypt: mark key as invalid until properly loaded
   bd5fcd18c8c3 dm flakey: return -EINVAL on interval bounds error in flakey_ctr()
   1ca66d6a19d2 dm table: an 'all_blk_mq' table must be loaded for a blk-mq DM device
   d948d3b1e416 dm table: fix 'all_blk_mq' inconsistency when an empty table is loaded
   45f631113b36 blk-mq: Do not invoke .queue_rq() for a stopped queue
   e3742a15d6cd PM / OPP: Pass opp_table to dev_pm_opp_put_regulator()
   8b63a922ac07 usb: gadget: composite: always set ep->mult to a sensible value
   d4f4b2e659f5 mm, page_alloc: keep pcp count and list contents in sync if struct page is corrupted
   0927d281a2fc mm/vmscan.c: set correct defer count for shrinker
   3e0ef1b8e0cc nvmet: Fix possible infinite loop triggered on hot namespace removal
   6290a3bcd3c3 loop: return proper error from loop_queue_rq()
   bf0f02079039 f2fs: fix overflow due to condition check order
   154d83a8384e f2fs: set ->owner for debugfs status file's file_operations
   67e5239c8366 Revert "f2fs: use percpu_counter for # of dirty pages in inode"
   d06eaf28f1bb ext4: do not perform data journaling when data is encrypted
   e33673bef6f0 ext4: return -ENOMEM instead of success
   3664877022ea ext4: reject inodes with negative size
   1bfcffbb8801 ext4: add sanity checking to count_overhead()
   9689eb99ce0f ext4: fix in-superblock mount options processing
   52a9daa3d5c0 ext4: use more strict checks for inodes_per_block on mount
   7505584356d2 ext4: fix stack memory corruption with 64k block size
   86efd99f0ebe ext4: fix mballoc breakage with 64k block size
   8022387d236a crypto: caam - fix AEAD givenc descriptors
   ade692b8f1f5 ptrace: Capture the ptracer's creds not PT_PTRACE_CAP
   23d179acb363 vfs,mm: fix return value of read() at s_maxbytes
   e45692fa1aea mm: Add a user_ns owner to mm_struct and fix ptrace permission checks
   04804d83d483 block_dev: don't test bdev->bd_contains when it is not stable
   52d69727a441 fs: exec: apply CLOEXEC before changing dumpable task flags
   781e976ac2c6 exec: Ensure mm->user_ns contains the execed files
   fc1d3e5f3cd0 btrfs: make file clone aware of fatal signals
   8c59356c1232 Btrfs: fix incremental send failure caused by balance
   02fffa116bda Btrfs: don't BUG() during drop snapshot
   0f2e022db237 btrfs: fix a possible umount deadlock
   65563ab7271b Btrfs: fix memory leak in do_walk_down
   364b85c57d25 btrfs: clean the old superblocks before freeing the device
   6a6e9276f3f5 Btrfs: don't leak reloc root nodes on error
   4d3d9b59d963 Btrfs: return gracefully from balance if fs tree is corrupted
   a6522e487b2c Btrfs: bail out if block group has different mixed flag
   d7839adcb0e3 Btrfs: fix memory leak in reading btree blocks
   1a087cd869c6 clk: ti: omap36xx: Work around sprz319 advisory 2.1
   2b96c4b19e0a ALSA: hda: when comparing pin configurations, ignore assoc in addition to seq
   dc8144f49988 ALSA: hda - Gate the mic jack on HP Z1 Gen3 AiO
   685c4db17890 ALSA: hda - fix headset-mic problem on a Dell laptop
   b757fc019fc9 ALSA: hda - ignore the assoc and seq when comparing pin configurations
   38c6095f48fe ALSA: hda/ca0132 - Add quirk for Alienware 15 R2 2016
   5496ec423449 ALSA: hiface: Fix M2Tech hiFace driver sampling rate change
   abf549a8b969 ALSA: usb-audio: Add QuickCam Communicate Deluxe/S7500 to volume_control_quirks
   6b0a56e9aaf3 usbip: vudc: fix: Clear already_seen flag also for ep0
   a9143e58d3cc USB: UHCI: report non-PME wakeup signalling for Intel hardware
   4422a26936ae usb: gadget: composite: correctly initialize ep->maxpacket
   be8f1c44177a usb: gadget: f_uac2: fix error handling at afunc_bind
   79d5a30e37ab usb: hub: Fix auto-remount of safely removed or ejected USB-3 devices
   e3dfbc8904b3 usb: dwc3: gadget: set PCM1 field of isochronous-first TRBs
   269edaef820f USB: cdc-acm: add device id for GW Instek AFG-125
   741523f3da82 USB: serial: kl5kusb105: fix open error path
   f34b7e027eeb USB: serial: option: add dlink dwm-158
   e47e81c4e705 USB: serial: option: add support for Telit LE922A PIDs 0x1040, 0x1041
   3aa3cb940878 Btrfs: fix qgroup rescan worker initialization
   691ea6c7eb1e Btrfs: fix emptiness check for dirtied extent buffers at check_leaf()
   0695d8b10a88 btrfs: store and load values of stripes_min/stripes_max in balance status item
   80f7d2836e37 Btrfs: fix relocation incorrectly dropping data references
   f1b268d7a8e2 Btrfs: fix tree search logic when replaying directory entry deletes
   65553a02a313 Btrfs: fix deadlock caused by fsync when logging directory entries
   361e82137a2d Btrfs: fix BUG_ON in btrfs_mark_buffer_dirty
   562de9c7ce24 btrfs: limit async_work allocation and worker func duration
   f080d7094838 aoe: fix crash in page count manipulation
   8bba2e2e62cb Linux 4.8.15
   762c9bb16fce crypto: rsa - Add Makefile dependencies to fix parallel builds
   014e5a7d9354 hotplug: Make register and unregister notifier API symmetric
   3527ad05b46e batman-adv: Check for alloc errors when preparing TT local data
   32ccd76788a5 m68k: Fix ndelay() macro
   9fc7a4758608 ceph: don't set req->r_locked_dir in ceph_d_revalidate
   a05f493f8d4e ARM: dts: imx7d: fix LCDIF clock assignment
   798c825fb006 ARM: dts: orion5x: fix number of sata port for linkstation ls-gl
   d271b9bec2d3 Revert "ACPI: Execute _PTS before system reboot"
   3ee9f16cff18 can: peak: fix bad memory access and free sequence
   212e0ff80970 can: raw: raw_setsockopt: limit number of can_filter that can be set
   bdb5ed2040f5 crypto: marvell - Don't corrupt state of an STD req for re-stepped ahash
   bfef274e4dae crypto: mcryptd - Check mcryptd algorithm compatibility
   86bea59218a0 crypto: caam - fix pointer size for AArch64 boot loader, AArch32 kernel
   666531ca650e crypto: marvell - Don't copy hash operation twice into the SRAM
   04925ba9b944 acpi, nfit: fix bus vs dimm confusion in xlat_status
   53ed7c2e8d02 acpi, nfit: validate ars_status output buffer size
   e04e2dace316 acpi, nfit, libnvdimm: fix / harden ars_status output length handling
   483ac1487a9d acpi, nfit: fix extended status translations for ACPI DSMs
   0525cebf8ef7 perf/x86: Fix full width counter, counter overflow
   eceab1fd7f9e vhost-vsock: fix orphan connection reset
   b0224f36735e sched/autogroup: Fix 64-bit kernel nice level adjustment
   2a477999977c scsi: lpfc: fix oops/BUG in lpfc_sli_ringtxcmpl_put()
   ac65fe0bbdea device-dax: fix private mapping restriction, permit read-only
   2386c6b188c5 locking/rtmutex: Use READ_ONCE() in rt_mutex_owner()
   7b2347c8e803 locking/rtmutex: Prevent dequeue vs. unlock race
   bed4eef2e8fa zram: restrict add/remove attributes to root only
   4fb7569c7370 parisc: Fix TLB related boot crash on SMP machines
   b81e5db49515 parisc: Remove unnecessary TLB purges from flush_dcache_page_asm and flush_icache_page_asm
   7e8f68aa1833 parisc: Purge TLB before setting PTE
   6e284445bab5 fuse: fix clearing suid, sgid for chown()
   e70d6d2d7383 powerpc/boot: Fix build failure in 32-bit boot wrapper
   a82ad493f045 powerpc/mm: Fix lazy icache flush on pre-POWER5
   84b36287c72d powerpc/eeh: Fix deadlock when PE frozen state can't be cleared
   7b8c57cad53a Linux 4.8.14
   1670d1584701 esp6: Fix integrity verification when ESN are used
   b3e9d4982939 esp4: Fix integrity verification when ESN are used
   be5339492b29 flowcache: Increase threshold for refusing new allocations
   3a116fa8c95d Revert: "ip6_tunnel: Update skb->protocol to ETH_P_IPV6 in ip6_tnl_xmit()"
   686182870c6a ipv4: Set skb->protocol properly for local output
   e67bd82fb79d ipv6: Set skb->protocol properly for local output
   22d94c326660 Don't feed anything but regular iovec's to blk_rq_map_user_iov
   e4a6c61c6b71 constify iov_iter_count() and iter_is_iovec()
   907bc3181c9a sparc32: Fix inverted invalid_frame_pointer checks on sigreturns
   360e257f8cf3 sparc64: fix compile warning section mismatch in find_node()
   2f02dcb673a4 sparc64: Fix find_node warning if numa node cannot be found
   ad02ec7d37a2 ipv4: Drop suffix update from resize code
   0b1c601d367f ipv4: Drop leaf from suffix pull/push functions
   cd8a6c0e95bf ipv4: Fix memory leak in exception case for splitting tries
   a8780378b39e ipv4: Restore fib_trie_flush_external function and fix call ordering
   5ff5e5c06c25 net: ping: check minimum size on ICMP header length
   f818e5d86aef net: avoid signed overflows for SO_{SND|RCV}BUFFORCE
   bfecf9017f8b geneve: avoid use-after-free of skb->data
   4daa2c73eb05 tipc: check minimum bearer MTU
   1ff3209a21c8 sh_eth: remove unchecked interrupts for RZ/A1
   bbf913d774b7 net: bcmgenet: Utilize correct struct device for all DMA operations
   accb7c99fc0f cdc_ether: Fix handling connection notification
   34457543e203 ip6_offload: check segs for NULL in ipv6_gso_segment.
   cef222d40f2e packet: fix race condition in packet_set_ring
   17941a9d6409 GSO: Reload iph after pskb_may_pull
   ff0d7874078d net/dccp: fix use-after-free in dccp_invalid_packet
   023cd33ece37 net: macb: fix the RX queue reset in macb_rx()
   25d9b4bb64ea netlink: Do not schedule work from sk_destruct
   f5dad3473d83 netlink: Call cb->done from a worker thread
   360d6a23e79d net/sched: pedit: make sure that offset is valid
   aa239369bdfa net: dsa: fix unbalanced dsa_switch_tree reference counting
   9a7479273949 net, sched: respect rcu grace period on cls destruction
   a9437ebc69f5 net: dsa: bcm_sf2: Ensure we re-negotiate EEE during after link change
   ddf053431efe udplite: call proper backlog handlers
   7b0aa75be3ab ipv6: bump genid when the IFA_F_TENTATIVE flag is clear
   58c8cc33de6c rtnl: fix the loop index update error in rtnl_dump_ifinfo()
   84df56749f48 l2tp: fix racy SOCK_ZAPPED flag check in l2tp_ip{,6}_bind()
   7f8b251a0985 rtnetlink: fix FDB size computation
   c39caa8f80c0 af_unix: conditionally use freezable blocking calls in read
   bdc5c63e4b38 net: sky2: Fix shutdown crash
   a75684ab7a12 ip6_tunnel: disable caching when the traffic class is inherited
   1b079d5b9fc1 net: check dead netns for peernet2id_alloc()
   65dfc8b4547f net: dsa: b53: Fix VLAN usage and how we treat CPU port
   f959eb507439 virtio-net: add a missing synchronize_net()
   8070f33be6c4 gro_cells: mark napi struct as not busy poll candidates
   55d64c0b3c15 Linux 4.8.13
   a4edb1a2b045 arm64: suspend: Reconfigure PSTATE after resume from idle
   6353400d9130 arm64: mm: Set PSTATE.PAN from the cpu_enable_pan() call
   b49b1ae6d341 arm64: cpufeature: Schedule enable() calls instead of calling them via IPI
   e4e77deda200 batman-adv: Detect missing primaryif during tp_send as error
   f106de5604dd clk: sunxi: Fix M factor computation for APB1
   9e2d9e95094a perf/x86: Restore TASK_SIZE check on frame pointer
   ab34b429a01f drm/mediatek: fix null pointer dereference
   43b5bb262711 pwm: Fix device reference leak
   6c6947613979 KVM: use after free in kvm_ioctl_create_device()
   ff8b06b4efa6 arm64: dts: juno: fix cluster sleep state entry latency on all SoC versions
   f67b89acdfa1 drm/radeon: fix check for port PM availability
   835bb5cd3653 drm/amdgpu: fix check for port PM availability
   972d595824b6 drm/radeon: fix power state when port pm is unavailable (v2)
   be1b75edf20b drm/amdgpu: fix power state when port pm is unavailable
   bd78c077f8fe drm/i915: drop the struct_mutex when wedged or trying to reset
   5dd86b6e5873 drm/i915: Don't touch NULL sg on i915_gem_object_get_pages_gtt() error
   05abe7452b71 KVM: arm/arm64: vgic: Don't notify EOI for non-SPIs
   ca42bd35d308 mwifiex: printk() overflow with 32-byte SSIDs
   de9ba13ebfdb PCI: Set Read Completion Boundary to 128 iff Root Port supports it (_HPX)
   4f4857148b4a PCI: Export pcie_find_root_port
   27dce9bcad4d mm: workingset: fix NULL ptr in count_shadow_nodes
   60e33689a06e rcu: Fix soft lockup for rcu_nocb_kthread
   b6f9e236b7ef Input: psmouse - disable automatic probing of BYD touchpads
   6ca8ab7052c4 Input: change KEY_DATA from 0x275 to 0x277
   600bec25b855 ovl: fix d_real() for stacked fs
   5661a6926871 mm: fix false-positive WARN_ON() in truncate/invalidate for hugetlb
   48b6b50a2ba5 kasan: update kasan_global for gcc 7
   db04d354b7f1 zram: fix unbalanced idr management at hot removal
   010020900006 thp: fix corner case of munlock() of PTE-mapped THPs
   08fd95de5eee mm, thp: propagation of conditional compilation in khugepaged.c
   76e59ecacd54 ARC: Don't use "+l" inline asm constraint
   b43fb9f6f162 ARC: mm: PAE40: Fix crash at munmap
   8d1ee7b245ef scsi: libfc: fix seconds_since_last_reset miscalculation
   10e2627377b0 scsi: hpsa: use bus '3' for legacy HBA devices
   e170c1003c02 libata-scsi: Fixup ata_gen_passthru_sense()

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index 5991f2b165b5..702d41bac15f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3bafd55e39da7fd7c5d483fdee5b72450df3caf0"
-SRCREV_meta ?= "0da38d7c70b06ba69dcc6fa305ecf4edc2669598"
+SRCREV_machine ?= "8fddffd5588e14ad3bb5297dbc5b9c4a1047238c"
+SRCREV_meta ?= "7b320e0a54be4b2d9bbaf4eb6165532e3954ad3e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8.12"
+LINUX_VERSION ?= "4.8.17"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index d2f6c7e71ac7..89b601696728 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.8.12"
+LINUX_VERSION ?= "4.8.17"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "e274a507b23c23bf0dd6502d0c38fae731c11511"
-SRCREV_meta ?= "0da38d7c70b06ba69dcc6fa305ecf4edc2669598"
+SRCREV_machine ?= "b62f29ac5c15d6333a13811db030d704b35ace8f"
+SRCREV_meta ?= "7b320e0a54be4b2d9bbaf4eb6165532e3954ad3e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index c5feac6b2dc6..a81128a0b950 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "2bb25d9e29ff91d3266e6abe12c6c1a6b6508e98"
-SRCREV_machine_qemuarm64 ?= "4b1b4bfb6cf27609b37eb44cd7fee700cd402123"
-SRCREV_machine_qemumips ?= "d116a8bdd1d90fe3dde092f119a2dde1674b02c4"
-SRCREV_machine_qemuppc ?= "ef0e5cfd16edcb52ec2e3d5abdcb97d8881b2c3d"
-SRCREV_machine_qemux86 ?= "021b4aef55b44597587a1ce5879be642b3dca155"
-SRCREV_machine_qemux86-64 ?= "021b4aef55b44597587a1ce5879be642b3dca155"
-SRCREV_machine_qemumips64 ?= "1b20066b88c3abdde1f6c449b6562a516b4cce6d"
-SRCREV_machine ?= "021b4aef55b44597587a1ce5879be642b3dca155"
-SRCREV_meta ?= "0da38d7c70b06ba69dcc6fa305ecf4edc2669598"
+SRCREV_machine_qemuarm ?= "16f32b5197fbaec1dbf4f380015792ed47322f06"
+SRCREV_machine_qemuarm64 ?= "38631cc4a8f89fb9547af9e44213971a5b360a36"
+SRCREV_machine_qemumips ?= "bcbe7a7845e3061998a740f12e88a792f358393e"
+SRCREV_machine_qemuppc ?= "4858eec374ee4b09e4428895141ad1ed26fb6d64"
+SRCREV_machine_qemux86 ?= "9bcb4ea3fa107f1a8790c8c3408eb250e8d1d66e"
+SRCREV_machine_qemux86-64 ?= "9bcb4ea3fa107f1a8790c8c3408eb250e8d1d66e"
+SRCREV_machine_qemumips64 ?= "b90b544d7a5b004b635cf337b29e15294cb17553"
+SRCREV_machine ?= "9bcb4ea3fa107f1a8790c8c3408eb250e8d1d66e"
+SRCREV_meta ?= "7b320e0a54be4b2d9bbaf4eb6165532e3954ad3e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8.12"
+LINUX_VERSION ?= "4.8.17"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


