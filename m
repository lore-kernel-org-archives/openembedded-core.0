Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC4F7983F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 17:20:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8MHJcp2023445
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 22 Sep 2018 10:19:49 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sat, 22 Sep 2018 10:19:27 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 22 Sep 2018 13:18:49 -0400
Message-ID: <d74af61e5913509b990588c47b2fbe115df2a9ff.1537636541.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1537636541.git.bruce.ashfield@windriver.com>
References: <cover.1537636541.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] linux-yocto/4.18: update to v4.18.7
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
X-List-Received-Date: Sat, 22 Sep 2018 17:20:13 -0000
Content-Type: text/plain

Updating the 4.18 kernel with the latest -stable releases that comprise
the following commits:

   8ea7eadbef2f Linux 4.18.7
   239043b876b8 arm64: mm: always enable CONFIG_HOLES_IN_ZONE
   a70bc6c6a621 cpuidle: menu: Retain tick when shallow state is selected
   7f401f160a9c udf: Fix mounting of Win7 created UDF filesystems
   c1ef3feca667 fs/quota: Fix spectre gadget in do_quotactl
   7ab1035b3fc6 crypto: caam/qi - fix error path in xts setkey
   3290dec64398 crypto: caam/jr - fix descriptor DMA unmapping
   f39f1f81c74e crypto: caam - fix DMA mapping direction for RSA forms 2 & 3
   26b165edc3e4 crypto: arm64/sm4-ce - check for the right CPU feature bit
   dce1a2c6f339 crypto: aesni - Use unaligned loads from gcm_context_data
   61c8901dbf43 crypto: vmx - Fix sleep-in-atomic bugs
   8d02bd8d4a6c perf auxtrace: Fix queue resize
   5ad671c8520d mm, dev_pagemap: Do not clear ->mapping on final put
   ff1663fc9483 cap_inode_getsecurity: use d_find_any_alias() instead of d_find_alias()
   476738bbc962 kconfig: fix "Can't open ..." in parallel build
   a0725910f3e2 bcache: release dc->writeback_lock properly in bch_writeback_thread()
   437d23a6792a libnvdimm: fix ars_status output length calculation
   54ce46aa9870 libnvdimm: Use max contiguous area for namespace size
   118cb27721f9 getxattr: use correct xattr length
   fd13ae7e102a udlfb: set line_length in dlfb_ops_set_par
   f551b193299b udlfb: handle allocation failure
   0b5373ea7298 udlfb: make a local copy of fb_ops
   af0890aa4565 udlfb: set optimal write delay
   76aab4b1d804 udlfb: don't switch if we are switching to the same videomode
   1a5656245bd6 udlfb: fix display corruption of the last line
   27f6b46dd248 udlfb: fix semaphore value leak
   1a9ec6296e18 fb: fix lost console when the user unplugs a USB adapter
   f72831f9cbb6 pwm: tiehrpwm: Fix disabling of output of PWMs
   e0e08ede24c9 pwm: tiehrpwm: Don't use emulation mode bits to control PWM output
   3ce08627b3e3 ubifs: Fix synced_i_size calculation for xattr inodes
   f9b28f9a2b7f ubifs: Fix directory size calculation for symlinks
   cef393ce9aea ubifs: xattr: Don't operate on deleted inodes
   ce0504b74d04 ubifs: Check data node size before truncate
   aa8298662e52 Revert "UBIFS: Fix potential integer overflow in allocation"
   3863ba26f271 ubifs: Fix memory leak in lprobs self-check
   7131c193fcc3 userns: move user access out of the mutex
   1497f1e0714a sys: don't hold uts_sem while accessing userspace memory
   11f44063756f iommu/vt-d: Fix dev iotlb pfsid use
   e7feba89574d iommu/vt-d: Add definitions for PFSID
   3245925a8e9c iommu/ipmmu-vmsa: Don't register as BUS IOMMU if machine doesn't have IPMMU-VMSA
   2d0363ffc0ab mm/tlb: Remove tlb_remove_table() non-concurrent condition
   6bdfc65b5062 pwm: omap-dmtimer: Return -EPROBE_DEFER if no dmtimer platform data
   1ba930714d12 ARM: dts: am57xx-idk: Enable dual role for USB2 port
   da43c1c103c8 ARM: tegra: Fix Tegra30 Cardhu PCA954x reset
   1750f49b26c2 NFSv4: Fix a sleep in atomic context in nfs4_callback_sequence()
   c8f825303e49 NFSv4: Fix locking in pnfs_generic_recover_commit_reqs
   b8cbfd88d132 NFSv4 client live hangs after live data migration recovery
   e16dac834b32 nfsd: fix leaked file lock with nfs exported overlayfs
   f7169718defc pnfs/blocklayout: off by one in bl_map_stripe()
   6ee996baf1ab block, bfq: return nbytes and not zero from struct cftype .write() method
   fbd0c9d27ccb xtensa: increase ranges in ___invalidate_{i,d}cache_all
   27077422f951 xtensa: limit offsets in __loop_cache_{all,page}
   3bb34bba5624 KVM: PPC: Book3S: Fix guest DMA when guest partially backed by THP pages
   f90625c7172b KVM: VMX: fixes for vmentry_l1d_flush module parameter
   09747f7004ab i2c: designware: Re-init controllers with pm_disabled set on resume
   7bb7ef09b3db ALSA: ac97: fix unbalanced pm_runtime_enable
   d7cff0016036 ALSA: ac97: fix check of pm_runtime_get_sync failure
   52977303d997 ALSA: ac97: fix device initialization in the compat layer
   cd67823c9d34 PM / sleep: wakeup: Fix build error caused by missing SRCU support
   00e4955e677b cpufreq: governor: Avoid accessing invalid governor_data
   f83952c64769 cpuidle: menu: Handle stopped tick more aggressively
   cc8ea9dd0c24 sched: idle: Avoid retaining the tick when it has been stopped
   fe759487ee98 drivers/block/zram/zram_drv.c: fix bug storing backing_dev
   1cc1c4e06562 ACPICA: Clear status of all events when entering sleep states
   ab08867f08e4 ACPICA: AML Parser: skip opcodes that open a scope upon parse failure
   0c3339c82b9e ovl: fix wrong use of impure dir cache in ovl_iterate()
   8856ca57dcb1 mfd: hi655x: Fix regmap area declared size for hi655x
   f8d649720924 uprobes: Use synchronize_rcu() not synchronize_sched()
   ee20433f60ae livepatch: Validate module/old func name length
   640d29c1236e printk/tracing: Do not trace printk_nmi_enter()
   cfe603dd4e39 tracing/blktrace: Fix to allow setting same value
   b0d32c7b0cda tracing: Do not call start/stop() functions when tracing_on does not change
   187bee9b94fb rtc: omap: fix potential crash on power off
   949d4ca049eb rtc: omap: fix resource leak in registration error path
   ad7a3f8c456f vmw_balloon: fix VMCI use when balloon built into kernel
   32b5be5b44e9 vmw_balloon: VMCI_DOORBELL_SET does not check status
   45696b968345 vmw_balloon: do not use 2MB without batching
   f288edefc2c6 vmw_balloon: fix inflation of 64-bit GFNs
   a5e6360c4322 eventpoll.h: wrap casts in () properly
   5f4a5b6fed24 extcon: Release locking when sending the notification of connector state
   cbdfa40c8187 iio: ad9523: Fix return value for ad952x_store()
   10508adb4df0 iio: ad9523: Fix displayed phase
   5ef899676e25 iio: sca3000: Fix missing return in switch
   35949ad3f2d7 Drivers: hv: vmbus: Reset the channel callback in vmbus_onoffer_rescind()
   4f8eac4396c7 Drivers: hv: vmbus: Fix the offer_in_progress in vmbus_process_offer()
   d7b108aae76c uart: fix race between uart_put_char() and uart_shutdown()
   6cdc67be3e12 dm writecache: fix a crash due to reading past end of dirty_bitmap
   d94cf7087099 dm crypt: don't decrease device limits
   25b25e552439 dm cache metadata: set dirty on all cache blocks after a crash
   7bbb3231d6f7 dm cache metadata: save in-core policy_hint_size to on-disk superblock
   f308e9fbe04f dm thin: stop no_space_timeout worker when switching to write-mode
   0da098366e8c dm integrity: change 'suspending' variable from bool to int
   6d7bd0a68a4a net/9p/trans_fd.c: fix race-condition by flushing workqueue before the kfree()
   fe7e153d9564 net/9p/client.c: version pointer uninitialized
   372ed5efc933 9p/virtio: fix off-by-one error in sg list bounds check
   ba74c64c00a5 fs/9p/xattr.c: catch the error of p9_client_clunk when setting xattr failed
   db6cb8a7c458 9p: fix multiple NULL-pointer-dereferences
   a34932007267 RDMA/rxe: Set wqe->status correctly if an unexpected response is received
   8a3f37b0da74 ib_srpt: Fix a use-after-free in __srpt_close_all_ch()
   41cc5e9aff78 ib_srpt: Fix a use-after-free in srpt_close_ch()
   2ea037fe87b1 RDMA/mlx5: Fix shift overflow in mlx5_ib_create_wq
   c34579cc3ea7 overflow.h: Add arithmetic shift helper
   74d835f7fdf7 IB/srpt: Support HCAs with more than two ports
   32a46b60c50e IB/srpt: Fix srpt_cm_req_recv() error path (2/2)
   e46df54477b4 IB/srpt: Fix srpt_cm_req_recv() error path (1/2)
   103a3a62e0fb IB/mlx5: Fix leaking stack memory to userspace
   e48fd87e93e1 IB/mlx5: Honor cnt_set_id_valid flag instead of set_id
   7ab793382972 ocxl: Fix page fault handler in case of fault on dying process
   9833940072b3 cxl: Fix wrong comparison in cxl_adapter_context_get()
   6757519a48ca powerpc/powernv/pci: Work around races in PCI bridge enabling
   96f829b77bf1 powerpc64/ftrace: Include ftrace.h needed for enable/disable calls
   d4e41dc984f2 powerpc/nohash: fix pte_access_permitted()
   bb691eafb6df powerpc/pkeys: Preallocate execute-only key
   44d146b99b08 powerpc/pkeys: Fix calculation of total pkeys.
   5e2727bf84c5 powerpc/pkeys: Save the pkey registers before fork
   0d86f5345672 powerpc/pkeys: key allocation/deallocation must not change pkey registers
   72ebe30452ef powerpc/pkeys: Deny read/write/execute by default
   8ed3d6a90178 powerpc/pkeys: Give all threads control of their key permissions
   174f12c1f3ef powerpc/pseries: Fix endianness while restoring of r3 in MCE handler.
   8bfd9029bc79 powerpc/64s: Fix page table fragment refcount race vs speculative references
   7c0850fb2b60 powerpc/fadump: handle crash memory ranges array index overflow
   ec4ad94be6ce Fix kexec forbidding kernels signed with keys in the secondary keyring to boot
   54fb49e87c23 Replace magic for trusting the secondary keyring with #define
   686baf538b8c mailbox: xgene-slimpro: Fix potential NULL pointer dereference
   71849f9c7c55 media: Revert "[media] tvp5150: fix pad format frame height"
   a0e70000075e libertas: fix suspend and resume for SDIO connected cards
   9be8dc35bceb dma-buf: Move BUG_ON from _add_shared_fence to _add_shared_inplace
   e561eea4a424 apparmor: fix bad debug check in apparmor_secid_to_secctx()
   ac89e9c33de3 block: Ensure that a request queue is dissociated from the cgroup controller
   d367a6927ffd block: Introduce blk_exit_queue()
   d9ef3176a398 blkcg: Introduce blkg_root_lookup()
   0c2e7eb1a4c3 block: really disable runtime-pm for blk-mq
   cde67159df4d block: blk_init_allocated_queue() set q->fq as NULL in the fail case
   4bc567311980 block: fix infinite loop if the device loses discard capability
   d3949a0a1341 readahead: stricter check for bdi io_pages
   3a9bc441b671 mmc: renesas_sdhi_internal_dmac: fix #define RST_RESERVED_BITS
   74b83d076cdf mmc: renesas_sdhi_internal_dmac: mask DMAC interrupts
   cf8871c4121c mmc: block: Fix unsupported parallel dispatch of requests
   e27421b3b394 spi: cadence: Change usleep_range() to udelay(), for atomic context
   db597647506d spi: spi-fsl-dspi: Fix imprecise abort on VF500 during probe
   3b45f480496c spi: pxa2xx: Add support for Intel Ice Lake
   e52c91662cef spi: davinci: fix a NULL pointer dereference
   b84ea5862258 9p/net: Fix zero-copy path in the 9p virtio transport
   8c37a4ca229d net: mac802154: tx: expand tailroom if necessary
   6ce27549cc14 net: 6lowpan: fix reserved space for single frames
   832fa8183637 rcu: Make expedited GPs handle CPU 0 being offline
   3a2c23838bc5 Linux 4.18.6
   8e6d15678656 x86/dumpstack: Don't dump kernel memory based on usermode RIP
   6575b15002bf cdrom: Fix info leak/OOB read in cdrom_ioctl_drive_status
   f90252556e1a watchdog: Mark watchdog touch functions as notrace
   0f9bf062f1f1 power: generic-adc-battery: check for duplicate properties copied from iio channels
   7ffb7b7e8348 power: generic-adc-battery: fix out-of-bounds write when copying channel properties
   86b0dd9d0ebc PM / clk: signedness bug in of_pm_clk_add_clks()
   350192f495ae clk: npcm7xx: fix memory allocation
   a8b0c3c7c494 clk: rockchip: fix clk_i2sout parent selection bits on rk3399
   f905fc199d7d mtd: rawnand: qcom: wait for desc completion in all BAM channels
   21ab6022cb67 mtd: rawnand: marvell: add suspend and resume hooks
   f05cb63dc0dc mtd: rawnand: fsmc: Stop using chip->read_buf()
   307b0cf42c9b mtd: rawnand: hynix: Use ->exec_op() in hynix_nand_reg_write_op()
   d47b35b84da5 iscsi target: fix session creation failure handling
   9558fc1bab40 scsi: core: Avoid that SCSI device removal through sysfs triggers a deadlock
   807d1d299a04 scsi: sysfs: Introduce sysfs_{un,}break_active_protection()
   373a1411a103 scsi: mpt3sas: Fix _transport_smp_handler() error path
   8039fa72ff4d scsi: mpt3sas: Fix calltrace observed while running IO & reset
   7624ac8705f5 tpm: separate cmd_ready/go_idle from runtime_pm
   b64b3b46074e tpm: Return the actual size when receiving an unsupported command
   d07d4e8b68fd MIPS: lib: Provide MIPS64r6 __multi3() for GCC < 7
   8f55e1f507d6 MIPS: Change definition of cpu_relax() for Loongson-3
   9238ea28869e MIPS: Always use -march=<arch>, not -<arch> shortcuts
   8d6a4b45018c MIPS: memset.S: Fix byte_fixup for MIPSr6
   d06e5e4a8a28 MIPS: Correct the 64-bit DSP accumulator register size
   968a9a4a8a97 kprobes: Make list and blacklist root user read only
   2f56c8af315b kprobes/arm: Fix %p uses in error messages
   10334e1ad3d0 kprobes: Replace %p with other pointer types
   b143efb4242c kprobes: Show blacklist addresses as same as kallsyms does
   d6c96d240daa s390/purgatory: Add missing FORCE to Makefile targets
   5a2e51f95908 s390/purgatory: Fix crash with expoline enabled
   87509861a989 s390/pci: fix out of bounds access during irq setup
   b51627dc7fdb s390/numa: move initial setup of node_to_cpumask_map
   d695333c5de6 s390/qdio: reset old sbal_state flags
   dacf5e594708 s390: fix br_r1_trampoline for machines without exrl
   6a32f6f857af s390/lib: use expoline for all bcr instructions
   120c776a2ab1 s390/mm: fix addressing exception after suspend/resume
   77207a7ee4b6 x86: Allow generating user-space headers without a compiler
   3fef5c2f4d9c x86/entry/64: Wipe KASAN stack shadow before rewind_stack_do_exit()
   b1491daecd6e hwmon: (nct6775) Fix potential Spectre v1
   2ff13cec042e x86/speculation/l1tf: Increase l1tf memory limit for Nehalem+
   084c0d5b4cf5 x86/spectre: Add missing family 6 check to microcode check
   c6941f12e9e4 x86/irqflags: Mark native_restore_fl extern inline
   20a103149aa5 x86/nmi: Fix NMI uaccess race against CR3 switching
   aa3ad4314551 x86/vdso: Fix lsl operand order
   306f625c2231 scsi: qla2xxx: Fix stalled relogin
   82964fac7ac2 pinctrl: freescale: off by one in imx1_pinconf_group_dbg_show()
   f8fa13e1f53a soc: qcom: rmtfs-mem: fix memleak in probe error paths
   e550a74a7d12 ASoC: wm_adsp: Correct DSP pointer for preloader control
   00bdd9bfd3eb ASoC: sirf: Fix potential NULL pointer dereference
   cde7486adce1 ASoC: zte: Fix incorrect PCM format bit usages
   aeb4906d3222 ASoC: dpcm: don't merge format from invalid codec dai
   a8d156323e5b b43/leds: Ensure NUL-termination of LED name string
   579cdda6ba4c b43legacy/leds: Ensure NUL-termination of LED name string
   dccaa28ec448 udl-kms: avoid division
   930e10ea2156 udl-kms: fix crash due to uninitialized memory
   723119f9aab5 udl-kms: handle allocation failure
   69900129d68f udl-kms: change down_interruptible to down
   684ca9975c53 lib/vsprintf: Do not handle %pO[^F] as %px
   15b584de9ab1 fuse: Add missed unlock_page() to fuse_readpages_fill()
   c00f07a1f66c fuse: Fix oops at process_init_reply()
   e4631745286f fuse: umount should wait for all requests
   19e0fafd9e68 fuse: fix unlocked access to processing queue
   bcdb9bd38da6 fuse: fix double request_end()
   6ffb58d4f74e fuse: fix initial parallel dirops
   8bebc8585fab fuse: Don't access pipe->buffers without pipe_lock()
   9b4b6acf0280 KVM: x86: SVM: Call x86_spec_ctrl_set_guest/host() with interrupts disabled
   150b420a2959 KVM: x86: ensure all MSRs can always be KVM_GET/SET_MSR'd
   1e227ae17f08 x86/process: Re-export start_thread()
   e0fb4e0e375e x86/vdso: Fix vDSO build if a retpoline is emitted
   0ea75fa0f6bd x86/speculation/l1tf: Suggest what to do on systems with too much RAM
   ed1fa683e01b x86/speculation/l1tf: Fix off-by-one error when warning that system has too much RAM
   63da8b8a387b x86/speculation/l1tf: Fix overflow in l1tf_pfn_limit() on 32bit
   e43594dabdc8 mm/tlb, x86/mm: Support invalidating TLB caches for RCU_TABLE_FREE
   575a66cbe443 mm: move tlb_table_flush to tlb_flush_mmu_free
   8c7181608026 platform/x86: ideapad-laptop: Apply no_hw_rfkill to Y20-15IKBM, too
   6ef37c5f0142 platform/x86: wmi: Do not mix pages and kmalloc
   6bdd19331fc6 x86/gpu: reserve ICL's graphics stolen memory
   4debdc1d06a7 nvme-pci: add a memory barrier to nvme_dbbuf_update_and_check_event
   7036ab018947 ext4: fix race when setting the bitmap corrupted flag
   eafb2d82ca7e ext4: reset error code in ext4_find_entry in fallback
   3f2541a7e58c ext4: sysfs: print ext4_super_block fields as little-endian
   6891c3c114fc ext4: use ext4_warning() for sb_getblk failure
   f34a0bc19575 ext4: check for NUL characters in extended attribute's name
   55472d881c48 stop_machine: Atomically queue and wake stopper threads
   3fc7316acc67 stop_machine: Reflow cpu_stop_queue_two_works()
   19a5808f8b73 perf kvm: Fix subcommands on s390
   32a52f0bded3 s390/kvm: fix deadlock when killed by oom
   1d0bd8c92361 KVM: arm/arm64: Skip updating PTE entry if no change
   c7bcb09e4e35 KVM: arm/arm64: Skip updating PMD entry if no change
   166b04aee70e KVM: arm/arm64: Fix lost IRQs from emulated physcial timer when blocked
   52df41f653bb KVM: arm/arm64: Fix potential loss of ptimer interrupts
   5c2fd3598fb8 arm64: dts: rockchip: corrected uart1 clock-names for rk3328
   88e798da7c29 arm64: mm: check for upper PAGE_SHIFT bits in pfn_valid()
   ca41d82d4e66 arm64: Handle mismatched cache type
   faed5cb96b91 arm64: Fix mismatched cache line size detection
   bc10c237ecd8 kprobes/arm64: Fix %p uses in error messages
   a4ed70a386c0 printk/nmi: Prevent deadlock when accessing the main log buffer in NMI
   50631d1b2613 printk: Create helper function to queue deferred console handling
   b0eea4d14b94 printk: Split the code for storing a message into the log buffer
   2297091c7a6c iommu/arm-smmu: Error out only if not enough context interrupts
   b5563064b99e regulator: arizona-ldo1: Use correct device to get enable GPIO
   29ac604e627b bpf, arm32: fix stack var offset in jit
   6289b80699af hwmon: (k10temp) 27C Offset needed for Threadripper2
   df5c4d19606d Btrfs: send, fix incorrect file layout after hole punching beyond eof
   23dd2c5d90a1 Btrfs: fix send failure when root has deleted files still open
   7ecc8a106c53 Btrfs: fix btrfs_write_inode vs delayed iput deadlock
   84717fb63dad Btrfs: fix mount failure after fsync due to hard link recreation
   8b08e816f47a btrfs: don't leak ret from do_chunk_alloc
   258c1eb7cde6 btrfs: use correct compare function of dirty_metadata_bytes
   fb35368feb7f smb3: fill in statfs fsid and correct namelen
   107d9ee2e080 smb3: don't request leases in symlink creation and query
   1316a0cc27d1 smb3: Do not send SMB3 SET_INFO if nothing changed
   25b981bfe192 smb3: enumerating snapshots was leaving part of the data off end
   a66f62737197 cifs: check kmalloc before use
   a1ac808c81a6 cifs: use a refcount to protect open/closing the cached file handle
   5ba293d099ce cifs: add missing debug entries for kconfig options
   52b9e2a58be2 CIFS: fix uninitialized ptr deref in smb2 signing
   a673044fbe8b cifs: add missing support for ACLs in SMB 3.11
   08aee5c2c26f mei: don't update offset in write
   6bdbaa2fdd48 xprtrdma: Fix disconnect regression
   84342771f595 scsi: libsas: dynamically allocate and free ata host
   16edb8e6d472 scripts/kernel-doc: Escape all literal braces in regexes
   10bb2648f16c PATCH scripts/kernel-doc

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index 3e0e3dc40ed1..bd435c8890c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6b38725fe97a59cefef01b5213a1d234dd38a542"
-SRCREV_meta ?= "856794172e8f046e7d6542e09d431c5a412a8a45"
+SRCREV_machine ?= "d8a8f28746fdb335c3d6cab69a8b64156340c1c7"
+SRCREV_meta ?= "a0f78294ba59f10e8859595a540b220359db5573"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.18.5"
+LINUX_VERSION ?= "4.18.7"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index 60ceef6db293..9456ec47701c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -4,7 +4,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.18.5"
+LINUX_VERSION ?= "4.18.7"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -13,8 +13,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "71799edb8a38622626cf3b5582dff152b512ccf0"
-SRCREV_meta ?= "856794172e8f046e7d6542e09d431c5a412a8a45"
+SRCREV_machine ?= "2a412d007ecc39f8d843fcb5ae2259f7f434b1ea"
+SRCREV_meta ?= "a0f78294ba59f10e8859595a540b220359db5573"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index 80c36d72e36f..e74525edc22a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -11,21 +11,21 @@ KBRANCH_qemux86  ?= "v4.18/standard/base"
 KBRANCH_qemux86-64 ?= "v4.18/standard/base"
 KBRANCH_qemumips64 ?= "v4.18/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "cae6ae8b337fbc4b73083cec8156884fcec00866"
