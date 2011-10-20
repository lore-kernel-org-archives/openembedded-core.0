Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RGnUs-0002o6-8v
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 09:57:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Oct 2011 00:51:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="64982191"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by orsmga001.jf.intel.com with ESMTP; 20 Oct 2011 00:51:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 00:50:45 -0700
Message-Id: <84da55babd48c9de760d3ff271ba97e6a65926c8.1319096633.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL - v2 09/26] x86 tune files: set baselib for x32 tune as libx32
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
X-List-Received-Date: Thu, 20 Oct 2011 07:57:02 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/conf/machine/include/ia32/arch-ia32.inc |    2 +-
 meta/conf/machine/include/tune-core2.inc     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc b/meta/conf/machine/include/ia32/arch-ia32.inc
index a52e33a..ee91983 100644
--- a/meta/conf/machine/include/ia32/arch-ia32.inc
+++ b/meta/conf/machine/include/ia32/arch-ia32.inc
@@ -44,6 +44,6 @@ PACKAGE_EXTRA_ARCHS_tune-x86-64 = "x86_64"
 
 AVAILTUNES += "x86-64-x32"
 TUNE_FEATURES_tune-x86-64-x32 ?= "mx32"
-BASE_LIB_tune-x86-64-x32 ?= "lib"
+BASE_LIB_tune-x86-64-x32 ?= "libx32"
 PACKAGE_EXTRA_ARCHS_tune-x86-64-x32 = "x86_64-x32"
 TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}"
diff --git a/meta/conf/machine/include/tune-core2.inc b/meta/conf/machine/include/tune-core2.inc
index 78f8f4d..565a39c 100644
--- a/meta/conf/machine/include/tune-core2.inc
+++ b/meta/conf/machine/include/tune-core2.inc
@@ -20,5 +20,5 @@ PACKAGE_EXTRA_ARCHS_tune-core2-64 = "${PACKAGE_EXTRA_ARCHS_tune-x86-64} core2-64
 
 AVAILTUNES += "core2-64-x32"
 TUNE_FEATURES_tune-core2-64-x32 ?= "${TUNE_FEATURES_tune-x86-64-x32} core2"
-BASE_LIB_tune-core2-64-x32 ?= "lib"
+BASE_LIB_tune-core2-64-x32 ?= "libx32"
 PACKAGE_EXTRA_ARCHS_tune-core2-64-x32 = "${PACKAGE_EXTRA_ARCHS_tune-x86-64-x32} core2-64-x32"
-- 
1.7.6.2



