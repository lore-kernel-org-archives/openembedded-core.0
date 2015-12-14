Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 613637317F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:08:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 14 Dec 2015 07:08:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="707064208"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Dec 2015 07:08:14 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 17:05:24 +0200
Message-Id: <c5da6b276ff499c669bce5fff73f45329103a1a2.1450104283.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/20] docbook-xsl-stylesheets: fix UPSTREAM_CHECK_REGEX
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
X-List-Received-Date: Mon, 14 Dec 2015 15:08:13 -0000

Versions ending in .0 are release candidates, so exclude those.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
index 878e7cf..3c4ed6a 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
@@ -12,7 +12,8 @@ SRC_URI[md5sum] = "6dd0f89131cc35bf4f2ed105a1c17771"
 SRC_URI[sha256sum] = "c98f7296ab5c8ccd2e0bc07634976a37f50847df2d8a59bdb1e157664700b467"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/docbook/files/docbook-xsl/"
-UPSTREAM_CHECK_REGEX = "/docbook-xsl/(?P<pver>(\d+[\.\-_]*)+)/"
+# Reject versions ending in .0 as those are release candidates
+UPSTREAM_CHECK_REGEX = "/docbook-xsl/(?P<pver>(\d+[\.\-_]*)+(?!\.0)\.\d+)/"
 
 S = "${WORKDIR}/docbook-xsl-${PV}"
 
-- 
2.6.2


