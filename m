Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 46D0271CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:36:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2017 02:36:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,186,1484035200"; d="scan'208";a="1132314479"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 20 Feb 2017 02:36:04 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Feb 2017 12:35:43 +0200
Message-Id: <20170220103551.20022-12-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170220103551.20022-1-markus.lehtonen@linux.intel.com>
References: <20170220103551.20022-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 12/20] python3: fix depends of python-tests
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
X-List-Received-Date: Mon, 20 Feb 2017 10:36:04 -0000

Similar to an earlier fix for Python 2.7. Make the tests subpackage
depend on all modules as test.regrtest uses most (if not all) of them.

Some tests also depend on libgcc so add that as a runtime dependency as
well.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index a53a8d5..4942271 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -242,7 +242,7 @@ RDEPENDS_${PN}-terminal="${PN}-core ${PN}-io"
 FILES_${PN}-terminal="${libdir}/python3.5/pty.* ${libdir}/python3.5/__pycache__/pty.* ${libdir}/python3.5/tty.* ${libdir}/python3.5/__pycache__/tty.* "
 
 SUMMARY_${PN}-tests="Python tests"
-RDEPENDS_${PN}-tests="${PN}-core"
+RDEPENDS_${PN}-tests="${PN}-core ${PN}-modules libgcc"
 FILES_${PN}-tests="${libdir}/python3.5/test ${libdir}/python3.5/test/__pycache__ "
 
 SUMMARY_${PN}-textutils="Python option parsing, text wrapping and CSV support"
-- 
2.10.2


