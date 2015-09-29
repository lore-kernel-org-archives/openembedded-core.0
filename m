Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AE86377030
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 14:31:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8TEVc3S024857
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Sep 2015 07:31:38 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 29 Sep 2015 07:31:38 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 29 Sep 2015 10:31:33 -0400
Message-ID: <cc801c55d3f11d5f0c3745f3b3b70c073cb2b2c2.1443536748.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1443536748.git.bruce.ashfield@windriver.com>
References: <cover.1443536748.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/4.1: update to 4.1.8 -stable
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
X-List-Received-Date: Tue, 29 Sep 2015 14:31:41 -0000
Content-Type: text/plain

There are some important fixes and CVEs in 4.1.8, so we update the
SRCREVs to integrate the -stable changes.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 7a23e8fb20b1..a133b3bd972f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,13 +2,13 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "eefb205d7ff4afc66a95fd06d31d4e69c3deec39"
-SRCREV_meta ?= "d6b2416f396f03e73c1d53352ebd0acb6133e5ba"
+SRCREV_machine ?= "8a50af5664351a10657275e8f3196ae0aad04623"
+SRCREV_meta ?= "3d8f1378d07dbc052ca8a7c22297339ad7998b5e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.6"
+LINUX_VERSION ?= "4.1.8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 833b11b010af..84606cb52374 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.6"
+LINUX_VERSION ?= "4.1.8"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "79a31b9d23db126f8a6be3eb88fd683056a213f1"
-SRCREV_meta ?= "d6b2416f396f03e73c1d53352ebd0acb6133e5ba"
+SRCREV_machine ?= "cf940efcae03adea9f17be3a21406f7a2a385b72"
+SRCREV_meta ?= "3d8f1378d07dbc052ca8a7c22297339ad7998b5e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 0645134b023b..d01101a4ad94 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "4f5c95b0f19a1c1a24cc6aba4ce77a09fe740c42"
-SRCREV_machine_qemuarm64 ?= "79a31b9d23db126f8a6be3eb88fd683056a213f1"
-SRCREV_machine_qemumips ?= "fc6166e3ea7bb81c7285d3cfd79440cf054022f7"
-SRCREV_machine_qemuppc ?= "79a31b9d23db126f8a6be3eb88fd683056a213f1"
-SRCREV_machine_qemux86 ?= "79a31b9d23db126f8a6be3eb88fd683056a213f1"
-SRCREV_machine_qemux86-64 ?= "79a31b9d23db126f8a6be3eb88fd683056a213f1"
-SRCREV_machine_qemumips64 ?= "049105492e5657dd735bad1aa3a32f4f752a9edd"
-SRCREV_machine ?= "79a31b9d23db126f8a6be3eb88fd683056a213f1"
-SRCREV_meta ?= "d6b2416f396f03e73c1d53352ebd0acb6133e5ba"
+SRCREV_machine_qemuarm ?= "bbd539ee6f9c8e7871e9c55607dc15807e4da492"
+SRCREV_machine_qemuarm64 ?= "cf940efcae03adea9f17be3a21406f7a2a385b72"
+SRCREV_machine_qemumips ?= "8027a8514b7c56334ab2414b36f3eed751f1977d"
+SRCREV_machine_qemuppc ?= "cf940efcae03adea9f17be3a21406f7a2a385b72"
+SRCREV_machine_qemux86 ?= "cf940efcae03adea9f17be3a21406f7a2a385b72"
+SRCREV_machine_qemux86-64 ?= "cf940efcae03adea9f17be3a21406f7a2a385b72"
+SRCREV_machine_qemumips64 ?= "808d3efb9d8f94c0c5d3d316938679a7583f52ef"
+SRCREV_machine ?= "cf940efcae03adea9f17be3a21406f7a2a385b72"
+SRCREV_meta ?= "3d8f1378d07dbc052ca8a7c22297339ad7998b5e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.6"
+LINUX_VERSION ?= "4.1.8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.1.0


