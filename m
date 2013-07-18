Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 657EA6B2DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 14:09:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Jul 2013 07:09:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,694,1367996400"; d="scan'208";a="372555781"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by orsmga002.jf.intel.com with ESMTP; 18 Jul 2013 07:09:27 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2013 17:16:40 +0300
Message-Id: <997e3f69518775e88f65e65d6d4c824958f93fa1.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <a6f5cb59348a434d4b03599b69f101cd0d5177fe.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
References: <a6f5cb59348a434d4b03599b69f101cd0d5177fe.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <cover.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH 11/11] docbook-sgml-dtd-4.5-native.bb: Add real PV inside the recipe
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
X-List-Received-Date: Thu, 18 Jul 2013 14:09:27 -0000

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 .../docbook-sgml-dtd-4.5-native.bb                 |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb
index 6c464f4..ae723c7 100644
--- a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb
+++ b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
 DTD_VERSION = "4.5"
 
 PR = "${INC_PR}.0"
+PV = "4.5"
 
 SRC_URI[md5sum] = "07c581f4bbcba6d3aac85360a19f95f7"
 SRC_URI[sha256sum] = "8043e514e80c6c19cb146b5d37937d1305bf3abf9b0097c36df7f70f611cdf43"
-- 
1.7.9.5