-SRCREV_machine_qemuarm64 ?= "71799edb8a38622626cf3b5582dff152b512ccf0"
-SRCREV_machine_qemumips ?= "28fbf6d4df772beb8c13b9554933dc0751d38ad8"
-SRCREV_machine_qemuppc ?= "71799edb8a38622626cf3b5582dff152b512ccf0"
-SRCREV_machine_qemux86 ?= "71799edb8a38622626cf3b5582dff152b512ccf0"
-SRCREV_machine_qemux86-64 ?= "71799edb8a38622626cf3b5582dff152b512ccf0"
-SRCREV_machine_qemumips64 ?= "f3add308bccafeeed79fde2a3720236bf4fd6457"
-SRCREV_machine ?= "71799edb8a38622626cf3b5582dff152b512ccf0"
-SRCREV_meta ?= "856794172e8f046e7d6542e09d431c5a412a8a45"
+SRCREV_machine_qemuarm ?= "5bcc33dbcd60be73897f4983844cf0226fd54bdf"
+SRCREV_machine_qemuarm64 ?= "2a412d007ecc39f8d843fcb5ae2259f7f434b1ea"
+SRCREV_machine_qemumips ?= "0fba2828af7485ebd03e4210dbefe79c070aefc5"
+SRCREV_machine_qemuppc ?= "2a412d007ecc39f8d843fcb5ae2259f7f434b1ea"
+SRCREV_machine_qemux86 ?= "2a412d007ecc39f8d843fcb5ae2259f7f434b1ea"
+SRCREV_machine_qemux86-64 ?= "2a412d007ecc39f8d843fcb5ae2259f7f434b1ea"
+SRCREV_machine_qemumips64 ?= "1d92949184f78f9c2c71d069683d386b37cc6dca"
+SRCREV_machine ?= "2a412d007ecc39f8d843fcb5ae2259f7f434b1ea"
+SRCREV_meta ?= "a0f78294ba59f10e8859595a540b220359db5573"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.18.5"
+LINUX_VERSION ?= "4.18.7"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.5.0


