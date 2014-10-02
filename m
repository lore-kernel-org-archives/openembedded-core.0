Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4A324601A8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 15:20:43 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 02 Oct 2014 08:20:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="394668891"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.60])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Oct 2014 08:13:50 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Oct 2014 10:19:17 -0500
Message-Id: <1412263157-2891-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] linux-yocto: Added bc-native as DEPENDS
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
X-List-Received-Date: Thu, 02 Oct 2014 15:20:51 -0000

The makefile checks for bc during for compilation

[YOCTO #6781]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 78b33ce..0782923 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,7 +1,7 @@
 inherit linux-kernel-base kernel-module-split
 
 PROVIDES += "virtual/kernel"
-DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross"
+DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross bc-native"
 
 # we include gcc above, we dont need virtual/libc
 INHIBIT_DEFAULT_DEPS = "1"
-- 
1.9.1


