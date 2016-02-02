Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C0A48760A3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 21:37:58 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 02 Feb 2016 13:37:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,386,1449561600"; d="scan'208";a="41293405"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2016 13:37:59 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 21:39:01 +0000
Message-Id: <17e1f56568a47c6a2f1a0e9893539eabe206a3cf.1454448868.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1454448868.git.alejandro.hernandez@linux.intel.com>
References: <cover.1454448868.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH v2 1/3] [jethro] linux-yocto: Update SRCREV for qemux86* for 3.14, fixes CVE-2016-0728
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
X-List-Received-Date: Tue, 02 Feb 2016 21:38:00 -0000

This addresses CVE-2016-0728: KEYS: Fix keyring ref leak in join_session_keyring(), and upgrades to LINUX_VERSION 3.14.39

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.14.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 809789b..db93d23 100644
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
@@ -25,6 +25,8 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;branch=${KBRANCH};nam
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-3.14;destsuffix=${KMETA}"
 
 LINUX_VERSION ?= "3.14.36"
+LINUX_VERSION_qemux86 ?= "3.14.39"
+LINUX_VERSION_qemux86-64 ?= "3.14.39"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.6.2


