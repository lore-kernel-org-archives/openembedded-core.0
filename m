Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E85F06A9ED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 13:39:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2013 06:37:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,845,1363158000"; d="scan'208";a="327680050"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2013 06:39:40 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2013 16:39:29 +0300
Message-Id: <4af565b0c6d0ea32987dc28b6d06bdc8fbb85a5f.1370956136.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1370956136.git.laurentiu.palcu@intel.com>
References: <cover.1370956136.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1370956136.git.laurentiu.palcu@intel.com>
References: <cover.1370956136.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/7] xkeyboard-config: upgrade to 2.9
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
X-List-Received-Date: Tue, 11 Jun 2013 13:39:40 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...board-config_2.8.bb => xkeyboard-config_2.9.bb} |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.8.bb => xkeyboard-config_2.9.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.9.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.9.bb
index cf4da28..df96c31 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.9.bb
@@ -13,13 +13,12 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI="${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "e66d567d85a954d589c5723fb0e1f3dd"
-SRC_URI[sha256sum] = "4e1cf5468d488aaf320ddfd439e03cbda0b213550fd734026d23138e4b2078ae"
+SRC_URI[md5sum] = "9b1280d8ba40274a0f1567c94fca7501"
+SRC_URI[sha256sum] = "5e89bc182a10d53c3e83efc6c3546de0fe5504d91c3dbc80d55cc64ddab5643a"
 
 SECTION = "x11/libs"
 DEPENDS = "intltool-native virtual/gettext"
 
-PR = "r0"
 
 EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"
 
-- 
1.7.9.5


