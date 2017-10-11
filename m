Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 54E0A71C7A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 21:17:45 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 11 Oct 2017 14:17:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,362,1503385200"; d="scan'208";a="909043742"
Received: from jalamego-mobl3.zpn.intel.com ([10.219.128.138])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Oct 2017 14:17:46 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 16:17:40 -0500
Message-Id: <1507756660-30327-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python-scons*: upgrade to 3.0.0
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
X-List-Received-Date: Wed, 11 Oct 2017 21:17:47 -0000

Both python-scons and python-scons-native need to be upgraded to latest
upstream version.

LIC_FILES_CHKSUM changed due to updated year in date, but rest of file
remain the same.
Following dependencies were added to enable appropriate package usage:
python-shell, python-pprint and python-importlib.

These changes were tested in qemux86 with core-image-minimal.

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 ...python-scons-native_2.5.1.bb => python-scons-native_3.0.0.bb} | 0
 .../python/{python-scons_2.5.1.bb => python-scons_3.0.0.bb}      | 9 ++++++---
 2 files changed, 6 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python-scons-native_2.5.1.bb => python-scons-native_3.0.0.bb} (100%)
 rename meta/recipes-devtools/python/{python-scons_2.5.1.bb => python-scons_3.0.0.bb} (61%)

diff --git a/meta/recipes-devtools/python/python-scons-native_2.5.1.bb b/meta/recipes-devtools/python/python-scons-native_3.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-scons-native_2.5.1.bb
rename to meta/recipes-devtools/python/python-scons-native_3.0.0.bb
diff --git a/meta/recipes-devtools/python/python-scons_2.5.1.bb b/meta/recipes-devtools/python/python-scons_3.0.0.bb
similarity index 61%
rename from meta/recipes-devtools/python/python-scons_2.5.1.bb
rename to meta/recipes-devtools/python/python-scons_3.0.0.bb
index 3f43856..be33dfa 100644
--- a/meta/recipes-devtools/python/python-scons_2.5.1.bb
+++ b/meta/recipes-devtools/python/python-scons_3.0.0.bb
@@ -1,13 +1,13 @@
 SUMMARY = "Software Construction tool (make/autotools replacement)"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3a885dff6d14e4cd876d9008a09a42de"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=46ddf66004e5be5566367cb525a66fc6"
 SRCNAME = "scons"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "3eac81e5e8206304a9b4683c57665aa4"
-SRC_URI[sha256sum] = "c8de85fc02ed1a687b1f2ac791eaa0c1707b4382a204f17d782b5b111b9fdf07"
+SRC_URI[md5sum] = "7ca558edaaa1942fe38f3105ca2400fb"
+SRC_URI[sha256sum] = "aa5afb33c2bbd33c311e47e912412195739e9ffb2e933534a31f85fba8f3470e"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/SCons/"
 
@@ -20,4 +20,7 @@ RDEPENDS_${PN} = "\
   python-io \
   python-json \
   python-subprocess \
+  python-shell \
+  python-pprint \
+  python-importlib \
   "
-- 
2.7.4


