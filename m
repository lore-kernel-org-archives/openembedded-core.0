Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9541477EF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 13:16:30 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2017 06:16:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,399,1493708400"; d="scan'208";a="117934912"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 27 Jun 2017 06:16:31 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 15090580118;
	Tue, 27 Jun 2017 06:16:30 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 16:16:24 +0300
Message-Id: <191f228799c061f0520c992d0884297ee93e3cdf.1498569089.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1498569089.git.jussi.kukkonen@intel.com>
References: <cover.1498569089.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/3] gtk+3: Upgrade 3.22.15 -> 3.22.16
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
X-List-Received-Date: Tue, 27 Jun 2017 13:16:31 -0000

A fair amount of bug fixes and improvements.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch         | 4 ++--
 meta/recipes-gnome/gtk+/{gtk+3_3.22.15.bb => gtk+3_3.22.16.bb}        | 4 ++--
 ...-icon-utils-native_3.22.15.bb => gtk-icon-utils-native_3.22.16.bb} | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.15.bb => gtk+3_3.22.16.bb} (84%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.22.15.bb => gtk-icon-utils-native_3.22.16.bb} (94%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
index e6ee21b..91e3512 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
@@ -824,8 +824,8 @@ index 649981f..a0e48a6 100644
 +	gdkgears
 +endif
 +
- if USE_X11
- noinst_PROGRAMS += testerrors
+ if USE_WAYLAND
+ noinst_PROGRAMS += testforeign
  endif
 diff --git a/testsuite/gtk/objects-finalize.c b/testsuite/gtk/objects-finalize.c
 index 0b3a519..07b096f 100644
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.22.15.bb b/meta/recipes-gnome/gtk+/gtk+3_3.22.16.bb
similarity index 84%
rename from meta/recipes-gnome/gtk+/gtk+3_3.22.15.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.22.16.bb
index 35c617c..2ae1d86 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.22.15.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.22.16.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://0004-configure.ac-Fix-wayland-protocols-path.patch \
           "
-SRC_URI[md5sum] = "9a1177854c4c5609293e017c53bc8950"
-SRC_URI[sha256sum] = "c8a012c2a99132629ab043f764a2b7cb6388483a015cd15c7a4288bec3590fdb"
+SRC_URI[md5sum] = "71820863d5479e2c4a5b78f3164d5f15"
+SRC_URI[sha256sum] = "3e0c3ad01f3c8c5c9b1cc1ae00852bd55164c8e5a9c1f90ba5e07f14f175fe2c"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
diff --git a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.15.bb b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.16.bb
similarity index 94%
rename from meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.15.bb
rename to meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.16.bb
index 2d65b96..adfb928 100644
--- a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.15.bb
+++ b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.16.bb
@@ -10,8 +10,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
           file://Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch"
-SRC_URI[md5sum] = "9a1177854c4c5609293e017c53bc8950"
-SRC_URI[sha256sum] = "c8a012c2a99132629ab043f764a2b7cb6388483a015cd15c7a4288bec3590fdb"
+SRC_URI[md5sum] = "71820863d5479e2c4a5b78f3164d5f15"
+SRC_URI[sha256sum] = "3e0c3ad01f3c8c5c9b1cc1ae00852bd55164c8e5a9c1f90ba5e07f14f175fe2c"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
                     file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
-- 
2.1.4


