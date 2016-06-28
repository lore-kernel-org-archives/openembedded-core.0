Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CA12373181
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 02:41:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5S2fCFF023823
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 27 Jun 2016 19:41:13 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 27 Jun 2016 19:41:12 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 27 Jun 2016 22:41:02 -0400
Message-ID: <6d6148a59e05fcf3e97fe6edafc871fbd7bee05a.1467081585.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1467081584.git.bruce.ashfield@windriver.com>
References: <cover.1467081584.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] linux-yocto/4.1/4.4: tpm, telemetry, acpi and cpuid changes
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
X-List-Received-Date: Tue, 28 Jun 2016 02:41:13 -0000
Content-Type: text/plain

Backporting mainline and development commits to for various subystems.

linux-yocto: 4.4:
  ae6a527d93f i2c: add support for ACPI reconfigure notifications
  f2422e12af53 acpi: add support for ACPI reconfiguration notifiers
  bc87718fdb56 acpi: fix enumeration (visited) flags for bus rescans

linux-yocto: 4.1:
  9f166e918f63 platform:x86 decouple telemetry driver from the optional IPC resources
  adfc21c1f156 tpm: update PPI documentation to address the location change.
  661b0190e412 x86 tsc: enumerate BXT tsc_khz via CPUID
  78be69fa9d15 x86 tsc: enumerate SKL cpu_khz and tsc_khz via CPUID

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
Signed-off-by: Yu, Ong Hock <ong.hock.yu@intel.com>
Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 420fd74570e5..1b9154f8fe5d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "65ea19da3cd94bb44de4b1dd5419ecc385e4e27d"
-SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
+SRCREV_machine ?= "68484fa68d060d947fc46b2e85c0c6f2381d3e55"
+SRCREV_meta ?= "20edcbf4e42dd4cef7213a0ce2a4481d8d296f5d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 9cb41ba78102..1757efd02f21 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.1.26"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "fb0153332a1fdd0518f9055ece1c53f3a99973f5"
-SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
+SRCREV_machine ?= "9f166e918f63dd7214ad0388d64709d33f2a14a3"
+SRCREV_meta ?= "20edcbf4e42dd4cef7213a0ce2a4481d8d296f5d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 44e9d202ea56..d3a4a66afaa6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a38cb0352686c01aabf2c81d2dfc823208635af0"
-SRCREV_machine_qemuarm64 ?= "fb0153332a1fdd0518f9055ece1c53f3a99973f5"
-SRCREV_machine_qemumips ?= "482dc5fa137bb48f4198c81825499c2d505a226c"
-SRCREV_machine_qemuppc ?= "fb0153332a1fdd0518f9055ece1c53f3a99973f5"
-SRCREV_machine_qemux86 ?= "fb0153332a1fdd0518f9055ece1c53f3a99973f5"
-SRCREV_machine_qemux86-64 ?= "fb0153332a1fdd0518f9055ece1c53f3a99973f5"
-SRCREV_machine_qemumips64 ?= "f5489ee8c9420f67d91e95e19f57deda989bc829"
-SRCREV_machine ?= "fb0153332a1fdd0518f9055ece1c53f3a99973f5"
-SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
+SRCREV_machine_qemuarm ?= "df8f2bd306f5e22590991faee46e28f671fa19b3"
+SRCREV_machine_qemuarm64 ?= "9f166e918f63dd7214ad0388d64709d33f2a14a3"
+SRCREV_machine_qemumips ?= "1bb60e693b913dacad698bec1cc08b350785e3d1"
+SRCREV_machine_qemuppc ?= "9f166e918f63dd7214ad0388d64709d33f2a14a3"
+SRCREV_machine_qemux86 ?= "9f166e918f63dd7214ad0388d64709d33f2a14a3"
+SRCREV_machine_qemux86-64 ?= "9f166e918f63dd7214ad0388d64709d33f2a14a3"
+SRCREV_machine_qemumips64 ?= "b0e7bb69566a922a661c4902e496dce98cefeab9"
+SRCREV_machine ?= "9f166e918f63dd7214ad0388d64709d33f2a14a3"
+SRCREV_meta ?= "20edcbf4e42dd4cef7213a0ce2a4481d8d296f5d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
-- 
2.5.0


