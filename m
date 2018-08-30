Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1363879404
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 13:45:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7UDjvf8001158
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Aug 2018 06:45:57 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 30 Aug 2018 06:45:57 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 30 Aug 2018 09:45:46 -0400
Message-ID: <d82cbbe654d7edbd2ab8575f428ae0a7e80c592f.1535636375.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1535636375.git.bruce.ashfield@windriver.com>
References: <cover.1535636375.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] linux-yocto/4.18: update to 4.18.5
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
X-List-Received-Date: Thu, 30 Aug 2018 13:45:57 -0000
Content-Type: text/plain

Integrating the korg -stable release that comprises the following
commits:

   96158f3a9e70 Linux 4.18.5
   0d63520b5fb4 reiserfs: fix broken xattr handling (heap corruption, bad retval)
   7bc1a91a5abd i2c: imx: Fix race condition in dma read
   32d9b3638608 i2c: core: ACPI: Properly set status byte to 0 for multi-byte writes
   8c1bd0d0edf0 PCI: pciehp: Fix unprotected list iteration in IRQ handler
   2de0279ac99e PCI: pciehp: Fix use-after-free on unplug
   d2d937b78621 PCI: Skip MPS logic for Virtual Functions (VFs)
   16558e4db5dc PCI: aardvark: Size bridges before resources allocation
   dabfad3cae57 PCI: hotplug: Don't leak pci_slot on registration failure
   4d4306a283a1 PCI / ACPI / PM: Resume all bridges on suspend-to-RAM
   473af290c7fd PCI: Restore resized BAR state on resume
   96be7bbde431 parisc: Remove ordered stores from syscall.S
   e1d35a1a02c4 parisc: Remove unnecessary barriers from spinlock.h
   3df731e0ccfe drm/amdgpu/pm: Fix potential Spectre v1
   d8a1aecababa drm/i915/kvmgt: Fix potential Spectre v1
   5b6ea348768d ext4: fix spectre gadget in ext4_mb_regular_allocator()
   5bd4084f029d powerpc64s: Show ori31 availability in spectre_v1 sysfs file not v2
   c2d73c253885 x86/mm/init: Remove freed kernel image areas from alias mapping
   a01cdb47ffd1 x86/mm/init: Add helper for freeing kernel image pages
   22ddf85281c3 x86/mm/init: Pass unconverted symbol addresses to free_init_pages()
   0a57c747ae05 mm: Allow non-direct-map arguments to free_reserved_area()
   2114c7185168 pty: fix O_CLOEXEC for TIOCGPTPEER
   48cf4d45ce8f EDAC: Add missing MEM_LRDDR4 entry in edac_mem_types[]
   28b2837b7236 Linux 4.18.4
   b1246ef7cf01 cls_matchall: fix tcf_unbind_filter missing
   ffbc6163fca7 net: mvneta: fix mvneta_config_rss on armada 3700
   298f83fe1298 net: ethernet: mvneta: Fix napi structure mixup on armada 3700
   043b985f7c81 ip_vti: fix a null pointer deferrence when create vti fallback tunnel
   63d60df1773e r8169: don't use MSI-X on RTL8106e
   6f560142350c hv/netvsc: Fix NULL dereference at single queue mode fallback
   cd0fb1cb23a8 net: sock_diag: Fix spectre v1 gadget in __sock_diag_cmd()
   3909ccf1fe71 isdn: Disable IIOCDBGVAR
   2b9ffbf248fb Bluetooth: avoid killing an already killed socket
   a34e4f42055a Revert "uio: use request_threaded_irq instead"
   93e5f3d10e79 misc: sram: fix resource leaks in probe error path
   421483e0c444 uio: fix wrong return value from uio_mmap()
   1d5fb78f91ae serial: 8250_dw: Add ACPI support for uart on Broadcom SoC
   1964062d2945 serial: 8250_dw: always set baud rate in dw8250_set_termios
   73f85a14da62 serial: 8250_exar: Read INT0 from slave device, too
   47f7d1daf64b tty: serial: 8250: Revert NXP SC16C2552 workaround
   8d26e06a887e ACPI / PM: save NVS memory for ASUS 1025C laptop
   54d05edc6052 USB: option: add support for DW5821e
   fee0c36502c5 USB: serial: pl2303: add a new device id for ATEN
   0a4711920c0a USB: serial: sierra: fix potential deadlock at close
   28f807d781df media: gl861: fix probe of dvb_usb_gl861
   e078fab2a495 ALSA: seq: Fix poll() error return
   8efea5358093 ALSA: vxpocket: Fix invalid endian conversions
   efa72756f954 ALSA: memalloc: Don't exceed over the requested size
   29a168321517 ALSA: hda: Correct Asrock B85M-ITX power_save blacklist entry
   1c0888fb4b49 ALSA: dice: fix wrong copy to rx parameters for Alesis iO26
   eeb2943acc74 ALSA: cs5535audio: Fix invalid endian conversion
   fe4740d8be76 ALSA: virmidi: Fix too long output trigger loop
   bb150b4471ce ALSA: vx222: Fix invalid endian conversions
   f9a16dfcbd88 ALSA: hda - Turn CX8200 into D3 as well upon reboot
   79141c5015ab ALSA: hda - Sleep for 10ms after entering D3 on Conexant codecs
   72a579b814d9 r8169: don't use MSI-X on RTL8168g
   01002eb0a1c3 net_sched: Fix missing res info when create new tc_index filter
   8a1a056d12d3 net_sched: fix NULL pointer dereference when delete tcindex filter
   4ea1da6d1c60 l2tp: use sk_dst_check() to avoid race on sk->sk_dst_cache

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index cfcd9fc22d47..9be96b5221b5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8a990322beb7b3aa5a06d7bd630f819b70911587"
-SRCREV_meta ?= "63ea2052ace129caa22c4b5b88c316bde63f64eb"
+SRCREV_machine ?= "6b38725fe97a59cefef01b5213a1d234dd38a542"
+SRCREV_meta ?= "80d3da10b85c1769760fcd0a1e1c7787f23eae24"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.18.3"
+LINUX_VERSION ?= "4.18.5"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index 7ed670ab4252..ef198aa14515 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -4,7 +4,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.18.3"
+LINUX_VERSION ?= "4.18.5"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -13,8 +13,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "eba03655e8e436ef6090100423bcea43e4911478"
-SRCREV_meta ?= "63ea2052ace129caa22c4b5b88c316bde63f64eb"
+SRCREV_machine ?= "71799edb8a38622626cf3b5582dff152b512ccf0"
+SRCREV_meta ?= "80d3da10b85c1769760fcd0a1e1c7787f23eae24"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index baeecc59b631..a4c7fabfefc2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -11,21 +11,21 @@ KBRANCH_qemux86  ?= "v4.18/standard/base"
 KBRANCH_qemux86-64 ?= "v4.18/standard/base"
 KBRANCH_qemumips64 ?= "v4.18/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "1af7de788a0d28968bd48ff733696de130e0427d"
