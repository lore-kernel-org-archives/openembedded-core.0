Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2552A6FF60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 08:15:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 14 Jun 2016 01:15:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,470,1459839600"; d="scan'208";a="718727719"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2016 01:15:04 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 11:14:26 +0300
Message-Id: <aba53c79d6a0d2a6d36470425a10c682bd9f256b.1465891164.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
References: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465891164.git.jussi.kukkonen@intel.com>
References: <cover.1465891164.git.jussi.kukkonen@intel.com>
Subject: [PATCHv3 02/30] matchbox-desktop: Ugrade to 2.1
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
X-List-Received-Date: Tue, 14 Jun 2016 08:15:05 -0000

Changes since 2.0
* Ported to GTK+3
* Removed deprecated API use, started using new
  GTK+ features like FlowBox instead of custom code
* Added --mode for easier debugging

One of the LIC_FILES_CHKSUM files was removed upstream.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{matchbox-desktop_git.bb => matchbox-desktop_2.1.bb}      | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-sato/matchbox-desktop/{matchbox-desktop_git.bb => matchbox-desktop_2.1.bb} (65%)

diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.1.bb
similarity index 65%
rename from meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
rename to meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.1.bb
index dbe8c11..d6c53b0 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.1.bb
@@ -4,18 +4,15 @@ BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://libtaku/eggsequence.h;endline=20;md5=b91f68f7642a1459fa1f4c9df94a8f15 \
                     file://src/desktop.c;endline=20;md5=36c9bf295e6007f3423095f405af5a2d \
                     file://src/main.c;endline=19;md5=2044244f97a195c25b7dc602ac7e9a00"
 
-DEPENDS = "gtk+ startup-notification dbus"
+DEPENDS = "gtk+3 startup-notification dbus"
 SECTION = "x11/wm"
-SRCREV = "71e3e6e04271e9d5a14f1c231ef100c7f320134d"
-PV = "2.0+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN}-2 \
-           file://0001-Do-nothing-on-delete-event-when-not-STANDALONE.patch \
-           "
+# SRCREV tagged 2.1
+SRCREV = "c8473519a0f37488b8b3e839e275b000cdde0b80"
+SRC_URI = "git://git.yoctoproject.org/${BPN}-2"
 
 EXTRA_OECONF = "--enable-startup-notification --with-dbus"
 
-- 
2.1.4


