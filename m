Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A58F16C6F9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 12:43:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 May 2015 05:43:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,505,1427785200"; d="scan'208";a="736081912"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 27 May 2015 05:43:24 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 415EF6A4005;
	Wed, 27 May 2015 05:42:51 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 May 2015 13:49:45 +0300
Message-Id: <1432723785-6746-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: do not strip traceback
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
X-List-Received-Date: Wed, 27 May 2015 12:43:23 -0000

Printing only first 5 levels of wic traceback makes it almost
useless as the most valuable part of it is stripped.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/wic | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/wic b/scripts/wic
index 1e07dfe..90b36c6 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -313,6 +313,6 @@ if __name__ == "__main__":
     except Exception:
         ret = 1
         import traceback
-        traceback.print_exc(5)
+        traceback.print_exc()
     sys.exit(ret)
 
-- 
2.1.4


