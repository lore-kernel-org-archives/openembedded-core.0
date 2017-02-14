Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id C08C871CB4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 09:55:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 14 Feb 2017 01:55:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,160,1484035200"; d="scan'208";a="1107172870"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2017 01:55:20 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 00E6F6A4080;
	Tue, 14 Feb 2017 01:54:17 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2017 11:55:04 +0200
Message-Id: <942bd0250244990ae619c9ef55495e6ac493bdaa.1487065337.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487065337.git.jussi.kukkonen@intel.com>
References: <cover.1487065337.git.jussi.kukkonen@intel.com>
Subject: [PATCH 07/11] xkeyboard-config: Upgrade 2.19 -> 2.20
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
X-List-Received-Date: Tue, 14 Feb 2017 09:55:20 -0000

Layout updates from the last 16 months.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-lib/{xkeyboard-config_2.19.bb => xkeyboard-config_2.20.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.19.bb => xkeyboard-config_2.20.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.19.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.20.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.19.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.20.bb
index d24d93f..d00904d 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.19.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.20.bb
@@ -13,8 +13,8 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "88cbf55f2f32b80ba9bb872889daf7ff"
-SRC_URI[sha256sum] = "83dfd186b9eb9ced69e01d8d8e2f15b6a79b2e30124874ef086f2d3048f45827"
+SRC_URI[md5sum] = "1f68886339116ae3877052204c9b9b88"
+SRC_URI[sha256sum] = "d1bfc72553c4e3ef1cd6f13eec0488cf940498b612ab8a0b362e7090c94bc134"
 
 SECTION = "x11/libs"
 DEPENDS = "intltool-native virtual/gettext util-macros libxslt-native"
-- 
2.1.4


