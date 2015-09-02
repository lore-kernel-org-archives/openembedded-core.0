Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 576607704D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 11:00:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 02 Sep 2015 04:00:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,453,1437462000"; d="scan'208";a="781091594"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 02 Sep 2015 04:00:29 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 4E66C6A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 03:59:38 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 13:58:12 +0300
Message-Id: <4aea1c954589d6e42be8b31fef0c867164627eb8.1441191270.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 12/17] wic: fix pylint warning no-member
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
X-List-Received-Date: Wed, 02 Sep 2015 11:00:29 -0000

Fixed pylint warning:
Instance of 'ConfigMgr' has no 'create' member (no-member)

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/conf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/wic/conf.py b/scripts/lib/wic/conf.py
index 402ed62..942c0c1 100644
--- a/scripts/lib/wic/conf.py
+++ b/scripts/lib/wic/conf.py
@@ -67,6 +67,7 @@ class ConfigMgr(object):
     def reset(self):
         self.__ksconf = None
         self.__siteconf = None
+        self.create = {}
 
         # initialize the values with defaults
         for sec, vals in self.DEFAULTS.iteritems():
-- 
2.1.4


