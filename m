Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B72E56B32C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 14:08:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Jul 2013 07:05:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,735,1367996400"; d="scan'208";a="350794886"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by orsmga001.jf.intel.com with ESMTP; 24 Jul 2013 07:08:17 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 17:15:35 +0300
Message-Id: <9dae86e259fa5b23713c474a81f5e5492a113f39.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <99af89e892d80f5ebdbca319decc59aa5e611dfc.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
References: <99af89e892d80f5ebdbca319decc59aa5e611dfc.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <cover.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH v3 12/12] update-rc.d: fix recipe name and add GIT revision to PV variable
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
X-List-Received-Date: Wed, 24 Jul 2013 14:08:17 -0000

Git packages should have the following format for the PV variable:
	version_tag+git[r|\-|]?AUTOINC+git_revision

Git recipes should also contain _git token in their name instead of
their version.

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 .../{update-rc.d_0.7.bb => update-rc.d_git.bb}     |    1 +
 1 file changed, 1 insertion(+)
 rename meta/recipes-core/update-rc.d/{update-rc.d_0.7.bb => update-rc.d_git.bb} (97%)

diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb b/meta/recipes-core/update-rc.d/update-rc.d_git.bb
similarity index 97%
rename from meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
rename to meta/recipes-core/update-rc.d/update-rc.d_git.bb
index bfcbd97..a103192 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/philb/update-rc.d.git;protocol=git \
            file://check-if-symlinks-are-valid.patch \
           "
 
+PV = "0.7+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 inherit allarch
-- 
1.7.9.5


