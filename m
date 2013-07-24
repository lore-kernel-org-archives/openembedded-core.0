Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 055576B34D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 14:08:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Jul 2013 07:05:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,735,1367996400"; d="scan'208";a="350794784"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by orsmga001.jf.intel.com with ESMTP; 24 Jul 2013 07:08:09 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 17:15:31 +0300
Message-Id: <92263d5a4b0dee120e1cd85d9e5557c553bb7633.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <99af89e892d80f5ebdbca319decc59aa5e611dfc.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
References: <99af89e892d80f5ebdbca319decc59aa5e611dfc.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <cover.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH v3 08/12] lttng-ust: fix recipe name and add GIT revision to PV variable
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
X-List-Received-Date: Wed, 24 Jul 2013 14:08:10 -0000

Git packages should have the following format for the PV variable:
	version_tag+git[r|\-|]?AUTOINC+git_revision

Git recipes should also contain _git token in their name instead of
their version.

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 .../lttng/{lttng-ust_2.2.0.bb => lttng-ust_git.bb} |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.2.0.bb => lttng-ust_git.bb} (97%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.2.0.bb b/meta/recipes-kernel/lttng/lttng-ust_git.bb
similarity index 97%
rename from meta/recipes-kernel/lttng/lttng-ust_2.2.0.bb
rename to meta/recipes-kernel/lttng/lttng-ust_git.bb
index d03f207..3028200 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.2.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_git.bb
@@ -18,7 +18,7 @@ RREPLACES_${PN} = "lttng2-ust"
 RCONFLICTS_${PN} = "lttng2-ust"
 
 SRCREV = "cfaee541fea7f5760b5501913c6902f5e4da9dba"
-PV = "2.2.0"
+PV = "2.2.0+git${SRCPV}"
 PE = "2"
 
 SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git \
-- 
1.7.9.5


