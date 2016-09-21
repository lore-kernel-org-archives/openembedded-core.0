Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 227286E64A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 09:26:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 21 Sep 2016 02:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,373,1470726000"; d="scan'208";a="1054252423"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.27.83])
	by orsmga002.jf.intel.com with ESMTP; 21 Sep 2016 02:26:57 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 10:26:41 +0100
Message-Id: <1474450001-6837-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] uninative-tarball: add SDKMACHINE to stamps-extra-info
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
X-List-Received-Date: Wed, 21 Sep 2016 09:26:59 -0000

Otherwise the stamps for x86-64 and i686 uninative tarballs match
and we can't deploy both to the DEPLOYDIR.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/recipes-core/meta/uninative-tarball.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index 7037bdd..4ead812 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -32,7 +32,7 @@ deltask install
 deltask package
 deltask packagedata
 
-do_populate_sdk[stamp-extra-info] = ""
+do_populate_sdk[stamp-extra-info] = "${SDKMACHINE}"
 
 SDK_DEPENDS += "patchelf-native"
 
-- 
2.7.4


