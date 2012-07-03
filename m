Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Slx7B-00036R-0M
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 09:01:37 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Jul 2012 23:50:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118373987"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Jul 2012 23:50:36 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 09:50:23 +0300
Message-Id: <1341298228-4412-7-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
References: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 06/10] libxft: upgrade to 2.3.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jul 2012 07:01:37 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xorg-lib/{libxft_2.3.0.bb => libxft_2.3.1.bb}  |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxft_2.3.0.bb => libxft_2.3.1.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.3.0.bb b/meta/recipes-graphics/xorg-lib/libxft_2.3.1.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxft_2.3.0.bb
rename to meta/recipes-graphics/xorg-lib/libxft_2.3.1.bb
index 73ce9fd..f4dd322 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.3.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.3.1.bb
@@ -30,5 +30,5 @@ python () {
             d.setVar('PKG_${PN}', '${MLPREFIX}libxft2')
 }
 
-SRC_URI[md5sum] = "bd0a8d8cace1dfbb963250bf3eb9a19a"
-SRC_URI[sha256sum] = "3426393ad72a5c47006536d474e396c7a21c33131bb28f495578e05a5858b044"
+SRC_URI[md5sum] = "78d64dece560c9e8699199f3faa521c0"
+SRC_URI[sha256sum] = "7fce32b92dcb7b2869bed567af2abc7bbad0d5d6fcf471b8a3e137964a31bbbd"
-- 
1.7.9.5



