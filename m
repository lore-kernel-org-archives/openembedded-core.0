Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3110672FB0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 21:19:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 14:19:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,362,1503385200"; d="scan'208";a="1181036896"
Received: from jalamego-mobl3.zpn.intel.com ([10.219.128.138])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 14:19:25 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 16:19:23 -0500
Message-Id: <1507756763-30528-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python*-setuptools: update to 36.5.0
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
X-List-Received-Date: Wed, 11 Oct 2017 21:19:35 -0000

Both python-setuptools and python3-setuptools must be updated
to latest stable release.

These changes were tested on qemu with core-image-minimal

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/recipes-devtools/python/python-setuptools.inc                    | 4 ++--
 .../{python-setuptools_36.2.7.bb => python-setuptools_36.5.0.bb}      | 0
 .../{python3-setuptools_36.2.7.bb => python3-setuptools_36.5.0.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_36.2.7.bb => python-setuptools_36.5.0.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_36.2.7.bb => python3-setuptools_36.5.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index ca521a9..1eae0b6 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -9,8 +9,8 @@ SRCNAME = "setuptools"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.zip"
 
-SRC_URI[md5sum] = "b9e6c049617bac0f9e908a41ab4a29ac"
-SRC_URI[sha256sum] = "b0fe5d432d922df595e918577c51458d63f245115d141b309ac32ecfca329df5"
+SRC_URI[md5sum] = "704f500dd55f4bd0be905444f3ba892c"
+SRC_URI[sha256sum] = "ce2007c1cea3359870b80657d634253a0765b0c7dc5a988d77ba803fc86f2c64"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_36.2.7.bb b/meta/recipes-devtools/python/python-setuptools_36.5.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_36.2.7.bb
rename to meta/recipes-devtools/python/python-setuptools_36.5.0.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_36.2.7.bb b/meta/recipes-devtools/python/python3-setuptools_36.5.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_36.2.7.bb
rename to meta/recipes-devtools/python/python3-setuptools_36.5.0.bb
-- 
2.7.4


