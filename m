Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7EAD860017
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 08:15:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u568FZwx003257
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 6 Jun 2016 01:15:35 -0700
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.21.120) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 6 Jun 2016 01:15:33 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 6 Jun 2016 04:15:27 -0400
Message-ID: <e3021674ab7611633169d280eb0f03c6fde0490b.1465200824.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1465200824.git.bruce.ashfield@windriver.com>
References: <cover.1465200824.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/4.4: bump to v4.4.12
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
X-List-Received-Date: Mon, 06 Jun 2016 08:15:38 -0000
Content-Type: text/plain

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index f09d8f41a727..b887bf49262c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -12,12 +12,12 @@ python () {
 }
 
 SRCREV_machine ?= "3bdc347cc2087a0217e3acddccda5bb775cd570b"
-SRCREV_meta ?= "3a5f494784591e01f0ae7ab748e8190582c16e8c"
+SRCREV_meta ?= "8900370d334ab4f7224fa71d7d46d62f0b11199d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.11"
+LINUX_VERSION ?= "4.4.12"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index d69615f05b18..95df10184463 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.11"
+LINUX_VERSION ?= "4.4.12"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "53e84104c5e68eb468823dd0d262a64623d01a55"
-SRCREV_meta ?= "3a5f494784591e01f0ae7ab748e8190582c16e8c"
+SRCREV_machine ?= "8149f5840e938ff5a0e595bac2f7502a2a9bcb40"
+SRCREV_meta ?= "8900370d334ab4f7224fa71d7d46d62f0b11199d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 5bfc27d1e58f..cf3df6e6feda 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b74c7523581ab748dfe475af384fcb40c4542d31"
-SRCREV_machine_qemuarm64 ?= "53e84104c5e68eb468823dd0d262a64623d01a55"
-SRCREV_machine_qemumips ?= "f5f23899a4afb7f095a480652edc082d6bd545b2"
-SRCREV_machine_qemuppc ?= "53e84104c5e68eb468823dd0d262a64623d01a55"
-SRCREV_machine_qemux86 ?= "53e84104c5e68eb468823dd0d262a64623d01a55"
-SRCREV_machine_qemux86-64 ?= "53e84104c5e68eb468823dd0d262a64623d01a55"
-SRCREV_machine_qemumips64 ?= "7ce6e58742b2f1f79cc8b1a1fff8bc408a3b585e"
-SRCREV_machine ?= "53e84104c5e68eb468823dd0d262a64623d01a55"
-SRCREV_meta ?= "3a5f494784591e01f0ae7ab748e8190582c16e8c"
+SRCREV_machine_qemuarm ?= "45b01a52f2a1593f7858cff130811c587d9623a9"
+SRCREV_machine_qemuarm64 ?= "8149f5840e938ff5a0e595bac2f7502a2a9bcb40"
+SRCREV_machine_qemumips ?= "46a71bdb936b8a5db5e85dfcc82fa6121d9aa2e5"
+SRCREV_machine_qemuppc ?= "8149f5840e938ff5a0e595bac2f7502a2a9bcb40"
+SRCREV_machine_qemux86 ?= "8149f5840e938ff5a0e595bac2f7502a2a9bcb40"
+SRCREV_machine_qemux86-64 ?= "8149f5840e938ff5a0e595bac2f7502a2a9bcb40"
+SRCREV_machine_qemumips64 ?= "9ee2a571138d4ca993ce03ce753c1cb776fdd441"
+SRCREV_machine ?= "8149f5840e938ff5a0e595bac2f7502a2a9bcb40"
+SRCREV_meta ?= "8900370d334ab4f7224fa71d7d46d62f0b11199d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.11"
+LINUX_VERSION ?= "4.4.12"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


