Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 89AD7785F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 13:47:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8EDl6Vl027568
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Sep 2017 06:47:06 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 14 Sep 2017 06:47:05 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 14 Sep 2017 09:46:56 -0400
Message-ID: <a1aded02b11c2cfea9fc79fb03fffb18ab7d3495.1505396619.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1505396619.git.bruce.ashfield@windriver.com>
References: <cover.1505396619.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] linux-yocto/4.9: update to v4.9.49
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
X-List-Received-Date: Thu, 14 Sep 2017 13:47:06 -0000
Content-Type: text/plain

Integrating the korg -stable updates that comprise the following commits:

   f07cb3489cff Linux 4.9.49
   8bc67f67b763 drm/bridge: adv7511: Switch to using drm_kms_helper_hotplug_event()
   8b5a7e443622 drm/bridge: adv7511: Use work_struct to defer hotplug handing to out of irq context
   7791b59153cb scsi: sg: recheck MMAP_IO request length with lock held
   b06e1abf1ff2 scsi: sg: protect against races between mmap() and SG_SET_RESERVED_SIZE
   5b9c6a54c629 cs5536: add support for IDE controller variant
   ec552ece1f25 workqueue: Fix flag collision
   25bdc516b58e drm/nouveau/pci/msi: disable MSI on big-endian platforms by default
   078866740e35 s390/mm: avoid empty zero pages for KVM guests to avoid postcopy hangs
   c193becad9ad MCB: add support for SC31 to mcb-lpc
   0e720cd70631 mwifiex: correct channel stat buffer overflows
   5c23d3ed1190 dlm: avoid double-free on error path in dlm_device_{register,unregister}
   23b7d4f52b69 iwlwifi: pci: add new PCI ID for 7265D
   747562619512 Bluetooth: Add support of 13d3:3494 RTL8723BE device
   b48f7183c64c rtlwifi: rtl_pci_probe: Fix fail path of _rtl_pci_find_adapter
   ed7a384a904f Input: trackpoint - assume 3 buttons when buttons detection fails
   90a1e2e19ed7 ath10k: fix memory leak in rx ring buffer allocation
   d8b992d93555 intel_th: pci: Add Cannon Lake PCH-LP support
   a22d561178ee intel_th: pci: Add Cannon Lake PCH-H support
   5555eb956edc driver core: bus: Fix a potential double free
   ffb58b875d24 iio: adc: ti-ads1015: add adequate wait time to get correct conversion
   ff4a98e3bcb3 iio: adc: ti-ads1015: don't return invalid value from buffer setup callbacks
   1ed4565b7c7b iio: adc: ti-ads1015: avoid getting stale result after runtime resume
   c72ad1a4fdf0 iio: adc: ti-ads1015: enable conversion when CONFIG_PM is not set
   115af6c3b155 iio: adc: ti-ads1015: fix scale information for ADS1115
   177d84e3a72a iio: adc: ti-ads1015: fix incorrect data rate setting update
   e58b04fb5b0b staging/rts5208: fix incorrect shift to extract upper nybble
   afcfe0661a74 USB: core: Avoid race of async_completed() w/ usbdev_release()
   80cdcd7f5335 USB: musb: fix external abort on suspend
   6b3b3a22ef20 usb:xhci:Fix regression when ATI chipsets detected
   99a22c84f51d usb: Add device quirk for Logitech HD Pro Webcam C920-C
   773b93f4255f USB: serial: option: add support for D-Link DWM-157 C1
   2ea91c52ff5f usb: quirks: add delay init quirk for Corsair Strafe RGB keyboard
   8a697a50c090 Linux 4.9.48
   d325f1f1e245 epoll: fix race between ep_poll_callback(POLLFREE) and ep_free()/ep_remove()
   dd2342ad6665 kvm: arm/arm64: Force reading uncached stage2 PGD
   70df301a083c drm/ttm: Fix accounting error when fail to get pages for pool
   12a70ccaa686 xfrm: policy: check policy direction value
   31decdcd8369 lib/mpi: kunmap after finishing accessing buffer
   9e2788ce8f17 wl1251: add a missing spin_lock_init()
   e2ae90bb85f8 CIFS: remove endian related sparse warning
   c5e76654a9e5 CIFS: Fix maximum SMB2 header size
   d4e7dfda905e alpha: uapi: Add support for __SANE_USERSPACE_TYPES__
   309e4dbfaf3d cpuset: Fix incorrect memory_pressure control file mapping
   da16ed52c36a cpumask: fix spurious cpumask_of_node() on non-NUMA multi-node configs
   715849268b34 ceph: fix readpage from fscache
   8cc3acff5f1a mm, madvise: ensure poisoned pages are removed from per-cpu lists
   17c564f629f4 mm, uprobes: fix multiple free of ->uprobes_state.xol_area
   9e0a64330ce5 crypto: algif_skcipher - only call put_page on referenced and used pages
   91a0e1edb80a i2c: ismt: Return EMSGSIZE for block reads with bogus length
   d22f6da47355 i2c: ismt: Don't duplicate the receive length for block reads
   31562136c8d4 irqchip: mips-gic: SYNC after enabling GIC region
   458ca52f1564 Linux 4.9.47
   529ada21ff9e lz4: fix bogus gcc warning
   c47c52cde806 scsi: sg: reset 'res_in_use' after unlinking reserved array
   4099ac938385 scsi: sg: protect accesses to 'reserved' page array
   c0c6dff92303 locking/spinlock/debug: Remove spinlock lockup detection code
   27e7506c33d0 arm64: fpsimd: Prevent registers leaking across exec
   43f776dab360 x86/io: Add "memory" clobber to insb/insw/insl/outsb/outsw/outsl
   509d8b52bbe7 arm64: mm: abort uaccess retries upon fatal signal
   3e033635b2b7 kvm: arm/arm64: Fix race in resetting stage2 PGD
   b8a1532b16fd gcov: support GCC 7.1
   47974403c9ca staging: wilc1000: simplify vif[i]->ndev accesses
   dd758f82a3bf scsi: isci: avoid array subscript warning
   f71996c3ce5d p54: memset(0) whole array

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 22e478e2b8fb..23c445a814af 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d3aea9ac7fa726757720afe20286c375bf7eefbc"
-SRCREV_meta ?= "f16cac53436be696fa055bc4a139f3f1dc39a9ce"
+SRCREV_machine ?= "1e3f9281ed3043b83d31a3f3dfd28cfb0343873f"
+SRCREV_meta ?= "6acae6f7200af17b3c2be5ecab2cffdc59a02b35"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.46"
+LINUX_VERSION ?= "4.9.49"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 364930bac60a..0c2ff0acb272 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.9.46"
+LINUX_VERSION ?= "4.9.49"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "cf9a7dd9f41a32c10d19a51497463d6ec2991107"
-SRCREV_meta ?= "f16cac53436be696fa055bc4a139f3f1dc39a9ce"
+SRCREV_machine ?= "0a2c7ae3c42cd9009df2df20afd2df78332c3ae3"
+SRCREV_meta ?= "6acae6f7200af17b3c2be5ecab2cffdc59a02b35"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index c4b601c464e1..dbb5d54117f2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "5c60622f4af68de9d6d9320f7d785156d01c305c"
-SRCREV_machine_qemuarm64 ?= "cf9a7dd9f41a32c10d19a51497463d6ec2991107"
-SRCREV_machine_qemumips ?= "a5673234ab47a8653b7c3629811cc9ca634fcadb"
-SRCREV_machine_qemuppc ?= "cf9a7dd9f41a32c10d19a51497463d6ec2991107"
-SRCREV_machine_qemux86 ?= "cf9a7dd9f41a32c10d19a51497463d6ec2991107"
-SRCREV_machine_qemux86-64 ?= "cf9a7dd9f41a32c10d19a51497463d6ec2991107"
-SRCREV_machine_qemumips64 ?= "7b4d796b512ed9bb1e13af089fc4d20a35187eeb"
-SRCREV_machine ?= "cf9a7dd9f41a32c10d19a51497463d6ec2991107"
-SRCREV_meta ?= "f16cac53436be696fa055bc4a139f3f1dc39a9ce"
+SRCREV_machine_qemuarm ?= "072093c81a9329cec188905dfadb19c983be14f7"
+SRCREV_machine_qemuarm64 ?= "0a2c7ae3c42cd9009df2df20afd2df78332c3ae3"
+SRCREV_machine_qemumips ?= "0c66ebad24541c7673620ca433cd8478e5d06e3b"
+SRCREV_machine_qemuppc ?= "0a2c7ae3c42cd9009df2df20afd2df78332c3ae3"
+SRCREV_machine_qemux86 ?= "0a2c7ae3c42cd9009df2df20afd2df78332c3ae3"
+SRCREV_machine_qemux86-64 ?= "0a2c7ae3c42cd9009df2df20afd2df78332c3ae3"
+SRCREV_machine_qemumips64 ?= "6ac61462925ac9d6f668286bc29ee54f05e8f5e9"
+SRCREV_machine ?= "0a2c7ae3c42cd9009df2df20afd2df78332c3ae3"
+SRCREV_meta ?= "6acae6f7200af17b3c2be5ecab2cffdc59a02b35"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.46"
+LINUX_VERSION ?= "4.9.49"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


