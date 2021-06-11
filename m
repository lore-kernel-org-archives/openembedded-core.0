Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.4062.1623383461856029952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 20:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Tu5zn7m1iFxym2jhQDQAkzJDfACjvJKSAC6k/LgkMSr2t/TjctPDYQ+8n4O+WvUjNLrvGsaQeV
 fSZtlMZfrhGg==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="192566018"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="192566018"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 20:51:02 -0700
IronPort-SDR: Ks0hcchazdHrtuPkJIapNWPL9ZX+6XogG8H3Qzf8ECk7M7HNKjMnoPthYhaDbopB5juDUjyxU6
 oh0bkdagKFmg==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="403091601"
Received: from dlau-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.151.154])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 20:51:01 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 05/17] linux-yocto/5.10: update to v5.10.35
Date: Fri, 11 Jun 2021 11:50:38 +0800
Message-Id: <28410e7d84f71feb64d82461bf04364cb226eb4a.1623383318.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623383318.git.anuj.mittal@intel.com>
References: <cover.1623383318.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    f53a3a480862 Linux 5.10.35
    94c76056fc3f vfio: Depend on MMU
    4348d3b5027b perf/core: Fix unconditional security_locked_down() call
    399f9c18473c platform/x86: thinkpad_acpi: Correct thermal sensor allocation
    ac2cd82c7609 USB: Add reset-resume quirk for WD19's Realtek Hub
    d844aaa49ac8 USB: Add LPM quirk for Lenovo ThinkPad USB-C Dock Gen2 Ethernet
    59b3f88386b5 ALSA: usb-audio: Add MIDI quirk for Vox ToneLab EX
    27c1936af506 ovl: allow upperdir inside lowerdir
    71d58457a8af ovl: fix leaked dentry
    2fa0387fa2d0 nvme-pci: set min_align_mask
    f8e71c667ee1 swiotlb: respect min_align_mask
    85a5a6875ca9 swiotlb: don't modify orig_addr in swiotlb_tbl_sync_single
    25ed8827cfbf swiotlb: refactor swiotlb_tbl_map_single
    9efd5df078a7 swiotlb: clean up swiotlb_tbl_unmap_single
    1f2ef5a0f771 swiotlb: factor out a nr_slots helper
    1bbcc985d195 swiotlb: factor out an io_tlb_offset helper
    22163a8ec863 swiotlb: add a IO_TLB_SIZE define
    2e8b3b0b8e2d driver core: add a min_align_mask field to struct device_dma_parameters
    6995512a472f tools/cgroup/slabinfo.py: updated to work on current kernel
    a7c37332afa8 perf ftrace: Fix access to pid in array when setting a pid filter
    fb4c1c2e9fd1 capabilities: require CAP_SETFCAP to map uid 0
    b571a6302a64 perf data: Fix error return code in perf_data__create_dir()
    48ec949ac979 net: qrtr: Avoid potential use after free in MHI send
    2fa15d61e4cb bpf: Fix leakage of uninitialized bpf stack under speculation
    2cfa537674cd bpf: Fix masking negation logic upon negative dst register
    a41c193d004e igb: Enable RSS for Intel I211 Ethernet Controller
    2e68890993d0 net: usb: ax88179_178a: initialize local variables before use
    d3598eb3915c netfilter: conntrack: Make global sysctls readonly in non-init netns
    c239bfc2e4ac mips: Do not include hi and lo in clobber list for R6

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 767e6755740204981e5789b7a3066eac855605e8)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 08314ea03e..69571df047 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "400fbf5b14a0c88afb7c31d65be56fb9d6214c81"
-SRCREV_meta ?= "38eb7ca3f4b59339c57a04c310f20809b198fa91"
+SRCREV_machine ?= "eb1ac5022eed244fb3943b3e48b48bc863aaf5a3"
+SRCREV_meta ?= "50c2d69f24f02336c9c6d65c3201d1d6dd105f52"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.34"
+LINUX_VERSION ?= "5.10.35"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 8bd674f116..2e0d1b20d4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.34"
+LINUX_VERSION ?= "5.10.35"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "bf33b78f5136873b6d2ec6274908cf688341bc9e"
-SRCREV_machine ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
-SRCREV_meta ?= "38eb7ca3f4b59339c57a04c310f20809b198fa91"
+SRCREV_machine_qemuarm ?= "5bd2421ef6048de205cd3a86c6f14b6296dc79d9"
+SRCREV_machine ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
+SRCREV_meta ?= "50c2d69f24f02336c9c6d65c3201d1d6dd105f52"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 2e7a452495..cf6d19010a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "78e8e722eec4434024c5db3e0d59da0b128c7647"
-SRCREV_machine_qemuarm64 ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
-SRCREV_machine_qemumips ?= "b5c0852a90709e77f7a3d185d1745e6a1f66b77c"
-SRCREV_machine_qemuppc ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
-SRCREV_machine_qemuriscv64 ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
-SRCREV_machine_qemuriscv32 ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
-SRCREV_machine_qemux86 ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
-SRCREV_machine_qemux86-64 ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
-SRCREV_machine_qemumips64 ?= "bf264e264d2141a4fb61d515573c27935e67ecfa"
-SRCREV_machine ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
-SRCREV_meta ?= "38eb7ca3f4b59339c57a04c310f20809b198fa91"
+SRCREV_machine_qemuarm ?= "71d9798b63a9d5a62708f746bb0a53583a8dfb5d"
+SRCREV_machine_qemuarm64 ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
+SRCREV_machine_qemumips ?= "4bad40a510831446b777042df43e349989ecbef7"
+SRCREV_machine_qemuppc ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
+SRCREV_machine_qemuriscv64 ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
+SRCREV_machine_qemuriscv32 ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
+SRCREV_machine_qemux86 ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
+SRCREV_machine_qemux86-64 ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
+SRCREV_machine_qemumips64 ?= "554408244bec4f2121f4ec63b170ca38430b8f9b"
+SRCREV_machine ?= "24719054cf85a9c66df020b10b6d2b7c6926a4e6"
+SRCREV_meta ?= "50c2d69f24f02336c9c6d65c3201d1d6dd105f52"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.34"
+LINUX_VERSION ?= "5.10.35"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.31.1

