Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2601471B29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 07:10:03 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP; 12 Dec 2016 23:10:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="41885776"
Received: from mauric9x-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.158.7])
	by fmsmga005.fm.intel.com with ESMTP; 12 Dec 2016 23:10:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 20:09:35 +1300
Message-Id: <66767033ca6d417aeb0797e4f4d31fb954c217c7.1481612135.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1481612135.git.paul.eggleton@linux.intel.com>
References: <cover.1481612135.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 03/14] oe-selftest: use tinfoil.parse_recipe()
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
X-List-Received-Date: Tue, 13 Dec 2016 07:10:03 -0000

Use tinfoil.parse_recipe() in order to allow oe-selftest to be used in
memres mode.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/utils/commands.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 47cb6b7..6e05995 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -221,9 +221,7 @@ def runqemu(pn, ssh=True):
         import oeqa.targetcontrol
         tinfoil.config_data.setVar("TEST_LOG_DIR", "${WORKDIR}/testimage")
         tinfoil.config_data.setVar("TEST_QEMUBOOT_TIMEOUT", "1000")
-        import oe.recipeutils
-        recipefile = oe.recipeutils.pn_to_recipe(tinfoil.cooker, pn)
-        recipedata = oe.recipeutils.parse_recipe(tinfoil.cooker, recipefile, [])
+        recipedata = tinfoil.parse_recipe(pn)
 
         # The QemuRunner log is saved out, but we need to ensure it is at the right
         # log level (and then ensure that since it's a child of the BitBake logger,
-- 
2.5.5


