Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8B7F977047
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 07:43:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4I7hknL025806
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 00:43:47 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 18 May 2016 00:43:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 00:43:39 -0700
Message-ID: <9ca67672674df883812d50e036e3cf956d43de84.1463557068.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1463557068.git.liezhi.yang@windriver.com>
References: <cover.1463557068.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] python3-smmap: add it for python3-gitdb
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
X-List-Received-Date: Wed, 18 May 2016 07:43:49 -0000
Content-Type: text/plain

Need add python3-git to buildtools-tarball for the py3 build, and the
dependencies chain is:

python3-git -> python3-gitdb -> python3-smmap

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/python/python-smmap.inc       | 19 +++++++++++++++++++
 meta/recipes-devtools/python/python-smmap_0.9.0.bb  | 20 +-------------------
 meta/recipes-devtools/python/python3-smmap_0.9.0.bb |  5 +++++
 3 files changed, 25 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-smmap.inc
 create mode 100644 meta/recipes-devtools/python/python3-smmap_0.9.0.bb

diff --git a/meta/recipes-devtools/python/python-smmap.inc b/meta/recipes-devtools/python/python-smmap.inc
new file mode 100644
index 0000000..5b2ac74
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smmap.inc
@@ -0,0 +1,19 @@
+SUMMARY = "Python implementation of a sliding window memory map manager"
+DESCRIPTION = "A pure Python implementation of a sliding memory map to \
+help unifying memory mapped access on 32 and 64 bit systems and to help \
+managing resources more efficiently."
+HOMEPAGE = "http://github.com/gitpython-developers/GitPython"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
+
+SRC_URI = "http://pypi.python.org/packages/source/s/smmap/smmap-${PV}.tar.gz"
+SRC_URI[md5sum] = "d7932d5ace206bf4ae15198cf36fb6ab"
+SRC_URI[sha256sum] = "0e2b62b497bd5f0afebc002eda4d90df9d209c30ef257e8673c90a6b5c119d62"
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/smmap/"
+UPSTREAM_CHECK_REGEX = "/smmap/(?P<pver>(\d+[\.\-_]*)+)"
+
+S = "${WORKDIR}/smmap-${PV}"
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python-smmap_0.9.0.bb b/meta/recipes-devtools/python/python-smmap_0.9.0.bb
index 5f9cf45..c118dd8 100644
--- a/meta/recipes-devtools/python/python-smmap_0.9.0.bb
+++ b/meta/recipes-devtools/python/python-smmap_0.9.0.bb
@@ -1,23 +1,5 @@
-SUMMARY = "Python implementation of a sliding window memory map manager"
-DESCRIPTION = "A pure Python implementation of a sliding memory map to \
-help unifying memory mapped access on 32 and 64 bit systems and to help \
-managing resources more efficiently."
-HOMEPAGE = "http://github.com/gitpython-developers/GitPython"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
-
-SRC_URI = "http://pypi.python.org/packages/source/s/smmap/smmap-${PV}.tar.gz"
-SRC_URI[md5sum] = "d7932d5ace206bf4ae15198cf36fb6ab"
-SRC_URI[sha256sum] = "0e2b62b497bd5f0afebc002eda4d90df9d209c30ef257e8673c90a6b5c119d62"
-
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/smmap/"
-UPSTREAM_CHECK_REGEX = "/smmap/(?P<pver>(\d+[\.\-_]*)+)"
-
-S = "${WORKDIR}/smmap-${PV}"
+require python-smmap.inc
 
 inherit setuptools
 
 RDEPENDS_${PN} += "python-codecs python-mmap python-lang"
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python3-smmap_0.9.0.bb b/meta/recipes-devtools/python/python3-smmap_0.9.0.bb
new file mode 100644
index 0000000..9f8a26d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-smmap_0.9.0.bb
@@ -0,0 +1,5 @@
+require python-smmap.inc
+
+inherit setuptools3
+
+RDEPENDS_${PN} += "python3-codecs python3-mmap python3-lang"
-- 
2.8.0


