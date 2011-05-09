Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJKUF-0003hR-O3
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 09:02:36 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2011 23:59:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,339,1301900400"; d="scan'208";a="919810309"
Received: from unknown (HELO localhost) ([10.255.12.42])
	by fmsmga001.fm.intel.com with ESMTP; 08 May 2011 23:59:51 -0700
Message-Id: <263293127306fb521efb7e195c7720ed238cf2cc.1304924223.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304924223.git.sgw@linux.intel.com>
References: <cover.1304924223.git.sgw@linux.intel.com>
Old-Date: Thu, 5 May 2011 20:26:03 -0700
Date: Sun, 08 May 2011 23:59:50 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 10/20] gcc-4.5.1: update upstream status of patches
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
X-List-Received-Date: Mon, 09 May 2011 07:02:36 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../gcc/gcc-4.5.1/100-uclibc-conf.patch            |    2 ++
 .../gcc/gcc-4.5.1/103-uclibc-conf-noupstream.patch |    2 ++
 .../gcc/gcc-4.5.1/200-uclibc-locale.patch          |    2 ++
 .../gcc/gcc-4.5.1/203-uclibc-locale-no__x.patch    |    2 ++
 .../gcc-4.5.1/204-uclibc-locale-wchar_fix.patch    |    2 ++
 .../gcc/gcc-4.5.1/205-uclibc-locale-update.patch   |    2 ++
 .../gcc/gcc-4.5.1/301-missing-execinfo_h.patch     |    2 ++
 .../gcc/gcc-4.5.1/302-c99-snprintf.patch           |    2 ++
 .../gcc/gcc-4.5.1/303-c99-complex-ugly-hack.patch  |    2 ++
 .../gcc/gcc-4.5.1/304-index_macro.patch            |    2 ++
 .../gcc-4.5.1/305-libmudflap-susv3-legacy.patch    |    2 ++
 .../gcc/gcc-4.5.1/306-libstdc++-namespace.patch    |    2 ++
 .../gcc/gcc-4.5.1/307-locale_facets.patch          |    2 ++
 .../gcc/gcc-4.5.1/602-sdk-libstdc++-includes.patch |    2 ++
 .../recipes-devtools/gcc/gcc-4.5.1/64bithack.patch |    2 ++
 .../gcc/gcc-4.5.1/740-sh-pr24836.patch             |    2 ++
 .../gcc/gcc-4.5.1/800-arm-bigendian.patch          |    2 ++
 .../gcc/gcc-4.5.1/904-flatten-switch-stmt-00.patch |    2 ++
 .../gcc/gcc-4.5.1/arm-bswapsi2.patch               |    2 ++
 .../gcc/gcc-4.5.1/arm-nolibfloat.patch             |    2 ++
 .../gcc/gcc-4.5.1/arm-softfloat.patch              |    2 ++
 21 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/100-uclibc-conf.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/100-uclibc-conf.patch
