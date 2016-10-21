Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8E20160603
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 12:48:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9LCmlPX002379
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Oct 2016 05:48:47 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 21 Oct 2016 05:48:46 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 21 Oct 2016 08:48:46 -0400
Message-ID: <1477054126-23044-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/4.8: update to v4.8.3
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
X-List-Received-Date: Fri, 21 Oct 2016 12:48:47 -0000
Content-Type: text/plain

Integrating the korg -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index fc1c40caf7b2..00c3d2c7bc1f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b266f7ba78f0cb3d7073e1bf7bd7dfc92bec7431"
-SRCREV_meta ?= "552a83790b1797b6dd4e4c48ff5bc8f215ed57da"
+SRCREV_machine ?= "320bceb35315d118c1e209effd441eb8a8dbad57"
+SRCREV_meta ?= "6d028d2818603cd82cfb707b3231b8a9038f13bb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8"
+LINUX_VERSION ?= "4.8.3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 41ff5637ec59..799c3f37577d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.8"
+LINUX_VERSION ?= "4.8.3"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
-SRCREV_meta ?= "552a83790b1797b6dd4e4c48ff5bc8f215ed57da"
+SRCREV_machine ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
+SRCREV_meta ?= "6d028d2818603cd82cfb707b3231b8a9038f13bb"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index 5738f4974b9b..56fbfc7001bf 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "f46e49344b4c66a6f0917c5a2e9a1d146176519d"
-SRCREV_machine_qemuarm64 ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
-SRCREV_machine_qemumips ?= "5a299402ae58d61429ab091f94748550efe45858"
-SRCREV_machine_qemuppc ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
-SRCREV_machine_qemux86 ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
-SRCREV_machine_qemux86-64 ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
-SRCREV_machine_qemumips64 ?= "674818dad577cdfc23c6c857aa2b769fc64e379c"
-SRCREV_machine ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
-SRCREV_meta ?= "552a83790b1797b6dd4e4c48ff5bc8f215ed57da"
+SRCREV_machine_qemuarm ?= "4cc544ad09ad704322cb66fe4ba197a6a05dc71f"
+SRCREV_machine_qemuarm64 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
+SRCREV_machine_qemumips ?= "c285969d4f9376a671167ecf397578c8ad3e6a75"
+SRCREV_machine_qemuppc ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
+SRCREV_machine_qemux86 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
+SRCREV_machine_qemux86-64 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
+SRCREV_machine_qemumips64 ?= "64f96ba530e58456070f26b0f3fcce3f64988b72"
+SRCREV_machine ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
+SRCREV_meta ?= "6d028d2818603cd82cfb707b3231b8a9038f13bb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8"
+LINUX_VERSION ?= "4.8.3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


