Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id AC5576FEE0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 22:07:47 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 14 Nov 2016 14:07:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,640,1473145200"; d="scan'208";a="31183240"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by fmsmga005.fm.intel.com with ESMTP; 14 Nov 2016 14:07:47 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2016 16:09:07 -0600
Message-Id: <20161114220907.10988-1-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH] python3-pip: upgrade to 9.0.1
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
X-List-Received-Date: Mon, 14 Nov 2016 22:07:48 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
---
 .../python/{python3-pip_8.1.2.bb => python3-pip_9.0.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_8.1.2.bb => python3-pip_9.0.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pip_8.1.2.bb b/meta/recipes-devtools/python/python3-pip_9.0.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pip_8.1.2.bb
rename to meta/recipes-devtools/python/python3-pip_9.0.1.bb
index eefb4cb..6ac94bb 100644
--- a/meta/recipes-devtools/python/python3-pip_8.1.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_9.0.1.bb
@@ -9,8 +9,8 @@ DEPENDS += "python3 python3-setuptools-native"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "87083c0b9867963b29f7aba3613e8f4a"
-SRC_URI[sha256sum] = "4d24b03ffa67638a3fa931c09fd9e0273ffa904e95ebebe7d4b1a54c93d7b732"
+SRC_URI[md5sum] = "35f01da33009719497f01a4ba69d63c9"
+SRC_URI[sha256sum] = "09f243e1a7b461f654c26a725fa373211bb7ff17a9300058b205c61658ca940d"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pip"
 
-- 
1.9.1


