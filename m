Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 033B1719DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 22:31:39 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 17 Nov 2016 14:31:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,655,1473145200"; d="scan'208";a="32578052"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by orsmga005.jf.intel.com with ESMTP; 17 Nov 2016 14:31:34 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2016 16:32:46 -0600
Message-Id: <20161117223246.24271-1-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH V2] python3-setuptools: upgrade to 28.8.0
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
X-List-Received-Date: Thu, 17 Nov 2016 22:31:40 -0000

It is a simultaneous upgrade for python 2 and 3 over setuptools.

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
---
 meta/recipes-devtools/python/python-setuptools.inc                  | 6 +++---
 .../{python-setuptools_22.0.5.bb => python-setuptools_28.8.0.bb}    | 0
 .../{python3-setuptools_22.0.5.bb => python3-setuptools_28.8.0.bb}  | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_22.0.5.bb => python-setuptools_28.8.0.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_22.0.5.bb => python3-setuptools_28.8.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 92ca9a0..d3eef13 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -3,14 +3,14 @@ HOMEPAGE = "https://pypi.python.org/pypi/setuptools"
 SECTION = "devel/python"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://setup.py;beginline=134;endline=134;md5=3e8df024d6c1442d18e84acf8fbbc475"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=146;endline=146;md5=3e8df024d6c1442d18e84acf8fbbc475"
 
 SRCNAME = "setuptools"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "869f3029dcc66a64ba39875e2a2f044a"
-SRC_URI[sha256sum] = "19aad19471052d5daefe96f2c1fa2e88dcdb17488bf8708d7e6356881ea833cb"
+SRC_URI[md5sum] = "43d6eb25f60e8a2682a8f826ce9e3f42"
+SRC_URI[sha256sum] = "432a1ad4044338c34c2d09b0ff75d509b9849df8cf329f4c1c7706d9c2ba3c61"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_22.0.5.bb b/meta/recipes-devtools/python/python-setuptools_28.8.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_22.0.5.bb
rename to meta/recipes-devtools/python/python-setuptools_28.8.0.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_22.0.5.bb b/meta/recipes-devtools/python/python3-setuptools_28.8.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_22.0.5.bb
rename to meta/recipes-devtools/python/python3-setuptools_28.8.0.bb
-- 
2.9.3


