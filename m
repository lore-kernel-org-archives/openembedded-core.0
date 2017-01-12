Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 889996FFD3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 20:50:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jan 2017 12:50:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,219,1477983600"; d="scan'208";a="1111769356"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.47])
	by fmsmga002.fm.intel.com with ESMTP; 12 Jan 2017 12:50:25 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2017 14:51:56 -0600
Message-Id: <1484254316-30723-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] python3-setuptools: upgrade to 31.1.1
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
X-List-Received-Date: Thu, 12 Jan 2017 20:50:26 -0000

It is a simultaneous upgrade for python 2 and 3 over setuptools.

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
---
 meta/recipes-devtools/python/python-setuptools.inc                    | 4 ++--
 .../{python-setuptools_31.0.0.bb => python-setuptools_32.1.1.bb}      | 0
 .../{python3-setuptools_31.0.0.bb => python3-setuptools_32.1.1.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_31.0.0.bb => python-setuptools_32.1.1.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_31.0.0.bb => python3-setuptools_32.1.1.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 858595c..40f47d4 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -9,8 +9,8 @@ SRCNAME = "setuptools"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "66da89eeb1f33c2b947f316cfb3d7c7e"
-SRC_URI[sha256sum] = "0818cc0de692c3a5c83ca83aa7ec7ba6bc206f278735f1e0267b8d0e095cfe7a"
+SRC_URI[md5sum] = "8b67868c3430e978833ebd0d1b766694"
+SRC_URI[sha256sum] = "8303fb24306385f09bf8b0e5a385c1548e42e8efc08558d64049bc0d55ea012d"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_31.0.0.bb b/meta/recipes-devtools/python/python-setuptools_32.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_31.0.0.bb
rename to meta/recipes-devtools/python/python-setuptools_32.1.1.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_31.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_32.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_31.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_32.1.1.bb
-- 
2.1.4


