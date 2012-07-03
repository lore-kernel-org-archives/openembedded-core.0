Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Slx7E-00036R-Al
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 09:01:40 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Jul 2012 23:50:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118374003"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Jul 2012 23:50:39 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 09:50:26 +0300
Message-Id: <1341298228-4412-10-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
References: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 09/10] xcb-util-keysyms: upgrade to 0.3.9
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
X-List-Received-Date: Tue, 03 Jul 2012 07:01:40 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...-keysyms_0.3.8.bb => xcb-util-keysyms_0.3.9.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xcb/{xcb-util-keysyms_0.3.8.bb => xcb-util-keysyms_0.3.9.bb} (52%)

diff --git a/meta/recipes-graphics/xcb/xcb-util-keysyms_0.3.8.bb b/meta/recipes-graphics/xcb/xcb-util-keysyms_0.3.9.bb
similarity index 52%
rename from meta/recipes-graphics/xcb/xcb-util-keysyms_0.3.8.bb
rename to meta/recipes-graphics/xcb/xcb-util-keysyms_0.3.9.bb
index ed1eb7a..43f5e65 100644
--- a/meta/recipes-graphics/xcb/xcb-util-keysyms_0.3.8.bb
+++ b/meta/recipes-graphics/xcb/xcb-util-keysyms_0.3.9.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://keysyms/keysyms.c;endline=30;md5=2f8de023ed823bb92f0b
 					"
 PR = "r0"
 
-SRC_URI[md5sum] = "c75bb20e709093580a67eaf263251b50"
-SRC_URI[sha256sum] = "913d32f7afe380c580da7636ee13f2728790237bb5c03def536363f552686121"
+SRC_URI[md5sum] = "64e4aad2d48cd4a92e2da13b9f35bfd2"
+SRC_URI[sha256sum] = "7be1acf053bd68a1910fc861b2cbcbad7637b5618590dd5484d43a96f7995c6e"
 
 
-- 
1.7.9.5



