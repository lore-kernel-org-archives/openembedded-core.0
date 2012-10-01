Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1TIgzM-0007mN-Hs
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Oct 2012 16:28:52 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Oct 2012 07:14:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,517,1344236400"; d="scan'208";a="199213001"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.62])
	by azsmga001.ch.intel.com with ESMTP; 01 Oct 2012 07:14:47 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Oct 2012 17:17:17 +0300
Message-Id: <1349101037-5831-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] Fix invalid test for network error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Oct 2012 14:28:52 -0000

The test for network error in sanity.bbclass was negated.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/classes/sanity.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index e2095dd..f2e9a74 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -174,7 +174,7 @@ def check_sanity_tmpdir_change(tmpdir, data):
     # Check that we can fetch from various network transports
     errmsg = check_connectivity(data)
     testmsg = testmsg + check_connectivity(data)
-    return testmsg, errmsg == ""
+    return testmsg, errmsg != ""
         
 def check_sanity_version_change(data):
     # Sanity checks to be done when SANITY_VERSION changes
-- 
1.7.9.5



