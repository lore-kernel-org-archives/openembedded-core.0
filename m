Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 46B636FFCE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 03:25:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4O3PlDL003363
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 20:25:47 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 23 May 2016 20:25:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 May 2016 20:25:40 -0700
Message-ID: <66f9dec4b4739593f81b49866611c97ca6b68608.1464060246.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1464060246.git.liezhi.yang@windriver.com>
References: <cover.1464060246.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] python-smmap: remove it
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
X-List-Received-Date: Tue, 24 May 2016 03:25:46 -0000
Content-Type: text/plain

It was needed by python-gitdb, no one requires it any more now.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/python/python-smmap.inc       | 19 -------------------
 meta/recipes-devtools/python/python-smmap_0.9.0.bb  |  5 -----
 meta/recipes-devtools/python/python3-smmap_0.9.0.bb | 20 +++++++++++++++++++-
 3 files changed, 19 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-smmap.inc
 delete mode 100644 meta/recipes-devtools/python/python-smmap_0.9.0.bb

diff --git a/meta/recipes-devtools/python/python-smmap.inc b/meta/recipes-devtools/python/python-smmap.inc
deleted file mode 100644
index 5b2ac74..0000000
--- a/meta/recipes-devtools/python/python-smmap.inc
+++ /dev/null
@@ -1,19 +0,0 @@
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
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python-smmap_0.9.0.bb b/meta/recipes-devtools/python/python-smmap_0.9.0.bb
deleted file mode 100644
index c118dd8..0000000
--- a/meta/recipes-devtools/python/python-smmap_0.9.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-smmap.inc
-
-inherit setuptools
-
-RDEPENDS_${PN} += "python-codecs python-mmap python-lang"
diff --git a/meta/recipes-devtools/python/python3-smmap_0.9.0.bb b/meta/recipes-devtools/python/python3-smmap_0.9.0.bb
index 9f8a26d..c6b0755 100644
--- a/meta/recipes-devtools/python/python3-smmap_0.9.0.bb
+++ b/meta/recipes-devtools/python/python3-smmap_0.9.0.bb
@@ -1,4 +1,22 @@
-require python-smmap.inc
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
 
 inherit setuptools3
 
-- 
2.8.0


