Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 41CD265C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 03:25:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4O3PmsK000996
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 20:25:48 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 23 May 2016 20:25:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 May 2016 20:25:41 -0700
Message-ID: <8041e839d0f034e49d5bab0b736d2874f67bae99.1464060246.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1464060246.git.liezhi.yang@windriver.com>
References: <cover.1464060246.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] python-gitdb: remove it
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
X-List-Received-Date: Tue, 24 May 2016 03:25:47 -0000
Content-Type: text/plain

It was needed by python-git, no one requires it any more now.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/python/python-gitdb.inc       | 16 ----------------
 meta/recipes-devtools/python/python-gitdb_0.6.4.bb  |  7 -------
 meta/recipes-devtools/python/python3-gitdb_0.6.4.bb | 17 ++++++++++++++++-
 3 files changed, 16 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-gitdb.inc
 delete mode 100644 meta/recipes-devtools/python/python-gitdb_0.6.4.bb

diff --git a/meta/recipes-devtools/python/python-gitdb.inc b/meta/recipes-devtools/python/python-gitdb.inc
deleted file mode 100644
index 6467bd2..0000000
--- a/meta/recipes-devtools/python/python-gitdb.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "A pure-Python git object database"
-HOMEPAGE = "http://github.com/gitpython-developers/gitdb"
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=59e5ecb13339a936eedf83282eaf4528"
-
-SRC_URI = "https://pypi.python.org/packages/source/g/gitdb/gitdb-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "44e4366b8bdfd306b075c3a52c96ae1a"
-SRC_URI[sha256sum] = "a3ebbc27be035a2e874ed904df516e35f4a29a778a764385de09de9e0f139658"
-
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/gitdb/"
-
-S = "${WORKDIR}/gitdb-${PV}"
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python-gitdb_0.6.4.bb b/meta/recipes-devtools/python/python-gitdb_0.6.4.bb
deleted file mode 100644
index 1777395..0000000
--- a/meta/recipes-devtools/python/python-gitdb_0.6.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require python-gitdb.inc
-
-DEPENDS = "python-async python-smmap"
-
-inherit distutils
-
-RDEPENDS_${PN} += "python-smmap python-async python-mmap python-lang python-zlib python-io python-shell"
diff --git a/meta/recipes-devtools/python/python3-gitdb_0.6.4.bb b/meta/recipes-devtools/python/python3-gitdb_0.6.4.bb
index 9927658..0e6508f 100644
--- a/meta/recipes-devtools/python/python3-gitdb_0.6.4.bb
+++ b/meta/recipes-devtools/python/python3-gitdb_0.6.4.bb
@@ -1,4 +1,19 @@
-require python-gitdb.inc
+SUMMARY = "A pure-Python git object database"
+HOMEPAGE = "http://github.com/gitpython-developers/gitdb"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=59e5ecb13339a936eedf83282eaf4528"
+
+SRC_URI = "https://pypi.python.org/packages/source/g/gitdb/gitdb-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "44e4366b8bdfd306b075c3a52c96ae1a"
+SRC_URI[sha256sum] = "a3ebbc27be035a2e874ed904df516e35f4a29a778a764385de09de9e0f139658"
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/gitdb/"
+
+S = "${WORKDIR}/gitdb-${PV}"
+
+BBCLASSEXTEND = "nativesdk"
 
 DEPENDS = "python3-async python3-smmap"
 
-- 
2.8.0


