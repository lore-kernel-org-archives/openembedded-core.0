Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S05y1-0007b0-95
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 07:46:21 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Feb 2012 22:37:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109312587"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 21 Feb 2012 22:37:55 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2012 22:37:49 -0800
Message-Id: <a71f50d7705242763c8c4f8700c3b2c4b8bdf8d9.1329892604.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <2125b0a630c007976b62237dca790abcc5718825.1329892604.git.nitin.a.kamble@intel.com>
References: <2125b0a630c007976b62237dca790abcc5718825.1329892604.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1329892604.git.nitin.a.kamble@intel.com>
References: <cover.1329892604.git.nitin.a.kamble@intel.com>
Subject: [PATCH 06/10] arch-powerpc*.inc: rearrange TUNE_ARCH definition
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Feb 2012 06:46:21 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This helps gcc mutlilib code find definitions used by various tunes

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/conf/machine/include/powerpc/arch-powerpc.inc |    3 ++-
 .../machine/include/powerpc/arch-powerpc64.inc     |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index 70f7a18..cd66abc 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -8,7 +8,8 @@ DEFAULTTUNE ?= "powerpc"
 TUNEVALID[ppc-m32] = "Power ELF32 standard ABI"
 TUNE_FEATURE_CCARGS-ppc-m32 ?= "-m32"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc-m32", "${TUNE_FEATURE_CCARGS-ppc-m32}", "", d)}"
-TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppc-m32", "powerpc", "", d)}"
+TUNE_FEATURE_ARCH-ppc-m32 = "powerpc"
+TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppc-m32", "${TUNE_FEATURE_ARCH-ppc-m32}", "" ,d)}"
 
 TUNEVALID[ppc-fpu-hard] = "Use hardware FPU."
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc-fpu-hard", "-mhard-float", "", d)}"
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
index edbc07c..52e386b 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
@@ -6,7 +6,8 @@ TUNEVALID[ppc-m64] = "Power ELF64 standard ABI"
 TUNE_CONFLICTS[ppc-m64] = "ppc-m32 ppc-nf"
 TUNE_FEATURE_CCARGS-ppc-m64 ?= "-m64"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc-m64", "${TUNE_FEATURE_CCARGS-ppc-m64}", "", d)}"
-TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "ppc-m64" ], "powerpc64", "", d)}"
+TUNE_FEATURE_ARCH-ppc-m64 = "powerpc64"
+TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "ppc-m64" ], "${TUNE_FEATURE_ARCH-ppc-m64}", "", d)}"
 
 AVAILTUNES += "powerpc64"
 TUNE_FEATURES_tune-powerpc64 ?= "ppc-m64 ppc-fpu-hard"
-- 
1.7.6.4



