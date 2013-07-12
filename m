Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 76FB061FE1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 15:03:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2013 08:00:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,653,1367996400"; d="scan'208";a="344585235"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2013 08:03:02 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2013 18:10:29 +0300
Message-Id: <03982e313990aad86cd24f5cbcb4994448ab58a0.1373641734.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1373641734.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1373641734.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH 1/6] rt-tests: add PV variable into recipe
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
X-List-Received-Date: Fri, 12 Jul 2013 15:03:08 -0000

Git packages should include git token inside the PV variable.

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 meta/recipes-rt/rt-tests/rt-tests_0.85.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.85.bb b/meta/recipes-rt/rt-tests/rt-tests_0.85.bb
index c3964d2..522fb9c 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_0.85.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_0.85.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 require rt-tests.inc
 
 PR = "${INC_PR}.0"
+PV = "0.85+git${SRCPV}"
 
 # Do not install hwlatdetect
 EXTRA_OEMAKE += "PYLIB=''"
-- 
1.7.9.5


