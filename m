Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QJuKe-0003KT-AY
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 23:19:05 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 May 2011 14:16:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,347,1301900400"; d="scan'208";a="640907896"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by orsmga002.jf.intel.com with ESMTP; 10 May 2011 14:16:15 -0700
Message-Id: <2a3e88c074c959213ab3555d7a80f83accecbef9.1305062028.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1305062026.git.nitin.a.kamble@intel.com>
References: <cover.1305062026.git.nitin.a.kamble@intel.com>
Old-Date: Tue, 10 May 2011 13:18:08 -0700
Date: Tue, 10 May 2011 14:16:15 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 16/16] gcc-4.5.1: fix upstream-status format
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
X-List-Received-Date: Tue, 10 May 2011 21:19:05 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../gcc/gcc-4.5.1/100-uclibc-conf.patch            |    2 +-
 .../gcc/gcc-4.5.1/103-uclibc-conf-noupstream.patch |    2 +-
 .../gcc/gcc-4.5.1/200-uclibc-locale.patch          |    2 +-
 .../gcc/gcc-4.5.1/203-uclibc-locale-no__x.patch    |    2 +-
 .../gcc-4.5.1/204-uclibc-locale-wchar_fix.patch    |    2 +-
 .../gcc/gcc-4.5.1/205-uclibc-locale-update.patch   |    2 +-
 .../gcc/gcc-4.5.1/301-missing-execinfo_h.patch     |    2 +-
 .../gcc/gcc-4.5.1/302-c99-snprintf.patch           |    2 +-
 .../gcc/gcc-4.5.1/303-c99-complex-ugly-hack.patch  |    2 +-
 .../gcc/gcc-4.5.1/304-index_macro.patch            |    2 +-
 .../gcc-4.5.1/305-libmudflap-susv3-legacy.patch    |    2 +-
 .../gcc/gcc-4.5.1/306-libstdc++-namespace.patch    |    2 +-
 .../gcc/gcc-4.5.1/307-locale_facets.patch          |    2 +-
 .../gcc/gcc-4.5.1/602-sdk-libstdc++-includes.patch |    2 +-
 .../recipes-devtools/gcc/gcc-4.5.1/64bithack.patch |    2 +-
 .../gcc/gcc-4.5.1/740-sh-pr24836.patch             |    2 +-
 .../gcc/gcc-4.5.1/800-arm-bigendian.patch          |    2 +-
 .../gcc/gcc-4.5.1/904-flatten-switch-stmt-00.patch |    2 +-
 .../gcc/gcc-4.5.1/arm-bswapsi2.patch               |    2 +-
 .../gcc/gcc-4.5.1/arm-nolibfloat.patch             |    2 +-
 .../gcc/gcc-4.5.1/arm-softfloat.patch              |    2 +-
 21 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/100-uclibc-conf.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/100-uclibc-conf.patch
