Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1TkYU6-0006Hv-Ib
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 12:03:46 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Dec 2012 02:48:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,300,1355126400"; d="scan'208";a="181830720"
Received: from adamian-desktop.rb.intel.com ([10.237.105.141])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Dec 2012 02:47:58 -0800
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id 9B16F560743; Mon, 17 Dec 2012 12:48:09 +0200 (EET)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org, paul.eggleton@linux.intel.com,
	richard.purdie@linuxfoundation.org
Date: Mon, 17 Dec 2012 12:48:07 +0200
Message-Id: <1355741287-8655-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH] Core image base ssh access and package management
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
X-List-Received-Date: Mon, 17 Dec 2012 11:03:46 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Since core-image-base is a default image that developers should
use for developing headless applications, it should have
package management and ssh access.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/recipes-core/images/core-image-base.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/core-image-base.bb b/meta/recipes-core/images/core-image-base.bb
index 8ef3376..a78417f 100644
--- a/meta/recipes-core/images/core-image-base.bb
+++ b/meta/recipes-core/images/core-image-base.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A console-only image that fully supports the target device \
 hardware."
 
-IMAGE_FEATURES += "splash"
+IMAGE_FEATURES += "splash package-management ssh-server-dropbear"
 
 LICENSE = "MIT"
 
-- 
1.7.10.4



