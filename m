Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C6A8776EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 13:31:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2EDVPso001434
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Mar 2017 06:31:25 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 14 Mar 2017 06:31:24 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 14 Mar 2017 09:31:16 -0400
Message-ID: <7cefac5693924f714b5cd788fcf98e93121acc08.1489498044.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1489498044.git.bruce.ashfield@windriver.com>
References: <cover.1489498044.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-yocto/4.10: update to v4.10.2
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
X-List-Received-Date: Tue, 14 Mar 2017 13:31:26 -0000
Content-Type: text/plain

Integrating the korg -stable update, which contains the following changes:

   1e4d47787a21 Linux 4.10.2
   92d90f089848 ceph: update readpages osd request according to size of pages
   519f6fa2addb scsi: lpfc: Correct WQ creation for pagesize
   209cf1f25d0d MIPS: IP22: Fix build error due to binutils 2.25 uselessnes.
   b647284905d6 MIPS: IP22: Reformat inline assembler code to modern standards.
   84c131c8c9d0 module: fix memory leak on early load_module() failures
   cf1c6beafa75 powerpc/mm/hash: Always clear UPRT and Host Radix bits when setting up CPU
   543fd2ab74dc powerpc/mm: Add MMU_FTR_KERNEL_RO to possible feature mask
   4ffde229727e powerpc/xmon: Fix data-breakpoint
   737af93c3dce xprtrdma: Reduce required number of send SGEs
   387fb7dc3fde xprtrdma: Disable pad optimization by default
   5d53884b2c1b xprtrdma: Per-connection pad optimization
   921fe03af2b5 xprtrdma: Fix Read chunk padding
   143ac52c3ba8 dmaengine: ipu: Make sure the interrupt routine checks all interrupts.
   700c30c5179d mtd: nand: ifc: Fix location of eccstat registers for IFC V1.0
   6c12c1cec4bd bcma: use (get|put)_device when probing/removing device driver
   fe83da6961f8 md linear: fix a race between linear_add() and linear_congested()
   3c1afb4c72be rtc: sun6i: Switch to the external oscillator
   5fcdc5edafc2 rtc: sun6i: Add some locking
   c45b4fe3ca45 rtc: sun6i: Disable the build as a module
   b97cb8ece888 f2fs: Fix zoned block device support
   e8917cd860db f2fs: avoid to issue redundant discard commands
   c85fc3f1d59f f2fs: add ovp valid_blocks check for bg gc victim to fg_gc
   f213a0f926de f2fs: fix multiple f2fs_add_link() calls having same name
   88cf812869fd f2fs: fix a problem of using memory after free
   fd414a3e7d2c NFSv4: fix getacl ERANGE for some ACL buffer sizes
   ca83d7a97e36 NFSv4: fix getacl head length estimation
   81df387e03e0 Revert "NFSv4.1: Handle NFS4ERR_BADSESSION/NFS4ERR_DEADSESSION replies to OP_SEQUENCE"
   ad2ce81eeeb0 pNFS/flexfiles: If the layout is invalid, it must be updated before retrying
   7776aaacda12 NFSv4: Fix reboot recovery in copy offload
   607137e3f171 NFSv4: Fix memory and state leak in _nfs4_open_and_get_state
   982898d7f97a nfsd: special case truncates some more
   8defb389140f nfsd: minor nfsd_setattr cleanup
   11596d936ec4 VME: restore bus_remove function causing incomplete module unload
   031fad61741f rtlwifi: rtl8192c-common: Fix "BUG: KASAN:
   d0ff495de343 rtlwifi: Fix alignment issues
   28cd8db6a715 remoteproc: qcom: mdt_loader: Don't overwrite firmware object
   8e2b7672b43e gfs2: Add missing rcu locking for glock lookup
   6baafeb34b87 rdma_cm: fail iwarp accepts w/o connection params
   fc11f49a6a46 RDMA/core: Fix incorrect structure packing for booleans
   93919359467c Drivers: hv: util: Backup: Fix a rescind processing issue
   48dc52df9155 Drivers: hv: util: Fcopy: Fix a rescind processing issue
   f38bcff39862 Drivers: hv: util: kvp: Fix a rescind processing issue
   ec6f27bd19e0 Drivers: hv: vmbus: Fix a rescind handling bug
   42b0681b7fe9 Drivers: hv: vmbus: Prevent sending data on a rescinded channel
   f791a7b4a7ae hv: don't reset hv_context.tsc_page on crash
   a34da99e9468 hv: init percpu_list in hv_synic_alloc()
   aa2765857f74 hv: allocate synic pages for all present CPUs
   d03229ccf262 usb: gadget: f_hid: fix: Move IN request allocation to set_alt()
   ae1756eb2af9 usb: gadget: f_hid: Use spinlock instead of mutex
   b1d6621ad636 usb: gadget: f_hid: fix: Prevent accessing released memory
   afa9556b5fe6 usb: gadget: f_hid: fix: Free out requests
   6be8bf7cbcc2 usb: gadget: udc: fsl: Add missing complete function.
   0d95b60e8e9e usb: gadget: udc-core: Rescan pending list on driver unbind
   3afb5a0bd1f1 usb: host: xhci: plat: check hcc_params after add hcd
   8fd8890d42fc usb: dwc3: gadget: skip Set/Clear Halt when invalid
   fed46b526628 usb: musb: da8xx: Remove CPPI 3.0 quirk and methods
   53021fb71918 w1: ds2490: USB transfer buffers need to be DMAable
   1d1b1e1738ef w1: don't leak refcount on slave attach failure in w1_attach_slave_device()
   c903cc53f760 can: usb_8dev: Fix memory leak of priv->cmd_msg_buffer
   e9394d5a762d can: gs_usb: Don't use stack memory for USB transfers
   8d0db6065243 iio: pressure: mpl3115: do not rely on structure field ordering
   bab740787fd1 iio: pressure: mpl115: do not rely on structure field ordering
   615b1dc4f615 Revert "arm64: mm: set the contiguous bit for kernel mappings where appropriate"
   b6c72c4e3d93 KVM: arm/arm64: vgic: Stop injecting the MSI occurrence twice
   68b83bee9b90 arm64: fix erroneous __raw_read_system_reg() cases
   c5d1e9cc2879 arm64: dma-mapping: Fix dma_mapping_error() when bypassing SWIOTLB
   91dc54c352c4 arm/arm64: KVM: Enforce unconditional flush to PoC when mapping to stage-2
   6039863d6c97 x86/pkeys: Check against max pkey to avoid overflows
   f7e1174b9d53 fuse: add missing FR_FORCE
   f5e2e7ca6e6a crypto: vmx - Use skcipher for xts fallback
   1fd2ec10d3e1 crypto: vmx - Use skcipher for cbc fallback
   e7fa3bd29e07 crypto: api - Add crypto_requires_off helper
   ddde9085f58c crypto: xts - Propagate NEED_FALLBACK bit
   d5b190f8689c crypto: testmgr - Pad aes_ccm_enc_tv_template vector
   0c2f646b90b7 crypto: xts - Add ECB dependency
   0fd8c1cb80a1 Drivers: hv: vmbus: Raise retry/wait limits in vmbus_post_msg()
   2c849a5c6a83 PCI: altera: Fix TLP_CFG_DW0 for TLP write
   bc4c9766324a pci/hotplug/pnv-php: Disable MSI and PCI device properly
   91f5bce789d9 PCI: hv: Fix wslot_to_devfn() to fix warnings on device removal
   1306371f6cac ath9k: use correct OTP register offsets for the AR9340 and AR9550
   5bdf880b74c3 ath9k: fix race condition in enabling/disabling IRQs
   a5294659a572 ath5k: drop bogus warning on drv_set_key with unsupported cipher
   21b7618b6a79 ath10k: fix boot failure in UTF mode/testmode
   8fbc16143918 mei: remove support for broken parallel read
   8655a4538d01 samples/seccomp: fix 64-bit comparison macros
   4c30d59d397e ext4: fix fencepost in s_first_meta_bg validation
   b1062240132b ext4: return EROFS if device is r/o and journal replay is needed
   9605f3406975 ext4: preserve the needs_recovery flag when the journal is aborted
   5dda2495d85f ext4: fix inline data error paths
   c9bcbdfebb1f ext4: fix use-after-iput when fscrypt contexts are inconsistent
   c8f246b40261 ext4: fix data corruption in data=journal mode
   c4fbdc012479 ext4: trim allocation requests to group size
   011fe6ade610 ext4: do not polute the extents cache while shifting extents
   ac870011b6dc ext4: Include forgotten start block on fallocate insert range
   cdc13a3e453e loop: fix LO_FLAGS_PARTSCAN hang
   d957eb76b468 block/loop: fix race between I/O and set_status
   94cbe6f239a8 jbd2: don't leak modified metadata buffers on an aborted journal
   f4639f7eef3c Fix: Disable sys_membarrier when nohz_full is enabled
   112db4f65c53 power: reset: at91-poweroff: timely shutdown LPDDR memories
   c2990d648cf2 scsi: use 'scsi_device_from_queue()' for scsi_dh
   9acc751068e8 scsi: aacraid: Reorder Adapter status check
   154f7a1523b7 scsi: qla2xxx: Fix Regression introduced by pci_alloc_irq_vectors_affinity call.
   699abe249b0e scsi: qla2xxx: Fix response queue count for Target mode.
   cf9d91108064 scsi: qla2xxx: Cleaned up queue configuration code.
   e5fbe2328cc5 scsi: storvsc: properly set residual data length on errors
   0aeb049529f3 scsi: storvsc: properly handle SRB_ERROR when sense message is present
   99b3ba253c8b scsi: storvsc: use tagged SRB requests if supported by the device
   4517ad77e7e6 dm raid: fix data corruption on reshape request
   37ce3ec1e70b dm round robin: revert "use percpu 'repeat_count' and 'current_path'"
   72ea8179bc80 dm stats: fix a leaked s->histogram_boundaries array
   d18f5797ecf3 dm cache: fix corruption seen when using cache > 2TB
   ae74de54c982 PM / devfreq: Fix wrong trans_stat of passive devfreq device
   f1aa0ed61368 PM / devfreq: Fix available_governor sysfs
   45c01d51bb34 ima: fix ima_d_path() possible race with rename
   87d1f686d6bf ipc/shm: Fix shmat mmap nil-page protection
   7d24d588d82e sigaltstack: support SS_AUTODISARM for CONFIG_COMPAT
   97ddabf533f7 mm, vmscan: consider eligible zones in get_scan_count
   e2338022cded mm, vmscan: cleanup lru size claculations
   3b156aab44c9 mm balloon: umount balloon_mnt when removing vb device
   e560c8b23c3b mm: do not access page->mapping directly on page_endio
   67b5c7997148 mm: vmpressure: fix sending wrong events on underflow
   6fd7a425d925 mm/page_alloc: fix nodes for reclaim in fast path
   d0e2f86dff3a mm, devm_memremap_pages: hold device_hotplug lock over mem_hotplug_{begin, done}
   069634bd9e51 CIFS: Fix splice read for non-cached files
   9d654322f85e iommu/vt-d: Tylersburg isoch identity map check is done too late.
   1f8d55b2050c iommu/vt-d: Fix some macros that are incorrectly specified in intel-iommu
   b54dc49d8c4f tpm_tis: fix the error handling of init_tis()
   c15aff9ef901 tpm_tis: use default timeout value if chip reports it as zero
   992b0ac79a12 regulator: Fix regulator_summary for deviceless consumers
   2eb4d8daec86 coresight: fix kernel panic caused by invalid CPU
   91b8d5b2f2e3 coresight: STM: Balance enable/disable
   805c95a692ed staging: rtl: fix possible NULL pointer dereference
   f2bdb905fec2 staging/lustre/lnet: Fix allocation size for sv_cpt_data
   d43004bdde3f staging: greybus: loopback: fix broken udelay
   75225bc818b0 hwmon: (it87) Ensure that pwm control cache is current before updating values
   3b43f4161a5f hwmon: (it87) Do not overwrite bit 2..6 of pwm control registers
   3d2c16ca46bd ALSA: hda - Fix micmute hotkey problem for a lenovo AIO machine
   dfd8367d0c85 ALSA: hda - Add subwoofer support for Dell Inspiron 17 7000 Gaming
   80ed6047658c ALSA: seq: Fix link corruption by event error handling
   7b1c5904ad8d ALSA: ctxfi: Fallback DMA mask to 32bit
   cff10ccb6060 ALSA: timer: Reject user params with too small ticks
   a517802c5b33 ALSA: hda - fix Lewisburg audio issue
   3895ed1823d4 ALSA: hda/realtek - Cannot adjust speaker's volume on a Dell AIO
   75cf4b6b6e29 ARM: dts: at91: Enable DMA on sama5d2_xplained console
   67f1dd02b98d ARM: dts: at91: Enable DMA on sama5d4_xplained console
   55015e149d5b ARM: at91: define LPDDR types
   8e07d34fd09c spi: s3c64xx: fix inconsistency between binding and driver
   7cf6b709b641 ext4: fix deadlock between inline_data and ext4_expand_extra_isize_ea()
   c4b6ff75838f media: Properly pass through media entity types in entity enumeration
   81d5066323a8 lirc_dev: LIRC_{G,S}ET_REC_MODE do not work
   1a0fc4b1d6ae dvb-usb: don't use stack for firmware load
   aa315c9614c8 cxd2820r: fix gpio null pointer dereference
   a1403c576b0b media: fix dm1105.c build error
   0dafb0204953 uvcvideo: Fix a wrong macro
   895bff918136 am437x-vpfe: always assign bpp variable
   4dc455047ef2 mmc: sdhci-acpi: support deferred probe
   70d4818d1c89 MIPS: Handle microMIPS jumps in the same way as MIPS32/MIPS64 jumps
   6f6914d77b18 MIPS: Calculate microMIPS ra properly when unwinding the stack
   f4ab4d6fd79b MIPS: Fix is_jump_ins() handling of 16b microMIPS instructions
   6ec5e28dfb8d MIPS: Fix get_frame_info() handling of microMIPS function size
   f9bba20eaae7 MIPS: Prevent unaligned accesses during stack unwinding
   953f805442e1 MIPS: Clear ISA bit correctly in get_frame_info()
   734696a238da MIPS: Lantiq: Keep ethernet enabled during boot
   1764303e5e5a MIPS: OCTEON: Fix copy_from_user fault handling for large buffers
   f2b15d500123 MIPS: BCM47XX: Fix button inversion for Asus WL-500W
   890fb4e3c3e1 MIPS: Fix special case in 64 bit IP checksumming.
   87592def9b31 MIPS: pic32mzda: Fix linker error for pic32_get_pbclk()

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
index 502880174341..43e12fc014a9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "705df692910849e38f734f5bff121070e35118f1"
-SRCREV_meta ?= "76b1344f7683a95b94895818c26657e7202a9531"
+SRCREV_machine ?= "827a1164b155110c65f028a13a6c5699be93bbc3"
+SRCREV_meta ?= "69bfa872343a413322c2a1289f25d24a2db2728d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.10.1"
+LINUX_VERSION ?= "4.10.2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
index f7e94708f824..dfc5bf883f86 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.10.1"
+LINUX_VERSION ?= "4.10.2"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "705df692910849e38f734f5bff121070e35118f1"
-SRCREV_meta ?= "76b1344f7683a95b94895818c26657e7202a9531"
+SRCREV_machine ?= "827a1164b155110c65f028a13a6c5699be93bbc3"
+SRCREV_meta ?= "69bfa872343a413322c2a1289f25d24a2db2728d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.10.bb b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
index bf470c3ec775..0012d5c9156c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "267235eab850fed3af60c39005103062cd5831ac"
-SRCREV_machine_qemuarm64 ?= "705df692910849e38f734f5bff121070e35118f1"
-SRCREV_machine_qemumips ?= "af9f7f526fdd08da2eff38933448c0e7cd202786"
-SRCREV_machine_qemuppc ?= "705df692910849e38f734f5bff121070e35118f1"
-SRCREV_machine_qemux86 ?= "705df692910849e38f734f5bff121070e35118f1"
-SRCREV_machine_qemux86-64 ?= "705df692910849e38f734f5bff121070e35118f1"
-SRCREV_machine_qemumips64 ?= "85f89e2f7f33de72815995de6025e0b217f64c9a"
-SRCREV_machine ?= "705df692910849e38f734f5bff121070e35118f1"
-SRCREV_meta ?= "76b1344f7683a95b94895818c26657e7202a9531"
+SRCREV_machine_qemuarm ?= "ad30e5e8b96e0db4fb618b1320f1a9cb5ad175a8"
+SRCREV_machine_qemuarm64 ?= "827a1164b155110c65f028a13a6c5699be93bbc3"
+SRCREV_machine_qemumips ?= "b21d6ab39ba16f05780aaff518a2d7274fc0ce5f"
+SRCREV_machine_qemuppc ?= "827a1164b155110c65f028a13a6c5699be93bbc3"
+SRCREV_machine_qemux86 ?= "827a1164b155110c65f028a13a6c5699be93bbc3"
+SRCREV_machine_qemux86-64 ?= "827a1164b155110c65f028a13a6c5699be93bbc3"
+SRCREV_machine_qemumips64 ?= "4cd89b5ee382b61f90b81903934a1edfd836b617"
+SRCREV_machine ?= "827a1164b155110c65f028a13a6c5699be93bbc3"
+SRCREV_meta ?= "69bfa872343a413322c2a1289f25d24a2db2728d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.10.1"
+LINUX_VERSION ?= "4.10.2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


