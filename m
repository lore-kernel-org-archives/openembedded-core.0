Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2834672720
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 16:10:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 23 Dec 2014 08:08:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,632,1413270000"; d="scan'208";a="628280292"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.255.13.178])
	by orsmga001.jf.intel.com with ESMTP; 23 Dec 2014 08:08:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Dec 2014 16:08:47 +0000
Message-Id: <92774f4280bf390e990aec17a1be645c1784e466.1419350817.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1419350817.git.paul.eggleton@linux.intel.com>
References: <cover.1419350817.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1419350817.git.paul.eggleton@linux.intel.com>
References: <cover.1419350817.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/7] oeqa/selftest: populate pkgdata/shlibs in test_recipetool_create_git
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
X-List-Received-Date: Tue, 23 Dec 2014 16:10:09 -0000

Build some recipes so that we have the needed data in the sysroot for
recipetool to refer to when scanning for dependencies.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index e158ad9..74fb325 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -66,6 +66,8 @@ class DevtoolTests(oeSelfTest):
         self.assertEqual(checkvars, {}, 'Some variables not found')
 
     def test_recipetool_create_git(self):
+        # Ensure we have the right data in shlibs/pkgdata
+        bitbake('libpng pango libx11 libxext')
         # Try adding a recipe
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
-- 
1.9.3


