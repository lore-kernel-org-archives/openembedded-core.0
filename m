Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC6B71A6B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 13:54:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0IDseq3020808
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 18 Jan 2017 05:54:40 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 18 Jan 2017 05:54:39 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 18 Jan 2017 08:54:24 -0500
Message-ID: <30fb5e01efd22c989d734040a092ed5ff26d81d8.1484747560.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1484747560.git.bruce.ashfield@windriver.com>
References: <cover.1484747560.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/14] linux-yocto/4.4: update to v4.4.41
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
X-List-Received-Date: Wed, 18 Jan 2017 13:54:40 -0000
Content-Type: text/plain

Integrating the korg -stable release. Changes are as follows:

   cdd86b972265 Linux 4.4.41
   9f11a0ab6a96 net: mvpp2: fix dma unmapping of TX buffers for fragments
   d85727365859 sg_write()/bsg_write() is not fit to be called under KERNEL_DS
   7fb5a936457d kconfig/nconf: Fix hang when editing symbol with a long prompt
   e321f384d8a5 target/user: Fix use-after-free of tcmu_cmds if they are expired
   e5de1c724c06 powerpc: Convert cmp to cmpd in idle enter sequence
   cadaba838f1b powerpc/ps3: Fix system hang with GCC 5 builds
   8a2bcaae1bc7 nfs_write_end(): fix handling of short copies
   b66e3126569e libceph: verify authorize reply on connect
   edfe6a79f905 PCI: Check for PME in targeted sleep state
   8db00756afbd Input: drv260x - fix input device's parent assignment
   44685f03dd56 media: solo6x10: fix lockup by avoiding delayed register write
   952a9f5af9f8 IB/cma: Fix a race condition in iboe_addr_get_sgid()
   b7f73ada92a3 IB/multicast: Check ib_find_pkey() return value
   7b1369215616 IPoIB: Avoid reading an uninitialized member variable
   0de381ca35b5 IB/mad: Fix an array index check
   e945df4c6bc2 fgraph: Handle a case where a tracer ignores set_graph_notrace
   88e41441ccd4 platform/x86: asus-nb-wmi.c: Add X45U quirk
   2ef502e860f1 ftrace/x86_32: Set ftrace_stub to weak to prevent gcc from using short jumps to it
   19aa9c14989e kvm: nVMX: Allow L1 to intercept software exceptions (#BP and #OF)
   129e4323df37 KVM: PPC: Book3S HV: Don't lose hardware R/C bit updates in H_PROTECT
   ddf5718adfb8 KVM: PPC: Book3S HV: Save/restore XER in checkpointed register state
   1c8841c9b7d2 md/raid5: limit request size according to implementation limits
   d78006d2345f sc16is7xx: Drop bogus use of IRQF_ONESHOT
   b988320dab53 s390/vmlogrdr: fix IUCV buffer allocation
   656c9abd574b firmware: fix usermode helper fallback loading
   429a533a3d9a ARC: mm: arc700: Don't assume 2 colours for aliasing VIPT dcache
   dbb67e1d585d scsi: avoid a permanent stop of the scsi device's request queue
   565ae61d8995 scsi: zfcp: fix rport unblock race with LUN recovery
   3b3739dfa69c scsi: zfcp: do not trace pure benign residual HBA responses at default level
   1cc0f9488b91 scsi: zfcp: fix use-after-"free" in FC ingress path after TMF
   bccd78746f88 scsi: megaraid_sas: Do not set MPI2_TYPE_CUDA for JBOD FP path for FW which does not support JBOD sequence map
   49ea06561154 scsi: megaraid_sas: For SRIOV enabled firmware, ensure VF driver waits for 30secs before reset
   edf1169bbbaa vt: fix Scroll Lock LED trigger name
   f4f02a856a92 block: protect iterate_bdevs() against concurrent close
   abb78811e242 mei: request async autosuspend at the end of enumeration
   1f9c91a37542 drivers/gpu/drm/ast: Fix infinite loop if read fails
   970dc8cdec9c drm/gma500: Add compat ioctl
   0e0b70f581fc drm/radeon: add additional pci revision to dpm workaround
   62a272498dbe drm/radeon: Hide the HW cursor while it's out of bounds
   deac395e0ba8 drm/radeon: Also call cursor_move_locked when the cursor size changes
   cb8d63d885e9 drm/nouveau/i2c/gk110b,gm10x: use the correct implementation
   adea4a7b0f2b drm/nouveau/fifo/gf100-: protect channel preempt with subdev mutex
   d32d4b3d7c9f drm/nouveau/ltc: protect clearing of comptags with mutex
   3a2990e67b05 drm/nouveau/bios: require checksum to match for fast acpi shadow method
   a163451c80b0 drm/nouveau/kms: lvds panel strap moved again on maxwell
   69e236e70ead ACPI / video: Add force_native quirk for HP Pavilion dv6
   2c2375e40d28 ACPI / video: Add force_native quirk for Dell XPS 17 L702X
   01b6089b5622 staging: comedi: ni_mio_common: fix E series ni_ai_insn_read() data
   5283a7bedbcb staging: comedi: ni_mio_common: fix M Series ni_ai_insn_read() data mask
   e692edec93c1 thermal: hwmon: Properly report critical temperature in sysfs
   9d9541d44a26 clk: bcm2835: Avoid overwriting the div info when disabling a pll_div clk
   e01b04be3eb0 timekeeping_Force_unsigned_clocksource_to_nanoseconds_conversion
   96ea1b9ea099 regulator: stw481x-vmmc: fix ages old enable error
   842ec27cd3f2 mmc: sdhci: Fix recovery from tuning timeout
   dae7cb414834 ath9k: Really fix LED polarity for some Mini PCI AR9220 MB92 cards.
   b63929e8e130 cfg80211/mac80211: fix BSS leaks when abandoning assoc attempts
   05f4183ab5a4 rtlwifi: Fix enter/exit power_save
   f5d90f434c9a ssb: Fix error routine when fallback SPROM fails
   a3edc7b2e537 Linux 4.4.40
   7a2b4ee54b3f ppp: defer netns reference release for ppp channel
   37de955c11b5 driver core: fix race between creating/querying glue dir and its cleanup
   f85a337b4066 xfs: set AGI buffer type in xlog_recover_clear_agi_bucket
   fdb17ddd0a49 arm/xen: Use alloc_percpu rather than __alloc_percpu
   9397e79c4b2d xen/gntdev: Use VM_MIXEDMAP instead of VM_IO to avoid NUMA balancing
   00a0de085d60 tpm xen: Remove bogus tpm_chip_unregister
   f93777c91544 kernel/debug/debug_core.c: more properly delay for secondary CPUs
   f2b8b3455b22 kernel/watchdog: use nmi registers snapshot in hardlockup handler
   597f9c03b2d5 CIFS: Fix a possible memory corruption in push locks
   a9c69e152897 CIFS: Fix missing nls unload in smb2_reconnect()
   f0b715409cb9 CIFS: Fix a possible memory corruption during reconnect
   6dcb01e78333 ASoC: intel: Fix crash at suspend/resume without card registration
   701ec6e5cea7 dm space map metadata: fix 'struct sm_metadata' leak on failed create
   85290a163b06 dm crypt: mark key as invalid until properly loaded
   9188611f81e3 dm flakey: return -EINVAL on interval bounds error in flakey_ctr()
   f0898dc2852b blk-mq: Do not invoke .queue_rq() for a stopped queue
   c53af76d5de1 usb: gadget: composite: always set ep->mult to a sensible value
   b35f34f66943 exec: Ensure mm->user_ns contains the execed files
   0812936b11ea fs: exec: apply CLOEXEC before changing dumpable task flags
   14d8e5cae039 mm/vmscan.c: set correct defer count for shrinker
   ffef1630187b loop: return proper error from loop_queue_rq()
   011ded975e34 f2fs: set ->owner for debugfs status file's file_operations
   3460edfc70c2 ext4: do not perform data journaling when data is encrypted
   36af7cd560b9 ext4: return -ENOMEM instead of success
   519a30148e23 ext4: reject inodes with negative size
   f655b3575c47 ext4: add sanity checking to count_overhead()
   3995881b0f72 ext4: fix in-superblock mount options processing
   386588013810 ext4: use more strict checks for inodes_per_block on mount
   7b74c351de1c ext4: fix stack memory corruption with 64k block size
   26492d8a22b0 ext4: fix mballoc breakage with 64k block size
   4b6050922fb8 crypto: caam - fix AEAD givenc descriptors
   1c1f15f8ebfb ptrace: Capture the ptracer's creds not PT_PTRACE_CAP
   03eed7afbc09 mm: Add a user_ns owner to mm_struct and fix ptrace permission checks
   d80411dea6a4 block_dev: don't test bdev->bd_contains when it is not stable
   85cfbd9db2c6 btrfs: make file clone aware of fatal signals
   323ffc03ddb2 Btrfs: don't BUG() during drop snapshot
   107800061996 Btrfs: fix memory leak in do_walk_down
   5a9b659edef6 Btrfs: don't leak reloc root nodes on error
   8ca6845a58cd Btrfs: return gracefully from balance if fs tree is corrupted
   78a587c608f9 Btrfs: bail out if block group has different mixed flag
   25ee81e54620 Btrfs: fix memory leak in reading btree blocks
   590202271ffd clk: ti: omap36xx: Work around sprz319 advisory 2.1
   119b6658ce05 ALSA: hda: when comparing pin configurations, ignore assoc in addition to seq
   f0ea0ade046e ALSA: hda - Gate the mic jack on HP Z1 Gen3 AiO
   fa695bdc1741 ALSA: hda - fix headset-mic problem on a Dell laptop
   faff777fb456 ALSA: hda - ignore the assoc and seq when comparing pin configurations
   518fca87c645 ALSA: hda/ca0132 - Add quirk for Alienware 15 R2 2016
   29348065c339 ALSA: hiface: Fix M2Tech hiFace driver sampling rate change
   d0ba0f6a8291 ALSA: usb-audio: Add QuickCam Communicate Deluxe/S7500 to volume_control_quirks
   cbb2a2563587 USB: UHCI: report non-PME wakeup signalling for Intel hardware
   8ede2d7908aa usb: gadget: composite: correctly initialize ep->maxpacket
   c67c2ed829f3 usb: gadget: f_uac2: fix error handling at afunc_bind
   747b31526369 usb: hub: Fix auto-remount of safely removed or ejected USB-3 devices
   acca3cf0d62b USB: cdc-acm: add device id for GW Instek AFG-125
   5d6a392b6d36 USB: serial: kl5kusb105: fix open error path
   6a6e113cd928 USB: serial: option: add dlink dwm-158
   17907f291779 USB: serial: option: add support for Telit LE922A PIDs 0x1040, 0x1041
   1f5adadcd032 Btrfs: fix qgroup rescan worker initialization
   b5e715ed11ec btrfs: store and load values of stripes_min/stripes_max in balance status item
   919b74ba5ed5 Btrfs: fix tree search logic when replaying directory entry deletes
   0d619cf6f982 btrfs: limit async_work allocation and worker func duration
   a34f0e8a2f89 Linux 4.4.39
   5d488dee9236 crypto: rsa - Add Makefile dependencies to fix parallel builds
   1c0f4e0ebb79 hotplug: Make register and unregister notifier API symmetric
   537e42d759ae batman-adv: Check for alloc errors when preparing TT local data
   f03531d09125 m68k: Fix ndelay() macro
   55e15b2f44d7 arm64: futex.h: Add missing PAN toggling
   e29949ed3903 can: peak: fix bad memory access and free sequence
   083021bdba1e can: raw: raw_setsockopt: limit number of can_filter that can be set
   9a3baed9103b crypto: mcryptd - Check mcryptd algorithm compatibility
   c4db8a7d1e0c perf/x86: Fix full width counter, counter overflow
   c6a5bf4cda12 locking/rtmutex: Use READ_ONCE() in rt_mutex_owner()
   b27d9147f24a locking/rtmutex: Prevent dequeue vs. unlock race
   e286b6c16758 zram: restrict add/remove attributes to root only
   a0bd6aa097a4 parisc: Fix TLB related boot crash on SMP machines
   605f315c5a83 parisc: Remove unnecessary TLB purges from flush_dcache_page_asm and flush_icache_page_asm
   db9598605768 parisc: Purge TLB before setting PTE
   4bcea472de10 powerpc/eeh: Fix deadlock when PE frozen state can't be cleared
   c95b7f1fab0c Linux 4.4.38
   52783ada69b4 esp6: Fix integrity verification when ESN are used
   3bf28ce9c749 esp4: Fix integrity verification when ESN are used
   2176ec1c82ea ipv4: Set skb->protocol properly for local output
   25d8b7c105e1 ipv6: Set skb->protocol properly for local output
   d41fb2fbb28d Don't feed anything but regular iovec's to blk_rq_map_user_iov
   fd1aa12c6340 constify iov_iter_count() and iter_is_iovec()
   899b60535a2a sparc64: fix compile warning section mismatch in find_node()
   ed7b60db00a1 sparc64: Fix find_node warning if numa node cannot be found
   438e91da24fa sparc32: Fix inverted invalid_frame_pointer checks on sigreturns
   06cdad2b6d92 net: ping: check minimum size on ICMP header length
   77125815f058 net: avoid signed overflows for SO_{SND|RCV}BUFFORCE
   6e682c528b3e geneve: avoid use-after-free of skb->data
   a89e2ff894bc sh_eth: remove unchecked interrupts for RZ/A1
   c36a2a14f26d net: bcmgenet: Utilize correct struct device for all DMA operations
   5a01eaf19858 packet: fix race condition in packet_set_ring
   1a15519fdcdb net/dccp: fix use-after-free in dccp_invalid_packet
   baaf0c65bc8e netlink: Do not schedule work from sk_destruct
   d1ed9c1dba63 netlink: Call cb->done from a worker thread
   6c42bd6a393c net/sched: pedit: make sure that offset is valid
   cfa7c16d4577 net, sched: respect rcu grace period on cls destruction
   94de6f2ffb3d net: dsa: bcm_sf2: Ensure we re-negotiate EEE during after link change
   56366fa0ad46 l2tp: fix racy SOCK_ZAPPED flag check in l2tp_ip{,6}_bind()
   aece024e38cb rtnetlink: fix FDB size computation
   6ef59b986190 af_unix: conditionally use freezable blocking calls in read
   acf9504ae220 net: sky2: Fix shutdown crash
   49695d1e3b81 ip6_tunnel: disable caching when the traffic class is inherited
   2b54505c877f net: check dead netns for peernet2id_alloc()
   790fd11f9ed6 virtio-net: add a missing synchronize_net()

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 53a9b5736dda..f5169b81bdd5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "61d7bf47fe27b7dfd9a73b0a6de2d78a29af8b74"
-SRCREV_meta ?= "4c31a115453dad875dda85786c4c34572d6c64a2"
+SRCREV_machine ?= "6622c6471016005d5588aa4338ce57aced713dcd"
+SRCREV_meta ?= "78a26182e20c0a49c1adda63faa15ccd3f4ecb27"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.36"
+LINUX_VERSION ?= "4.4.41"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 36e88e34787b..0baba1de53fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.36"
+LINUX_VERSION ?= "4.4.41"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "35482df5d5ba0807eb8a7c40b554bd657e3f9987"
-SRCREV_meta ?= "4c31a115453dad875dda85786c4c34572d6c64a2"
+SRCREV_machine ?= "ad8b1d659ddd2699ebf7d50ef9de8940b157bfc2"
+SRCREV_meta ?= "78a26182e20c0a49c1adda63faa15ccd3f4ecb27"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 8142a361f498..5ac3f561a54f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "2859bb3c9e1bb307d9e4e03032fd8a529137552f"
-SRCREV_machine_qemuarm64 ?= "35482df5d5ba0807eb8a7c40b554bd657e3f9987"
-SRCREV_machine_qemumips ?= "3c4c23020da8a0596a64c8784c6d3a2dfa1ea324"
-SRCREV_machine_qemuppc ?= "35482df5d5ba0807eb8a7c40b554bd657e3f9987"
-SRCREV_machine_qemux86 ?= "35482df5d5ba0807eb8a7c40b554bd657e3f9987"
-SRCREV_machine_qemux86-64 ?= "35482df5d5ba0807eb8a7c40b554bd657e3f9987"
-SRCREV_machine_qemumips64 ?= "5d05923ecc402c127b92543ee44b890de5c53a7e"
-SRCREV_machine ?= "35482df5d5ba0807eb8a7c40b554bd657e3f9987"
-SRCREV_meta ?= "4c31a115453dad875dda85786c4c34572d6c64a2"
+SRCREV_machine_qemuarm ?= "60287c1951ca7063bc19597eb5cabf834e660cfb"
+SRCREV_machine_qemuarm64 ?= "ad8b1d659ddd2699ebf7d50ef9de8940b157bfc2"
+SRCREV_machine_qemumips ?= "143d659ae6d53623001e22c13a0286bd6d1723ca"
+SRCREV_machine_qemuppc ?= "ad8b1d659ddd2699ebf7d50ef9de8940b157bfc2"
+SRCREV_machine_qemux86 ?= "ad8b1d659ddd2699ebf7d50ef9de8940b157bfc2"
+SRCREV_machine_qemux86-64 ?= "ad8b1d659ddd2699ebf7d50ef9de8940b157bfc2"
+SRCREV_machine_qemumips64 ?= "c74cc42106745bab08de6263b9320ac029f2cca9"
+SRCREV_machine ?= "ad8b1d659ddd2699ebf7d50ef9de8940b157bfc2"
+SRCREV_meta ?= "78a26182e20c0a49c1adda63faa15ccd3f4ecb27"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.36"
+LINUX_VERSION ?= "4.4.41"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


