Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 09C0E79847
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 17:20:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8MHKBsY018132
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 22 Sep 2018 10:20:11 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sat, 22 Sep 2018 10:20:10 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 22 Sep 2018 13:18:53 -0400
Message-ID: <a8a3e87fb59a9b6722a93adb62bd47271607ba5c.1537636541.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1537636541.git.bruce.ashfield@windriver.com>
References: <cover.1537636541.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] linux-yocto/4.14: update to v4.14.71
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
X-List-Received-Date: Sat, 22 Sep 2018 17:20:15 -0000
Content-Type: text/plain

Integrating the korg stable releases up to v4.14.71 which comprise
the following commits:

   1244bbb3e921 Linux 4.14.71
   06274364edb4 mm: get rid of vmacache_flush_all() entirely
   8b34a7b14ee7 autofs: fix autofs_sbi() does not check super block type
   daf0ca743b28 tuntap: fix use after free during release
   ab75811f7181 tun: fix use after free for ptr_ring
   8626c40a3093 mtd: ubi: wl: Fix error return code in ubi_wl_init()
   08fb833b40e3 ip: frags: fix crash in ip_do_fragment()
   b3a0c61b7369 ip: process in-order fragments efficiently
   c91f27fb5716 ip: add helpers to process in-order fragments faster.
   04b28f406e86 ipv4: frags: precedence bug in ip_expire()
   6b921536f170 net: sk_buff rbnode reorg
   37c7cc80b1d7 net: add rb_to_skb() and other rb tree helpers
   6bf32cda46eb net: pskb_trim_rcsum() and CHECKSUM_COMPLETE are friends
   5123ffdad659 ipv6: defrag: drop non-last frags smaller than min mtu
   3bde783eca23 net: modify skb_rbtree_purge to return the truesize of all purged skbs.
   7750c414b89b net: speed up skb_rbtree_purge()
   1c44969111cc ip: discard IPv4 datagrams with overlapping segments.
   5fff99e88a1f inet: frags: fix ip6frag_low_thresh boundary
   48c2afc16888 inet: frags: get rid of ipfrag_skb_cb/FRAG_CB
   8291cd943a9b inet: frags: reorganize struct netns_frags
   bd946fb5226e rhashtable: reorganize struct rhashtable layout
   3226bdcb0448 ipv6: frags: rewrite ip6_expire_frag_queue()
   085a0147447a inet: frags: do not clone skb in ip_expire()
   990204ddc5f6 inet: frags: break the 2GB limit for frags storage
   caa4249eca08 inet: frags: remove inet_frag_maybe_warn_overflow()
   5b1b3ad46dd1 inet: frags: get rif of inet_frag_evicting()
   bd3df633f17d inet: frags: remove some helpers
   9aee41eff751 inet: frags: use rhashtables for reassembly units
   33dc9f7c5d12 rhashtable: add schedule points
   11be675bf0aa ipv6: export ip6 fragments sysctl to unprivileged users
   266da0fb83f3 inet: frags: refactor lowpan_net_frag_init()
   eb1686ae5e20 inet: frags: refactor ipv6_frag_init()
   0512f7e93504 inet: frags: Convert timers to use timer_setup()
   0cbf74b9519d inet: frags: refactor ipfrag_init()
   673220d6417d inet: frags: add a pointer to struct netns_frags
   6093d5abcf5a inet: frags: change inet_frags_init_net() return value
   6f7bf899b92d drm/i915: set DP Main Stream Attribute for color range on DDI platforms
   bdbf6e0b9326 RDMA/cma: Do not ignore net namespace for unbound cm_id
   0d1d365d1d44 MIPS: WARN_ON invalid DMA cache maintenance, not BUG_ON
   1181e8687a8d NFSv4.1: Fix a potential layoutget/layoutrecall deadlock
   0983ef553d8f f2fs: fix to do sanity check with {sit,nat}_ver_bitmap_bytesize
   7beff543897c mfd: ti_am335x_tscadc: Fix struct clk memory leak
   b28c14ae3576 iommu/ipmmu-vmsa: Fix allocation in atomic context
   1252c1daa9c3 f2fs: Fix uninitialized return in f2fs_ioc_shutdown()
   9d54a48ef296 f2fs: fix to wait on page writeback before updating page
   9e850bc7691a media: helene: fix xtal frequency setting at power on
   5deea7d63ba1 partitions/aix: fix usage of uninitialized lv_info and lvname structures
   f3677a5c7d08 partitions/aix: append null character to print data from disk
   758289892a13 media: s5p-mfc: Fix buffer look up in s5p_mfc_handle_frame_{new, copy_time} functions
   b0a6faaa6060 Input: atmel_mxt_ts - only use first T9 instance
   e85940a5bb5f dm cache: only allow a single io_mode cache feature to be requested
   94f885db2a18 net: dcb: For wild-card lookups, use priority -1, not 0
   946cf3fe1be6 MIPS: generic: fix missing of_node_put()
   e607db7ce984 MIPS: Octeon: add missing of_node_put()
   7fb2b50ee596 f2fs: fix to do sanity check with reserved blkaddr of inline inode
   ee5067c60606 tpm/tpm_i2c_infineon: switch to i2c_lock_bus(..., I2C_LOCK_SEGMENT)
   cf503dbe5c22 tpm_tis_spi: Pass the SPI IRQ down to the driver
   894b7c6584ed f2fs: fix to skip GC if type in SSA and SIT is inconsistent
   7141f97cdd83 pktcdvd: Fix possible Spectre-v1 for pkt_devs
   5f91efc475c8 f2fs: try grabbing node page lock aggressively in sync scenario
   fd4e3615936c net: mvneta: fix mtu change on port without link
   0cfe17c2a909 pinctrl/amd: only handle irq if it is pending and unmasked
   acd73639c38c gpio: ml-ioh: Fix buffer underwrite on probe error path
   1fc16c07d63b pinctrl: imx: off by one in imx_pinconf_group_dbg_show()
   591ee8d9cd2f x86/mm: Remove in_nmi() warning from vmalloc_fault()
   60deae3d9fc9 Bluetooth: hidp: Fix handling of strncpy for hid->name information
   1dac27c707c8 ath10k: disable bundle mgmt tx completion event support
   6158c2b70a8a tools/testing/nvdimm: kaddr and pfn can be NULL to ->direct_access()
   383195f9feca scsi: 3ware: fix return 0 on the error path of probe
   62128a8d8489 ata: libahci: Correct setting of DEVSLP register
   7cadaaa96c07 ata: libahci: Allow reconfigure of DEVSLP register
   3f3d6c0608b7 MIPS: Fix ISA virt/bus conversion for non-zero PHYS_OFFSET
   1ed3a9307230 rpmsg: core: add support to power domains for devices
   0e890d1cf491 wlcore: Set rx_status boottime_ns field on rx
   bd21eb8aa705 ath10k: prevent active scans on potential unusable channels
   2dacb8cc67ef ath9k_hw: fix channel maximum power level test
   473983f319cc ath9k: report tx status on EOSP
   40992419f135 macintosh/via-pmu: Add missing mmio accessors
   968f03158db5 perf evlist: Fix error out while applying initial delay and LBR
   cc33476b67b8 perf c2c report: Fix crash for empty browser
   521aedea92cd NFSv4.0 fix client reference leak in callback
   c39273ce0d85 perf tools: Allow overriding MAX_NR_CPUS at compile time
   e296ac45b568 f2fs: fix defined but not used build warnings
   e04910746abe f2fs: do not set free of current section
   d85e49570227 f2fs: fix to active page in lru list for read path
   ca21de151016 tty: rocket: Fix possible buffer overwrite on register_PCI
   4bb1d3ec658c Drivers: hv: vmbus: Cleanup synic memory free path
   eec63d96d0e4 firmware: vpd: Fix section enabled flag on vpd_section_destroy
   16c6e01a4a98 uio: potential double frees if __uio_register_device() fails
   2458e91302aa misc: ti-st: Fix memory leak in the error path of probe()
   8e6ee30ad80f gpu: ipu-v3: default to id 0 on missing OF alias
   3b9909896570 media: camss: csid: Configure data type and decode format properly
   cb71229f6483 timers: Clear timer_base::must_forward_clk with timer_base::lock held
   d1060bfcdc72 md/raid5: fix data corruption of replacements after originals dropped
   1f6324f4ea5b scsi: target: fix __transport_register_session locking
   3ddbcd49bbb3 blk-mq: fix updating tags depth
   47a6917f4b72 net: phy: Fix the register offsets in Broadcom iProc mdio mux driver
   6b7c7186c210 media: dw2102: Fix memleak on sequence of probes
   cbd5e67820a9 media: davinci: vpif_display: Mix memory leak on probe error path
   77e120a9c64a selftests/bpf: fix a typo in map in map test
   274977d99c19 powerpc/powernv: Fix concurrency issue with npu->mmio_atsd_usage
   16aa222d2293 gpio: tegra: Move driver registration to subsys_init level
   fb281ed2e4dc Bluetooth: h5: Fix missing dependency on BT_HCIUART_SERDEV
   0455f5d63b3e i2c: aspeed: Add an explicit type casting for *get_clk_reg_val
   5ffdd121d0c4 ethtool: Remove trailing semicolon for static inline
   96e5b8cc3cfd misc: mic: SCIF Fix scif_get_new_port() error handling
   0b2d28449e68 ARC: [plat-axs*]: Enable SWAP
   e5d857d5f1fc tpm: separate cmd_ready/go_idle from runtime_pm
   64def6f35348 crypto: aes-generic - fix aes-generic regression on powerpc
   0fad94cf1016 switchtec: Fix Spectre v1 vulnerability
   ff225750dc4e x86/microcode: Update the new microcode revision unconditionally
   05104410c9d1 x86/microcode: Make sure boot_cpu_data.microcode is up-to-date
   1d92a611db50 cpu/hotplug: Prevent state corruption on error rollback
   cb2625854091 cpu/hotplug: Adjust misplaced smb() in cpuhp_thread_fun()
   cc4271088619 ALSA: hda - Fix cancel_work_sync() stall from jackpoll work
   a709c46fdcd0 KVM: VMX: Do not allow reexecute_instruction() when skipping MMIO instr
   d5fca5314c4d KVM: s390: vsie: copy wrapping keys to right place
   ae3968b41645 Btrfs: fix data corruption when deduplicating between different files
   55bcfe019ac4 smb3: check for and properly advertise directory lease support
   b0b69369eecc SMB3: Backup intent flag missing for directory opens with backupuid mounts
   9efcaa7c4afb MIPS: VDSO: Match data page cache colouring when D$ aliases
   492519107c9d android: binder: fix the race mmap and alloc_new_buf_locked
   381992bcccac block: bfq: swap puts in bfqg_and_blkg_put
   23ecbbad7bf9 nbd: don't allow invalid blocksize settings
   425739151e03 scsi: lpfc: Correct MDS diag and nvmet configuration
   d98b67089c0e i2c: i801: fix DNV's SMBCTRL register offset
   831223b294f8 i2c: xiic: Make the start and the byte count write atomic
   5dfe87ac34e2 Linux 4.14.70
   ab088bc2911d arm64: Handle mismatched cache type
   469c89aa5d7e arm64: Fix mismatched cache line size detection
   0d2e80411a1a ASoC: wm8994: Fix missing break in switch
   03717f80cf2c arm64: cpu_errata: include required headers
   82a0e0f5cf40 x86: kvm: avoid unused variable warning
   e02c9275beea kvm: x86: Set highest physical address bits in non-present/reserved SPTEs
   39cff99ba469 Revert "ARM: imx_v6_v7_defconfig: Select ULPI support"
   e37957305de3 irda: Only insert new objects into the global database via setsockopt
   77be9452d0e5 irda: Fix memory leak caused by repeated binds of irda socket
   63fd9d43c018 s390/lib: use expoline for all bcr instructions
   9370868fd3ca kbuild: make missing $DEPMOD a Warning instead of an Error
   1e0750745bdf drm/i915: Increase LSPCON timeout
   13b23ccfa288 x86/xen: don't write ptes directly in 32-bit PV guests
   d85c2999a7b5 x86/pae: use 64 bit atomic xchg function in native_ptep_get_and_clear
   685a452ce3bf usb: dwc3: core: Fix ULPI PHYs and prevent phy_get/ulpi_init during suspend/resume
   44e5d0b6ce63 HID: add quirk for another PIXART OEM mouse used by HP
   801fc191bb15 mm: Fix devm_memremap_pages() collision handling
   1508043c32a9 lightnvm: pblk: free padded entries in write buffer
   fd8cb2e71cdd sched/deadline: Fix switching to -deadline
   8d015a362a84 debugobjects: Make stack check warning more informative
   448b5498f6c6 uapi/linux/keyctl.h: don't use C++ reserved keyword as a struct member name
   589a8eafc74e drm/amdgpu:add VCN booting with firmware loaded by PSP
   4a4afcf76c96 drm/amdgpu:add VCN support in PSP driver
   d47d14de2438 drm/amdgpu:add new firmware id for VCN
   997157c4eb38 drm/amdgpu:add tmr mc address into amdgpu_firmware_info
   65d20e40552f drm/amdgpu: update tmr mc address
   f40ecf3fe04a drm/edid: Add 6 bpc quirk for SDC panel in Lenovo B50-80
   d991f8ae4071 drm/amd/pp/Polaris12: Fix a chunk of registers missed to program
   c46a1b2622fa drm/amdgpu: Fix RLC safe mode test in gfx_v9_0_enter_rlc_safe_mode
   7e1a6951ca99 drm/i915/lpe: Mark LPE audio runtime pm as "no callbacks"
   a35d3352434d ARM: rockchip: Force CONFIG_PM on Rockchip systems
   1f62d35cd2e1 arm64: rockchip: Force CONFIG_PM on Rockchip systems
   33f4c5c68044 btrfs: Don't remove block group that still has pinned down bytes
   0cdbc3faf960 btrfs: relocation: Only remove reloc rb_trees if reloc control has been initialized
   2f92584bf1f6 btrfs: replace: Reset on-disk dev stats value after replace
   145b1f56b992 btrfs: Exit gracefully when chunk map cannot be inserted to the tree
   80f97c79f3e1 kvm: nVMX: Fix fault vector for VMX operation at CPL > 0
   1187e0186d81 KVM: vmx: track host_state.loaded using a loaded_vmcs pointer
   0aa49a4ddc8e clk: rockchip: Add pclk_rkpwm_pmu to PMU critical clocks in rk3399
   92ef9425c6e1 powerpc/pseries: Avoid using the size greater than RTAS_ERROR_LOG_MAX.
   f3c124c3077d powerpc/64s: Make rfi_flush_fallback a little more robust
   17b1473e6433 powerpc/platforms/85xx: fix t1042rdb_diu.c build errors & warning
   e5f0192fe220 SMB3: Number of requests sent should be displayed for SMB3 not just CIFS
   f6a01ab96067 smb3: fix reset of bytes read and written stats
   9dd38052a3eb cfq: Suppress compiler warnings about comparisons
   9b3fa26f0092 RDS: IB: fix 'passing zero to ERR_PTR()' warning
   e33c8a2896ec selftests/powerpc: Kill child processes on SIGINT
   c861151b1fe9 iommu/omap: Fix cache flushes on L2 table entries
   0a65ab39f8b6 ASoC: rt5677: Fix initialization of rt5677_of_match.data
   3e86f5157661 staging: comedi: ni_mio_common: fix subdevice flags for PFI subdevice
   120130a75724 dm kcopyd: avoid softlockup in run_complete_job
   50956ef66cdb PCI: mvebu: Fix I/O space end address calculation
   301ae5910648 xen/balloon: fix balloon initialization for PVH Dom0
   a333f3f2a255 Input: do not use WARN() in input_alloc_absinfo()
   a9fac97e2e50 NFSv4: Fix error handling in nfs4_sp4_select_mode()
   8ac6b147534c scsi: aic94xx: fix an error code in aic94xx_init()
   24165131bcab ACPI / scan: Initialize status to ACPI_STA_DEFAULT
   c953a5038d2d s390/dasd: fix panic for failed online processing
   ab16afe8c624 s390/dasd: fix hanging offline processing due to canceled worker
   d67c7c9dd14f block: bvec_nr_vecs() returns value for wrong slab
   6952b4ed9e42 perf probe powerpc: Fix trace event post-processing
   af675a6eefe9 powerpc: Fix size calculation using resource_size()
   c20a5e06b750 powerpc/uaccess: Enable get_user(u64, *p) on 32-bit
   47425c36d3fb f2fs: fix to clear PG_checked flag in set_page_dirty()
   c2842800d6bd net/9p: fix error path of p9_virtio_probe
   4cd195263e42 net/9p/trans_fd.c: fix race by holding the lock
   5859129cf62e irqchip/bcm7038-l1: Hide cpu offline callback when building for !SMP
   5e51aa84f4e8 perf tools: Check for null when copying nsinfo.
   800dbcee10cd net: hns3: Fix for phy link issue when using marvell phy driver
   a77439e5fb28 net: hns3: Fix for command format parsing error in hclge_is_all_function_id_zero
   c16a0727c71a RDMA/hns: Fix usage of bitmap allocation functions return values
   0c02e0c3fd13 tcp, ulp: add alias for all ulp modules
   58de2cef2b68 netfilter: fix memory leaks on netlink_dump_start error
   e4f419133dfa platform/x86: asus-nb-wmi: Add keymap entry for lid flip action on UX360
   044e9463ec20 mfd: sm501: Set coherent_dma_mask when creating subdevices
   ccf1ae823e4a ipvs: fix race between ip_vs_conn_new() and ip_vs_del_dest()
   a2805f40c77e s390/kdump: Fix memleak in nt_vmcoreinfo
   2b81b00edba1 netfilter: ip6t_rpfilter: set F_IFACE for linklocal addresses
   f95c5cde34e8 platform/x86: intel_punit_ipc: fix build errors
   e20c4abf9186 fs/dcache.c: fix kmemcheck splat at take_dentry_name_snapshot()
   4570403f6e11 mm/fadvise.c: fix signed overflow UBSAN complaint
   2dc61587a103 pwm: meson: Fix mux clock names
   52ec8484a7c5 IB/hfi1: Invalid NUMA node information can cause a divide by zero
   e5ef973b137f x86/mce: Add notifier_block forward declaration
   b7540b6235f0 virtio: pci-legacy: Validate queue pfn
   ab4bddc2d032 scripts: modpost: check memory allocation results
   7bbf1e8a2471 fat: validate ->i_start before using
   305277dae99e fs/proc/kcore.c: use __pa_symbol() for KCORE_TEXT list entries
   68e787c3c800 hfsplus: fix NULL dereference in hfsplus_lookup()
   003d4c3bf5a5 reiserfs: change j_timestamp type to time64_t
   f552f8c28d34 fork: don't copy inconsistent signal handler state to child
   8b89affb42ae sunrpc: Don't use stack buffer with scatterlist
   ece4ba1c0c90 hfs: prevent crash on exit from failed search
   7d6eba211a1a hfsplus: don't return 0 when fill_super() failed
   d4e42116f77e cifs: check if SMB2 PDU size has been padded and suppress the warning
   c9ba1b82ce96 net: sched: action_ife: take reference to meta module
   e54c50709019 act_ife: fix a potential deadlock
   cd7330c06195 act_ife: move tcfa_lock down to where necessary
   8aa07625eb81 hv_netvsc: Fix a deadlock by getting rtnl lock earlier in netvsc_probe()
   dadb0110a49d hv_netvsc: ignore devices that are not PCI
   bf82c2cb1450 vhost: correctly check the iova range when waking virtqueue
   fe0d111fea19 mlxsw: spectrum_switchdev: Do not leak RIFs when removing bridge
   3c035a48e774 sctp: hold transport before accessing its asoc in sctp_transport_get_next
   456e46f05b37 nfp: wait for posted reconfigs when disabling the device
   8fed734df375 tipc: fix a missing rhashtable_walk_exit()
   417b068a6a7a net/sched: act_pedit: fix dump of extended layered op
   56af4184d356 vti6: remove !skb->ignore_df check from vti6_xmit()
   e4b6c5fd31bd tcp: do not restart timewait timer on rst reception
   3eada53de462 r8169: add support for NCube 8168 network card
   d19688e347a1 qlge: Fix netdev features configuration.
   7f1e6ec4ff12 net: sched: Fix memory exposure from short TCA_U32_SEL
   cb765f5c3c5b net: macb: do not disable MDIO bus at open/close time
   1ef819e411f8 net: bcmgenet: use MAC link status for fixed phy
   a16405ad27f6 ipv4: tcp: send zero IPID for RST and ACK sent in SYN-RECV and TIME-WAIT state
   a08d7ea10bc7 act_ife: fix a potential use-after-free
   7fe7a0f4c5cf Linux 4.14.69
   29245d36680e arm64: mm: always enable CONFIG_HOLES_IN_ZONE
   3098933c1213 fs/quota: Fix spectre gadget in do_quotactl
   0682e027f39d crypto: caam/qi - fix error path in xts setkey
   ccb38942fbe1 crypto: caam/jr - fix descriptor DMA unmapping
   be6f98b203d3 crypto: caam - fix DMA mapping direction for RSA forms 2 & 3
   9f830cf2d510 crypto: vmx - Fix sleep-in-atomic bugs
   300ec47ab8ea perf auxtrace: Fix queue resize
   5a842ecca279 cap_inode_getsecurity: use d_find_any_alias() instead of d_find_alias()
   d1a265da7b29 bcache: release dc->writeback_lock properly in bch_writeback_thread()
   c8d875b471b6 libnvdimm: fix ars_status output length calculation
   ff0791f467d0 getxattr: use correct xattr length
   19b99719970b udlfb: set optimal write delay
   d0f2eb3a419b fb: fix lost console when the user unplugs a USB adapter
   9b0dd656d593 pwm: tiehrpwm: Fix disabling of output of PWMs
   0ef9c771924d pwm: tiehrpwm: Don't use emulation mode bits to control PWM output
   63bbaa1469e6 ubifs: Fix synced_i_size calculation for xattr inodes
   8a23348d76a1 ubifs: xattr: Don't operate on deleted inodes
   f6d7acc1d9ca ubifs: Check data node size before truncate
   3259dd7176e4 Revert "UBIFS: Fix potential integer overflow in allocation"
   a230db38a9fd ubifs: Fix memory leak in lprobs self-check
   656d6e6f6d23 userns: move user access out of the mutex
   b692c405a1ae sys: don't hold uts_sem while accessing userspace memory
   c2ea292b1350 iommu/vt-d: Fix dev iotlb pfsid use
   eb58c40465f3 iommu/vt-d: Add definitions for PFSID
   7cf82f3b7a77 mm/tlb: Remove tlb_remove_table() non-concurrent condition
   ddcb92700552 ARM: tegra: Fix Tegra30 Cardhu PCA954x reset
   d453f04e813a NFSv4: Fix a sleep in atomic context in nfs4_callback_sequence()
   c5759d5a7e6a NFSv4: Fix locking in pnfs_generic_recover_commit_reqs
   bf23ba3737e0 NFSv4 client live hangs after live data migration recovery
   ec13c53dc59f pnfs/blocklayout: off by one in bl_map_stripe()
   ed480f2b9e86 block, bfq: return nbytes and not zero from struct cftype .write() method
   fe806eb54bca xtensa: increase ranges in ___invalidate_{i,d}cache_all
   0d78efe0412b xtensa: limit offsets in __loop_cache_{all,page}
   025cc91f8c52 KVM: PPC: Book3S: Fix guest DMA when guest partially backed by THP pages
   58936d4d7b14 KVM: VMX: fixes for vmentry_l1d_flush module parameter
   015156f50179 PM / sleep: wakeup: Fix build error caused by missing SRCU support
   924383edf44c cpufreq: governor: Avoid accessing invalid governor_data
   256f63f52ec3 drivers/block/zram/zram_drv.c: fix bug storing backing_dev
   8840ca570f2b ovl: fix wrong use of impure dir cache in ovl_iterate()
   aa9ceea20788 mfd: hi655x: Fix regmap area declared size for hi655x
   4f6789cad647 uprobes: Use synchronize_rcu() not synchronize_sched()
   a36e2aa90576 livepatch: Validate module/old func name length
   68a735eb9a16 printk/tracing: Do not trace printk_nmi_enter()
   cbde057aa0e7 tracing/blktrace: Fix to allow setting same value
   4c9016757e3b tracing: Do not call start/stop() functions when tracing_on does not change
   2b4c940dccbe rtc: omap: fix potential crash on power off
   bbac5374b537 vmw_balloon: fix VMCI use when balloon built into kernel
   89667b269e87 vmw_balloon: VMCI_DOORBELL_SET does not check status
   d3b403844db5 vmw_balloon: do not use 2MB without batching
   9fd44e90903c vmw_balloon: fix inflation of 64-bit GFNs
   c0a8e047734c extcon: Release locking when sending the notification of connector state
   3f9481902f0b iio: ad9523: Fix return value for ad952x_store()
   e4d3a25111dc iio: ad9523: Fix displayed phase
   b86374912fee iio: sca3000: Fix missing return in switch
   91b48a9ced06 Drivers: hv: vmbus: Reset the channel callback in vmbus_onoffer_rescind()
   d286cfd45277 uart: fix race between uart_put_char() and uart_shutdown()
   5044eb05026e dm crypt: don't decrease device limits
   f961be894413 dm cache metadata: set dirty on all cache blocks after a crash
   b7227e6044be dm cache metadata: save in-core policy_hint_size to on-disk superblock
   3bef88257145 dm thin: stop no_space_timeout worker when switching to write-mode
   4f4b1c5c4c8a dm integrity: change 'suspending' variable from bool to int
   5f04d296f24b net/9p/trans_fd.c: fix race-condition by flushing workqueue before the kfree()
   312479e06828 net/9p/client.c: version pointer uninitialized
   f92953b0765b 9p/virtio: fix off-by-one error in sg list bounds check
   4827a583871a fs/9p/xattr.c: catch the error of p9_client_clunk when setting xattr failed
   390671089d62 9p: fix multiple NULL-pointer-dereferences
   def89b81ef45 RDMA/rxe: Set wqe->status correctly if an unexpected response is received
   bac5c3c122f4 ib_srpt: Fix a use-after-free in srpt_close_ch()
   241e62005c74 cxl: Fix wrong comparison in cxl_adapter_context_get()
   1eb08e7b192d powerpc/powernv/pci: Work around races in PCI bridge enabling
   15677df25afc PCI: Add wrappers for dev_printk()
   4bfd910e8fb3 powerpc/pseries: Fix endianness while restoring of r3 in MCE handler.
   ed53c0ecc959 powerpc/fadump: handle crash memory ranges array index overflow
   259c5122f3a8 Fix kexec forbidding kernels signed with keys in the secondary keyring to boot
   f70805bef73e Replace magic for trusting the secondary keyring with #define
   9cbb32610233 mailbox: xgene-slimpro: Fix potential NULL pointer dereference
   c160382ab064 media: Revert "[media] tvp5150: fix pad format frame height"
   fba6b7f4bbe2 libertas: fix suspend and resume for SDIO connected cards
   7188f7416438 drm/i915/userptr: reject zero user_size
   1e2698976822 block: really disable runtime-pm for blk-mq
   0affbaece6d0 block: blk_init_allocated_queue() set q->fq as NULL in the fail case
   cf12d0f9c0dc readahead: stricter check for bdi io_pages
   8513c01ae15f mmc: renesas_sdhi_internal_dmac: fix #define RST_RESERVED_BITS
   e7b6b3699b97 spi: cadence: Change usleep_range() to udelay(), for atomic context
   dc9a7dd57f63 spi: spi-fsl-dspi: Fix imprecise abort on VF500 during probe
   23554cab1ebd spi: pxa2xx: Add support for Intel Ice Lake
   aa1d05c50483 spi: davinci: fix a NULL pointer dereference
   4d3016e56c3d 9p/net: Fix zero-copy path in the 9p virtio transport
   4a2262972b5d net: mac802154: tx: expand tailroom if necessary
   54c0fa829d45 net: 6lowpan: fix reserved space for single frames
   ee13f7edca58 Linux 4.14.68
   77d1658e5dd1 gcc-plugins: Use dynamic initializers
   616d41d1b408 gcc-plugins: Add include required by GCC release 8
   73b2e7073b51 cdrom: Fix info leak/OOB read in cdrom_ioctl_drive_status
   63a0f9de021a watchdog: Mark watchdog touch functions as notrace
   f9f67667e0ae power: generic-adc-battery: check for duplicate properties copied from iio channels
   54cecb7440bc power: generic-adc-battery: fix out-of-bounds write when copying channel properties
   d2a97eba0c4e PM / clk: signedness bug in of_pm_clk_add_clks()
   2adc2541a5c4 clk: rockchip: fix clk_i2sout parent selection bits on rk3399
   ae302d685162 iscsi target: fix session creation failure handling
   5b55b24cec4c scsi: core: Avoid that SCSI device removal through sysfs triggers a deadlock
   c984f4d1d40a scsi: sysfs: Introduce sysfs_{un,}break_active_protection()
   d071004e0249 scsi: mpt3sas: Fix _transport_smp_handler() error path
   61ec14f42c84 tpm: Return the actual size when receiving an unsupported command
   ba0797a8016c MIPS: lib: Provide MIPS64r6 __multi3() for GCC < 7
   1c40cd97ffe3 MIPS: Change definition of cpu_relax() for Loongson-3
   156b5e33ab12 MIPS: Always use -march=<arch>, not -<arch> shortcuts
   62c59b1ddbdc MIPS: Correct the 64-bit DSP accumulator register size
   4bdf9c175980 kprobes: Make list and blacklist root user read only
   6ba27d3e2b4a kprobes/arm: Fix %p uses in error messages
   0536c9e41f3f s390/pci: fix out of bounds access during irq setup
   2ac8fbd174d7 s390/numa: move initial setup of node_to_cpumask_map
   97e3dcc08e4e s390/qdio: reset old sbal_state flags
   bcd169a2726a s390: fix br_r1_trampoline for machines without exrl
   9fae74e9a441 s390/mm: fix addressing exception after suspend/resume
   bbcbaf56ff4b x86/entry/64: Wipe KASAN stack shadow before rewind_stack_do_exit()
   cf9fcdd6c2a2 hwmon: (nct6775) Fix potential Spectre v1
   ec4034835eaf x86/speculation/l1tf: Increase l1tf memory limit for Nehalem+
   f64979512c5e x86/spectre: Add missing family 6 check to microcode check
   f822ceb82608 x86/irqflags: Mark native_restore_fl extern inline
   53f01e2004ae x86/nmi: Fix NMI uaccess race against CR3 switching
   fbd5b82d30d2 x86/vdso: Fix lsl operand order
   42228037aa5f pinctrl: freescale: off by one in imx1_pinconf_group_dbg_show()
   7806d2ef4904 ASoC: sirf: Fix potential NULL pointer dereference
   2ef691428ee3 ASoC: zte: Fix incorrect PCM format bit usages
   d1913b9e07e7 ASoC: dpcm: don't merge format from invalid codec dai
   e16bbdeccdd7 b43/leds: Ensure NUL-termination of LED name string
   f0f3784ee3e9 b43legacy/leds: Ensure NUL-termination of LED name string
   f337a54878e2 udl-kms: avoid division
   c0357c1895ae udl-kms: fix crash due to uninitialized memory
   86c18c5a4bc5 udl-kms: handle allocation failure
   29e641a3693a udl-kms: change down_interruptible to down
   e8a3f3a03655 fuse: Add missed unlock_page() to fuse_readpages_fill()
   ff4a71855d0a fuse: Fix oops at process_init_reply()
   973206923812 fuse: umount should wait for all requests
   fc17d7519e8e fuse: fix unlocked access to processing queue
   cfb6eca6e4bb fuse: fix double request_end()
   7d392674443c fuse: fix initial parallel dirops
   eaebcf902ae0 fuse: Don't access pipe->buffers without pipe_lock()
   c49505f6efb1 x86/kvm/vmx: Remove duplicate l1d flush definitions
   933e1ab12051 KVM: x86: SVM: Call x86_spec_ctrl_set_guest/host() with interrupts disabled
   cedb8037f069 x86/process: Re-export start_thread()
   4587db4c2a95 x86/vdso: Fix vDSO build if a retpoline is emitted
   310f2a6e3ad3 x86/speculation/l1tf: Suggest what to do on systems with too much RAM
   59463ec29cac x86/speculation/l1tf: Fix off-by-one error when warning that system has too much RAM
   7418d7086217 x86/speculation/l1tf: Fix overflow in l1tf_pfn_limit() on 32bit
   e9afa7c1ef17 mm/tlb, x86/mm: Support invalidating TLB caches for RCU_TABLE_FREE
   3e0994616d4a mm: move tlb_table_flush to tlb_flush_mmu_free
   7d91aa5717db platform/x86: ideapad-laptop: Apply no_hw_rfkill to Y20-15IKBM, too
   0c9bed369889 nvme-pci: add a memory barrier to nvme_dbbuf_update_and_check_event
   509c0cdfb438 ext4: reset error code in ext4_find_entry in fallback
   5043e05dd571 ext4: sysfs: print ext4_super_block fields as little-endian
   7773a6d94896 ext4: check for NUL characters in extended attribute's name
   bd0f93a630ff stop_machine: Atomically queue and wake stopper threads
   e72107b2d995 stop_machine: Reflow cpu_stop_queue_two_works()
   97f76f3bc406 s390/kvm: fix deadlock when killed by oom
   4a06fdf2c490 KVM: arm/arm64: Skip updating PTE entry if no change
   792a039415dc KVM: arm/arm64: Skip updating PMD entry if no change
   75677d72be74 arm64: dts: rockchip: corrected uart1 clock-names for rk3328
   5a56b307992e arm64: mm: check for upper PAGE_SHIFT bits in pfn_valid()
   a8affa695373 kprobes/arm64: Fix %p uses in error messages
   cd71265a8cd6 printk/nmi: Prevent deadlock when accessing the main log buffer in NMI
   943276ef14c7 printk: Create helper function to queue deferred console handling
   646e7c04803f printk: Split the code for storing a message into the log buffer
   b48522b7887a iommu/arm-smmu: Error out only if not enough context interrupts
   f91ca31f5379 Btrfs: fix btrfs_write_inode vs delayed iput deadlock
   e7457f97d2af btrfs: don't leak ret from do_chunk_alloc
   770025cc4b69 btrfs: use correct compare function of dirty_metadata_bytes
   758f55f91833 smb3: fill in statfs fsid and correct namelen
   66913d23eeda smb3: don't request leases in symlink creation and query
   be1210c7758c smb3: Do not send SMB3 SET_INFO if nothing changed
   82a856f52733 smb3: enumerating snapshots was leaving part of the data off end
   d5f2790a7a1e cifs: check kmalloc before use
   cba34b940773 cifs: add missing debug entries for kconfig options
   cfcfbe08d298 mei: don't update offset in write
   cf7ab2abc524 mm/memory.c: check return value of ioremap_prot
   7bb880a11650 scsi: vmw_pvscsi: Return DID_RESET for status SAM_STAT_COMMAND_TERMINATED
   4ce46fff750d scsi: fcoe: clear FC_RP_STARTED flags when receiving a LOGO
   a67aef68ef24 scsi: fcoe: drop frames in ELS LOGO error path
   95239b2db50f scsi: fcoe: fix use-after-free in fcoe_ctlr_els_send
   fbb37b72489d gpiolib-acpi: make sure we trigger edge events at least once on boot
   1d7bf02d716d memcg: remove memcg_cgroup::id from IDR on mem_cgroup_css_alloc() failure
   47041cf42a47 drivers: net: lmc: fix case value for target abort error
   28013eecf6a0 Squashfs: Compute expected length from inode size rather than block length
   249778d9459a mm: delete historical BUG from zap_pmd_range()
   8babbc02f893 squashfs metadata 2: electric boogaloo
   dfa5c4bf8c94 enic: do not call enic_change_mtu in enic_probe
   574a4f3e6173 sparc: use asm-generic version of msi.h
   7c841ea7f8f1 sparc/time: Add missing __init to init_tick_ops()
   24fab572ae7d arc: fix type warnings in arc/mm/cache.c
   391e3007e447 arc: fix build errors in arc/include/asm/delay.h
   aca05b1741d3 arc: [plat-eznps] fix printk warning in arc/plat-eznps/mtm.c
   79f9c523ca43 arc: [plat-eznps] fix data type errors in platform headers
   d267258ee192 ARC: [plat-eznps] Add missing struct nps_host_reg_aux_dpc
   2312e6a802b3 enic: handle mtu change for vf properly
   d4f96c0515fc nfp: flower: fix port metadata conversion bug
   bc928fdf5d1e bpf: use GFP_ATOMIC instead of GFP_KERNEL in bpf_parse_prog()
   331c36cd01d8 ARC: dma [non-IOC] setup SMP_CACHE_BYTES and cache_line_size
   49c1fba34589 Revert "MIPS: BCM47XX: Enable 74K Core ExternalSync for PCIe erratum"
   9339ea7c92fc tools/power turbostat: Read extended processor family from CPUID
   a73b6c4c2601 zswap: re-check zswap_is_full() after do zswap_shrink()
   92c159863d8a ipc/sem.c: prevent queue.status tearing in semop
   2dd2f7722570 hinic: Link the logical network device to the pci device in sysfs
   d00c34f8e205 selftests/ftrace: Add snapshot and tracing_on test case
   2c69b0300458 cachefiles: Wait rather than BUG'ing on "Unexpected object collision"
   4029dd9fc48b cachefiles: Fix refcounting bug in backing-file read monitoring
   819b476c2138 fscache: Allow cancelled operations to be enqueued
   165335d4f18e x86/boot: Fix if_changed build flip/flop bug
   d35aab9df15a sched/rt: Restore rt_runtime after disabling RT_RUNTIME_SHARE
   0ba83f87c3f1 i2c/mux, locking/core: Annotate the nested rt_mutex usage
   b3da5df23900 locking/rtmutex: Allow specifying a subclass for nested locking
   354e35beb0c5 net: axienet: Fix double deregister of mdio
   f63868841a31 qmi_wwan: fix interface number for DW5821e production firmware
   637de2c01678 bnx2x: Fix invalid memory access in rss hash config path.
   1875957f2ec4 media: staging: omap4iss: Include asm/cacheflush.h after generic includes
   00f795e12b8b perf/x86/amd/ibs: Don't access non-started event
   385b40b4fc1b i2c: davinci: Avoid zero value of CLKH
   562d7bc6c966 can: m_can: Move accessing of message ram to after clocks are enabled
   0b14a856f918 can: mpc5xxx_can: check of_iomap return before use
   06ab42734529 net: prevent ISA drivers from building on PPC32
   5803ce5effc9 atl1c: reserve min skb headroom
   ffb34418ca94 qed: Correct Multicast API to reflect existence of 256 approximate buckets.
   f4e284f1db9e qed: Fix possible race for the link state value.
   77c65d5f40c6 qed: Fix link flap issue due to mismatching EEE capabilities.
   b970d8a1c213 net: caif: Add a missing rcu_read_unlock() in caif_flow_cb
   a10170d94ed4 tools/power turbostat: fix -S on UP systems
   10ca6b3f92d3 KVM: vmx: use local variable for current_vmptr when emulating VMPTRST
   123534dbd490 netfilter: nf_tables: don't allow to rename to already-pending name
   4a0144a43c52 netfilter: nf_tables: fix memory leaks on chain rename
   e3476a6da5d8 bpf, ppc64: fix unexpected r0=0 exit path inside bpf_xadd
   a685c4c4d6e8 netfilter: nft_set_hash: add rcu_barrier() in the nft_rhash_destroy()
   70e88fef36ec usb: gadget: f_uac2: fix endianness of 'struct cntrl_*_lay3'
   7cd80fc138f2 tools: usb: ffs-test: Fix build on big endian systems
   645fef5e8dde usb/phy: fix PPC64 build errors in phy-fsl-usb.c
   a362655deb0e usb: gadget: u_audio: protect stream runtime fields with stream spinlock
   c7d18686e87a usb: gadget: u_audio: remove cached period bytes value
   42b09bece176 usb: gadget: u_audio: remove caching of stream buffer parameters
   224c0d0894ff usb: gadget: u_audio: update hw_ptr in iso_complete after data copied
   dc126a1e5fb8 usb: gadget: u_audio: fix pcm/card naming in g_audio_setup()
   fa18ff7edb88 usb: gadget: f_uac2: fix error handling in afunc_bind (again)
   43b058dc21cd usb: gadget: r8a66597: Fix a possible sleep-in-atomic-context bugs in r8a66597_queue()
   3f41c2d0e618 usb: gadget: r8a66597: Fix two possible sleep-in-atomic-context bugs in init_controller()
   05ee6166d702 nbd: handle unexpected replies better
   ced413c5ef85 nbd: don't requeue the same request twice.
   962ff36dac01 drm/imx: imx-ldb: check if channel is enabled before printing warning
   a43eac2d855b drm/imx: imx-ldb: disable LDB on driver bind
   9ac1a4644bb8 scsi: libiscsi: fix possible NULL pointer dereference in case of TMF
   ca5fc53ad401 scsi: target: iscsi: cxgbit: fix max iso npdu calculation
   384f0d9fe4ad drm/bridge: adv7511: Reset registers on hotplug
   7cb625dd9ed6 nl80211: Add a missing break in parse_station_flags
   147b89c421d0 ext4: clear mmp sequence number when remounting read-only
   de044d4ecc65 mac80211: add stations tied to AP_VLANs during hw reconfig
   b6f147a2d907 esp6: fix memleak on error path in esp6_input
   0118f86d21f1 xfrm: free skb if nlsk pointer is NULL
   d35cc7ed2cfe xfrm: fix missing dst_release() after policy blocking lbcast and multicast
   d2adc199957f vti6: fix PMTU caching and reporting on xmit
   7ff4bf211f3e crypto: vmx - Use skcipher for ctr fallback

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index 0e34f53e6ee1..605dc6958931 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "af1b926c9160b0dbf2bbe41b166a8a7b07191fd2"
-SRCREV_meta ?= "f991b21d78588fa88d527e3607cc2dab35089ee8"
+SRCREV_machine ?= "c37a14708f5b618602f84f83f902346e055824c3"
+SRCREV_meta ?= "c35dd5cbbdb08dcc4fe35b8e9c0a62d1a157aeaf"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.67"
+LINUX_VERSION ?= "4.14.71"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index 061620031c71..20be3c18f3e0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -4,7 +4,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.14.67"
+LINUX_VERSION ?= "4.14.71"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
@@ -12,8 +12,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "74ecbeb03ebfc2b9a73a6554924b043b903295f5"
-SRCREV_meta ?= "f991b21d78588fa88d527e3607cc2dab35089ee8"
+SRCREV_machine ?= "3218be18094b7dfb4471b083c469452c8c7709ce"
+SRCREV_meta ?= "c35dd5cbbdb08dcc4fe35b8e9c0a62d1a157aeaf"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index caf7d66a72d3..c931cf807076 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "v4.14/standard/base"
 KBRANCH_qemux86-64 ?= "v4.14/standard/base"
 KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "93d58c0c59d1dcdba6ff76ef093de7de339414a8"
