Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CB50A6B467
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 13:10:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 31 Jul 2013 06:10:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,787,1367996400"; d="scan'208";a="354884521"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 31 Jul 2013 06:10:16 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 16:09:55 +0300
Message-Id: <e6cfe16293d346aa034c7d13202a99a03b90e9bf.1375275560.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
Subject: [PATCH 11/13] makedepend: upgrade to 1.0.5
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
X-List-Received-Date: Wed, 31 Jul 2013 13:10:21 -0000

Removed patch since it included upstream.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../obsolete_automake_macros.patch                 |   15 ---------------
 .../{makedepend_1.0.4.bb => makedepend_1.0.5.bb}   |    7 ++-----
 2 files changed, 2 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-util/makedepend-1.0.4/obsolete_automake_macros.patch
 rename meta/recipes-graphics/xorg-util/{makedepend_1.0.4.bb => makedepend_1.0.5.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-util/makedepend-1.0.4/obsolete_automake_macros.patch b/meta/recipes-graphics/xorg-util/makedepend-1.0.4/obsolete_automake_macros.patch
deleted file mode 100644
index 1356f8d..0000000
--- a/meta/recipes-graphics/xorg-util/makedepend-1.0.4/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Accepted [https://bugs.freedesktop.org/show_bug.cgi?id=59005]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd makedepend-1.0.4/configure.ac makedepend-1.0.4/configure.ac
---- makedepend-1.0.4/configure.ac	2012-03-08 07:54:20.000000000 +0200
-+++ makedepend-1.0.4/configure.ac	2013-01-02 16:28:21.920132502 +0200
-@@ -2,7 +2,7 @@
- AC_INIT([makedepend], [1.0.4],
-         [https://bugs.freedesktop.org/enter_bug.cgi?product=xorg])
- AM_INIT_AUTOMAKE([foreign dist-bzip2])
--AM_CONFIG_HEADER([makedepend-config.h])
-+AC_CONFIG_HEADERS([makedepend-config.h])
-
- # Require X.Org macros 1.8 or later for MAN_SUBSTS set by XORG_MANPAGE_SECTIONS
- m4_ifndef([XORG_MACROS_VERSION],
diff --git a/meta/recipes-graphics/xorg-util/makedepend_1.0.4.bb b/meta/recipes-graphics/xorg-util/makedepend_1.0.5.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-util/makedepend_1.0.4.bb
rename to meta/recipes-graphics/xorg-util/makedepend_1.0.5.bb
index 899391d..84a967a 100644
--- a/meta/recipes-graphics/xorg-util/makedepend_1.0.4.bb
+++ b/meta/recipes-graphics/xorg-util/makedepend_1.0.5.bb
@@ -11,14 +11,11 @@ can reference files having other #include directives, and parsing will \
 occur in these files as well."
 
 DEPENDS = "xproto util-macros"
-PR = "r1"
 PE = "1"
 
 BBCLASSEXTEND = "native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=43a6eda34b48ee821b3b66f4f753ce4f"
 
-SRC_URI += "file://obsolete_automake_macros.patch"
-
-SRC_URI[md5sum] = "bf1c54028427829c9c3193bef710dbee"
-SRC_URI[sha256sum] = "f53b8ce5dec02a05f8994036a8ebac485a96324143ff2382e29578fdc096b04f"
+SRC_URI[md5sum] = "efb2d7c7e22840947863efaedc175747"
+SRC_URI[sha256sum] = "503903d41fb5badb73cb70d7b3740c8b30fe1cc68c504d3b6a85e6644c4e5004"
-- 
1.7.9.5


