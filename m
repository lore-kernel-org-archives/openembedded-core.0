Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 95AD560248
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 15:56:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5DFucTb005631
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Jun 2016 08:56:39 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 13 Jun 2016 08:56:38 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 13 Jun 2016 11:56:31 -0400
Message-ID: <37e4997a092977056993db0115d613ef28ec588e.1465833140.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1465833140.git.bruce.ashfield@windriver.com>
References: <cover.1465833140.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] linux-yocto/4.1: bump to v4.1.26
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
X-List-Received-Date: Mon, 13 Jun 2016 15:56:39 -0000
Content-Type: text/plain

Integrating the 4.1.25 and 4.1.26 stable releases.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 8e9b5c2df035..7cd18e0c7b66 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "86876311e39eadc80c342a619906cb001ed1df0d"
-SRCREV_meta ?= "f0c7ef844e98c82db9ee90e20c0eff6596919ff5"
+SRCREV_machine ?= "ec9e847b58017b62931bc4fbf7c968da5b0297cf"
+SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.24"
+LINUX_VERSION ?= "4.1.26"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index c48e2a649435..5b1b87f82840 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.24"
+LINUX_VERSION ?= "4.1.26"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b4acdc6d1ea9474453689e5f604dd7037cbb5033"
-SRCREV_meta ?= "f0c7ef844e98c82db9ee90e20c0eff6596919ff5"
+SRCREV_machine ?= "f1069e0dbbc09f930ba8941e38859378ccc22f96"
+SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 9e83d76f80cd..4023c9b98ece 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ec626d56541042b8bcc52c47891dd8acedb326c7"
-SRCREV_machine_qemuarm64 ?= "b4acdc6d1ea9474453689e5f604dd7037cbb5033"
-SRCREV_machine_qemumips ?= "95866476d89898fdb61804029352af74daa4a30d"
-SRCREV_machine_qemuppc ?= "b4acdc6d1ea9474453689e5f604dd7037cbb5033"
-SRCREV_machine_qemux86 ?= "b4acdc6d1ea9474453689e5f604dd7037cbb5033"
-SRCREV_machine_qemux86-64 ?= "b4acdc6d1ea9474453689e5f604dd7037cbb5033"
-SRCREV_machine_qemumips64 ?= "9824fc2399454b9c521b0b1bde075ac862357d41"
-SRCREV_machine ?= "b4acdc6d1ea9474453689e5f604dd7037cbb5033"
-SRCREV_meta ?= "f0c7ef844e98c82db9ee90e20c0eff6596919ff5"
+SRCREV_machine_qemuarm ?= "fa1f75003687404ebe8a07c967db1714c700f9ff"
+SRCREV_machine_qemuarm64 ?= "f1069e0dbbc09f930ba8941e38859378ccc22f96"
+SRCREV_machine_qemumips ?= "0e2b4693ec90691494752ff7854493f3c7f3fc2f"
+SRCREV_machine_qemuppc ?= "f1069e0dbbc09f930ba8941e38859378ccc22f96"
+SRCREV_machine_qemux86 ?= "f1069e0dbbc09f930ba8941e38859378ccc22f96"
+SRCREV_machine_qemux86-64 ?= "f1069e0dbbc09f930ba8941e38859378ccc22f96"
+SRCREV_machine_qemumips64 ?= "ca5c9e5ee5e3b569a55beb05e2f81078d3db2cef"
+SRCREV_machine ?= "f1069e0dbbc09f930ba8941e38859378ccc22f96"
+SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.24"
+LINUX_VERSION ?= "4.1.26"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


