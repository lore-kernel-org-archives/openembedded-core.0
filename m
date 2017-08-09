Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E54D577DB6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 20:01:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Aug 2017 13:01:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,349,1498546800"; d="scan'208";a="1160964633"
Received: from jalamego-mobl3.zpn.intel.com ([10.219.128.130])
	by orsmga001.jf.intel.com with ESMTP; 09 Aug 2017 13:01:14 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Aug 2017 15:01:04 -0500
Message-Id: <1502308864-22679-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python*-setuptools: update to 36.2.7
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
X-List-Received-Date: Wed, 09 Aug 2017 20:01:14 -0000

Both python-setuptools and python3-setuptools must be updated
to latest stable release.

These changes were tested on qemu with core-image-minimal

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/recipes-devtools/python/python-setuptools.inc                    | 4 ++--
 .../{python-setuptools_36.2.0.bb => python-setuptools_36.2.7.bb}      | 0
 .../{python3-setuptools_36.2.0.bb => python3-setuptools_36.2.7.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_36.2.0.bb => python-setuptools_36.2.7.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_36.2.0.bb => python3-setuptools_36.2.7.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index cd84233..ca521a9 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -9,8 +9,8 @@ SRCNAME = "setuptools"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.zip"
 
-SRC_URI[md5sum] = "60df703040ad8024d24727dc95483740"
-SRC_URI[sha256sum] = "4c2bda3829c9dbbe9c2b33d89c4b1cb6d45813615ab8e248ad352e3697a96d81"
+SRC_URI[md5sum] = "b9e6c049617bac0f9e908a41ab4a29ac"
+SRC_URI[sha256sum] = "b0fe5d432d922df595e918577c51458d63f245115d141b309ac32ecfca329df5"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_36.2.0.bb b/meta/recipes-devtools/python/python-setuptools_36.2.7.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_36.2.0.bb
rename to meta/recipes-devtools/python/python-setuptools_36.2.7.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_36.2.0.bb b/meta/recipes-devtools/python/python3-setuptools_36.2.7.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_36.2.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_36.2.7.bb
-- 
2.7.4


