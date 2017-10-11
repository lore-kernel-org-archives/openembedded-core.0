Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 503F272F6C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 21:45:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 14:45:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,362,1503385200"; d="scan'208";a="1204835636"
Received: from jalamego-mobl3.zpn.intel.com ([10.219.128.138])
	by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2017 14:45:16 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 16:45:11 -0500
Message-Id: <1507758311-14310-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-six: update to 1.11.0
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
X-List-Received-Date: Wed, 11 Oct 2017 21:45:16 -0000

python3-six needs to be updated to latest stable version.

Change in LIC_FILES_CHKSUM due to updated Copyright year,
rest of file remains the same.

This update was tested in qemux86 running core-image-minimal.

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/recipes-devtools/python/python-six.inc                         | 6 +++---
 .../python/{python3-six_1.10.0.bb => python3-six_1.11.0.bb}         | 0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-six_1.10.0.bb => python3-six_1.11.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-six.inc b/meta/recipes-devtools/python/python-six.inc
index bd12fa9..f9e7d64 100644
--- a/meta/recipes-devtools/python/python-six.inc
+++ b/meta/recipes-devtools/python/python-six.inc
@@ -2,11 +2,11 @@ SUMMARY = "Python 2 and 3 compatibility library"
 HOMEPAGE = "https://pypi.python.org/pypi/six/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6f00d4a50713fa859858dd9abaa35b21"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=35cec5bf04dd0820d0a18533ea7c774a"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/s/six/six-${PV}.tar.gz"
-SRC_URI[md5sum] = "34eed507548117b2ab523ab14b2f8b55"
-SRC_URI[sha256sum] = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"
+SRC_URI[md5sum] = "d12789f9baf7e9fb2524c0c64f1773f8"
+SRC_URI[sha256sum] = "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/six/"
 UPSTREAM_CHECK_REGEX = "/six/(?P<pver>(\d+[\.\-_]*)+)"
diff --git a/meta/recipes-devtools/python/python3-six_1.10.0.bb b/meta/recipes-devtools/python/python3-six_1.11.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-six_1.10.0.bb
rename to meta/recipes-devtools/python/python3-six_1.11.0.bb
-- 
2.7.4


