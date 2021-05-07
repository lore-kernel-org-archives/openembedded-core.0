Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: +eTZP5qEuxU9oqFsGXqnEjjKjBExsn3mmpvL4xh2njGLNBGJ+z1/OW3NDKsdnRHOIV7OuCsMGT
 GiwVUZ1IUdeg==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794762"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794762"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:13 -0700
IronPort-SDR: FOhsf9ojheghxstNO5T2NZMeMMO751/S+9fb6k0dj/YTCCehRawNHu7lVoX+eJjjNaxyRIWo5S
 4B900Ata8BVw==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331628"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:12 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 17/31] linux-yocto/5.4: update to v5.4.116
Date: Fri,  7 May 2021 15:02:29 +0800
Message-Id: <b41af8ae8fce5b1c8d32cebcc85315517775a3cc.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    370636ffbb86 Linux 5.4.116
    e23967af130b bpf: Update selftests to reflect new error states
    ef4e68f0af04 bpf: Tighten speculative pointer arithmetic mask
    4dc6e55e282f bpf: Move sanitize_val_alu out of op switch
    876d1cec9369 bpf: Refactor and streamline bounds check into helper
    4158e5fea3b1 bpf: Improve verifier error messages for users
    15de0c537bf7 bpf: Rework ptr_limit into alu_limit and add common error path
    f7fbedc90909 bpf: Ensure off_reg has no mixed signed bounds for all types
    4a163b1c7053 bpf: Move off_reg into sanitize_ptr_alu
    19bfeb47e96b Linux 5.4.115
    af7099bad495 USB: CDC-ACM: fix poison/unpoison imbalance
    d7fad2ce15bd net: hso: fix NULL-deref on disconnect regression
    699017fe0de4 x86/crash: Fix crash_setup_memmap_entries() out-of-bounds access
    b3962b4e8334 ia64: tools: remove duplicate definition of ia64_mf() on ia64
    763cbe5e1ebb ia64: fix discontig.c section mismatches
    3dce9c4bb546 csky: change a Kconfig symbol name to fix e1000 build error
    892f6bc55746 cavium/liquidio: Fix duplicate argument
    2ccca124620e xen-netback: Check for hotplug-status existence before watching
    78687d6a3213 s390/entry: save the caller of psw_idle
    026490fac496 net: geneve: check skb is large enough for IPv4/IPv6 header
    caaf9371ecad ARM: dts: Fix swapped mmc order for omap3
    be60afbb9136 HID: wacom: Assign boolean values to a bool variable
    116ee59ef886 HID: alps: fix error return code in alps_input_configured()
    a4e2b91cea52 HID: google: add don USB id
    aefb6ac6ac11 perf auxtrace: Fix potential NULL pointer dereference
    39638289595b perf/x86/kvm: Fix Broadwell Xeon stepping in isolation_ucodes[]
    319a06e58ed7 perf/x86/intel/uncore: Remove uncore extra PCI dev HSWEP_PCI_PCU_3
    82808cc02681 locking/qrwlock: Fix ordering in queued_write_lock_slowpath()
    c6eb92b37af1 arm64: dts: allwinner: Revert SD card CD GPIO for Pine64-LTS
    37ee803d7ed7 pinctrl: lewisburg: Update number of pins in community
    dbb355960ef9 gpio: omap: Save and restore sysconfig
    835c8d688e1e s390/ptrace: return -ENOSYS when invalid syscall is supplied

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 667352cc46429f3d8eca12cf93c26be2d26e5d74)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 972b6306a6..939bef0ca9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "da52117f6cbb53b6242803d432e8649a964f0435"
-SRCREV_meta ?= "e335eb1ff7c2948e263b9d59f1664c5bf198e4cf"
+SRCREV_machine ?= "b62ae8bedb024e67e7c5cda51840454a4170c858"
+SRCREV_meta ?= "cf20a3c44f5ef181b16ed80e9c2683f76b1ead20"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.114"
+LINUX_VERSION ?= "5.4.116"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 3886388ea9..e3750dd7f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.114"
+LINUX_VERSION ?= "5.4.116"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "06631306658b18d4e29f721a43479d90effc3fc2"
-SRCREV_machine ?= "6d78e8ad5697bdad4bd76d0eeb44daca8cbe108d"
-SRCREV_meta ?= "e335eb1ff7c2948e263b9d59f1664c5bf198e4cf"
+SRCREV_machine_qemuarm ?= "80bd6016a9bdaed4b66ddffffa8c8e62d7c1f8a6"
+SRCREV_machine ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
+SRCREV_meta ?= "cf20a3c44f5ef181b16ed80e9c2683f76b1ead20"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index d2743638ad..38404a1935 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d62f2d60acebc640c2749532e1527d1f117003d6"
-SRCREV_machine_qemuarm64 ?= "6d78e8ad5697bdad4bd76d0eeb44daca8cbe108d"
-SRCREV_machine_qemumips ?= "ec6cca9ea72879a0d06ce1243e952a42a3435607"
-SRCREV_machine_qemuppc ?= "6d78e8ad5697bdad4bd76d0eeb44daca8cbe108d"
-SRCREV_machine_qemuriscv64 ?= "6d78e8ad5697bdad4bd76d0eeb44daca8cbe108d"
-SRCREV_machine_qemux86 ?= "6d78e8ad5697bdad4bd76d0eeb44daca8cbe108d"
-SRCREV_machine_qemux86-64 ?= "6d78e8ad5697bdad4bd76d0eeb44daca8cbe108d"
-SRCREV_machine_qemumips64 ?= "fd8bb72df12890ec21b27b83e26492ba527ebea3"
-SRCREV_machine ?= "6d78e8ad5697bdad4bd76d0eeb44daca8cbe108d"
-SRCREV_meta ?= "e335eb1ff7c2948e263b9d59f1664c5bf198e4cf"
+SRCREV_machine_qemuarm ?= "e71df0530eefcac1b3248329e385bcefbad6336e"
+SRCREV_machine_qemuarm64 ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
+SRCREV_machine_qemumips ?= "07445052fdd15e60b30dc5ae9d162c2e6bba47d1"
+SRCREV_machine_qemuppc ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
+SRCREV_machine_qemuriscv64 ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
+SRCREV_machine_qemux86 ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
+SRCREV_machine_qemux86-64 ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
+SRCREV_machine_qemumips64 ?= "b36d79d6f2aaf9dadec352f611e7b9becf2b9a55"
+SRCREV_machine ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
+SRCREV_meta ?= "cf20a3c44f5ef181b16ed80e9c2683f76b1ead20"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.114"
+LINUX_VERSION ?= "5.4.116"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.30.2

