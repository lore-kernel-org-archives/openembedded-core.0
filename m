Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1EF936D141
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 12:46:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Oct 2013 05:46:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,498,1378882800"; d="scan'208";a="417091182"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 15 Oct 2013 05:46:13 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2013 15:45:59 +0300
Message-Id: <28496b3d421183e047b0c22ab74c39db032d2cdd.1381841061.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1381841061.git.laurentiu.palcu@intel.com>
References: <cover.1381841061.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1381841061.git.laurentiu.palcu@intel.com>
References: <cover.1381841061.git.laurentiu.palcu@intel.com>
Subject: [PATCH 02/10] xkeyboard-config: upgrade to 2.10.1
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
X-List-Received-Date: Tue, 15 Oct 2013 12:46:12 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...rd-config_2.9.bb => xkeyboard-config_2.10.1.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.9.bb => xkeyboard-config_2.10.1.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.9.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.10.1.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.9.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.10.1.bb
index c60c7fe..058ecdd 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.9.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.10.1.bb
@@ -13,8 +13,8 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI="${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "9b1280d8ba40274a0f1567c94fca7501"
-SRC_URI[sha256sum] = "5e89bc182a10d53c3e83efc6c3546de0fe5504d91c3dbc80d55cc64ddab5643a"
+SRC_URI[md5sum] = "997d75c722142be0d03ce4899d349d92"
+SRC_URI[sha256sum] = "7d58064d86bb0155a3acc4ca35097dab4dfef334cdd0555fb5965ebca1fca18b"
 
 SECTION = "x11/libs"
 DEPENDS = "intltool-native virtual/gettext util-macros"
-- 
1.7.9.5


