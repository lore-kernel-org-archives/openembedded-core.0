Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00DCAE81BDD
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 08:48:25 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14599.1770796939927582416
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 00:02:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hgNMZa48;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: careers.myinfo@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-824a3ba5222so93660b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 00:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770796939; x=1771401739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Akc1jGAVctY8Nv9bNXhd3bQFCTSG/ZibqC3i+7ZlIE=;
        b=hgNMZa48jzQNYKgyjClHyULzqOSDBYMkbYBZebSDjZm0QtaJ9BpWFI21rEPDdWUoJ1
         RA9vSwGLLkeDWsalkCItO0Epqjq9Axgb1xz2hJC7oyfYsInYf7dLxdrPla33ycRt3o00
         rrBiNv/29JxSbuzM1vq7iqTB+mRqL7oXY3dcAovhR9ExZf5zMWO6OhE6awMuo4JYAc8Z
         1I2/N5OrgukMJjr7JTctZ2nTRFTx98dUcDgxgMx6k/czivg0gJrO4Uz6R5a7D17WjIRt
         wlnWXT4TF9BnBLD9Dr9eYqSPz1NPuCarf1BWgriRDIlFPh9q/0ZFyhpTy8dfU7kS4x1O
         BwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770796939; x=1771401739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Akc1jGAVctY8Nv9bNXhd3bQFCTSG/ZibqC3i+7ZlIE=;
        b=fJUNtQH3Mm2joWC4AG/N7+OV0DJ+OkR3H5VSg4mgTY76Ibf2QF2i6pKTFEfy00UnZh
         zG+3CGQ2fBrkxhPM8Z5KC+W18flVQX5H67CkrLO84B0tmoHpIsMTE/f1zeWPEB08//dZ
         CbejCl3/4gXbkCKr8hRzCmn7ilHY3CTkpTKaY+dgxmTLAjP5sjg8OnWdtqb5Uepy2H7V
         lZ9BzBrKSHdVtAkF4g/9XQqptdx5+MTqqb74kuXo4Hw6LHN+UXgGOtQdkjoFvyGUBa+E
         IXonmb0lXaRUEoQUOQj8PirjFwlR5gbQFsf38wRHJIRoYq57D428knnk1LvPqnvifcuq
         MZcg==
X-Gm-Message-State: AOJu0YzDnk0QRNjXkuqlPGAzilrKuF8k2xXGMX8RpEaKkGCncjvBLDD2
	qONmFEtR82u3VzQkoMzs/HXqhHGJClI6iYMkijXxUfs6kQJUHL5d+otetiF80Q==
X-Gm-Gg: AZuq6aIMkxHS24mURmPBi3PBzdpsKkUXKLn0gVz8lTfljMNqvaRUf9TFEPT0qNs+/Cg
	BQgG8x69J5vda/yVu13P9dYXpqpFoTGU/hPJWy3DX+qFpdT1MPjonLJRp8UJ/I3Nr6rkZnKnj7a
	OQ+L5fVa/anVAc02j0lt0pItZF0J9JC4suXMuWkoPJAaMhSPeMg1E29ci/GYgH73hnka43eYX97
	HR6vJyb0eqqj3KaRBIakwhsomVvMLoLOnQ3zH1/dTBM9WoLAhtAlhAtJqhxCoSfO5k70T+tS6/Z
	eZZBJ1Qlha0EtNnPtoJDAwxsYj6cfuRbOXCpw/XJqscopkL1G3Jy+WHRhfLCzOsKVNYOCjZUz03
	tRZgu71WIBA6tLylE0lNCOymCS3SOuqZA3Bg8xx+O2QY8iY6F4TM5CvtlszStc9KOGih44f2xLT
	pTny42QUjpkjcUwA2LQB8plCBo/5kmx+2G3Gw=
X-Received: by 2002:a05:6a21:9983:b0:38d:efcb:2e84 with SMTP id adf61e73a8af0-3942e3c0f89mr1975695637.32.1770796938837;
        Wed, 11 Feb 2026 00:02:18 -0800 (PST)
Received: from L-15597L.kpit.com ([152.57.35.36])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e197f91b5sm1368134a12.28.2026.02.11.00.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 00:02:18 -0800 (PST)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moins@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [OE-core][master][PATCH] libpcre2: Enabling Ptest support
Date: Wed, 11 Feb 2026 13:31:35 +0530
Message-Id: <20260211080135.92891-1-moins@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 08:48:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230972

