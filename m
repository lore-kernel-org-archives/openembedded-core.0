Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AD00E770A1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:48:25 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 07 Jun 2016 01:48:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,432,1459839600"; d="scan'208";a="823174561"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 07 Jun 2016 01:48:24 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 11:47:40 +0300
Message-Id: <8e9aed1fa45914bb072bc6266319e89cfd8295fc.1465288175.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
References: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465288174.git.jussi.kukkonen@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
Subject: [PATCH 22/37] pcmanfm: switch to GTK3 version
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
X-List-Received-Date: Tue, 07 Jun 2016 08:48:25 -0000

From: "Maxin B. John" <maxin.john@intel.com>

Build GTK3 version of pcmanfm.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-sato/pcmanfm/pcmanfm_1.2.4.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.4.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.4.bb
index a6b0aac..a6bf213 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.4.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.4.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/gseal-gtk-compat.h;endline=21;md5=46922c8691f58d124f9420fe16149ce2"
 
 SECTION = "x11"
-DEPENDS = "gtk+ startup-notification libfm intltool-native gettext-native"
-DEPENDS_append_poky = " libowl"
+DEPENDS = "gtk+3 startup-notification libfm intltool-native gettext-native"
 
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|aarch64.*|arm.*|mips.*|powerpc.*|sh.*)-(linux|freebsd.*)'
@@ -30,6 +29,8 @@ inherit autotools pkgconfig distro_features_check
 # The startup-notification requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
 
+EXTRA_OECONF = "--with-gtk=3"
+
 do_install_append () {
 	install -d ${D}/${datadir}
 	install -d ${D}/${datadir}/pixmaps/
-- 
2.1.4