-SRCREV_machine_qemuarm64 ?= "eba03655e8e436ef6090100423bcea43e4911478"
-SRCREV_machine_qemumips ?= "f431f068f06041a60b29628c97b507391c6ad92c"
-SRCREV_machine_qemuppc ?= "eba03655e8e436ef6090100423bcea43e4911478"
-SRCREV_machine_qemux86 ?= "eba03655e8e436ef6090100423bcea43e4911478"
-SRCREV_machine_qemux86-64 ?= "eba03655e8e436ef6090100423bcea43e4911478"
-SRCREV_machine_qemumips64 ?= "a8e005cb6453c4d59f4c460b6f034bba69ce7807"
-SRCREV_machine ?= "eba03655e8e436ef6090100423bcea43e4911478"
-SRCREV_meta ?= "63ea2052ace129caa22c4b5b88c316bde63f64eb"
+SRCREV_machine_qemuarm ?= "cae6ae8b337fbc4b73083cec8156884fcec00866"
+SRCREV_machine_qemuarm64 ?= "71799edb8a38622626cf3b5582dff152b512ccf0"
+SRCREV_machine_qemumips ?= "28fbf6d4df772beb8c13b9554933dc0751d38ad8"
+SRCREV_machine_qemuppc ?= "71799edb8a38622626cf3b5582dff152b512ccf0"
+SRCREV_machine_qemux86 ?= "71799edb8a38622626cf3b5582dff152b512ccf0"
+SRCREV_machine_qemux86-64 ?= "71799edb8a38622626cf3b5582dff152b512ccf0"
+SRCREV_machine_qemumips64 ?= "f3add308bccafeeed79fde2a3720236bf4fd6457"
+SRCREV_machine ?= "71799edb8a38622626cf3b5582dff152b512ccf0"
+SRCREV_meta ?= "80d3da10b85c1769760fcd0a1e1c7787f23eae24"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.18.3"
+LINUX_VERSION ?= "4.18.5"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.5.0


