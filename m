Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8D6C477317
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 22:44:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 15 Dec 2016 14:44:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,354,1477983600"; d="scan'208";a="18699255"
Received: from jalamego-mobl2.zpn.intel.com ([10.219.5.137])
	by orsmga002.jf.intel.com with ESMTP; 15 Dec 2016 14:44:46 -0800
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 16:44:45 -0600
Message-Id: <1481841885-2197-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] python*-git: Upgrade to version 2.1.1
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
X-List-Received-Date: Thu, 15 Dec 2016 22:44:46 -0000

Both python-git and python3-git need to be upgraded to latest upstream
version.
This change includes python3 dependencies added and was tested
using qemux86 with core-image-sato.

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---

Notes:
    Changes in patch v2: python3 dependencies added

 meta/recipes-devtools/python/python-git.inc                           | 4 ++--
 .../python/{python-git_2.1.0.bb => python-git_2.1.1.bb}               | 0
 .../python/{python3-git_2.1.0.bb => python3-git_2.1.1.bb}             | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python-git_2.1.0.bb => python-git_2.1.1.bb} (100%)
 rename meta/recipes-devtools/python/{python3-git_2.1.0.bb => python3-git_2.1.1.bb} (82%)

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
similarity index 82%
rename from meta/recipes-devtools/python/python3-git_2.1.0.bb
rename to meta/recipes-devtools/python/python3-git_2.1.1.bb
index c9fe9ba..7a2d452 100644
--- a/meta/recipes-devtools/python/python3-git_2.1.0.bb
+++ b/meta/recipes-devtools/python/python3-git_2.1.1.bb
@@ -4,4 +4,4 @@ DEPENDS = "python3-gitdb"
 
 inherit setuptools3
 
-RDEPENDS_${PN} += "python3-gitdb python3-lang python3-io python3-shell python3-math python3-re python3-subprocess python3-stringold python3-unixadmin python3-enum python3-logging python3-datetime python3-netclient"
+RDEPENDS_${PN} += "python3-gitdb python3-lang python3-io python3-shell python3-math python3-re python3-subprocess python3-stringold python3-unixadmin python3-enum python3-logging python3-datetime python3-netclient python3-unittest python3-argparse"
-- 
1.9.1


