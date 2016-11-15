Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C17686025F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 22:06:15 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP; 15 Nov 2016 14:06:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,496,1473145200"; d="scan'208";a="31774123"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by fmsmga006.fm.intel.com with ESMTP; 15 Nov 2016 14:06:16 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 16:07:35 -0600
Message-Id: <20161115220735.23514-1-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH] python3-setuptools: upgrade to 28.8.0
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
X-List-Received-Date: Tue, 15 Nov 2016 22:06:17 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
---
 meta/recipes-devtools/python/python-setuptools.inc                  | 6 +++---
 .../{python3-setuptools_22.0.5.bb => python3-setuptools_28.8.0.bb}  | 0
 2 files changed, 3 insertions(+), 3 deletions(-)
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
 
diff --git a/meta/recipes-devtools/python/python3-setuptools_22.0.5.bb b/meta/recipes-devtools/python/python3-setuptools_28.8.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_22.0.5.bb
rename to meta/recipes-devtools/python/python3-setuptools_28.8.0.bb
-- 
2.9.3


