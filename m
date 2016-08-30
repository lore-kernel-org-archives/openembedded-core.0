Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3533260797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 16:49:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7UGnMds014250
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Aug 2016 09:49:22 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 30 Aug 2016 09:49:21 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 30 Aug 2016 12:49:07 -0400
Message-ID: <a17f05c7987ad332bd073637ac78c219b7826e5f.1472574514.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1472574514.git.bruce.ashfield@windriver.com>
References: <cover.1472574514.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] linux-yocto/4.x: configuration updates
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
X-List-Received-Date: Tue, 30 Aug 2016 16:49:22 -0000
Content-Type: text/plain

Integrating a series to expliclity set the quark build to 32 bits
and avoid 64 bit x86 defaults.

We also have a series of commits that fix configuration warnings on
x86 platforms:

 intel-quark.cfg: Explicitly disable CONFIG_64BIT
 common-pc-drivers.cfg: Remove I2O configs
 features: Fix dependencies and =m vs =y discrepancies for corei7
 intel-core2-32.cfg: Explicitly disable CONFIG_64BIT
 features: Add 6lowpan feature and add it where necessary

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index c31692614d01..9a4a2ff7897e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "b88e2b5805213daeb0136fdd8c840dc0254a3d21"
-SRCREV_meta ?= "3e7c4fbbbc0ca217ddb3d3ee5235d5ad582e0c56"
+SRCREV_meta ?= "f7984d610b3e0dcffc52db019400ebce53ae28d7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 9b0a44b79166..fc0e2a431e0a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "9135adcfb01432abe4a95a50fca5d0395239f798"
-SRCREV_meta ?= "6a12efcabe8d48e323afd277fa672eae9b7e12c2"
+SRCREV_meta ?= "698835841165b68089604398f68fd8bc3f79cb65"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 72aac116905e..7fe2bde3a96f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
-SRCREV_meta ?= "3e7c4fbbbc0ca217ddb3d3ee5235d5ad582e0c56"
+SRCREV_meta ?= "f7984d610b3e0dcffc52db019400ebce53ae28d7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 114bd746d64b..1334a8606e34 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "0a0c93f29c0d65c00abdd2f6d1eb89134fae9525"
-SRCREV_meta ?= "6a12efcabe8d48e323afd277fa672eae9b7e12c2"
+SRCREV_meta ?= "698835841165b68089604398f68fd8bc3f79cb65"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 6b75a8a6892b..b7e7e7d4fa65 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
 SRCREV_machine_qemux86-64 ?= "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
 SRCREV_machine_qemumips64 ?= "106ed721d21c595dfb993a8990c3a29830dfc166"
 SRCREV_machine ?= "0847ed67f89b5a8bbaaa0a7b6cfa2a99ef34834f"
-SRCREV_meta ?= "3e7c4fbbbc0ca217ddb3d3ee5235d5ad582e0c56"
+SRCREV_meta ?= "f7984d610b3e0dcffc52db019400ebce53ae28d7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index f45007a361f2..8661452c74fa 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "0a0c93f29c0d65c00abdd2f6d1eb89134fae9525"
 SRCREV_machine_qemux86-64 ?= "0a0c93f29c0d65c00abdd2f6d1eb89134fae9525"
 SRCREV_machine_qemumips64 ?= "aa125473aef74e7731b14f6b56c1b50589fcd668"
 SRCREV_machine ?= "0a0c93f29c0d65c00abdd2f6d1eb89134fae9525"
-SRCREV_meta ?= "6a12efcabe8d48e323afd277fa672eae9b7e12c2"
+SRCREV_meta ?= "698835841165b68089604398f68fd8bc3f79cb65"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