-SRCREV_machine_qemuarm64 ?= "888066bc1b9cc5f596da8237cbf74417106e8f22"
-SRCREV_machine_qemumips ?= "a9d862bb92707f39c0cf2b2cc6f1645e88a99eb9"
-SRCREV_machine_qemuppc ?= "d8ced31602b65fb92487865502da595bd113a329"
-SRCREV_machine_qemux86 ?= "084af9624d268ddf4fd65b2f9e8e50ca2f22e62b"
-SRCREV_machine_qemux86-64 ?= "084af9624d268ddf4fd65b2f9e8e50ca2f22e62b"
-SRCREV_machine_qemumips64 ?= "44e1719a8f4fe10e88c13b9ec6c1fa1d041efaed"
-SRCREV_machine ?= "084af9624d268ddf4fd65b2f9e8e50ca2f22e62b"
-SRCREV_meta ?= "f991b21d78588fa88d527e3607cc2dab35089ee8"
+SRCREV_machine_qemuarm ?= "01420c91452e2d0b3e2979fa28e4223d3febecac"
+SRCREV_machine_qemuarm64 ?= "8a03088a8a605ecaaa3d50fd01df879db51e7658"
+SRCREV_machine_qemumips ?= "ec4f1d52fb385941f77a3611a833153f24354d98"
+SRCREV_machine_qemuppc ?= "51e55e9630dc7bc351dc659eb7fa97446a84cf9f"
+SRCREV_machine_qemux86 ?= "78a16a4d8cfd58f91be412797aac248e811d083b"
+SRCREV_machine_qemux86-64 ?= "78a16a4d8cfd58f91be412797aac248e811d083b"
+SRCREV_machine_qemumips64 ?= "f074d718736e95e8ed5460bf8e85c7e77ff7df87"
+SRCREV_machine ?= "78a16a4d8cfd58f91be412797aac248e811d083b"
+SRCREV_meta ?= "c35dd5cbbdb08dcc4fe35b8e9c0a62d1a157aeaf"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.67"
+LINUX_VERSION ?= "4.14.71"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.5.0


