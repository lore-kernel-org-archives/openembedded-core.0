Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id ADB8D6E9AD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 15:29:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Feb 2014 07:29:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,793,1384329600"; d="scan'208";a="450785161"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 06 Feb 2014 07:29:44 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 17:29:26 +0200
Message-Id: <66b7b8e1a19a706f5ff512d673cee83f0e183ab3.1391699953.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
Subject: [PATCH 07/13] xkeyboard-config: upgrade to 2.11
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
X-List-Received-Date: Thu, 06 Feb 2014 15:30:00 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...d-config_2.10.1.bb => xkeyboard-config_2.11.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.10.1.bb => xkeyboard-config_2.11.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.10.1.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.11.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.10.1.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.11.bb
index 058ecdd..df6aef3 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.10.1.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.11.bb
@@ -13,8 +13,8 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI="${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "997d75c722142be0d03ce4899d349d92"
-SRC_URI[sha256sum] = "7d58064d86bb0155a3acc4ca35097dab4dfef334cdd0555fb5965ebca1fca18b"
+SRC_URI[md5sum] = "e3defd29cc464cc1a1dfa0eebaca53b1"
+SRC_URI[sha256sum] = "e7125460892c2b5c3a8d843cb18c24b60c46051e925c2888a61fa672a2f76d76"
 
 SECTION = "x11/libs"
 DEPENDS = "intltool-native virtual/gettext util-macros"
-- 
1.7.9.5


