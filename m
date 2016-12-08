Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 458D471C5F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 18:02:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uB8I2td4003661
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Dec 2016 10:02:55 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Dec 2016 10:00:32 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 8 Dec 2016 12:58:50 -0500
Message-ID: <1fd9690e15ac7cfb8aaf7ea6424d26d25c177a1d.1481216659.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1481216659.git.bruce.ashfield@windriver.com>
References: <cover.1481216659.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] linux-yoct/4.1: update to v4.1.36
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
X-List-Received-Date: Thu, 08 Dec 2016 18:02:57 -0000
Content-Type: text/plain

Shortlog of the changes:

   8576fa45c10e Linux 4.1.36
   39f99860357c kbuild: add -fno-PIE
   bf5d3d296abf firewire: net: fix fragmented datagram_size off-by-one
   c604dec3d5a6 firewire: net: guard against rx buffer overflows
   9fe6256c0020 parisc: Ensure consistent state when switching to kernel stack at syscall entry
   83a474ed7003 ovl: fsync after copy-up
   c0b309f18b01 virtio: console: Unlock vqs while freeing buffers
   4fe9ae4d3fcf md: be careful not lot leak internal curr_resync value into metadata. -- (all)
   e1e5cab9b43c md: sync sync_completed has correct value as recovery finishes.
   97d53c4d89e0 scsi: arcmsr: Send SYNCHRONIZE_CACHE command to firmware
   d207c6603fc6 scsi: scsi_debug: Fix memory leak if LBP enabled and module is unloaded
   169eb57c9e8d drm/radeon/si_dpm: workaround for SI kickers
   c1593e5dcc2a drm/dp/mst: Check peer device type before attempting EDID read
   e5c6bbbcc7be drm/dp/mst: add some defines for logical/physical ports
   dadd5803301f drm/dp/mst: Clear port->pdt when tearing down the i2c adapter
   a2d4bd9c99cc KVM: MIPS: Precalculate MMIO load resume PC
   b05ff0cb0dea KVM: MIPS: Make ERET handle ERL before EXL
   90a107c0b85b drm/radeon: drop register readback in cayman_cp_int_cntl_setup
   9a9a2373142a scsi: megaraid_sas: Fix data integrity failure for JBOD (passthrough) devices
   1b15bd739689 Revert "drm/radeon: fix DP link training issue with second 4K monitor"
   5bc028b10d04 powerpc: Convert cmp to cmpd in idle enter sequence
   00a4335dfaa5 drm/radeon/si_dpm: Limit clocks on HD86xx part
   469bc68e081c drm/radeon/si/dpm: add workaround for for Jet parts
   85a2af9f690a USB: serial: cp210x: fix tiocmget error handling
   0854ce492ec3 Input: i8042 - add XMG C504 to keyboard reset table
   0e9bbbdfe9f8 ALSA: hda - Merge RIRB_PRE_DELAY into CTX_WORKAROUND caps
   02426cf24407 mac80211: discard multicast and 4-addr A-MSDUs
   f065a553f36e ubifs: Fix regression in ubifs_readdir()
   5fdb4fad291f GenWQE: Fix bad page access during abort of resource allocation
   55a2f87cd564 mm/list_lru.c: avoid error-path NULL pointer deref
   52e7b6bd8378 btrfs: fix races on root_log_ctx lists
   9f2d48f0745f vt: clear selection before resizing
   93ec720c6f10 tty: limit terminal size to 4M chars
   ca963122cab2 ALSA: usb-audio: Add quirk for Syntek STK1160
   3dc8f1f0decb KEYS: Fix short sprintf buffer in /proc/keys show function
   1f7ff6f7910e hv: do not lose pending heartbeat vmbus packets
   9662d19bab68 mei: txe: don't clean an unprocessed interrupt cause.
   a64291d578dd ANDROID: binder: Clear binder and cookie when setting handle in flat binder struct
   11924cba404d ANDROID: binder: Add strong ref checks
   39709c84807f dm table: fix missing dm_put_target_type() in dm_table_add_target()
   c91812c8ef76 usb: increase ohci watchdog delay to 275 msec
   51b231bd1a95 arm64: KVM: Take S1 walks into account when determining S2 write faults
   bb21e0295064 arm/arm64: KVM: Handle out-of-RAM cache maintenance as a NOP
   7fbfac87fbf5 USB: serial: fix potential NULL-dereference at probe
   605a6960617f xhci: workaround for hosts missing CAS bit
   c23a6dce1147 xhci: add restart quirk for Intel Wildcatpoint PCH
   4c17f91bb370 kvm: x86: memset whole irq_eoi
   9c5e89d59d56 libxfs: clean up _calc_dquots_per_chunk
   d1375c3e4f2e target: Don't override EXTENDED_COPY xcopy_pt_cmd SCSI status code
   ac49951623e1 target: Re-add missing SCF_ACK_KREF assignment in v4.1.y
   eaf55207fe3b ubifs: Abort readdir upon error
   b9ce8700a2e3 UBIFS: Fix possible memory leak in ubifs_readdir()
   cad1ca2a9485 ubifs: Fix xattr_names length in exit paths
   dfeb7e4f30e9 arm64: percpu: rewrite ll/sc loops in assembly
   3c9c01324032 powerpc/mm: Prevent unlikely crash in copro_calculate_slb()
   c1f5e5f89b99 isofs: Do not return EACCES for unknown filesystems
   b15662c8e266 irqchip/gic-v3-its: Fix entry size mask for GITS_BASER
   af17243fc1b4 arm64: kernel: Init MDCR_EL2 even in the absence of a PMU
   c911b72eaff1 USB: serial: ftdi_sio: add support for Infineon TriBoard TC2X7
   59eabe8bb60f memstick: rtsx_usb_ms: Manage runtime PM when accessing the device
   86559fc191ca memstick: rtsx_usb_ms: Runtime resume the device when polling for cards
   a89634cf709b mmc: rtsx_usb_sdmmc: Handle runtime PM while changing the led
   e79c2f2f7b30 mmc: rtsx_usb_sdmmc: Avoid keeping the device runtime resumed when unused
   f125e7f2285c mmc: sdhci: cast unsigned int to unsigned long long to avoid unexpeted error
   517052446f36 usb: gadget: function: u_ether: don't starve tx request queue
   66f38bf99faa ceph: fix error handling in ceph_read_iter
   9e9ca450cd93 irqchip/gicv3: Handle loop timeout proper
   88b6c9f4146a drm/radeon: change vblank_time's calculation method to reduce computational error.
   dcf4c1144f3a jbd2: fix incorrect unlock on j_list_lock
   a3da255ead60 scsi: Fix use-after-free
   8df981058e4f mmc: core: Annotate cmd_hdr as __le32
   7ea3d2e9c6aa x86/mm: Expand the exception table logic to allow new handling options

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index d15a4dcb195d..529fa205f199 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5395c3b5960ec1b769c0716f2889ef1101b66588"
-SRCREV_meta ?= "89785d2b18fa49233046125fddee8e161c8bec4d"
+SRCREV_machine ?= "47e987ba389beac0c7983dd37f215807eee86881"
+SRCREV_meta ?= "44719fa8f73fd7c444044ad3c04f5fc66f57b993"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.35"
+LINUX_VERSION ?= "4.1.36"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 5d5e1fa945b9..28ddfa993635 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.35"
+LINUX_VERSION ?= "4.1.36"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f358ce2569953d18cf6bd91d0269076938e5b091"
-SRCREV_meta ?= "89785d2b18fa49233046125fddee8e161c8bec4d"
+SRCREV_machine ?= "f75d58721859cd2ce5382bcdcae35479a6ce9f21"
+SRCREV_meta ?= "44719fa8f73fd7c444044ad3c04f5fc66f57b993"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 529c20737238..70ff99de1dd0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "bb6c714397ab4c48f4fcc76c0a609afbb42dfa2a"
-SRCREV_machine_qemuarm64 ?= "f358ce2569953d18cf6bd91d0269076938e5b091"
-SRCREV_machine_qemumips ?= "4a42cbc6464c592a8ce81cf9aefb780df02e10ac"
-SRCREV_machine_qemuppc ?= "f0ecbfc7c5c24f0ecdd05e3304f0bea302ed116c"
-SRCREV_machine_qemux86 ?= "f358ce2569953d18cf6bd91d0269076938e5b091"
-SRCREV_machine_qemux86-64 ?= "f358ce2569953d18cf6bd91d0269076938e5b091"
-SRCREV_machine_qemumips64 ?= "9162b0e9523407b638a3f7e2ed26450334e24969"
-SRCREV_machine ?= "f358ce2569953d18cf6bd91d0269076938e5b091"
-SRCREV_meta ?= "89785d2b18fa49233046125fddee8e161c8bec4d"
+SRCREV_machine_qemuarm ?= "6f0ca13105ff444e5adcea39d68c5f7707b1d23b"
+SRCREV_machine_qemuarm64 ?= "f75d58721859cd2ce5382bcdcae35479a6ce9f21"
+SRCREV_machine_qemumips ?= "d5bd5d3069bfccfb76c420f27e1e6fd94aaa3dcc"
+SRCREV_machine_qemuppc ?= "1006b2e79cf808a2e8a74a1b0325dec9b4d0873e"
+SRCREV_machine_qemux86 ?= "f75d58721859cd2ce5382bcdcae35479a6ce9f21"
+SRCREV_machine_qemux86-64 ?= "f75d58721859cd2ce5382bcdcae35479a6ce9f21"
+SRCREV_machine_qemumips64 ?= "985d7f27f0ad497a0072320fbbf05626e27c741a"
+SRCREV_machine ?= "f75d58721859cd2ce5382bcdcae35479a6ce9f21"
+SRCREV_meta ?= "44719fa8f73fd7c444044ad3c04f5fc66f57b993"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.35"
+LINUX_VERSION ?= "4.1.36"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


