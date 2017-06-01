Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D2BE077E18
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 10:37:07 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jun 2017 03:37:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,279,1493708400"; d="scan'208";a="109594845"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 01 Jun 2017 03:37:07 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 3384D5800D3;
	Thu,  1 Jun 2017 03:37:05 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 13:36:52 +0300
Message-Id: <9238fdd4f3d8cc304ca9e03140f4f6ee6f2c2a4f.1496311679.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496311679.git.jussi.kukkonen@intel.com>
References: <cover.1496311679.git.jussi.kukkonen@intel.com>
Subject: [PATCH 07/10] xf86-input-libinput: Upgrade 0.24.0 -> 0.25.1
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
X-List-Received-Date: Thu, 01 Jun 2017 10:37:08 -0000

Small releases with just a few fixes.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{xf86-input-libinput_0.24.0.bb => xf86-input-libinput_0.25.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.24.0.bb => xf86-input-libinput_0.25.1.bb} (63%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.24.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.25.1.bb
similarity index 63%
rename from meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.24.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.25.1.bb
index 14b1271..7b3ea16 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.24.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.25.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5e6b20ea2ef94a998145f0ea3f788ee0"
 
 DEPENDS += "libinput"
 
-SRC_URI[md5sum] = "bd3fa118e4abadb8804dc6a099bb4ab3"
-SRC_URI[sha256sum] = "ddcb07350aed59b2996a92a1b4ff64d1c0b0c86a3f0ddca15b2b1c8c8bb13628"
+SRC_URI[md5sum] = "14003139614b25cc76c9a4cad059df89"
+SRC_URI[sha256sum] = "489f7d591c9ef08463d4966e61f7c6ea433f5fcbb9f5370fb621da639a84c7e0"
 
 FILES_${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.1.4


