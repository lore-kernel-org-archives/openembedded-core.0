Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 46E4A71AC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 13:54:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0IDsc4H018740
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Jan 2017 05:54:38 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 18 Jan 2017 05:54:37 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 18 Jan 2017 08:54:22 -0500
Message-ID: <7c0f371e4cc0a057b4fefeea75975525409d5651.1484747560.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1484747560.git.bruce.ashfield@windriver.com>
References: <cover.1484747560.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/14] linux-yocto/4.9: -stable update to v4.9.2
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
X-List-Received-Date: Wed, 18 Jan 2017 13:54:38 -0000
Content-Type: text/plain

The shortlog of changes follows:

   6f2fabab8d63 Linux 4.9.2
   8ed8791885aa drm/i915: Fix setting of boost freq tunable
   18a00ac6d7f1 drm/i915: skip the first 4k of stolen memory on everything >= gen8
   639641105443 drm/i915: Initialize dev_priv->atomic_cdclk_freq at init time
   159e2ea9ed49 drm/i915: Fix cdclk vs. dev_cdclk mess when not recomputing things
   d816da6f5766 drm/i915/dsi: Do not clear DPOUNIT_CLOCK_GATE_DISABLE from vlv_init_display_clock_gating
   6cb4179f97cf drm/i915/dsi: Fix chv_exec_gpio disabling the GPIOs it is setting
   2037b1b46cdb net: mvpp2: fix dma unmapping of TX buffers for fragments
   3f3a6bbe6f9f sg_write()/bsg_write() is not fit to be called under KERNEL_DS
   d024532a97db kconfig/nconf: Fix hang when editing symbol with a long prompt
   173fd37a3d21 target/user: Fix use-after-free of tcmu_cmds if they are expired
   630a2ef354bb libnvdimm, pfn: fix align attribute
   6838ac125324 of, numa: Return NUMA_NO_NODE from disable of_node_to_nid() if nid not possible.
   d5cf5ae25c95 powerpc/boot: Request no dynamic linker for boot wrapper
   efcb3d9442ff powerpc/ps3: Fix system hang with GCC 5 builds
   4b23132d6cf5 powerpc/64e: Convert cmpi to cmpwi in head_64.S
   369b330c9d82 SUNRPC: fix refcounting problems with auth_gss messages.
   ba15defe1807 pNFS: Fix a deadlock between read resends and layoutreturn
   e523ce8c99f9 pNFS: Clear NFS_LAYOUT_RETURN_REQUESTED when invalidating the layout stateid
   f32659df6e15 pNFS: Don't clear the layout stateid if a layout return is outstanding
   24b049fa0cd9 pNFS: On error, do not send LAYOUTGET until the LAYOUTRETURN has completed
   b775b86a5fe8 nfs_write_end(): fix handling of short copies
   fc6cb9c303e2 libceph: verify authorize reply on connect
   d8c34b0cc0be PCI: Check for PME in targeted sleep state
   7cc603e9a828 i40iw: Use correct src address in memcpy to rdma stats counters
   6195cd1a9628 bad_inode: add missing i_op initializers
   afd2a1994ea4 Input: drv260x - fix input device's parent assignment
   e5d92c0c84f3 v4l: tvp5150: Add missing break in set control handler
   7f89c1373637 media: solo6x10: fix lockup by avoiding delayed register write
   3fbe140e9d36 s5p-mfc: fix failure path of s5p_mfc_alloc_memdev()
   9fd64b830259 mn88473: fix chip id check on probe
   eb9afff9513d mn88472: fix chip id check on probe
   9aff8b170fe0 IB/cma: Fix a race condition in iboe_addr_get_sgid()
   476ed812c42d IB/rxe: Fix a memory leak in rxe_qp_cleanup()
   5984423bf7eb IB/multicast: Check ib_find_pkey() return value
   4187dfa67fa9 IPoIB: Avoid reading an uninitialized member variable
   382072e09f19 IB/mad: Fix an array index check
   239b40eb6189 fgraph: Handle a case where a tracer ignores set_graph_notrace
   a035dc674dd4 x86/smpboot: Make logical package management more robust
   3168762e8ad3 platform/x86: asus-nb-wmi.c: Add X45U quirk
   21be088c36c6 ftrace/x86_32: Set ftrace_stub to weak to prevent gcc from using short jumps to it
   e80ceb2da52e vsock/virtio: fix src/dst cid format
   d06485e0fcf5 fsnotify: Fix possible use-after-free in inode iteration on umount
   3f618a0b872f kvm: nVMX: Allow L1 to intercept software exceptions (#BP and #OF)
   94107133ae81 KVM: PPC: Book3S HV: Don't lose hardware R/C bit updates in H_PROTECT
   75b1053c2b8c KVM: PPC: Book3S HV: Save/restore XER in checkpointed register state
   483eeca2cf38 scsi: aacraid: remove wildcard for series 9 controllers
   8beb252f2be2 md/raid5: limit request size according to implementation limits
   a0357979d620 sc16is7xx: Drop bogus use of IRQF_ONESHOT
   7d5ec9eb3eea latent_entropy: fix ARM build error on earlier gcc
   959e95305f13 arm64: KVM: pmu: Reset PMSELR_EL0.SEL to a sane value before entering the guest
   111e0ccaf979 s390/kexec: use node 0 when re-adding crash kernel memory
   53bbee3348d8 s390/vmlogrdr: fix IUCV buffer allocation
   b3854cefe3d2 firmware: fix usermode helper fallback loading
   ce7ec3d7526c ARC: mm: arc700: Don't assume 2 colours for aliasing VIPT dcache
   9d33a3995667 scsi: avoid a permanent stop of the scsi device's request queue
   2a940b853ef6 scsi: zfcp: fix rport unblock race with LUN recovery
   744807cb251f scsi: zfcp: do not trace pure benign residual HBA responses at default level
   2ce34d9da427 scsi: zfcp: fix use-after-"free" in FC ingress path after TMF
   8032a30081c1 iscsi-target: Return error if unable to add network portal
   113783ec1cdb scsi: megaraid_sas: Do not set MPI2_TYPE_CUDA for JBOD FP path for FW which does not support JBOD sequence map
   6089f8712dcb scsi: megaraid_sas: For SRIOV enabled firmware, ensure VF driver waits for 30secs before reset
   2d2914349286 stm class: Fix device leak in open error path
   fbb28e76454f vt: fix Scroll Lock LED trigger name
   11aa5c10102a block: protect iterate_bdevs() against concurrent close
   09c154920e77 mei: me: add lewisburg device ids
   0814c3ede27a mei: request async autosuspend at the end of enumeration
   66469319c01a drivers/gpu/drm/ast: Fix infinite loop if read fails
   8dbd6f709e62 drm/amdgpu: fix init save/restore list in gfx_v8.0
   f2d3d7f84cdf drm/amdgpu: fix enable_cp_power_gating in gfx_v8.0.
   326760ba1802 drm/amd/powerplay: bypass fan table setup if no fan connected
   aa286e88fd91 drm/gma500: Add compat ioctl
   6187f21f8c97 drm/radeon/si: load the proper firmware on 0x87 oland boards
   851bedd86b95 drm/radeon: add additional pci revision to dpm workaround
   126f676b087d drm/radeon: Hide the HW cursor while it's out of bounds
   45ec673dfe0f drm/radeon: Also call cursor_move_locked when the cursor size changes
   9195157f7d03 drm/nouveau/fifo/gf100-: protect channel preempt with subdev mutex
   64a5c4725fd3 drm/nouveau/i2c/gk110b,gm10x: use the correct implementation
   bfa563bae251 drm/nouveau/ttm: wait for bo fence to signal before unmapping vmas
   a5b4c77c92da drm/nouveau/ltc: protect clearing of comptags with mutex
   d95ef8af5425 drm/nouveau/bios: require checksum to match for fast acpi shadow method
   2c256b8e81bf drm/nouveau/kms: lvds panel strap moved again on maxwell
   42e5fd6bce5b drm/nouveau/gr: fallback to legacy paths during firmware lookup
   c2a51dd3138d drm/amd/amdgpu: enable GUI idle INT after enabling CGCG
   8e1b86f30bc1 drm/amdgpu: Also call cursor_move_locked when the cursor size changes
   2cea21516231 drm/amdgpu: Store CRTC relative amdgpu_crtc->cursor_x/y values
   eb0d743b4188 drm/amdgpu: add additional pci revision to dpm workaround
   f3dd47e0f683 drm/amdgpu/si: load the proper firmware on 0x87 oland boards
   a04465251f94 ACPI / video: Add force_native quirk for HP Pavilion dv6
   6d46601e6564 ACPI / video: Add force_native quirk for Dell XPS 17 L702X
   745f7d0d1951 staging: comedi: ni_mio_common: fix E series ni_ai_insn_read() data
   bd1692bed615 staging: comedi: ni_mio_common: fix M Series ni_ai_insn_read() data mask
   3b2f287b7795 staging: lustre: ldlm: pl_recalc time handling is wrong
   38b2dc0b0f38 staging/lustre/osc: Revert erroneous list_for_each_entry_safe use
   bf6a9b31e8a9 hv: acquire vmbus_connection.channel_mutex in vmbus_free_channels()
   5bd6ccd9c95f docs: sphinx-extensions: make rstFlatTable work with docutils 0.13
   fab303ba78ee thermal: hwmon: Properly report critical temperature in sysfs
   05bc2071b11b clk: bcm2835: Avoid overwriting the div info when disabling a pll_div clk
   b6d666315b99 arm64: tegra: Add VDD_GPU regulator to Jetson TX1
   5f654078b760 gpio: chardev: Return error for seek operations
   acd0993f8e97 gpio: stmpe: fix interrupt handling bug
   ca22975afa14 timekeeping_Force_unsigned_clocksource_to_nanoseconds_conversion
   efd16f76f4da mmc: sd: Meet alignment requirements for raw_ssr DMA
   dbcde92b1b44 regulator: stw481x-vmmc: fix ages old enable error
   cee935845420 mmc: sdhci: Fix recovery from tuning timeout
   5bb425033ef1 Revert "mmc: sdhci: Reset cmd and data circuits after tuning failure"
   71717a3ef900 ath9k: do not return early to fix rcu unlocking
   de5d62f892c3 ath9k: Really fix LED polarity for some Mini PCI AR9220 MB92 cards.
   072ebf89ca23 ath9k: fix ath9k_hw_gpio_get() to return 0 or 1 on success
   1976c7689a58 cfg80211/mac80211: fix BSS leaks when abandoning assoc attempts
   3f23f7f21ac5 rtl8xxxu: Work around issue with 8192eu and 8723bu devices not reconnecting
   19d55b9f32b6 perf/x86/intel/cstate: Prevent hotplug callback leak
   ba12b35fbd69 perf annotate: Don't throw error for zero length symbols
   54fa190d0a54 perf/x86: Fix exclusion of BTS and LBR for Goldmont
   98068574928f rtlwifi: Fix enter/exit power_save
   ea23fca0c600 ath10k: fix soft lockup during firmware crash/hw-restart
   b8425f413466 ssb: Fix error routine when fallback SPROM fails
   6437abdb624e Linux 4.9.1
   705df55bd0cf x86/kbuild: enable modversions for symbols exported from asm
   c728f2b5edf2 builddeb: fix cross-building to arm64 producing host-arch debs
   e12096297ea5 xfs: set AGI buffer type in xlog_recover_clear_agi_bucket
   c11a13d6f527 xfs: fix up xfs_swap_extent_forks inline extent handling
   e67053ad4840 arm/xen: Use alloc_percpu rather than __alloc_percpu
   45394bf3e11e xen/gntdev: Use VM_MIXEDMAP instead of VM_IO to avoid NUMA balancing
   b7bbf06c21aa tpm xen: Remove bogus tpm_chip_unregister
   f726f4f411f9 kernel/debug/debug_core.c: more properly delay for secondary CPUs
   9b78d6905424 watchdog: qcom: fix kernel panic due to external abort on non-linefetch
   2eccf0e0bcb1 watchdog: mei_wdt: request stop on reboot to prevent false positive event
   36b08b819713 kernel/watchdog: use nmi registers snapshot in hardlockup handler
   c954acc0007b CIFS: Fix a possible memory corruption in push locks
   9f9d98246e5f CIFS: Decrease verbosity of ioctl call
   46890ffba1d6 CIFS: Fix a possible double locking of mutex during reconnect
   69d13b69e79c CIFS: Fix missing nls unload in smb2_reconnect()
   48f9526f4dcb CIFS: Fix a possible memory corruption during reconnect
   7aa58e7ad53b cifs: Fix smbencrypt() to stop pointing a scatterlist at the stack
   41c856b32900 ASoC: intel: Fix crash at suspend/resume without card registration
   f5dca4881fac dm space map metadata: fix 'struct sm_metadata' leak on failed create
   461f272954cf dm raid: fix discard support regression
   e362c317ba76 dm rq: fix a race condition in rq_completed()
   2c017f77e13d dm crypt: mark key as invalid until properly loaded
   3fae2a9e994b dm flakey: return -EINVAL on interval bounds error in flakey_ctr()
   e74fb822281e dm table: an 'all_blk_mq' table must be loaded for a blk-mq DM device
   470b6910f7c1 dm table: fix 'all_blk_mq' inconsistency when an empty table is loaded
   67b0069a5175 blk-mq: Do not invoke .queue_rq() for a stopped queue
   7ac62bcde2d4 PM / OPP: Don't use OPP structure outside of rcu protected section
   c7a8a0ac8fee PM / OPP: Pass opp_table to dev_pm_opp_put_regulator()
   eab1c4e2d0ad usb: gadget: composite: always set ep->mult to a sensible value
   44919a2ac4c6 mm, page_alloc: keep pcp count and list contents in sync if struct page is corrupted
   04597beae7c2 mm/vmscan.c: set correct defer count for shrinker
   fe3d462821b0 nvmet: Fix possible infinite loop triggered on hot namespace removal
   890c39d35eb0 loop: return proper error from loop_queue_rq()
   01e15b3328c4 f2fs: fix to determine start_cp_addr by sbi->cur_cp_pack
   027611ef345d f2fs: fix overflow due to condition check order
   1134ef11ffff f2fs: set ->owner for debugfs status file's file_operations
   a43e1c459a3d Revert "f2fs: use percpu_counter for # of dirty pages in inode"
   9abce3ca80a7 ext4: do not perform data journaling when data is encrypted
   acf3efd6f003 ext4: return -ENOMEM instead of success
   3e4f8da9d177 ext4: reject inodes with negative size
   8084f57bc468 ext4: add sanity checking to count_overhead()
   956e2a0e6779 ext4: fix in-superblock mount options processing
   01772f4683a9 ext4: use more strict checks for inodes_per_block on mount
   b493c715cdce ext4: fix stack memory corruption with 64k block size
   c3881abae6e7 ext4: fix mballoc breakage with 64k block size
   24d1251a5d83 ext4: don't lock buffer in ext4_commit_super if holding spinlock
   21cc91554c3d crypto: caam - fix AEAD givenc descriptors
   e71b4e061c96 ptrace: Don't allow accessing an undumpable mm
   e747b4ae3b6b ptrace: Capture the ptracer's creds not PT_PTRACE_CAP
   48466c4772d2 vfs,mm: fix return value of read() at s_maxbytes
   694a95fa6dae mm: Add a user_ns owner to mm_struct and fix ptrace permission checks
   cfa2d65b2622 block_dev: don't test bdev->bd_contains when it is not stable
   b6cce9b8e813 splice: reinstate SIGPIPE/EPIPE handling
   c1df5a63716b fs: exec: apply CLOEXEC before changing dumpable task flags
   21245b8635e8 exec: Ensure mm->user_ns contains the execed files
   0de98eef9c11 clk: ti: omap36xx: Work around sprz319 advisory 2.1
   0ce4f00087b4 ALSA: hda: when comparing pin configurations, ignore assoc in addition to seq
   e029ef3a9c82 ALSA: hda - Gate the mic jack on HP Z1 Gen3 AiO
   0119d5d44034 ALSA: hda - fix headset-mic problem on a Dell laptop
   37b7c5db5a30 ALSA: hda - ignore the assoc and seq when comparing pin configurations
   0f1047be4a9f ALSA: hda/ca0132 - Add quirk for Alienware 15 R2 2016
   fa2e770f88bc ALSA: hiface: Fix M2Tech hiFace driver sampling rate change
   205d3de9637f ALSA: usb-audio: Add QuickCam Communicate Deluxe/S7500 to volume_control_quirks
   77bd73ce21fa usbip: vudc: fix: Clear already_seen flag also for ep0
   420f170ce1ba USB: UHCI: report non-PME wakeup signalling for Intel hardware
   e0aa5ec40d6e usb: gadget: composite: correctly initialize ep->maxpacket
   5180169dae85 usb: gadget: f_uac2: fix error handling at afunc_bind
   eab169397ad6 usb: core: usbport: Use proper LED API to fix potential crash
   32a35351b7ec usb: hub: Fix auto-remount of safely removed or ejected USB-3 devices
   3666b6280351 usb: dwc3: gadget: set PCM1 field of isochronous-first TRBs
   20d7c1a68b5b USB: cdc-acm: add device id for GW Instek AFG-125
   c094cd32b0c7 USB: serial: kl5kusb105: fix open error path
   5e7c90bd53c6 USB: serial: option: add dlink dwm-158
   142513d6dc7c USB: serial: option: add support for Telit LE922A PIDs 0x1040, 0x1041
   1a5ec7dd17a9 Btrfs: fix qgroup rescan worker initialization
   a1e0e0476afb Btrfs: fix emptiness check for dirtied extent buffers at check_leaf()
   c01ea880e88a btrfs: store and load values of stripes_min/stripes_max in balance status item
   01f285fe1d88 Btrfs: fix relocation incorrectly dropping data references
   26dc52465f0d Btrfs: fix tree search logic when replaying directory entry deletes
   664b053c5363 Btrfs: fix deadlock caused by fsync when logging directory entries
   7d470f04e36c Btrfs: fix BUG_ON in btrfs_mark_buffer_dirty
   3bac322e18c3 btrfs: limit async_work allocation and worker func duration
   56eaecc8ecf3 hotplug: Make register and unregister notifier API symmetric

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 647030b9c5a0..b4091e97013d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1eb33152d655c73193cec17c4de04499e52b2faa"
-SRCREV_meta ?= "62afd8f4635269a59baf47d6fb894d73edfa9449"
+SRCREV_machine ?= "561c287ba4ac6a771b2a9b605d1bda1ad8d1bc4b"
+SRCREV_meta ?= "155d2810faa1977c6a87f671cdb0da48c36af5fd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9"
+LINUX_VERSION ?= "4.9.2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 99c12a6b6284..5d960bc14289 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.9"
+LINUX_VERSION ?= "4.9.2"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
-SRCREV_meta ?= "62afd8f4635269a59baf47d6fb894d73edfa9449"
+SRCREV_machine ?= "441291bf1bfbbfff1dc1c326b950d92e3cd5c900"
+SRCREV_meta ?= "155d2810faa1977c6a87f671cdb0da48c36af5fd"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index 2765b3711f77..b820e7c864ee 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "0fda844a4c8da3d987b8173128c2b14948133b2e"
-SRCREV_machine_qemuarm64 ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
-SRCREV_machine_qemumips ?= "22f2f6de114cf1fc58e068d1aff220d633aeaddf"
-SRCREV_machine_qemuppc ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
-SRCREV_machine_qemux86 ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
-SRCREV_machine_qemux86-64 ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
-SRCREV_machine_qemumips64 ?= "3183d61d4d00d8b7faf10d11b3da8cf3db432e6f"
-SRCREV_machine ?= "617635e43afee1aaf98a8f8300596f7a112513c0"
-SRCREV_meta ?= "62afd8f4635269a59baf47d6fb894d73edfa9449"
+SRCREV_machine_qemuarm ?= "4f616cec971fc96f282730a7db685638ac530b36"
+SRCREV_machine_qemuarm64 ?= "441291bf1bfbbfff1dc1c326b950d92e3cd5c900"
+SRCREV_machine_qemumips ?= "51e43e95d3ba96e95b19027d288d24d5e7eaff66"
+SRCREV_machine_qemuppc ?= "441291bf1bfbbfff1dc1c326b950d92e3cd5c900"
+SRCREV_machine_qemux86 ?= "441291bf1bfbbfff1dc1c326b950d92e3cd5c900"
+SRCREV_machine_qemux86-64 ?= "441291bf1bfbbfff1dc1c326b950d92e3cd5c900"
+SRCREV_machine_qemumips64 ?= "608c940901025464daaafe9749727ce26a194429"
+SRCREV_machine ?= "441291bf1bfbbfff1dc1c326b950d92e3cd5c900"
+SRCREV_meta ?= "155d2810faa1977c6a87f671cdb0da48c36af5fd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9"
+LINUX_VERSION ?= "4.9.2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


