Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEK-0005NV-3Q
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:12 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Apr 2011 00:29:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="914945537"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2011 00:29:40 -0700
Message-Id: <e95ccd51c274ca970ee244c7f6d40df6fdee6eaf.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Wed, 13 Apr 2011 13:54:41 +0800
Date: Wed, 27 Apr 2011  0:29:40 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 19/52] alsa-utils: upgrade to version 1.0.24.2
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:12 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../ncursesfix.patch                               |   22 ++++++++++---------
 ...alsa-utils_1.0.23.bb => alsa-utils_1.0.24.2.bb} |    4 +-
 2 files changed, 14 insertions(+), 12 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-1.0.23 => alsa-utils-1.0.24.2}/ncursesfix.patch (70%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.0.23.bb => alsa-utils_1.0.24.2.bb} (95%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-1.0.23/ncursesfix.patch b/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/ncursesfix.patch
similarity index 70%
rename from meta/recipes-multimedia/alsa/alsa-utils-1.0.23/ncursesfix.patch
rename to meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/ncursesfix.patch
index 0009c1a..9936ded 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils-1.0.23/ncursesfix.patch
+++ b/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/ncursesfix.patch
@@ -1,11 +1,13 @@
-# alsa-utils: Fix ncurses build failures
-# Richard Purdie <rpurdie@linux.intel.com>
-# Rebased to 1.0.23, Dongxiao Xu <dongxiao.xu@intel.com>
+Rebase the patch to fit 1.0.24.2
 
-diff -ruN alsa-utils-1.0.23-orig/configure.in alsa-utils-1.0.23/configure.in
---- alsa-utils-1.0.23-orig/configure.in	2010-04-16 19:19:12.000000000 +0800
-+++ alsa-utils-1.0.23/configure.in	2010-06-22 15:22:06.731202478 +0800
-@@ -109,34 +109,16 @@
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+
+diff -ruN alsa-utils-1.0.24.2-orig//configure.in alsa-utils-1.0.24.2/configure.in
+--- alsa-utils-1.0.24.2-orig//configure.in	2011-04-13 13:51:20.337665010 +0800
++++ alsa-utils-1.0.24.2/configure.in	2011-04-13 13:51:54.437664986 +0800
+@@ -127,34 +127,16 @@
    NCURSESLIBSUFFIX=""
    CURSES_NLS="no"
    if test "$curseslib" = "ncursesw" -o \( "$curseslib" = "auto" -a "$USE_NLS" = "yes" \); then
@@ -17,7 +19,7 @@ diff -ruN alsa-utils-1.0.23-orig/configure.in alsa-utils-1.0.23/configure.in
 -      CURSES_CFLAGS=`ncursesw5-config --cflags`
 -      curseslib="ncursesw"
 -    else
-       AC_CHECK_LIB(ncursesw, initscr, 
+       AC_CHECK_LIB(ncursesw, initscr,
                   [ CURSESINC='<ncurses.h>'; CURSESLIB='-lncursesw'; curseslib="ncursesw"])
 -    fi
      if test -n "$CURSESINC"; then
@@ -34,9 +36,9 @@ diff -ruN alsa-utils-1.0.23-orig/configure.in alsa-utils-1.0.23/configure.in
 -      CURSES_CFLAGS=`ncurses5-config --cflags`
 -      curseslib="ncurses"
 -    else
-       AC_CHECK_LIB(ncurses, initscr, 
+       AC_CHECK_LIB(ncurses, initscr,
                   [ CURSESINC='<ncurses.h>'; CURSESLIB='-lncurses'; curseslib="ncurses"])
 -    fi
    fi
    if test "$curseslib" = "curses" -o "$curseslib" = "auto"; then
-     AC_CHECK_LIB(curses, initscr, 
+     AC_CHECK_LIB(curses, initscr,
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.23.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
similarity index 95%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.0.23.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
index 46283cc..953a3ac 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.23.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
@@ -11,8 +11,8 @@ PR = "r0"
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://ncursesfix.patch;patch=1 "
 
-SRC_URI[md5sum] = "cb0cf46029ac9549cf3a31bff6a4f4e1"
-SRC_URI[sha256sum] = "b7d05e915e25f8540ad151c6dd558cf0fc1e9bb0ee23052d531c983666a1f7b0"
+SRC_URI[md5sum] = "8238cd57cb301d1c36bcf0ecb59ce6b2"
+SRC_URI[sha256sum] = "95127f740291086486c06c28118cabca0814bde48fd14dac041a9812a5ac1be2"
 
 # lazy hack. needs proper fixing in gettext.m4, see
 # http://bugs.openembedded.org/show_bug.cgi?id=2348
-- 
1.7.1.1



