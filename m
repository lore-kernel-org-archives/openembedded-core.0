Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 79DA373919
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 14:19:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Mar 2015 07:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,409,1422950400"; d="scan'208";a="680778294"
Received: from sgconnee-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.217])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2015 07:19:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 14:19:02 +0000
Message-Id: <5bfae729e15602ec29ddcc4dca0f8b9b5019d4c9.1426515313.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1426515313.git.paul.eggleton@linux.intel.com>
References: <cover.1426515313.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1426515313.git.paul.eggleton@linux.intel.com>
References: <cover.1426515313.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 16/16] oe-selftest: add missing dependency to test_recipetool_create_git
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
X-List-Received-Date: Mon, 16 Mar 2015 14:19:20 -0000

libmatchbox links to libjpeg if it is present so just explicitly build
it and then check it appears in DEPENDS.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 869fecf..dc1cf21 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -67,7 +67,7 @@ class DevtoolTests(oeSelfTest):
 
     def test_recipetool_create_git(self):
         # Ensure we have the right data in shlibs/pkgdata
-        bitbake('libpng pango libx11 libxext')
+        bitbake('libpng pango libx11 libxext jpeg')
         # Try adding a recipe
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
@@ -83,7 +83,7 @@ class DevtoolTests(oeSelfTest):
         checkvars['S'] = '${WORKDIR}/git'
         checkvars['PV'] = '1.0+git${SRCPV}'
         checkvars['SRC_URI'] = srcuri
-        checkvars['DEPENDS'] = 'libpng pango libx11 libxext'
+        checkvars['DEPENDS'] = 'libpng pango libx11 libxext jpeg'
         inherits = []
         with open(recipefile, 'r') as f:
             for line in f:
-- 
1.9.3


