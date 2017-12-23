Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C612C60750
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Dec 2017 02:59:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Dec 2017 18:59:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,443,1508828400"; d="scan'208";a="14033900"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Dec 2017 18:59:56 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Dec 2017 18:59:47 -0800
Message-Id: <20171223025947.10148-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] python-gitdb: upgrade to v2.0.3
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
X-List-Received-Date: Sat, 23 Dec 2017 02:59:55 -0000

* Change PYPI_PACKAGE to gitdb2 to reflect upstream change
* Now inherits setuptools rather than distutils

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python-gitdb.inc                     | 8 +++++---
 .../python/{python3-gitdb_0.6.4.bb => python3-gitdb_2.0.3.bb}     | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-gitdb_0.6.4.bb => python3-gitdb_2.0.3.bb} (55%)

diff --git a/meta/recipes-devtools/python/python-gitdb.inc b/meta/recipes-devtools/python/python-gitdb.inc
index 5fa8885eb93..b32b869a02f 100644
--- a/meta/recipes-devtools/python/python-gitdb.inc
+++ b/meta/recipes-devtools/python/python-gitdb.inc
@@ -6,10 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=59e5ecb13339a936eedf83282eaf4528"
 
 inherit pypi
 
-SRC_URI[md5sum] = "44e4366b8bdfd306b075c3a52c96ae1a"
-SRC_URI[sha256sum] = "a3ebbc27be035a2e874ed904df516e35f4a29a778a764385de09de9e0f139658"
+PYPI_PACKAGE = "gitdb2"
 
-DEPENDS = "${PYTHON_PN}-async ${PYTHON_PN}-smmap"
+SRC_URI[md5sum] = "d5217eb94ebd36fcec62b929d1f72b00"
+SRC_URI[sha256sum] = "b60e29d4533e5e25bb50b7678bbc187c8f6bcff1344b4f293b2ba55c85795f09"
+
+DEPENDS = "${PYTHON_PN}-async ${PYTHON_PN}-setuptools-native ${PYTHON_PN}-smmap"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-async \
                    ${PYTHON_PN}-compression \
diff --git a/meta/recipes-devtools/python/python3-gitdb_0.6.4.bb b/meta/recipes-devtools/python/python3-gitdb_2.0.3.bb
similarity index 55%
rename from meta/recipes-devtools/python/python3-gitdb_0.6.4.bb
rename to meta/recipes-devtools/python/python3-gitdb_2.0.3.bb
index e46a4387579..fe158327cbe 100644
--- a/meta/recipes-devtools/python/python3-gitdb_0.6.4.bb
+++ b/meta/recipes-devtools/python/python3-gitdb_2.0.3.bb
@@ -1,2 +1,2 @@
-inherit distutils3
+inherit setuptools3
 require python-gitdb.inc
-- 
2.13.6


