Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A22416025F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 21:22:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 16 Nov 2016 13:22:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,650,1473145200"; d="scan'208";a="1086248705"
Received: from fsantes-mobl2.amr.corp.intel.com (HELO
	jalamego-MOBL2.zpn.intel.com) ([10.219.5.141])
	by fmsmga002.fm.intel.com with ESMTP; 16 Nov 2016 13:22:26 -0800
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2016 15:22:15 -0600
Message-Id: <1479331336-14097-4-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1479331336-14097-1-git-send-email-jose.a.lamego@linux.intel.com>
References: <1479331336-14097-1-git-send-email-jose.a.lamego@linux.intel.com>
Subject: [PATCH 3/4] python-pexpect: upgrade to 4.2.1
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
X-List-Received-Date: Wed, 16 Nov 2016 21:22:24 -0000

python-pexpect needs to be upgraded to latest upstream version.
This change was tested using qemux86 with core-image-sato

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 .../python/{python-pexpect_4.2.0.bb => python-pexpect_4.2.1.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-pexpect_4.2.0.bb => python-pexpect_4.2.1.bb} (81%)

diff --git a/meta/recipes-devtools/python/python-pexpect_4.2.0.bb b/meta/recipes-devtools/python/python-pexpect_4.2.1.bb
similarity index 81%
rename from meta/recipes-devtools/python/python-pexpect_4.2.0.bb
rename to meta/recipes-devtools/python/python-pexpect_4.2.1.bb
index 82e0fa8..95a0790 100644
--- a/meta/recipes-devtools/python/python-pexpect_4.2.0.bb
+++ b/meta/recipes-devtools/python/python-pexpect_4.2.1.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1c7a725251880af8c6a148181665385b"
 SRCNAME = "pexpect"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "8071ec5df0f3d515daedafad672d1632"
-SRC_URI[sha256sum] = "bf6816b8cc8d301a499e7adf338828b39bc7548eb64dbed4dd410ed93d95f853"
+SRC_URI[md5sum] = "3694410001a99dff83f0b500a1ca1c95"
+SRC_URI[sha256sum] = "3d132465a75b57aa818341c6521392a06cc660feb3988d7f1074f39bd23c9a92"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
 
-- 
1.9.1


