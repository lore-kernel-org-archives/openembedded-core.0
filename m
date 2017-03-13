Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AF865776D5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 23:06:30 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Mar 2017 16:06:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,161,1486454400"; d="scan'208";a="67073536"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 13 Mar 2017 16:06:22 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Mar 2017 16:06:17 -0700
Message-Id: <1489446377-13434-3-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489446377-13434-1-git-send-email-juro.bystricky@intel.com>
References: <1489446377-13434-1-git-send-email-juro.bystricky@intel.com>
Cc: richard.purdie@intel.com, jurobystricky@hotmail.com
Subject: [morty][PATCH 2/2] python-3.5-manifest: Add imp to importlib
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
X-List-Received-Date: Mon, 13 Mar 2017 23:06:32 -0000

The imp python module is the forerunner of importlib. Include imp in
the importlib subpackage instead of the misc subpackage so that it can
be depended on without bringing in a bunch of unrelated, unused modules.

(Slightly modified backport of afd9de380dc04780da1eeb94a4c8c46529254231
by George McCollister <george.mccollister@gmail.com>)

[YOCTO#11134]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 3046114..6c690db 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -115,7 +115,7 @@ FILES_${PN}-image="${libdir}/python3.5/colorsys.* ${libdir}/python3.5/imghdr.* $
 
 SUMMARY_${PN}-importlib="Python import implementation library"
 RDEPENDS_${PN}-importlib="${PN}-core ${PN}-lang"
-FILES_${PN}-importlib="${libdir}/python3.5/importlib "
+FILES_${PN}-importlib="${libdir}/python3.5/importlib ${libdir}/python3.5/imp.* "
 
 SUMMARY_${PN}-io="Python low-level I/O"
 RDEPENDS_${PN}-io="${PN}-core ${PN}-math"
-- 
2.7.4


