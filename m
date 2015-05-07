Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1478E72A85
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 13:52:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 May 2015 06:52:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,384,1427785200"; d="scan'208";a="725330214"
Received: from jlbuthle-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.24.56])
	by orsmga002.jf.intel.com with ESMTP; 07 May 2015 06:52:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 May 2015 14:52:23 +0100
Message-Id: <aceb2bfaf2cff0ea156956c1051d82c560468bc1.1431006684.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1431006684.git.paul.eggleton@linux.intel.com>
References: <cover.1431006684.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1431006684.git.paul.eggleton@linux.intel.com>
References: <cover.1431006684.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] oe-selftest: devtool: fix broken URL in test_devtool_add_fetch
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
X-List-Received-Date: Thu, 07 May 2015 13:52:42 -0000

I already had the file fetched from some previous work and thus it
didn't attempt to download the invalid URL when I tested it earlier.

Part of the fix for [YOCTO #7729].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 1a506d9..2af6114 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -175,7 +175,7 @@ class DevtoolTests(oeSelfTest):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         testver = '0.23'
-        url = 'https://pypi.python.org/packages/source/J/MarkupSafe/MarkupSafe-%s.tar.gz' % testver
+        url = 'https://pypi.python.org/packages/source/M/MarkupSafe/MarkupSafe-%s.tar.gz' % testver
         testrecipe = 'python-markupsafe'
         srcdir = os.path.join(tempdir, testrecipe)
         # Test devtool add
-- 
2.1.0


