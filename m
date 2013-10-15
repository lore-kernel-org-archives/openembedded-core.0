Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9EBE56D169
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 12:46:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Oct 2013 05:46:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,498,1378882800"; d="scan'208";a="417091222"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 15 Oct 2013 05:46:20 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2013 15:46:06 +0300
Message-Id: <f03eabbc97bdc83bcdfc6a8a3225768b367d352a.1381841061.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1381841061.git.laurentiu.palcu@intel.com>
References: <cover.1381841061.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1381841061.git.laurentiu.palcu@intel.com>
References: <cover.1381841061.git.laurentiu.palcu@intel.com>
Subject: [PATCH 09/10] xprop: upgrade to 1.2.2
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
X-List-Received-Date: Tue, 15 Oct 2013 12:46:19 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xorg-app/{xprop_1.2.1.bb => xprop_1.2.2.bb}    |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xprop_1.2.1.bb => xprop_1.2.2.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-app/xprop_1.2.1.bb b/meta/recipes-graphics/xorg-app/xprop_1.2.2.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-app/xprop_1.2.1.bb
rename to meta/recipes-graphics/xorg-app/xprop_1.2.2.bb
index c74beb4..efbb1b3 100644
--- a/meta/recipes-graphics/xorg-app/xprop_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-app/xprop_1.2.2.bb
@@ -12,8 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e226ab8db88ac0bc0391673be40c9f91"
 
 DEPENDS += " libxmu virtual/libx11"
 
-PR = "${INC_PR}.0"
 PE = "1"
 
-SRC_URI[md5sum] = "d5529dc8d811efabd136ca2d8e857deb"
-SRC_URI[sha256sum] = "07907a189099b8a000406b5ca6c5346df238a9e1fe3b32dc59f48fe0ad12f1a3"
+SRC_URI[md5sum] = "fae3d2fda07684027a643ca783d595cc"
+SRC_URI[sha256sum] = "9bee88b1025865ad121f72d32576dd3027af1446774aa8300cce3c261d869bc6"
-- 
1.7.9.5


