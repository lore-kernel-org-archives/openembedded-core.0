Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SoGyr-00041S-F4
	for Openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 18:38:37 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 09:27:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175108531"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2012 09:27:29 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 09:26:02 -0700
Message-Id: <8d1d42a68d5930bc374b9d6126cc1371a22a37db.1341850982.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1341850982.git.nitin.a.kamble@intel.com>
References: <cover.1341850982.git.nitin.a.kamble@intel.com>
Subject: [PATCH 01/15] automake: upgrade from 1.11.3 to 1.12.1
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
X-List-Received-Date: Mon, 09 Jul 2012 16:38:37 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../automake/automake/path_prog_fixes.patch        |   40 +++-----------------
 .../{automake_1.11.3.bb => automake_1.12.1.bb}     |    5 +-
 2 files changed, 8 insertions(+), 37 deletions(-)
 rename meta/recipes-devtools/automake/{automake_1.11.3.bb => automake_1.12.1.bb} (93%)

diff --git a/meta/recipes-devtools/automake/automake/path_prog_fixes.patch b/meta/recipes-devtools/automake/automake/path_prog_fixes.patch
index 312cec6..9ee0672 100644
--- a/meta/recipes-devtools/automake/automake/path_prog_fixes.patch
+++ b/meta/recipes-devtools/automake/automake/path_prog_fixes.patch
@@ -7,38 +7,10 @@ Upstream-Status: Inappropriate [embedded specific]
  automake.in |    6 ++++--
  4 files changed, 10 insertions(+), 6 deletions(-)
 
-Index: automake-1.10.1/Makefile.am
+Index: automake-1.12.1/aclocal.in
 ===================================================================
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
-===================================================================
---- automake-1.10.1.orig/aclocal.in	2008-01-21 22:11:41.000000000 +0000
-+++ automake-1.10.1/aclocal.in	2008-10-10 17:21:20.000000000 +0100
+--- automake-1.12.1.orig/aclocal.in
++++ automake-1.12.1/aclocal.in
 @@ -1,8 +1,8 @@
 -#!@PERL@ -w
 +#!@bindir@/env perl
@@ -50,10 +22,10 @@ Index: automake-1.10.1/aclocal.in
      if 0;
  
  # aclocal - create aclocal.m4 by scanning configure.ac
-Index: automake-1.10.1/automake.in
+Index: automake-1.12.1/automake.in
 ===================================================================
---- automake-1.10.1.orig/automake.in	2008-01-21 22:11:41.000000000 +0000
-+++ automake-1.10.1/automake.in	2008-10-10 17:21:20.000000000 +0100
+--- automake-1.12.1.orig/automake.in
++++ automake-1.12.1/automake.in
 @@ -1,8 +1,10 @@
 -#!@PERL@ -w
 +#!@bindir@/env perl
diff --git a/meta/recipes-devtools/automake/automake_1.11.3.bb b/meta/recipes-devtools/automake/automake_1.12.1.bb
similarity index 93%
rename from meta/recipes-devtools/automake/automake_1.11.3.bb
rename to meta/recipes-devtools/automake/automake_1.12.1.bb
index 2008774..c2bc6a3 100644
--- a/meta/recipes-devtools/automake/automake_1.11.3.bb
+++ b/meta/recipes-devtools/automake/automake_1.12.1.bb
@@ -43,9 +43,8 @@ SRC_URI += "${PATHFIXPATCH} \
 	    file://python-libdir.patch \
             file://py-compile-compile-only-optimized-byte-code.patch"
 
-
-SRC_URI[md5sum] = "93ecb319f0365cb801990b00f658d026"
-SRC_URI[sha256sum] = "921b5188057e57bdd9c0ba06e21d0b0ea7dafa61a9bd08a2b041215bcff12f55"
+SRC_URI[md5sum] = "ec25c1855cacf47e4bdee76a776b96ba"
+SRC_URI[sha256sum] = "24bf1640679ba4a9cbe2d36422f39a81eced7f556b576a7a2ccfc70ca85a1e2f"
 
 PR = "r0"
 
-- 
1.7.3.4