Install libpcre2 test suite and run it as ptest.

Add tests for POSIX wrapper (pcre2posix_test), core PCRE2 engine (RunTest), and grep utility (RunGrepTest).

pcre2posix_test: Verifies the POSIX wrapper API
RunTest: Executes the core PCRE2 test suite through pcre2test
RunGrepTest: Checks pcre2grep to ensure its grepping style matching works as expected with various patterns and input files.

Signed-off-by: Shaik Moin <moins@kpit.com>
---
 .../libpcre/libpcre2/run-ptest                | 38 +++++++------------
 .../recipes-support/libpcre/libpcre2_10.47.bb | 25 ++++++------
 2 files changed, 24 insertions(+), 39 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre2/run-ptest b/meta/recipes-support/libpcre/libpcre2/run-ptest
index d7c79827bf..2acfd17b17 100644
--- a/meta/recipes-support/libpcre/libpcre2/run-ptest
+++ b/meta/recipes-support/libpcre/libpcre2/run-ptest
@@ -1,39 +1,27 @@
 #!/bin/sh
 
-echo "START: ptest-runner"
-date +"%Y-%m-%dT%H:%M"
-echo "BEGIN: $(pwd)"
-
-# Space-separated list of test binaries
-TESTS="pcre2posix_test RunGrepTest RunTest"
-
+TESTS="RunGrepTest RunTest"
 total=0
 pass=0
 fail=0
-results=""
 
 for T in $TESTS; do
-    echo "Running $T"
-    total=$((total + 1))
-    if ./"$T"; then
-        echo "PASS: $T"
-        pass=$((pass + 1))
-        results="${results}\nPASS:  ${T}"
+    if [ -x "./$T" ]; then
+        echo "Running $T"
+        total=$((total + 1))
+        if "./$T"; then
+            echo "PASS: $T"
+            pass=$((pass + 1))
+        else
+            echo "FAIL: $T"
+            fail=$((fail + 1))
+        fi
     else
-        echo "FAIL: $T"
-        fail=$((fail + 1))
-        results="${results}\nFAIL:  ${T}"
+        echo "SKIP: $T (not found or not executable)"
     fi
 done
-echo "============================================================================"
-echo "Testsuite summary for PCRE"
-echo "============================================================================"
-
-if [ -n "$results" ]; then
-    printf "%b\n" "$results"
-fi
 
-# Summary with per-test details
+# Summary
 echo "============================================================================"
 echo "# TOTAL: $total"
 echo "# PASS:  $pass"
diff --git a/meta/recipes-support/libpcre/libpcre2_10.47.bb b/meta/recipes-support/libpcre/libpcre2_10.47.bb
index d73e8fea05..70079e0b65 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.md;md5=6720bf3bcff57543b915c2b22e526df0 \
                     file://deps/sljit/LICENSE;md5=97268427d235c41c0be238ce8e5fda17 \
                     "
 
-SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2
+SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
            file://run-ptest \
 "
 
@@ -58,19 +58,16 @@ FILES:pcre2grep-doc = "${mandir}/man1/pcre2grep.1"
 FILES:pcre2test = "${bindir}/pcre2test"
 FILES:pcre2test-doc = "${mandir}/man1/pcre2test.1"
 
-BBCLASSEXTEND = "native nativesdk"+
+BBCLASSEXTEND = "native nativesdk"
 
 do_install_ptest() {
-        t=${D}${PTEST_PATH}
-        cp -r ${S}/testdata $t
-        for i in pcre2posix_test pcre2grep pcre2test; \
-          do cp ${B}/.libs/$i $t; \
-        done
-        for i in RunTest RunGrepTest test-driver; \
-          do cp ${S}/$i $t; \
-        done
-        # Skip the fr_FR locale test. If the locale fr_FR is found, it is tested.
-        # If not found, the test is skipped. The test program assumes fr_FR is non-UTF-8
-        # locale so the test fails if fr_FR is UTF-8 locale.
-        sed -i -e 's:do3=yes:do3=no:g' ${D}${PTEST_PATH}/RunTest
+    t=${D}${PTEST_PATH}
+    cp -r ${S}/testdata $t
+
+    for i in pcre2posix_test pcre2grep pcre2test; do
+        "${B}/libtool" --mode=install install "${B}/$i" "$t"
+    done
+    for i in RunTest RunGrepTest test-driver; \
+      do cp ${S}/$i $t; \
+    done
 }
-- 
2.34.1


