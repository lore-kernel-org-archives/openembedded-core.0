Return-Path: <roxana.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6A41170EE6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 16:06:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Aug 2014 08:59:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,405,1406617200"; d="scan'208";a="563668526"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.66])
	by orsmga001.jf.intel.com with ESMTP; 26 Aug 2014 09:04:44 -0700
From: Ciobanu Roxana <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Aug 2014 19:04:39 +0300
Message-Id: <2f20b22ef2e28638ddf21c475918e88c15193a25.1409069046.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409069046.git.roxana.ciobanu@intel.com>
References: <cover.1409069046.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1409069046.git.roxana.ciobanu@intel.com>
References: <cover.1409069046.git.roxana.ciobanu@intel.com>
Subject: [PATCH 1/1] xkeyboard-config: upgrade to 2.12
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
X-List-Received-Date: Tue, 26 Aug 2014 16:06:09 -0000

From: Roxana Ciobanu <roxana.ciobanu@intel.com>

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 .../xorg-lib/{xkeyboard-config_2.11.bb => xkeyboard-config_2.12.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.11.bb => xkeyboard-config_2.12.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.11.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.12.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.11.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.12.bb
index b80309d..61e3847 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.11.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.12.bb
@@ -13,8 +13,8 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI="${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "e3defd29cc464cc1a1dfa0eebaca53b1"
-SRC_URI[sha256sum] = "e7125460892c2b5c3a8d843cb18c24b60c46051e925c2888a61fa672a2f76d76"
+SRC_URI[md5sum] = "1fd54ceb9092d1dbcaabaf03653092bc"
+SRC_URI[sha256sum] = "65b62b95b77b609cb6c0439e0148c48c3ab7dcb5c90eb8d34cf1cb8f360cca44"
 
 SECTION = "x11/libs"
 DEPENDS = "intltool-native virtual/gettext util-macros libxslt-native"
-- 
1.9.1


