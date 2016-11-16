Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 27AAA6025F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 21:22:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 16 Nov 2016 13:22:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,650,1473145200"; d="scan'208";a="1086248729"
Received: from fsantes-mobl2.amr.corp.intel.com (HELO
	jalamego-MOBL2.zpn.intel.com) ([10.219.5.141])
	by fmsmga002.fm.intel.com with ESMTP; 16 Nov 2016 13:22:30 -0800
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2016 15:22:16 -0600
Message-Id: <1479331336-14097-5-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1479331336-14097-1-git-send-email-jose.a.lamego@linux.intel.com>
References: <1479331336-14097-1-git-send-email-jose.a.lamego@linux.intel.com>
Subject: [PATCH 4/4] python-scons*: upgrade to 2.5.1
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
X-List-Received-Date: Wed, 16 Nov 2016 21:22:29 -0000

Both python-scons and python-scons-native need to be upgraded to latest
upstream version.
This change was tested using qemux86 with core-image-sato.

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 .../{python-scons-native_2.5.0.bb => python-scons-native_2.5.1.bb}    | 0
 .../python/{python-scons_2.5.0.bb => python-scons_2.5.1.bb}           | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-scons-native_2.5.0.bb => python-scons-native_2.5.1.bb} (100%)
 rename meta/recipes-devtools/python/{python-scons_2.5.0.bb => python-scons_2.5.1.bb} (78%)

diff --git a/meta/recipes-devtools/python/python-scons-native_2.5.0.bb b/meta/recipes-devtools/python/python-scons-native_2.5.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-scons-native_2.5.0.bb
rename to meta/recipes-devtools/python/python-scons-native_2.5.1.bb
diff --git a/meta/recipes-devtools/python/python-scons_2.5.0.bb b/meta/recipes-devtools/python/python-scons_2.5.1.bb
similarity index 78%
rename from meta/recipes-devtools/python/python-scons_2.5.0.bb
rename to meta/recipes-devtools/python/python-scons_2.5.1.bb
index 8543c41..3f43856 100644
--- a/meta/recipes-devtools/python/python-scons_2.5.0.bb
+++ b/meta/recipes-devtools/python/python-scons_2.5.1.bb
@@ -6,8 +6,8 @@ SRCNAME = "scons"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "bda5530a70a41a7831d83c8b191c021e"
-SRC_URI[sha256sum] = "01f1b3d6023516a8e1b5e77799e5a82a23b32953b1102d339059ffeca8600493"
+SRC_URI[md5sum] = "3eac81e5e8206304a9b4683c57665aa4"
+SRC_URI[sha256sum] = "c8de85fc02ed1a687b1f2ac791eaa0c1707b4382a204f17d782b5b111b9fdf07"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/SCons/"
 
-- 
1.9.1


