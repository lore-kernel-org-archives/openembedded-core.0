Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1REURY-00063o-F6
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 01:12:04 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Oct 2011 16:06:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,343,1315206000"; d="scan'208";a="62399762"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 13 Oct 2011 16:06:18 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 16:06:11 -0700
Message-Id: <1a00b766c9b8029eaacbb80e0077dfcd556c7c0f.1318547063.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <cover.1318547063.git.nitin.a.kamble@intel.com>
References: <cover.1318547063.git.nitin.a.kamble@intel.com>
Subject: [review/test 1/5] x86 tune files: set baselib for x32 tune as libx32
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
X-List-Received-Date: Thu, 13 Oct 2011 23:12:04 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/conf/machine/include/ia32/arch-ia32.inc |    2 +-
 meta/conf/machine/include/tune-core2.inc     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc b/meta/conf/machine/include/ia32/arch-ia32.inc
index 96980d2..742b764 100644
--- a/meta/conf/machine/include/ia32/arch-ia32.inc
+++ b/meta/conf/machine/include/ia32/arch-ia32.inc
@@ -43,6 +43,6 @@ PACKAGE_EXTRA_ARCHS_tune-x86-64 = "x86_64"
 
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
1.7.4.4



