Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4E50673196
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 13:34:57 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jul 2016 06:34:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,384,1464678000"; d="scan'208";a="848345545"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 18 Jul 2016 06:34:42 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2016 16:34:30 +0300
Message-Id: <02f31abfe4c958022a09671f17784efae250d313.1468848064.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <c67de06959dd87fa6ce214da11cd431c44da056f.1468848064.git.jussi.kukkonen@intel.com>
References: <c67de06959dd87fa6ce214da11cd431c44da056f.1468848064.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468848064.git.jussi.kukkonen@intel.com>
References: <cover.1468848064.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 7/9] xkeyboard-config: Upgrade 2.17 -> 2.18
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
X-List-Received-Date: Mon, 18 Jul 2016 13:34:57 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-lib/{xkeyboard-config_2.17.bb => xkeyboard-config_2.18.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.17.bb => xkeyboard-config_2.18.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.17.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.18.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.17.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.18.bb
index ff9aa1d..79fcbd8 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.17.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.18.bb
@@ -13,8 +13,8 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "15034bb74deebde54161dface62abbce"
-SRC_URI[sha256sum] = "dec6be44bd31775cdc1ab95bfd75d5f2c0055613eeca8b4e9c6480b183430701"
+SRC_URI[md5sum] = "c28cf45616bfec276879360bc36c6b27"
+SRC_URI[sha256sum] = "c41d917d6c8a59feb7ccbda51c40a6ada824fdd1e9684b52dd48c9530617ddd0"
 
 SECTION = "x11/libs"
 DEPENDS = "intltool-native virtual/gettext util-macros libxslt-native"
-- 
2.1.4


