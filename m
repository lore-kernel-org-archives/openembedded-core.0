Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.17006.1627890765018628590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193002043"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193002043"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:03 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478651906"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:02 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 13/37] linux-yocto/5.10: update to v5.10.49
Date: Mon,  2 Aug 2021 15:52:00 +0800
Message-Id: <9b4a59c68c405cf3e2056ccda2efafa425599c2c.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    904ad453baa0 Linux 5.10.49
    064b57a8da99 xen/events: reset active flag for lateeoi events later
    a245f6842d21 Hexagon: change jumps to must-extend in futex_atomic_*
    a7f51048c5a8 Hexagon: add target builtins to kernel
    243f325ecc90 Hexagon: fix build errors
    8148665cb7fe media: uvcvideo: Support devices that report an OT as an entity source
    d5737410d2dd KVM: PPC: Book3S HV: Save and restore FSCR in the P9 path
    a09a52277207 Linux 5.10.48
    4dc968042864 Revert "KVM: x86/mmu: Drop kvm_mmu_extended_role.cr4_la57 hack"
    4ab869e0289d RDMA/mlx5: Block FDB rules when not in switchdev mode
    348143a38012 gpio: AMD8111 and TQMX86 require HAS_IOPORT_MAP
    45ca6df5df11 drm/nouveau: fix dma_address check for CPU/GPU sync
    d191c3d6ad33 gpio: mxc: Fix disabled interrupt wake-up support
    f77f97238496 scsi: sr: Return appropriate error code when disk is ejected

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5b203992df8d9866f8cf90a22f39e483376f3912)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index e0d8280128..e0dd954e88 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "42032770803ba26765376967cef09945f48abe04"
-SRCREV_meta ?= "82899c6a7119b9668be9ae508159f5ac96554cc2"
+SRCREV_machine ?= "35a59a3a48fe2513f6d77c1d6bff4ac14c11ecfa"
+SRCREV_meta ?= "201aedddc2f13640a14cbe3ef229c8f9c78bde07"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.47"
+LINUX_VERSION ?= "5.10.49"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 6b71573a39..6357e0174a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.47"
+LINUX_VERSION ?= "5.10.49"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "eaad1adbc817d996edf44fdd520da4810e57e66d"
-SRCREV_machine ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
-SRCREV_meta ?= "82899c6a7119b9668be9ae508159f5ac96554cc2"
+SRCREV_machine_qemuarm ?= "bad4d499d5a292e25cc56d35133fb2248c34a272"
+SRCREV_machine ?= "81c2020f763444e82ac117dd1420a9d005f3f2d4"
+SRCREV_meta ?= "201aedddc2f13640a14cbe3ef229c8f9c78bde07"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 0315808989..e236154e8f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "8950bba5dc5b6139af3711cf82b6c35ea3ef873f"
-SRCREV_machine_qemuarm64 ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
-SRCREV_machine_qemumips ?= "271e6f3b206246da2937788d83c3b4e57cb33da0"
-SRCREV_machine_qemuppc ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
-SRCREV_machine_qemuriscv64 ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
-SRCREV_machine_qemuriscv32 ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
-SRCREV_machine_qemux86 ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
-SRCREV_machine_qemux86-64 ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
-SRCREV_machine_qemumips64 ?= "1112c8f8594df02dd6f2bd1cf13848536ca3f536"
-SRCREV_machine ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
-SRCREV_meta ?= "82899c6a7119b9668be9ae508159f5ac96554cc2"
+SRCREV_machine_qemuarm ?= "683a13656dad8cac542d5b2eac5f40f00d16010d"
+SRCREV_machine_qemuarm64 ?= "b799502f8b1f8804ec9e436c95129be76c548d37"
+SRCREV_machine_qemumips ?= "abdd096fd6503fdbdf7d5c81948a07d5a8fe8ea2"
+SRCREV_machine_qemuppc ?= "f6e6a1a81c0c3f11c5e42bde6d107c9f0ea45f16"
+SRCREV_machine_qemuriscv64 ?= "8151429f787ee936c9a960e8db6f5909e81bae43"
+SRCREV_machine_qemuriscv32 ?= "8151429f787ee936c9a960e8db6f5909e81bae43"
+SRCREV_machine_qemux86 ?= "8151429f787ee936c9a960e8db6f5909e81bae43"
+SRCREV_machine_qemux86-64 ?= "8151429f787ee936c9a960e8db6f5909e81bae43"
+SRCREV_machine_qemumips64 ?= "01bad0d6e0916ce3eae77cbdfc64a141a4ae0ecd"
+SRCREV_machine ?= "8151429f787ee936c9a960e8db6f5909e81bae43"
+SRCREV_meta ?= "201aedddc2f13640a14cbe3ef229c8f9c78bde07"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.47"
+LINUX_VERSION ?= "5.10.49"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.31.1

