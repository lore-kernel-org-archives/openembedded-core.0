Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.3903.1603919178240778481
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KY7wGU31;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id t11so888457edj.13
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hHGBbDJznE+1+13LTC/slRI2w8dmVPg0sE0Suv8zWrc=;
        b=KY7wGU31297K2lu22PBIzgQa0YB/OBfp+mD87ADMCb/K1vlRLqi9GI/jpuwXnRZr2u
         lbdbVCypi+junz+H8x/IoI+1tiJ/igw12sFp0aqhbiRNIhPfXhkdQGX6WmKlPuG5R7p2
         doo/dszxRdCGVHYw+ATxZvWM4jNmJ7v3ulIKFaYRRg+kKDyQN8ZeUalSNFESJ4rWJ0RV
         /8r2zJmtxyJ/+HP2V8N84WlVnUQocrrh3lztFxiLXVnzVnI8niMqs1NIkAFvefv9aa79
         e5Ag5mFy5U+w5OkhzvEgXlea41DCoTrjFLSS63jJ6tkWMB7azA2rTOPqel/oJgs/vK74
         VHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hHGBbDJznE+1+13LTC/slRI2w8dmVPg0sE0Suv8zWrc=;
        b=MXOgBELRH/2AZzVL2GomTD3zdM9NAkcWYk4MFsL0ri0DJMPCczG5aAuA+nEQlGNzzv
         Pxg3FdZq4lOYPIEroodsdzr0gVFWDau47dhr6G+rz/rbMDZ6bpjwWhkW7qlzjGHYWmn1
         HarpLfWZ/MVsikdKmN/dcRq6XtC1Mz0h7J2Vbi4UVKXx27yCV7jMU5opLE6dl5CgkQKR
         KBPukZ8cEKUpTIYv/JoMNvWESKwuoAwvn+cH0eIDXRW+AAgfiFBAk1DW7l8cVML+lKyy
         1PycwS0G9HxD+TdcCLO1WJgTimv30t+K0Qf8+Pq+soyd5ZXL5CvVLwClAKIhyv10dYdD
         7+Zg==
X-Gm-Message-State: AOAM533UB1tdf3Lk4+D7mJ3etrgEF8A3Vt9Ii6KVCEa2JuzZcjucLigd
	UCGB+APh5H+oZtOc3+j4Tu9BwsiFpY037g==
X-Google-Smtp-Source: ABdhPJxYkfLWlmPYlvoLlYTCGxtATZaz1HY8usJSmhAvrh9zO5BIIj5K9mrb4XNRphmfWpI3Rmv+lQ==
X-Received: by 2002:aa7:d54f:: with SMTP id u15mr821396edr.239.1603919176542;
        Wed, 28 Oct 2020 14:06:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:16 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/33] elfutils: update 0.180 -> 0.181
Date: Wed, 28 Oct 2020 22:05:37 +0100
Message-Id: <20201028210558.21070-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a config option for client debuginfod library.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../elfutils/{elfutils_0.180.bb => elfutils_0.181.bb} | 10 +++++++++-
 .../elfutils/files/0001-musl-obstack-fts.patch        |  4 ++--
 ...kefile.am-compile-test_nlist-with-standard-C.patch | 11 ++++++-----
 .../elfutils/files/0002-musl-libs.patch               |  2 +-
 .../elfutils/files/0003-musl-utils.patch              |  6 +++---
 .../elfutils/files/0004-Fix-error-on-musl.patch       |  2 +-
 .../files/0015-config-eu.am-do-not-use-Werror.patch   |  3 ++-
 7 files changed, 24 insertions(+), 14 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.180.bb => elfutils_0.181.bb} (90%)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.180.bb b/meta/recipes-devtools/elfutils/elfutils_0.181.bb
similarity index 90%
rename from meta/recipes-devtools/elfutils/elfutils_0.180.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.181.bb
index 61e46a4ed7..6c49a5fc26 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.180.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.181.bb
@@ -28,7 +28,7 @@ SRC_URI_append_libc-musl = " \
            file://0004-Fix-error-on-musl.patch \
            file://0015-config-eu.am-do-not-use-Werror.patch \
            "
-SRC_URI[sha256sum] = "b827b6e35c59d188ba97d7cf148fa8dc6f5c68eb6c5981888dfdbb758c0b569d"
+SRC_URI[sha256sum] = "29a6ad7421ec2acfee489bb4a699908281ead2cb63a20a027ce8804a165f0eb3"
 
 inherit autotools gettext ptest pkgconfig
 
@@ -40,6 +40,7 @@ DEPENDS_BZIP2_class-target = "bzip2"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[bzip2] = "--with-bzlib,--without-bzlib,${DEPENDS_BZIP2}"
 PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