index 87716ff..38ae167 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/100-uclibc-conf.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/100-uclibc-conf.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Pending"
+Upstream-Status: Pending
 
 Index: gcc-4.3.1/contrib/regression/objs-gcc.sh
 ===================================================================
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/103-uclibc-conf-noupstream.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/103-uclibc-conf-noupstream.patch
index 530d815..abed095 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/103-uclibc-conf-noupstream.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/103-uclibc-conf-noupstream.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Pending"
+Upstream-Status: Pending
 
 Corrects sub machine arch corectly
 
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/200-uclibc-locale.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/200-uclibc-locale.patch
index 042cda5..d2ba65c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/200-uclibc-locale.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/200-uclibc-locale.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Pending"
+Upstream-Status: Pending
 
 Index: gcc-4.5.0/libstdc++-v3/acinclude.m4
 ===================================================================
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/203-uclibc-locale-no__x.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/203-uclibc-locale-no__x.patch
index eaa4a2b..c81e782 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/203-uclibc-locale-no__x.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/203-uclibc-locale-no__x.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Pending"
+Upstream-Status: Pending
 
 Index: gcc-4.3.1/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
 ===================================================================
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/204-uclibc-locale-wchar_fix.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/204-uclibc-locale-wchar_fix.patch
index e44414d..d498f89 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/204-uclibc-locale-wchar_fix.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/204-uclibc-locale-wchar_fix.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Pending"
+Upstream-Status: Pending
 
 --- gcc/libstdc++-v3/config/locale/uclibc/monetary_members.cc.uclibc200_wchar~	2006-03-10 15:32:37 +0100
 +++ gcc/libstdc++-v3/config/locale/uclibc/monetary_members.cc	2006-03-10 15:37:27 +0100
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/205-uclibc-locale-update.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/205-uclibc-locale-update.patch
index 3c8fecf..f844695 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/205-uclibc-locale-update.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/205-uclibc-locale-update.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Pending"
+Upstream-Status: Pending
 
 Index: gcc-4.3.2/libstdc++-v3/config/locale/uclibc/c_locale.cc
 ===================================================================
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/301-missing-execinfo_h.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/301-missing-execinfo_h.patch
index 133f9a6..812d3dd 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/301-missing-execinfo_h.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/301-missing-execinfo_h.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Pending"
+Upstream-Status: Pending
 
 Index: gcc-4.5.0/boehm-gc/include/gc.h
 ===================================================================
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/302-c99-snprintf.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/302-c99-snprintf.patch
index a5b68e2..ec8c43e 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/302-c99-snprintf.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/302-c99-snprintf.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Pending"
+Upstream-Status: Pending
 
 Index: gcc-4.5.0/libstdc++-v3/include/c_std/cstdio
 ===================================================================
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/303-c99-complex-ugly-hack.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/303-c99-complex-ugly-hack.patch
index 19d6203..abd032b 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/303-c99-complex-ugly-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/303-c99-complex-ugly-hack.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Inappropriate [embedded specific]"
+Upstream-Status: Inappropriate [embedded specific]
 
 Index: gcc-4.5.0/libstdc++-v3/configure
 ===================================================================
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/304-index_macro.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/304-index_macro.patch
index 1e0bc29..25f4e93 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/304-index_macro.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/304-index_macro.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Pending"
+Upstream-Status: Pending
 
 Index: gcc-4.5.0/libstdc++-v3/include/ext/rope
 ===================================================================
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/305-libmudflap-susv3-legacy.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/305-libmudflap-susv3-legacy.patch
index 3b06731..d148877 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/305-libmudflap-susv3-legacy.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/305-libmudflap-susv3-legacy.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Inappropriate [embedded specific]"
+Upstream-Status: Inappropriate [embedded specific]
 
 Index: gcc-4.5.0/libmudflap/mf-hooks2.c
 ===================================================================
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/306-libstdc++-namespace.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/306-libstdc++-namespace.patch
index 5fa2323..3cc61c3 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/306-libstdc++-namespace.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/306-libstdc++-namespace.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Pending"
+Upstream-Status: Pending
 
 Index: gcc-4.5.0/libstdc++-v3/config/locale/uclibc/messages_members.h
 ===================================================================
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/307-locale_facets.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/307-locale_facets.patch
index 21b14ef..c1636ba 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/307-locale_facets.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/307-locale_facets.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Pending"
+Upstream-Status: Pending
 
 This patch fixes a bug into ostream::operator<<(double) due to the wrong size
 passed into the __convert_from_v method. The wrong size is then passed to
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/602-sdk-libstdc++-includes.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/602-sdk-libstdc++-includes.patch
index 31d3b18..44b8502 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/602-sdk-libstdc++-includes.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/602-sdk-libstdc++-includes.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Inappropriate [embedded specific]"
+Upstream-Status: Inappropriate [embedded specific]
 
 --- gcc-4.1.0/libstdc++-v3/fragment.am	2005-03-21 11:40:14.000000000 -0600
 +++ gcc-4.1.0-patched/libstdc++-v3/fragment.am	2005-04-25 20:14:39.856251785 -0500
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/64bithack.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/64bithack.patch
index 0ee6b78..890cc2f 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/64bithack.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/64bithack.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Inappropriate [embedded specific]"
+Upstream-Status: Inappropriate [embedded specific]
 
 By default gcc places 64 bit libs in a lib64 directory. This makes it use 
 "lib" instead.
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/740-sh-pr24836.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/740-sh-pr24836.patch
index 6506cb7..ace3631 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/740-sh-pr24836.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/740-sh-pr24836.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Pending"
+Upstream-Status: Pending
 
 http://sourceforge.net/mailarchive/forum.php?thread_id=8959304&forum_id=5348
 http://gcc.gnu.org/bugzilla/show_bug.cgi?id=24836
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/800-arm-bigendian.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/800-arm-bigendian.patch
index e4b1f55..f2474de 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/800-arm-bigendian.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/800-arm-bigendian.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Pending"
+Upstream-Status: Pending
 
 By Lennert Buytenhek <buytenh@wantstofly.org>
 Adds support for arm*b-linux* big-endian ARM targets
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/904-flatten-switch-stmt-00.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/904-flatten-switch-stmt-00.patch
index a766aee..62ec949 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/904-flatten-switch-stmt-00.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/904-flatten-switch-stmt-00.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Pending"
+Upstream-Status: Pending
 
 Hi,
 
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/arm-bswapsi2.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/arm-bswapsi2.patch
index a72aaaf..9b9f874 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/arm-bswapsi2.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/arm-bswapsi2.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Pending"
+Upstream-Status: Pending
 
 Index: gcc-4.5/gcc/config/arm/arm.md
 ===================================================================
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/arm-nolibfloat.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/arm-nolibfloat.patch
index 88e4e3b..871f9cf 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/arm-nolibfloat.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/arm-nolibfloat.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Pending"
+Upstream-Status: Pending
 
 # Dimitry Andric <dimitry@andric.com>, 2004-05-01
 #
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/arm-softfloat.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/arm-softfloat.patch
index dc8b7a5..a0b1a3c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/arm-softfloat.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/arm-softfloat.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Pending"
+Upstream-Status: Pending
 
 Index: gcc-4.5.0/gcc/config/arm/t-linux
 ===================================================================
-- 
1.7.3.4



