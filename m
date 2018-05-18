Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 842D17481C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 15:07:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4IF74hs025792
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 May 2018 08:07:05 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 18 May 2018 08:07:04 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 18 May 2018 11:05:53 -0400
Message-ID: <f01083e8e03c4958db8edd29d1a1b5de4ec98018.1526655802.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1526655802.git.bruce.ashfield@windriver.com>
References: <cover.1526655802.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yoct/4.12: update to v4.12.24
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
X-List-Received-Date: Fri, 18 May 2018 15:07:04 -0000
Content-Type: text/plain

Updating to include Paul Gortmaker's latest round of stable updates, which
comprise the following commits:

   dc2f71a08d7a Linux 4.12.24
   4cab262afa69 iio: adc: ti-ads1015: add 10% to conversion wait time
   89f573e6f136 tools include: Do not use poison with C++
   d4f418739d68 kprobes/x86: Disable preemption in ftrace-based jprobes
   28861253362b perf test attr: Fix ignored test case result
   12c60baac963 staging: fsl-mc/dpio: Fix incorrect comparison
   43e1cab01765 serial: imx: Update cached mctrl value when changing RTS
   6122e955f082 usbip: tools: Install all headers needed for libusbip development
   c1fce3e6296c serial: sh-sci: suppress warning for ports without dma channels
   444cfc461e20 sysrq : fix Show Regs call trace on ARM
   0040e82b1a65 usb: xhci: Return error when host is dead in xhci_disable_slot()
   e1667a3749da staging: fsl-dpaa2/eth: Account for Rx FD buffers on error path
   7e22cbc6bd55 usb: mtu3: fix error return code in ssusb_gadget_init()
   c528464afcea EDAC, sb_edac: Fix missing break in switch
   e207a0c6a285 clocksource/drivers/arm_arch_timer: Validate CNTFRQ after enabling frame
   c3c5783f9303 serial: 8250: Preserve DLD[7:4] for PORT_XR17V35X
   ca7b446eff2f PCI: dra7xx: Create functional dependency between PCIe and PHY
   7897f75fc207 usb: phy: tahvo: fix error handling in tahvo_usb_probe()
   c240911c41c3 mmc: sdhci-msm: fix issue with power irq
   97227123b5f0 mmc: tmio: check mmc_regulator_get_supply return value
   05ce425fa841 spi: spi-axi: fix potential use-after-free after deregistration
   42f90afc67e4 spi: sh-msiof: Fix DMA transfer size check
   c652d0d523bf staging: rtl8188eu: avoid a null dereference on pmlmepriv
   3dc08560ab63 serial: 8250_fintek: Fix rs485 disablement on invalid ioctl()
   d57c00699295 m68k: fix ColdFire node shift size calculation
   df74b0c1e0b4 staging: greybus: loopback: Fix iteration count on async path
   96be1d656724 x86/entry/64: Don't use IST entry for #BP stack (part #2)
   8e3f9a001776 selftests/x86/ldt_get: Add a few additional tests for limits
   0d0517d16bc5 s390/pci: do not require AIS facility
   778bf06a0661 PM / Domains: Fix genpd to deal with drivers returning 1 from ->prepare()
   bd4084ce13d2 s390: vfio-ccw: Do not attempt to free no-op, test and tic cda.
   fd6fe520a496 ima: fix hash algorithm initialization
   83cd72f27843 usb: host: fix incorrect updating of offset
   4ab295bc9cdf USB: usbfs: Filter flags passed in from user space
   d8ce9fecf049 USB: Fix off by one in type-specific length check of BOS SSP capability
   dc9843bd9e72 USB: core: Add type-specific length check of BOS descriptors
   ab95f86f0fac usb: xhci: fix panic in xhci_free_virt_devices_depth_first
   c1b551b8718a xhci: Don't show incorrect WARN message about events for empty rings
   8412154c096c USB: ulpi: fix bus-node lookup
   10d2d61bff44 usb: hub: Cycle HUB power when initialization fails
   da44857edd20 powerpc/kprobes: Fix call trace due to incorrect preempt count
   67482fcb1f0a powerpc/kprobes: Disable preemption before invoking probe handler for optprobes
   6f745a984365 powerpc/jprobes: Disable preemption when triggered through ftrace
   3fefceeaca8e USB: serial: usb_debug: add new USB device id
   9c971e7d3a9f USB: serial: option: add Quectel BG96 id
   cc01c484eee9 serial: 8250_pci: Add Amazon PCI serial device ID
   d16393b7a9d8 usb: quirks: Add no-lpm quirk for KY-688 USB 3.1 Type-C Hub
   7a0ac9cc347c uas: Always apply US_FL_NO_ATA_1X quirk to Seagate devices
   52c2b20403f0 s390/runtime instrumentation: simplify task exit handling
   04dd38b88979 drm/fsl-dcu: enable IRQ before drm_atomic_helper_resume()
   f363e7cdb4f6 drm/fsl-dcu: avoid disabling pixel clock twice on suspend
   2845e7d136c8 drm/i915: Prevent zero length "index" write
   79413d6f2f6f drm/i915: Don't try indexed reads to alternate slave addresses
   f5cc8d6842e6 drm/i915/gvt: Correct ADDR_4K/2M/1G_MASK definition
   1fab446c5b5a drm/i915: Fix false-positive assert_rpm_wakelock_held in i915_pmic_bus_access_notifier v2
   708262ebbebc md: forbid a RAID5 from having both a bitmap and a journal.
   40219fc4a45b e1000e: fix the use of magic numbers for buffer overrun issue
   9bbd7fc437e0 include/linux/compiler-clang.h: handle randomizable anonymous structs
   13782a203fb8 drm/amd/pp: fix typecast error in powerplay.
   dd1ab1b7a09e drm/ttm: once more fix ttm_buffer_object_transfer
   1e1df0b0eb71 drm/hisilicon: Ensure LDI regs are properly configured.
   e10ca648a294 drm/panel: simple: Add missing panel_simple_unprepare() calls
   28fb6325953c drm/radeon: fix atombios on big endian
   0f7ff143e866 drm/tilcdc: Precalculate total frametime in tilcdc_crtc_set_mode()
   00debaff36fb drm/amdgpu: Remove check which is not valid for certain VBIOS
   53543b5a5062 drm/amdgpu: Properly allocate VM invalidate eng v2
   6095ee5e76ed drm/amdgpu: correct reference clock value on vega10
   8544b664f20e Revert "drm/radeon: dont switch vt on suspend"
   3b28b8cd6364 nvme-pci: add quirk for delay before CHK RDY for WDC SN200
   2c1ae94e88ee hwmon: (jc42) optionally try to disable the SMBUS timeout
   8fcaaeed325c bcache: recover data from backing when data is clean
   027fe49240fa bcache: only permit to recovery read error when cache device is clean
   3746f4374ee2 bcache: Fix building error on MIPS
   72ea117f664e cxl: Check if vphb exists before iterating over AFU devices
   8ee52dd3b01a i2c: i801: Fix Failed to allocate irq -2147483648 error
   ab7ae0720406 eeprom: at24: check at24_read/write arguments
   1025c12d637b eeprom: at24: correctly set the size for at24mac402
   32aba2ddc564 eeprom: at24: fix reading from 24MAC402/24MAC602
   ec5216d0e845 mmc: core: prepend 0x to OCR entry in sysfs
   a64429e1d089 mmc: core: prepend 0x to pre_eol_info entry in sysfs
   32f6d6221e55 mmc: core: Do not leave the block driver in a suspended state
   fa455ca7acc6 arm64: module-plts: factor out PLT generation code for ftrace
   d9c2c353dc61 s390: revert ELF_ET_DYN_BASE base changes
   5c10828c07be lockd: lost rollback of set_grace_period() in lockd_down_net()
   91ed144855d5 crypto: skcipher - Fix skcipher_walk_aead_common
   0ff5af74c047 nfsd: fix panic in posix_unblock_lock called from nfs4_laundromat
   b187299249a2 nfsd: Fix another OPEN stateid race
   2e36e8a92541 nfsd: Fix stateid races between OPEN and CLOSE
   237c8c16013d btrfs: clear space cache inode generation always
   e6eedfd1ca3f mm/hugetlb: fix NULL-pointer dereference on 5-level paging machine
   b19cd2bae194 autofs: revert "autofs: take more care to not update last_used on path walk"
   9c0369beda80 device-dax: implement ->split() to catch invalid munmap attempts
   0d73cfed1391 platform/x86: hp-wmi: Fix tablet mode detection for convertibles

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index d956e0ece2dc..5edc0fa40b4f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0cfd683dd04c8744d7426e13da2d2a464519953e"
-SRCREV_meta ?= "d2a0a87040e7fef4ca1165e73483b119830732ed"
+SRCREV_machine ?= "705d03507a0c10dcbf9cad3ff70f5d60b70f2d99"
+SRCREV_meta ?= "46171de19220c49d670544017cfbeffc1ec70e80"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.12.23"
+LINUX_VERSION ?= "4.12.24"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 004227dc3286..31307a638558 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.12.23"
+LINUX_VERSION ?= "4.12.24"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "204694d106a8bd75d8b6333fac9443c5fe809bb5"
-SRCREV_meta ?= "d2a0a87040e7fef4ca1165e73483b119830732ed"
+SRCREV_machine ?= "f9d67777b07ac97966186c1b56db78afe2a16f92"
+SRCREV_meta ?= "46171de19220c49d670544017cfbeffc1ec70e80"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index b0e6a471274a..8d560127f0f3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,22 +11,22 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "557352e573a3e23cf643d8b8b5e59bfaf301b4e4"
-SRCREV_machine_qemuarm64 ?= "204694d106a8bd75d8b6333fac9443c5fe809bb5"
-SRCREV_machine_qemumips ?= "a262c44eef3d3f0bbab797bbb5e2717b7ccb4d2f"
-SRCREV_machine_qemuppc ?= "204694d106a8bd75d8b6333fac9443c5fe809bb5"
-SRCREV_machine_qemux86 ?= "204694d106a8bd75d8b6333fac9443c5fe809bb5"
-SRCREV_machine_qemux86-64 ?= "204694d106a8bd75d8b6333fac9443c5fe809bb5"
-SRCREV_machine_qemumips64 ?= "f1e2c54153838e94f1730beba7c8e28af739af68"
-SRCREV_machine ?= "204694d106a8bd75d8b6333fac9443c5fe809bb5"
-SRCREV_meta ?= "d2a0a87040e7fef4ca1165e73483b119830732ed"
+SRCREV_machine_qemuarm ?= "45824c60ca37f414a5ac5783e970338db9a5a2af"
+SRCREV_machine_qemuarm64 ?= "f9d67777b07ac97966186c1b56db78afe2a16f92"
+SRCREV_machine_qemumips ?= "66f741b0b3d093e6b6df0f44120913ef3a259e23"
+SRCREV_machine_qemuppc ?= "f9d67777b07ac97966186c1b56db78afe2a16f92"
+SRCREV_machine_qemux86 ?= "f9d67777b07ac97966186c1b56db78afe2a16f92"
+SRCREV_machine_qemux86-64 ?= "f9d67777b07ac97966186c1b56db78afe2a16f92"
+SRCREV_machine_qemumips64 ?= "c5d838c9e26bd657b49dfe28b115e5bc4b580850"
+SRCREV_machine ?= "f9d67777b07ac97966186c1b56db78afe2a16f92"
+SRCREV_meta ?= "46171de19220c49d670544017cfbeffc1ec70e80"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
 DEPENDS += "openssl-native util-linux-native"
 
-LINUX_VERSION ?= "4.12.23"
+LINUX_VERSION ?= "4.12.24"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