+PACKAGECONFIG[libdebuginfod] = "--enable-libdebuginfod,--disable-libdebuginfod,curl"
 
 RDEPENDS_${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils"
 
@@ -59,6 +60,8 @@ do_install_ptest() {
 		install -d -m 755                       ${D}${PTEST_PATH}/src
 		install -d -m 755                       ${D}${PTEST_PATH}/libelf
 		install -d -m 755                       ${D}${PTEST_PATH}/libdw
+		install -d -m 755                       ${D}${PTEST_PATH}/libdwfl
+		install -d -m 755                       ${D}${PTEST_PATH}/libdwelf
 		install -d -m 755                       ${D}${PTEST_PATH}/libasm
 		for test_file in ${TEST_FILES}; do
 			if [ -f ${B}/src/${test_file} ]; then
@@ -68,6 +71,11 @@ do_install_ptest() {
 		cp ${D}${libdir}/libelf-${PV}.so ${D}${PTEST_PATH}/libelf/libelf.so
 		cp ${D}${libdir}/libdw-${PV}.so ${D}${PTEST_PATH}/libdw/libdw.so
 		cp ${D}${libdir}/libasm-${PV}.so ${D}${PTEST_PATH}/libasm/libasm.so
+		cp ${S}/libelf/*.h             ${D}${PTEST_PATH}/libelf/
+		cp ${S}/libdw/*.h              ${D}${PTEST_PATH}/libdw/
+		cp ${S}/libdwfl/*.h            ${D}${PTEST_PATH}/libdwfl/
+		cp ${S}/libdwelf/*.h           ${D}${PTEST_PATH}/libdwelf/
+		cp ${S}/libasm/*.h             ${D}${PTEST_PATH}/libasm/
 		cp -r ${S}/tests/                       ${D}${PTEST_PATH}
 		cp -r ${B}/tests/*                      ${D}${PTEST_PATH}/tests
 		cp -r ${B}/config.h                     ${D}${PTEST_PATH}
diff --git a/meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch b/meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch
index 2450b0d6b8..67d4703c80 100644
--- a/meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch
@@ -1,4 +1,4 @@
-From 1ec7b2208803e0fbdcbe6c07b849e7dc4d9fa8a2 Mon Sep 17 00:00:00 2001
+From 1a62bb8e8f2cb0f180c749946a48114e8f391b55 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:17:25 +0800
 Subject: [PATCH] musl-obstack-fts
@@ -20,7 +20,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  3 files changed, 58 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index e9649c2..03643c8 100644
+index ab9c751..b057d86 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -538,6 +538,60 @@ else
diff --git a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
index 481b912387..d7b382fd94 100644
--- a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
@@ -1,4 +1,4 @@
-From 1ca86294ee5454592c9ad855e13080509d8a92d3 Mon Sep 17 00:00:00 2001
+From fa265ff686cb60e19aa607bda3752b6b2ee87a14 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 23 Jun 2020 07:49:35 +0000
 Subject: [PATCH] tests/Makefile.am: compile test_nlist with standard CFLAGS
@@ -8,20 +8,21 @@ be reproducible.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  tests/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 8048b69..d2b28a4 100644
+index 05fc9b4..11de0fc 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -86,7 +86,7 @@ backtrace-child-biarch$(EXEEXT): backtrace-child.c
+@@ -92,7 +92,7 @@ endif
  test-nlist$(EXEEXT): test-nlist.c
  	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
  	  $(AM_CPPFLAGS) $(CPPFLAGS) \
--	  $(test_nlist_CFLAGS) $(test_nlist_LDADD) -o $@ $<
-+	  $(CFLAGS) $(test_nlist_LDADD) -o $@ $<
+-	  $(test_nlist_CFLAGS) $(GCOV_FLAGS) -o $@ $< $(test_nlist_LDADD)
++	  $(CFLAGS) $(GCOV_FLAGS) -o $@ $< $(test_nlist_LDADD)
  
  TESTS = run-arextract.sh run-arsymtest.sh run-ar.sh newfile test-nlist \
  	update1 update2 update3 update4 \
diff --git a/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch b/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
index d5ec0ec9e5..894e46c3c4 100644
--- a/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
+++ b/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
@@ -1,4 +1,4 @@
-From 9a57efb0f826a70ae360aa55504ee2de656b92b6 Mon Sep 17 00:00:00 2001
+From 2e1f8ca0b67c1d1991c14d509938c347e09bae94 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:18:47 +0800
 Subject: [PATCH] musl-libs
diff --git a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
index 4f28d9d027..2a21cd37ce 100644
--- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
@@ -1,4 +1,4 @@
-From 6923400b777d4ba6f040c4006413bf997326460f Mon Sep 17 00:00:00 2001
+From 9b237f19f82d5ab1e0702637fece1866b1ef6681 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:19:48 +0800
 Subject: [PATCH] musl-utils
@@ -58,7 +58,7 @@ index 6ba6af4..0c7674b 100644
  ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
  
 diff --git a/src/readelf.c b/src/readelf.c
-index 5994615..f3cc071 100644
+index 685d0b1..a842b10 100644
 --- a/src/readelf.c
 +++ b/src/readelf.c
 @@ -4829,10 +4829,11 @@ listptr_base (struct listptr *p)
@@ -124,7 +124,7 @@ index 5994615..f3cc071 100644
  
  static bool
 diff --git a/src/strip.c b/src/strip.c
-index 4054c2a..d2d2176 100644
+index 48792a7..198a2e4 100644
 --- a/src/strip.c
 +++ b/src/strip.c
 @@ -46,6 +46,13 @@
diff --git a/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch b/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
index 481e4b38eb..c79c737c62 100644
--- a/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
+++ b/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
@@ -1,4 +1,4 @@
-From 48b769ab692c8f02c1ae467229fe3404f662098a Mon Sep 17 00:00:00 2001
+From d3dc5f98f653342af97ebfbdf3479ee1f0d0cf38 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 1 May 2019 22:15:03 +0100
 Subject: [PATCH] Fix error on musl:
diff --git a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
index c3ae357265..48fd4d41f3 100644
--- a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
+++ b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
@@ -1,4 +1,4 @@
-From dce2187dd8f592316357b200ebbe8dbed9ee65cb Mon Sep 17 00:00:00 2001
+From 9b7554a3e21ccb455b3661a6b4e767636c2c5cf3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jun 2020 21:35:16 +0000
 Subject: [PATCH] config/eu.am: do not use -Werror
@@ -10,6 +10,7 @@ Werror.
 
 Upstream-Status: Inappropriate [oe core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  config/eu.am | 2 --
  1 file changed, 2 deletions(-)
-- 
2.29.0

