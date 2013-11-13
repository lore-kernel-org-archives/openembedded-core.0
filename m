Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 06A906D7DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 14:33:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2013 06:29:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,693,1378882800"; d="scan'208";a="426920179"
Received: from junemccl-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.116])
	by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2013 06:33:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2013 14:32:45 +0000
Message-Id: <ed56dd01649e06ca09c834014ea232fee59a102b.1384353075.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384353075.git.paul.eggleton@linux.intel.com>
References: <cover.1384353075.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1384353075.git.paul.eggleton@linux.intel.com>
References: <cover.1384353075.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/11] classes/license: fix comments
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
X-List-Received-Date: Wed, 13 Nov 2013 14:33:03 -0000

It's LICENSE_FLAGS, LICENSE_FLAG is invalid.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/license.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 419105b..6d7ee94 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -290,11 +290,11 @@ def incompatible_license(d, dont_want_licenses, package=None):
 
 def check_license_flags(d):
     """
-    This function checks if a recipe has any LICENSE_FLAGs that
+    This function checks if a recipe has any LICENSE_FLAGS that
     aren't whitelisted.
 
-    If it does, it returns the first LICENSE_FLAG missing from the
-    whitelist, or all the LICENSE_FLAGs if there is no whitelist.
+    If it does, it returns the first LICENSE_FLAGS item missing from the
+    whitelist, or all of the LICENSE_FLAGS if there is no whitelist.
 
     If everything is is properly whitelisted, it returns None.
     """
-- 
1.8.1.2


