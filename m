Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 694587752B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 17:40:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Mar 2017 10:41:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,160,1486454400"; d="scan'208";a="1141630718"
Received: from jalamego-mobl2.zpn.intel.com ([10.219.128.117])
	by fmsmga002.fm.intel.com with ESMTP; 13 Mar 2017 10:41:00 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Mar 2017 11:40:50 -0600
Message-Id: <1489426850-26058-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python*-git: Upgrade to version 2.1.3
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
X-List-Received-Date: Mon, 13 Mar 2017 17:41:01 -0000

Both python-git and python3-git need to be upgraded to latest
upstream
version.
This change was tested using qemux86 with core-image-sato.

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/recipes-devtools/python/python-git.inc                           | 4 ++--
 .../python/{python-git_2.1.1.bb => python-git_2.1.3.bb}               | 0
 .../python/{python3-git_2.1.1.bb => python3-git_2.1.3.bb}             | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-git_2.1.1.bb => python-git_2.1.3.bb} (100%)
 rename meta/recipes-devtools/python/{python3-git_2.1.1.bb => python3-git_2.1.3.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-git.inc b/meta/recipes-devtools/python/python-git.inc
index feddf27..825e795d9 100644
--- a/meta/recipes-devtools/python/python-git.inc
+++ b/meta/recipes-devtools/python/python-git.inc
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "77f8339e68dedb6d7c4e26371a588ed9"
-SRC_URI[sha256sum] = "e96f8e953cf9fee0a7599fc587667591328760b6341a0081ef311a942fc96204"
+SRC_URI[md5sum] = "6cd18008c03a767740f3bf6d89ef79bc"
+SRC_URI[sha256sum] = "3826185b11e1fc372e7d31251e9b65e11ccb7c27f82c771d619048bdb5b66c81"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/GitPython/"
 UPSTREAM_CHECK_REGEX = "/GitPython/(?P<pver>(\d+[\.\-_]*)+)"
diff --git a/meta/recipes-devtools/python/python-git_2.1.1.bb b/meta/recipes-devtools/python/python-git_2.1.3.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-git_2.1.1.bb
rename to meta/recipes-devtools/python/python-git_2.1.3.bb
diff --git a/meta/recipes-devtools/python/python3-git_2.1.1.bb b/meta/recipes-devtools/python/python3-git_2.1.3.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-git_2.1.1.bb
rename to meta/recipes-devtools/python/python3-git_2.1.3.bb
-- 
2.7.4


