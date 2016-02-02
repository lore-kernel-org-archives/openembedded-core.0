Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 100F57728F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 21:37:59 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 02 Feb 2016 13:37:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,386,1449561600"; d="scan'208";a="41293408"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2016 13:37:59 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 21:39:03 +0000
Message-Id: <b5c03a3d82409d310e81e24763fab19a974de2b5.1454448868.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <17e1f56568a47c6a2f1a0e9893539eabe206a3cf.1454448868.git.alejandro.hernandez@linux.intel.com>
References: <17e1f56568a47c6a2f1a0e9893539eabe206a3cf.1454448868.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1454448868.git.alejandro.hernandez@linux.intel.com>
References: <cover.1454448868.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 3/3] [jethro] linux-yocto: Update SRCREV for qemux86* for 4.1, fixes CVE-2016-0728
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

This addresses CVE-2016-0728: KEYS: Fix keyring ref leak in join_session_keyring(), and upgrades to LINUX_VERSION 4.1.17

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index b81458b..1bb7336 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -15,8 +15,8 @@ SRCREV_machine_qemuarm ?= "cf760f381c5e1e58d0c3372d66f4dfdc33f0984c"
 SRCREV_machine_qemuarm64 ?= "788dfc9859321c09f1c58696bf8998f90ccb4f51"
 SRCREV_machine_qemumips ?= "aa46295ab927bd5c960930c377855dbc4e57b195"
 SRCREV_machine_qemuppc ?= "788dfc9859321c09f1c58696bf8998f90ccb4f51"
-SRCREV_machine_qemux86 ?= "788dfc9859321c09f1c58696bf8998f90ccb4f51"
-SRCREV_machine_qemux86-64 ?= "788dfc9859321c09f1c58696bf8998f90ccb4f51"
+SRCREV_machine_qemux86 ?= "2e0ac7b6c4e3ada23a84756287e9b7051ace939a"
+SRCREV_machine_qemux86-64 ?= "2e0ac7b6c4e3ada23a84756287e9b7051ace939a"
 SRCREV_machine_qemumips64 ?= "949c0f2cbb4cf902478d009a7d38b6e4fb29e7c4"
 SRCREV_machine ?= "788dfc9859321c09f1c58696bf8998f90ccb4f51"
 SRCREV_meta ?= "46bb64d605fd336d99fa05bab566b9553b40b4b4"
@@ -25,6 +25,8 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
 LINUX_VERSION ?= "4.1.15"
+LINUX_VERSION_qemux86 ?= "4.1.17"
+LINUX_VERSION_qemux86-64 ?= "4.1.17"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.6.2


