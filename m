Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Slx7D-00036R-7A
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 09:01:39 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Jul 2012 23:50:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118373998"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Jul 2012 23:50:38 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 09:50:25 +0300
Message-Id: <1341298228-4412-9-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
References: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 08/10] xcb-util-image: upgrade to 0.3.9
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
X-List-Received-Date: Tue, 03 Jul 2012 07:01:39 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...util-image_0.3.8.bb => xcb-util-image_0.3.9.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xcb/{xcb-util-image_0.3.8.bb => xcb-util-image_0.3.9.bb} (66%)

diff --git a/meta/recipes-graphics/xcb/xcb-util-image_0.3.8.bb b/meta/recipes-graphics/xcb/xcb-util-image_0.3.9.bb
similarity index 66%
rename from meta/recipes-graphics/xcb/xcb-util-image_0.3.8.bb
rename to meta/recipes-graphics/xcb/xcb-util-image_0.3.9.bb
index 766ef0a..43ef5a7 100644
--- a/meta/recipes-graphics/xcb/xcb-util-image_0.3.8.bb
+++ b/meta/recipes-graphics/xcb/xcb-util-image_0.3.9.bb
@@ -7,6 +7,6 @@ LIC_FILES_CHKSUM = "file://image/xcb_image.c;endline=24;md5=eafdf965cfb89955fded
                     file://image/xcb_image.h;startline=4;endline=27;md5=4e4f1b0fae5694beed407dea01f38212"
 PR = "r0"
 
-SRC_URI[md5sum] = "245a96041f373b05764148e52d2e0211"
-SRC_URI[sha256sum] = "40390528c26e8231132540f16579b821de68bb2e9152918f72182d5a4038a6d9"
+SRC_URI[md5sum] = "fabb80b36490b00fc91289e2c7f66770"
+SRC_URI[sha256sum] = "d35a3c0eaae171f5081ec127fb9cec174b716ce5d78196a87f2785376da021df"
 
-- 
1.7.9.5