index 0b79960..87716ff 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/100-uclibc-conf.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/100-uclibc-conf.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Pending"
+
 Index: gcc-4.3.1/contrib/regression/objs-gcc.sh
 ===================================================================
 --- gcc-4.3.1.orig/contrib/regression/objs-gcc.sh	2007-12-24 15:18:57.000000000 -0800
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/103-uclibc-conf-noupstream.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/103-uclibc-conf-noupstream.patch
index f9d8ad9..530d815 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/103-uclibc-conf-noupstream.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/103-uclibc-conf-noupstream.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Pending"
+
 Corrects sub machine arch corectly
 
 Index: gcc-4.5.0/gcc/config.gcc
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/200-uclibc-locale.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/200-uclibc-locale.patch
index 32de11f..042cda5 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/200-uclibc-locale.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/200-uclibc-locale.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Pending"
+
 Index: gcc-4.5.0/libstdc++-v3/acinclude.m4
 ===================================================================
 --- gcc-4.5.0.orig/libstdc++-v3/acinclude.m4	2010-04-05 18:27:44.000000000 -0700
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/203-uclibc-locale-no__x.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/203-uclibc-locale-no__x.patch
index f39e652..eaa4a2b 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/203-uclibc-locale-no__x.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/203-uclibc-locale-no__x.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Pending"
+
 Index: gcc-4.3.1/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
 ===================================================================
 --- gcc-4.3.1.orig/libstdc++-v3/config/locale/uclibc/c++locale_internal.h	2008-08-16 01:29:20.000000000 -0700
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/204-uclibc-locale-wchar_fix.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/204-uclibc-locale-wchar_fix.patch
index 160ab35..e44414d 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/204-uclibc-locale-wchar_fix.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/204-uclibc-locale-wchar_fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Pending"
+
 --- gcc/libstdc++-v3/config/locale/uclibc/monetary_members.cc.uclibc200_wchar~	2006-03-10 15:32:37 +0100
 +++ gcc/libstdc++-v3/config/locale/uclibc/monetary_members.cc	2006-03-10 15:37:27 +0100
 @@ -401,7 +401,7 @@
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/205-uclibc-locale-update.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/205-uclibc-locale-update.patch
index 48eaa1d..3c8fecf 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/205-uclibc-locale-update.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/205-uclibc-locale-update.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Pending"
+
 Index: gcc-4.3.2/libstdc++-v3/config/locale/uclibc/c_locale.cc
 ===================================================================
 --- gcc-4.3.2.orig/libstdc++-v3/config/locale/uclibc/c_locale.cc	2008-09-17 22:35:28.000000000 -0700
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/301-missing-execinfo_h.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/301-missing-execinfo_h.patch
index aaa5cee..133f9a6 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/301-missing-execinfo_h.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/301-missing-execinfo_h.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Pending"
+
 Index: gcc-4.5.0/boehm-gc/include/gc.h
 ===================================================================
 --- gcc-4.5.0.orig/boehm-gc/include/gc.h	2007-04-23 14:10:09.000000000 -0700
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/302-c99-snprintf.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/302-c99-snprintf.patch
index 12be2da..a5b68e2 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/302-c99-snprintf.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/302-c99-snprintf.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Pending"
+
 Index: gcc-4.5.0/libstdc++-v3/include/c_std/cstdio
 ===================================================================
 --- gcc-4.5.0.orig/libstdc++-v3/include/c_std/cstdio	2010-02-04 10:20:34.000000000 -0800
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/303-c99-complex-ugly-hack.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/303-c99-complex-ugly-hack.patch
index 56aa78c..19d6203 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/303-c99-complex-ugly-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/303-c99-complex-ugly-hack.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Inappropriate [embedded specific]"
+
 Index: gcc-4.5.0/libstdc++-v3/configure
 ===================================================================
 --- gcc-4.5.0.orig/libstdc++-v3/configure	2010-06-25 10:48:37.488384191 -0700
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/304-index_macro.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/304-index_macro.patch
index bbb6563..1e0bc29 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/304-index_macro.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/304-index_macro.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Pending"
+
 Index: gcc-4.5.0/libstdc++-v3/include/ext/rope
 ===================================================================
 --- gcc-4.5.0.orig/libstdc++-v3/include/ext/rope	2009-04-09 08:00:19.000000000 -0700
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/305-libmudflap-susv3-legacy.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/305-libmudflap-susv3-legacy.patch
index f890acb..3b06731 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/305-libmudflap-susv3-legacy.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/305-libmudflap-susv3-legacy.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Inappropriate [embedded specific]"
+
 Index: gcc-4.5.0/libmudflap/mf-hooks2.c
 ===================================================================
 --- gcc-4.5.0.orig/libmudflap/mf-hooks2.c	2009-04-09 08:00:19.000000000 -0700
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/306-libstdc++-namespace.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/306-libstdc++-namespace.patch
index 75c7401..5fa2323 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/306-libstdc++-namespace.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/306-libstdc++-namespace.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Pending"
+
 Index: gcc-4.5.0/libstdc++-v3/config/locale/uclibc/messages_members.h
 ===================================================================
 --- gcc-4.5.0.orig/libstdc++-v3/config/locale/uclibc/messages_members.h	2010-06-25 10:49:07.024632961 -0700
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/307-locale_facets.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/307-locale_facets.patch
index 774fcfa..21b14ef 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/307-locale_facets.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/307-locale_facets.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Pending"
+
 This patch fixes a bug into ostream::operator<<(double) due to the wrong size
 passed into the __convert_from_v method. The wrong size is then passed to
 std::snprintf function, that, on uClibc, doens't handle sized 0 buffer.
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/602-sdk-libstdc++-includes.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/602-sdk-libstdc++-includes.patch
index 23fce75..31d3b18 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/602-sdk-libstdc++-includes.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/602-sdk-libstdc++-includes.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Inappropriate [embedded specific]"
+
 --- gcc-4.1.0/libstdc++-v3/fragment.am	2005-03-21 11:40:14.000000000 -0600
 +++ gcc-4.1.0-patched/libstdc++-v3/fragment.am	2005-04-25 20:14:39.856251785 -0500
 @@ -21,5 +21,5 @@
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/64bithack.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/64bithack.patch
index 067676a..0ee6b78 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/64bithack.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/64bithack.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Inappropriate [embedded specific]"
+
 By default gcc places 64 bit libs in a lib64 directory. This makes it use 
 "lib" instead.
 
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/740-sh-pr24836.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/740-sh-pr24836.patch
index d848892..6506cb7 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/740-sh-pr24836.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/740-sh-pr24836.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Pending"
+
 http://sourceforge.net/mailarchive/forum.php?thread_id=8959304&forum_id=5348
 http://gcc.gnu.org/bugzilla/show_bug.cgi?id=24836
 
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/800-arm-bigendian.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/800-arm-bigendian.patch
index 77d02c3..e4b1f55 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/800-arm-bigendian.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/800-arm-bigendian.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Pending"
+
 By Lennert Buytenhek <buytenh@wantstofly.org>
 Adds support for arm*b-linux* big-endian ARM targets
 
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/904-flatten-switch-stmt-00.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/904-flatten-switch-stmt-00.patch
index c4641dc..a766aee 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/904-flatten-switch-stmt-00.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/904-flatten-switch-stmt-00.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Pending"
+
 Hi,
 
 The attached patch makes sure that we create smaller object code for
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/arm-bswapsi2.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/arm-bswapsi2.patch
index 7ac61a6..a72aaaf 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/arm-bswapsi2.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/arm-bswapsi2.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Pending"
+
 Index: gcc-4.5/gcc/config/arm/arm.md
 ===================================================================
 --- gcc-4.5.orig/gcc/config/arm/arm.md	2010-06-17 09:13:07.000000000 -0700
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/arm-nolibfloat.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/arm-nolibfloat.patch
index 99f2b20..88e4e3b 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/arm-nolibfloat.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/arm-nolibfloat.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Pending"
+
 # Dimitry Andric <dimitry@andric.com>, 2004-05-01
 #
 # * Removed the extra -lfloat option from LIBGCC_SPEC, since it isn't needed
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/arm-softfloat.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/arm-softfloat.patch
index 181d4fb..dc8b7a5 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/arm-softfloat.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/arm-softfloat.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Pending"
+
 Index: gcc-4.5.0/gcc/config/arm/t-linux
 ===================================================================
 --- gcc-4.5.0.orig/gcc/config/arm/t-linux	2009-04-21 12:03:23.000000000 -0700
-- 
1.7.1.1



