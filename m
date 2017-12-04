Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 677A9785A6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 15:39:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vB4FdTtw018290
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 4 Dec 2017 07:39:29 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 4 Dec 2017 07:39:28 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 4 Dec 2017 10:39:19 -0500
Message-ID: <261594c556dededbb9920b19e3773d44a0f34ea7.1512401707.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1512401707.git.bruce.ashfield@windriver.com>
References: <cover.1512401707.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] linux-yocto/4.9: update to v4.9.61
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
X-List-Received-Date: Mon, 04 Dec 2017 15:39:30 -0000
Content-Type: text/plain

Integrating the korg -stable updates that comprise the following commits:

   5caae9d14199 Linux 4.9.61
   be3390d86bc2 ARM: dts: mvebu: pl310-cache disable double-linefill
   26fc85a0113d staging: r8712u: Fix Sparse warning in rtl871x_xmit.c
   244cff7066f6 xen: don't print error message in case of missing Xenstore entry
   c90b65d8b8fb powerpc/64: Don't try to use radix MMU under a hypervisor
   df0c2d409e9d PCI: Avoid possible deadlock on pci_lock and p->pi_lock
   8e5ca01ac966 drm/exynos: g2d: prevent integer overflow in
   2a6576f56eab bt8xx: fix memory leak
   c31f5651aed7 s390/crypto: Extend key length check for AES-XTS in fips mode.
   aa7a7e92e08e s390/prng: Adjust generation of entropy to produce real 256 bits.
   ba56e6cd9741 s390/dasd: check for device error pointer within state change interrupts
   0b5cdee7df76 mei: return error on notification request to a disconnected client
   ad1267a0c9f7 exynos4-is: fimc-is: Unmap region obtained by of_iomap()
   bfcbe6cd1551 ASoC: Intel: boards: remove .pm_ops in all Atom/DPCM machine drivers
   2e727b8abeeb vfs: open() with O_CREAT should not create inodes with unknown ids
   7ec661f58578 brcmfmac: check brcmf_bus_get_memdump result for error
   a69bec9bd3a4 staging: lustre: lmv: Error not handled for lmv_find_target
   758d3ea8247e staging: lustre: ptlrpc: skip lock if export failed
   091f48a66440 staging: lustre: hsm: stack overrun in hai_dump_data_field
   a513df5968ad staging: lustre: llite: don't invoke direct_IO for the EOF case
   c3f0c2c14000 platform/x86: intel_mid_thermal: Fix module autoload
   db5323e5088c scsi: aacraid: Process Error for response I/O
   b469d5c393c2 xen/manage: correct return value check on xenbus_scanf()
   b1a38567a9ed gpio: mcp23s08: Select REGMAP/REGMAP_I2C to fix build error
   293c98f15d04 mtd: nand: sunxi: Fix the non-polling case in sunxi_nfc_wait_events()
   ceec8374d790 clk: sunxi-ng: Check kzalloc() for errors and cleanup error path
   d3b56161e0a3 ath10k: fix reading sram contents for QCA4019
   90400ec14408 cx231xx: Fix I2C on Internal Master 3 Bus
   64674bc8eead net: phy: dp83867: Recover from "port mirroring" N/A MODE4
   227afd93a6ad clocksource/drivers/arm_arch_timer: Add dt binding for hisilicon-161010101 erratum
   35c309e4c446 drm/fsl-dcu: check for clk_prepare_enable() error
   2b462a38bfea iwlwifi: mvm: use the PROBE_RESP_QUEUE to send deauth to unknown station
   195fe2ec8631 perf tools: Only increase index if perf_evsel__new_idx() succeeds
   24cca20a0988 drm/amdgpu: when dpm disabled, also need to stop/start vce.
   f04d92e10580 i2c: riic: correctly finish transfers
   46d515488a07 net/ena: change driver's default timeouts
   16d65c0c0181 ext4: do not use stripe_width if it is not set
   0e9deca480c3 ext4: fix stripe-unaligned allocations
   a418b2fd8e53 net: mvneta: fix build errors when linux/phy*.h is removed from net/dsa.h
   c16283db12e1 PCI/MSI: Return failure when msix_setup_entries() fails
   a624515184da staging: rtl8712u: Fix endian settings for structs describing network packets
   47d7bc22c054 bnxt_en: Added PCI IDs for BCM57452 and BCM57454 ASICs
   e6f3caf3bf81 mfd: axp20x: Fix axp288 PEK_DBR and PEK_DBF irqs being swapped
   b15965b00686 mfd: ab8500-sysctrl: Handle probe deferral
   1bd47ceafbd7 mmc: s3cmci: include linux/interrupt.h for tasklet_struct
   31a8b19dbe6a scsi: megaraid_sas: Do not set fp_possible if TM capable for non-RW syspdIO, change fp_possible to bool
   7da4cd97f58b PM / wakeirq: report a wakeup_event on dedicated wekup irq
   80eabac6c53a IB/mlx5: Assign DSCP for R-RoCE QPs Address Path
   733ab05adc1e staging: fsl-mc: Add missing header
   58b9a54ae03d crypto: ccp - Set the AES size field for all modes
   5208153038d3 cpufreq: Do not clear real_cpus mask on policy init
   f1e7f9dc1198 Fix tracing sample code warning.
   86b0853f7391 tracing/samples: Fix creation and deletion of simple_thread_fn creation
   8b2653de6f78 drm/msm: fix an integer overflow test
   06bf74cdbdbe drm/msm: Fix potential buffer overflow issue
   984dcb32ffd0 drm/i915/edp: read edp display control registers unconditionally
   f2fd2d945446 ocfs2: fstrim: Fix start offset of first cluster group during fstrim
   09907f0cbe61 drm/amdgpu: return -ENOENT from uvd 6.0 early init for harvesting
   b3937f55c725 ARM: 8715/1: add a private asm/unaligned.h
   e059fc3c36c0 arm/arm64: kvm: Disable branch profiling in HYP code
   d7d5a30e23a2 arm/arm64: KVM: set right LR register value for 32 bit guest when inject abort
   011b44af0077 arm64: ensure __dump_instr() checks addr_limit
   43f69519e9f9 ASoC: adau17x1: Workaround for noise bug in ADC
   cb14a0dd1f74 KEYS: fix out-of-bounds read during ASN.1 parsing
   0be72aebbff3 KEYS: return full count in keyring_read() if buffer is too small
   5e8b028abaf8 cifs: check MaxPathNameComponentLength != 0 before using it
   ffb76bb8aa9e ALSA: seq: Fix nested rwsem annotation for lockdep splat
   c778c8187e44 ALSA: timer: Add missing mutex lock for compat ioctls
   06b639e5a1a6 Linux 4.9.60
   4b86c486e628 ecryptfs: fix dereference of NULL user_key_payload
   bdcb6c994c16 regulator: fan53555: fix I2C device ids
   543aabb7d14b ipsec: Fix aborted xfrm policy dump crash
   bb46f793ad02 cfg80211: fix connect/disconnect edge cases
   7e31cdee8b89 can: kvaser_usb: Ignore CMD_FLUSH_QUEUE_REPLY messages
   636e798d1483 can: kvaser_usb: Correct return value in printout
   c4fe13bd538e can: sun4i: fix loopback mode
   e6b5e3b6344e drm/amd/powerplay: fix uninitialized variable
   5a0dbfeed4fc scsi: sg: Re-fix off by one in sg_fill_request_table()
   88acde81e80f scsi: zfcp: fix erp_action use-before-initialize in REC action trace
   67bcc5e530d5 assoc_array: Fix a buggy node-splitting case
   52f65e35c2b8 Input: gtco - fix potential out-of-bound access
   9460dd363334 Input: elan_i2c - add ELAN0611 to the ACPI table
   d431d9f122ab xen/gntdev: avoid out of bounds access in case of partial gntdev_mmap()
   8783885ea7fe fuse: fix READDIRPLUS skipping an entry
   d8e5f2f8d507 spi: bcm-qspi: Fix use after free in bcm_qspi_probe() in error path
   1dfea1eeac64 spi: uapi: spidev: add missing ioctl header
   474cb9e0f02f KVM: PPC: Fix oops when checking KVM_CAP_PPC_HTM
   659b04ad201b usb: xhci: Handle error condition in xhci_stop_device()
   a703da486eca ceph: unlock dangling spinlock in try_flush_caps()
   41f804df5644 ALSA: hda - fix headset mic problem for Dell machines with alc236
   61ae3fbc85f4 ALSA: hda/realtek - Add support for ALC236/ALC3204
   43a980a99654 workqueue: replace pool->manager_arb mutex with a flag
   d785062ef20f Linux 4.9.59
   d2d576e28554 FS-Cache: fix dereference of NULL user_key_payload
   63c8e4525549 KEYS: Fix race between updating and finding a negative key
   b2ac5d4516fb fscrypt: fix dereference of NULL user_key_payload
   f374505b7910 xfs: trim writepage mapping to within eof
   245262c66d1d xfs: cancel dirty pages on invalidation
   67d73f4122a3 xfs: handle error if xfs_btree_get_bufs fails
   fee940a8bef1 xfs: reinit btree pointer on attr tree inactivation walk
   0fe7d85b5a99 xfs: don't change inode mode if ACL update fails
   3a5a338aec3f xfs: move more RT specific code under CONFIG_XFS_RT
   3042b3a5a4ee xfs: Don't log uninitialised fields in inode structures
   1b4998dceda7 xfs: handle racy AIO in xfs_reflink_end_cow
   002295a6be81 xfs: always swap the cow forks when swapping extents
   d59a3f7f3caa xfs: Capture state of the right inode in xfs_iflush_done
   98cbca24894c xfs: perag initialization should only touch m_ag_max_usable for AG 0
   0eebfedec144 xfs: update i_size after unwritten conversion in dio completion
   d1b2a35f8f57 xfs: report zeroed or not correctly in xfs_zero_range()
   6f770625b421 fs/xfs: Use %pS printk format for direct addresses
   92f606092f6c xfs: evict CoW fork extents when performing finsert/fcollapse
   4e9de11c2377 xfs: don't unconditionally clear the reflink flag on zero-block files
   13c5e9770109 vmbus: fix missing signaling in hv_signal_on_read()
   1c33c8f8a727 pkcs7: Prevent NULL pointer dereference, since sinfo is not always set.
   da0c7503c0b8 KEYS: don't let add_key() update an uninstantiated key
   f9e7e2d6051e lib/digsig: fix dereference of NULL user_key_payload
   fec442e32bf6 KEYS: encrypted: fix dereference of NULL user_key_payload
   ca9601382b31 x86/microcode/intel: Disable late loading on model 79
   5a6fb4920381 rtlwifi: rtl8821ae: Fix connection lost problem
   f1ae556a31dd clockevents/drivers/cs5535: Improve resilience to spurious interrupts
   534b65dc0a06 bus: mbus: fix window size calculation for 4GB windows
   8de5590d957c brcmsmac: make some local variables 'static const' to reduce stack size
   7f9267693f51 brcmfmac: Add check for short event packets
   717ef37dde6c i2c: piix4: Fix SMBus port selection for AMD Family 17h chips
   4d4f527029e2 i2c: ismt: Separate I2C block read from SMBus block read
   57ed31530cf9 ALSA: hda: Abort capability probe at invalid register read
   d0f5c17fd414 ALSA: hda: Remove superfluous '-' added by printk conversion
   d5b657ee66a3 ALSA: seq: Enable 'use' locking in all configurations
   710c0b073eeb drm/nouveau/mmu: flush tlbs before deleting page tables
   f4f0b6aa58eb drm/nouveau/bsp/g92: disable by default
   587d7faf6f0e can: esd_usb2: Fix can_dlc value for received RTR, frames
   dc1858a8e56f xhci: Identify USB 3.1 capable hosts by their port protocol capability
   6f4a36f0ec7d usb: musb: Check for host-mode using is_host_active() on reset interrupt
   b4ecc15d6f5a usb: musb: sunxi: Explicitly release USB PHY on exit
   09fad6f25254 iio: dummy: events: Add missing break
   6bb16fa58127 parisc: Fix double-word compare and exchange in LWS code on 32-bit kernels
   6f0eefab853b can: gs_usb: fix busy loop if no more TX context is available
   b26fafd38106 ALSA: usb-audio: Add native DSD support for Pro-Ject Pre Box S2 Digital
   d15fc53296a5 usb: hub: Allow reset retry for USB2 devices on connect bounce
   ddf0b44fbcb2 usb: quirks: add quirk for WORLDE MINI MIDI keyboard
   b7cd9f5664e1 usb: cdc_acm: Add quirk for Elatec TWN3
   603296156ba4 USB: serial: metro-usb: add MS7820 device id
   9d13d3e05be2 USB: core: fix out-of-bounds access bug in usb_get_bos_descriptor()
   ee0ea51aa9cb USB: devio: Revert "USB: devio: Don't corrupt user memory"
   4d4a6a3f8a12 Linux 4.9.58
   480fd4fb29c5 usb: dwc3: gadget: Correct ISOC DATA PIDs for short packets
   9b9843154cd1 cpufreq: CPPC: add ACPI_PROCESSOR dependency
   2ee4d596e445 EDAC, mce_amd: Print IPID and Syndrome on a separate line
   8a7a752441a9 btmrvl: avoid double-disable_irq() race
   a127483e9ee2 regulator: core: Resolve supplies before disabling unused regulators
   16ee696eed67 drm/nouveau/gr/gf100-: fix ccache error logging
   62a3af1f1bc0 powerpc/perf: Add restrictions to PMC5 in power9 DD1
   d4bda742831e nfsd/callback: Cleanup callback cred on shutdown
   0c92e732937c hrtimer: Catch invalid clockids again
   b200b6dc7f39 target/iscsi: Fix unsolicited data seq_end_offset calculation
   e0fcd1e40db4 IB/hfi1: Allocate context data on memory node
   06f2d879c308 IB/hfi1: Use static CTLE with Preset 6 for integrated HFIs
   939f4f6ec741 uapi: fix linux/mroute6.h userspace compilation errors
   ad50561ba7a6 uapi: fix linux/rds.h userspace compilation errors
   bd530852210d ceph: clean up unsafe d_parent accesses in build_dentry_path
   6839ad59f9d5 ceph: fix bogus endianness change in ceph_ioctl_set_layout
   df37e8fadf74 ceph: don't update_dentry_lease unless we actually got one
   b025eb5d2678 i2c: at91: ensure state is restored after suspending
   1226f6993357 qed: Read queue state before releasing buffer
   7f8ea2674b44 qed: Reserve doorbell BAR space for present CPUs
   a506d326cbec qede: Prevent index problems in loopback test
   f6a72741241f net: mvpp2: release reference to txq_cpu[] entry after unmapping
   0ea82b90d844 drm/amdgpu: refuse to reserve io mem for split VRAM buffers
   b01eb4631306 ASoC: mediatek: add I2C dependency for CS42XX8
   10ae48453347 scsi: scsi_dh_emc: return success in clariion_std_inquiry()
   076a6220bc01 slub: do not merge cache if slub_debug contains a never-merge flag
   2ada592fc8e5 ocfs2/dlmglue: prepare tracking logic to avoid recursive cluster lock
   a5f043b2419e mm/memory_hotplug: set magic number to page->freelist instead of page->lru.next
   6145171a6bc0 crypto: xts - Add ECB dependency
   8909b26a51fc net/mlx4_core: Fix VF overwrite of module param which disables DMFS on new probed PFs
   84a66ca77543 sparc64: Migrate hvcons irq to panicked cpu
   cf368c29f5ac md/linear: shutup lockdep warnning
   e9afe7c8641a f2fs: do not wait for writeback in write_begin
   e215b6bb2dfe Btrfs: send, fix failure to rename top level inode due to name collision
   ab3d531745cf sched/fair: Update rq clock before changing a task's CPU affinity
   e5226e92bed8 f2fs: do SSR for data when there is enough free space
   90a8dfa5ae7a iio: adc: xilinx: Fix error handling
   f107c6ddf8db netfilter: nf_ct_expect: Change __nf_ct_expect_check() return value.
   0500fcd88556 staging: vchiq_2835_arm: Make cache-line-size a required DT property
   b1b73cc04608 net/mlx4_en: fix overflow in mlx4_en_init_timestamp()
   c1bc62d729f4 mac80211: fix power saving clients handling in iwlwifi
   fff654b43e12 qed: Don't use attention PTT for configuring BW
   145ded700722 ALSA: hda: Add Geminilake HDMI codec ID
   4799163a7a19 mac80211_hwsim: check HWSIM_ATTR_RADIO_NAME length
   aaf54d40b83f initramfs: finish fput() before accessing any binary from initramfs
   d413c3f0bd6f irqchip/crossbar: Fix incorrect type of local variables
   bbb5f0062b74 watchdog: kempld: fix gcc-4.3 build
   8b0be545deba locking/lockdep: Add nest_lock integrity test
   43588be0735f xen-netback: Use GFP_ATOMIC to allocate hash
   ebbd5ac4acdb Revert "bsg-lib: don't free job in bsg_prepare_job"
   0054c0bca321 MIPS: Fix minimum alignment requirement of IRQ stack

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index b6c98a5bb3bc..8692d7256479 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3039bc8f8f7e84de15c5823783c067c3e50fa7b6"
-SRCREV_meta ?= "cdbd35c54b6a62e4fd543164f1dcdf92c85cff2d"
+SRCREV_machine ?= "83c2338cc34980927eedc81cb4930524b51b717a"
+SRCREV_meta ?= "f4e37e151102d89c4d0e110c88eb3b3c36bdeaa4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.57"
+LINUX_VERSION ?= "4.9.61"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 79b8bfdfc82d..5a99d719c8ef 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.9.57"
+LINUX_VERSION ?= "4.9.61"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "cd8f9254aaaacbfa7f45fcc0bf2bb307615a174b"
-SRCREV_meta ?= "cdbd35c54b6a62e4fd543164f1dcdf92c85cff2d"
+SRCREV_machine ?= "d8520539587665c19a0afc97858069184574da66"
+SRCREV_meta ?= "f4e37e151102d89c4d0e110c88eb3b3c36bdeaa4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index 24867928d95c..c13dc2d71f8a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d5283083c827e18c5500d80c25b0a5eb76f64607"
-SRCREV_machine_qemuarm64 ?= "cd8f9254aaaacbfa7f45fcc0bf2bb307615a174b"
-SRCREV_machine_qemumips ?= "46f372c4c36868dd3546984efa408c2fe41c8fba"
-SRCREV_machine_qemuppc ?= "cd8f9254aaaacbfa7f45fcc0bf2bb307615a174b"
-SRCREV_machine_qemux86 ?= "cd8f9254aaaacbfa7f45fcc0bf2bb307615a174b"
-SRCREV_machine_qemux86-64 ?= "cd8f9254aaaacbfa7f45fcc0bf2bb307615a174b"
-SRCREV_machine_qemumips64 ?= "b88c2da88e31179a9cf7c22651e69adefcaa250f"
-SRCREV_machine ?= "cd8f9254aaaacbfa7f45fcc0bf2bb307615a174b"
-SRCREV_meta ?= "cdbd35c54b6a62e4fd543164f1dcdf92c85cff2d"
+SRCREV_machine_qemuarm ?= "a87b6d44fdde992b83a476cf9f1ad2772ebb7da0"
+SRCREV_machine_qemuarm64 ?= "d8520539587665c19a0afc97858069184574da66"
+SRCREV_machine_qemumips ?= "38ee2d051cba9ff9a045e67d9ebf2f9516fdcf47"
+SRCREV_machine_qemuppc ?= "d8520539587665c19a0afc97858069184574da66"
+SRCREV_machine_qemux86 ?= "d8520539587665c19a0afc97858069184574da66"
+SRCREV_machine_qemux86-64 ?= "d8520539587665c19a0afc97858069184574da66"
+SRCREV_machine_qemumips64 ?= "6219773456cdce10ab481da6718f715fc3e30ba7"
+SRCREV_machine ?= "d8520539587665c19a0afc97858069184574da66"
+SRCREV_meta ?= "f4e37e151102d89c4d0e110c88eb3b3c36bdeaa4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.57"
+LINUX_VERSION ?= "4.9.61"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


