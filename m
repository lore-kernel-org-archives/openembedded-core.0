Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8198B6FF23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 03:25:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4O3Pk9w022192
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 20:25:46 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 23 May 2016 20:25:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 May 2016 20:25:39 -0700
Message-ID: <1260b4027358d5530960ffb89131adb6b85b0f95.1464060246.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1464060246.git.liezhi.yang@windriver.com>
References: <cover.1464060246.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] python-async: remove it
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
X-List-Received-Date: Tue, 24 May 2016 03:25:45 -0000
Content-Type: text/plain

It was needed by python-git, no one requires it any more now.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/python/python-async.inc       | 15 ---------------
 meta/recipes-devtools/python/python-async_0.6.2.bb  |  5 -----
 meta/recipes-devtools/python/python3-async_0.6.2.bb | 16 +++++++++++++++-
 3 files changed, 15 insertions(+), 21 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-async.inc
 delete mode 100644 meta/recipes-devtools/python/python-async_0.6.2.bb

diff --git a/meta/recipes-devtools/python/python-async.inc b/meta/recipes-devtools/python/python-async.inc
deleted file mode 100644
index d80606a..0000000
--- a/meta/recipes-devtools/python/python-async.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Python framework to process interdependent tasks in a pool of workers"
-HOMEPAGE = "http://github.com/gitpython-developers/async"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=88df8e78b9edfd744953862179f2d14e"
-
-SRC_URI = "http://pypi.python.org/packages/source/a/async/async-${PV}.tar.gz"
-SRC_URI[md5sum] = "9b06b5997de2154f3bc0273f80bcef6b"
-SRC_URI[sha256sum] = "ac6894d876e45878faae493b0cf61d0e28ec417334448ac0a6ea2229d8343051"
-
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/async/"
-
-S = "${WORKDIR}/async-${PV}"
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python-async_0.6.2.bb b/meta/recipes-devtools/python/python-async_0.6.2.bb
deleted file mode 100644
index d855e42..0000000
--- a/meta/recipes-devtools/python/python-async_0.6.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-async.inc
-
-inherit setuptools
-
-RDEPENDS_${PN} += "python-threading python-lang"
diff --git a/meta/recipes-devtools/python/python3-async_0.6.2.bb b/meta/recipes-devtools/python/python3-async_0.6.2.bb
index 54a30f5..6c1ac39 100644
--- a/meta/recipes-devtools/python/python3-async_0.6.2.bb
+++ b/meta/recipes-devtools/python/python3-async_0.6.2.bb
@@ -1,4 +1,18 @@
-require python-async.inc
+SUMMARY = "Python framework to process interdependent tasks in a pool of workers"
+HOMEPAGE = "http://github.com/gitpython-developers/async"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=88df8e78b9edfd744953862179f2d14e"
+
+SRC_URI = "http://pypi.python.org/packages/source/a/async/async-${PV}.tar.gz"
+SRC_URI[md5sum] = "9b06b5997de2154f3bc0273f80bcef6b"
+SRC_URI[sha256sum] = "ac6894d876e45878faae493b0cf61d0e28ec417334448ac0a6ea2229d8343051"
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/async/"
+
+S = "${WORKDIR}/async-${PV}"
+
+BBCLASSEXTEND = "nativesdk"
 
 inherit setuptools3
 
-- 
2.8.0


