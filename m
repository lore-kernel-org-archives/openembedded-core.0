Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 675346025F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 21:22:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 16 Nov 2016 13:22:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,650,1473145200"; d="scan'208";a="1086248667"
Received: from fsantes-mobl2.amr.corp.intel.com (HELO
	jalamego-MOBL2.zpn.intel.com) ([10.219.5.141])
	by fmsmga002.fm.intel.com with ESMTP; 16 Nov 2016 13:22:21 -0800
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2016 15:22:13 -0600
Message-Id: <1479331336-14097-2-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1479331336-14097-1-git-send-email-jose.a.lamego@linux.intel.com>
References: <1479331336-14097-1-git-send-email-jose.a.lamego@linux.intel.com>
Subject: [PATCH 1/4] python*-git: upgrade to 2.1.0
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
X-List-Received-Date: Wed, 16 Nov 2016 21:22:20 -0000

Both python-git and python3-git need to be upgraded to latest upstream
version.
This change was tested using qemux86 with core-image-sato.

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/recipes-devtools/python/python-git.inc                           | 4 ++--
 .../python/{python-git_2.0.7.bb => python-git_2.1.0.bb}               | 0
 .../python/{python3-git_2.0.7.bb => python3-git_2.1.0.bb}             | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-git_2.0.7.bb => python-git_2.1.0.bb} (100%)
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
diff --git a/meta/recipes-devtools/python/python-git_2.0.7.bb b/meta/recipes-devtools/python/python-git_2.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-git_2.0.7.bb
rename to meta/recipes-devtools/python/python-git_2.1.0.bb
diff --git a/meta/recipes-devtools/python/python3-git_2.0.7.bb b/meta/recipes-devtools/python/python3-git_2.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-git_2.0.7.bb
rename to meta/recipes-devtools/python/python3-git_2.1.0.bb
-- 
1.9.1


