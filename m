Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RVXCz-0003Ro-0a
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 00:35:29 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Nov 2011 15:28:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81086448"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2011 15:28:47 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 07:24:12 +0800
Message-Id: <7433a3fb0ff72e1a6fe30062c523ad81852a9e1b.1322608823.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1322608823.git.edwin.zhai@intel.com>
References: <cover.1322608823.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1322608823.git.edwin.zhai@intel.com>
References: <cover.1322608823.git.edwin.zhai@intel.com>
Subject: [PATCH 1/8] gtk+: Upgrade to 2.24.8
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
X-List-Received-Date: Tue, 29 Nov 2011 23:35:29 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 ...Duplicate-the-exec-string-returned-by-gtk.patch |    0
 .../cellrenderer-cairo.patch                       |    0
 .../configure-nm.patch                             |    0
 .../configurefix.patch                             |    0
 .../{gtk+-2.24.6 => gtk+-2.24.8}/doc-fixes.patch   |    0
 .../{gtk+-2.24.6 => gtk+-2.24.8}/entry-cairo.patch |    0
 .../hardcoded_libtool.patch                        |    0
 .../{gtk+-2.24.6 => gtk+-2.24.8}/no-demos.patch    |    0
 .../run-iconcache.patch                            |    0
 .../{gtk+-2.24.6 => gtk+-2.24.8}/toggle-font.diff  |    0
 .../{gtk+-2.24.6 => gtk+-2.24.8}/xsettings.patch   |    0
 .../gtk+/{gtk+_2.24.6.bb => gtk+_2.24.8.bb}        |    6 +++---
 12 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.6 => gtk+-2.24.8}/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.6 => gtk+-2.24.8}/cellrenderer-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.6 => gtk+-2.24.8}/configure-nm.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.6 => gtk+-2.24.8}/configurefix.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.6 => gtk+-2.24.8}/doc-fixes.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.6 => gtk+-2.24.8}/entry-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.6 => gtk+-2.24.8}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.6 => gtk+-2.24.8}/no-demos.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.6 => gtk+-2.24.8}/run-iconcache.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.6 => gtk+-2.24.8}/toggle-font.diff (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.6 => gtk+-2.24.8}/xsettings.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.6.bb => gtk+_2.24.8.bb} (93%)

diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.6/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.8/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.6/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.8/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.6/cellrenderer-cairo.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.8/cellrenderer-cairo.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.6/cellrenderer-cairo.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.8/cellrenderer-cairo.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.6/configure-nm.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.8/configure-nm.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.6/configure-nm.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.8/configure-nm.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.6/configurefix.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.8/configurefix.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.6/configurefix.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.8/configurefix.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.6/doc-fixes.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.8/doc-fixes.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.6/doc-fixes.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.8/doc-fixes.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.6/entry-cairo.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.8/entry-cairo.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.6/entry-cairo.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.8/entry-cairo.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.6/hardcoded_libtool.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.8/hardcoded_libtool.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.6/hardcoded_libtool.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.8/hardcoded_libtool.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.6/no-demos.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.8/no-demos.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.6/no-demos.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.8/no-demos.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.6/run-iconcache.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.8/run-iconcache.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.6/run-iconcache.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.8/run-iconcache.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.6/toggle-font.diff b/meta/recipes-gnome/gtk+/gtk+-2.24.8/toggle-font.diff
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.6/toggle-font.diff
rename to meta/recipes-gnome/gtk+/gtk+-2.24.8/toggle-font.diff
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.6/xsettings.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.8/xsettings.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.6/xsettings.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.8/xsettings.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
similarity index 93%
rename from meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
rename to meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
index ade0a2d..fb88979 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
@@ -27,10 +27,10 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
 #        file://combo-arrow-size.patch;striplevel=0
 #            file://configurefix.patch
 
-PR = "r2"
+PR = "r0"
 
-SRC_URI[md5sum] = "421100f6597e613234f8dead6091a9fe"
-SRC_URI[sha256sum] = "6f45bdbf9ea27eb3b5f977d7ee2365dede0d0ce454985680c26e5210163bbf37"
+SRC_URI[md5sum] = "0413187f7e596aef00ccd1b54776ff03"
+SRC_URI[sha256sum] = "ac2325a65312922a6722a7c02a389f3f4072d79e13131485cc7b7226e2537043"
 
 EXTRA_OECONF = "--without-libtiff --without-libjasper --enable-xkb --disable-glibtest --disable-cups --disable-xinerama"
 
-- 
1.7.1



