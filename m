Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D79E560603
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 14:14:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jul 2018 07:14:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,427,1526367600"; d="scan'208";a="77507437"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 31 Jul 2018 07:14:29 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 1DBCF580114
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 07:14:28 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2018 17:15:45 +0300
Message-Id: <1533046545-18047-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] machine: remove kernel-modules from RRECOMMENDS
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
X-List-Received-Date: Tue, 31 Jul 2018 14:14:29 -0000

qemumips,qemumips64 and x86 based machines include kernel-modules by
default. Remove the kernel modules from RRECOMMENDS to make it consistent
across the machines.

Tested using core-image-sato on qemumips, qemumips64, qemux86 and
qemux86-64

[YOCTO #12383]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/conf/machine/include/x86-base.inc | 2 --
 meta/conf/machine/qemumips.conf        | 2 --
 meta/conf/machine/qemumips64.conf      | 2 --
 3 files changed, 6 deletions(-)

diff --git a/meta/conf/machine/include/x86-base.inc b/meta/conf/machine/include/x86-base.inc
index 0edcea7..be037be 100644
--- a/meta/conf/machine/include/x86-base.inc
+++ b/meta/conf/machine/include/x86-base.inc
@@ -8,8 +8,6 @@
 MACHINE_FEATURES += "screen keyboard pci usbhost ext2 ext3 x86 \
                      acpi serial usbgadget alsa"
 
-MACHINE_EXTRA_RRECOMMENDS += "kernel-modules"
-
 IMAGE_FSTYPES ?= "hddimg"
 
 KERNEL_IMAGETYPE ?= "bzImage"
diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
index 986315a..a60f67a 100644
--- a/meta/conf/machine/qemumips.conf
+++ b/meta/conf/machine/qemumips.conf
@@ -10,5 +10,3 @@ KERNEL_IMAGETYPE = "vmlinux"
 KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
 
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
-
-MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qemumips64.conf
index 3f91cbe..a166a10 100644
--- a/meta/conf/machine/qemumips64.conf
+++ b/meta/conf/machine/qemumips64.conf
@@ -10,5 +10,3 @@ KERNEL_IMAGETYPE = "vmlinux"
 KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
 
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
-
-MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
-- 
2.4.0


