Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 766C8606D1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 10:42:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 15 Jul 2016 03:42:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,367,1464678000"; d="scan'208";a="1017432575"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 15 Jul 2016 03:41:59 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2016 13:41:46 +0300
Message-Id: <17d1a5fdd1611369cd267d497ac8e6ea16cfb398.1468578590.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <8673f0535cc7b0698e4d900b79f06975dd8670c1.1468578590.git.jussi.kukkonen@intel.com>
References: <8673f0535cc7b0698e4d900b79f06975dd8670c1.1468578590.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468578590.git.jussi.kukkonen@intel.com>
References: <cover.1468578590.git.jussi.kukkonen@intel.com>
Subject: [PATCH 8/8] xf86-input-libinput: Upgrade 0.16.0 -> 0.19.0
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
X-List-Received-Date: Fri, 15 Jul 2016 10:42:14 -0000

Note that the xorg configuration file for input-libinput now sorts
lower than it used to (90 -> 60).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{xf86-input-libinput_0.16.0.bb => xf86-input-libinput_0.19.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.16.0.bb => xf86-input-libinput_0.19.0.bb} (63%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.16.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.19.0.bb
similarity index 63%
rename from meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.16.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.19.0.bb
index 0252baf..5e5c471 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.16.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.19.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5e6b20ea2ef94a998145f0ea3f788ee0"
 
 DEPENDS += "libinput"
 
-SRC_URI[md5sum] = "2c8cb520f88da7bafaceebc0b34ea1d4"
-SRC_URI[sha256sum] = "fdade531e91e79acf6dce8ac55fa4f65abe3f1358c5d3d777ae48dbc74b76f49"
+SRC_URI[md5sum] = "52c38b1369764243bfcf6ead1e4c6d32"
+SRC_URI[sha256sum] = "6c5d30dc7c8b8ae34261340e1dc9cbb8ef435078e084b8ef507527a8a21af477"
 
 FILES_${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.1.4


