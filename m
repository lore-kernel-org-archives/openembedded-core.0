Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 817BC60EE7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 08:18:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,416,1574092800"; d="scan'208";a="83036070"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Feb 2020 16:18:10 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 11F68406AB15
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 16:08:42 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Sat, 8 Feb 2020 16:18:11 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Sat, 8 Feb 2020 16:18:11 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 8 Feb 2020 08:14:18 -0800
Message-ID: <1581178458-23352-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 11F68406AB15.A9168
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] ruby: upgrade 2.6.5 -> 2.7.0
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
X-List-Received-Date: Sat, 08 Feb 2020 08:18:11 -0000
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

0003-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch
Removed since it is included in 2.7.0.

refresh the following patch:
0002-Obey-LDFLAGS-for-the-link-of-libruby.patch

add the following patch:
0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch

format of file COPYING is updated.
LEGAL notice information is updated.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-devtools/ruby/ruby.inc           |   4 +-
 ...of-libexec-y2racc-and-libexec-racc2y.patch |  36 ++++++
 ...Obey-LDFLAGS-for-the-link-of-libruby.patch |   8 +-
 ...ck-finite-isinf-isnan-as-macros-firs.patch | 103 ------------------
 .../ruby/{ruby_2.6.5.bb => ruby_2.7.0.bb}     |   6 +-
 5 files changed, 45 insertions(+), 112 deletions(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/0003-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch
 rename meta/recipes-devtools/ruby/{ruby_2.6.5.bb => ruby_2.7.0.bb} (91%)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index ce1b02f012..a38b3fe624 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -8,10 +8,10 @@ HOMEPAGE = "http://www.ruby-lang.org/"
 SECTION = "devel/ruby"
 LICENSE = "Ruby | BSD-2-Clause | BSD-3-Clause | GPLv2 | ISC | MIT"
 LIC_FILES_CHKSUM = "\
-    file://COPYING;md5=340948e1882e579731841bf49cdc22c1 \
+    file://COPYING;md5=5b8c87559868796979806100db3f3805 \
     file://BSDL;md5=19aaf65c88a40b508d17ae4be539c4b5\
     file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263\
-    file://LEGAL;md5=4ac0b84d1f7f420bca282e1adefc7f99 \
+    file://LEGAL;md5=2b6d62dc0d608f34d510ca3f428110ec \
 "
 
 DEPENDS = "ruby-native zlib openssl tcl libyaml gdbm readline libffi"
diff --git a/meta/recipes-devtools/ruby/ruby/0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch b/meta/recipes-devtools/ruby/ruby/0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch
new file mode 100644
index 0000000000..fa6f103323
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch
@@ -0,0 +1,36 @@
+From eed7bc855fd8d232d4d203cc9027dd07cee8eca2 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@cn.fujitsu.com>
+Date: Sat, 8 Feb 2020 15:16:14 +0800
+Subject: [PATCH] Modify shebang of libexec/y2racc and libexec/racc2y.
+
+change /usr/local/bin/ruby to /usr/bin/env ruby.
+
+Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
+---
+ libexec/racc2y | 2 +-
+ libexec/y2racc | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libexec/racc2y b/libexec/racc2y
+index f88d73ed2c..74e49cfa21 100755
+--- a/libexec/racc2y
++++ b/libexec/racc2y
+@@ -1,4 +1,4 @@
+-#!/usr/local/bin/ruby
++#!/usr/bin/env ruby
+ #
+ # $Id$
+ #
+diff --git a/libexec/y2racc b/libexec/y2racc
+index 7933f94153..36daf864e1 100755
+--- a/libexec/y2racc
++++ b/libexec/y2racc
+@@ -1,4 +1,4 @@
+-#!/usr/local/bin/ruby
++#!/usr/bin/env ruby
+ #
+ # $Id$
+ #
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index 5979d8bd73..b31dee1128 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -6,13 +6,13 @@ Subject: [PATCH 2/3] Obey LDFLAGS for the link of libruby
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
 Upstream-Status: Pending
 ---
- Makefile.in | 2 +-
+ template/Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/Makefile.in b/Makefile.in
+diff --git a/template/Makefile.in b/template/Makefile.in
 index fa1e19ef37..bbd07fa34b 100644
---- a/Makefile.in
-+++ b/Makefile.in
+--- a/template/Makefile.in
++++ b/template/Makefile.in
 @@ -109,7 +109,7 @@ MISSING = @LIBOBJS@ @ALLOCA@
  ENABLE_SHARED = @ENABLE_SHARED@
  LDSHARED = @LIBRUBY_LDSHARED@
diff --git a/meta/recipes-devtools/ruby/ruby/0003-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch b/meta/recipes-devtools/ruby/ruby/0003-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch
deleted file mode 100644
index 1a8cff3e8c..0000000000
--- a/meta/recipes-devtools/ruby/ruby/0003-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From bd71b698bf733e6e93282cd2b1b93f51e1a33c7c Mon Sep 17 00:00:00 2001
-From: nobu <nobu@b2dd03c8-39d4-4d8f-98ff-823fe69b080e>
-Date: Fri, 8 Feb 2019 07:22:55 +0000
-Subject: [PATCH 3/3] configure.ac: check finite,isinf,isnan as macros first
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-[ruby-core:91487] [Bug #15595]
-
-git-svn-id: svn+ssh://ci.ruby-lang.org/ruby/trunk@67036 b2dd03c8-39d4-4d8f-98ff-823fe69b080e
-
----
-Upstream-Status: Backport [https://github.com/ruby/ruby/commit/74f94b3e6ebf15b76f3b357e754095412b006e94]
-Signed-off-by: André Draszik <andre.draszik@jci.com>
----
- aclocal.m4                    |  1 +
- configure.ac                  | 13 ++++---------
- tool/m4/ruby_replace_funcs.m4 | 13 +++++++++++++
- 3 files changed, 18 insertions(+), 9 deletions(-)
- create mode 100644 tool/m4/ruby_replace_funcs.m4
-
-diff --git a/aclocal.m4 b/aclocal.m4
-index b0fe3eb959..ed7d14ef63 100644
---- a/aclocal.m4
-+++ b/aclocal.m4
-@@ -35,6 +35,7 @@ m4_include([tool/m4/ruby_func_attribute.m4])
- m4_include([tool/m4/ruby_mingw32.m4])
- m4_include([tool/m4/ruby_prepend_option.m4])
- m4_include([tool/m4/ruby_prog_gnu_ld.m4])
-+m4_include([tool/m4/ruby_replace_funcs.m4])
- m4_include([tool/m4/ruby_replace_type.m4])
- m4_include([tool/m4/ruby_rm_recursive.m4])
- m4_include([tool/m4/ruby_setjmp_type.m4])
-diff --git a/configure.ac b/configure.ac
-index 2c4d2888d2..2691da6a3c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -946,9 +946,6 @@ main()
- 		ac_cv_func_fsync=yes
- 		ac_cv_func_seekdir=yes
- 		ac_cv_func_telldir=yes
--		ac_cv_func_isinf=yes
--		ac_cv_func_isnan=yes
--		ac_cv_func_finite=yes
- 		ac_cv_func_lchown=yes
- 		ac_cv_func_link=yes
- 		ac_cv_func_readlink=yes
-@@ -999,9 +996,6 @@ main()
- [netbsd*], [	LIBS="-lm $LIBS"
- 		],
- [dragonfly*], [	LIBS="-lm $LIBS"
--		# isinf() and isnan() are macros on DragonFly.
--		ac_cv_func_isinf=yes
--		ac_cv_func_isnan=yes
- 		],
- [aix*],[	LIBS="-lm $LIBS"
- 		ac_cv_func_round=no
-@@ -1724,11 +1718,8 @@ AC_REPLACE_FUNCS(dup2)
- AC_REPLACE_FUNCS(erf)
- AC_REPLACE_FUNCS(explicit_bzero)
- AC_REPLACE_FUNCS(ffs)
--AC_REPLACE_FUNCS(finite)
- AC_REPLACE_FUNCS(flock)
- AC_REPLACE_FUNCS(hypot)
--AC_REPLACE_FUNCS(isinf)
--AC_REPLACE_FUNCS(isnan)
- AC_REPLACE_FUNCS(lgamma_r)
- AC_REPLACE_FUNCS(memmove)
- AC_REPLACE_FUNCS(nan)
-@@ -1741,6 +1732,10 @@ AC_REPLACE_FUNCS(strlcpy)
- AC_REPLACE_FUNCS(strstr)
- AC_REPLACE_FUNCS(tgamma)
- 
-+RUBY_REPLACE_FUNC([finite], [@%:@include <math.h>])
-+RUBY_REPLACE_FUNC([isinf], [@%:@include <math.h>])
-+RUBY_REPLACE_FUNC([isnan], [@%:@include <math.h>])
-+
- # for missing/setproctitle.c
- AS_CASE(["$target_os"],
- [aix* | k*bsd*-gnu | kopensolaris*-gnu | linux* | darwin*], [AC_DEFINE(SPT_TYPE,SPT_REUSEARGV)],
-diff --git a/tool/m4/ruby_replace_funcs.m4 b/tool/m4/ruby_replace_funcs.m4
-new file mode 100644
-index 0000000000..d0612e29a0
---- /dev/null
-+++ b/tool/m4/ruby_replace_funcs.m4
-@@ -0,0 +1,13 @@
-+# -*- Autoconf -*-
-+dnl RUBY_REPLACE_FUNC [func] [included]
-+AC_DEFUN([RUBY_REPLACE_FUNC], [dnl
-+    AC_CHECK_DECL([$1],dnl
-+        [AC_DEFINE(AS_TR_CPP(HAVE_[$1]))],dnl
-+        [AC_REPLACE_FUNCS($1)],dnl
-+        [$2])dnl
-+])
-+
-+dnl RUBY_REPLACE_FUNCS [funcs] [included]
-+AC_DEFUN([RUBY_REPLACE_FUNCS] [dnl
-+    m4_map_args_w([$1], [RUBY_REPLACE_FUNC(], [), [$2]])dnl
-+])
--- 
-2.23.0.rc1
-
diff --git a/meta/recipes-devtools/ruby/ruby_2.6.5.bb b/meta/recipes-devtools/ruby/ruby_2.7.0.bb
similarity index 91%
rename from meta/recipes-devtools/ruby/ruby_2.6.5.bb
rename to meta/recipes-devtools/ruby/ruby_2.7.0.bb
index 0cdf6ee09f..c796318717 100644
--- a/meta/recipes-devtools/ruby/ruby_2.6.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.0.bb
@@ -1,13 +1,13 @@
 require ruby.inc
 
 SRC_URI += " \
-           file://0003-configure.ac-check-finite-isinf-isnan-as-macros-firs.patch \
            file://remove_has_include_macros.patch \
            file://run-ptest \
+           file://0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch \
            "
 
-SRC_URI[md5sum] = "8754bfb36d52c2bf1fb3d3ddc7101606"
-SRC_URI[sha256sum] = "66976b716ecc1fd34f9b7c3c2b07bbd37631815377a2e3e85a5b194cfdcbed7d"
+SRC_URI[md5sum] = "bf4a54e8231176e109a42c546b4725a9"
+SRC_URI[sha256sum] = "8c99aa93b5e2f1bc8437d1bbbefd27b13e7694025331f77245d0c068ef1f8cbe"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.17.1




