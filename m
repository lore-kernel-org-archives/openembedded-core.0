Return-Path: <amarnath.valluri@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E9E4F6E5F5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 12:22:18 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 10 Jul 2015 05:22:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,446,1432623600"; d="scan'208";a="521989024"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Jul 2015 05:22:18 -0700
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jul 2015 15:23:12 +0300
Message-Id: <1436530992-13161-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] mc: Upgrade to release 4.8.14
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
X-List-Received-Date: Fri, 10 Jul 2015 12:22:19 -0000

Dropped mc-CTRL.patch, as it was merged to upstream.
Upstream commit-id: e78b636eba9d23e9f5f066b022bd5640c85409be.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/recipes-extended/mc/mc/mc-CTRL.patch          | 31 ----------------------
 .../mc/{mc_4.8.13.bb => mc_4.8.14.bb}              |  5 ++--
 2 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-extended/mc/mc/mc-CTRL.patch
 rename meta/recipes-extended/mc/{mc_4.8.13.bb => mc_4.8.14.bb} (92%)

diff --git a/meta/recipes-extended/mc/mc/mc-CTRL.patch b/meta/recipes-extended/mc/mc/mc-CTRL.patch
deleted file mode 100644
index e23d9dd..0000000
--- a/meta/recipes-extended/mc/mc/mc-CTRL.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Fix build with musl by ensuring CTRL is defined.
-
-musl does not define CTRL in <termios.h>, we could include <sys/ttydefaults.h>
-explicitly but it's easier just to ensure CTRL is defined.
-
-This patch is taken from Sabotage Linux, the license statement for patches and
-build scripts in Sabotage Linux says:
-
-    To the extent possible under law, Christian Neukirchen has waived
-    all copyright and related or neighboring rights to this work.
-
-    http://creativecommons.org/publicdomain/zero/1.0/
-
-Therefore this should be good to include in OpenEmbedded.
-
-Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
-
-Upstream-status: Accepted (should be included in v4.8.14)
-
-diff -u mc-4.8.1.7.org/lib/tty/tty-ncurses.c mc-4.8.1.7/lib/tty/tty-ncurses.c
---- mc-4.8.1.7.org/lib/tty/tty-ncurses.c
-+++ mc-4.8.1.7/lib/tty/tty-ncurses.c
-@@ -65,7 +65,7 @@
- 
- /*** file scope macro definitions ****************************************************************/
- 
--#if defined(_AIX) && !defined(CTRL)
-+#if !defined(CTRL)
- #define CTRL(x) ((x) & 0x1f)
- #endif
- 
diff --git a/meta/recipes-extended/mc/mc_4.8.13.bb b/meta/recipes-extended/mc/mc_4.8.14.bb
similarity index 92%
rename from meta/recipes-extended/mc/mc_4.8.13.bb
rename to meta/recipes-extended/mc/mc_4.8.14.bb
index ef5b1a2..8fec0b3 100644
--- a/meta/recipes-extended/mc/mc_4.8.13.bb
+++ b/meta/recipes-extended/mc/mc_4.8.14.bb
@@ -7,11 +7,10 @@ DEPENDS = "ncurses glib-2.0"
 RDEPENDS_${PN} = "ncurses-terminfo"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
-           file://mc-CTRL.patch \
            "
 
-SRC_URI[md5sum] = "12a521a50da6a86852177591b9623d5e"
-SRC_URI[sha256sum] = "22e1b809edba957eb9a392138bf87fea3877f7ca0b7463b7cc2eb94afa6f3e49"
+SRC_URI[md5sum] = "fe1cb75643c2bd4df64bbcf2dab76905"
+SRC_URI[sha256sum] = "61fd0fd2280c3d09d7e0aec8ab001fc89dad8e4fd9941f386414667b55152ec5"
 
 inherit autotools gettext pkgconfig
 
-- 
2.1.4

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


