Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC988C4332F
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:01 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.16533.1667744271839488989
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=RaU73uDt;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id b11so8360833pjp.2
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O2YrGh2ly3Ljp7P4RSUfoCi2q+qVGBsdRknE35ow2ng=;
        b=RaU73uDtlIPStEkpSIz2vJVMizBcI7GNOT8FOIEsbHN7CjXIXZA1v8UMXe/Ljy9Zwh
         hCQS4vZBgR1MMD8FbFg7NMbp3C7dfPKPCJj7JRofaJpB0AE7ESWHnFCp2ycalm+9H+dP
         yjxseC5hFWuPPij75w6zwOdz6OSNLsvEvKAMaeGdlx87uQlO8nXZJTQN7F+uCGW+Rlz/
         Tk0weLPbf7cz4r8/yFGTG+dZPUeiyVWle28+UZHt39qxLIIBx894K7RheZQ3ce1OzDKz
         9GVnWDL4eD7Cquq6CXL+s8PAZKCvPg39ZW3Ed3OjH0oJ0YJ0g+/ATaZigTK2Z0wdXeia
         Q1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2YrGh2ly3Ljp7P4RSUfoCi2q+qVGBsdRknE35ow2ng=;
        b=Vde1metpVFzrLQZl3VYiHna1VPXaG+uxP02Y+hDxq+lx5orYWMVgEbR9NoDEzwAUcc
         oyvhrqtQHMHp6YRlNOJ+uwDep+nhoewTXf3f2gQqz2lx4gxkle/A4EuW5BPNDJPsrukt
         Z81QtiXOUQUCHXgyao3S5RxKmqPYe81ba3nSsmNV7m0uFs3LfVxd6wjqK5bFCcvrf+Kd
         EKLzgDZNr8EbNu/58eqI2ODwB2h5m1D0+D8ERZLEyJ3QI0eBNBKy2BHk0uPog3gJ5Bhc
         bakCRS1xMWvo0bqhOe78GvmmiT6ZyRS5RCKzFf6qVKt+Xk7uTlqCOJwqn6l3I44fpphN
         DfZg==
X-Gm-Message-State: ACrzQf1UfIlu/eWJUTqRYqswyJGVRFhER5XH4t8BAd9o1PSFPqkfJC46
	hK+tjNJyyRshJn4klLl+17h8gtNueRQINe29
X-Google-Smtp-Source: AMsMyM7uOCWx1XfqD0J/j/wtIYAjbRNt63K3EscCVJnIhKRkhbKnrFCyD5/BmXTnlyk9GXo1rKoGVQ==
X-Received: by 2002:a17:902:f651:b0:184:6925:d127 with SMTP id m17-20020a170902f65100b001846925d127mr45218644plg.140.1667744270665;
        Sun, 06 Nov 2022 06:17:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.17.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:17:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 10/34] zlib: upgrade 1.2.12 -> 1.2.13
Date: Sun,  6 Nov 2022 04:16:53 -1000
Message-Id: <b7805c7daef0690e27d44aa18cf3946e3108abbf.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172778

From: Ross Burton <ross.burton@arm.com>

Changes in 1.2.13 (13 Oct 2022)
- Fix configure issue that discarded provided CC definition
- Correct incorrect inputs provided to the CRC functions
- Repair prototypes and exporting of new CRC functions
- Fix inflateBack to detect invalid input with distances too far
- Have infback() deliver all of the available output up to any error
- Fix a bug when getting a gzip header extra field with inflate()
- Fix bug in block type selection when Z_FIXED used
- Tighten deflateBound bounds
- Remove deleted assembler code references
- Various portability and appearance improvements

