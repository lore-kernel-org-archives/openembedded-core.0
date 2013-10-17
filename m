Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 184B76CF34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 10:34:25 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Oct 2013 03:34:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,513,1378882800"; d="scan'208";a="376040020"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 17 Oct 2013 03:34:26 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 13:34:13 +0300
Message-Id: <21351d378bd1b4896358efdf0e29466dab36b7b6.1382005791.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1382005791.git.laurentiu.palcu@intel.com>
References: <cover.1382005791.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1382005791.git.laurentiu.palcu@intel.com>
References: <cover.1382005791.git.laurentiu.palcu@intel.com>
Subject: [PATCH 3/8] xinit: upgrade to 1.3.3
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
X-List-Received-Date: Thu, 17 Oct 2013 10:34:25 -0000

License file changed: Apple added their own header.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xorg-app/{xinit_1.3.2.bb => xinit_1.3.3.bb}    |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xinit_1.3.2.bb => xinit_1.3.3.bb} (67%)

diff --git a/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb b/meta/recipes-graphics/xorg-app/xinit_1.3.3.bb
similarity index 67%
rename from meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
rename to meta/recipes-graphics/xorg-app/xinit_1.3.3.bb
index 5a97c3b..583ea87 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.3.3.bb
@@ -8,13 +8,12 @@ directly from /etc/init or in environments that use multiple window \
 systems. When this first client exits, xinit will kill the X server and \
 then terminate."
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=0d4b5eef75f1584ccbdc5e4a34314407"
+LIC_FILES_CHKSUM = "file://COPYING;md5=18f01e7b39807bebe2b8df101a039b68"
 
-PR = "${INC_PR}.0"
 PE = "1"
 
-SRC_URI[md5sum] = "9c0943cbd83e489ad1b05221b97efd44"
-SRC_URI[sha256sum] = "a1867fdaa83f68750b12ba4305c3c62f5992d0f52cfeb98e96c27a8e690e0235"
+SRC_URI[md5sum] = "3b8da0e6237aee9828cc809c647510a7"
+SRC_URI[sha256sum] = "74b2878de6e3d5b5948f1562a77e7f53b4e10621e505ddb278050c7f3cae00af"
 
 EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
 
-- 
1.7.9.5


