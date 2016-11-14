Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 83B70719C0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 17:31:53 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 14 Nov 2016 09:31:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,491,1473145200"; d="scan'208";a="31113782"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by orsmga005.jf.intel.com with ESMTP; 14 Nov 2016 09:31:50 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2016 11:33:09 -0600
Message-Id: <20161114173309.1690-1-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH V2] python3-git: upgrade to 2.1.0
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
X-List-Received-Date: Mon, 14 Nov 2016 17:31:56 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
---
 meta/recipes-devtools/python/python-git.inc                           | 4 ++--
 .../python/{python3-git_2.0.7.bb => python3-git_2.1.0.bb}             | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-git_2.0.7.bb => python3-git_2.1.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-git.inc b/meta/recipes-devtools/python/python-git.inc
index 13c097a..ad41561 100644
--- a/meta/recipes-devtools/python/python-git.inc
+++ b/meta/recipes-devtools/python/python-git.inc
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
 
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
2.1.4


