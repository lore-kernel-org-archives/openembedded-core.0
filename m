Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 135017730D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:44:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2015 01:44:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,286,1444719600"; d="scan'208";a="599687074"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2015 01:44:13 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 11:47:04 +0200
Message-Id: <1c3d9254df9c7e68ce6dc9a92e5b2f5b4f906ba2.1447405312.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
References: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447405312.git.jussi.kukkonen@intel.com>
References: <cover.1447405312.git.jussi.kukkonen@intel.com>
Subject: [PATCH 19/19] xkeyboard-config: Upgrade 2.15 -> 2.16
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
X-List-Received-Date: Fri, 13 Nov 2015 09:44:13 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-lib/{xkeyboard-config_2.15.bb => xkeyboard-config_2.16.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.15.bb => xkeyboard-config_2.16.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.15.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.16.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.15.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.16.bb
index f416990..16a1f4f 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.15.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.16.bb
@@ -13,8 +13,8 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "4af1deeb7c5f4cad62e65957d98d6758"
-SRC_URI[sha256sum] = "0e443cf7ca2f0b40846472c029647a05933fc705d611e1478c4db8a48a6f38bf"
+SRC_URI[md5sum] = "bf6aa31195584cfce01b2194c3e5ea26"
+SRC_URI[sha256sum] = "1e8a1f212c96b7f71ca0b05da361cac1816d27baae1d8e03e7b53049b58d1d58"
 
 SECTION = "x11/libs"
 DEPENDS = "intltool-native virtual/gettext util-macros libxslt-native"
-- 
2.1.4


