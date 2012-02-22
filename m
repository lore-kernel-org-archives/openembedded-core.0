Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S05xy-0007b0-W6
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 07:46:19 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Feb 2012 22:37:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109312584"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 21 Feb 2012 22:37:55 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2012 22:37:47 -0800
Message-Id: <14cfeb96c183b7e79cece8d51bc4808f86f0b566.1329892604.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <2125b0a630c007976b62237dca790abcc5718825.1329892604.git.nitin.a.kamble@intel.com>
References: <2125b0a630c007976b62237dca790abcc5718825.1329892604.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1329892604.git.nitin.a.kamble@intel.com>
References: <cover.1329892604.git.nitin.a.kamble@intel.com>
Subject: [PATCH 04/10] arch-mips.inc: define TUNE_FEATURE_ARCH vars for multilib tunes
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
X-List-Received-Date: Wed, 22 Feb 2012 06:46:19 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/conf/machine/include/mips/arch-mips.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index b674d66..f081cd8 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -15,16 +15,19 @@ TUNEVALID[mips-o32] = "MIPS o32 ABI"
 TUNECONFLICT[mips-o32] = "mips-n32 mips-n64"
 TUNE_FEATURE_CCARGS-mips-o32 ?= "-mabi=32"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips-o32", "${TUNE_FEATURE_CCARGS-mips-o32}", "", d)}"
+TUNE_FEATURE_ARCH-mips-o32 = "mips${MIPSPKGSFX_BYTE}${MIPSPKGSFX_ENDIAN}"
 
 TUNEVALID[mips-n32] = "MIPS64 n32 ABI"
 TUNECONFLICT[mips-n32] = "mips-o32 mips-n64"
 TUNE_FEATURE_CCARGS-mips-n32 ?= "-mabi=n32"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips-n32", "${TUNE_FEATURE_CCARGS-mips-n32}", "", d)}"
+TUNE_FEATURE_ARCH-mips-n32 = "mips${MIPSPKGSFX_BYTE}${MIPSPKGSFX_ENDIAN}"
 
 TUNEVALID[mips-n64] = "MIPS64 n64 ABI"
 TUNECONFLICT[mips-n64] = "mips-o32 mips-n32"
 TUNE_FEATURE_CCARGS-mips-n64 ?= "-mabi=64"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips-n64", "${TUNE_FEATURE_CCARGS-mips-n64}", "", d)}"
+TUNE_FEATURE_ARCH-mips-n64 = "mips${MIPSPKGSFX_BYTE}${MIPSPKGSFX_ENDIAN}"
 
 # Floating point
 TUNEVALID[mips-fpu-hard] = "Use hardware FPU"
-- 
1.7.6.4



