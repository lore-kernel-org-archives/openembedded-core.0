Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 44A3B719CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 10:22:19 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 21 Oct 2016 03:22:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,375,1473145200"; d="scan'208";a="182256694"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 21 Oct 2016 03:22:21 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 13:22:02 +0300
Message-Id: <14732a9306590140f7e72f816e5dd56cf7f28dab.1477032779.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
References: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477032779.git.jussi.kukkonen@intel.com>
References: <cover.1477032779.git.jussi.kukkonen@intel.com>
Subject: [PATCH 04/15] xf86-input-libinput: Upgrade 0.19.0 -> 0.22.0
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
X-List-Received-Date: Fri, 21 Oct 2016 10:22:19 -0000

Bug fixes and some added configuration support.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{xf86-input-libinput_0.19.0.bb => xf86-input-libinput_0.22.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.19.0.bb => xf86-input-libinput_0.22.0.bb} (63%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.19.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.22.0.bb
similarity index 63%
rename from meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.19.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.22.0.bb
index 5e5c471..a102bbf 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.19.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.22.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5e6b20ea2ef94a998145f0ea3f788ee0"
 
 DEPENDS += "libinput"
 
-SRC_URI[md5sum] = "52c38b1369764243bfcf6ead1e4c6d32"
-SRC_URI[sha256sum] = "6c5d30dc7c8b8ae34261340e1dc9cbb8ef435078e084b8ef507527a8a21af477"
+SRC_URI[md5sum] = "e4364319f15f97dc2ef0ef62c8616826"
+SRC_URI[sha256sum] = "c762b4072ed448e2ae9f35cebd7fec8df7fd42b3ae61462cc3b2f720a873eae2"
 
 FILES_${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.1.4


