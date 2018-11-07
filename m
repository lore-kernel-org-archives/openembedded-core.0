Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 29F9B79450
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 07:23:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Nov 2018 23:23:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,474,1534834800"; d="scan'208";a="84591497"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga008.fm.intel.com with ESMTP; 06 Nov 2018 23:23:39 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Nov 2018 15:08:31 +0800
Message-Id: <1541574511-65605-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] oeqa/selftest: Standardize json logging output directory
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
X-List-Received-Date: Wed, 07 Nov 2018 07:23:39 -0000

Currently sdk & sdkext will output json file to LOG_DIR, while
selftest will output json file to TOPDIR/log.

Standardize selftest json output file to LOG_DIR.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/selftest/context.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 11d5877..302ff73 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -205,7 +205,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         runCmd("bitbake -e")
 
     def get_json_result_dir(self, args):
-        json_result_dir = os.path.join(os.path.dirname(os.path.abspath(args.output_log)), 'log', 'oeqa')
+        json_result_dir = os.path.join(self.tc.td["LOG_DIR"], 'oeqa')
         if "OEQA_JSON_RESULT_DIR" in self.tc.td:
             json_result_dir = self.tc.td["OEQA_JSON_RESULT_DIR"]
 
-- 
2.7.4


