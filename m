Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 14C6D7CB23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 02:30:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2019 18:30:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,421,1544515200"; d="scan'208";a="129948216"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga003.jf.intel.com with ESMTP; 27 Feb 2019 18:30:03 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2019 09:58:57 +0800
Message-Id: <1551319137-80119-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] resulttool/regression: Ensure regressoin results are sorted
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
X-List-Received-Date: Thu, 28 Feb 2019 02:30:09 -0000

Sorted regression results to provide friendly viewing of report.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/resulttool/regression.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index ff77332..bdf531d 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -35,7 +35,7 @@ def compare_result(logger, base_name, target_name, base_result, target_result):
                 logger.error('Failed to retrieved base test case status: %s' % k)
     if result:
         resultstring = "Regression: %s\n            %s\n" % (base_name, target_name)
-        for k in result:
+        for k in sorted(result):
             resultstring += '    %s: %s -> %s\n' % (k, result[k]['base'], result[k]['target'])
     else:
         resultstring = "Match: %s\n       %s" % (base_name, target_name)
@@ -82,9 +82,9 @@ def regression_common(args, logger, base_results, target_results):
                         regressions.append(resstr)
         else:
             notfound.append("%s not found in target" % a)
-    print("\n".join(matches))
-    print("\n".join(regressions))
-    print("\n".join(notfound))
+    print("\n".join(sorted(matches)))
+    print("\n".join(sorted(regressions)))
+    print("\n".join(sorted(notfound)))
 
     return 0
 
-- 
2.7.4


