Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tx3wg-0005k5-4j
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 00:04:58 +0100
Received: from mail-ee0-f70.google.com ([74.125.83.70])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 20 Jan 2013 14:49:29 -0800
Received: by mail-ee0-f70.google.com with SMTP id l10so6459134eei.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Jan 2013 14:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=z7bnOkZ6zCY+57QcPWye11OWu2LgUcbnPvikQXK6OdQ=;
	b=Tpv/4jVcs/P/um3/i+z8ojEV2q7eEDhxET6pQqA3mmsT/3VoIe5DheG7Nz4PpvUIHp
	GRPXvFTxb0wu+bmL8OW0qupYDUy3WLinkhmGGqszhBMLKabaGutN5zpmQu9wr1AyVBFY
	bL0OIZKkxKWyhNlONL445pxr3KjHw+cQYUq6OCh5b5+35YsrSh9ruDutSv0FDoRFdXaW
	vFqbErtwwQKNKfqrWp2FWUaKbHQhWWonkT2xp6YQAq7FMHd+R14Cys09vm3a+fEFGBS7
	ogadAG2G61EUygMpHKYgCqhR1Q1M7+edpW/2G71iD0T02rwln3iWM4qszUOBhinZzkoK
	3eig==
X-Received: by 10.180.99.227 with SMTP id et3mr12460011wib.6.1358722167898;
	Sun, 20 Jan 2013 14:49:27 -0800 (PST)
X-Received: by 10.180.99.227 with SMTP id et3mr12460009wib.6.1358722167825;
	Sun, 20 Jan 2013 14:49:27 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fv2sm14351817wib.4.2013.01.20.14.49.26
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 20 Jan 2013 14:49:27 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Jan 2013 22:47:28 +0000
Message-Id: <1358722048-1865-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnUB3miovPiOeAVHMfRp8y14A6lhcvzZCURbWRtTX0SimcLmkOUKsWUIdBrF8zCQ0QcxVruCPynM3C44CtdEdxC/dOIjJjQYuEtVi8zcuUrsQjot33shi4ARbini8RvX02Xf9UIu7oTfQ4zKkt9odVq+FZYMGKoJci20mHFfNLb+UTmc/9QrZlCg0/DZ7jqC1FK6Dva
Subject: [PATCH] gtk+3: refresh cross.patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Jan 2013 23:04:58 -0000

cross.patch was accepted upstream, so update this patch with the commit that was
merged.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3/cross.patch |   63 ++++++++++++++++-------------
 1 file changed, 36 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/cross.patch b/meta/recipes-gnome/gtk+/gtk+3/cross.patch
