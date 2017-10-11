Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9BBA771C7A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 21:13:26 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 14:13:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,362,1503385200"; d="scan'208";a="137573369"
Received: from jalamego-mobl3.zpn.intel.com ([10.219.128.138])
	by orsmga004.jf.intel.com with ESMTP; 11 Oct 2017 14:13:26 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 16:13:17 -0500
Message-Id: <1507756397-29801-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-git: update to 2.1.7
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
X-List-Received-Date: Wed, 11 Oct 2017 21:13:26 -0000

python3-git needs to be updated to latest stable version.

This change was tested on qemux86 running core-image-minimal.

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/recipes-devtools/python/python-git.inc                           | 4 ++--
 .../python/{python3-git_2.1.5.bb => python3-git_2.1.7.bb}             | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-git_2.1.5.bb => python3-git_2.1.7.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-git.inc b/meta/recipes-devtools/python/python-git.inc
index 777608c..0b7e44a 100644
--- a/meta/recipes-devtools/python/python-git.inc
+++ b/meta/recipes-devtools/python/python-git.inc
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "df94212b19d270a625b67b4c84ac9a41"
-SRC_URI[sha256sum] = "5c00cbd256e2b1d039381d4f7d71fcb7ee5cc196ca10c101ff7191bd82ab5d9c"
+SRC_URI[md5sum] = "a63fdd2a650694ea23e268fd0c952034"
+SRC_URI[sha256sum] = "13c7cd99c2bf277fc99accfc25148752fa90e7cc6c6d08a3f01d229dacb461d9"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/GitPython/"
 UPSTREAM_CHECK_REGEX = "/GitPython/(?P<pver>(\d+[\.\-_]*)+)"
diff --git a/meta/recipes-devtools/python/python3-git_2.1.5.bb b/meta/recipes-devtools/python/python3-git_2.1.7.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-git_2.1.5.bb
rename to meta/recipes-devtools/python/python3-git_2.1.7.bb
-- 
2.7.4


