Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C7DAC776B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 13:31:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2EDVRZG003928
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 14 Mar 2017 06:31:27 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 14 Mar 2017 06:31:26 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 14 Mar 2017 09:31:18 -0400
Message-ID: <ad9c66989953f1eaf1052236c872cc27d9da1af6.1489498044.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1489498044.git.bruce.ashfield@windriver.com>
References: <cover.1489498044.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] linux-yocto/4.1: update to v4.1.38
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
X-List-Received-Date: Tue, 14 Mar 2017 13:31:27 -0000
Content-Type: text/plain

Updating to the korg 4.1.38 -stable release with the following changes:

   f40b3cc69de8 Linux 4.1.38
   d8435bb5e8fb gro: Allow tunnel stacking in the case of FOU/GUE
   066b300e5be4 tunnels: Don't apply GRO to multiple layers of encapsulation.
   b11e1542feca net: ipv4: Convert IP network timestamps to be y2038 safe
   5023ae270216 ipip: Properly mark ipip GRO packets as encapsulated.
   3e3267311e3b sg_write()/bsg_write() is not fit to be called under KERNEL_DS
   363f1a90b7f3 fs: exec: apply CLOEXEC before changing dumpable task flags
   c63e64ae7665 IB/cma: Fix a race condition in iboe_addr_get_sgid()
   6242668e855c Revert "ALSA: usb-audio: Fix race at stopping the stream"
   dd5035276792 kvm: nVMX: Allow L1 to intercept software exceptions (#BP and #OF)
   6fdb4af13f9f drivers/gpu/drm/ast: Fix infinite loop if read fails
   d1b9fb84c423 target/user: Fix use-after-free of tcmu_cmds if they are expired
   bbe48c2f932e kernel/debug/debug_core.c: more properly delay for secondary CPUs
   1b51fce881b2 scsi: avoid a permanent stop of the scsi device's request queue
   f413092ea8e0 IB/multicast: Check ib_find_pkey() return value
   8c84816cedcb IPoIB: Avoid reading an uninitialized member variable
   5eba61298b74 block_dev: don't test bdev->bd_contains when it is not stable
   25e9e2367457 btrfs: limit async_work allocation and worker func duration
   ced9b7a66a35 mm/vmscan.c: set correct defer count for shrinker
   a62e45871b7b Input: drv260x - fix input device's parent assignment
   e1589b27ffb9 libceph: verify authorize reply on connect
   ed21b94ebbf4 ALSA: hiface: Fix M2Tech hiFace driver sampling rate change
   f8c36e2b98b7 s390/vmlogrdr: fix IUCV buffer allocation
   0848a2672eb3 kconfig/nconf: Fix hang when editing symbol with a long prompt
   7b53fb41d447 SUNRPC: fix refcounting problems with auth_gss messages.
   14927595fec9 ext4: return -ENOMEM instead of success
   576cfe615feb nfs_write_end(): fix handling of short copies
   77f3c11c13dd fgraph: Handle a case where a tracer ignores set_graph_notrace
   29955c9a00d5 timekeeping_Force_unsigned_clocksource_to_nanoseconds_conversion
   951f4b1f13a7 USB: serial: option: add dlink dwm-158
   0c4f2f61d68f USB: serial: option: add support for Telit LE922A PIDs 0x1040, 0x1041
   0a32f5b4f72d ALSA: usb-audio: Add QuickCam Communicate Deluxe/S7500 to volume_control_quirks
   1d53a630766e dm space map metadata: fix 'struct sm_metadata' leak on failed create
   67bcfac25cb8 arm/xen: Use alloc_percpu rather than __alloc_percpu
   d09b66f9e70b drm/radeon: add additional pci revision to dpm workaround
   e9631583d6c0 drm/radeon: Hide the HW cursor while it's out of bounds
   beeda93356ae drm/radeon: Always store CRTC relative radeon_crtc->cursor_x/y values
   7198dbbaa242 drm/radeon: Also call cursor_move_locked when the cursor size changes
   15a12fbbf365 CIFS: Fix a possible memory corruption during reconnect
   51fce08b64ec CIFS: Fix a possible memory corruption in push locks
   7f16769173df CIFS: Fix missing nls unload in smb2_reconnect()
   0ee8faf89305 USB: cdc-acm: add device id for GW Instek AFG-125
   a2080cc28041 mmc: sdhci: Fix recovery from tuning timeout
   2a1dc36fdc71 ALSA: usb-audio: Fix race at stopping the stream
   93f5b2b5d28b xfs: set AGI buffer type in xlog_recover_clear_agi_bucket
   73e7d7aef06c block: protect iterate_bdevs() against concurrent close
   a6d0744b18ae ASoC: intel: Fix crash at suspend/resume without card registration
   90604ed2f10c Btrfs: fix tree search logic when replaying directory entry deletes
   575b6eddbf73 Btrfs: fix deadlock caused by fsync when logging directory entries
   32a27da220fb powerpc/ps3: Fix system hang with GCC 5 builds
   07340eaf0743 USB: serial: kl5kusb105: fix open error path
   b4fa7414cb79 thermal: hwmon: Properly report critical temperature in sysfs
   3225aec938da md/raid5: limit request size according to implementation limits
   93da0de16c94 firmware: fix usermode helper fallback loading
   d7a1bfa59593 xen/gntdev: Use VM_MIXEDMAP instead of VM_IO to avoid NUMA balancing
   315419538d84 tpm xen: Remove bogus tpm_chip_unregister
   fee2ddaee775 f2fs: set ->owner for debugfs status file's file_operations
   f52d439916f0 ALSA: hda - fix headset-mic problem on a Dell laptop
   506d7d521174 dm crypt: mark key as invalid until properly loaded
   4a7036809383 KVM: PPC: Book3S HV: Don't lose hardware R/C bit updates in H_PROTECT
   ec05ce11c1e9 KVM: PPC: Book3S HV: Save/restore XER in checkpointed register state
   b1a758009739 ext4: add sanity checking to count_overhead()
   31eb998aa42d ext4: use more strict checks for inodes_per_block on mount
   526cfedac0b3 ext4: sanity check the block and cluster size at mount time
   c2404d06b82e usb: hub: Fix auto-remount of safely removed or ejected USB-3 devices
   2861b336b594 ssb: Fix error routine when fallback SPROM fails
   44ef406441e2 ath9k: Really fix LED polarity for some Mini PCI AR9220 MB92 cards.
   be733405b057 staging: comedi: ni_mio_common: fix M Series ni_ai_insn_read() data mask
   9d45d2e79800 ext4: fix stack memory corruption with 64k block size
   d6ddc9cf431b ext4: fix mballoc breakage with 64k block size
   b3409ef1849b loop: return proper error from loop_queue_rq()
   9e19c28455b3 crypto: caam - fix AEAD givenc descriptors
   332086b806ac regulator: stw481x-vmmc: fix ages old enable error
   9e4033f56d3d USB: UHCI: report non-PME wakeup signalling for Intel hardware
   257cb82ee6d7 PCI: Check for PME in targeted sleep state
   78ef3e710efd scsi: megaraid_sas: For SRIOV enabled firmware, ensure VF driver waits for 30secs before reset
   28a8e88f1d2f drm/gma500: Add compat ioctl
   6ec54b062038 usb: gadget: composite: correctly initialize ep->maxpacket
   33166482bf49 drm/i915: Unalias obj->phys_handle and obj->userptr
   d7633e23c7f6 drm/i915/gen9: fix the WaWmMemoryReadLatency implementation

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index dc9a8dcd3246..21cc635bf4f8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "109fa96e6ae89b0585e78186b374b57b9f37fcbb"
-SRCREV_meta ?= "4de9b8f96c8dca0c55a496792a2ad4d2776e6657"
+SRCREV_machine ?= "f793c71d51277bdb14d6854c8cbcc09b4f5936b4"
+SRCREV_meta ?= "7140ddb86e4b01529185e6d4a606001ad152b8f3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.37"
+LINUX_VERSION ?= "4.1.38"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index ed5a70b43c8d..ce8aea628b2c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.37"
+LINUX_VERSION ?= "4.1.38"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "61d2bedf25deac15c19413ee1b057067657d97d3"
-SRCREV_meta ?= "4de9b8f96c8dca0c55a496792a2ad4d2776e6657"
+SRCREV_machine ?= "2ce56d130ddff67f43ec857cc51cd347666a0078"
+SRCREV_meta ?= "7140ddb86e4b01529185e6d4a606001ad152b8f3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 19f321721c35..bf7f266ee6f2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "0ec64d1dadd3de6736b5b9acd5ffc7b3b9a22071"
-SRCREV_machine_qemuarm64 ?= "61d2bedf25deac15c19413ee1b057067657d97d3"
-SRCREV_machine_qemumips ?= "8d5c7074354cef47bbc2e3aabd926a3409f02b12"
-SRCREV_machine_qemuppc ?= "11c828d1e438aba1be93c4e19cb458f6391c3aa6"
-SRCREV_machine_qemux86 ?= "61d2bedf25deac15c19413ee1b057067657d97d3"
-SRCREV_machine_qemux86-64 ?= "61d2bedf25deac15c19413ee1b057067657d97d3"
-SRCREV_machine_qemumips64 ?= "03a03f3543a050b8a83618ed25d408beaa099371"
-SRCREV_machine ?= "61d2bedf25deac15c19413ee1b057067657d97d3"
-SRCREV_meta ?= "4de9b8f96c8dca0c55a496792a2ad4d2776e6657"
+SRCREV_machine_qemuarm ?= "4d2c95e78cdc7d312b7ab231ce90dce317f45df9"
+SRCREV_machine_qemuarm64 ?= "2ce56d130ddff67f43ec857cc51cd347666a0078"
+SRCREV_machine_qemumips ?= "81454f95166056a253c8950980e025ee243d8074"
+SRCREV_machine_qemuppc ?= "42c41e606b70fd73a202f4146c0480f5624b0a0e"
+SRCREV_machine_qemux86 ?= "2ce56d130ddff67f43ec857cc51cd347666a0078"
+SRCREV_machine_qemux86-64 ?= "2ce56d130ddff67f43ec857cc51cd347666a0078"
+SRCREV_machine_qemumips64 ?= "8a481005da41f82d2a40bf8cb40334547160ab5b"
+SRCREV_machine ?= "2ce56d130ddff67f43ec857cc51cd347666a0078"
+SRCREV_meta ?= "7140ddb86e4b01529185e6d4a606001ad152b8f3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.37"
+LINUX_VERSION ?= "4.1.38"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


