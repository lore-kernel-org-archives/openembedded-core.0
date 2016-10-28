Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3C7CD71A78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 12:18:48 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 28 Oct 2016 05:18:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,557,1473145200"; d="scan'208";a="895071914"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga003.jf.intel.com with ESMTP; 28 Oct 2016 05:18:48 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2016 15:18:47 +0300
Message-Id: <1477657127-10568-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] python: fix python-tests rdepends
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
X-List-Received-Date: Fri, 28 Oct 2016 12:18:51 -0000

test.regrtest depends on most of python modules so require all of them.

[YOCTO #10522]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/python/python-2.7-manifest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 189689d..621024f 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -246,7 +246,7 @@ RDEPENDS_${PN}-terminal="${PN}-core ${PN}-io"
 FILES_${PN}-terminal="${libdir}/python2.7/pty.* ${libdir}/python2.7/tty.* "
 
 SUMMARY_${PN}-tests="Python tests"
-RDEPENDS_${PN}-tests="${PN}-core"
+RDEPENDS_${PN}-tests="${PN}-core ${PN}-modules"
 FILES_${PN}-tests="${libdir}/python2.7/test "
 
 SUMMARY_${PN}-textutils="Python option parsing, text wrapping and CSV support"
-- 
2.6.6


