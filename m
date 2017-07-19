Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EA8AD782F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 16:12:15 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2017 09:12:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,381,1496127600"; d="scan'208";a="129340966"
Received: from jalamego-mobl3.zpn.intel.com ([10.219.128.135])
	by fmsmga006.fm.intel.com with ESMTP; 19 Jul 2017 09:12:16 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 11:12:17 -0500
Message-Id: <1500480737-15100-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-mako: update to 1.0.7
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
X-List-Received-Date: Wed, 19 Jul 2017 16:12:16 -0000

python3-mako need to be upgraded to latest upstream version.
This change was tested using qemux86 with core-image-minimal

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/recipes-devtools/python/python-mako.inc                          | 4 ++--
 .../python/{python3-mako_1.0.6.bb => python3-mako_1.0.7.bb}           | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.0.6.bb => python3-mako_1.0.7.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-mako.inc b/meta/recipes-devtools/python/python-mako.inc
index 10364db..ba50675 100644
--- a/meta/recipes-devtools/python/python-mako.inc
+++ b/meta/recipes-devtools/python/python-mako.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1bb21fa2d2f7a534c884b990430a6863"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/M/Mako/Mako-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "a28e22a339080316b2acc352b9ee631c"
-SRC_URI[sha256sum] = "48559ebd872a8e77f92005884b3d88ffae552812cdf17db6768e5c3be5ebbe0d"
+SRC_URI[md5sum] = "5836cc997b1b773ef389bf6629c30e65"
+SRC_URI[sha256sum] = "4e02fde57bd4abb5ec400181e4c314f56ac3e49ba4fb8b0d50bba18cb27d25ae"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/mako/"
 UPSTREAM_CHECK_REGEX = "/Mako/(?P<pver>(\d+[\.\-_]*)+)"
diff --git a/meta/recipes-devtools/python/python3-mako_1.0.6.bb b/meta/recipes-devtools/python/python3-mako_1.0.7.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-mako_1.0.6.bb
rename to meta/recipes-devtools/python/python3-mako_1.0.7.bb
-- 
2.7.4


