Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 30C61731CB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 05:57:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jun 2016 22:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,437,1459839600"; d="scan'208";a="993287625"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga002.jf.intel.com with ESMTP; 07 Jun 2016 22:57:09 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jun 2016 05:56:09 +0000
Message-Id: <a71f92e38782662b823eba9811ed2407fc689789.1465365165.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <12b9dd4338999b75a21fd1d293fa911e9dca3f1e.1465365165.git.alejandro.hernandez@linux.intel.com>
References: <12b9dd4338999b75a21fd1d293fa911e9dca3f1e.1465365165.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1465365165.git.alejandro.hernandez@linux.intel.com>
References: <cover.1465365165.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 3/9] python-git: Upgrade from 1.0.2 to 2.0.5
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
X-List-Received-Date: Wed, 08 Jun 2016 05:57:10 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python-git.inc                         | 6 +++---
 .../python/{python-git_1.0.2.bb => python-git_2.0.5.bb}             | 0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python-git_1.0.2.bb => python-git_2.0.5.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-git.inc b/meta/recipes-devtools/python/python-git.inc
index 72632b7..eba0082 100644
--- a/meta/recipes-devtools/python/python-git.inc
+++ b/meta/recipes-devtools/python/python-git.inc
@@ -8,10 +8,10 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
 
-SRC_URI = "http://pypi.python.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
+SRC_URI = "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d92d96a8da0fc77cf141d3e16084e094"
-SRC_URI[sha256sum] = "85de72556781480a38897a77de5b458ae3838b0fd589593679a1b5f34d181d84"
+SRC_URI[md5sum] = "f4f60f269fb5f6a332c653a5bc015239"
+SRC_URI[sha256sum] = "20f3c90fb8a11edc52d363364fb0a116a410c7b7bdee24a433712b5413d1028e"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/GitPython/"
 UPSTREAM_CHECK_REGEX = "/GitPython/(?P<pver>(\d+[\.\-_]*)+)"
diff --git a/meta/recipes-devtools/python/python-git_1.0.2.bb b/meta/recipes-devtools/python/python-git_2.0.5.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-git_1.0.2.bb
rename to meta/recipes-devtools/python/python-git_2.0.5.bb
-- 
2.6.6


