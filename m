Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5BD8071ACD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 20:33:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 30 Nov 2016 12:33:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,574,1473145200"; d="scan'208";a="907317999"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by orsmga003.jf.intel.com with ESMTP; 30 Nov 2016 12:33:14 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 14:34:32 -0600
Message-Id: <20161130203432.2965-1-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH v3] python3-setuptools: upgrade to 29.0.1
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
X-List-Received-Date: Wed, 30 Nov 2016 20:33:13 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

It is a simultaneous upgrade for python 2 and 3 over setuptools.

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
---
 meta/recipes-devtools/python/python-setuptools.inc                    | 4 ++--
 .../{python-setuptools_28.8.0.bb => python-setuptools_29.0.1.bb}      | 0
 .../{python3-setuptools_28.8.0.bb => python3-setuptools_29.0.1.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_28.8.0.bb => python-setuptools_29.0.1.bb} (100%)
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
 
diff --git a/meta/recipes-devtools/python/python-setuptools_28.8.0.bb b/meta/recipes-devtools/python/python-setuptools_29.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_28.8.0.bb
rename to meta/recipes-devtools/python/python-setuptools_29.0.1.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_28.8.0.bb b/meta/recipes-devtools/python/python3-setuptools_29.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_28.8.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_29.0.1.bb
-- 
2.9.3


