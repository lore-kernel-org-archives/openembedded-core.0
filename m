Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C579C7705C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 07:43:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4I7hnJK025809
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 00:43:49 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 18 May 2016 00:43:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 00:43:42 -0700
Message-ID: <a088c4b3ad4b5110a1bdc14f19253109c5cd1397.1463557068.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1463557068.git.liezhi.yang@windriver.com>
References: <cover.1463557068.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] python3-git: add it for buildtools-tarball
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
X-List-Received-Date: Wed, 18 May 2016 07:43:48 -0000
Content-Type: text/plain

Need add python3-git to buildtools-tarball for the py3 build.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/python/python-git.inc       | 21 +++++++++++++++++++++
 meta/recipes-devtools/python/python-git_1.0.2.bb  | 22 ++--------------------
 meta/recipes-devtools/python/python3-git_1.0.2.bb |  7 +++++++
 3 files changed, 30 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-git.inc
 create mode 100644 meta/recipes-devtools/python/python3-git_1.0.2.bb

diff --git a/meta/recipes-devtools/python/python-git.inc b/meta/recipes-devtools/python/python-git.inc
new file mode 100644
index 0000000..72632b7
--- /dev/null
+++ b/meta/recipes-devtools/python/python-git.inc
@@ -0,0 +1,21 @@
+SUMMARY = "Python library used to interact with Git repositories"
+DESCRIPTION = "GitPython provides object model read and write access to \
+a git repository. Access repository information conveniently, alter the \
+index directly, handle remotes, or go down to low-level object database \
+access with big-files support."
+HOMEPAGE = "http://github.com/gitpython-developers/GitPython"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
+
+SRC_URI = "http://pypi.python.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "d92d96a8da0fc77cf141d3e16084e094"
+SRC_URI[sha256sum] = "85de72556781480a38897a77de5b458ae3838b0fd589593679a1b5f34d181d84"
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/GitPython/"
+UPSTREAM_CHECK_REGEX = "/GitPython/(?P<pver>(\d+[\.\-_]*)+)"
+
+S = "${WORKDIR}/GitPython-${PV}"
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python-git_1.0.2.bb b/meta/recipes-devtools/python/python-git_1.0.2.bb
index f00f805..5ca7713 100644
--- a/meta/recipes-devtools/python/python-git_1.0.2.bb
+++ b/meta/recipes-devtools/python/python-git_1.0.2.bb
@@ -1,26 +1,8 @@
-SUMMARY = "Python library used to interact with Git repositories"
-DESCRIPTION = "GitPython provides object model read and write access to \
-a git repository. Access repository information conveniently, alter the \
-index directly, handle remotes, or go down to low-level object database \
-access with big-files support."
-HOMEPAGE = "http://github.com/gitpython-developers/GitPython"
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
-DEPENDS = "python-gitdb"
-
-SRC_URI = "http://pypi.python.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "d92d96a8da0fc77cf141d3e16084e094"
-SRC_URI[sha256sum] = "85de72556781480a38897a77de5b458ae3838b0fd589593679a1b5f34d181d84"
+require python-git.inc
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/GitPython/"
-UPSTREAM_CHECK_REGEX = "/GitPython/(?P<pver>(\d+[\.\-_]*)+)"
-
-S = "${WORKDIR}/GitPython-${PV}"
+DEPENDS = "python-gitdb"
 
 inherit setuptools
 
 RDEPENDS_${PN} += "python-gitdb python-lang python-io python-shell python-math python-re python-subprocess python-stringold python-unixadmin"
 
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python3-git_1.0.2.bb b/meta/recipes-devtools/python/python3-git_1.0.2.bb
new file mode 100644
index 0000000..6620444
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git_1.0.2.bb
@@ -0,0 +1,7 @@
+require python-git.inc
+
+DEPENDS = "python3-gitdb"
+
+inherit setuptools3
+
+RDEPENDS_${PN} += "python3-gitdb python3-lang python3-io python3-shell python3-math python3-re python3-subprocess python3-stringold python3-unixadmin"
-- 
2.8.0


