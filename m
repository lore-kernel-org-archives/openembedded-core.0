Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 825D675870
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 05:03:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6G539oA002192
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Jul 2015 22:03:09 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Wed, 15 Jul 2015 22:03:08 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 16 Jul 2015 01:03:06 -0400
Message-ID: <178c1ae6ad74b44fe3144aa274c28f2e7cf3d595.1437022827.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1437022827.git.bruce.ashfield@windriver.com>
References: <cover.1437022827.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/3.19: drm and axxia updates
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
X-List-Received-Date: Thu, 16 Jul 2015 05:03:12 -0000
Content-Type: text/plain

Bumping the 3.19 SRCREVs for the following fixes:

  e152349de59b drm/i915: Reset CSB read pointer in ring init
  a87a6ffb3459 drm/i915/bdw: Enable execlists by default where supported
  a70b2eb273ef meta: axxiaarm: add configuration fragments

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      | 18 +++++++++---------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
index 6907060d3314..172d3b480009 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "3.19.5"
 KMETA = "meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6c21811060c03100a32d0acc493df5fb3743b7c8"
-SRCREV_meta ?= "118f27167f4626fc7c71cefbec7c55a41d3a6d62"
+SRCREV_machine ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
+SRCREV_meta ?= "a70b2eb273ef6349d344920474a494697474b98e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
index 6218c02eca8b..cab06266f931 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/common-pc"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c75bfc837fa8079278e77e8c122fe506c4ba7438"
-SRCREV_machine_qemuarm64 ?= "6c21811060c03100a32d0acc493df5fb3743b7c8"
-SRCREV_machine_qemumips ?= "b6aae264b3d4e74cc29a5db8c376840579d1f433"
-SRCREV_machine_qemuppc ?= "f6c2fa7ca86bd548cc96bd0ddf8aa89229e4c2c2"
-SRCREV_machine_qemux86 ?= "6c21811060c03100a32d0acc493df5fb3743b7c8"
-SRCREV_machine_qemux86-64 ?= "6c21811060c03100a32d0acc493df5fb3743b7c8"
-SRCREV_machine_qemumips64 ?= "d3a1f6f5501167c76fb662d518140133f5ce78c5"
-SRCREV_machine ?= "6c21811060c03100a32d0acc493df5fb3743b7c8"
-SRCREV_meta ?= "118f27167f4626fc7c71cefbec7c55a41d3a6d62"
+SRCREV_machine_qemuarm ?= "963b4df663dba2584ac864e0c016825de0046558"
+SRCREV_machine_qemuarm64 ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
+SRCREV_machine_qemumips ?= "cedbbc7b5e72df2e820bb9e7885f12132c5e2fff"
+SRCREV_machine_qemuppc ?= "23a83386e10986a63e6cef712a045445499d002b"
+SRCREV_machine_qemux86 ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
+SRCREV_machine_qemux86-64 ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
+SRCREV_machine_qemumips64 ?= "3eb70cea3532e22ab1b6da9864446621229e6616"
+SRCREV_machine ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
+SRCREV_meta ?= "a70b2eb273ef6349d344920474a494697474b98e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
2.1.0


