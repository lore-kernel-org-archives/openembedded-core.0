Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1004D71C36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 16:10:58 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 16 Jan 2017 08:10:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,239,1477983600"; d="scan'208";a="54488099"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 16 Jan 2017 08:10:58 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 013966A4006;
	Mon, 16 Jan 2017 08:10:02 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2017 17:46:43 +0200
Message-Id: <ff995e776025f419dc6d9b3ea58d42801f9e7227.1484581112.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484581112.git.ed.bartosh@linux.intel.com>
References: <cover.1484581112.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 14/14] selftest: wic: fix test_iso_image test case
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
X-List-Received-Date: Mon, 16 Jan 2017 16:10:58 -0000

Added "iso" to IMAGE_FSTYPES to build iso artifacts required
to fix test of isoimage-isohybrid wic plugin.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 3ccd1c4..f18eaaf 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -43,7 +43,8 @@ class Wic(oeSelfTest):
 
     def setUpLocal(self):
         """This code is executed before each test method."""
-        self.write_config('MACHINE_FEATURES_append = " efi"\n'
+        self.write_config('IMAGE_FSTYPES = "iso"\n'
+                          'MACHINE_FEATURES_append = " efi"\n'
                           'WKS_FILE = "wic-image-minimal"\n')
 
         # Do this here instead of in setUpClass as the base setUp does some
-- 
2.1.4


