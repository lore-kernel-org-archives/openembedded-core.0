Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2E59F739A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 18:14:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 16 Mar 2015 11:14:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,410,1422950400"; d="scan'208";a="666007093"
Received: from localhost.jf.intel.com ([10.7.201.37])
	by orsmga001.jf.intel.com with ESMTP; 16 Mar 2015 11:14:16 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 11:14:13 -0700
Message-Id: <1426529654-30535-2-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426529654-30535-1-git-send-email-randy.e.witt@linux.intel.com>
References: <1426529654-30535-1-git-send-email-randy.e.witt@linux.intel.com>
Subject: [PATCH 1/2] lib/oeqa/selftest/lic-checksum: Rename test_foo
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
X-List-Received-Date: Mon, 16 Mar 2015 18:14:16 -0000

test_foo is renamed to test_nonmatching_checksum. It was a mistake to
submit it with the old name.

There was also some extra whitespace removed.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/lib/oeqa/selftest/lic-checksum.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/lic-checksum.py b/meta/lib/oeqa/selftest/lic-checksum.py
index 0c1afa6..9a9f7b2 100644
--- a/meta/lib/oeqa/selftest/lic-checksum.py
+++ b/meta/lib/oeqa/selftest/lic-checksum.py
@@ -6,10 +6,10 @@ from oeqa.utils.commands import bitbake
 from oeqa.utils import CommandError
 
 class LicenseTests(oeSelfTest):
-    
+
     # Verify that changing a license file that has an absolute path causes
     # the license qa to fail due to a mismatched md5sum.
-    def test_foo(self):
+    def test_nonmatching_checksum(self):
         bitbake_cmd = '-c configure emptytest'
         error_msg = 'ERROR: emptytest: The new md5 checksum is 8d777f385d3dfec8815d20f7496026dc'
 
-- 
1.9.3


