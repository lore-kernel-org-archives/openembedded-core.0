Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5BF5C77211
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 18:16:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8CIGadF013612
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 12 Sep 2016 11:16:36 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 12 Sep 2016 11:16:36 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 12 Sep 2016 14:16:32 -0400
Message-ID: <411a0abe0dbbe9ef58f3df3805c9724584c38c64.1473704020.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1473704020.git.bruce.ashfield@windriver.com>
References: <cover.1473704020.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/4.4: update to 4.4.20
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
X-List-Received-Date: Mon, 12 Sep 2016 18:16:38 -0000
Content-Type: text/plain

Integrating the korg -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index e7057005d115..a97a14b66e32 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a52822c864c50cc5e42939d217a8559fbf853fde"
-SRCREV_meta ?= "59290c5f6192da2eccf478d37a8f9f88134822b3"
+SRCREV_machine ?= "76a02384d86df7b7499755f1650b5299740f5473"
+SRCREV_meta ?= "e66032e2d93da24c6b9137dbbe66008c77f6d4aa"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.18"
+LINUX_VERSION ?= "4.4.20"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index e73754519c6a..6befd233b317 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.18"
+LINUX_VERSION ?= "4.4.20"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a67e1ae4bf3570e93f8d8fe33b1830de058c1b72"
-SRCREV_meta ?= "59290c5f6192da2eccf478d37a8f9f88134822b3"
+SRCREV_machine ?= "7d1401a0dd9bebfe49937ca7d9785972e0cc76d0"
+SRCREV_meta ?= "e66032e2d93da24c6b9137dbbe66008c77f6d4aa"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 6e5a7c7920ab..ec493cbd55f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "2505d9c2441eb638d55b330144988d1730065074"
-SRCREV_machine_qemuarm64 ?= "a67e1ae4bf3570e93f8d8fe33b1830de058c1b72"
-SRCREV_machine_qemumips ?= "544caf9c03c40c2de6b93db9a767e568e0baaa8f"
-SRCREV_machine_qemuppc ?= "a67e1ae4bf3570e93f8d8fe33b1830de058c1b72"
-SRCREV_machine_qemux86 ?= "a67e1ae4bf3570e93f8d8fe33b1830de058c1b72"
-SRCREV_machine_qemux86-64 ?= "a67e1ae4bf3570e93f8d8fe33b1830de058c1b72"
-SRCREV_machine_qemumips64 ?= "c1b45251a5fabfb0f2aba3a0168d8a952a2cd827"
-SRCREV_machine ?= "a67e1ae4bf3570e93f8d8fe33b1830de058c1b72"
-SRCREV_meta ?= "59290c5f6192da2eccf478d37a8f9f88134822b3"
+SRCREV_machine_qemuarm ?= "a064c27e528be59412a892f3ed3ef8efe1f1d601"
+SRCREV_machine_qemuarm64 ?= "7d1401a0dd9bebfe49937ca7d9785972e0cc76d0"
+SRCREV_machine_qemumips ?= "d644de0138c623c2b5e8a6a143a24234fd2cfb27"
+SRCREV_machine_qemuppc ?= "7d1401a0dd9bebfe49937ca7d9785972e0cc76d0"
+SRCREV_machine_qemux86 ?= "7d1401a0dd9bebfe49937ca7d9785972e0cc76d0"
+SRCREV_machine_qemux86-64 ?= "7d1401a0dd9bebfe49937ca7d9785972e0cc76d0"
+SRCREV_machine_qemumips64 ?= "1fb08e61877b56fcbf800bfc66305b7a563c5f99"
+SRCREV_machine ?= "7d1401a0dd9bebfe49937ca7d9785972e0cc76d0"
+SRCREV_meta ?= "e66032e2d93da24c6b9137dbbe66008c77f6d4aa"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.18"
+LINUX_VERSION ?= "4.4.20"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


