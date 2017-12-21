Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1561078887
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 15:49:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBLFnR8K026834
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Dec 2017 07:49:27 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 21 Dec 2017 07:49:26 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 21 Dec 2017 10:49:15 -0500
Message-ID: <1de022c1d27956c70ca6abad6687b5746469b894.1513871125.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1513871125.git.bruce.ashfield@windriver.com>
References: <cover.1513871125.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] linux-yocto/4.x: configuration updates
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
X-List-Received-Date: Thu, 21 Dec 2017 15:49:26 -0000
Content-Type: text/plain

Integrating the following configuration changes to the 4.x linux
yocto kernels:

  common-pc*.scc: Add igb to common-pc drivers
  mti-malta32: enable CONFIG_HIGHMEM for qemumips to support up to 2GiB RAM
  features/i915/i915.cfg: compile i915 as a module

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
index f93d9530ebc5..fd31bf986c27 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "c1d8c4408b8aedd88eeb6ccc89ce834dd41b3f09"
-SRCREV_meta ?= "40ee48ac099c04f60d2c132031d9625a4e0c4c9e"
+SRCREV_meta ?= "1d9a8200184af22f8981fa24b0e82af49c7988dd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index e1bf32fdd24c..d225339c144b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d256d615488efc2d0b26f3eff206c6bfa765b339"
-SRCREV_meta ?= "10f8ed198a4188625c9b5ac59de4d691b56a2617"
+SRCREV_machine ?= "fef0184c3c1bcac27fe579bf2643c50bf861e40d"
+SRCREV_meta ?= "4553798a3e73b0791f4d5065ec5ad4b45027914f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
index edaf8530279d..b223497693cd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "c1d8c4408b8aedd88eeb6ccc89ce834dd41b3f09"
-SRCREV_meta ?= "40ee48ac099c04f60d2c132031d9625a4e0c4c9e"
+SRCREV_meta ?= "1d9a8200184af22f8981fa24b0e82af49c7988dd"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 704e6758dad9..7effda2febbd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "5174e51fa08d0942ddcf8b19540e90ec10eeb621"
-SRCREV_meta ?= "10f8ed198a4188625c9b5ac59de4d691b56a2617"
+SRCREV_meta ?= "4553798a3e73b0791f4d5065ec5ad4b45027914f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.10.bb b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
index 7fcc753a705c..1fe3cca2ab42 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "c1d8c4408b8aedd88eeb6ccc89ce834dd41b3f09"
 SRCREV_machine_qemux86-64 ?= "c1d8c4408b8aedd88eeb6ccc89ce834dd41b3f09"
 SRCREV_machine_qemumips64 ?= "8bb135e71037c46175bbcc7acf387309b2e17133"
 SRCREV_machine ?= "c1d8c4408b8aedd88eeb6ccc89ce834dd41b3f09"
-SRCREV_meta ?= "40ee48ac099c04f60d2c132031d9625a4e0c4c9e"
+SRCREV_meta ?= "1d9a8200184af22f8981fa24b0e82af49c7988dd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index 9ddaec7d3f9d..82d9e4f11c69 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "5174e51fa08d0942ddcf8b19540e90ec10eeb621"
 SRCREV_machine_qemux86-64 ?= "5174e51fa08d0942ddcf8b19540e90ec10eeb621"
 SRCREV_machine_qemumips64 ?= "db1b582e665b95ddf87b75acce3a42660289d4ca"
 SRCREV_machine ?= "5174e51fa08d0942ddcf8b19540e90ec10eeb621"
-SRCREV_meta ?= "10f8ed198a4188625c9b5ac59de4d691b56a2617"
+SRCREV_meta ?= "4553798a3e73b0791f4d5065ec5ad4b45027914f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-- 
2.5.0