index 7b2a158..f2ea99b 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/cross.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/cross.patch
@@ -1,7 +1,7 @@
-Upstream-Status: Submitted [#691301]
+Upstream-Status: Backport [SHA 53083ea7b423482b203372f02d097edbef894a7d]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-From 2ce72e5d53e84a2eba8c3f2cb6af25ffffc46ea9 Mon Sep 17 00:00:00 2001
+From b670abe861e8dde067f544b9131edc28575d63ab Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 7 Jan 2013 12:49:27 +0000
 Subject: [PATCH] build: support cross-compilation by natively building
@@ -17,16 +17,16 @@ assumes that you'd set PKG_CONFIG_FOR_BUILD to a host pkg-config binary.
 
 https://bugzilla.gnome.org/show_bug.cgi?id=691301
 ---
- configure.ac               |   25 +++++++--
+ configure.ac               |   39 ++++++++++----
  gtk/Makefile.am            |   12 ++++-
  gtk/native/Makefile.am     |   12 +++++
  m4/ax_prog_cc_for_build.m4 |  125 ++++++++++++++++++++++++++++++++++++++++++++
- 4 files changed, 168 insertions(+), 6 deletions(-)
+ 4 files changed, 177 insertions(+), 11 deletions(-)
  create mode 100644 gtk/native/Makefile.am
  create mode 100644 m4/ax_prog_cc_for_build.m4
 
 diff --git a/configure.ac b/configure.ac
-index 0069a9f..35b5f27 100644
+index 0069a9f..f502e06 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -29,6 +29,9 @@ AC_CONFIG_SRCDIR([gdk/gdktypes.h])
@@ -56,38 +56,47 @@ index 0069a9f..35b5f27 100644
  MATH_LIB=-lm
  AC_MSG_CHECKING([for native Win32])
  LIB_EXE_MACHINE_FLAG=X86
-@@ -868,14 +870,28 @@ dnl Look for a host system's gdk-pixbuf-csource if we are cross-compiling
+@@ -868,14 +870,32 @@ dnl Look for a host system's gdk-pixbuf-csource if we are cross-compiling
  
  AM_CONDITIONAL(CROSS_COMPILING, test $cross_compiling = yes)
  
 -if test "x$cross_compiling" = xyes || test "x$enable_gtk2_dependency" = xyes; then
-+if test "x$enable_gtk2_dependency" = xyes; then
-   AC_PATH_PROG(GTK_UPDATE_ICON_CACHE, gtk-update-icon-cache, no)
-   if test x$GTK_UPDATE_ICON_CACHE = xno; then
-     REBUILD_PNGS=#
-   fi
-+elif test "x$cross_compiling" = xyes; then
-+  # If no GTK+2 dependency and cross compiling, we need to find a host gdk-pixbuf.
-+  # pkg.m4 blocks all variable starting with PKG, so allow this one
-+  m4_pattern_allow([PKG_CONFIG_FOR_BUILD])
-+  AC_MSG_CHECKING([for native gdk-pixbuf])
-+  if AC_RUN_LOG([$PKG_CONFIG_FOR_BUILD --exists --print-errors gdk-pixbuf-2.0]); then
-+    AC_MSG_RESULT([yes])
-+  else
-+    AC_MSG_ERROR([native gdk-pixbuf not found])
-+  fi
-+  NATIVE_GDKPIXBUF_CFLAGS=`$PKG_CONFIG_FOR_BUILD --cflags gdk-pixbuf-2.0`
-+  NATIVE_GDKPIXBUF_LIBS=`$PKG_CONFIG_FOR_BUILD --libs gdk-pixbuf-2.0`
-+  AC_SUBST(NATIVE_GDKPIXBUF_CFLAGS)
-+  AC_SUBST(NATIVE_GDKPIXBUF_LIBS)
- fi
+-  AC_PATH_PROG(GTK_UPDATE_ICON_CACHE, gtk-update-icon-cache, no)
+-  if test x$GTK_UPDATE_ICON_CACHE = xno; then
+-    REBUILD_PNGS=#
+-  fi
+-fi
++AS_IF([test "x$enable_gtk2_dependency" = xyes],
++      [AC_PATH_PROG(GTK_UPDATE_ICON_CACHE, gtk-update-icon-cache, no)
++       if test x$GTK_UPDATE_ICON_CACHE = xno; then
++         REBUILD_PNGS=#
++       fi],
++
++      [test "x$cross_compiling" = xyes],
++      [# If no GTK+2 dependency and cross compiling, we need to find a host gdk-pixbuf.
++       # pkg.m4 blocks all variable starting with PKG, so allow this one
++       m4_pattern_allow([PKG_CONFIG_FOR_BUILD])
++
++       AS_IF([test x$PKG_CONFIG_FOR_BUILD = x],
++             [AC_MSG_ERROR([You must define PKG_CONFIG_FOR_BUILD when cross compiling])])
++
++       AC_MSG_CHECKING([for native gdk-pixbuf])
++       AS_IF([AC_RUN_LOG([$PKG_CONFIG_FOR_BUILD --exists --print-errors gdk-pixbuf-2.0])],
++             [AC_MSG_RESULT([yes])],
++             [AC_MSG_ERROR([native gdk-pixbuf not found])])
++
++       NATIVE_GDKPIXBUF_CFLAGS=`$PKG_CONFIG_FOR_BUILD --cflags gdk-pixbuf-2.0`
++       NATIVE_GDKPIXBUF_LIBS=`$PKG_CONFIG_FOR_BUILD --libs gdk-pixbuf-2.0`
++       AC_SUBST(NATIVE_GDKPIXBUF_CFLAGS)
++       AC_SUBST(NATIVE_GDKPIXBUF_LIBS)]
++)
  
 -AM_CONDITIONAL(USE_EXTERNAL_ICON_CACHE, [test "x$cross_compiling" = xyes || test "x$enable_gtk2_dependency" = xyes])
 +AM_CONDITIONAL(USE_EXTERNAL_ICON_CACHE, [test "x$enable_gtk2_dependency" = xyes])
  
  AC_PATH_PROG(GDK_PIXBUF_CSOURCE, gdk-pixbuf-csource, no)
  
-@@ -1742,6 +1758,7 @@ gtk/makefile.msc
+@@ -1742,6 +1762,7 @@ gtk/makefile.msc
  gtk/gtkversion.h
  gtk/gtk-win32.rc
  gtk/a11y/Makefile
-- 
1.7.10.4



