Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DAB3177241
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 21:37:59 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 02 Feb 2016 13:37:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,386,1449561600"; d="scan'208";a="41293406"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2016 13:37:59 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 21:39:02 +0000
Message-Id: <c1fcf9fa0a63ef2de31f3e18a5abd5a3f23945d4.1454448868.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <17e1f56568a47c6a2f1a0e9893539eabe206a3cf.1454448868.git.alejandro.hernandez@linux.intel.com>
References: <17e1f56568a47c6a2f1a0e9893539eabe206a3cf.1454448868.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1454448868.git.alejandro.hernandez@linux.intel.com>
References: <cover.1454448868.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH v2 2/3] [jethro] linux-yocto: Update SRCREV for qemux86* for 3.19, fixes CVE-2016-0728
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

This addresses CVE-2016-0728: KEYS: Fix keyring ref leak in join_session_keyring()

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.19.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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


