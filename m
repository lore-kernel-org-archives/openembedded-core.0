Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9DDA671DA1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 14:52:24 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 May 2017 07:52:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,405,1488873600"; d="scan'208";a="852032953"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 02 May 2017 07:52:25 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 4236E6A4080
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 07:52:12 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 May 2017 17:38:20 +0300
Message-Id: <cdb9e7aa493d9ed0eb6ffcec37d581ea928b5f2b.1493735327.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1493735327.git.ed.bartosh@linux.intel.com>
References: <cover.1493735327.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 3/3] selftest: fix test_unsupported_subcommand test case
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
X-List-Received-Date: Tue, 02 May 2017 14:52:24 -0000

Fixed failure of test_unsupported_subcommand caused by
switching to argparser by checking that parser returns
non-zero return code.

[YOCTO #9636]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 726af19..cdec80c 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -159,8 +159,7 @@ class Wic(oeSelfTest):
     @testcase(1213)
     def test_unsupported_subcommand(self):
         """Test unsupported subcommand"""
-        self.assertEqual(1, runCmd('wic unsupported',
-                                   ignore_status=True).status)
+        self.assertNotEqual(0, runCmd('wic unsupported', ignore_status=True).status)
 
     @testcase(1214)
     def test_no_command(self):
-- 
2.1.4


