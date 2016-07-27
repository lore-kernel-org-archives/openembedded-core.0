Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A8BF9731C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 21:55:45 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jul 2016 14:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,431,1464678000"; d="scan'208";a="854815533"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga003.jf.intel.com with ESMTP; 27 Jul 2016 14:55:46 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 21:53:01 +0000
Message-Id: <b557fdcae7032c2b278c092112e8bb63e4a4a631.1469656341.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <a3e42644f10b61eb3dce9f12ca91a8e52cbce576.1469656341.git.alejandro.hernandez@linux.intel.com>
References: <a3e42644f10b61eb3dce9f12ca91a8e52cbce576.1469656341.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1469656341.git.alejandro.hernandez@linux.intel.com>
References: <cover.1469656341.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 5/5] python-git: Upgrade python-git and python3-git to 2.0.7
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
 meta/recipes-devtools/python/python-git.inc                            | 3 +++
 .../python/{python-git_2.0.5.bb => python-git_2.0.7.bb}                | 3 ---
 .../python/{python3-git_1.0.2.bb => python3-git_2.0.7.bb}              | 3 ---
 3 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python-git_2.0.5.bb => python-git_2.0.7.bb} (59%)
 rename meta/recipes-devtools/python/{python3-git_1.0.2.bb => python3-git_2.0.7.bb} (61%)

diff --git a/meta/recipes-devtools/python/python-git.inc b/meta/recipes-devtools/python/python-git.inc
index 4cb53e7..13c097a 100644
--- a/meta/recipes-devtools/python/python-git.inc
+++ b/meta/recipes-devtools/python/python-git.inc
@@ -10,6 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
 
+SRC_URI[md5sum] = "aa0ba9df0abe4c8f35dd7bb9be85d56e"
+SRC_URI[sha256sum] = "d8e7adaacceedd3d043e6cd2544f57dbe00c53fc26374880b7cea67f3188aa68"
+
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/GitPython/"
 UPSTREAM_CHECK_REGEX = "/GitPython/(?P<pver>(\d+[\.\-_]*)+)"
 
diff --git a/meta/recipes-devtools/python/python-git_2.0.5.bb b/meta/recipes-devtools/python/python-git_2.0.7.bb
similarity index 59%
rename from meta/recipes-devtools/python/python-git_2.0.5.bb
rename to meta/recipes-devtools/python/python-git_2.0.7.bb
index de4c76e..e49dbea 100644
--- a/meta/recipes-devtools/python/python-git_2.0.5.bb
+++ b/meta/recipes-devtools/python/python-git_2.0.7.bb
@@ -1,8 +1,5 @@
 require python-git.inc
 
-SRC_URI[md5sum] = "f4f60f269fb5f6a332c653a5bc015239"
-SRC_URI[sha256sum] = "20f3c90fb8a11edc52d363364fb0a116a410c7b7bdee24a433712b5413d1028e"
-
 DEPENDS = "python-gitdb"
 
 inherit setuptools
diff --git a/meta/recipes-devtools/python/python3-git_1.0.2.bb b/meta/recipes-devtools/python/python3-git_2.0.7.bb
similarity index 61%
rename from meta/recipes-devtools/python/python3-git_1.0.2.bb
rename to meta/recipes-devtools/python/python3-git_2.0.7.bb
index 034708e..6620444 100644
--- a/meta/recipes-devtools/python/python3-git_1.0.2.bb
+++ b/meta/recipes-devtools/python/python3-git_2.0.7.bb
@@ -1,8 +1,5 @@
 require python-git.inc
 
-SRC_URI[md5sum] = "d92d96a8da0fc77cf141d3e16084e094"
-SRC_URI[sha256sum] = "85de72556781480a38897a77de5b458ae3838b0fd589593679a1b5f34d181d84"
-
 DEPENDS = "python3-gitdb"
 
 inherit setuptools3
-- 
2.6.6


