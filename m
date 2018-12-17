Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6168B7BE07
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 03:39:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBH3dvnB029810
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Dec 2018 19:39:57 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 16 Dec 2018 19:39:56 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 16 Dec 2018 22:38:22 -0500
Message-ID: <0f07b14f306e9a5314f64a3f0aca73ee636f73cc.1545017775.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1545017774.git.bruce.ashfield@windriver.com>
References: <cover.1545017774.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/17] linux-yocto/4.18: update to v4.18.20
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
X-List-Received-Date: Mon, 17 Dec 2018 03:39:56 -0000
Content-Type: text/plain

Integrating the korg releases that comprise the following commits:

   a9da8725b7a7 Linux 4.18.20
   55eac9e85dea Revert "ACPICA: AML interpreter: add region addresses in global list during initialization"
   770271829fbe CONFIG_XEN_PV breaks xen_create_contiguous_region on ARM
   355c0d23ff88 drm/i915: Fix possible race in intel_dp_add_mst_connector()
   0400eb06d37c drm/i915/execlists: Force write serialisation into context image vs execution
   06e562e7f515 drm/i915/ringbuffer: Delay after EMIT_INVALIDATE for gen4/gen5
   41a2334c224e drm/i915: Mark pin flags as u64
   a4820798a2ed drm/i915: Don't oops during modeset shutdown after lpe audio deinit
   d0baf6ac9fcc drm/i915: Compare user's 64b GTT offset even on 32b
   b9d3cae0b451 drm/i915: Fix ilk+ watermarks when disabling pipes
   877e75bc93ec drm/i915: Fix error handling for the NV12 fb dimensions check
   63f4972b9b22 drm/i915/hdmi: Add HDMI 2.0 audio clock recovery N values
   df00d4ac7d26 drm/i915/dp: Restrict link retrain workaround to external monitors
   6440b1a7f8f2 drm/i915/dp: Fix link retraining comment in intel_dp_long_pulse()
   f28285d10021 drm/i915: Large page offsets for pread/pwrite
   874d2275ee94 drm/i915: Skip vcpi allocation for MSTB ports that are gone
   0cf4813b215f drm/i915: Don't unset intel_connector->mst_port
   6aba99c55748 drm/i915: Restore vblank interrupts earlier
   68b4918e7072 drm/i915/dp: Link train Fallback on eDP only if fallback link BW can fit panel's native mode
   a90d6f083b7a drm: panel-orientation-quirks: Add quirk for Acer One 10 (S1003)
   4a7daecdaab9 drm/dp_mst: Check if primary mstb is null
   fbea4573dc0b drm/etnaviv: fix bogus fence complete check in timeout handler
   13b3707bafea drm/amd/powerplay: Enable/Disable NBPSTATE on On/OFF of UVD
   1cca6c472fcc drm/nouveau: Fix nv50_mstc->best_encoder()
   699242cf4aca drm/nouveau: Check backlight IDs are >= 0, not > 0
   bbf40af9c2d8 drm/amdgpu: add missing CHIP_HAINAN in amdgpu_ucode_get_load_type
   842b99a831c5 drm/amdgpu: Fix typo in amdgpu_vmid_mgr_init
   5b231a7b3326 drm/msm: fix OF child-node lookup
   0ad256e8ed36 drm/rockchip: Allow driver to be shutdown on reboot/kexec
   6f680252dc25 efi/arm/libstub: Pack FDT after populating it
   e47645d9b0fb mm/swapfile.c: use kvzalloc for swap_info_struct allocation
   82743f44a420 hugetlbfs: fix kernel BUG at fs/hugetlbfs/inode.c:444!
   2ca904bea902 lib/ubsan.c: don't mark __ubsan_handle_builtin_unreachable as noreturn
   f4ae32cf2589 crypto: user - fix leaking uninitialized memory to userspace
   f784bb167d5f libata: blacklist SAMSUNG MZ7TD256HAFV-000L9 SSD
   08f382aeba0c gfs2: Fix metadata read-ahead during truncate (2)
   47e7c3fc9b8b gfs2: Put bitmap buffers in put_super
   bd9568c3484b configfs: replace strncpy with memcpy
   5fe5a24a8cc8 selinux: check length properly in SCTP bind hook
   a80cb9b67334 fuse: fix leaked notify reply
   e6fed825e0eb fuse: fix use-after-free in fuse_direct_IO()
   693a06b52aab rtc: hctosys: Add missing range error reporting
   651c5d16f3a9 nfsd: COPY and CLONE operations require the saved filehandle to be set
   f194756edd6c NFSv4: Don't exit the state manager without clearing NFS4CLNT_MANAGER_RUNNING
   7142f0dcc2c8 sunrpc: correct the computation for page_ptr when truncating
   13c70ef5b3c7 kdb: print real address of pointers instead of hashed addresses
   6514d22a21ad kdb: use correct pointer when 'btc' calls 'btt'
   6520fe938946 mnt: fix __detach_mounts infinite loop
   d1a5f8e4d27e mount: Prevent MNT_DETACH from disconnecting locked mounts
   376732709e5d mount: Don't allow copying MNT_UNBINDABLE|MNT_LOCKED mounts
   afae7f7336d5 mount: Retest MNT_LOCKED in do_umount
   e1d8594f10d1 ext4: fix buffer leak in __ext4_read_dirblock() on error path
   4f1e87322991 ext4: fix buffer leak in ext4_expand_extra_isize_ea() on error path
   73b05bc9cfdc ext4: fix buffer leak in ext4_xattr_move_to_block() on error path
   93b0fc8e9005 ext4: release bs.bh before re-using in ext4_xattr_block_find()
   ef3af4ee5b81 ext4: fix buffer leak in ext4_xattr_get_block() on error path
   2efa77a4df20 ext4: fix possible leak of s_journal_flag_rwsem in error path
   891dd04dc1cc ext4: fix possible leak of sbi->s_group_desc_leak in error path
   0ff14c16afc8 ext4: avoid possible double brelse() in add_new_gdb() on error path
   84d88fc7e751 ext4: fix missing cleanup if ext4_alloc_flex_bg_array() fails while resizing
   78805335fb17 ext4: avoid buffer leak in ext4_orphan_add() after prior errors
   aac055dfa4ee ext4: avoid buffer leak on shutdown in ext4_mark_iloc_dirty()
   d61417997e50 ext4: fix possible inode leak in the retry loop of ext4_resize_fs()
   dd6d368f6f18 ext4: missing !bh check in ext4_xattr_inode_write()
   c802502a2e80 ext4: avoid potential extra brelse in setup_new_flex_group_blocks()
   56415293423b ext4: add missing brelse() add_new_gdb_meta_bg()'s error path
   ab88f38df803 ext4: add missing brelse() in set_flexbg_block_bitmap()'s error path
   5ee0b3985aec ext4: add missing brelse() update_backups()'s error path
   d4b97e20c7ea clockevents/drivers/i8253: Add support for PIT shutdown quirk
   a77da38bfda3 Btrfs: fix data corruption due to cloning of eof block
   0c4fb98c8f6f Btrfs: fix infinite loop on inode eviction after deduplication of eof block
   1064b11af79d Btrfs: fix cur_offset in the error case for nocow
   383ceb87733b btrfs: fix pinned underflow after transaction aborted
   57da76a94a8a watchdog/core: Add missing prototypes for weak functions
   11cf9be2e473 arch/alpha, termios: implement BOTHER, IBSHIFT and termios2
   7d7a750eabf2 termios, tty/tty_baudrate.c: fix buffer overrun
   d74a4fc841cf x86/hyper-v: Enable PIT shutdown quirk
   bcdff99a9348 x86/cpu/vmware: Do not trace vmware_sched_clock()
   9eaed9022502 of, numa: Validate some distance map rules
   688995faeb6f perf stat: Handle different PMU names with common prefix
   b66ad9290fbf hwmon: (core) Fix double-free in __hwmon_device_register()
   1ef2d80cb3da mtd: docg3: don't set conflicting BCH_CONST_PARAMS option
   ca589cb08cd6 mtd: nand: Fix nanddev_neraseblocks()
   98f1ce39c92c mtd: spi-nor: cadence-quadspi: Return error code in cqspi_direct_read_execute()
   ab2b363733ac bonding/802.3ad: fix link_failure_count tracking
   e36798fc10e2 ARM: 8809/1: proc-v7: fix Thumb annotation of cpu_v7_hvc_switch_mm
   5d64390cff09 netfilter: conntrack: fix calculation of next bucket number in early_drop
   ca1c5698fa94 memory_hotplug: cond_resched in __remove_pages
   a01e1536fc68 mm: thp: relax __GFP_THISNODE for MADV_HUGEPAGE mappings
   b74b152e9442 ocfs2: free up write context when direct IO failed
   8362d09a7ff3 ocfs2: fix a misuse a of brelse after failing ocfs2_check_dir_entry
   f458499f2c96 soc: ti: QMSS: Fix usage of irq_set_affinity_hint
   dd4f21dfb81d Revert "powerpc/8xx: Use L1 entry APG to handle _PAGE_ACCESSED for CONFIG_SWAP"
   094e5a111d0e SCSI: fix queue cleanup race before queue initialization is done
   aef93deeff58 scsi: qla2xxx: Initialize port speed to avoid setting lower speed
   3fb039d37f96 vhost/scsi: truncate T10 PI iov_iter to prot_bytes
   543c52975eb8 reset: hisilicon: fix potential NULL pointer dereference
   84d1d9cc1c0c acpi, nfit: Fix ARS overflow continuation
   13bb0de8e25c acpi/nfit, x86/mce: Validate a MCE's address before using it
   cdd219834f93 acpi/nfit, x86/mce: Handle only uncorrectable machine checks
   69df28065f30 mach64: fix image corruption due to reading accelerator registers
   7f6c07f5402e mach64: fix display corruption on big endian machines
   c5a924179783 thermal: core: Fix use-after-free in thermal_cooling_device_destroy_sysfs
   bb34fbacd90c Revert "ceph: fix dentry leak in splice_dentry()"
   e5d8d13800ca libceph: bump CEPH_MSG_MAX_DATA_LEN
   1189a2216800 clk: rockchip: Fix static checker warning in rockchip_ddrclk_get_parent call
   91a17b82ae41 clk: rockchip: fix wrong mmc sample phase shift for rk3328
   7b659a3e5116 clk: sunxi-ng: h6: fix bus clocks' divider position
   3a6f7116bf57 clk: at91: Fix division by zero in PLL recalc_rate()
   b4972d19dbf8 clk: s2mps11: Fix matching when built as module and DT node contains compatible
   7b8b07a696c2 um: Drop own definition of PTRACE_SYSEMU/_SINGLESTEP
   8e81ecdcbaaf xtensa: fix boot parameters address translation
   b9474cabc3c4 xtensa: make sure bFLT stack is 16 byte aligned
   8501e03baaf2 xtensa: add NOTES section to the linker script
   454dd3e93e38 MIPS: Loongson-3: Fix BRIDGE irq delivery problem
   099ef76d3dd9 MIPS: Loongson-3: Fix CPU UART irq delivery problem
   22f185cf0272 zram: close udev startup race condition as default groups
   b2405b2330d3 clk: meson: axg: mark fdiv2 and fdiv3 as critical
   b7dcf0d3a8f1 clk: meson-gxbb: set fclk_div3 as CLK_IS_CRITICAL
   74cd739ed987 arm64: dts: stratix10: fix multicast filtering
   f0ef4cf3d407 arm64: dts: stratix10: Support Ethernet Jumbo frame
   f8c835816ad4 scsi: qla2xxx: Fix NVMe session hang on unload
   318cb27e7fa0 scsi: qla2xxx: Fix re-using LoopID when handle is in use
   aa67028ac422 ovl: fix recursive oi->lock in ovl_link()
   1b8ca12ee8af fuse: set FR_SENT while locked
   10b6b5d193b6 fuse: fix blocked_waitq wakeup
   8b71920c90c3 fuse: Fix use-after-free in fuse_dev_do_write()
   f7e709c59e58 fuse: Fix use-after-free in fuse_dev_do_read()
   38d3f7b2e20f scsi: qla2xxx: Fix driver hang when FC-NVMe LUNs are configured
   f05744c0277c scsi: qla2xxx: Fix duplicate switch database entries
   792b70b674bf scsi: qla2xxx: shutdown chip if reset fail
   187dc52ddacb scsi: qla2xxx: Remove stale debug trace message from tcm_qla2xxx
   008bab2eb77d scsi: qla2xxx: Fix process response queue for ISP26XX and above
   7e9178071fb1 scsi: qla2xxx: Fix incorrect port speed being set for FC adapters
   c1d44176f2c3 serial: sh-sci: Fix could not remove dev_attr_rx_fifo_timeout
   6fcbb25da516 ovl: check whiteout in ovl_create_over_whiteout()
   6915a20df5f8 ovl: fix error handling in ovl_verify_set_fh()
   1dffd49a92dd cdrom: fix improper type cast, which can leat to information leak.
   09901a24c215 9p: clear dangling pointers in p9stat_free
   ab5b8371449b ARM: dts: imx6ull: keep IMX6UL_ prefix for signals on both i.MX6UL and i.MX6ULL
   8515b9edf7a0 udf: Prevent write-unsupported filesystem to be remounted read-write
   a9dbfcffbfba 9p locks: fix glock.client_id leak in do_lock
   b710256edba8 staging: most: video: fix registration of an empty comp core_component
   938e30c56446 drm/amdgpu: Fix SDMA TO after GPU reset v3
   35c37a531fa0 drm: rcar-du: Update Gen3 output limitations
   e6b5db61b2d6 staging:iio:ad7606: fix voltage scales
   3136e7a31323 powerpc/selftests: Wait all threads to join
   e7bce56063ac media: tvp5150: fix width alignment during set_selection()
   2139f23fd233 sc16is7xx: Fix for multi-channel stall
   809923bfbf77 MIPS/PCI: Call pcie_bus_configure_settings() to set MPS/MRRS
   0305be8f74fb powerpc/memtrace: Remove memory in chunks
   439f5244a9f4 powerpc/boot: Ensure _zimage_start is a weak symbol
   c6e2ae7ca034 MIPS: kexec: Mark CPU offline before disabling local IRQ
   09249888b1ad media: coda: don't overwrite h.264 profile_idc on decoder instance
   56a738841c49 media: pci: cx23885: handle adding to list failure
   ae2a9a2cebf3 drm/hisilicon: hibmc: Do not carry error code in HiBMC framebuffer pointer
   7cb3b831fea3 drm/amd/display: fix gamma not being applied
   7657b5bd3475 drm/omap: fix memory barrier bug in DMM driver
   56b14ace2cda powerpc/mm: Don't report hugepage tables as memory leaks when using kmemleak
   905119e2ea85 powerpc/nohash: fix undefined behaviour when testing page size support
   c89005fa57cc ARM: imx_v6_v7_defconfig: Select CONFIG_TMPFS_POSIX_ACL
   fab609de31de drm/amdgpu/powerplay: fix missing break in switch statements
   50513ecaf5f8 tracing/kprobes: Check the probe on unloaded module correctly
   39abc57fe589 tty: check name length in tty_find_polling_driver()
   45394cc9a3c4 powerpc/eeh: Fix possible null deref in eeh_dump_dev_log()
   6fc2ea857297 powerpc/Makefile: Fix PPC_BOOK3S_64 ASFLAGS
   9cfe21c38e5b Input: wm97xx-ts - fix exit path
   f813b2981fc3 drm/amd/display: fix bug of accessing invalid memory
   d74680a91a15 powerpc/mm: fix always true/false warning in slice.c
   7bd05ac862e2 powerpc/mm: Fix page table dump to work on Radix
   c467bb652d44 powerpc/64/module: REL32 relocation range check
   8d16dd049428 powerpc/traps: restore recoverability of machine_check interrupts
   6559b2338d96 Linux 4.18.19
   5c4f8ea1f313 MD: fix invalid stored role for a disk - try2
   ddf734ede053 bpf: wait for running BPF programs when updating map-in-map
   bbfed258eb08 userns: also map extents in the reverse map to kernel IDs
   46aa7eb182c9 net: sched: Remove TCA_OPTIONS from policy
   928b261cfbe6 Btrfs: fix use-after-free when dumping free space
   b7edab6df938 Btrfs: fix use-after-free during inode eviction
   4fbcf14ceb4c btrfs: move the dio_sem higher up the callchain
   904c7dc9dec1 btrfs: don't run delayed_iputs in commit
   13d6628c019d btrfs: fix insert_reserved error handling
   68c7db7c8f76 btrfs: only free reserved extent if we didn't insert it
   3e9205b1d619 btrfs: don't use ctl->free_space for max_extent_size
   171d45102ea8 btrfs: set max_extent_size properly
   17a7240a9508 btrfs: reset max_extent_size properly
   645dd2f9feab Btrfs: fix deadlock when writing out free space caches
   d7c7d298a76f Btrfs: fix assertion on fsync of regular file when using no-holes feature
   191597b15b24 Btrfs: fix null pointer dereference on compressed write path error
   07cf04229031 btrfs: qgroup: Dirty all qgroups before rescan
   96437af32b61 Btrfs: fix wrong dentries after fsync of file that got its parent replaced
   41bdbc9ea1ec Btrfs: fix warning when replaying log after fsync of a tmpfile
   09cbc39c1b7f btrfs: make sure we create all new block groups
   302e6eaa09d8 btrfs: reset max_extent_size on clear in a bitmap
   6078b6126651 btrfs: protect space cache inode alloc with GFP_NOFS
   ff9e68fd136b btrfs: release metadata before running delayed refs
   07ddb36eb150 Btrfs: don't clean dirty pages during buffered writes
   0efba7a66329 btrfs: wait on caching when putting the bg cache
   112249f4f379 btrfs: keep trim from interfering with transaction commits
   74a0609298dc btrfs: don't attempt to trim devices that don't support it
   599c6e4376cb btrfs: iterate all devices during trim, instead of fs_devices::alloc_list
   d12a47554ea9 btrfs: Ensure btrfs_trim_fs can trim the whole filesystem
   89dbabf7e2c3 btrfs: Enhance btrfs_trim_fs function to handle error better
   449f9b8dcf15 btrfs: fix error handling in btrfs_dev_replace_start
   e7e2afa8f83c btrfs: fix error handling in free_log_tree
   9fc2295c6ce8 btrfs: locking: Add extra check in btrfs_init_new_buffer() to avoid deadlock
   a0d7061e2905 btrfs: Handle owner mismatch gracefully when walking up tree
   68b0e1cae6f3 btrfs: qgroup: Avoid calling qgroup functions if qgroup is not enabled
   3734cce8cf6c tracing: Return -ENOENT if there is no target synthetic event
   7d3714bb7abe selftests/powerpc: Fix ptrace tm failure
   4bd6237fc951 selftests/ftrace: Fix synthetic event test to delete event correctly
   efd03258cc5c soc/tegra: pmc: Fix child-node lookup
   d4d1e7a2b1c8 soc: qcom: rmtfs-mem: Validate that scm is available
   4bfdd88d22a1 arm64: dts: stratix10: Correct System Manager register size
   09242a77726c ARM: dts: socfpga: Fix SDRAM node address for Arria10
   29b85eacc07a Cramfs: fix abad comparison when wrap-arounds occur
   cb3de273d7a3 rpmsg: smd: fix memory leak on channel create
   fd376dc39890 arm64: lse: remove -fcall-used-x0 flag
   391d6f13307e media: hdmi.h: rename ADOBE_RGB to OPRGB and ADOBE_YCC to OPYCC
   11e879dd4a6d media: replace ADOBERGB by OPRGB
   aff52a2f431b media: media colorspaces*.rst: rename AdobeRGB to opRGB
   2b33dfe74c2a drm/mediatek: fix OF sibling-node lookup
   795449cb0c51 media: adv7842: when the EDID is cleared, unconfigure CEC as well
   feb3a39a17ab media: adv7604: when the EDID is cleared, unconfigure CEC as well
   5df5d951c107 media: em28xx: fix handler for vidioc_s_input()
   634eb3c8780a media: em28xx: make v4l2-compliance happier by starting sequence on zero
   be91657a304c media: em28xx: fix input name for Terratec AV 350
   95dfd1d5aad4 media: tvp5150: avoid going past array on v4l2_querymenu()
   1ac7a4b394ad media: em28xx: use a default format if TRY_FMT fails
   e448dfd6d3ec media: cec: forgot to cancel delayed work
   b8ee0bd5b099 media: cec: fix the Signal Free Time calculation
   11f9f361470d media: cec: add new tx/rx status bits to detect aborts/timeouts
   6b92b55fd2cf xen-blkfront: fix kernel panic with negotiate_mq error path
   6bc564ec5682 xen: remove size limit of privcmd-buf mapping interface
   905632c2e61d xen: fix xen_qlock_wait()
   dbcbbbbf5aa3 media: cec: integrate cec_validate_phys_addr() in cec-api.c
   e4e97d13dd13 media: cec: make cec_get_edid_spa_location() an inline function
   239efda32abd kgdboc: Passing ekgdboc to command line causes panic
   e589ba2d14ad Revert "media: dvbsky: use just one mutex for serializing device R/W ops"
   d661c89b177d media: v4l2-tpg: fix kernel oops when enabling HFLIP and OSD
   ebc14b2ad1e7 net: bcmgenet: fix OF child-node lookup
   0f664bdc5f98 TC: Set DMA masks for devices
   eddf6140dbea iommu/arm-smmu: Ensure that page-table updates are visible before TLBI
   220720a431bf ocxl: Fix access to the AFU Descriptor Data
   02eabf6ac681 power: supply: twl4030-charger: fix OF sibling-node lookup
   8631b7bd98b9 rtc: cmos: Remove the `use_acpi_alarm' module parameter for !ACPI
   5b6bdf14357c rtc: cmos: Fix non-ACPI undefined reference to `hpet_rtc_interrupt'
   e0e518677149 rtc: ds1307: fix ds1339 wakealarm support
   1145e2b587d7 MIPS: OCTEON: fix out of bounds array access on CN68XX
   5cd5e22d5b1d MIPS: memset: Fix CPU_DADDI_WORKAROUNDS `small_fixup' regression
   163121109386 powerpc/64s/hash: Do not use PPC_INVALIDATE_ERAT on CPUs before POWER9
   ba5a3866a609 powerpc/tm: Fix HFSCR bit for no suspend case
   c0668860758e powerpc/msi: Fix compile error on mpc83xx
   a0bac51733c0 fsnotify: Fix busy inodes during unmount
   ddb75410b6a6 media: ov7670: make "xclk" clock optional
   933833d56e3c dm zoned: fix various dmz_get_mblock() issues
   8acae84c058c dm zoned: fix metadata block ref counting
   58963dc60bb5 dm ioctl: harden copy_params()'s copy_from_user() from malicious users
   1bc549827094 lockd: fix access beyond unterminated strings in prints
   7b4718d2d53d nfsd: Fix an Oops in free_session()
   04868067e324 nfsd: correctly decrement odstate refcount in error path
   209502944483 nfs: Fix a missed page unlock after pg_doio()
   006a1e6a2d9e NFSv4.1: Fix the r/wsize checking
   8fb746ed8e0c NFC: nfcmrvl_uart: fix OF child-node lookup
   193e214685dd genirq: Fix race on spurious interrupt detection
   06cbcf582caf printk: Fix panic caused by passing log_buf_len to command line
   fa4aec4d1e65 smb3: on kerberos mount if server doesn't specify auth type use krb5
   e8c4202e4b16 smb3: do not attempt cifs operation in smb3 query info error path
   278223e1fa26 smb3: allow stats which track session and share reconnects to be reset
   418f8bfb26e9 w1: omap-hdq: fix missing bus unregister at removal
   9cdbf32ae7d2 iio: adc: at91: fix wrong channel number in triggered buffer mode
   b4c1120e3182 iio: adc: at91: fix acking DRDY irq on simple conversions
   8221ff37fbb8 iio: adc: imx25-gcq: Fix leak of device_node in mx25_gcq_setup_cfgs()
   bcd4f42d000c iio: ad5064: Fix regulator handling
   33af6b490a1b kbuild: fix kernel/bounds.c 'W=1' warning
   dad142caf8b3 KVM: arm64: Fix caching of host MDCR_EL2 value
   a665c4ab7796 KVM: arm/arm64: Ensure only THP is candidate for adjustment
   d09d8eaa1806 mm/hmm: fix race between hmm_mirror_unregister() and mmu_notifier callback
   7bf8e1e365ba mm/rmap: map_pte() was not handling private ZONE_DEVICE page properly
   6d2ac8dbfd92 hugetlbfs: dirty pages as they are added to pagecache
   e484e62bc857 ima: fix showing large 'violations' or 'runtime_measurements_count'
   6f3691794c1a mm: /proc/pid/smaps_rollup: fix NULL pointer deref in smaps_pte_range()
   2016e63b7692 crypto: speck - remove Speck
   d4c47d9cf347 crypto: aegis/generic - fix for big endian systems
   805fd900bda2 crypto: morus/generic - fix for big endian systems
   9899e0e4528e crypto: aesni - don't use GFP_ATOMIC allocation if the request doesn't cross a page in gcm
   c00600a96550 crypto: tcrypt - fix ghash-generic speed test
   6aa3369f1768 crypto: lrw - Fix out-of bounds access on counter overflow
   9f0654d9a878 signal: Guard against negative signal numbers in copy_siginfo_from_user32
   071161f0cce4 signal/GenWQE: Fix sending of SIGKILL
   a5d415583c30 PCI: vmd: White list for fast interrupt handlers
   a06dfc8d5e18 PCI: Add Device IDs for Intel GPU "spurious interrupt" quirk
   c34f34ce93bb PCI/ASPM: Fix link_state teardown on device removal
   2e952918d04a ARM: dts: dra7: Fix up unaligned access setting for PCIe EP
   5074cd8b9936 EDAC, skx_edac: Fix logical channel intermediate decoding
   b0fc82d940a5 EDAC, {i7core,sb,skx}_edac: Fix uncorrected error counting
   6ba33971125c EDAC, amd64: Add Family 17h, models 10h-2fh support
   d08463386852 HID: hiddev: fix potential Spectre v1
   fafa54248a2f HID: wacom: Work around HID descriptor bug in DTK-2451 and DTH-2452
   6f076021ce7e selinux: fix mounting of cgroup2 under older policies
   dabb79bd2602 ext4: fix use-after-free race in ext4_remount()'s error path
   798d9a4c4d37 ext4: propagate error from dquot_initialize() in EXT4_IOC_FSSETXATTR
   c68737e3e4c3 ext4: fix setattr project check in fssetxattr ioctl
   5dd65242be71 ext4: initialize retries variable in ext4_da_write_inline_data_begin()
   34e60cb2f8ea ext4: fix EXT4_IOC_SWAP_BOOT
   d543195430fa gfs2_meta: ->mount() can get NULL dev_name
   08a394fe1c04 jbd2: fix use after free in jbd2_log_do_checkpoint()
   54baa22b41dc IB/rxe: Revise the ib_wr_opcode enum
   5855f2051298 IB/mlx5: Fix MR cache initialization
   2a270b59969a ASoC: sta32x: set ->component pointer in private struct
   31a02dd4ee74 ASoC: intel: skylake: Add missing break in skl_tplg_get_token()
   db1af9641867 libnvdimm, pmem: Fix badblocks population for 'raw' namespaces
   847179b1261a libnvdimm, region: Fail badblocks listing for inactive regions
   e31a8418c8df libnvdimm: Hold reference on parent while scheduling async init
   1ebefc8202c8 dmaengine: ppc4xx: fix off-by-one build failure
   389d46234082 net/ipv4: defensive cipso option parsing
   a11eb1510617 iwlwifi: mvm: check return value of rs_rate_from_ucode_rate()
   255768cf1b57 mt76: mt76x2: fix multi-interface beacon configuration
   7ea2dd519f59 usb: gadget: udc: renesas_usb3: Fix b-device mode for "workaround"
   4d5f0d220a29 usb: typec: tcpm: Fix APDO PPS order checking to be based on voltage
   d0e02f4b273b usbip:vudc: BUG kmalloc-2048 (Not tainted): Poison overwritten
   fc988a353d59 libertas: don't set URB_ZERO_PACKET on IN USB transfer
   9c47f44d0a93 xen/pvh: don't try to unplug emulated devices
   9006cb392293 xen/pvh: increase early stack size
   f91721a7895e xen: make xen_qlock_wait() nestable
   2c2395aaa9ba xen: fix race in xen_qlock_wait()
   726a8d0ae0f9 xen/balloon: Support xend-based toolstack
   a49e27c0efe5 xen/blkfront: avoid NULL blkfront_info dereference on device removal
   a76ef635cb22 tpm: Restore functionality to xen vtpm driver.
   2c400cb65dc4 xen-swiotlb: use actually allocated size on check physical continuous
   884f8f6e1b41 ARM: dts: exynos: Mark 1 GHz CPU OPP as suspend OPP on Exynos5250
   feb08c3f3916 ARM: dts: exynos: Convert exynos5250.dtsi to opp-v2 bindings
   4d5dd7609a88 arm: dts: exynos: Add missing cooling device properties for CPUs
   e552bb9a21fd OPP: Free OPP table properly on performance state irregularities
   d07c6c437300 f2fs: fix to account IO correctly
   16eb8add5ee9 f2fs: fix to recover cold bit of inode block during POR
   e8683288c629 Revert "f2fs: fix to clear PG_checked flag in set_page_dirty()"
   e602d368b007 cpupower: Fix AMD Family 0x17 msr_pstate size
   1511aba32429 ALSA: hda: Check the non-cached stream buffers more explicitly
   050d782641c2 IB/rxe: fix for duplicate request processing and ack psns
   8efbd111471e dmaengine: dma-jz4780: Return error if not probed from DT
   faef9773f48a mfd: menelaus: Fix possible race condition and leak
   2dc063e47362 signal: Always deliver the kernel's SIGKILL and SIGSTOP to a pid namespace init
   6d5b9f9d3ec3 f2fs: report error if quota off error during umount
   b41c30c5acc9 f2fs: avoid sleeping under spin_lock
   ec8eb8b57057 scsi: lpfc: Correct race with abort on completion path
   051b5fa2890b scsi: lpfc: Correct soft lockup when running mds diagnostics
   e30cf6a23808 uio: ensure class is registered before devices
   6a5975e8383c IB/mlx5: Allow transition of DCI QP to reset
   12142fb13d30 firmware: coreboot: Unmap ioregion after device population
   0470ae4236d0 driver/dma/ioat: Call del_timer_sync() without holding prep_lock
   fbb33dd581b3 Smack: ptrace capability use fixes
   6ae6cf2975fe usb: chipidea: Prevent unbalanced IRQ disable
   c4b86b1461f0 crypto: caam - fix implicit casts in endianness helpers
   d7f59eb8ae0d PCI: dwc: pci-dra7xx: Enable errata i870 for both EP and RC mode
   0cf50920c081 coresight: etb10: Fix handling of perf mode
   c259506c8a79 PCI/MSI: Warn and return error if driver enables MSI/MSI-X twice
   14bbbe74bc3e f2fs: fix to recover inode's i_flags during POR
   9e40e1123323 f2fs: fix to recover inode's crtime during POR
   60e562bb965a xhci: Avoid USB autosuspend when resuming USB2 ports.
   2c5e9a93e478 nvmem: check the return value of nvmem_add_cells()
   40cdac6bfb73 MD: fix invalid stored role for a disk
   175d020db6cf ext4: fix argument checking in EXT4_IOC_MOVE_EXT
   f41d070e9fcb usb: gadget: udc: atmel: handle at91sam9rl PMC
   3162e793c743 usb: dwc2: fix a race with external vbus supply
   bcb003c30ac3 irqchip/pdc: Setup all edge interrupts as rising edge at GIC
   10be774a8d44 xprtrdma: Reset credit grant properly after a disconnect
   5f8ffba0789c PCI / ACPI: Enable wake automatically for power managed bridges
   eedd2de8dc72 VMCI: Resource wildcard match fixed
   fe0f3e9e6830 Drivers: hv: vmbus: Use cpumask_var_t for on-stack cpu mask
   0e264876d8a6 f2fs: clear PageError on the read path
   fbc88d502e81 tpm: suppress transmit cmd error logs when TPM 1.2 is disabled/deactivated
   47b1c864123a usb: typec: tcpm: Report back negotiated PPS voltage and current
   b88a5dd150a5 PCI: cadence: Use AXI region 0 to signal interrupts from EP
   979fbe4045c8 PCI: mediatek: Fix mtk_pcie_find_port() endpoint/port matching logic
   f91a686192f6 usb: host: ohci-at91: fix request of irq for optional gpio
   fd4049585f15 RDMA/bnxt_re: Fix recursive lock warning in debug kernel
   12100249f2be RDMA/bnxt_re: Avoid accessing nq->bar_reg_iomem in failure case
   255cecf2a5eb IB/ipoib: Clear IPCB before icmp_send
   086b1e14c525 RDMA/core: Do not expose unsupported counters
   9b7b9aead186 scsi: megaraid_sas: fix a missing-check bug
   4b4ae263d7d5 KVM: nVMX: Clear reserved bits of #DB exit qualification
   58d06d2dbea7 UAPI: ndctl: Fix g++-unsupported initialisation in headers
   97f21a6b942c scsi: ufs: Schedule clk gating work on correct queue
   34fb187df0d0 scsi: esp_scsi: Track residual for PIO transfers
   9b9dd8af6dd5 md: fix memleak for mempool
   99c08e1dd146 MD: Memory leak when flush bio size is zero
   e2065558bfab f2fs: fix to account IO correctly for cgroup writeback
   8eadae7951d5 net: stmmac: dwmac-sun8i: fix OF child-node lookup
   35df1a8080ab cgroup, netclassid: add a preemption point to write_classid
   477fa78844c3 thermal: da9062/61: Prevent hardware access during system suspend
   2ba7c7660bed thermal: rcar_thermal: Prevent doing work after unbind
   363e948fcc3a libata: Apply NOLPM quirk for SAMSUNG MZ7TD256HAFV-000L9
   043b60105fc2 ath10k: schedule hardware restart if WMI command times out
   c0368ed155a2 ixgbevf: VF2VF TCP RSS
   0cfe42772c1d ixgbe: disallow IPsec Tx offload when in SR-IOV mode
   253b526d998b gpio: brcmstb: allow 0 width GPIO banks
   ab9a0e99bf29 iwlwifi: mvm: fix BAR seq ctrl reporting
   dec405826694 rsi: fix memory alignment issue in ARM32 platforms
   d8b03c1e7663 net: dsa: mv88e6xxx: Fix writing to a PHY page.
   ba0885680af7 net: hns3: Fix for vf vlan delete failed problem
   ff80ed73b6cf net: hns3: Fix ping exited problem when doing lp selftest
   65187c05f489 net: hns3: Preserve vlan 0 in hardware table
   23c98b4d9fbd pinctrl: ssbi-gpio: Fix pm8xxx_pin_config_get() to be compliant
   f5ba8363907c pinctrl: spmi-mpp: Fix pmic_mpp_config_get() to be compliant
   f0ff16f0402a perf tests: Fix record+probe_libc_inet_pton.sh without ping's debuginfo
   baef398e5dea failover: Add missing check to validate 'slave_dev' in net_failover_slave_unregister
   f47ceb5f3a08 bpf/verifier: fix verifier instability
   c0222ea97aa1 pinctrl: qcom: spmi-mpp: Fix drive strength setting
   64b74ae515f7 ACPI / LPSS: Add alternative ACPI HIDs for Cherry Trail DMA controllers
   d70f08ad0162 spi: gpio: No MISO does not imply no RX
   e67ec9ef7925 kprobes: Return error if we fail to reuse kprobe instead of BUG_ON()
   7a035a98f1b3 arm64: entry: Allow handling of undefined instructions from EL1
   ae9fc312a6d8 block, bfq: correctly charge and reset entity service in all cases
   3f353034eaf7 net: phy: phylink: ensure the carrier is off when starting phylink
   4ac72411c7b4 net: hns3: Set STATE_DOWN bit of hdev state when stopping net
   110bdc652904 net: hns3: Check hdev state when getting link status
   a0f6b282ca78 brcmfmac: fix for proper support of 160MHz bandwidth
   2cd3b487ff72 pinctrl: qcom: spmi-mpp: Fix err handling of pmic_mpp_set_mux
   fae41efdcdb6 pinctrl: sunxi: fix 'pctrl->functions' allocation in sunxi_pinctrl_build_state
   7458126fbbf3 net: hns3: Fix ets validate issue
   e0d9799dffb1 net: hns3: Add nic state check before calling netif_tx_wake_queue
   9fae4092be8b x86: boot: Fix EFI stub alignment
   249af5d52486 Bluetooth: btbcm: Add entry for BCM4335C0 UART bluetooth
   f8ec431379a5 net: hns3: Fix for packet buffer setting bug
   9ffa5136a36b ice: update fw version check logic
   345e47a7dfc2 ice: fix changing of ring descriptor size (ethtool -G)
   e7a23fd7c189 signal: Introduce COMPAT_SIGMINSTKSZ for use in compat_sys_sigaltstack
   0f1f59872204 mtd: rawnand: atmel: Fix potential NULL pointer dereference
   e8c9540b02ce x86/intel_rdt: Show missing resctrl mount options
   0efa31256ace cpufreq: dt: Try freeing static OPPs only if we have added them
   17b8bb13ac9d ACPI / processor: Fix the return value of acpi_processor_ids_walk()
   dcb2a7c21469 ACPI / PM: LPIT: Register sysfs attributes based on FADT
   9c7247b6f6a9 ACPI/PPTT: Handle architecturally unknown cache types
   ef9c7ed4de60 x86/olpc: Indicate that legacy PC XO-1 platform should not register RTC
   f7121de89b55 iwlwifi: mvm: check for n_profiles validity in EWRD ACPI
   af0d1438f4e2 iwlwifi: mvm: clear HW_RESTART_REQUESTED when stopping the interface
   e364a986fe41 iwlwifi: pcie: avoid empty free RB queue
   ba4a1b62a2d7 mtd: rawnand: denali: set SPARE_AREA_SKIP_BYTES register to 8 if unset
   8c9e66266a16 sdhci: acpi: add free_slot callback
   8be558fb46df mmc: sdhci-pci-o2micro: Add quirk for O2 Micro dev 0x8620 rev 0x01
   f9fa6d72d149 bcache: Populate writeback_rate_minimum attribute
   46b8a8d2f33a cpupower: Fix coredump on VMWare
   3d8b0617b2a5 perf strbuf: Match va_{add,copy} with va_end
   74a5a6e86f82 perf tools: Cleanup trace-event-info 'tdata' leak
   6b6ed6f4c33b perf tools: Free temporary 'sys' string in read_event_files()
   91747a58abc5 spi: spi-ep93xx: Use dma_data_direction for ep93xx_spi_dma_{finish,prepare}
   feea46d8f5b0 lightnvm: pblk: fix race condition on metadata I/O
   afa8688bd3bf lightnvm: pblk: fix two sleep-in-atomic-context bugs
   beaff0a07547 lightnvm: pblk: fix race on sysfs line state
   fd524f47ecc5 hwmon: (pwm-fan) Set fan speed to 0 on suspend
   340029579377 s390/sthyi: Fix machine name validity indication
   034d29a7ef6a tun: Consistently configure generic netdev params via rtnetlink
   dcaa9d656d10 nfp: devlink port split support for 1x100G CXP NIC
   4db6211a5bda arm64: cpufeature: ctr: Fix cpu capability check for late CPUs
   ddb265c32880 swim: fix cleanup on setup error
   140a8e218463 ataflop: fix error handling during setup
   3967f93cb91b netfilter: xt_nat: fix DNAT target for shifted portmap ranges
   0713bef08f09 locking/lockdep: Fix debug_locks off performance problem
   92cc2f9792aa net: socionext: Reset tx queue in ndo_stop
   9da20df2fbf6 i2c: rcar: cleanup DMA for all kinds of failure
   4f7381656228 selftests: ftrace: Add synthetic event syntax testcase
   89c678ab4908 drm: Get ref on CRTC commit object when waiting for flip_done
   9fdd80c2ef12 r8169: re-enable MSI-X on RTL8168g
   6b78ea67151b net: qla3xxx: Remove overflowing shift statement
   8a5805bcc603 x86/fpu: Remove second definition of fpu in __fpu__restore_sig()
   027622eacae7 perf report: Don't crash on invalid inline debug information
   a34b5a9d90b1 perf cpu_map: Align cpu map synthesized events properly.
   632f9277621b perf tools: Fix use of alternatives to find JDIR
   71797bf860be perf evsel: Store ids for events with their own cpus perf_event__synthesize_event_update_cpus
   f8148d7cea1f sched/fair: Fix the min_vruntime update logic in dequeue_entity()
   e0d017fe2a43 nfp: flower: use offsets provided by pedit instead of index for ipv6
   d8e7c3329332 nfp: flower: fix pedit set actions for multiple partial masks
   23ef37c73bd7 r8169: Enable MSI-X on RTL8106e
   1810feb860b1 perf vendor events intel: Fix wrong filter_band* values for uncore events
   4e670a32d242 xfrm: policy: use hlist rcu variants on insert
   2b0cdfb29439 xsk: do not call synchronize_net() under RCU read lock
   d1d394e201f0 selftests: usbip: add wait after attach and before checking port status
   c714f12f60ba Revert "perf tools: Fix PMU term format max value calculation"
   7ceb3d05aff5 nvme: remove ns sibling before clearing path
   c5849e9bf203 bpf: do not blindly change rlimit in reuseport net selftest
   6dd0eaf03c0a drm: fix use of freed memory in drm_mode_setcrtc
   c9493729df39 ARM: dts: exynos: Disable pull control for MAX8997 interrupts on Origen
   db611db0ee15 x86/speculation: Support Enhanced IBRS on future CPUs
   178ecd621450 x86/mm/pat: Disable preemption around __flush_tlb_all()
   d601f8c2e0b0 x86/corruption-check: Fix panic in memory_corruption_check() when boot option without value is provided
   1a359f8f8ec8 x86/xen: Fix boot loader version reported for PVH guests
   02fb68711ba6 x86/speculation: Enable cross-hyperthread spectre v2 STIBP mitigation
   e5e99bd18db3 ALSA: ca0106: Disable IZD on SB0570 DAC to fix audio pops
   9c30febb7383 ALSA: hda: Add 2 more models to the power_save blacklist
   0cfca999ee94 ALSA: hda - Add mic quirk for the Lenovo G50-30 (17aa:3905)
   43a57738232c ALSA: hda/realtek - Fix the problem of the front MIC on the Lenovo M715
   9580bd128c3b ALSA: hda - Fix headphone pin config for ASUS G751
   618ad7fe0e41 ALSA: hda - Add quirk for ASUS G751 laptop
   1396c159647a parisc: Fix exported address of os_hpmc handler
   5e3efb6ff698 parisc: Fix map_pages() to not overwrite existing pte entries
   d9ad0ecfd503 parisc: Fix address in HPMC IVA
   acf2f1783055 acpi, nfit: Fix Address Range Scrub completion tracking
   cf7d33fa2dd3 mailbox: PCC: handle parse error
   f703cf73a0cd ipmi: Fix timer race with module unload
   13b8c2e55d7b kprobes/x86: Use preempt_enable() in optimized_callback()
   5ef3e6e8d3e6 ACPICA: AML Parser: fix parse loop to correctly skip erroneous extended opcodes
   7876d54ad642 ACPICA: AML interpreter: add region addresses in global list during initialization
   165ec328038d ACPI / OSL: Use 'jiffies' as the time bassis for acpi_os_get_timer()
   9c869687da7c pcmcia: Implement CLKRUN protocol disabling for Ricoh bridges
   6457bbfb62d8 dma-mapping: fix panic caused by passing empty cma command line argument
   6995a939af68 cpufreq: conservative: Take limits changes into account properly
   f793bede6a92 block: make sure writesame bio is aligned with logical block size
   1e660a354aaa block: make sure discard bio is aligned with logical block size
   5d7cc07a4a09 block: don't deal with discard limit in blkdev_issue_discard()
   9acb7e6aa615 block: setup bounce bio_sets properly
   22315bd1693b jffs2: free jffs2_sb_info through jffs2_kill_sb()
   4e0b30d87323 hwmon: (pmbus) Fix page count auto-detection.
   79e8dc743d12 bcache: fix miss key refill->end in writeback
   c483d0e293af bcache: correct dirty data statistics
   0d0bac807a44 bcache: trace missed reading by cache_missed
   4588df8e529c spi: bcm-qspi: fix calculation of address length
   af70ba70b95e spi: bcm-qspi: switch back to reading flash using smaller chunks
   9b86e6f06127 spi: spi-mem: Adjust op len based on message/transfer size limitations
   056a4dd50034 mtd: spi-nor: fsl-quadspi: Don't let -EINVAL on the bus
   0368e0a3ab70 mtd: spi-nor: intel-spi: Add support for Intel Ice Lake SPI serial flash
   82a401cad1be mtd: spi-nor: fsl-quadspi: fix read error for flash size larger than 16MB
   57459faa2fbe mtd: rawnand: marvell: fix the IRQ handler complete() condition
   99661278215d Linux 4.18.18
   afc1e5e54138 x86/fpu: Fix i486 + no387 boot crash by only saving FPU registers on context switch if there is an FPU
   5581e4eed999 x86/swiotlb: Enable swiotlb for > 4GiG RAM on 32-bit kernels
   022601efef9e x86/time: Correct the attribute on jiffies' definition
   5d59cf0b1833 x86/percpu: Fix this_cpu_read()
   d1c0e525c430 x86, hibernate: Fix nosave_regions setup for hibernation
   227db93beac0 x86/tsc: Force inlining of cyc2ns bits
   dfc1a81b0143 sched/fair: Fix throttle_list starvation with low CFS quota
   962bc4202bf0 drm/sun4i: Fix an ulong overflow in the dotclock driver
   05d586677df0 Input: elan_i2c - add ACPI ID for Lenovo IdeaPad 330-15IGM
   ea6b10f79dd3 tracing: Fix synthetic event to allow semicolon at end
   762472aec1f9 tracing: Fix synthetic event to accept unsigned modifier
   e6b8e426bf8f USB: fix the usbfs flag sanitization for control transfers
   a790c9e4d51f usb: xhci: pci: Enable Intel USB role mux on Apollo Lake platforms
   06a70c3f60b6 usb: roles: intel_xhci: Fix Unbalanced pm_runtime_enable
   ebe34fdc10ad usb: gadget: storage: Fix Spectre v1 vulnerability
   8ae5849083f4 usb: usbip: Fix BUG: KASAN: slab-out-of-bounds in vhci_hub_control()
   b69c7f45b2d3 cdc-acm: fix race between reset and control messaging
   ffc3136034c3 cdc-acm: correct counting of UART states in serial state notification
   e4e6a27f3786 cdc-acm: do not reset notification buffer index upon urb unlinking
   1d375e3b4663 IB/ucm: Fix Spectre v1 vulnerability
   7f99af5c5510 RDMA/ucma: Fix Spectre v1 vulnerability
   a69c03dca8c1 drm: fb-helper: Reject all pixel format changing requests
   c6dd29d7a92d drm/edid: VSDB yCBCr420 Deep Color mode bit definitions
   1ef7c81f8d5f drm/edid: Add 6 bpc quirk for BOE panel in HP Pavilion 15-n233sl
   32c95444f91b ptp: fix Spectre v1 vulnerability
   fc7f79df0f2a fscache: Fix out of bound read in long cookie keys
   4bdc50b060ca cachefiles: fix the race between cachefiles_bury_object() and rmdir(2)
   9ccc817d3fb0 fscache: Fix incomplete initialisation of inline key space
   e65c5ffc44ad clk: sunxi-ng: sun4i: Set VCO and PLL bias current to lowest setting
   cfb0622c2d95 gpio: mxs: Get rid of external API call
   c6259258b48b bpf: fix partial copy of map_ptr when dst is scalar
   1d15a9f08704 vfs: swap names of {do,vfs}_clone_file_range()
   de1341b7a671 eeprom: at24: Add support for address-width property

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 20 ++++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index 66da7e9e08de..5d33040cffb8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "420a1d5ae972845413713ce882570f772423049f"
-SRCREV_meta ?= "5a99020e693eebe662ae0c4c08b65afedbd5cde3"
+SRCREV_machine ?= "96664e80434995740b129f9dc5643e23b440db82"
+SRCREV_meta ?= "85fa5f0caa839c7a4cafc0e0a9118a67897ad684"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.18.17"
+LINUX_VERSION ?= "4.18.20"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index 2f1e935110d9..a4dfa4ec5668 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.18.17"
+LINUX_VERSION ?= "4.18.20"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "26f444925aa62171e79a155bec72f055502cbce2"
-SRCREV_machine ?= "e78a46f375febc5f9305b6f94ae12fbf00b46330"
-SRCREV_meta ?= "5a99020e693eebe662ae0c4c08b65afedbd5cde3"
+SRCREV_machine_qemuarm ?= "aee695377bdc1f8779a2c68383c069a664cbdf85"
+SRCREV_machine ?= "3ec998a9e3e48f7f01c698c3932333be1c1f13df"
+SRCREV_meta ?= "85fa5f0caa839c7a4cafc0e0a9118a67897ad684"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index d01bbfd70382..d563f74671c8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -11,21 +11,21 @@ KBRANCH_qemux86  ?= "v4.18/standard/base"
 KBRANCH_qemux86-64 ?= "v4.18/standard/base"
 KBRANCH_qemumips64 ?= "v4.18/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "fc10a65e12d9c6d1e0c63e19688727bc72922cdd"
-SRCREV_machine_qemuarm64 ?= "e78a46f375febc5f9305b6f94ae12fbf00b46330"
-SRCREV_machine_qemumips ?= "d3ecc257838be6d1a15e1eb114ee960283bacf33"
-SRCREV_machine_qemuppc ?= "e78a46f375febc5f9305b6f94ae12fbf00b46330"
-SRCREV_machine_qemux86 ?= "e78a46f375febc5f9305b6f94ae12fbf00b46330"
-SRCREV_machine_qemux86-64 ?= "e78a46f375febc5f9305b6f94ae12fbf00b46330"
-SRCREV_machine_qemumips64 ?= "48c3bf17f2c4699c9ee442c62ecdaad85fdb4232"
-SRCREV_machine ?= "e78a46f375febc5f9305b6f94ae12fbf00b46330"
-SRCREV_meta ?= "5a99020e693eebe662ae0c4c08b65afedbd5cde3"
+SRCREV_machine_qemuarm ?= "0ccc3a1c4ac6ad712be41e83a08a01de7ea8f3f8"
+SRCREV_machine_qemuarm64 ?= "3ec998a9e3e48f7f01c698c3932333be1c1f13df"
+SRCREV_machine_qemumips ?= "e5c2b57fb8dfaae90014f4ec07689c97f634cbcf"
+SRCREV_machine_qemuppc ?= "3ec998a9e3e48f7f01c698c3932333be1c1f13df"
+SRCREV_machine_qemux86 ?= "3ec998a9e3e48f7f01c698c3932333be1c1f13df"
+SRCREV_machine_qemux86-64 ?= "3ec998a9e3e48f7f01c698c3932333be1c1f13df"
+SRCREV_machine_qemumips64 ?= "b60ebfc39bee8da6acff4e8add4af6045d1843f2"
+SRCREV_machine ?= "3ec998a9e3e48f7f01c698c3932333be1c1f13df"
+SRCREV_meta ?= "85fa5f0caa839c7a4cafc0e0a9118a67897ad684"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.18.17"
+LINUX_VERSION ?= "4.18.20"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.5.0


