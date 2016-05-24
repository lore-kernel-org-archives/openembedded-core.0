Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E9E396FF60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 03:25:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4O3Pm9X022195
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 20:25:48 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 23 May 2016 20:25:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 May 2016 20:25:42 -0700
Message-ID: <b998de0b5171453a45767aac9d109568cad58e91.1464060246.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1464060246.git.liezhi.yang@windriver.com>
References: <cover.1464060246.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] python-git: remove it
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
X-List-Received-Date: Tue, 24 May 2016 03:25:48 -0000
Content-Type: text/plain

It was needed by buildtools-tarball and packagegroup-self-hosted, no one
requires it any more now.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/python/python-git.inc       | 21 ---------------------
 meta/recipes-devtools/python/python-git_1.0.2.bb  |  8 --------
 meta/recipes-devtools/python/python3-git_1.0.2.bb | 21 ++++++++++++++++++++-
 3 files changed, 20 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-git.inc
 delete mode 100644 meta/recipes-devtools/python/python-git_1.0.2.bb

diff --git a/meta/recipes-devtools/python/python-git.inc b/meta/recipes-devtools/python/python-git.inc
deleted file mode 100644
index 72632b7..0000000
--- a/meta/recipes-devtools/python/python-git.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Python library used to interact with Git repositories"
-DESCRIPTION = "GitPython provides object model read and write access to \
-a git repository. Access repository information conveniently, alter the \
-index directly, handle remotes, or go down to low-level object database \
-access with big-files support."
-HOMEPAGE = "http://github.com/gitpython-developers/GitPython"
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
-
-SRC_URI = "http://pypi.python.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "d92d96a8da0fc77cf141d3e16084e094"
-SRC_URI[sha256sum] = "85de72556781480a38897a77de5b458ae3838b0fd589593679a1b5f34d181d84"
-
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/GitPython/"
-UPSTREAM_CHECK_REGEX = "/GitPython/(?P<pver>(\d+[\.\-_]*)+)"
-
-S = "${WORKDIR}/GitPython-${PV}"
-
-BBCLASSEXTEND = "nativesdk"
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
diff --git a/meta/recipes-devtools/python/python3-git_1.0.2.bb b/meta/recipes-devtools/python/python3-git_1.0.2.bb
index 6620444..2eef462 100644
--- a/meta/recipes-devtools/python/python3-git_1.0.2.bb
+++ b/meta/recipes-devtools/python/python3-git_1.0.2.bb
@@ -1,5 +1,24 @@
-require python-git.inc
+SUMMARY = "Python library used to interact with Git repositories"
+DESCRIPTION = "GitPython provides object model read and write access to \
+a git repository. Access repository information conveniently, alter the \
+index directly, handle remotes, or go down to low-level object database \
+access with big-files support."
+HOMEPAGE = "http://github.com/gitpython-developers/GitPython"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
 
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
 DEPENDS = "python3-gitdb"
 
 inherit setuptools3
-- 
2.8.0


