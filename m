Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U7Ph7-0006MM-Ja
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 13:19:42 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Feb 2013 04:03:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,687,1355126400"; d="scan'208";a="264060193"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 18 Feb 2013 04:03:31 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2013 14:04:34 +0200
Message-Id: <1361189074-2582-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] shared-mime-info: upgrade to 1.1
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
X-List-Received-Date: Mon, 18 Feb 2013 12:19:44 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../{shared-mime-info_1.0.bb => shared-mime-info_1.1.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/shared-mime-info/{shared-mime-info_1.0.bb => shared-mime-info_1.1.bb} (45%)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_1.0.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_1.1.bb
similarity index 45%
rename from meta/recipes-support/shared-mime-info/shared-mime-info_1.0.bb
rename to meta/recipes-support/shared-mime-info/shared-mime-info_1.1.bb
index d9b7b51..301cf27 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_1.0.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_1.1.bb
@@ -1,8 +1,8 @@
 require shared-mime-info.inc
 PR = "r0"
 
-SRC_URI[md5sum] = "901b7977dbb2b71d12d30d4d8fb97028"
-SRC_URI[sha256sum] = "d2e830e5aae213dd906e64495e9618cc4ef40d7b249e0971a190b04d5802ae8f"
+SRC_URI[md5sum] = "12ba00bf1cb2e69bfba73127e708e833"
+SRC_URI[sha256sum] = "184d094b157a9ec2607ad26a1a1837e6e07f3fcbeb38d8b6d412906156f9e06c"
 
 SRC_URI =+ "file://parallelmake.patch \
 	    file://install-data-hook.patch"
-- 
1.7.11.7



