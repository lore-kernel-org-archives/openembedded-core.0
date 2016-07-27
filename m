Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4BD64731CA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 21:55:45 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jul 2016 14:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,431,1464678000"; d="scan'208";a="854815529"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga003.jf.intel.com with ESMTP; 27 Jul 2016 14:55:46 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 21:52:59 +0000
Message-Id: <88b4356a525164bda1717489d2051205f8a9fd17.1469656341.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <a3e42644f10b61eb3dce9f12ca91a8e52cbce576.1469656341.git.alejandro.hernandez@linux.intel.com>
References: <a3e42644f10b61eb3dce9f12ca91a8e52cbce576.1469656341.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1469656341.git.alejandro.hernandez@linux.intel.com>
References: <cover.1469656341.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 3/5] python-pexpect: Upgrade to 4.2.0
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
 .../python/{python-pexpect_4.1.0.bb => python-pexpect_4.2.0.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python-pexpect_4.1.0.bb => python-pexpect_4.2.0.bb} (71%)

diff --git a/meta/recipes-devtools/python/python-pexpect_4.1.0.bb b/meta/recipes-devtools/python/python-pexpect_4.2.0.bb
similarity index 71%
rename from meta/recipes-devtools/python/python-pexpect_4.1.0.bb
rename to meta/recipes-devtools/python/python-pexpect_4.2.0.bb
index 10590e4..82e0fa8 100644
--- a/meta/recipes-devtools/python/python-pexpect_4.1.0.bb
+++ b/meta/recipes-devtools/python/python-pexpect_4.2.0.bb
@@ -2,13 +2,13 @@ SUMMARY = "A Pure Python Expect like Module for Python"
 HOMEPAGE = "http://pexpect.readthedocs.org/"
 SECTION = "devel/python"
 LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=66c2378a96b307d56bfb3a9e58edafa8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1c7a725251880af8c6a148181665385b"
 
 SRCNAME = "pexpect"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "562a1a21f2a60b36dfd5d906dbf0943e"
-SRC_URI[sha256sum] = "c381c60f1987355b65df8f08a27f428831914c8a81091bd1778ac336fa2f27e7"
+SRC_URI[md5sum] = "8071ec5df0f3d515daedafad672d1632"
+SRC_URI[sha256sum] = "bf6816b8cc8d301a499e7adf338828b39bc7548eb64dbed4dd410ed93d95f853"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
 
-- 
2.6.6


