Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8F57B6B34D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 14:08:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Jul 2013 07:05:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,735,1367996400"; d="scan'208";a="350794754"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by orsmga001.jf.intel.com with ESMTP; 24 Jul 2013 07:08:07 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 17:15:30 +0300
Message-Id: <1c750bda621ac47a196fc436b60634acce206c4f.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <99af89e892d80f5ebdbca319decc59aa5e611dfc.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
References: <99af89e892d80f5ebdbca319decc59aa5e611dfc.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <cover.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH v3 07/12] hwlatdetect: fix recipe name and add GIT revision to PV variable
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
X-List-Received-Date: Wed, 24 Jul 2013 14:08:07 -0000

Git packages should have the following format for the PV variable:
	version_tag+git[r|\-|]?AUTOINC+git_revision

Git recipes should also contain _git token in their name instead of
their version.

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 .../{hwlatdetect_0.85.bb => hwlatdetect_git.bb}    |    1 +
 1 file changed, 1 insertion(+)
 rename meta/recipes-rt/rt-tests/{hwlatdetect_0.85.bb => hwlatdetect_git.bb} (97%)

diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
similarity index 97%
rename from meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb
rename to meta/recipes-rt/rt-tests/hwlatdetect_git.bb
index 634b609..c4fba8e 100644
--- a/meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb
+++ b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
@@ -10,6 +10,7 @@ RRECOMMENDS_${PN} = "kernel-module-hwlat-detector"
 require rt-tests.inc
 
 PR = "${INC_PR}.0"
+PV = "0.85+git${SRCPV}"
 
 EXTRA_OEMAKE += "PYLIB=${libdir}/python${PYTHON_BASEVERSION}/dist-packages"
 
-- 
1.7.9.5


