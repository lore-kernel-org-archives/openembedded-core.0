Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefanx.stanacar@intel.com>) id 1UZkMZ-0002OV-M9
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 18:03:37 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 07 May 2013 08:43:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,629,1363158000"; d="scan'208";a="330321525"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 07 May 2013 08:45:32 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.149])
	by linux.intel.com (Postfix) with ESMTP id D50976A408D;
	Tue,  7 May 2013 08:45:22 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 18:45:37 +0300
Message-Id: <1367941537-11885-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] xserver-xorg: Add xkbcomp to RRECOMMENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 16:03:40 -0000

OE-Core commit bdcc5e8f1286d288baf410458efc39a59b68d751 removed xkbcomp
from RDEPENDS for xkeyboard-config but X server still needs it otherwise
it fails to start.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 795410b..0eca559 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -64,7 +64,7 @@ PACKAGES =+ "${PN}-security-policy \
              ${PN}-module-libxf1bpp \
              ${PN}-module-libxf4bpp"
 
-RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
+RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config xkbcomp"
 RDEPENDS_${PN}-xvfb += "xkeyboard-config"
 RDEPENDS_${PN}-module-exa = "${PN} (= ${EXTENDPKGV})"
 
-- 
1.8.1.4



