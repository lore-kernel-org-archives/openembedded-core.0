Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6F71B731CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 21:55:45 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jul 2016 14:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,431,1464678000"; d="scan'208";a="854815531"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga003.jf.intel.com with ESMTP; 27 Jul 2016 14:55:46 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 21:53:00 +0000
Message-Id: <52bfc6f9a541188d770dd84448279aa2b908ac7e.1469656341.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <a3e42644f10b61eb3dce9f12ca91a8e52cbce576.1469656341.git.alejandro.hernandez@linux.intel.com>
References: <a3e42644f10b61eb3dce9f12ca91a8e52cbce576.1469656341.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1469656341.git.alejandro.hernandez@linux.intel.com>
References: <cover.1469656341.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 4/5] python-setuptools: Upgrade to v 25.1.0
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
X-List-Received-Date: Wed, 27 Jul 2016 21:55:45 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python-setuptools.inc                    | 4 ++--
 .../{python-setuptools_22.0.5.bb => python-setuptools_25.1.0.bb}      | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_22.0.5.bb => python-setuptools_25.1.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 53a514b..8b38710 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -9,8 +9,8 @@ SRCNAME = "setuptools"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "869f3029dcc66a64ba39875e2a2f044a"
-SRC_URI[sha256sum] = "19aad19471052d5daefe96f2c1fa2e88dcdb17488bf8708d7e6356881ea833cb"
+SRC_URI[md5sum] = "a4814dead37e74a86883c66f7d420d73"
+SRC_URI[sha256sum] = "6a0f8111feb5a3438c6309cda49810a16d23e73c173331281edc37dd1374d1d5"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_22.0.5.bb b/meta/recipes-devtools/python/python-setuptools_25.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_22.0.5.bb
rename to meta/recipes-devtools/python/python-setuptools_25.1.0.bb
-- 
2.6.6


