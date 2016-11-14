Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id EFE7B6FF72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 22:51:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 14 Nov 2016 14:51:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,640,1473145200"; d="scan'208";a="1085173640"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by fmsmga002.fm.intel.com with ESMTP; 14 Nov 2016 14:51:21 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2016 16:52:41 -0600
Message-Id: <20161114225241.2282-1-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH] python3-mako: upgrade to 1.0.6
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
X-List-Received-Date: Mon, 14 Nov 2016 22:51:22 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
---
 meta/recipes-devtools/python/python-mako.inc                          | 4 ++--
 .../python/{python3-mako_1.0.4.bb => python3-mako_1.0.6.bb}           | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
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
diff --git a/meta/recipes-devtools/python/python3-mako_1.0.4.bb b/meta/recipes-devtools/python/python3-mako_1.0.6.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-mako_1.0.4.bb
rename to meta/recipes-devtools/python/python3-mako_1.0.6.bb
-- 
2.9.3


