Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E313160745
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 21:14:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1ELEYaG018994
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 14 Feb 2017 13:14:34 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 14 Feb 2017 13:14:34 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 14 Feb 2017 16:14:21 -0500
Message-ID: <bd880fe276b180b2f90dd514c4cdd350e39ce3ea.1487106757.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1487106757.git.bruce.ashfield@windriver.com>
References: <cover.1487106757.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/11] linux-yocto/4.9: update to v4.9.9
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
X-List-Received-Date: Tue, 14 Feb 2017 21:14:35 -0000
Content-Type: text/plain

Updating to the korg -stable release. Changelog is as follows:

   d2e4b66b4ef2 Linux 4.9.9
   f2a0409a0850 drm/i915/execlists: Reset RING registers upon resume
   72cd604cfd86 fs: break out of iomap_file_buffered_write on fatal signals
   bf9ab22c350d iw_cxgb4: set correct FetchBurstMax for QPs
   13363b6988f6 x86/irq: Make irq activate operations symmetric
   e02136282296 irqdomain: Avoid activating interrupts more than once
   c6b0333baea0 iio: health: max30100: fixed parenthesis around FIFO count check
   12c2fcf6bcf7 iio: dht11: Use usleep_range instead of msleep for start signal
   7baa8491d47d iio: health: afe4403: retrieve a valid iio_dev in suspend/resume
   5f0ee562605b iio: health: afe4404: retrieve a valid iio_dev in suspend/resume
   54d2ccc4003b iio: adc: palmas_gpadc: retrieve a valid iio_dev in suspend/resume
   db0e02ef6b82 staging: greybus: timesync: validate platform state callback
   89cc65c1117f USB: serial: option: add device ID for HP lt2523 (Novatel E371)
   12a9c11c2e19 usb: gadget: f_fs: Assorted buffer overflow checks.
   e40d15fce929 usb: musb: Fix host mode error -71 regression
   cbd819e7db3a USB: Add quirk for WORLDE easykey.25 MIDI keyboard
   4807725aab0b USB: serial: pl2303: add ATEN device ID
   8bc382a9652b USB: serial: qcserial: add Dell DW5570 QDL
   0dcbd0aa44e6 KVM: x86: do not save guest-unsupported XSAVE state
   bc05a2e940fe dmaengine: cppi41: Fix oops in cppi41_runtime_resume
   2c2e7fe7c9c5 dmaengine: cppi41: Fix runtime PM timeouts with USB mass storage
   bebb9d75e84d perf/x86/intel/uncore: Clean up hotplug conversion fallout
   e6bd712154aa HID: wacom: Fix poor prox handling in 'wacom_pl_irq'
   f24bc920612c HID: hid-lg: Fix immediate disconnection of Logitech Rumblepad 2
   80246551c7d7 HID: usbhid: Quirk a AMI virtual mouse and keyboard with ALWAYS_POLL
   40add19d3897 iwlwifi: mvm: avoid crash on restart w/o reserved queues
   97663735a96f iwlwifi: fix double hyphen in MODULE_FIRMWARE for 8000
   3d8ec7d2d5f9 pinctrl: intel: merrifield: Add missed check in mrfld_config_set()
   2cf6c49264e4 pinctrl: baytrail: Debounce register is one per community
   449d3ecfbd76 Revert "vring: Force use of DMA API for ARM-based systems with legacy devices"
   16f61dee7e7c Revert "bcma: init serial console directly from ChipCommon code"
   12f822d23dee percpu-refcount: fix reference leak during percpu-atomic transition
   8ee8ff9e2652 regulator: axp20x: AXP806: Fix dcdcb being set instead of dcdce
   1594edd9ea0d vhost: fix initialization for vq->is_le
   04eb7db25bb1 mmc: sdhci: Ignore unexpected CARD_INT interrupts
   1d88791d5ed5 cgroup: don't online subsystems before cgroup_name/path() are operational
   a150e08704b2 can: bcm: fix hrtimer/tasklet termination in bcm op removal
   a93ae8dccc3c tracing: Fix hwlat kthread migration
   b67c7d39bc28 mm, fs: check for fatal signals in do_generic_file_read()
   6cb0497aec81 base/memory, hotplug: fix a kernel oops in show_valid_zones()
   72f7419610c8 mm/memory_hotplug.c: check start_pfn in test_pages_in_a_zone()
   9e255997c2e1 cifs: initialize file_info_lock
   f0c3a0ac3349 zswap: disable changing params if init fails
   a3d729526f2f svcrpc: fix oops in absence of krb5 module
   743146d347f3 NFSD: Fix a null reference case in find_or_create_lock_stateid()
   4c953848c95b powerpc/mm: Use the correct pointer when setting a 2MB pte
   8f415333be3a powerpc: Fix build failure with clang due to BUILD_BUG_ON()
   bbf69e5197da powerpc: Add missing error check to prom_find_boot_cpu()
   73d45909780e powerpc/eeh: Fix wrong flag passed to eeh_unfreeze_pe()
   4b70d598c2ee libata: Fix ATA request sense
   6d08607ef35b libata: apply MAX_SEC_1024 to all CX1-JB*-HP devices
   fc794153c407 ata: sata_mv:- Handle return value of devm_ioremap.
   b41615aa7056 perf/core: Fix PERF_RECORD_MMAP2 prot/flags for anonymous memory
   3996a91e3bdc perf/core: Fix use-after-free bug
   53bed1f64025 crypto: arm64/aes-blk - honour iv_out requirement in CBC and CTR modes
   b04a39f88ced crypto: api - Clear CRYPTO_ALG_DEAD bit before registering an alg
   2eb8f7c4225a drm/nouveau/nv1a,nv1f/disp: fix memory clock rate retrieval
   bd5cefed1ccc drm/nouveau/disp/gt215: Fix HDA ELD handling (thus, HDMI audio) on gt215
   c9fb422fd938 drm/amdgpu/si: fix crash on headless asics
   20658b3df8b9 pinctrl: baytrail: Add missing spinlock usage in byt_gpio_irq_handler
   7396685a1bca HID: cp2112: fix gpio-callback error handling
   a18c4584a489 HID: cp2112: fix sleep-while-atomic
   dfd713307adb xtensa: fix noMMU build on cores with MMU
   f2e24dd91818 efi/fdt: Avoid FDT manipulation after ExitBootServices()
   f0c7412edfc1 x86/efi: Always map the first physical page into the EFI pagetables
   13e6ef99d23b ext4: validate s_first_meta_bg at mount time
   610c2b7ff8f6 PCI/ASPM: Handle PCI-to-PCIe bridges as roots of PCIe hierarchies

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index b47e6aaaed13..5d7a20ed3ee0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "01a64b0469256a432af0b8a0f27d32694e908e8b"
-SRCREV_meta ?= "8f3bc608ae61c5333043167fa31bac33be93c3de"
+SRCREV_machine ?= "7c90101498e6974f25e3bfd4823710e42c054e06"
+SRCREV_meta ?= "b6e2f3d63bd3e8fc2663c7e10356db916e496207"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.8"
+LINUX_VERSION ?= "4.9.9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index e886f14cd7ed..6a110502074d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.9.8"
+LINUX_VERSION ?= "4.9.9"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c85c54f5bf53b98afe8105e91bffcdb6c60afe8f"
-SRCREV_meta ?= "8f3bc608ae61c5333043167fa31bac33be93c3de"
+SRCREV_machine ?= "d0c402280c0fb424f02b7d152c8a008d9ac267df"
+SRCREV_meta ?= "b6e2f3d63bd3e8fc2663c7e10356db916e496207"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index f33ff7718d14..7c367d886508 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "7d0c6a3197a456d36c190f5127b06e8525b6c874"
-SRCREV_machine_qemuarm64 ?= "c85c54f5bf53b98afe8105e91bffcdb6c60afe8f"
-SRCREV_machine_qemumips ?= "2b50d9fc7d329e661fd9fa317f60ee26746c30ae"
-SRCREV_machine_qemuppc ?= "c85c54f5bf53b98afe8105e91bffcdb6c60afe8f"
-SRCREV_machine_qemux86 ?= "c85c54f5bf53b98afe8105e91bffcdb6c60afe8f"
-SRCREV_machine_qemux86-64 ?= "c85c54f5bf53b98afe8105e91bffcdb6c60afe8f"
-SRCREV_machine_qemumips64 ?= "13818cbe0b9f0e2e7542b7c088b5719c7a463da9"
-SRCREV_machine ?= "c85c54f5bf53b98afe8105e91bffcdb6c60afe8f"
-SRCREV_meta ?= "8f3bc608ae61c5333043167fa31bac33be93c3de"
+SRCREV_machine_qemuarm ?= "b486cccff0f7d0b8329d1563cb7f6f37bd61218c"
+SRCREV_machine_qemuarm64 ?= "d0c402280c0fb424f02b7d152c8a008d9ac267df"
+SRCREV_machine_qemumips ?= "25272505ce62183927098e2834dc039bef127043"
+SRCREV_machine_qemuppc ?= "d0c402280c0fb424f02b7d152c8a008d9ac267df"
+SRCREV_machine_qemux86 ?= "d0c402280c0fb424f02b7d152c8a008d9ac267df"
+SRCREV_machine_qemux86-64 ?= "d0c402280c0fb424f02b7d152c8a008d9ac267df"
+SRCREV_machine_qemumips64 ?= "2ee2ed6d782e36fd705cc8f6ad9de98606ca227e"
+SRCREV_machine ?= "d0c402280c0fb424f02b7d152c8a008d9ac267df"
+SRCREV_meta ?= "b6e2f3d63bd3e8fc2663c7e10356db916e496207"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.8"
+LINUX_VERSION ?= "4.9.9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


