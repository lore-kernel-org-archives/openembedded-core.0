Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A841C71A96
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 10:12:09 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 12 Dec 2016 02:12:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,334,1477983600"; d="scan'208";a="41344668"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 12 Dec 2016 02:12:11 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id C26F06A4082;
	Mon, 12 Dec 2016 02:11:23 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2016 12:11:49 +0200
Message-Id: <46862157b10a64f163ed49d8f0ada4b9bc9e5803.1481536730.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481536730.git.jussi.kukkonen@intel.com>
References: <cover.1481536730.git.jussi.kukkonen@intel.com>
Subject: [PATCH 12/12] xf86-input-libinput: Upgrade 0.22 -> 0.23
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
X-List-Received-Date: Mon, 12 Dec 2016 10:12:09 -0000

Bug fixes + libinput now supports tablets (but wacom driver is
used instead if it is installed).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{xf86-input-libinput_0.22.0.bb => xf86-input-libinput_0.23.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.22.0.bb => xf86-input-libinput_0.23.0.bb} (63%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.22.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.23.0.bb
similarity index 63%
rename from meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.22.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.23.0.bb
index a102bbf..5c49abd 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.22.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.23.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5e6b20ea2ef94a998145f0ea3f788ee0"
 
 DEPENDS += "libinput"
 
-SRC_URI[md5sum] = "e4364319f15f97dc2ef0ef62c8616826"
-SRC_URI[sha256sum] = "c762b4072ed448e2ae9f35cebd7fec8df7fd42b3ae61462cc3b2f720a873eae2"
+SRC_URI[md5sum] = "56ff43915a273c787ea8b93ccb83f835"
+SRC_URI[sha256sum] = "0b53ebdfe8f8fc7554dd92af1b1c3088a6d3ec4ae1a33fc76f57d635c736a9dc"
 
 FILES_${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.1.4


