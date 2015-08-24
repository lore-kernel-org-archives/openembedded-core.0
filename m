Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2EC276AC1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 13:51:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7ODpRYp005929
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Aug 2015 06:51:28 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 24 Aug 2015 06:51:27 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 24 Aug 2015 09:51:21 -0400
Message-ID: <a25c67ee0ae628d791fad6a5ca6641046f94ad8a.1440424002.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1440424002.git.bruce.ashfield@windriver.com>
References: <cover.1440424002.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-yocto/4.1: quark configuration and thermal support
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
X-List-Received-Date: Mon, 24 Aug 2015 13:51:29 -0000
Content-Type: text/plain

Updating the 4.1 SRECREVs to reflect the following changes:

  74159a303c21 thermal: intel Quark SoC X1000 DTS thermal driver

  833214b33303 intel-quark-tiny: Add tiny KTYPE .scc file
  45ecab18d462 amd.cfg: Add X86_AMD_PLAFORM_DEVICE to default
  9a31d2cbc251 intel-quark-standard: add mass storage and boot live support
  4ea43922558a bsp: add coretemp to intel-common-drivers

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 848bc965a0b0..3473316d91eb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,8 +2,8 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "fe1ee443489d4ab5ce04c903b0362ae565547bd1"
-SRCREV_meta ?= "4ea43922558a9032af33ea42ea74ac02416079e7"
+SRCREV_machine ?= "74159a303c210bca8ea5c5636fc5b17d47e51aa1"
+SRCREV_meta ?= "833214b33303ecde02fdcd1a9bc7901ded6a7976"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 0e53d1d9149c..105f31c90ae5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.1.2"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4e30e64c44df9e59bd13239951bb8d2b5b276e6f"
-SRCREV_meta ?= "4ea43922558a9032af33ea42ea74ac02416079e7"
+SRCREV_machine ?= "74159a303c210bca8ea5c5636fc5b17d47e51aa1"
+SRCREV_meta ?= "833214b33303ecde02fdcd1a9bc7901ded6a7976"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index cbc3981f6d54..ecc72534292f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c4df99c91fc947afb7010a11eceeef0e05bf964f"
-SRCREV_machine_qemuarm64 ?= "4e30e64c44df9e59bd13239951bb8d2b5b276e6f"
-SRCREV_machine_qemumips ?= "6a24f7e60b9b2ecc1579f5f767be5845086533e1"
-SRCREV_machine_qemuppc ?= "4e30e64c44df9e59bd13239951bb8d2b5b276e6f"
-SRCREV_machine_qemux86 ?= "4e30e64c44df9e59bd13239951bb8d2b5b276e6f"
-SRCREV_machine_qemux86-64 ?= "4e30e64c44df9e59bd13239951bb8d2b5b276e6f"
-SRCREV_machine_qemumips64 ?= "5c2b3697082a4ec6641aa5a8eca3974ca609cecf"
-SRCREV_machine ?= "4e30e64c44df9e59bd13239951bb8d2b5b276e6f"
-SRCREV_meta ?= "4ea43922558a9032af33ea42ea74ac02416079e7"
+SRCREV_machine_qemuarm ?= "0352ebb49ba09bd09dee69d6df4af1388d3f4992"
+SRCREV_machine_qemuarm64 ?= "74159a303c210bca8ea5c5636fc5b17d47e51aa1"
+SRCREV_machine_qemumips ?= "46ec81f8b6d8f6c6906280651d2aa5e18d3bb63f"
+SRCREV_machine_qemuppc ?= "74159a303c210bca8ea5c5636fc5b17d47e51aa1"
+SRCREV_machine_qemux86 ?= "74159a303c210bca8ea5c5636fc5b17d47e51aa1"
+SRCREV_machine_qemux86-64 ?= "74159a303c210bca8ea5c5636fc5b17d47e51aa1"
+SRCREV_machine_qemumips64 ?= "9c23f12286ee4aafe695153f4ebf5b9d4cdfd909"
+SRCREV_machine ?= "74159a303c210bca8ea5c5636fc5b17d47e51aa1"
+SRCREV_meta ?= "833214b33303ecde02fdcd1a9bc7901ded6a7976"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
-- 
2.1.0


