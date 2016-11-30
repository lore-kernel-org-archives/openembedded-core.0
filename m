Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3A56471AB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 17:56:22 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP; 30 Nov 2016 09:56:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,574,1473145200"; d="scan'208";a="37506729"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by fmsmga006.fm.intel.com with ESMTP; 30 Nov 2016 09:56:23 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 11:57:38 -0600
Message-Id: <20161130175738.29582-1-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH v2] python3-setuptools: upgrade to 29.0.1
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
X-List-Received-Date: Wed, 30 Nov 2016 17:56:23 -0000

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
---
 meta/recipes-devtools/python/python-setuptools.inc                    | 4 ++--
 .../{python3-setuptools_28.8.0.bb => python3-setuptools_29.0.1.bb}    | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_28.8.0.bb => python3-setuptools_29.0.1.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index d3eef13..e76484a 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -9,8 +9,8 @@ SRCNAME = "setuptools"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "43d6eb25f60e8a2682a8f826ce9e3f42"
-SRC_URI[sha256sum] = "432a1ad4044338c34c2d09b0ff75d509b9849df8cf329f4c1c7706d9c2ba3c61"
+SRC_URI[md5sum] = "28ecfd0f2574b489b9a18343879a7324"
+SRC_URI[sha256sum] = "b539118819a4857378398891fa5366e090690e46b3e41421a1e07d6e9fd8feb0"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
 
diff --git a/meta/recipes-devtools/python/python3-setuptools_28.8.0.bb b/meta/recipes-devtools/python/python3-setuptools_29.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_28.8.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_29.0.1.bb
-- 
2.9.3


