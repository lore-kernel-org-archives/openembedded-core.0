Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BA85877E12
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 10:37:09 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jun 2017 03:37:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,279,1493708400"; d="scan'208";a="93584370"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 01 Jun 2017 03:37:11 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 411435800D3;
	Thu,  1 Jun 2017 03:37:10 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 13:36:55 +0300
Message-Id: <b8ff51ab7decd583268ed0b91f91c65176d002e8.1496311679.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496311679.git.jussi.kukkonen@intel.com>
References: <cover.1496311679.git.jussi.kukkonen@intel.com>
Subject: [PATCH 10/10] xkeyboard-config: Upgrade 2.20 -> 2.21
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
X-List-Received-Date: Thu, 01 Jun 2017 10:37:09 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-lib/{xkeyboard-config_2.20.bb => xkeyboard-config_2.21.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.20.bb => xkeyboard-config_2.21.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.20.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.21.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.20.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.21.bb
index 168b840..01a51ad 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.20.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.21.bb
@@ -13,8 +13,8 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "1f68886339116ae3877052204c9b9b88"
-SRC_URI[sha256sum] = "d1bfc72553c4e3ef1cd6f13eec0488cf940498b612ab8a0b362e7090c94bc134"
+SRC_URI[md5sum] = "af9498e8954907d0a47f0f7b3d21e1ef"
+SRC_URI[sha256sum] = "30c17049fae129fc14875656da9aa3099e3031d6ce0ee1d77aae190fd9edcec5"
 
 SECTION = "x11/libs"
 DEPENDS = "intltool-native util-macros libxslt-native"
-- 
2.1.4


