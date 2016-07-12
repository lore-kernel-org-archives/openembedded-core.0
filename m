Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3E9E473195
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 11:14:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jul 2016 04:15:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,351,1464678000"; d="scan'208";a="1005225685"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jul 2016 04:14:59 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 14:14:53 +0300
Message-Id: <edee8290c6be010bc35f7490d8f9da194faffede.1468310468.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1db1fda82b07a5750e581f05d967e01f1f0906b2.1468310468.git.jussi.kukkonen@intel.com>
References: <1db1fda82b07a5750e581f05d967e01f1f0906b2.1468310468.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468310468.git.jussi.kukkonen@intel.com>
References: <cover.1468310468.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 3/5] python3: Add dependencies for python3-misc
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
X-List-Received-Date: Tue, 12 Jul 2016 11:14:59 -0000

http.server requires email.parser. argparse requires
codecs and textutils.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-devtools/python/python3_3.5.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.1.bb b/meta/recipes-devtools/python/python3_3.5.1.bb
index 78ae174..0d667d2 100644
--- a/meta/recipes-devtools/python/python3_3.5.1.bb
+++ b/meta/recipes-devtools/python/python3_3.5.1.bb
@@ -213,7 +213,7 @@ INSANE_SKIP_${PN}-dev += "dev-elf"
 
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
-RDEPENDS_${PN}-misc += "${PN}-core"
+RDEPENDS_${PN}-misc += "${PN}-core ${PN}-email ${PN}-codecs ${PN}-textutils"
 RDEPENDS_${PN}-modules += "${PN}-misc"
 FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
 
-- 
2.1.4


