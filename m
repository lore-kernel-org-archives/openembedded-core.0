Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web12.33494.1612781982420385355
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 02:59:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sNQzoB9b;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id jj19so23907789ejc.4
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 02:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CVPdJ0x9YsVtaiM2wfmEI2CrTQTmN/ZhrEl2MWRKUcg=;
        b=sNQzoB9byvj1w+9XWUEoS+Szdu6DcahSv/xjUAK3ENadICHDJ5ibCZhLoC7Dnwvqoq
         tREFchP6u3APqog/mfEW/lldhc4Pve21Fq5NEkBo2tKkuhg0cqtSRMBKxXujK8kUdxuB
         1eUakFa9SuwPY4AEOvw23/8Msd25FlOx7FxFYt8SnO4/Q2O2HQU4Idm+5RNCgbXX7pPd
         YWoSo2XRN7S4I+FhLhTwOCdWiBVCk+8PP7L4xRS0MX4FNoqfCDDc6TOx4pB9CfhPCMQq
         4jtkBYzFEFt/czpvW5mr9EHfu3JXBB+fzptgsV/43SIEsYz7a29yCojSl/aG9FxkUUVz
         lvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CVPdJ0x9YsVtaiM2wfmEI2CrTQTmN/ZhrEl2MWRKUcg=;
        b=p7ca7UY3kAy5m1HnqY+mhkjyFhIB1mlZ4hLgXi72MN/s2clkPZIbC9e4Nu7Qrfa1WR
         BPrgrgDdWFJTGeRMXG9k9ClgEm17HhCx6uoNvrccBfOIDB4grTSSCMDifGydVd5JGZQr
         X5SlR/uRMshzYn6Iqfxjz8+gfryc1iv1a35s/lG4AB8jxSkpflrvFXD312R+YQQNRb2Y
         MOZEzv0RfDNiRxJbTqZCNLjaswenuM3fa6FY3XNdxjUljStY+xL3ha2jNY2ncQ9jK874
         59byYxDiEpWr/yjzWQ1u4n4HMpfUyO/xsjYQE7q+SYG/XxSWk1UACJOq9WDSOaVgq0I/
         2Xmw==
X-Gm-Message-State: AOAM530zE4J/xZ0ErUBCCrn3MGlaNnLOR2Vn+NOvULSUjBWUATqglI6I
	v2PlP9jbp6gqFTthsWubkXushuhE8CvOVA==
X-Google-Smtp-Source: ABdhPJwHVqb9/pnOdaddFnUzvVff2GtnumS8w1HwTi4adp4RPqdkb6x+dwDLu3NmhStzCy1NCm090w==
X-Received: by 2002:a17:906:4b42:: with SMTP id j2mr5470668ejv.544.1612781980996;
        Mon, 08 Feb 2021 02:59:40 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id t19sm8382226ejc.62.2021.02.08.02.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 02:59:40 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/12] ruby: update 2.7.2 -> 3.0.0
Date: Mon,  8 Feb 2021 11:59:24 +0100
Message-Id: <20210208105932.347925-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208105932.347925-1-alex.kanavin@gmail.com>
References: <20210208105932.347925-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop 0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch
as files removed upstream.

License-Update: formatting

Drop autoconf270.patch, as no longer needed with 3.0.0
(I verified against master-next which has the new autoconf).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/ruby/ruby.inc           | 11 +++---
 ...of-libexec-y2racc-and-libexec-racc2y.patch | 38 -------------------
 ...Obey-LDFLAGS-for-the-link-of-libruby.patch | 14 +++----
 .../ruby/ruby/autoconf270.patch               | 34 -----------------
 .../ruby/ruby/remove_has_include_macros.patch | 17 +++++++--
 .../ruby/{ruby_2.7.2.bb => ruby_3.0.0.bb}     |  5 +--
 6 files changed, 25 insertions(+), 94 deletions(-)
 delete mode 100644 meta/recipes-devtools/ruby/ruby/0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/autoconf270.patch
 rename meta/recipes-devtools/ruby/{ruby_2.7.2.bb => ruby_3.0.0.bb} (91%)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index 7b6d4edc61..1cede8d47c 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -7,12 +7,11 @@ It is simple, straight-forward, and extensible. \
 HOMEPAGE = "http://www.ruby-lang.org/"
 SECTION = "devel/ruby"
 LICENSE = "Ruby | BSD-2-Clause | BSD-3-Clause | GPLv2 | ISC | MIT"
