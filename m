Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1034F71C7A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 21:15:48 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 14:15:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,362,1503385200"; d="scan'208";a="162101954"
Received: from jalamego-mobl3.zpn.intel.com ([10.219.128.138])
	by fmsmga006.fm.intel.com with ESMTP; 11 Oct 2017 14:15:49 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 16:15:45 -0500
Message-Id: <1507756545-30087-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-numpy: upgrade to 1.13.3
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
X-List-Received-Date: Wed, 11 Oct 2017 21:15:49 -0000

python3-numpy needs to be upgraded to latest stable version.

This change was tested on qemux86 running core-image-minimal.

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 .../python-numpy/{python3-numpy_1.13.1.bb => python3-numpy_1.13.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.13.1.bb => python3-numpy_1.13.3.bb} (95%)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.13.1.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.13.3.bb
similarity index 95%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.13.1.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.13.3.bb
index 29874b8..2083772 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.13.1.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.13.3.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://fix_shebang_f2py.patch \
            file://0001-BUG-fix-infinite-loop-when-creating-np.pad-on-an-emp.patch \
            ${CONFIGFILESURI} "
-SRC_URI[md5sum] = "6d459e4a24f5035f720dda3c57716a92"
-SRC_URI[sha256sum] = "de020ec06f1e9ce1115a50161a38bf8d4c2525379900f9cb478cc613a1e7cd93"
+SRC_URI[md5sum] = "c1d433e5973e548809e80c9118474b73"
+SRC_URI[sha256sum] = "4c6b4eef790528bebb7ec9590d74cc193868940fe68e4109a91c196df"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 
-- 
2.7.4


