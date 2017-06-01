Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F358377DAF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 10:37:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jun 2017 03:37:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,279,1493708400"; d="scan'208";a="1155312169"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 01 Jun 2017 03:37:08 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 92A415800D3;
	Thu,  1 Jun 2017 03:37:07 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 13:36:53 +0300
Message-Id: <bf0ca6ae531f506f26e7791357fee138614b2ff0.1496311679.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496311679.git.jussi.kukkonen@intel.com>
References: <cover.1496311679.git.jussi.kukkonen@intel.com>
Subject: [PATCH 08/10] xserver-xorg: Upgrade 1.19.1 -> 1.19.3
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
X-List-Received-Date: Thu, 01 Jun 2017 10:37:07 -0000

Bug fix releases.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-xserver/{xserver-xorg_1.19.1.bb => xserver-xorg_1.19.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.19.1.bb => xserver-xorg_1.19.3.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.3.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.1.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.3.bb
index 0dc1028..606367d 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.3.bb
@@ -6,8 +6,8 @@ SRC_URI += "file://musl-arm-inb-outb.patch \
             file://0003-modesetting-Fix-16-bit-depth-bpp-mode.patch \
             file://0003-Remove-check-for-useSIGIO-option.patch \
             "
-SRC_URI[md5sum] = "caa8ee7b2950abbf734347d137529fb6"
-SRC_URI[sha256sum] = "79ae2cf39d3f6c4a91201d8dad549d1d774b3420073c5a70d390040aa965a7fb"
+SRC_URI[md5sum] = "015d2fc4b9f2bfe7a626edb63a62c65e"
+SRC_URI[sha256sum] = "677a8166e03474719238dfe396ce673c4234735464d6dadf2959b600d20e5a98"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.1.4


