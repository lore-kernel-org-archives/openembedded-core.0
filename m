Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id ADE606B33F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 14:08:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Jul 2013 07:05:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,735,1367996400"; d="scan'208";a="350794860"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by orsmga001.jf.intel.com with ESMTP; 24 Jul 2013 07:08:15 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 17:15:34 +0300
Message-Id: <facde26e489345a506bf85d312a865ad1ae545d8.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <99af89e892d80f5ebdbca319decc59aa5e611dfc.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
References: <99af89e892d80f5ebdbca319decc59aa5e611dfc.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <cover.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH v3 11/12] rt-tests: fix recipe name add GIT revision to PV variable
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
X-List-Received-Date: Wed, 24 Jul 2013 14:08:16 -0000

Git packages should have the following format for the PV variable:
	version_tag+git[r|\-|]?AUTOINC+git_revision

Git recipes should also contain _git token in their name instead of
their version.

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 .../rt-tests/{rt-tests_0.85.bb => rt-tests_git.bb} |    1 +
 1 file changed, 1 insertion(+)
 rename meta/recipes-rt/rt-tests/{rt-tests_0.85.bb => rt-tests_git.bb} (97%)

diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.85.bb b/meta/recipes-rt/rt-tests/rt-tests_git.bb
similarity index 97%
rename from meta/recipes-rt/rt-tests/rt-tests_0.85.bb
rename to meta/recipes-rt/rt-tests/rt-tests_git.bb
index c3964d2..522fb9c 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_0.85.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_git.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 require rt-tests.inc
 
 PR = "${INC_PR}.0"
+PV = "0.85+git${SRCPV}"
 
 # Do not install hwlatdetect
 EXTRA_OEMAKE += "PYLIB=''"
-- 
1.7.9.5


