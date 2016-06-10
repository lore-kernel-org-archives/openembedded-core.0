Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D9464606BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 21:02:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 10 Jun 2016 14:02:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,452,1459839600"; d="scan'208";a="995266463"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga002.jf.intel.com with ESMTP; 10 Jun 2016 14:02:52 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jun 2016 21:01:52 +0000
Message-Id: <1465592512-45778-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH v2] python-git: Upgrade both python-git and python3-git from 1.0.2 to 2.0.5
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
X-List-Received-Date: Fri, 10 Jun 2016 21:02:52 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python-git.inc       | 6 +++---
 meta/recipes-devtools/python/python-git_1.0.2.bb  | 8 --------
 meta/recipes-devtools/python/python-git_2.0.5.bb  | 8 ++++++++
 meta/recipes-devtools/python/python3-git_1.0.2.bb | 7 -------
 meta/recipes-devtools/python/python3-git_2.0.5.bb | 7 +++++++
 5 files changed, 18 insertions(+), 18 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-git_1.0.2.bb
 create mode 100644 meta/recipes-devtools/python/python-git_2.0.5.bb
 delete mode 100644 meta/recipes-devtools/python/python3-git_1.0.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-git_2.0.5.bb

diff --git a/meta/recipes-devtools/python/python-git.inc b/meta/recipes-devtools/python/python-git.inc
index 72632b7..eba0082 100644
--- a/meta/recipes-devtools/python/python-git.inc
+++ b/meta/recipes-devtools/python/python-git.inc
@@ -8,10 +8,10 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
 
-SRC_URI = "http://pypi.python.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
+SRC_URI = "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d92d96a8da0fc77cf141d3e16084e094"
-SRC_URI[sha256sum] = "85de72556781480a38897a77de5b458ae3838b0fd589593679a1b5f34d181d84"
+SRC_URI[md5sum] = "f4f60f269fb5f6a332c653a5bc015239"
+SRC_URI[sha256sum] = "20f3c90fb8a11edc52d363364fb0a116a410c7b7bdee24a433712b5413d1028e"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/GitPython/"
 UPSTREAM_CHECK_REGEX = "/GitPython/(?P<pver>(\d+[\.\-_]*)+)"
diff --git a/meta/recipes-devtools/python/python-git_1.0.2.bb b/meta/recipes-devtools/python/python-git_1.0.2.bb
deleted file mode 100644
index 5ca7713..0000000
--- a/meta/recipes-devtools/python/python-git_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require python-git.inc
-
-DEPENDS = "python-gitdb"
-
-inherit setuptools
-
-RDEPENDS_${PN} += "python-gitdb python-lang python-io python-shell python-math python-re python-subprocess python-stringold python-unixadmin"
-
diff --git a/meta/recipes-devtools/python/python-git_2.0.5.bb b/meta/recipes-devtools/python/python-git_2.0.5.bb
new file mode 100644
index 0000000..5ca7713
--- /dev/null
+++ b/meta/recipes-devtools/python/python-git_2.0.5.bb
@@ -0,0 +1,8 @@
+require python-git.inc
+
+DEPENDS = "python-gitdb"
+
+inherit setuptools
+
+RDEPENDS_${PN} += "python-gitdb python-lang python-io python-shell python-math python-re python-subprocess python-stringold python-unixadmin"
+
diff --git a/meta/recipes-devtools/python/python3-git_1.0.2.bb b/meta/recipes-devtools/python/python3-git_1.0.2.bb
deleted file mode 100644
index 6620444..0000000
--- a/meta/recipes-devtools/python/python3-git_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require python-git.inc
-
-DEPENDS = "python3-gitdb"
-
-inherit setuptools3
-
-RDEPENDS_${PN} += "python3-gitdb python3-lang python3-io python3-shell python3-math python3-re python3-subprocess python3-stringold python3-unixadmin"
diff --git a/meta/recipes-devtools/python/python3-git_2.0.5.bb b/meta/recipes-devtools/python/python3-git_2.0.5.bb
new file mode 100644
index 0000000..3485331
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git_2.0.5.bb
@@ -0,0 +1,7 @@
+require python-git.inc
+
+DEPENDS = "python3-gitdb"
+
+inherit setuptools3
+
+RDEPENDS_${PN} += "python3-gitdb python3-lang python3-io python3-shell python3-math python3-re python3-subprocess python3-stringold python3-unixadmin python3-misc"
-- 
2.6.6


