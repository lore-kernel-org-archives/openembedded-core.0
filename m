Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1T4VZS-000800-Fc
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 13:27:30 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by orsmga102.jf.intel.com with ESMTP; 23 Aug 2012 04:14:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,300,1344236400"; d="scan'208";a="184070587"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.39])
	by azsmga001.ch.intel.com with ESMTP; 23 Aug 2012 04:14:17 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2012 14:14:18 +0300
Message-Id: <1345720458-3909-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] mc: upgrade to 4.8.4
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
X-List-Received-Date: Thu, 23 Aug 2012 11:27:30 -0000

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../mc/{mc_4.8.3.bb => mc_4.8.4.bb}                |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.3.bb => mc_4.8.4.bb} (82%)

diff --git a/meta/recipes-extended/mc/mc_4.8.3.bb b/meta/recipes-extended/mc/mc_4.8.4.bb
similarity index 82%
rename from meta/recipes-extended/mc/mc_4.8.3.bb
rename to meta/recipes-extended/mc/mc_4.8.4.bb
index 3b777b5..fc551dd 100644
--- a/meta/recipes-extended/mc/mc_4.8.3.bb
+++ b/meta/recipes-extended/mc/mc_4.8.4.bb
@@ -10,8 +10,8 @@ PR = "r0"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "12d38ad4969df3f8bbf66c3967a191ee"
-SRC_URI[sha256sum] = "445f286652b85c3e8e87839bad64c28ad2dc80661778571a0b59c2b920ef60ac"
+SRC_URI[md5sum] = "a8edb8226cb25869f925ecce043faf1e"
+SRC_URI[sha256sum] = "917f32a6ce0b8e3ec893bb18af73e64c246d79066322041608352623a579234b"
 
 inherit autotools gettext
 
-- 
1.7.9.5



