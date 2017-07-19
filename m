Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BA2D7782E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 17:20:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2017 10:20:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,381,1496127600"; d="scan'208";a="1174456787"
Received: from jalamego-mobl3.zpn.intel.com ([10.219.128.135])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2017 10:20:24 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 12:20:26 -0500
Message-Id: <1500484826-22626-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1498594384-20590-1-git-send-email-jose.a.lamego@linux.intel.com>
References: <1498594384-20590-1-git-send-email-jose.a.lamego@linux.intel.com>
Subject: [PATCH] python*-setuptools: upgrade to 36.2.0
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
X-List-Received-Date: Wed, 19 Jul 2017 17:20:26 -0000

Both python-setuptools and python3-setuptools need to be
upgraded to latest upstream version.

license checksum is now targeted to be performed over the actual
license text at license file.

These changes were tested using qemux86 with core-image-minimal.

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---

Notes:
    This patch replaces previous submission due to latest stable
    version at upstream got upgraded to a newer version.

 meta/recipes-devtools/python/python-setuptools.inc                | 8 ++++----
 .../{python-setuptools_32.1.1.bb => python-setuptools_36.2.0.bb}  | 0
 ...{python3-setuptools_32.1.1.bb => python3-setuptools_36.2.0.bb} | 0
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_32.1.1.bb => python-setuptools_36.2.0.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_32.1.1.bb => python3-setuptools_36.2.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 40f47d4..cd84233 100644
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
+SRC_URI[md5sum] = "60df703040ad8024d24727dc95483740"
+SRC_URI[sha256sum] = "4c2bda3829c9dbbe9c2b33d89c4b1cb6d45813615ab8e248ad352e3697a96d81"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_32.1.1.bb b/meta/recipes-devtools/python/python-setuptools_36.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_32.1.1.bb
rename to meta/recipes-devtools/python/python-setuptools_36.2.0.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_32.1.1.bb b/meta/recipes-devtools/python/python3-setuptools_36.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_32.1.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_36.2.0.bb
-- 
2.7.4


