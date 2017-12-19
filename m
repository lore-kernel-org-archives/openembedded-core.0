Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 05BEF78289
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 17:13:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Dec 2017 09:13:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,427,1508828400"; d="scan'208";a="17350534"
Received: from jlock-mobl3.ger.corp.intel.com ([10.252.19.196])
	by orsmga001.jf.intel.com with ESMTP; 19 Dec 2017 09:13:17 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2017 17:13:12 +0000
Message-Id: <20171219171312.12176-1-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH] oeqa/selftest/cases/wic: update OETestID decorator for test_qemu
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
X-List-Received-Date: Tue, 19 Dec 2017 17:13:18 -0000

Test case ID 1422 is not correct for this issue, the correct test
case ID for test_qemu is 1424.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index ccbc82ed9b4..b84466d9aef 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -623,7 +623,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             self.assertTrue(os.path.islink(path))
             self.assertTrue(os.path.isfile(os.path.realpath(path)))
 
-    @OETestID(1422)
+    @OETestID(1424)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_qemu(self):
         """Test wic-image-minimal under qemu"""
-- 
2.14.3


