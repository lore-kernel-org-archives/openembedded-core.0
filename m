Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4AE3574DBB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 15:06:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4IF6GP8015093
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 May 2018 08:06:17 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 18 May 2018 08:06:16 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 18 May 2018 11:05:49 -0400
Message-ID: <c917d167bfd382714d0045a5dfb5a1f067f08d97.1526655802.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1526655802.git.bruce.ashfield@windriver.com>
References: <cover.1526655802.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] linux-yocto/4.12: update to v4.12.23
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
X-List-Received-Date: Fri, 18 May 2018 15:06:17 -0000
Content-Type: text/plain

Integrating the -stable updates from Paul Gortmake that comprise the following
commits:

   6e83f40c507e Linux 4.12.23
   55e376304f1b e1000e: fix buffer overrun while the I219 is processing DMA transactions
   3882bb678dd8 e1000e: Fix return value test
   167170375055 e1000e: Fix error path in link detection
   47722947f954 ARM64: dts: meson-gxl: Add alternate ARM Trusted Firmware reserved memory zone
   1dbaaa42b464 media: v4l2-ctrl: Fix flags field on Control events
   c7c9d8c465d7 [media] cx231xx-cards: fix NULL-deref on missing association descriptor
   6ee1ead888a3 media: rc: check for integer overflow
   6f70063599b3 media: Don't do DMA on stack for firmware upload in the AS102 driver
   ef4c54828c1d powerpc/64s/hash: Allow MAP_FIXED allocations to cross 128TB boundary
   d308f45eb9e7 powerpc/64s/hash: Fix fork() with 512TB process address space
   61c9dab21d03 powerpc/64s/hash: Fix 128TB-512TB virtual address boundary case allocation
   40744bdf965e powerpc/64s/hash: Fix 512T hint detection to use >= 128T
   c5866bd94f03 powerpc/64s/radix: Fix 128TB-512TB virtual address boundary case allocation
   49e9f537eb43 powerpc/signal: Properly handle return value from uprobe_deny_signal()
   fb991189ca1f parisc: Fix validity check of pointer size argument in new CAS implementation
   ae519d5e90b9 ixgbe: Fix skb list corruption on Power systems
   2a827971bc99 fm10k: Use smp_rmb rather than read_barrier_depends
   b1222f423f70 i40evf: Use smp_rmb rather than read_barrier_depends
   61d3820d1146 ixgbevf: Use smp_rmb rather than read_barrier_depends
   8c40cc266d42 igbvf: Use smp_rmb rather than read_barrier_depends
   d05a14e4483e igb: Use smp_rmb rather than read_barrier_depends
   9062b3d8fadd i40e: Use smp_rmb rather than read_barrier_depends
   bb0ddf274e82 spi-nor: intel-spi: Fix broken software sequencing codes
   11604df811a9 IB/srp: Avoid that a cable pull can trigger a kernel crash
   7a2f561b9470 IB/hfi1: Fix incorrect available receive user context count
   305382ae2297 IB/cm: Fix memory corruption in handling CM request
   9792edc692f1 IB/CM: Create appropriate path records when handling CM request
   0624d71dcd6f IB/srpt: Do not accept invalid initiator port names
   ff4035fcfb4d svcrdma: Preserve CB send buffer across retransmits
   f18fd397f0c1 libnvdimm, namespace: make 'resource' attribute only readable by root
   91d9aa084602 libnvdimm, region : make 'resource' attribute only readable by root
   ea9427658840 libnvdimm, namespace: fix label initialization to use valid seq numbers
   c0bcae085da8 libnvdimm, pfn: make 'resource' attribute only readable by root
   aa91e16e2756 libnvdimm, dimm: clear 'locked' status on successful DIMM enable
   eca24c2a944d clk: ti: dra7-atl-clock: fix child-node lookups
   104ab8491706 SUNRPC: Fix tracepoint storage issues with svc_recv and svc_rqst_status
   a6579fafe2b9 dax: fix general protection fault in dax_alloc_inode
   b4f77dd3db27 dax: fix PMD faults on zero-length files
   12b2a43aa1b0 lockd: double unregister of inetaddr notifiers
   f2fa2903113c irqchip/gic-v3: Fix ppi-partitions lookup
   c08ddb437ddb genirq: Track whether the trigger type has been set
   fc12863e2ba3 raid1: prevent freeze_array/wait_all_barriers deadlock
   3c56a460c8bf block: Fix a race between blk_cleanup_queue() and timeout handling
   1e28e345115e p54: don't unregister leds when they are not initialized
   937209dd49f8 mailbox: bcm-flexrm-mailbox: Fix FlexRM ring flush sequence
   73d36ccc25ad mtd: nand: mtk: fix infinite ECC decode IRQ issue
   886c51dad821 mtd: nand: Fix writing mtdoops to nand flash.
   684797376fd0 mtd: nand: omap2: Fix subpage write
   b58d7cba2730 target: Avoid early CMD_T_PRE_EXECUTE failures during ABORT_TASK
   8412e7db941c target: Fix quiese during transport_write_pending_qf endless loop
   7c302f595f4b target: Fix caw_sem leak in transport_generic_request_failure
   cc36f84ff1f0 target: Fix QUEUE_FULL + SCSI task attribute handling
   41411af9e8ad target: fix null pointer regression in core_tmr_drain_tmr_list
   8734ebeb8106 iscsi-target: Fix non-immediate TMR reference leak
   2e2bc1186a08 iscsi-target: Make TASK_REASSIGN use proper se_cmd->cmd_kref
   6de2abbd4c31 scsi: lpfc: Fix oops if nvmet_fc_register_targetport fails
   2000b870234f scsi: lpfc: Fix FCP hba_wqidx assignment
   01f0e334995a scsi: lpfc: Fix crash receiving ELS while detaching driver
   020ccb98ef75 scsi: lpfc: fix pci hot plug crash in list_add call
   9b58a782f5a4 scsi: lpfc: fix pci hot plug crash in timer management routines
   e316d92e10ac scsi: sd_zbc: Fix sd_zbc_read_zoned_characteristics()
   f98e27e575f1 net/9p: Switch to wait_event_killable()
   8be417a79efc fs/9p: Compare qid.path in v9fs_test_inode
   2e349fe9c2bb fix a page leak in vhost_scsi_iov_to_sgl() error recovery
   c0697b079ae5 mfd: lpc_ich: Avoton/Rangeley uses SPI_BYT method
   2ace5971b1c1 ASoC: sun8i-codec: Set the BCLK divider
   c7316d6679de ASoC: sun8i-codec: Fix left and right channels inversion
   2eb91e439cdf ASoC: sun8i-codec: Invert Master / Slave condition
   0a116d482fa8 ALSA: hda/realtek - Fix ALC700 family no sound issue
   1505048e3ff8 ALSA: hda: Fix too short HDMI/DP chmap reporting
   1a1f798bfb30 ALSA: timer: Remove kernel warning at compat ioctl error paths
   1051d7755bda ALSA: usb-audio: Add sanity checks in v2 clock parsers
   199cd7823763 ALSA: usb-audio: Fix potential out-of-bound access at parsing SU
   cf7d9d2b53dc ALSA: usb-audio: Add sanity checks to FE parser
   aba17bf44d13 ALSA: pcm: update tstamp only if audio_tstamp changed
   29259072ec04 ext4: prevent data corruption with journaling + DAX
   97da4f9039cb ext4: prevent data corruption with inline data + DAX
   5ddf166442c3 ext4: fix interaction between i_size, fallocate, and delalloc after a crash
   9ed0b612fb77 ata: fixes kernel crash while tracing ata_eh_link_autopsy event
   9d238de93426 fsnotify: fix pinning group in fsnotify_prepare_user_wait()
   5b981d854914 fsnotify: pin both inode and vfsmount mark
   91b0d40827a2 fsnotify: clean up fsnotify_prepare/finish_user_wait()
   99a127e4a587 md/bitmap: revert a patch
   b11cb870192e Bluetooth: btqcomsmd: Add support for BD address setup
   cd4c4ed7d2a0 md: don't check MD_SB_CHANGE_CLEAN in md_allow_write
   96e829f152c7 rtlwifi: fix uninitialized rtlhal->last_suspend_sec time
   7d43a23c6689 rtlwifi: rtl8192ee: Fix memory leak when loading firmware
   ef7cb0278073 nfsd: deal with revoked delegations appropriately
   b6996af90c58 NFS: revalidate "." etc correctly on "open".
   76d4c8adb264 NFS: Avoid RCU usage in tracepoints
   78e607a16574 nfs: Fix ugly referral attributes
   43f950f570f7 NFS: Revert "NFS: Move the flock open mode check into nfs_flock()"
   52e54c5dc1d3 NFS: Fix typo in nomigration mount option
   930ac0de39d5 isofs: fix timestamps beyond 2027
   70fb63a15260 fanotify: fix fsnotify_prepare_user_wait() failure
   568131ebc640 bcache: check ca->alloc_thread initialized before wake up it
   4739cc25fe6a libceph: don't WARN() if user tries to add invalid key
   f5e35be74237 eCryptfs: use after free in ecryptfs_release_messaging()
   8fa715eede18 fscrypt: lock mutex before checking for bounce page pool
   e880aa103552 nilfs2: fix race condition that causes file system corruption
   0eb9f2d0c80d autofs: fix careless error in recent commit
   7724ca25f299 autofs: don't fail mount for transient error
   020cd1b07344 rt2x00usb: mark device removed when get ENOENT usb error
   728ec449a62c MIPS: math-emu: Fix final emulation phase for certain instructions
   e67e9e160afb MIPS: BCM47XX: Fix LED inversion for WRT54GSv1
   b7fc80471672 MIPS: Fix an n32 core file generation regset support regression
   695a30121f31 MIPS: dts: remove bogus bcm96358nb4ser.dtb from dtb-y entry
   649b942f5f21 dm: discard support requires all targets in a table support discards
   9a77250fe32f dm: fix race between dm_get_from_kobject() and __dm_destroy()
   0f222c2c6239 MIPS: pci: Remove KERN_WARN instance inside the mt7620 driver
   badd13d39a0d dm: allocate struct mapped_device with kvzalloc
   1ea71c17d132 ovl: Put upperdentry if ovl_check_origin() fails
   20f908eac772 dm bufio: fix integer overflow when limiting maximum cache size
   21e0f5780760 dm mpath: remove annoying message of 'blk_get_request() returned -11'
   84370754991c dm crypt: allow unaligned bv_offset
   c27aa7e405c2 dm cache: fix race condition in the writeback mode overwrite_bio optimisation
   463a9e155dab dm integrity: allow unaligned bv_offset
   fa7ebbb65fac ALSA: hda: Add Raven PCI ID
   571d0222e808 PCI: Apply Cavium ThunderX ACS quirk to more Root Ports
   86602f1c5aac PCI: Set Cavium ACS capability quirk flags to assert RR/CR/SV/UF
   fc037283c8a7 PCI/ASPM: Use correct capability pointer to program LTR_L1.2_THRESHOLD
   f56bf6a0bd36 PCI/ASPM: Account for downstream device's Port Common_Mode_Restore_Time
   03a249b08df1 PM / OPP: Add missing of_node_put(np)
   2c1211c2edc9 nbd: don't start req until after the dead connection logic
   01d54a192605 nbd: wait uninterruptible for the dead timeout
   7bc2c995f8db net: mvneta: fix handling of the Tx descriptor counter
   504d2a22b3af MIPS: ralink: Fix typo in mt7628 pinmux function
   2f51d995b2b7 MIPS: ralink: Fix MT7628 pinmux
   55cc724a945f ARM: 8721/1: mm: dump: check hardware RO bit for LPAE
   884c853ff37b ARM: 8722/1: mm: make STRICT_KERNEL_RWX effective for LPAE
   c6a032594344 arm64: Implement arch-specific pte_access_permitted()
   8420a2afdea5 x86/entry/64: Fix entry_SYSCALL_64_after_hwframe() IRQ tracing
   95f53ae99256 lib/mpi: call cond_resched() from mpi_powm() loop
   a5d620687584 sched: Make resched_cpu() unconditional
   188ec06978ac serdev: fix registration of second slave
   9a6630779ac1 cpufreq: schedutil: Reset cached_raw_freq when not in sync with next_freq
   12da4fd9af22 ACPI / EC: Fix regression related to triggering source of EC event handling
   1925155cbaf8 s390/disassembler: correct disassembly lines alignment
   3bbfc892e348 s390/disassembler: increase show_code buffer size
   f2dd6d7f4453 s390/disassembler: add missing end marker for e7 table
   e4d2498802cf s390/guarded storage: fix possible memory corruption
   c1de5b04dff3 s390/runtime instrumention: fix possible memory corruption
   1156f0d1e7b9 s390/noexec: execute kexec datamover without DAT
   893ce3be12b7 s390: fix transactional execution control register handling
   e883dcdf2291 lguest: disable it vs. removing it.
   40bda3ef7bfd x86/entry/64: Don't use IST entry for #BP stack
   7414e2e34e6f kvm/x86: fix icebp instruction handling
   32ec5903cbbe perf/hwbp: Simplify the perf-hwbp code, fix documentation
   cc46dc546e06 media: usbtv: prevent double free in error case
   ffe911e1acac ALSA: seq: Make ioctls race-free

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index 8d4aaba09f56..d956e0ece2dc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9289c965739cc5f52a7d3694fcda0a02d385eac2"
-SRCREV_meta ?= "e10da92d2984c77ed67be9722e4a39af9d025e2f"
+SRCREV_machine ?= "0cfd683dd04c8744d7426e13da2d2a464519953e"
+SRCREV_meta ?= "d2a0a87040e7fef4ca1165e73483b119830732ed"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.12.22"
+LINUX_VERSION ?= "4.12.23"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 520388c98d3c..004227dc3286 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.12.22"
+LINUX_VERSION ?= "4.12.23"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1c60fc3c4910d38c781d016d2ec13c8cc2084694"
-SRCREV_meta ?= "e10da92d2984c77ed67be9722e4a39af9d025e2f"
+SRCREV_machine ?= "204694d106a8bd75d8b6333fac9443c5fe809bb5"
+SRCREV_meta ?= "d2a0a87040e7fef4ca1165e73483b119830732ed"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 57d4ddcd4d2b..b0e6a471274a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,22 +11,22 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "8c29379a4bbf1e3b16f1857129d145edd358e547"
-SRCREV_machine_qemuarm64 ?= "1c60fc3c4910d38c781d016d2ec13c8cc2084694"
-SRCREV_machine_qemumips ?= "77d7b5c30b0eb2d79d3e35550504d1ec7ffd37aa"
-SRCREV_machine_qemuppc ?= "1c60fc3c4910d38c781d016d2ec13c8cc2084694"
-SRCREV_machine_qemux86 ?= "1c60fc3c4910d38c781d016d2ec13c8cc2084694"
-SRCREV_machine_qemux86-64 ?= "1c60fc3c4910d38c781d016d2ec13c8cc2084694"
-SRCREV_machine_qemumips64 ?= "3da8c99d28ef06b0c9750d163ea67f3e5a6912d2"
-SRCREV_machine ?= "1c60fc3c4910d38c781d016d2ec13c8cc2084694"
-SRCREV_meta ?= "e10da92d2984c77ed67be9722e4a39af9d025e2f"
+SRCREV_machine_qemuarm ?= "557352e573a3e23cf643d8b8b5e59bfaf301b4e4"
+SRCREV_machine_qemuarm64 ?= "204694d106a8bd75d8b6333fac9443c5fe809bb5"
+SRCREV_machine_qemumips ?= "a262c44eef3d3f0bbab797bbb5e2717b7ccb4d2f"
+SRCREV_machine_qemuppc ?= "204694d106a8bd75d8b6333fac9443c5fe809bb5"
+SRCREV_machine_qemux86 ?= "204694d106a8bd75d8b6333fac9443c5fe809bb5"
+SRCREV_machine_qemux86-64 ?= "204694d106a8bd75d8b6333fac9443c5fe809bb5"
+SRCREV_machine_qemumips64 ?= "f1e2c54153838e94f1730beba7c8e28af739af68"
+SRCREV_machine ?= "204694d106a8bd75d8b6333fac9443c5fe809bb5"
+SRCREV_meta ?= "d2a0a87040e7fef4ca1165e73483b119830732ed"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
 DEPENDS += "openssl-native util-linux-native"
 
-LINUX_VERSION ?= "4.12.22"
+LINUX_VERSION ?= "4.12.23"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


