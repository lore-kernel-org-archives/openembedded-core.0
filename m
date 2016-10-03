Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D2B47199D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 05:54:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u935shm6006008
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Oct 2016 22:54:43 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 2 Oct 2016 22:54:42 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 3 Oct 2016 01:54:32 -0400
Message-ID: <7c295ea1d075a60170bf9e46a77a05423f2c8f35.1475473494.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1475473494.git.bruce.ashfield@windriver.com>
References: <cover.1475473494.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] linux-yocto/4.4: update to v4.4.22
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
X-List-Received-Date: Mon, 03 Oct 2016 05:54:43 -0000
Content-Type: text/plain

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index a97a14b66e32..5416ca499bc4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "76a02384d86df7b7499755f1650b5299740f5473"
-SRCREV_meta ?= "e66032e2d93da24c6b9137dbbe66008c77f6d4aa"
+SRCREV_machine ?= "a1da5707fd13f31d25661b910c7377c8714c1123"
+SRCREV_meta ?= "170ed03a9d908e2abc8025cf9a62789ab15b3ece"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.20"
+LINUX_VERSION ?= "4.4.22"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 6befd233b317..e7e48adc4de3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.20"
+LINUX_VERSION ?= "4.4.22"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "7d1401a0dd9bebfe49937ca7d9785972e0cc76d0"
-SRCREV_meta ?= "e66032e2d93da24c6b9137dbbe66008c77f6d4aa"
+SRCREV_machine ?= "0ef03dcfb96805e6bcf82989f1c8fed1b488d00a"
+SRCREV_meta ?= "170ed03a9d908e2abc8025cf9a62789ab15b3ece"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index ec493cbd55f1..5cafa9166a23 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a064c27e528be59412a892f3ed3ef8efe1f1d601"
-SRCREV_machine_qemuarm64 ?= "7d1401a0dd9bebfe49937ca7d9785972e0cc76d0"
-SRCREV_machine_qemumips ?= "d644de0138c623c2b5e8a6a143a24234fd2cfb27"
-SRCREV_machine_qemuppc ?= "7d1401a0dd9bebfe49937ca7d9785972e0cc76d0"
-SRCREV_machine_qemux86 ?= "7d1401a0dd9bebfe49937ca7d9785972e0cc76d0"
-SRCREV_machine_qemux86-64 ?= "7d1401a0dd9bebfe49937ca7d9785972e0cc76d0"
-SRCREV_machine_qemumips64 ?= "1fb08e61877b56fcbf800bfc66305b7a563c5f99"
-SRCREV_machine ?= "7d1401a0dd9bebfe49937ca7d9785972e0cc76d0"
-SRCREV_meta ?= "e66032e2d93da24c6b9137dbbe66008c77f6d4aa"
+SRCREV_machine_qemuarm ?= "22a817dc851fac7ec9369c29b3a2803ec92781fb"
+SRCREV_machine_qemuarm64 ?= "0ef03dcfb96805e6bcf82989f1c8fed1b488d00a"
+SRCREV_machine_qemumips ?= "c1794372ab031297d1c4482d982e143386c247ea"
+SRCREV_machine_qemuppc ?= "0ef03dcfb96805e6bcf82989f1c8fed1b488d00a"
+SRCREV_machine_qemux86 ?= "0ef03dcfb96805e6bcf82989f1c8fed1b488d00a"
+SRCREV_machine_qemux86-64 ?= "0ef03dcfb96805e6bcf82989f1c8fed1b488d00a"
+SRCREV_machine_qemumips64 ?= "ab08db0be1aec0daa5ac134fe1abcd6eba47b275"
+SRCREV_machine ?= "0ef03dcfb96805e6bcf82989f1c8fed1b488d00a"
+SRCREV_meta ?= "170ed03a9d908e2abc8025cf9a62789ab15b3ece"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.20"
+LINUX_VERSION ?= "4.4.22"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


