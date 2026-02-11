Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2852EB5979
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 07:36:35 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13952.1770794485770118234
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 23:21:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SCe2PNlT;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: careers.myinfo@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-45c7c841904so3187281b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 23:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770794484; x=1771399284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5gpvDGvN2NAq4fDJo1OnvVDYSeAEskEZp193JqbCjeU=;
        b=SCe2PNlT4uWUvQmD0sNXf5Cw+IUqkXzUiug2AgAHQzYhzAS9kbeTimE8jQXCyKFE2V
         0x7cwiR+w+KwJR4JffPz0Z5/7TiWWA3ySNSIs1DFw2/9geUGhEahmJeGeScG3PiErR6N
         iDAXM1JEppJfdK3vynfICRUgwGFvJ94PwYhQU0SZb1ZxSA1Py5+vx5aEYZNMLulCSz4G
         qPCkpnB89dZYKOO+hDlNojdhzbULwtTZe/F2tSOLWa899ZmM3i+30K+6rr+SNUGVLqwB
         gpjWC0y/e9kQ5qzP65YWLpa1gmHmw9+kb7U7Utxs367fvq6TnZIyff+R7xll0xMYJdcq
         AsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770794484; x=1771399284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gpvDGvN2NAq4fDJo1OnvVDYSeAEskEZp193JqbCjeU=;
        b=u7yiJGyPc6/td0KxOMfXgtnIHjzRjd5ECT0zEXqNtU31bVv54j/NJCnxLX/kd6b+Ii
         UO5Boaed8+qi38DF646TQ2jRqmwN3b4lNrwXsFCCwSYtWK2PzDLOH8qdU7MVvT+W48l0
         VdDZT7ec3l6gT/vsQeiXzAM+sd8KkAYPsTF/SUkeel/hZuSz3dAvXB9XTwA8tp8Td76Z
         3Uyo4nRJqajTvCMpO2oWKyUnJnQyPibgDoRspb9Ye48Q6KdlhFN19a2DVXSFTW4p1Wim
         ON4yN71JHgOtRpSnMCY2ZbiYh0oIzVo1Pz92LPv3PbnmSW3qmQm0sUGPalZ15e8smGaQ
         U3ag==
X-Gm-Message-State: AOJu0Yz6twKPI2Dgrvijq2IBqb0/zHh1E8C+gTOUYC1DpU6vaLzRqu22
	DNJojnWrkFg6L77uXtip/BSojXKLE4ysCsn5ra5rySbBnIDwjFpwjhBy9AzWohGo
X-Gm-Gg: AZuq6aLccYLH/n/eOkJXeFVbQEz1nX7yC4w50fJkO+NjpF8kgOCJASrxxCR4uTN0KND
	mUleaE4/0AusuEsRvSRglnHfdjfnMLKi1hG7i9owmn3upLkQcr54mv2vLOYgHLZ5pQy+nAS34NN
	/HrUq9zPIoOCduTiXnQl2AXnB25Uc9wJOuga4fhWsndZjsrb41oJx1ajSV1YEmz1YV142Gx3ecj
	esAZSjj+A3UBJlXBzB3DsMU1ssEZFQt5QTJNVoO7Wf28uIw/dJma9rEUg8MpmvxYGx6ro0DlQ2J
	4M5yxdj6pxkoSS5iQZec0C4z5D7hCEJQIme7DglND7lgDhtVJf8447QiULC6IyRmqia/W/R1Z8Q
	gNq95qZ9geWGrSx0G8AHDoEmtuFO+2qgOex39FSO52/8gmoRRREDjdhClSTPj4MPOuEGg/2xih0
	yRPJRYk9HbWvhUIdYQ0hkn3Pvp
X-Received: by 2002:a17:903:32c8:b0:2a9:3229:bea1 with SMTP id d9443c01a7336-2ab275e3b9bmr16775785ad.13.1770794113310;
        Tue, 10 Feb 2026 23:15:13 -0800 (PST)
Received: from L-15597L.kpit.com ([152.57.35.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab29966d91sm12861085ad.45.2026.02.10.23.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 23:15:12 -0800 (PST)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moins@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [OE-core][kirkstone][PATCH v2 1/2] libpcre2: Enabling Ptest Support
Date: Wed, 11 Feb 2026 12:44:30 +0530
Message-Id: <20260211071431.76890-1-moins@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 07:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230967

Install libpcre2 test suite and run it as ptest.

Add tests for POSIX wrapper (pcre2posix_test), core PCRE2 engine (RunTest), and grep utility (RunGrepTest).

RunTest: Executes the core PCRE2 test suite through pcre2test
RunGrepTest: Checks pcre2grep to ensure its grepping style matching works as expected with various patterns and input files.

Signed-off-by: Shaik Moin <moins@kpit.com>
---
 .../libpcre/libpcre2/run-ptest                | 37 ++++++-------------
 .../recipes-support/libpcre/libpcre2_10.40.bb | 22 +++++------
 2 files changed, 21 insertions(+), 38 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre2/run-ptest b/meta/recipes-support/libpcre/libpcre2/run-ptest
index a227cdec29..2acfd17b17 100644
--- a/meta/recipes-support/libpcre/libpcre2/run-ptest
+++ b/meta/recipes-support/libpcre/libpcre2/run-ptest
@@ -1,39 +1,27 @@
 #!/bin/sh
 
-echo "START: ptest-runner"
-date +"%Y-%m-%dT%H:%M"
-echo "BEGIN: $(pwd)"
-
-# Space-separated list of test binaries
 TESTS="RunGrepTest RunTest"
-
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
@@ -42,4 +30,3 @@ echo "==========================================================================
 
 # Exit code based on failures
 [ "$fail" -eq 0 ] && exit 0 || exit 1
-
diff --git a/meta/recipes-support/libpcre/libpcre2_10.40.bb b/meta/recipes-support/libpcre/libpcre2_10.40.bb
index 0d7786b81c..cd9ae7563c 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.40.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.40.bb
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=41bfb977e4933c506588724ce69bf5d2"
 SRC_URI = "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
     file://CVE-2022-41409.patch \
     file://run-ptest \
-    file://0001-test-Fix-head-1-Busybox.patch \
 "
 UPSTREAM_CHECK_URI = "https://github.com/PhilipHazel/pcre2/releases"
 
@@ -61,16 +60,13 @@ FILES:pcre2test-doc = "${mandir}/man1/pcre2test.1"
 BBCLASSEXTEND = "native nativesdk"
 
 do_install_ptest() {
-        t=${D}${PTEST_PATH}
-        cp -r ${S}/testdata $t
-        for i in pcre2grep pcre2test; \
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
+    for i in pcre2grep pcre2test; do
+        "${B}/libtool" --mode=install install "${B}/$i" "$t"
+    done
+    for i in RunTest RunGrepTest test-driver; \
+      do cp ${S}/$i $t; \
+    done
 }
-- 
2.34.1


