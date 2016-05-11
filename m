Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6B1F173172
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:35:59 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 145so4261313pfz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=5b2MRIA0Di31PalmHolysd7m0v6uh2rgE9upYO4B/uI=;
	b=M07rdNBQk3AVn5DcRWXXBdtxA653fgn0eHIHpqjQIfEa96vYMq7WB0zTlZ0pbf5YE0
	UDhjYg7Q2GxbiwU7o8iRb1GNT0MQzEvTJYDNcPZ0ayKEFoCzHd00TG941DEPvXmqdcIm
	G25JJsTyoI4pWp8YHzOv/frM35+VvXqXEoHgGZus1EzrxuZktTrLRahkUUYhbmIxrhaZ
	jdlNy7TsrW/nDWk2NsDjdGRuHsXsRbe6d74EiEy/3s8Sb7jpgr6KOlqUjV9jVGmZY4jT
	9SEx8Gy7kqi1nZeaFGbL1FeHXMzvmuGhwLjGSIQNYJLjNJyNus6FMsK7jXsEaWsPe9GW
	x+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=5b2MRIA0Di31PalmHolysd7m0v6uh2rgE9upYO4B/uI=;
	b=XiEm83hOJXV6OxJFWUYWdXTUngk5BVYhdfcgQtsY+kXWJMRvG9RXSQdQdBxSS5BIfH
	G0ltjDZnH3i3skUXPHWLmjQT/XGKJYkX1hB4rxZh0hPabyYrgakE2/EvzDixwG8WGKOu
	7mwKv4OvgAZaMh8wUfXsfCvRjrkjS6Xx41rXQkXQnYG8F41SsrLryLtzQB5ABfsBd7lb
	Y+PR7dK+Hwx7OXvD8Uhrh1/pGtfAkWZZrZWCydxKH6OKAegUSgQWObuOcGmy8g0W9sxC
	YInExjT63VbeITuB4sj+TWtGFzFb+Duh3ZDBlH7upcv4cB8oTx5dMRVp8ssJLc66SD/q
	TJ3A==
X-Gm-Message-State: AOPr4FWCZQJifc6+88UWn53vUxa5IupEUM65MzpgMDoZ5o8/i8Y4F34k4UPYHn2tQ96gTQ==
X-Received: by 10.98.0.203 with SMTP id 194mr6779096pfa.126.1462988160462;
	Wed, 11 May 2016 10:36:00 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.35.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:35:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:08 -0700
Message-Id: <6bb9603629b86079b9ee3e05127287d9823546c8.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 05/42] rpm: Fix build with gcc6
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
X-List-Received-Date: Wed, 11 May 2016 17:35:59 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/rpm/rpm/gcc6-stdlib.patch | 54 +++++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.16.bb         |  3 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/gcc6-stdlib.patch

diff --git a/meta/recipes-devtools/rpm/rpm/gcc6-stdlib.patch b/meta/recipes-devtools/rpm/rpm/gcc6-stdlib.patch
new file mode 100644
index 0000000..0a372c6
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/gcc6-stdlib.patch
@@ -0,0 +1,54 @@
+gcc6 has fixed a long standing c++ include issue where <cheader>
+was different from <header.h> inclusion via
+
+https://gcc.gnu.org/ml/libstdc++/2016-01/msg00025.html
+
+and its also descibed in https://gcc.gnu.org/gcc-6/porting_to.html
+rpmio component uses some .cpp and .cc fies which need to use
+C stdlib.h from C library and not the C++ libstdc++ header
+therefore we pass _GLIBCXX_INCLUDE_NEXT_C_HEADERS so that it
+keeps the old behavior
+
+/a/build/tmp/sysroots/raspberrypi2/usr/include/c++/6.0.1/cstdlib:143:11: error: '::getenv' has not been declared
+   using ::getenv;
+           ^~~~~~
+In file included from ../../rpm-5.4.15/system.h:201:0,
+                 from ../../rpm-5.4.15/rpmio/rpmjs.cpp:1:
+/a/build/tmp/sysroots/raspberrypi2/usr/include/c++/6.0.1/stdlib.h:62:12: error: 'std::getenv' has not been declared
+ using std::getenv;
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: rpm-5.4.15/rpmio/Makefile.am
+===================================================================
+--- rpm-5.4.15.orig/rpmio/Makefile.am
++++ rpm-5.4.15/rpmio/Makefile.am
+@@ -151,7 +151,7 @@ librpmio_la_SOURCES = \
+ 	groestl.c hamsi.c jh.c keccak.c lane.c luffa.c md2.c md6.c radiogatun.c\
+ 	salsa10.c salsa20.c shabal.c shavite3.c simd.c skein.c tib3.c tiger.c \
+ 	rpmgit.c rpmio-stub.c \
+-	rpmjs.cpp rpmjsio.c rpmkeyring.c \
++	rpmjni.cc rpmjs.cpp rpmjsio.c rpmkeyring.c \
+ 	rpmnix.c rpmodbc.c rpmsql.c set.c \
+ 	ar.c \
+ 	argv.c \
+@@ -195,7 +195,6 @@ librpmio_la_SOURCES = \
+ 	rpmhook.c \
+ 	rpmio.c \
+ 	rpmiob.c \
+-	rpmjni.cc \
+ 	rpmku.c \
+ 	rpmlog.c \
+ 	rpmltc.c \
+@@ -279,7 +278,9 @@ keccak.lo: $(top_srcdir)/rpmio/keccak.c
+ #rpmjs.lo: $(top_srcdir)/rpmio/rpmjs.c
+ #	@$(LTCOMPILE) -O0 -c $<
+ rpmjs.lo: $(top_srcdir)/rpmio/rpmjs.cpp
+-	@$(LTCOMPILE) -O0 -c $<
++	@$(LTCOMPILE) -O0 -c -D_GLIBCXX_INCLUDE_NEXT_C_HEADERS $<
++rpmjni.lo: $(top_srcdir)/rpmio/rpmjni.cc
++	@$(LTCOMPILE) -O0 -c -D_GLIBCXX_INCLUDE_NEXT_C_HEADERS $<
+ 
+ YACC = byacc -d
+ getdate.c: getdate.y
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index f2c12d2..7ebd5e9 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -116,6 +116,7 @@ SRC_URI += " \
 	   file://rpm-fix-lua-tests-compilation-failure.patch \
 	   file://rpmqv.c-check-_gpg_passphrase-before-ask-for-input.patch \
 	   file://0001-Disable-__sync_add_and_fetch_8-on-nios2.patch \
+	   file://gcc6-stdlib.patch \
 "
 
 # OE specific changes
@@ -344,7 +345,7 @@ EXTRA_OECONF += "--verbose \
 		--program-prefix= \
 		YACC=byacc"
 
-CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -DRPM_VENDOR_OE"
+CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -DRPM_VENDOR_OE -D_GLIBCXX_INCLUDE_NEXT_C_HEADERS"
 
 LDFLAGS_append_libc-uclibc = "-lrt -lpthread"
 
-- 
2.8.2


