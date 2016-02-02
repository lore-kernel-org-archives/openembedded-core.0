Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C7BE2771B5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 16:06:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 02 Feb 2016 08:06:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,385,1449561600"; d="scan'208";a="875216827"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga001.jf.intel.com with ESMTP; 02 Feb 2016 08:06:01 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 16:06:54 +0000
Message-Id: <1454429214-20792-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH][jethro] linux-yocto: Adds new SRCREVs for qemux86 and qemux86-64 for kernel 3.14 and 3.19
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
X-List-Received-Date: Tue, 02 Feb 2016 16:06:00 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.14.bb | 4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.19.bb | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 809789b..e80a80d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -15,8 +15,8 @@ SRCREV_machine_qemuarm ?= "4817747912b5c50ce5c31ef25658340ca615e1b4"
 SRCREV_machine_qemuarm64 ?= "578602a722dbfb260801f3b37c6eafd2abb2340d"
 SRCREV_machine_qemumips ?= "6ed76ec26b120f65f8547c8612b7334bd2745ec9"
 SRCREV_machine_qemuppc ?= "a86ade84b2e142c0fd7536d96477107b6d07db5c"
-SRCREV_machine_qemux86 ?= "af1f7f586bd32d39c057f17606991b887eadb389"
-SRCREV_machine_qemux86-64 ?= "578602a722dbfb260801f3b37c6eafd2abb2340d"
+SRCREV_machine_qemux86 ?= "d9bf859dfae6f88b88b157119c20ae4d5e51420a"
+SRCREV_machine_qemux86-64 ?= "93b2b800d85c1565af7d96f3776dc38c85ae1902"
 SRCREV_machine_qemumips64 ?= "a63d40b860a6d255005a541894d53729090b40ea"
 SRCREV_machine ?= "578602a722dbfb260801f3b37c6eafd2abb2340d"
 SRCREV_meta ?= "060fa80b7996250001ee90c50a4978c8fdb87fc4"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
index 753e14d..baa575b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
@@ -15,8 +15,8 @@ SRCREV_machine_qemuarm ?= "857048f10bfe7089ca6007e72431f1c098b07115"
 SRCREV_machine_qemuarm64 ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
 SRCREV_machine_qemumips ?= "cedbbc7b5e72df2e820bb9e7885f12132c5e2fff"
 SRCREV_machine_qemuppc ?= "23a83386e10986a63e6cef712a045445499d002b"
-SRCREV_machine_qemux86 ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
-SRCREV_machine_qemux86-64 ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
+SRCREV_machine_qemux86 ?= "1583bf79b946cd5581d84d8c369b819a5ecb94b4"
+SRCREV_machine_qemux86-64 ?= "1583bf79b946cd5581d84d8c369b819a5ecb94b4"
 SRCREV_machine_qemumips64 ?= "3eb70cea3532e22ab1b6da9864446621229e6616"
 SRCREV_machine ?= "151571a39785218a57c3ae3355cd63694890cc8d"
 SRCREV_meta ?= "1016714868249d64fc16692fd7679672b1efa17b"
-- 
2.6.2


