Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D69A873218
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 13:07:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 11 Mar 2016 05:07:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,320,1455004800"; d="scan'208";a="907975089"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2016 05:06:59 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 15:12:23 +0200
Message-Id: <2b3339d20404c3195fe1432285bc73988aafdc05.1457698804.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cdfe332fa18ab7007527661a7cb458f899f04336.1457698804.git.jussi.kukkonen@intel.com>
References: <cdfe332fa18ab7007527661a7cb458f899f04336.1457698804.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1457698804.git.jussi.kukkonen@intel.com>
References: <cover.1457698804.git.jussi.kukkonen@intel.com>
Subject: [RFC PATCH 04/12] matchbox-desktop: Ugrade to JKU
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
X-List-Received-Date: Fri, 11 Mar 2016 13:07:04 -0000

This is the GTK+3 version.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
index 318d2e0..76a041a 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
@@ -4,16 +4,15 @@ BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://libtaku/eggsequence.h;endline=20;md5=b91f68f7642a1459fa1f4c9df94a8f15 \
                     file://src/desktop.c;endline=20;md5=36c9bf295e6007f3423095f405af5a2d \
                     file://src/main.c;endline=19;md5=2044244f97a195c25b7dc602ac7e9a00"
 
-DEPENDS = "gtk+ startup-notification dbus"
+DEPENDS = "gtk+3 startup-notification dbus"
 SECTION = "x11/wm"
-SRCREV = "71e3e6e04271e9d5a14f1c231ef100c7f320134d"
+SRCREV = "4972177fc5c7ce15d4f9c1c98787a98e633a758e"
 PV = "2.0+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN}-2"
+SRC_URI = "git://github.com/jku/matchbox-desktop-2.git;branch=gtk3"
 
 EXTRA_OECONF = "--enable-startup-notification --with-dbus"
 
-- 
2.1.4


