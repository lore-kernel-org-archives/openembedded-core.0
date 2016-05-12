Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8D15C70022
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 07:21:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2016 00:21:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,609,1455004800"; d="scan'208";a="974144506"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2016 00:20:47 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 10:20:26 +0300
Message-Id: <d5bd989faf9959d23bbaa237ccb80a1b78542a90.1463035854.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
References: <93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1463035854.git.jussi.kukkonen@intel.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
Subject: [PATCH 03/13] xkeyboard-config: Upgrade to 2.17
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
X-List-Received-Date: Thu, 12 May 2016 07:21:05 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-lib/{xkeyboard-config_2.16.bb => xkeyboard-config_2.17.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.16.bb => xkeyboard-config_2.17.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.16.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.17.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.16.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.17.bb
index 16a1f4f..ff9aa1d 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.16.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.17.bb
@@ -13,8 +13,8 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "bf6aa31195584cfce01b2194c3e5ea26"
-SRC_URI[sha256sum] = "1e8a1f212c96b7f71ca0b05da361cac1816d27baae1d8e03e7b53049b58d1d58"
+SRC_URI[md5sum] = "15034bb74deebde54161dface62abbce"
+SRC_URI[sha256sum] = "dec6be44bd31775cdc1ab95bfd75d5f2c0055613eeca8b4e9c6480b183430701"
 
 SECTION = "x11/libs"
 DEPENDS = "intltool-native virtual/gettext util-macros libxslt-native"
-- 
2.1.4


