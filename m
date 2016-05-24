Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8B96FF69
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 15:54:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4OFs2f4011218
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 May 2016 08:54:02 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 24 May 2016 08:54:01 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 24 May 2016 11:53:58 -0400
Message-ID: <3fe63bde9a63495e378951361c866fb6b7c947e9.1464105119.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1464105119.git.bruce.ashfield@windriver.com>
References: <cover.1464105119.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/4.1: v4.1.24 and gcc6 powerpc fixes
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
X-List-Received-Date: Tue, 24 May 2016 15:54:04 -0000
Content-Type: text/plain

Bumping to the v4.1.24 -stable release, and backporting a ppc
gcc6 fix from the 4.4 kernel.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 090f8f3310b0..51fa3adeb209 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "51cca91a1f74dab225598282019f0d694abdc4a0"
-SRCREV_meta ?= "2bdebd11f1a0bc00071ec1467289a7feb5418dde"
+SRCREV_machine ?= "320892013ad33ab41f530ad321939aec07d09d22"
+SRCREV_meta ?= "d6e1f4bfc254c677a8dfef92f0ad8c78bdeeea75"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.22"
+LINUX_VERSION ?= "4.1.24"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 04853a9aa61b..35a76ef0cd07 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.22"
+LINUX_VERSION ?= "4.1.24"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d03753ddb28a1141e550a67c99ac95789a424fc5"
-SRCREV_meta ?= "2bdebd11f1a0bc00071ec1467289a7feb5418dde"
+SRCREV_machine ?= "ecc983477682203619da0e456fa4a8689ac41097"
+SRCREV_meta ?= "d6e1f4bfc254c677a8dfef92f0ad8c78bdeeea75"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 5d6bd3d31fa6..2332e11f42ed 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "f781d64949f776cbfa5274a548becdcf6b596341"
-SRCREV_machine_qemuarm64 ?= "d03753ddb28a1141e550a67c99ac95789a424fc5"
-SRCREV_machine_qemumips ?= "192043960081896baaa24c2af702c7124bfe4286"
-SRCREV_machine_qemuppc ?= "d03753ddb28a1141e550a67c99ac95789a424fc5"
-SRCREV_machine_qemux86 ?= "d03753ddb28a1141e550a67c99ac95789a424fc5"
-SRCREV_machine_qemux86-64 ?= "d03753ddb28a1141e550a67c99ac95789a424fc5"
-SRCREV_machine_qemumips64 ?= "351bc6968f63ea6f27cbd7f1678ddc53a9168fd1"
-SRCREV_machine ?= "d03753ddb28a1141e550a67c99ac95789a424fc5"
-SRCREV_meta ?= "2bdebd11f1a0bc00071ec1467289a7feb5418dde"
+SRCREV_machine_qemuarm ?= "d11c336b38ab0d4e55eb683aca5ca9c6b6cd8b42"
+SRCREV_machine_qemuarm64 ?= "ecc983477682203619da0e456fa4a8689ac41097"
+SRCREV_machine_qemumips ?= "f8e363f638b283738369155b4a9990b5d0f902a7"
+SRCREV_machine_qemuppc ?= "ecc983477682203619da0e456fa4a8689ac41097"
+SRCREV_machine_qemux86 ?= "ecc983477682203619da0e456fa4a8689ac41097"
+SRCREV_machine_qemux86-64 ?= "ecc983477682203619da0e456fa4a8689ac41097"
+SRCREV_machine_qemumips64 ?= "1db47ec6c39071b29f82a040b9b9a81584f50461"
+SRCREV_machine ?= "ecc983477682203619da0e456fa4a8689ac41097"
+SRCREV_meta ?= "d6e1f4bfc254c677a8dfef92f0ad8c78bdeeea75"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.22"
+LINUX_VERSION ?= "4.1.24"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


