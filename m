Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6A94F71957
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 16:48:14 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP; 16 Dec 2016 08:48:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,358,1477983600"; d="scan'208";a="43317080"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by fmsmga005.fm.intel.com with ESMTP; 16 Dec 2016 08:48:16 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2016 10:49:33 -0600
Message-Id: <1481906973-12826-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH V3] python3-setuptools: upgrade to 31.0.0
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
X-List-Received-Date: Fri, 16 Dec 2016 16:48:15 -0000

It is a simultaneous upgrade for python 2 and 3 over setuptools.

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
---
 meta/recipes-devtools/python/python-setuptools.inc                    | 4 ++--
 .../{python-setuptools_29.0.1.bb => python-setuptools_31.0.0.bb}      | 0
 .../{python3-setuptools_29.0.1.bb => python3-setuptools_31.0.0.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_29.0.1.bb => python-setuptools_31.0.0.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_29.0.1.bb => python3-setuptools_31.0.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index e76484a..858595c 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -9,8 +9,8 @@ SRCNAME = "setuptools"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "28ecfd0f2574b489b9a18343879a7324"
-SRC_URI[sha256sum] = "b539118819a4857378398891fa5366e090690e46b3e41421a1e07d6e9fd8feb0"
+SRC_URI[md5sum] = "66da89eeb1f33c2b947f316cfb3d7c7e"
+SRC_URI[sha256sum] = "0818cc0de692c3a5c83ca83aa7ec7ba6bc206f278735f1e0267b8d0e095cfe7a"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_29.0.1.bb b/meta/recipes-devtools/python/python-setuptools_31.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_29.0.1.bb
rename to meta/recipes-devtools/python/python-setuptools_31.0.0.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_29.0.1.bb b/meta/recipes-devtools/python/python3-setuptools_31.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_29.0.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_31.0.0.bb
-- 
2.1.4


