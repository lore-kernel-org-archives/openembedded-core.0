Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 05DF678213
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:39:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:39:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945909"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:39:10 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:38 +0300
Message-Id: <ffe5ed59d701ab46ad253608837324d916cf3957.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 46/50] at-spi2-atk: update to 2.26.0
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
X-List-Received-Date: Wed, 11 Oct 2017 15:39:10 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../atk/{at-spi2-atk_2.24.1.bb => at-spi2-atk_2.26.0.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-atk_2.24.1.bb => at-spi2-atk_2.26.0.bb} (83%)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.24.1.bb b/meta/recipes-support/atk/at-spi2-atk_2.26.0.bb
similarity index 83%
rename from meta/recipes-support/atk/at-spi2-atk_2.24.1.bb
rename to meta/recipes-support/atk/at-spi2-atk_2.26.0.bb
index 4a0e411495b..0d53e589ec1 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.24.1.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.26.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "79388fbc4dc7f27394556dd389aeb594"
-SRC_URI[sha256sum] = "60dc90ac4f74b8ffe96a9363c25208a443b381bacecfefea6de549f20ed6957d"
+SRC_URI[md5sum] = "555d4ca06a1b75c14db67bffac5f4d1f"
+SRC_URI[sha256sum] = "d25e528e1406a10c7d9b675aa15e638bcbf0a122ca3681f655a30cce83272fb9"
 
 DEPENDS = "dbus glib-2.0 glib-2.0-native atk at-spi2-core"
 
-- 
2.14.1


