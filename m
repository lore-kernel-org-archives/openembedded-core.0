Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQ0iH-0001nM-ED
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 20:25:13 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 May 2012 11:15:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96065342"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 03 May 2012 11:15:24 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2012 11:14:57 -0700
Message-Id: <2ab7ec6aba7c8d7841ca4013b0a3098ff78860cd.1336068854.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <e19e8ab17e0497c8de235f92d3c8d5ffcff19d91.1336068854.git.nitin.a.kamble@intel.com>
References: <e19e8ab17e0497c8de235f92d3c8d5ffcff19d91.1336068854.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336068854.git.nitin.a.kamble@intel.com>
References: <cover.1336068854.git.nitin.a.kamble@intel.com>
Subject: [PATCH 03/28] automake: upgrade from 1.11.3 to 1.12
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
X-List-Received-Date: Thu, 03 May 2012 18:25:13 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../automake/automake/path_prog_fixes.patch        |   44 ++++---------------
 .../prefer-cpio-over-pax-for-ustar-archives.patch  |   32 ++++++++------
 .../{automake_1.11.3.bb => automake_1.12.bb}       |    4 +-
 3 files changed, 30 insertions(+), 50 deletions(-)
 rename meta/recipes-devtools/automake/{automake_1.11.3.bb => automake_1.12.bb} (93%)

diff --git a/meta/recipes-devtools/automake/automake/path_prog_fixes.patch b/meta/recipes-devtools/automake/automake/path_prog_fixes.patch
index 312cec6..4daec52 100644
--- a/meta/recipes-devtools/automake/automake/path_prog_fixes.patch
+++ b/meta/recipes-devtools/automake/automake/path_prog_fixes.patch
@@ -1,5 +1,9 @@
 Upstream-Status: Inappropriate [embedded specific]
 
+Updated for automake 1.12
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/02
+
 ---
  Makefile.am |    3 ++-
  Makefile.in |    3 ++-
@@ -7,38 +11,10 @@ Upstream-Status: Inappropriate [embedded specific]
  automake.in |    6 ++++--
  4 files changed, 10 insertions(+), 6 deletions(-)
 
-Index: automake-1.10.1/Makefile.am
-===================================================================
---- automake-1.10.1.orig/Makefile.am	2008-01-21 22:28:58.000000000 +0000
-+++ automake-1.10.1/Makefile.am	2008-10-10 17:21:20.000000000 +0100
-@@ -75,7 +75,8 @@
-   -e 's,[@]SHELL[@],$(SHELL),g' \
-   -e 's,[@]VERSION[@],$(VERSION),g' \
-   -e 's,[@]configure_input[@],Generated from $@.in; do not edit by hand.,g' \
--  -e 's,[@]datadir[@],$(datadir),g'
-+  -e 's,[@]datadir[@],$(datadir),g' \
-+  -e 's,[@]bindir[@],$(bindir),g'
- 
- ## These files depend on Makefile so they are rebuilt if $(VERSION),
- ## $(datadir) or other do_subst'ituted variables change.
-Index: automake-1.10.1/Makefile.in
-===================================================================
---- automake-1.10.1.orig/Makefile.in	2008-01-21 22:29:10.000000000 +0000
-+++ automake-1.10.1/Makefile.in	2008-10-10 17:22:21.000000000 +0100
-@@ -185,7 +185,8 @@
-   -e 's,[@]SHELL[@],$(SHELL),g' \
-   -e 's,[@]VERSION[@],$(VERSION),g' \
-   -e 's,[@]configure_input[@],Generated from $@.in; do not edit by hand.,g' \
--  -e 's,[@]datadir[@],$(datadir),g'
-+  -e 's,[@]datadir[@],$(datadir),g' \
-+  -e 's,[@]bindir[@],$(bindir),g'
- 
- WGET = wget
- WGET_SV_CVS = $(WGET) http://savannah.gnu.org/cgi-bin/viewcvs/~checkout~/
-Index: automake-1.10.1/aclocal.in
+Index: automake-1.12/aclocal.in
 ===================================================================
---- automake-1.10.1.orig/aclocal.in	2008-01-21 22:11:41.000000000 +0000
-+++ automake-1.10.1/aclocal.in	2008-10-10 17:21:20.000000000 +0100
+--- automake-1.12.orig/aclocal.in
++++ automake-1.12/aclocal.in
 @@ -1,8 +1,8 @@
 -#!@PERL@ -w
 +#!@bindir@/env perl
@@ -50,10 +26,10 @@ Index: automake-1.10.1/aclocal.in
      if 0;
  
  # aclocal - create aclocal.m4 by scanning configure.ac
-Index: automake-1.10.1/automake.in
+Index: automake-1.12/automake.in
 ===================================================================
