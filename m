Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 5DE44719C3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 16:31:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 14 Nov 2016 08:31:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,491,1473145200"; d="scan'208";a="1085028309"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by fmsmga002.fm.intel.com with ESMTP; 14 Nov 2016 08:31:02 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2016 10:32:21 -0600
Message-Id: <20161114163221.20150-1-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH] python3-git: upgrade to 2.1.0
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
X-List-Received-Date: Mon, 14 Nov 2016 16:31:02 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
---
 meta/recipes-devtools/python/python-git.inc                         | 6 +++---
 .../python/{python3-git_2.0.7.bb => python3-git_2.1.0.bb}           | 0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-git_2.0.7.bb => python3-git_2.1.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-git.inc b/meta/recipes-devtools/python/python-git.inc
index 13c097a..e0ee73b 100644
--- a/meta/recipes-devtools/python/python-git.inc
+++ b/meta/recipes-devtools/python/python-git.inc
@@ -8,10 +8,10 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
 
-SRC_URI = "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/d7/16/e914d345d7d4e988f9196b9719a99220bad6a5dbd636162f9b5cc35f3bd6/GitPython-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "aa0ba9df0abe4c8f35dd7bb9be85d56e"
-SRC_URI[sha256sum] = "d8e7adaacceedd3d043e6cd2544f57dbe00c53fc26374880b7cea67f3188aa68"
+SRC_URI[md5sum] = "29b1fcf504d080dc7a5e630957e829d7"
+SRC_URI[sha256sum] = "3ebda1e6ff1ef68597e41dcd1b99c2a5ae902f4dc2b22ad3533cc89c32b42aad"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/GitPython/"
 UPSTREAM_CHECK_REGEX = "/GitPython/(?P<pver>(\d+[\.\-_]*)+)"
diff --git a/meta/recipes-devtools/python/python3-git_2.0.7.bb b/meta/recipes-devtools/python/python3-git_2.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-git_2.0.7.bb
rename to meta/recipes-devtools/python/python3-git_2.1.0.bb
-- 
2.9.3


