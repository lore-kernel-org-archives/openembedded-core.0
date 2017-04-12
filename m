Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4DBE277D36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 22:19:04 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 12 Apr 2017 15:19:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,191,1488873600"; d="scan'208";a="88411917"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.39])
	by fmsmga006.fm.intel.com with ESMTP; 12 Apr 2017 15:19:04 -0700
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 17:21:21 -0500
Message-Id: <1492035681-28564-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] python3-git: upgrade from 2.1.1 to 2.1.3
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
X-List-Received-Date: Wed, 12 Apr 2017 22:19:18 -0000

This is a minimal update for git module of python 3

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
---
 meta/recipes-devtools/python/python-git.inc                           | 4 ++--
 .../python/{python3-git_2.1.1.bb => python3-git_2.1.3.bb}             | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
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
diff --git a/meta/recipes-devtools/python/python3-git_2.1.1.bb b/meta/recipes-devtools/python/python3-git_2.1.3.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-git_2.1.1.bb
rename to meta/recipes-devtools/python/python3-git_2.1.3.bb
-- 
2.1.4