---- automake-1.10.1.orig/automake.in	2008-01-21 22:11:41.000000000 +0000
-+++ automake-1.10.1/automake.in	2008-10-10 17:21:20.000000000 +0100
+--- automake-1.12.orig/automake.in
++++ automake-1.12/automake.in
 @@ -1,8 +1,10 @@
 -#!@PERL@ -w
 +#!@bindir@/env perl
diff --git a/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch b/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch
index 4627855..e7f93e9 100644
--- a/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch
+++ b/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch
@@ -19,10 +19,14 @@ Updated for version 1.11.3:
 Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: 2011/03/14
 
-Index: automake-1.11.3/m4/tar.m4
+Updated for version 1.12:
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+Date: 2012/05/02
+
+Index: automake-1.12/m4/tar.m4
 ===================================================================
---- automake-1.11.3.orig/m4/tar.m4	2012-01-31 03:41:18.000000000 -0800
-+++ automake-1.11.3/m4/tar.m4	2012-03-14 17:36:11.901303777 -0700
+--- automake-1.12.orig/m4/tar.m4
++++ automake-1.12/m4/tar.m4
 @@ -31,7 +31,7 @@ m4_if([$1], [v7],
                [m4_fatal([Unknown tar format])])
  AC_MSG_CHECKING([how to create a $1 tar archive])
@@ -31,17 +35,17 @@ Index: automake-1.11.3/m4/tar.m4
 +_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) cpio pax none'
  _am_tools=${am_cv_prog_tar_$1-$_am_tools}
  # Do not fold the above two line into one, because Tru64 sh and
- # Solaris sh will not grok spaces in the rhs of `-'.
-Index: automake-1.11.3/Makefile.in
+ # Solaris sh will not grok spaces in the rhs of '-'.
+Index: automake-1.12/Makefile.in
 ===================================================================
---- automake-1.11.3.orig/Makefile.in	2012-02-01 02:37:59.000000000 -0800
-+++ automake-1.11.3/Makefile.in	2012-03-14 17:38:03.530869197 -0700
-@@ -62,7 +62,7 @@ am__aclocal_m4_deps = $(top_srcdir)/m4/a
- 	$(top_srcdir)/m4/options.m4 $(top_srcdir)/m4/runlog.m4 \
- 	$(top_srcdir)/m4/sanity.m4 $(top_srcdir)/m4/silent.m4 \
- 	$(top_srcdir)/m4/strip.m4 $(top_srcdir)/m4/substnot.m4 \
--	$(top_srcdir)/m4/tar.m4 $(top_srcdir)/configure.ac
-+	$(top_srcdir)/configure.ac
+--- automake-1.12.orig/Makefile.in
++++ automake-1.12/Makefile.in
+@@ -95,7 +95,7 @@ am__aclocal_m4_deps = $(top_srcdir)/m4/a
+ 	$(top_srcdir)/m4/mkdirp.m4 $(top_srcdir)/m4/options.m4 \
+ 	$(top_srcdir)/m4/runlog.m4 $(top_srcdir)/m4/sanity.m4 \
+ 	$(top_srcdir)/m4/silent.m4 $(top_srcdir)/m4/strip.m4 \
+-	$(top_srcdir)/m4/substnot.m4 $(top_srcdir)/m4/tar.m4 \
++	$(top_srcdir)/m4/substnot.m4 \
+ 	$(top_srcdir)/configure.ac
  am__configure_deps = $(am__aclocal_m4_deps) $(CONFIGURE_DEPENDENCIES) \
  	$(ACLOCAL_M4)
- am__CONFIG_DISTCLEAN_FILES = config.status config.cache config.log \
diff --git a/meta/recipes-devtools/automake/automake_1.11.3.bb b/meta/recipes-devtools/automake/automake_1.12.bb
similarity index 93%
rename from meta/recipes-devtools/automake/automake_1.11.3.bb
rename to meta/recipes-devtools/automake/automake_1.12.bb
index 2008774..6e9cd33 100644
--- a/meta/recipes-devtools/automake/automake_1.11.3.bb
+++ b/meta/recipes-devtools/automake/automake_1.12.bb
@@ -44,8 +44,8 @@ SRC_URI += "${PATHFIXPATCH} \
             file://py-compile-compile-only-optimized-byte-code.patch"
 
 
-SRC_URI[md5sum] = "93ecb319f0365cb801990b00f658d026"
-SRC_URI[sha256sum] = "921b5188057e57bdd9c0ba06e21d0b0ea7dafa61a9bd08a2b041215bcff12f55"
+SRC_URI[md5sum] = "d8a8f6bd898a6b34a874728cd1e47a95"
+SRC_URI[sha256sum] = "6dcc0c5971c74da369dda00fceaf5416c1f186d635eb14cc301d1ce29e5a9a26"
 
 PR = "r0"
 
-- 
1.7.7



