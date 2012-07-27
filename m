Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SujN4-0003yz-M6
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 14:10:18 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 27 Jul 2012 04:58:45 -0700
Received: by weyt11 with SMTP id t11so1791681wey.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 04:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=ZhO9AgC42H4V7YCuNsjQ9e7Fmb8ZqOqJP2LrcmGkFIU=;
	b=XJJdJhmG+vIixXwIU2dGm68E3fNP9W26ZLNfh3vub9r4MBvXbJRO1ijgTUMuj1GEXX
	1GOV8Dy6QuurCm/sc8fPo+2YwCB9wtH1XGx4OPbTyvZ5EFDVkeBHnUGqEqYvYeMj4CDl
	30FWKnkXUOtV09e/XRc7z4BWsj4Lhn4KJi4vyb3IKtwf8kUWiqaQFaSS7mAM+4UJvl2U
	hHCaC112SlnZjKuvvs++ascSlJfJKHwe9gRZ8dwfPHLr9Y6177UqU369O7K3M/94tyfb
	j77bUeu+wEQ/MCTPcqaW2otGt938mkTvwQAGOK6FCxLOCTxHWUxRsdYclBdnvP9oIa4z
	jMSw==
Received: by 10.180.78.5 with SMTP id x5mr5600569wiw.13.1343390323762;
	Fri, 27 Jul 2012 04:58:43 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id j6sm6001033wiy.4.2012.07.27.04.58.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jul 2012 04:58:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2012 12:58:12 +0100
Message-Id: <1343390292-30326-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkJ7i+jhdfy6dxC2ffRXbkdmnhzkW0OIailgZSXEOMRKnZ8oau1A5scrkThm+bJHPTN5lxE
Cc: Damien Lespiau <damien.lespiau@intel.com>
Subject: [PATCH] libpciaccess: lpci access does not depend on X
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2012 12:10:18 -0000

From: Damien Lespiau <damien.lespiau@intel.com>

So let's remove the X dependencies from DEPENDS and white list it in
xorg-lib-common.inc.

Signed-off-by: Damien Lespiau <damien.lespiau@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libpciaccess_0.13.1.bb |    4 +---
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc    |    2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.1.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.1.bb
index 178e220..0ec6814 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.13.1.bb
@@ -8,9 +8,7 @@ require xorg-lib-common.inc
 LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de01cb89a769dc657d4c321c209ce4fc"
 
-PR = "r0"
-
-DEPENDS += "xproto virtual/libx11"
+PR = "r1"
 
 SRC_URI[md5sum] = "399a419ac6a54f0fc07c69c9bdf452dc"
 SRC_URI[sha256sum] = "27ab68f645691a4ca258dcc9d131040586e134f9233ce079794496f6264da084"
diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index 73a4d1d..55eaf49 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -16,7 +16,7 @@ inherit autotools pkgconfig
 EXTRA_OECONF = "--enable-malloc0returnsnull --with-fop=no --without-xmlto"
 
 python () {
-        whitelist = [ "pixman" ]
+        whitelist = [ "pixman", "libpciaccess" ]
         if not d.getVar('BPN', True) in whitelist and not oe.utils.contains ('DISTRO_FEATURES', 'x11', True, False, d):
                 raise bb.parse.SkipPackage("'x11' not in DISTRO_FEATURES")
 }
-- 
1.7.10



