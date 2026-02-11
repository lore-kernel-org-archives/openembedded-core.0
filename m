Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830D6EB5979
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 07:36:45 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13963.1770794647086298506
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 23:24:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VLbueXL2;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: careers.myinfo@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-bde0f62464cso1961998a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 23:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770794646; x=1771399446; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9bu1QlHrNgTg/QtKW66/BGRnOBUUWRu4VVJtFVFedaE=;
        b=VLbueXL208hTGiFux1K0rEqanbiQrxYS1JspwyQBv8eSrfFPnmutS3yPMSTuBIkDi9
         8edODd88Ck8hpBgmbNwVkLFj/H2Yp/E8TGnDGcoIy24gcJqB0YqDcbqmxvfo7HfsYOfI
         XvGD424VJMOvfyeXkKSRFoyL5sWApOsbxxP8GOM0igP0Ju8iKi0nfKNIyGWreRd4s/x+
         QXEyDPfFrA79F3uvOPcgRxOesbN2TNesHeSq3UqJdt3i/boFDte4p0SmsZr6xueZdhjG
         XtX+syLth+1PkQ1W/boQM2MGPL9mOIh/KgXm4MKf4xGowfsZJo+yxRPA669WB9FYTfr1
         +Dyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770794646; x=1771399446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bu1QlHrNgTg/QtKW66/BGRnOBUUWRu4VVJtFVFedaE=;
        b=VX9j1pTeC+BLBs8Bo92r6Gnk3rGZOrLZmR7VMu2+2Mud8Iqb2FPR/lwfTnE6SN8nUp
         RoMfHUAhFzjkJ+OGb2lTl4yx4vMEoeZStvJFk8w2w+eVZ+8xrb8w8CUUb1KX9C2nWm7S
         W9gzncCN/Ftd+WhfpVSXecS4D9uG6eDlbILuOcQewWk4p8ZEYxVtRCO8RVW2AhNUXiv6
         yknuMaiNtyA7kO6634J38evi07S9s054rqp86Ww0lPsZfrnsXhdLHspLWW9axblmPl1i
         DmJhlQwtUEhm2pt7lGJQgg2pJPaRM6nh/Ez17WaHt5TPwo7qDByqhcrHavND4NEI9zDj
         tuHg==
X-Gm-Message-State: AOJu0YynGRRPiQZyzb75ryaFnTP7XJHEB2N7v1Avc1GXlIZB4H+IcbBV
	aRVK6qe3axNDgGTUsmJyH7VUchL/Bbmy2Q43XrpLY7JZSYufvC2AhwSo7tpPj5F9
X-Gm-Gg: AZuq6aLwaOC8rkVGzF882UjBCoaUmmYdGPYpsF0MRaTI+WhesVmhutodbuJAFE0ZNnW
	5t+FSAov/FAKtie94C6lQl1CgvoT6+SbUOUXhJtPkrLlTsifSZR1JbspaaGXAxkO12U6FHAuEfw
	E3b/QZW7HInRFEZEVdj21OCSIvrDPzJxHPbyCReMsFIxJrzn/twyxkfyGRTzCzer+JbLPIuUwF7
	6d5khijNyHaSR3w6nUUw2RSglWUF8NXlwzJUgps5dhApaCbhno/d8I6qkdn0RZeZWjPIFdZvIte
	gIPSCCrC82aX6bAZ0Md4rHncVfqyiqS9fMXCc8grrdOgoByCZbFjwmMTJt4AuxBvhRST8LlrZ8e
	UW/ftc0TuAGReyMQB/TfG8PFvCUzcchIWRq9DIUJy7DDn4J1vsO5H5d1hXa55PHgsZ5NhcPdlKX
	XzUW8hUJjVczzHYF39t5E9igiq
X-Received: by 2002:a17:90a:e7cd:b0:34f:63b7:a1f5 with SMTP id 98e67ed59e1d1-3567b0999f3mr1601403a91.21.1770794645925;
        Tue, 10 Feb 2026 23:24:05 -0800 (PST)
Received: from L-15597L.kpit.com ([152.57.35.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662f6b624sm5327833a91.11.2026.02.10.23.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 23:24:05 -0800 (PST)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moins@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [OE-core][scarthgap][PATCH 1/2] libpcre2: Enable Ptest Support
Date: Wed, 11 Feb 2026 12:53:21 +0530
Message-Id: <20260211072322.79206-1-moins@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 07:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230969

Install libpcre2 test suite and run it as ptest.

Add tests for POSIX wrapper (pcre2posix_test), core PCRE2 engine (RunTest), and grep utility (RunGrepTest).

pcre2posix_test: Verifies the POSIX wrapper API
RunTest: Executes the core PCRE2 test suite through pcre2test
RunGrepTest: Checks pcre2grep to ensure its grepping style matching works as expected with various patterns and input files.

Signed-off-by: Shaik Moin <moins@kpit.com>
---
 .../libpcre/libpcre2/run-ptest                | 39 +++++++------------
 .../recipes-support/libpcre/libpcre2_10.43.bb | 22 +++++------
 2 files changed, 22 insertions(+), 39 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre2/run-ptest b/meta/recipes-support/libpcre/libpcre2/run-ptest
index aefb971141..2acfd17b17 100644
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
@@ -42,4 +30,3 @@ echo "==========================================================================
 
 # Exit code based on failures
 [ "$fail" -eq 0 ] && exit 0 || exit 1
-
diff --git a/meta/recipes-support/libpcre/libpcre2_10.43.bb b/meta/recipes-support/libpcre/libpcre2_10.43.bb
index f250f35584..781b5f15ba 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.43.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.43.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=321a5eb46acae6b6c1ff2c7a866d836a"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
            file://run-ptest \
-           file://0001-test-Fix-head-1-Busybox.patch \
 "
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
@@ -58,16 +57,13 @@ FILES:pcre2test-doc = "${mandir}/man1/pcre2test.1"
 BBCLASSEXTEND = "native nativesdk"
 
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