Drop a number of patches whicih have been merged upstream.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 115eb5326dc7f9256d58147b3655cd13d5994cfc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...t-inputs-provided-to-the-CRC-functio.patch | 54 -------------------
 ...etting-a-gzip-header-extra-field-wit.patch | 38 -------------
 ...processing-bug-that-dereferences-NUL.patch | 36 -------------
 meta/recipes-core/zlib/zlib/cc.patch          | 27 ----------
 .../zlib/zlib/ldflags-tests.patch             | 45 ----------------
 .../zlib/{zlib_1.2.12.bb => zlib_1.2.13.bb}   |  7 +--
 6 files changed, 1 insertion(+), 206 deletions(-)
 delete mode 100644 meta/recipes-core/zlib/zlib/0001-Correct-incorrect-inputs-provided-to-the-CRC-functio.patch
 delete mode 100644 meta/recipes-core/zlib/zlib/0001-Fix-a-bug-when-getting-a-gzip-header-extra-field-wit.patch
 delete mode 100644 meta/recipes-core/zlib/zlib/0001-Fix-extra-field-processing-bug-that-dereferences-NUL.patch
 delete mode 100644 meta/recipes-core/zlib/zlib/cc.patch
 delete mode 100644 meta/recipes-core/zlib/zlib/ldflags-tests.patch
 rename meta/recipes-core/zlib/{zlib_1.2.12.bb => zlib_1.2.13.bb} (75%)

