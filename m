Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 69C91755C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 15:56:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 15 Dec 2016 07:56:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,352,1477983600"; d="scan'208";a="912561528"
Received: from jalamego-mobl2.zpn.intel.com ([10.219.5.137])
	by orsmga003.jf.intel.com with ESMTP; 15 Dec 2016 07:56:12 -0800
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 09:56:02 -0600
Message-Id: <1481817362-29580-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] python*-git: Upgrade to version 2.1.1
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
X-List-Received-Date: Thu, 15 Dec 2016 15:56:11 -0000

Both python-git and python3-git need to be upgraded to latest upstream
version.
This change was tested using qemux86 with core-image-sato.
For each recipe test, CORE_IMAGE_EXTRA_INSTALL included
python and python-git,
and python3, python3-modules and python3-git, respectively.

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/recipes-devtools/python/python-git.inc                           | 4 ++--
 .../python/{python-git_2.1.0.bb => python-git_2.1.1.bb}               | 0
 .../python/{python3-git_2.1.0.bb => python3-git_2.1.1.bb}             | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-git_2.1.0.bb => python-git_2.1.1.bb} (100%)
 rename meta/recipes-devtools/python/{python3-git_2.1.0.bb => python3-git_2.1.1.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-git.inc b/meta/recipes-devtools/python/python-git.inc
index ad41561..feddf27 100644
--- a/meta/recipes-devtools/python/python-git.inc
+++ b/meta/recipes-devtools/python/python-git.inc
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "29b1fcf504d080dc7a5e630957e829d7"
-SRC_URI[sha256sum] = "3ebda1e6ff1ef68597e41dcd1b99c2a5ae902f4dc2b22ad3533cc89c32b42aad"
+SRC_URI[md5sum] = "77f8339e68dedb6d7c4e26371a588ed9"
+SRC_URI[sha256sum] = "e96f8e953cf9fee0a7599fc587667591328760b6341a0081ef311a942fc96204"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/GitPython/"
 UPSTREAM_CHECK_REGEX = "/GitPython/(?P<pver>(\d+[\.\-_]*)+)"
diff --git a/meta/recipes-devtools/python/python-git_2.1.0.bb b/meta/recipes-devtools/python/python-git_2.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-git_2.1.0.bb
rename to meta/recipes-devtools/python/python-git_2.1.1.bb
diff --git a/meta/recipes-devtools/python/python3-git_2.1.0.bb b/meta/recipes-devtools/python/python3-git_2.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-git_2.1.0.bb
rename to meta/recipes-devtools/python/python3-git_2.1.1.bb
-- 
1.9.1