-LIC_FILES_CHKSUM = "\
-    file://COPYING;md5=5b8c87559868796979806100db3f3805 \
-    file://BSDL;md5=19aaf65c88a40b508d17ae4be539c4b5\
-    file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263\
-    file://LEGAL;md5=2b6d62dc0d608f34d510ca3f428110ec \
-"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5b8c87559868796979806100db3f3805 \
+                    file://BSDL;md5=8b50bc6de8f586dc66790ba11d064d75 \
+                    file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://LEGAL;md5=cfe5b0bc9f051b58c7e78db882ca5f9b \
+                    "
 
 DEPENDS = "ruby-native zlib openssl libyaml gdbm readline libffi"
 DEPENDS_class-native = "openssl-native libyaml-native readline-native zlib-native"
diff --git a/meta/recipes-devtools/ruby/ruby/0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch b/meta/recipes-devtools/ruby/ruby/0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch
deleted file mode 100644
index f316bed7bd..0000000000
--- a/meta/recipes-devtools/ruby/ruby/0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From eed7bc855fd8d232d4d203cc9027dd07cee8eca2 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@cn.fujitsu.com>
-Date: Sat, 8 Feb 2020 15:16:14 +0800
-Subject: [PATCH] Modify shebang of libexec/y2racc and libexec/racc2y.
-
-change /usr/local/bin/ruby to /usr/bin/env ruby.
-
-Upstream-Status: Pending
-
-Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
----
- libexec/racc2y | 2 +-
- libexec/y2racc | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libexec/racc2y b/libexec/racc2y
-index f88d73ed2c..74e49cfa21 100755
---- a/libexec/racc2y
-+++ b/libexec/racc2y
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/ruby
-+#!/usr/bin/env ruby
- #
- # $Id$
- #
-diff --git a/libexec/y2racc b/libexec/y2racc
-index 7933f94153..36daf864e1 100755
---- a/libexec/y2racc
-+++ b/libexec/y2racc
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/ruby
-+#!/usr/bin/env ruby
- #
- # $Id$
- #
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index b31dee1128..4b954e439b 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -1,27 +1,25 @@
-From 6d608326970b1613633d7715ebb7d628dfcd16ee Mon Sep 17 00:00:00 2001
+From 07fd1ada322eda6c05ac45c08fc814976f31b596 Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
-Subject: [PATCH 2/3] Obey LDFLAGS for the link of libruby
+Subject: [PATCH] Obey LDFLAGS for the link of libruby
 
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
 Upstream-Status: Pending
+
 ---
  template/Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/template/Makefile.in b/template/Makefile.in
-index fa1e19ef37..bbd07fa34b 100644
+index f5a3149..5cc75ae 100644
 --- a/template/Makefile.in
 +++ b/template/Makefile.in
-@@ -109,7 +109,7 @@ MISSING = @LIBOBJS@ @ALLOCA@
- ENABLE_SHARED = @ENABLE_SHARED@
+@@ -114,7 +114,7 @@ ENABLE_SHARED = @ENABLE_SHARED@
  LDSHARED = @LIBRUBY_LDSHARED@
  DLDSHARED = @DLDSHARED@
+ XDLDFLAGS = @DLDFLAGS@
 -DLDFLAGS = @LIBRUBY_DLDFLAGS@ $(XLDFLAGS) $(ARCH_FLAG)
 +DLDFLAGS = @LIBRUBY_DLDFLAGS@ @LDFLAGS@ $(XLDFLAGS) $(ARCH_FLAG)
  SOLIBS = @SOLIBS@
  ENABLE_DEBUG_ENV = @ENABLE_DEBUG_ENV@
  MAINLIBS = @MAINLIBS@
