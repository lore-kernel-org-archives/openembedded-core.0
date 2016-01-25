Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AA919770EF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 16:11:45 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jan 2016 08:10:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,345,1449561600"; d="scan'208";a="641143941"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2016 08:10:56 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:07:19 +0200
Message-Id: <f441a1ddcffcedb7b02eaa11a62a869369a423f4.1453737141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0.rc3
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/16] gtk+: update to 2.24.29
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
X-List-Received-Date: Mon, 25 Jan 2016 16:11:46 -0000

Fix a do_configure() error (missing m4 macro) in puzzles recipe caused
by this update.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gtk+/{gtk+_2.24.28.bb => gtk+_2.24.29.bb} | 4 ++--
 meta/recipes-sato/puzzles/puzzles_git.bb                     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.28.bb => gtk+_2.24.29.bb} (90%)

diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.28.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.29.bb
similarity index 90%
rename from meta/recipes-gnome/gtk+/gtk+_2.24.28.bb
rename to meta/recipes-gnome/gtk+/gtk+_2.24.29.bb
index e343773..675ef6d 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.28.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.29.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
            file://strict-prototypes.patch \
 	  "
 
-SRC_URI[md5sum] = "bfacf87b2ea67e4e5c7866a9003e6526"
-SRC_URI[sha256sum] = "b2c6441e98bc5232e5f9bba6965075dcf580a8726398f7374d39f90b88ed4656"
+SRC_URI[md5sum] = "1b7a3689f65617387b5b54520f4439e8"
+SRC_URI[sha256sum] = "0741c59600d3d810a223866453dc2bbb18ce4723828681ba24aa6519c37631b8"
 
 EXTRA_OECONF = "--enable-xkb --disable-glibtest --disable-cups --disable-xinerama"
 
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index dab5440..346f43b 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -21,7 +21,7 @@ PV = "0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep distro_features_check
+inherit autotools-brokensep distro_features_check pkgconfig
 
 PACKAGECONFIG ??= "gtk2"
 PACKAGECONFIG[gtk2] = "--with-gtk=2,,gtk+,"
-- 
2.7.0.rc3


