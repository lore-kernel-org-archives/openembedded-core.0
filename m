Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C277B77F69
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 20:13:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2017 13:13:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,271,1496127600"; d="scan'208";a="1145380053"
Received: from jalamego-mobl3.zpn.intel.com ([10.219.128.120])
	by orsmga001.jf.intel.com with ESMTP; 27 Jun 2017 13:13:12 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 15:13:04 -0500
Message-Id: <1498594384-20590-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python*-setuptools: upgrade to 36.0.1
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
X-List-Received-Date: Tue, 27 Jun 2017 20:13:13 -0000

Both python-setuptools and python3-setuptools need to be
upgraded to latest upstream version.

license checksum is now targeted to be performed over the actual
license text at license file.

These changes were tested using qemux86 with core-image-minimal.

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/recipes-devtools/python/python-setuptools.inc                | 8 ++++----
 .../{python-setuptools_32.1.1.bb => python-setuptools_36.0.1.bb}  | 0
 ...{python3-setuptools_32.1.1.bb => python3-setuptools_36.0.1.bb} | 0
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_32.1.1.bb => python-setuptools_36.0.1.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_32.1.1.bb => python3-setuptools_36.0.1.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 40f47d4..c441035 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -3,14 +3,14 @@ HOMEPAGE = "https://pypi.python.org/pypi/setuptools"
 SECTION = "devel/python"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://setup.py;beginline=146;endline=146;md5=3e8df024d6c1442d18e84acf8fbbc475"
+LIC_FILES_CHKSUM = "file://LICENSE;beginline=1;endline=19;md5=9a33897f1bca1160d7aad3835152e158"
 
 SRCNAME = "setuptools"
 
-SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.zip"
 
-SRC_URI[md5sum] = "8b67868c3430e978833ebd0d1b766694"
-SRC_URI[sha256sum] = "8303fb24306385f09bf8b0e5a385c1548e42e8efc08558d64049bc0d55ea012d"
+SRC_URI[md5sum] = "430eb106788183eefe9f444a300007f0"
+SRC_URI[sha256sum] = "e17c4687fddd6d70a6604ac0ad25e33324cec71b5137267dd5c45e103c4b288a"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_32.1.1.bb b/meta/recipes-devtools/python/python-setuptools_36.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_32.1.1.bb
rename to meta/recipes-devtools/python/python-setuptools_36.0.1.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_32.1.1.bb b/meta/recipes-devtools/python/python3-setuptools_36.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_32.1.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_36.0.1.bb
-- 
2.7.4