--- 
-2.23.0.rc1
-
diff --git a/meta/recipes-devtools/ruby/ruby/autoconf270.patch b/meta/recipes-devtools/ruby/ruby/autoconf270.patch
deleted file mode 100644
index 8d205bde43..0000000000
--- a/meta/recipes-devtools/ruby/ruby/autoconf270.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-This macro breaks under autoconf 2.70. Since we don't worry abot darwin or
-openbsd builds, simply remove it.
-
-Upstream-Status: Pending
-RP - 2021/1/28
-
-Index: ruby-2.7.2/configure.ac
-===================================================================
---- ruby-2.7.2.orig/configure.ac
-+++ ruby-2.7.2/configure.ac
-@@ -170,23 +170,6 @@ dnl     orig_cxxflags="$cxxflags"
- dnl     cxxflags="$cxxflags "'${optflags} ${debugflags} ${warnflags}'
- dnl ])
- 
--AS_CASE(["$host_os:$build_os"],
--[darwin*:darwin*], [
--    AC_CHECK_TOOLS(CC, [clang gcc cc])
--    # Following Apple deployed clang are broken
--    # clang version 1.0 (http://llvm.org/svn/llvm-project/cfe/tags/Apple/clang-23 exported)
--    # Apple clang version 2.0 (tags/Apple/clang-137) (based on LLVM 2.9svn)
--    # Apple clang version 2.1 (tags/Apple/clang-163.7.1) (based on LLVM 3.0svn)
--    AS_IF([! $CC -E -xc - <<SRC >/dev/null], [
--	@%:@if defined __APPLE_CC__ && defined __clang_major__ && __clang_major__ < 3
--	@%:@error premature clang
--	@%:@endif
--SRC
--	AC_MSG_ERROR([clang version 3.0 or later is required])
--    ])],
--[openbsd*:openbsd*], [
--    AC_CHECK_TOOLS(CC, [cc])
--])
- AS_IF([test x"${build}" != x"${host}"], [
-   AC_CHECK_TOOL(CC, gcc)
- ])
diff --git a/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch b/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
index a1e6330445..6e90a8ee77 100644
--- a/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
+++ b/meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
@@ -1,4 +1,7 @@
-Filter out __has_include* compiler defines
+From 303fe0d20184203f1ac86d2a77b1447d47c8c29d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 26 Jan 2020 11:27:40 -0800
+Subject: [PATCH] Filter out __has_include* compiler defines
 
 They are internal to compiler and this header is later on includes in C
 files, but newer gcc >= 10 complains about it.
@@ -13,12 +16,18 @@ error in initial header file:
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
+---
+ common.mk | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/common.mk b/common.mk
+index 7633050..422aa9c 100644
 --- a/common.mk
 +++ b/common.mk
-@@ -221,6 +221,8 @@ $(TIMESTAMPDIR)/$(MJIT_HEADER:.h=)$(MJIT
- 		$(TIMESTAMPDIR)/$(arch)/.time
+@@ -233,6 +233,8 @@ $(TIMESTAMPDIR)/$(MJIT_HEADER:.h=)$(MJIT_HEADER_SUFFIX).time: probes.h vm.$(OBJE
  	$(ECHO) building $(@F:.time=.h)
- 	$(Q) $(CPP) -DMJIT_HEADER $(MJIT_HEADER_FLAGS) $(CFLAGS) $(XCFLAGS) $(CPPFLAGS) $(srcdir)/vm.c $(CPPOUTFLAG)$(@F:.time=.h).new
+ 	$(MINIRUBY) $(tooldir)/mjit_tabs.rb "$(MJIT_TABS)" \
+ 		$(CPP) -DMJIT_HEADER $(MJIT_HEADER_FLAGS) $(CFLAGS) $(XCFLAGS) $(CPPFLAGS) $(srcdir)/vm.c $(CPPOUTFLAG)$(@F:.time=.h).new
 +	$(Q)sed -i -e "/#define __has_include __has_include/d" $(@F:.time=.h).new
 +	$(Q)sed -i -e "/#define __has_include_next __has_include_next/d" $(@F:.time=.h).new
  	$(Q) $(IFCHANGE) "--timestamp=$@" $(@F:.time=.h) $(@F:.time=.h).new
diff --git a/meta/recipes-devtools/ruby/ruby_2.7.2.bb b/meta/recipes-devtools/ruby/ruby_3.0.0.bb
similarity index 91%
rename from meta/recipes-devtools/ruby/ruby_2.7.2.bb
rename to meta/recipes-devtools/ruby/ruby_3.0.0.bb
index 8c338ebecf..5e143ee87f 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.0.0.bb
@@ -5,13 +5,10 @@ DEPENDS_append_libc-musl = " libucontext"
 SRC_URI += " \
            file://remove_has_include_macros.patch \
            file://run-ptest \
-           file://0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch \
            file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
-           file://autoconf270.patch \
            "
 
-SRC_URI[md5sum] = "2d4a28dcfa38352a627a597f6057c465"
-SRC_URI[sha256sum] = "6e5706d0d4ee4e1e2f883db9d768586b4d06567debea353c796ec45e8321c3d4"
+SRC_URI[sha256sum] = "a13ed141a1c18eb967aac1e33f4d6ad5f21be1ac543c344e0d6feeee54af8e28"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.29.2

