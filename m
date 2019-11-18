Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id B31F17F33D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 08:51:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Nov 2019 00:51:56 -0800
X-IronPort-AV: E=Sophos;i="5.68,319,1569308400"; d="scan'208";a="196061698"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.67.150])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Nov 2019 00:51:55 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 16:51:43 +0800
Message-Id: <20191118085149.19903-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/7] rng-tools: upgrade 6.7 -> 6.8
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
X-List-Received-Date: Mon, 18 Nov 2019 08:51:55 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../rng-tools/{rng-tools_6.7.bb => rng-tools_6.8.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/rng-tools/{rng-tools_6.7.bb => rng-tools_6.8.bb} (97%)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.7.bb b/meta/recipes-support/rng-tools/rng-tools_6.8.bb
similarity index 97%
rename from meta/recipes-support/rng-tools/rng-tools_6.7.bb
rename to meta/recipes-support/rng-tools/rng-tools_6.8.bb
index b4e453f67f..83a48a4ec3 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.7.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.8.bb
@@ -14,7 +14,7 @@ SRC_URI = "\
     file://default \
     file://rngd.service \
 "
-SRCREV = "9fc873c5af0e392632e6b736938b811f7ca97251"
+SRCREV = "eb5e34c7fb05594760f99d863fbe0401fe297b93"
 
 S = "${WORKDIR}/git"
 
-- 
2.21.0


