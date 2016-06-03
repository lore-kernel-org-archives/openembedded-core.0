Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A85C877444
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 09:04:38 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 03 Jun 2016 02:04:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="820878260"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 03 Jun 2016 02:04:40 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 5F4D46A4007;
	Fri,  3 Jun 2016 02:52:06 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 12:04:22 +0300
Message-Id: <1464944662-26007-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] send-error-report: encode data to bytes
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
X-List-Received-Date: Fri, 03 Jun 2016 09:04:40 -0000

Encoded data before sending it through http as urllib expecting bytes.
Fixed TypeError: POST data should be bytes or an iterable of bytes. It
cannot be of type str.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/send-error-report | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/send-error-report b/scripts/send-error-report
index ff23552..15b5e84 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -125,7 +125,7 @@ def prepare_data(args):
         with open(args.error_file, 'r') as json_fp:
             data = json_fp.read()
 
-    return data
+    return data.encode('utf-8')
 
 
 def send_data(data, args):
-- 
2.1.4