diff --git a/meta/recipes-core/zlib/zlib/0001-Correct-incorrect-inputs-provided-to-the-CRC-functio.patch b/meta/recipes-core/zlib/zlib/0001-Correct-incorrect-inputs-provided-to-the-CRC-functio.patch
deleted file mode 100644
index ad5e59de04..0000000000
--- a/meta/recipes-core/zlib/zlib/0001-Correct-incorrect-inputs-provided-to-the-CRC-functio.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From ec3df00224d4b396e2ac6586ab5d25f673caa4c2 Mon Sep 17 00:00:00 2001
-From: Mark Adler <madler@alumni.caltech.edu>
-Date: Wed, 30 Mar 2022 11:14:53 -0700
-Subject: [PATCH] Correct incorrect inputs provided to the CRC functions.
-
-The previous releases of zlib were not sensitive to incorrect CRC
-inputs with bits set above the low 32. This commit restores that
-behavior, so that applications with such bugs will continue to
-operate as before.
-
-Upstream-Status: Backport [https://github.com/madler/zlib/commit/ec3df00224d4b396e2ac6586ab5d25f673caa4c2]
-Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
----
- crc32.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/crc32.c b/crc32.c
-index a1bdce5..451887b 100644
---- a/crc32.c
-+++ b/crc32.c
-@@ -630,7 +630,7 @@ unsigned long ZEXPORT crc32_z(crc, buf, len)
- #endif /* DYNAMIC_CRC_TABLE */
- 
-     /* Pre-condition the CRC */
--    crc ^= 0xffffffff;
-+    crc = (~crc) & 0xffffffff;
- 
-     /* Compute the CRC up to a word boundary. */
-     while (len && ((z_size_t)buf & 7) != 0) {
-@@ -749,7 +749,7 @@ unsigned long ZEXPORT crc32_z(crc, buf, len)
- #endif /* DYNAMIC_CRC_TABLE */
- 
-     /* Pre-condition the CRC */
--    crc ^= 0xffffffff;
-+    crc = (~crc) & 0xffffffff;
- 
- #ifdef W
- 
-@@ -1077,7 +1077,7 @@ uLong ZEXPORT crc32_combine64(crc1, crc2, len2)
- #ifdef DYNAMIC_CRC_TABLE
-     once(&made, make_crc_table);
- #endif /* DYNAMIC_CRC_TABLE */
--    return multmodp(x2nmodp(len2, 3), crc1) ^ crc2;
-+    return multmodp(x2nmodp(len2, 3), crc1) ^ (crc2 & 0xffffffff);
- }
- 
- /* ========================================================================= */
-@@ -1112,5 +1112,5 @@ uLong crc32_combine_op(crc1, crc2, op)
-     uLong crc2;
-     uLong op;
- {
--    return multmodp(op, crc1) ^ crc2;
-+    return multmodp(op, crc1) ^ (crc2 & 0xffffffff);
- }
diff --git a/meta/recipes-core/zlib/zlib/0001-Fix-a-bug-when-getting-a-gzip-header-extra-field-wit.patch b/meta/recipes-core/zlib/zlib/0001-Fix-a-bug-when-getting-a-gzip-header-extra-field-wit.patch
deleted file mode 100644
index 96ab563121..0000000000
--- a/meta/recipes-core/zlib/zlib/0001-Fix-a-bug-when-getting-a-gzip-header-extra-field-wit.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From eff308af425b67093bab25f80f1ae950166bece1 Mon Sep 17 00:00:00 2001
-From: Mark Adler <fork@madler.net>
-Date: Sat, 30 Jul 2022 15:51:11 -0700
-Subject: [PATCH] Fix a bug when getting a gzip header extra field with inflate().
-
-If the extra field was larger than the space the user provided with
-inflateGetHeader(), and if multiple calls of inflate() delivered
-the extra header data, then there could be a buffer overflow of the
-provided space. This commit assures that provided space is not
-exceeded.
-
-CVE: CVE-2022-37434
-Upstream-Status: Backport [https://github.com/madler/zlib/commit/eff308af425b67093bab25f80f1ae950166be]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- inflate.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/inflate.c b/inflate.c
-index 7be8c63..7a72897 100644
---- a/inflate.c
-+++ b/inflate.c
-@@ -763,9 +763,10 @@ int flush;
-                 copy = state->length;
-                 if (copy > have) copy = have;
-                 if (copy) {
-+                    len = state->head->extra_len - state->length;
-                     if (state->head != Z_NULL &&
--                        state->head->extra != Z_NULL) {
--                        len = state->head->extra_len - state->length;
-+                        state->head->extra != Z_NULL &&
-+                        len < state->head->extra_max) {
-                         zmemcpy(state->head->extra + len, next,
-                                 len + copy > state->head->extra_max ?
-                                 state->head->extra_max - len : copy);
--- 
-2.37.2
-
diff --git a/meta/recipes-core/zlib/zlib/0001-Fix-extra-field-processing-bug-that-dereferences-NUL.patch b/meta/recipes-core/zlib/zlib/0001-Fix-extra-field-processing-bug-that-dereferences-NUL.patch
deleted file mode 100644
index a0978c5f95..0000000000
--- a/meta/recipes-core/zlib/zlib/0001-Fix-extra-field-processing-bug-that-dereferences-NUL.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 1eb7682f845ac9e9bf9ae35bbfb3bad5dacbd91d Mon Sep 17 00:00:00 2001
-From: Mark Adler <fork@madler.net>
-Date: Mon, 8 Aug 2022 10:50:09 -0700
-Subject: [PATCH] Fix extra field processing bug that dereferences NULL
- state->head.
-
-The recent commit to fix a gzip header extra field processing bug
-introduced the new bug fixed here.
-
-CVE: CVE-2022-37434
-Upstream-Status: Backport [https://github.com/madler/zlib/commit/1eb7682f845ac9e9bf9ae35bbfb3bad5dacbd91d]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- inflate.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/inflate.c b/inflate.c
-index 7a72897..2a3c4fe 100644
---- a/inflate.c
-+++ b/inflate.c
-@@ -763,10 +763,10 @@ int flush;
-                 copy = state->length;
-                 if (copy > have) copy = have;
-                 if (copy) {
--                    len = state->head->extra_len - state->length;
-                     if (state->head != Z_NULL &&
-                         state->head->extra != Z_NULL &&
--                        len < state->head->extra_max) {
-+                        (len = state->head->extra_len - state->length) <
-+                            state->head->extra_max) {
-                         zmemcpy(state->head->extra + len, next,
-                                 len + copy > state->head->extra_max ?
-                                 state->head->extra_max - len : copy);
--- 
-2.37.2
-
diff --git a/meta/recipes-core/zlib/zlib/cc.patch b/meta/recipes-core/zlib/zlib/cc.patch
deleted file mode 100644
index 8fb974ded4..0000000000
--- a/meta/recipes-core/zlib/zlib/cc.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 05796d3d8d5546cf1b4dfe2cd72ab746afae505d Mon Sep 17 00:00:00 2001
-From: Mark Adler <madler@alumni.caltech.edu>
-Date: Mon, 28 Mar 2022 18:34:10 -0700
-Subject: [PATCH] Fix configure issue that discarded provided CC definition.
-
----
- configure | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/configure b/configure
-index 52ff4a04e..3fa3e8618 100755
---- a/configure
-+++ b/configure
-@@ -174,7 +174,10 @@ if test -z "$CC"; then
-   else
-     cc=${CROSS_PREFIX}cc
-   fi
-+else
-+  cc=${CC}
- fi
-+
- cflags=${CFLAGS-"-O3"}
- # to force the asm version use: CFLAGS="-O3 -DASMV" ./configure
- case "$cc" in
diff --git a/meta/recipes-core/zlib/zlib/ldflags-tests.patch b/meta/recipes-core/zlib/zlib/ldflags-tests.patch
deleted file mode 100644
index 286390665f..0000000000
--- a/meta/recipes-core/zlib/zlib/ldflags-tests.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Obey LDFLAGS for tests
-
-Upstream-Status: Submitted [https://github.com/madler/zlib/pull/409]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
---- zlib-1.2.8.orig/Makefile.in
-+++ zlib-1.2.8/Makefile.in
-@@ -26,7 +26,7 @@ CFLAGS=-O
-
- SFLAGS=-O
- LDFLAGS=
--TEST_LDFLAGS=-L. libz.a
-+TEST_LDFLAGS=-L. $(LDFLAGS)
- LDSHARED=$(CC)
- CPP=$(CC) -E
-
-@@ -176,22 +176,22 @@ placebo $(SHAREDLIBV): $(PIC_OBJS) libz.
-	-@rmdir objs
-
- example$(EXE): example.o $(STATICLIB)
--	$(CC) $(CFLAGS) -o $@ example.o $(TEST_LDFLAGS)
-+	$(CC) $(CFLAGS) -o $@ example.o $(TEST_LDFLAGS) $(STATICLIB)
-
- minigzip$(EXE): minigzip.o $(STATICLIB)
--	$(CC) $(CFLAGS) -o $@ minigzip.o $(TEST_LDFLAGS)
-+	$(CC) $(CFLAGS) -o $@ minigzip.o $(TEST_LDFLAGS) $(STATICLIB)
-
- examplesh$(EXE): example.o $(SHAREDLIBV)
--	$(CC) $(CFLAGS) -o $@ example.o -L. $(SHAREDLIBV)
-+	$(CC) $(CFLAGS) -o $@ example.o $(TEST_LDFLAGS) $(SHAREDLIBV)
-
- minigzipsh$(EXE): minigzip.o $(SHAREDLIBV)
--	$(CC) $(CFLAGS) -o $@ minigzip.o -L. $(SHAREDLIBV)
-+	$(CC) $(CFLAGS) -o $@ minigzip.o $(TEST_LDFLAGS) $(SHAREDLIBV)
-
- example64$(EXE): example64.o $(STATICLIB)
--	$(CC) $(CFLAGS) -o $@ example64.o $(TEST_LDFLAGS)
-+	$(CC) $(CFLAGS) -o $@ example64.o $(TEST_LDFLAGS) $(STATICLIB)
-
- minigzip64$(EXE): minigzip64.o $(STATICLIB)
--	$(CC) $(CFLAGS) -o $@ minigzip64.o $(TEST_LDFLAGS)
-+	$(CC) $(CFLAGS) -o $@ minigzip64.o $(TEST_LDFLAGS) $(STATICLIB)
-
- install-libs: $(LIBS)
-	-@if [ ! -d $(DESTDIR)$(exec_prefix)  ]; then mkdir -p $(DESTDIR)$(exec_prefix); fi
diff --git a/meta/recipes-core/zlib/zlib_1.2.12.bb b/meta/recipes-core/zlib/zlib_1.2.13.bb
similarity index 75%
rename from meta/recipes-core/zlib/zlib_1.2.12.bb
rename to meta/recipes-core/zlib/zlib_1.2.13.bb
index 9ec78b95be..ec977a3035 100644
--- a/meta/recipes-core/zlib/zlib_1.2.12.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.13.bb
@@ -8,17 +8,12 @@ LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef6
 
 # The source tarball needs to be .gz as only the .gz ends up in fossils/
 SRC_URI = "https://zlib.net/${BP}.tar.gz \
-           file://cc.patch \
-           file://ldflags-tests.patch \
            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
            file://run-ptest \
-           file://0001-Correct-incorrect-inputs-provided-to-the-CRC-functio.patch \
-           file://0001-Fix-a-bug-when-getting-a-gzip-header-extra-field-wit.patch \
-           file://0001-Fix-extra-field-processing-bug-that-dereferences-NUL.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-SRC_URI[sha256sum] = "91844808532e5ce316b3c010929493c0244f3d37593afd6de04f71821d5136d9"
+SRC_URI[sha256sum] = "b3a24de97a8fdbc835b9833169501030b8977031bcb54b3b3ac13740f846ab30"
 
 # When a new release is made the previous release is moved to fossils/, so add this
 # to PREMIRRORS so it is also searched automatically.
-- 
2.25.1


