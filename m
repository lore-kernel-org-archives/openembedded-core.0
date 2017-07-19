Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0C6C978250
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 16:50:07 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 19 Jul 2017 09:50:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,381,1496127600"; d="scan'208";a="288875959"
Received: from jalamego-mobl3.zpn.intel.com ([10.219.128.135])
	by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2017 09:50:03 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 11:50:02 -0500
Message-Id: <1500483002-4513-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1498585826-15752-1-git-send-email-jose.a.lamego@linux.intel.com>
References: <1498585826-15752-1-git-send-email-jose.a.lamego@linux.intel.com>
Subject: [PATCH] python3-git: upgrade to 2.1.5
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
X-List-Received-Date: Wed, 19 Jul 2017 16:50:08 -0000

python3-git needs to be upgraded to latest upstream version.

"git" is added as RDEPENDS.

These changes were tested using qemux86 with core-image-minimal.

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---

Notes:
    This patch replaces previous submission for updating both
    python-git and python3-git recipes, due to python-git being
    removed in commit 1fc2c9315faf65ea05fecf81450dd40b9a330435

 meta/recipes-devtools/python/python-git.inc                           | 4 ++--
 .../python/{python3-git_2.1.3.bb => python3-git_2.1.5.bb}             | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-git_2.1.3.bb => python3-git_2.1.5.bb} (81%)

diff --git a/meta/recipes-devtools/python/python-git.inc b/meta/recipes-devtools/python/python-git.inc
index 825e795d9..777608c 100644
--- a/meta/recipes-devtools/python/python-git.inc
+++ b/meta/recipes-devtools/python/python-git.inc
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "6cd18008c03a767740f3bf6d89ef79bc"
-SRC_URI[sha256sum] = "3826185b11e1fc372e7d31251e9b65e11ccb7c27f82c771d619048bdb5b66c81"
+SRC_URI[md5sum] = "df94212b19d270a625b67b4c84ac9a41"
+SRC_URI[sha256sum] = "5c00cbd256e2b1d039381d4f7d71fcb7ee5cc196ca10c101ff7191bd82ab5d9c"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/GitPython/"
 UPSTREAM_CHECK_REGEX = "/GitPython/(?P<pver>(\d+[\.\-_]*)+)"
diff --git a/meta/recipes-devtools/python/python3-git_2.1.3.bb b/meta/recipes-devtools/python/python3-git_2.1.5.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-git_2.1.3.bb
rename to meta/recipes-devtools/python/python3-git_2.1.5.bb
index 7a2d452..4ac2a0e 100644
--- a/meta/recipes-devtools/python/python3-git_2.1.3.bb
+++ b/meta/recipes-devtools/python/python3-git_2.1.5.bb
@@ -4,4 +4,4 @@ DEPENDS = "python3-gitdb"
 
 inherit setuptools3
 
-RDEPENDS_${PN} += "python3-gitdb python3-lang python3-io python3-shell python3-math python3-re python3-subprocess python3-stringold python3-unixadmin python3-enum python3-logging python3-datetime python3-netclient python3-unittest python3-argparse"
+RDEPENDS_${PN} += "python3-gitdb python3-lang python3-io python3-shell python3-math python3-re python3-subprocess python3-stringold python3-unixadmin python3-enum python3-logging python3-datetime python3-netclient python3-unittest python3-argparse git"
-- 
2.7.4


