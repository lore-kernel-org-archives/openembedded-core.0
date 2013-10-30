Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 1511A6D509
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 15:41:50 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Oct 2013 08:41:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="382310685"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.230])
	by azsmga001.ch.intel.com with ESMTP; 30 Oct 2013 08:41:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Oct 2013 15:41:43 +0000
Message-Id: <2fcf2cc2e51308158175f07f6446f29da73b6070.1383147565.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383147565.git.paul.eggleton@linux.intel.com>
References: <cover.1383147565.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1383147565.git.paul.eggleton@linux.intel.com>
References: <cover.1383147565.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] classes/ptest: fix quoting
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
X-List-Received-Date: Wed, 30 Oct 2013 15:41:50 -0000

BitBake currently allows using the same quotes outside and inside the
value, but it isn't really right, looks odd and might stop working in
future.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/ptest.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 347a681..508ea9a 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -6,7 +6,7 @@ PTEST_PATH ?= "${libdir}/${PN}/ptest"
 FILES_${PN}-ptest = "${PTEST_PATH}"
 SECTION_${PN}-ptest = "devel"
 ALLOW_EMPTY_${PN}-ptest = "1"
-PTEST_ENABLED = "${@base_contains("DISTRO_FEATURES", "ptest", "1", "0", d)}"
+PTEST_ENABLED = "${@base_contains('DISTRO_FEATURES', 'ptest', '1', '0', d)}"
 RDEPENDS_${PN}-ptest_virtclass-native = ""
 RDEPENDS_${PN}-ptest_virtclass-nativesdk = ""
 
-- 
1.8.1.2


