Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1676.1794366725812175817
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 19:12:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=zCye75an;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so5415873eec.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 19:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794366725; x=1794971525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D+pxMmJKxDPW5C9w58EJoQpGxAKTgO1zM0Xw27Fd3lw=;
        b=zCye75anGaUGy5o/TE0cQYvZH0VTuLk4zluVM+13ff/PZThCJVT9acGxozE9leak9T
         wJGKcDE2H8022BiTpBnGKKL9YI5ACCv1RGI3Db9uI0QXQFMJECoOf81Vh80kqpBvcYFy
         UjEVcNGP042wWmOXl+PltQVtgeANlwRvjw4jlX+cbasQ8+9/cMRqbZ3+M9eiiGoASEIk
         hPxiRFlbbn2AygxNgEZoJZDiWgddV7UHUu5mJ8cfzGgZddOIYqpJQMLE7bFrWn+k+xjI
         6TfY9aerN1dQnyoo1cMlU8LShctAzAaddhFs0Q+S6Er2CEeEuzaqhyVG8sA6dbMSTinb
         GUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794366725; x=1794971525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D+pxMmJKxDPW5C9w58EJoQpGxAKTgO1zM0Xw27Fd3lw=;
        b=TgfQCdrz3JHtEPspQMM+BlB8wrO+As4hJ1U7FbR4opLLaIVJQAhrizWgP3y41Dizgg
         mn9+xd8w75kezDSkXdIFuRaoiCmdTImEE3UPkKn2LVPmgr8bzN+GrPzpgNt5IafjEyh2
         s/VIaHYjVCaKr7t/wKxNeAhlzVNTDJ1RzofUOPUOIqcmI6cOB5PCWxJHLabVnRKbwqNd
         KXws8Aix5YJ2q1j3TMut6fFjfeyhQ6/yfI2oKXmiWfKU9Ajo2L9tnKwmPzGrNQ1V8xeA
         mnxZhoKidZK9OS0crOH6Q3UV55ieMJ0BVe70I02Cbxngh9X1rrSgMgZYdqIItVMWdPeB
         24vw==
X-Gm-Message-State: APuU4Z88YXdOHnOQzCXcEDrdpaOZJcIMrZyHnNQzQshth3Ewfn4YUPfC
	DcWZC08uW4H+A8DPc9lFeAXKvNCkFl3XMHCn1rGBSxYs0GP0RjquqvnOZZFvWg==
X-Gm-Gg: AYBFou1yOiglxgZNBTtDGK9wL2750WgJSorU/1CAQMLfnJjUTF8nvf+qLcRl2b6P4Mm
	PBV+1O8iZh7INM3pTQtCgcebf3H3xLbISp+oYO9lsB21xTH/n6w/FkAG0/nHv/QPr9yxGnCYidK
	op3ogMpZmiDEy/Q6tvm2DeHsYFc8+Zwb17ylE4tZusJf3dn8dWmIIZUCWO4FozSToiWuvSES8AX
	jOpserX6qb6P1JBpmNgM9lhLW3cnoijrxaTGyMtarQx1ex3Y2aC0AwRRKc9Da44S9YjRKputxDc
	ZUvpMEu2wCVzr8+oIYxm0LaQ6H7lpK0NGzU055kVfRBe0knjOJSsOFcpmgTWErZ6ycIN05jSFIX
	fWpmYSrk+1awtJbwzTaKrF4yI/Iqd4GhIx+5/eFB9AaFw5WRjbiSEBeJAzUeIate5xeHGxe37By
	QDaACGtDhqcfHLMLambzZFLUwY+tzOeMVfGBOdVPC0unEHiblGv+mvMY0HdnoYQDrHekC1MViG5
	4bub2/yTJIwDHKv/811SkLRPU72lY0tyMYMT3t7yfvTSc6iaqzMU6ikUcJBoTiqugHdGbl1q14v
	5b6C71+Ju7dT713Zp69V8H1ScFRvh/JSMOd5DA90iHL7uIpw1pa86t0FUG0gXZ7WTJXitrZMzM7
	IjPDHHk8vtw==
X-Received: by 2002:a05:7301:4544:b0:373:5561:8d06 with SMTP id 5a478bee46e88-37687212a1bmr1517955eec.37.1794366724760;
        Tue, 10 Nov 2026 19:12:04 -0800 (PST)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm11903949eec.27.2026.11.10.19.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:12:04 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>,
	Prasanth R <ragaprasanth@gmail.com>
Subject: [PATCH] lz4: upgrade 1.10.0 -> 1.11.1
Date: Wed, 11 Nov 2026 12:11:22 +0900
Message-Id: <20261111031122.3270583-1-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 03:12:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249941
Content-Type: text/plain; charset="utf-8"

