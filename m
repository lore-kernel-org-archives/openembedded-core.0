Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SDsKO-0005ih-In
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 09:02:24 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Mar 2012 23:53:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="123918741"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by orsmga001.jf.intel.com with ESMTP; 30 Mar 2012 23:53:17 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Mar 2012 14:49:24 +0800
Message-Id: <eb2bbe99f15183d5c82ab5c12178a1e336a7c5ce.1333176251.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <d33b7d21b1cc23f7c20743d85a261c4d610e2f41.1333176251.git.lianhao.lu@intel.com>
References: <d33b7d21b1cc23f7c20743d85a261c4d610e2f41.1333176251.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1333176251.git.lianhao.lu@intel.com>
References: <cover.1333176251.git.lianhao.lu@intel.com>
Subject: [PATCH 4/5] eglibc-nativesdk: Set GCC_ADDONS.
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
X-List-Received-Date: Sat, 31 Mar 2012 07:02:24 -0000

Set only necessary GCC_ADDONS for eglibc-nativesdk so that it is not
dependant on the target eglibc's GCC_ADDONS settings.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-core/eglibc/eglibc_2.13.bb |    3 ++-
 meta/recipes-core/eglibc/eglibc_2.15.bb |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index e02c80f..e480772 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "15508"
 
 DEPENDS += "gperf-native"
-PR = "r22"
+PR = "r23"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
@@ -37,6 +37,7 @@ BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${layout_includedir}"
 
 GLIBC_ADDONS ?= "ports,nptl,libidn"
+GLIBC_ADDONS_virtclass-nativesdk = "nptl"
 
 GLIBC_BROKEN_LOCALES = " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET gez_ER bn_BD te_IN es_CR.ISO-8859-1"
 
diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index 75ccace..4e7fe1e 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "17386"
 
 DEPENDS += "gperf-native"
-PR = "r2"
+PR = "r3"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_15"
@@ -42,6 +42,7 @@ BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${layout_includedir}"
 
 GLIBC_ADDONS ?= "ports,nptl,libidn"
+GLIBC_ADDONS_virtclass-nativesdk = "nptl"
 
 GLIBC_BROKEN_LOCALES = " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET gez_ER bn_BD te_IN es_CR.ISO-8859-1"
 
-- 
1.7.0.4



