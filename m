Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8E62F71A50
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 21:22:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 16 Nov 2016 13:22:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,650,1473145200"; d="scan'208";a="1086248685"
Received: from fsantes-mobl2.amr.corp.intel.com (HELO
	jalamego-MOBL2.zpn.intel.com) ([10.219.5.141])
	by fmsmga002.fm.intel.com with ESMTP; 16 Nov 2016 13:22:24 -0800
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2016 15:22:14 -0600
Message-Id: <1479331336-14097-3-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1479331336-14097-1-git-send-email-jose.a.lamego@linux.intel.com>
References: <1479331336-14097-1-git-send-email-jose.a.lamego@linux.intel.com>
Subject: [PATCH 2/4] python*-mako: upgrade to 1.0.6
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
X-List-Received-Date: Wed, 16 Nov 2016 21:22:22 -0000

Both python-mako and python3-mako need to be upgraded to latest upstream
version.
This change was tested using qemux86 with core-image-sato.

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/recipes-devtools/python/python-mako.inc                          | 4 ++--
 .../python/{python-mako_1.0.4.bb => python-mako_1.0.6.bb}             | 0
 .../python/{python3-mako_1.0.4.bb => python3-mako_1.0.6.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-mako_1.0.4.bb => python-mako_1.0.6.bb} (100%)
 rename meta/recipes-devtools/python/{python3-mako_1.0.4.bb => python3-mako_1.0.6.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-mako.inc b/meta/recipes-devtools/python/python-mako.inc
index 85ec217..10364db 100644
--- a/meta/recipes-devtools/python/python-mako.inc
+++ b/meta/recipes-devtools/python/python-mako.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1bb21fa2d2f7a534c884b990430a6863"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/M/Mako/Mako-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "c5fc31a323dd4990683d2f2da02d4e20"
-SRC_URI[sha256sum] = "fed99dbe4d0ddb27a33ee4910d8708aca9ef1fe854e668387a9ab9a90cbf9059"
+SRC_URI[md5sum] = "a28e22a339080316b2acc352b9ee631c"
+SRC_URI[sha256sum] = "48559ebd872a8e77f92005884b3d88ffae552812cdf17db6768e5c3be5ebbe0d"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/mako/"
 UPSTREAM_CHECK_REGEX = "/Mako/(?P<pver>(\d+[\.\-_]*)+)"
diff --git a/meta/recipes-devtools/python/python-mako_1.0.4.bb b/meta/recipes-devtools/python/python-mako_1.0.6.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-mako_1.0.4.bb
rename to meta/recipes-devtools/python/python-mako_1.0.6.bb
diff --git a/meta/recipes-devtools/python/python3-mako_1.0.4.bb b/meta/recipes-devtools/python/python3-mako_1.0.6.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-mako_1.0.4.bb
rename to meta/recipes-devtools/python/python3-mako_1.0.6.bb
-- 
1.9.1


