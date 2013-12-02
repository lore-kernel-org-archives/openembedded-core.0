Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 681D86B1A9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 19:17:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Dec 2013 11:14:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,812,1378882800"; d="scan'208";a="418126703"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.184])
	by orsmga001.jf.intel.com with ESMTP; 02 Dec 2013 11:17:50 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2013 19:17:48 +0000
Message-Id: <1386011868-28741-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] classes/icecc: fix typos in header comments
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
X-List-Received-Date: Mon, 02 Dec 2013 19:17:52 -0000

Looking at the code, it should be ICECC_USER_PACKAGE_BL and not
ICECC_PACKAGE_BL here, and also fix "localy" -> "locally".

Thanks to Scott Rifenbark for pointing this out.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/icecc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index ef8761a..d7407d2 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -20,7 +20,7 @@
 #(NOTE that this is a modified version of the script need it and *not the one that comes with icecc*
 #
 #User can specify if specific packages or packages belonging to class should not use icecc to distribute
-#compile jobs to remote machines, but handled localy, by defining ICECC_USER_CLASS_BL and ICECC_PACKAGE_BL
+#compile jobs to remote machines, but handled locally, by defining ICECC_USER_CLASS_BL and ICECC_USER_PACKAGE_BL
 #with the appropriate values in local.conf. In addition the user can force to enable icecc for packages
 #which set an empty PARALLEL_MAKE variable by defining ICECC_USER_PACKAGE_WL.
 #########################################################################################
-- 
1.8.1.2


