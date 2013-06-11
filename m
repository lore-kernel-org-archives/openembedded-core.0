Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4341B6AA0F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 13:39:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2013 06:37:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,845,1363158000"; d="scan'208";a="327680084"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2013 06:39:43 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2013 16:39:32 +0300
Message-Id: <870e2f538026f1517e19340bb50405c15632fe9a.1370956136.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1370956136.git.laurentiu.palcu@intel.com>
References: <cover.1370956136.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1370956136.git.laurentiu.palcu@intel.com>
References: <cover.1370956136.git.laurentiu.palcu@intel.com>
Subject: [PATCH 5/7] xwininfo: upgrade to 1.1.3
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
X-List-Received-Date: Tue, 11 Jun 2013 13:39:43 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../{xwininfo_1.1.2.bb => xwininfo_1.1.3.bb}       |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xwininfo_1.1.2.bb => xwininfo_1.1.3.bb} (69%)

diff --git a/meta/recipes-graphics/xorg-app/xwininfo_1.1.2.bb b/meta/recipes-graphics/xorg-app/xwininfo_1.1.3.bb
similarity index 69%
rename from meta/recipes-graphics/xorg-app/xwininfo_1.1.2.bb
rename to meta/recipes-graphics/xorg-app/xwininfo_1.1.3.bb
index c033e2b..7a45241 100644
--- a/meta/recipes-graphics/xorg-app/xwininfo_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-app/xwininfo_1.1.3.bb
@@ -9,8 +9,7 @@ and a number of other items."
 LIC_FILES_CHKSUM = "file://COPYING;md5=78976cd3115f6faf615accc4e094d90e"
 DEPENDS += "libxext libxmu"
 
-PR = "${INC_PR}.0"
 PE = "0"
 
-SRC_URI[md5sum] = "9e8b58c8aa6172e87ab4f9cf3612fedd"
-SRC_URI[sha256sum] = "8fa66c9ce02da257613fa428137ab9efc89c8f9939c074513dbc0f407dc9ac3a"
+SRC_URI[md5sum] = "b777bafb674555e48fd8437618270931"
+SRC_URI[sha256sum] = "218eb0ea95bd8de7903dfaa26423820c523ad1598be0751d2d8b6a2c23b23ff8"
-- 
1.7.9.5


