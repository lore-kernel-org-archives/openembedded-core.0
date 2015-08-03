Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7FFF77597C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Aug 2015 13:52:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Aug 2015 06:52:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,601,1432623600"; d="scan'208";a="760866189"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2015 06:52:11 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id D0EEF6A4087;
	Mon,  3 Aug 2015 06:51:24 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Aug 2015 16:51:51 +0300
Message-Id: <1fe51ee43f5ebccbefa72635026cb6a208d2bfcc.1438609723.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <de1bbbaa8743b765d169fb233b6485e86f5904c0.1438609723.git.ed.bartosh@linux.intel.com>
References: <de1bbbaa8743b765d169fb233b6485e86f5904c0.1438609723.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1438609723.git.ed.bartosh@linux.intel.com>
References: <cover.1438609723.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 6/6] wic: release 0.2.0
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
X-List-Received-Date: Mon, 03 Aug 2015 13:52:10 -0000

Major changes in 0.2.0:
- implemented UUID support
- fixed support of GPT partition tables
- implemented running bitbake from wic
- implemented image compressing
- started testing with oe-selftest. implemented 17 test cases
- used native tools (parted, mkfs, mtools, etc)
- usability and documentation fixes
- code clenup

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/wic | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/wic b/scripts/wic
index 9435ce0..c1d3003 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -29,7 +29,7 @@
 # Tom Zanussi <tom.zanussi (at] linux.intel.com>
 #
 
-__version__ = "0.1.0"
+__version__ = "0.2.0"
 
 # Python Standard Library modules
 import os
-- 
2.1.4


