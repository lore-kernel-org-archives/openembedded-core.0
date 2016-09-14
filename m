Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C2647731F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 12:02:23 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP; 14 Sep 2016 05:02:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,333,1470726000"; 
   d="scan'208";a="8214427"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 14 Sep 2016 05:02:23 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id F24606A4006;
	Wed, 14 Sep 2016 05:01:59 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2016 15:02:04 +0300
Message-Id: <1473854524-3413-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] create-pull-request: remove output directory
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
X-List-Received-Date: Wed, 14 Sep 2016 12:02:23 -0000

When 'git request-pull' fails it makes sense to remove output
directory. Otherwise create-pull-request will complain that
output directory already exists on the next run.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/create-pull-request | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 3f30cf1..a88f35a 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -229,6 +229,7 @@ else
 fi
 if [ $? -ne 0 ]; then
 	echo "ERROR: git request-pull reported an error"
+	rm -rf $ODIR
 	exit 1
 fi
 
-- 
2.1.4