Drop reproducibility.patch and fix-null-error-handling.patch, both
are part of this release.

The unit tests moved out of frametest into a new unittest program,
so install and run it in the ptest too. run-ptest is now plain sh,
so drop the bash dependency.

Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 .../lz4/lz4/fix-null-error-handling.patch     | 68 -------------------
 .../lz4/lz4/reproducibility.patch             | 33 ---------
 meta/recipes-support/lz4/lz4/run-ptest        | 27 ++++----
 .../lz4/{lz4_1.10.0.bb => lz4_1.11.1.bb}      | 10 +--
 4 files changed, 15 insertions(+), 123 deletions(-)
 delete mode 100644 meta/recipes-support/lz4/lz4/fix-null-error-handling.patch
 delete mode 100644 meta/recipes-support/lz4/lz4/reproducibility.patch
 rename meta/recipes-support/lz4/{lz4_1.10.0.bb => lz4_1.11.1.bb} (88%)

diff --git a/meta/recipes-support/lz4/lz4/fix-null-error-handling.patch b/meta/recipes-support/lz4/lz4/fix-null-error-handling.patch
deleted file mode 100644
index 1527cc7591..0000000000
--- a/meta/recipes-support/lz4/lz4/fix-null-error-handling.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From f64efec011c058bd70348576438abac222fe6c82 Mon Sep 17 00:00:00 2001
-From: louislafosse <louis.lafosse@epitech.eu>
-Date: Mon, 31 Mar 2025 20:48:52 +0200
-Subject: [PATCH] fix(null) : improve error handlings when passing a null
- pointer to some functions from lz4frame
-
-Upstream-Status: Backport [https://github.com/lz4/lz4/commit/f64efec011c058bd70348576438abac222fe6c82]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- lib/lz4frame.c    | 15 +++++++++++++--
- tests/frametest.c |  9 ++++++---
- 2 files changed, 19 insertions(+), 5 deletions(-)
-
-diff --git a/lib/lz4frame.c b/lib/lz4frame.c
-index 85daca7b..c9e4a3cf 100644
---- a/lib/lz4frame.c
-+++ b/lib/lz4frame.c
-@@ -539,9 +539,16 @@ LZ4F_CDict*
- LZ4F_createCDict_advanced(LZ4F_CustomMem cmem, const void* dictBuffer, size_t dictSize)
- {
-     const char* dictStart = (const char*)dictBuffer;
--    LZ4F_CDict* const cdict = (LZ4F_CDict*)LZ4F_malloc(sizeof(*cdict), cmem);
-+    LZ4F_CDict* cdict = NULL;
-+
-     DEBUGLOG(4, "LZ4F_createCDict_advanced");
--    if (!cdict) return NULL;
-+
-+    if (!dictStart)
-+        return NULL;
-+    cdict = (LZ4F_CDict*)LZ4F_malloc(sizeof(*cdict), cmem);
-+    if (!cdict)
-+        return NULL;
-+
-     cdict->cmem = cmem;
-     if (dictSize > 64 KB) {
-         dictStart += dictSize - 64 KB;
-@@ -1486,6 +1493,10 @@ LZ4F_errorCode_t LZ4F_getFrameInfo(LZ4F_dctx* dctx,
-                                    LZ4F_frameInfo_t* frameInfoPtr,
-                              const void* srcBuffer, size_t* srcSizePtr)
- {
-+    assert(dctx != NULL);
-+    RETURN_ERROR_IF(frameInfoPtr == NULL, parameter_null);
-+    RETURN_ERROR_IF(srcSizePtr == NULL, parameter_null);
-+
-     LZ4F_STATIC_ASSERT(dstage_getFrameHeader < dstage_storeFrameHeader);
-     if (dctx->dStage > dstage_storeFrameHeader) {
-         /* frameInfo already decoded */
-diff --git a/tests/frametest.c b/tests/frametest.c
-index de0fe643..90247547 100644
---- a/tests/frametest.c
-+++ b/tests/frametest.c
-@@ -714,10 +714,13 @@ static int unitTests(U32 seed, double compressibility)
-         size_t const srcSize = 65 KB; /* must be > 64 KB to avoid short-size optimizations */
-         size_t const dstCapacity = LZ4F_compressFrameBound(srcSize, NULL);
-         size_t cSizeNoDict, cSizeWithDict;
--        LZ4F_CDict* const cdict = LZ4F_createCDict(CNBuffer, dictSize);
--        if (cdict == NULL) goto _output_error;
--        CHECK( LZ4F_createCompressionContext(&cctx, LZ4F_VERSION) );
-+        LZ4F_CDict* cdict = NULL;
- 
-+        CHECK( LZ4F_createCompressionContext(&cctx, LZ4F_VERSION) );
-+        cdict = LZ4F_createCDict(CNBuffer, dictSize);
-+        if (cdict == NULL)
-+            goto _output_error;
-+        
-         DISPLAYLEVEL(3, "Testing LZ4F_createCDict_advanced : ");
-         {   LZ4F_CDict* const cda = LZ4F_createCDict_advanced(lz4f_cmem_test, CNBuffer, dictSize);
-             if (cda == NULL) goto _output_error;
diff --git a/meta/recipes-support/lz4/lz4/reproducibility.patch b/meta/recipes-support/lz4/lz4/reproducibility.patch
deleted file mode 100644
index c138986da8..0000000000
--- a/meta/recipes-support/lz4/lz4/reproducibility.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-lib/Makefile: Fix static library reproducibility
-
-The static library contents varies depending of the order of the object files on disk meaning
-it isn't reproducible.
-
-To avoid this, use the SRCFILES values which are already sorted, mapped to the object names
-instead.
-
-
-Upstream-Status: Submitted [https://github.com/lz4/lz4/pull/1497]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: git/lib/Makefile
-===================================================================
---- git.orig/lib/Makefile
-+++ git/lib/Makefile
-@@ -55,6 +55,7 @@ CFLAGS   = $(DEBUGFLAGS) $(USERCFLAGS)
- ALLFLAGS = $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)
- 
- SRCFILES := $(sort $(wildcard *.c))
-+OBJFILES = $(SRCFILES:.c=.o)
- 
- include ../Makefile.inc
- 
-@@ -102,7 +103,7 @@ liblz4.a: $(SRCFILES)
- ifeq ($(BUILD_STATIC),yes)  # can be disabled on command line
- 	@echo compiling static library
- 	$(COMPILE.c) $^
--	$(AR) rcs $@ *.o
-+	$(AR) rcs $@ $(OBJFILES)
- endif
- 
- ifeq ($(WINBASED),yes)
diff --git a/meta/recipes-support/lz4/lz4/run-ptest b/meta/recipes-support/lz4/lz4/run-ptest
index f4a46a4f2c..34527ae68f 100644
--- a/meta/recipes-support/lz4/lz4/run-ptest
+++ b/meta/recipes-support/lz4/lz4/run-ptest
@@ -1,17 +1,14 @@
 #!/bin/sh
 
-# Define test work dir
-WORKDIR=@PTEST_PATH@/tests/
-
-# Run test
-cd ${WORKDIR}
-
-case_name="test_frame"
-./frametest 
-ret=$?
-if [[ ${ret} == "0" ]]; then
-    echo "PASS: lz4/$case_name"
-else
-    echo "FAIL: lz4/$case_name"
-fi
-
+cd @PTEST_PATH@/tests/ || exit 1
+
+run() {
+    if "./$1"; then
+        echo "PASS: lz4/$2"
+    else
+        echo "FAIL: lz4/$2"
+    fi
+}
+
+run frametest test_frame
+run unittest test_unit
diff --git a/meta/recipes-support/lz4/lz4_1.10.0.bb b/meta/recipes-support/lz4/lz4_1.11.1.bb
similarity index 88%
rename from meta/recipes-support/lz4/lz4_1.10.0.bb
rename to meta/recipes-support/lz4/lz4_1.11.1.bb
index 5a39f89871..47fa5117f2 100644
--- a/meta/recipes-support/lz4/lz4_1.10.0.bb
+++ b/meta/recipes-support/lz4/lz4_1.11.1.bb
@@ -10,13 +10,11 @@ LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=5cd5f851b52ec832b10eedb3f01f885a \
 
 PE = "1"
 
-SRCREV = "ebb370ca83af193212df4dcbadcc5d87bc0de2f0"
+SRCREV = "aa4647fad575d01a874aaaadcdbe8e6a40e072f5"
 
 SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https;tag=v${PV} \
-           file://reproducibility.patch \
            file://run-ptest \
-           file://fix-null-error-handling.patch \
-"
+           "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 inherit ptest
@@ -31,8 +29,6 @@ do_install() {
 
 BBCLASSEXTEND = "native nativesdk"
 
-RDEPENDS:${PN}-ptest += "bash"
-
 do_compile_ptest() {
         oe_runmake -C ${B}/tests/
 }
@@ -40,7 +36,7 @@ do_compile_ptest() {
 do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/tests/
 	install --mode=755 ${B}/tests/frametest ${D}${PTEST_PATH}/tests/
+	install --mode=755 ${B}/tests/unittest ${D}${PTEST_PATH}/tests/
 	sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
-
 }
 
-- 
2.34.1

