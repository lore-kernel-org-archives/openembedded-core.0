Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD99D2ECF9
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 07:46:02 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1766.1768894814072369604
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 23:40:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XMqOvH30;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: careers.myinfo@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c0ec27cad8cso2114637a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 23:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768894813; x=1769499613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VW7G1722bn7cwVQzlHUVuBJA+wQF4wAvC8epHpy9CKE=;
        b=XMqOvH30SrCucwwlwvEByWptI1unTPMsI35nEix4ISZsshwqRIx2sJ8XIVj502+eQG
         qf2y3Zy2uRpx7cyANkXzxBFr1NaobnbSN8paE/eoguBgHSSnoxeStY6Fr6S4//wJiw4L
         rvwWdBa5WDhofBsob0+Q0ngl+eK07YXvK3yBW7ZftMNWhrCi/NwlLsd8RgZIjVk/Asim
         Un553dcsu/Xa8WbMEeTNJOKOztED0LMCBEK9/OZ2XO38hcIvbQ8hJZLSnmfMvNyLRO+k
         Kc6TdlvRHnHEJSs59ldU4r8xAnwKYn9wtXIVvmZSLmtbzgPERd8ABLEO/UJBZnDMRsVk
         qdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768894813; x=1769499613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VW7G1722bn7cwVQzlHUVuBJA+wQF4wAvC8epHpy9CKE=;
        b=hr1VEUAYvm68iAnMU4lyciDGB5OBZ/w2fTqEdmdti4aSHsm4YLQ9jGOIZbePPmAIsG
         +NiFOpcf9lddVikVknmYXDAGu0hrO91DIjJbC9aC4FEMdet9HNNPKquUmNch/6Uti+9k
         HHa3ra2hNl9RWSiA416V8d09owjaOIH9W4Rb7eF5sEtBRkrtNNe4SOflV+ve+vkdbIWu
         tbFzg3ZtuLVFklESPgleRWMCDGveYNmiQd6/fKe7MUy6ziVGlsNZzLyhjwwNx4U8xQY3
         1QaqQsZgngW4/M1+xoCxJEWHsNj0o70/e38Hsss64mP8myZW/02U02Sh0Z6nbCY1emPx
         VWsA==
X-Gm-Message-State: AOJu0Ywnubi/6dlex1P8l7V61COS5Gv2ewyGAmt0wa4vbt/Uw6xRaT4f
	etEGrV8+pWXJly5pHXSzLpoYYBu2erV8ZjKUoKWSjTf8T4Nh4zN9Vf26q9ROFQ==
X-Gm-Gg: AZuq6aJOjvCEPuWoSClFQPq9F+pXsRY6f9tAnBYfCKEFGC/YdJ9KTlWKTZaMeo/k4UQ
	Ey6a4N0FlqB5KzBqdwWpPNfmGX4mJ09yFRMzQUGqrsyY6hmrckCwP1jvLgvLDdsqKjPX90opbF+
	FzsHSRYqBDDqATfjEc5SMNyHVQH0VTYjZWFwSHGGviC613I5iUkVrIqjAYrFaCGT8fgqP7jiMsD
	drSXLfcyvN46d8p1cSzK3ZfDQb88vMVWav/hdZPZW6gNn1KVUiteklrWtxYGRVrGh2IPZUjJsFl
	KphgPZIzpn5zlkoXZ1UYn00wDbRfNB3bwe7zX+vfWZJC+8tzcxRA8r5QkwewzjsKoLfzF3Ra5Yz
	V2R0B+wQvtTOnFXltpaIMqOoR1f3fYfAEDNGyspjfsNOQ1dMtCUvsbbDMVMk9r+2FriYMH2gb+n
	2tnZOW9lohsA==
X-Received: by 2002:a17:90b:17d0:b0:32e:3829:a71c with SMTP id 98e67ed59e1d1-352c3e6ce74mr1027382a91.16.1768894812891;
        Mon, 19 Jan 2026 23:40:12 -0800 (PST)
Received: from L-15597L.kpit.com ([36.255.86.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352c150faa1sm1186684a91.7.2026.01.19.23.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 23:40:12 -0800 (PST)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moins@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [OE-core][master][PATCH] libpcre2: Enabling Ptest support
Date: Tue, 20 Jan 2026 13:09:23 +0530
Message-Id: <20260120073923.508721-1-moins@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 07:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229645

Add tests for POSIX wrapper (pcre2posix_test), core PCRE2 engine (RunTest), and grep utility (RunGrepTest).

pcre2posix_test: Verifies the POSIX wrapper API
RunTest: Executes the core PCRE2 test suite through pcre2test
RunGrepTest: Checks pcre2grep to ensure its grepâ€‘style matching works as expected with various patterns and input files.

Signed-off-by: Shaik Moin <moins@kpit.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libpcre/libpcre2/run-ptest                | 44 +++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.47.bb | 21 ++++++++-
 3 files changed, 64 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index fff2947177..66fc15daf7 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -34,6 +34,7 @@ PTESTS_FAST = "\
     libgpg-error\
     libnl \
     libpcre \
+    libpcre2 \
     librsvg \
     libssh2 \
     libtest-fatal-perl \
diff --git a/meta/recipes-support/libpcre/libpcre2/run-ptest b/meta/recipes-support/libpcre/libpcre2/run-ptest
new file mode 100644
index 0000000000..d7c79827bf
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/run-ptest
@@ -0,0 +1,44 @@
+#!/bin/sh
+
+echo "START: ptest-runner"
+date +"%Y-%m-%dT%H:%M"
+echo "BEGIN: $(pwd)"
+
+# Space-separated list of test binaries
+TESTS="pcre2posix_test RunGrepTest RunTest"
+
+total=0
+pass=0
+fail=0
+results=""
+
+for T in $TESTS; do
+    echo "Running $T"
+    total=$((total + 1))
+    if ./"$T"; then
+        echo "PASS: $T"
+        pass=$((pass + 1))
+        results="${results}\nPASS:  ${T}"
+    else
+        echo "FAIL: $T"
+        fail=$((fail + 1))
+        results="${results}\nFAIL:  ${T}"
+    fi
+done
+echo "============================================================================"
+echo "Testsuite summary for PCRE"
+echo "============================================================================"
+
+if [ -n "$results" ]; then
+    printf "%b\n" "$results"
+fi
+
+# Summary with per-test details
+echo "============================================================================"
+echo "# TOTAL: $total"
+echo "# PASS:  $pass"
+echo "# FAIL:  $fail"
+echo "============================================================================"
+
+# Exit code based on failures
+[ "$fail" -eq 0 ] && exit 0 || exit 1
diff --git a/meta/recipes-support/libpcre/libpcre2_10.47.bb b/meta/recipes-support/libpcre/libpcre2_10.47.bb
index 2ac249f05b..e2aa998aab 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://LICENCE.md;md5=6720bf3bcff57543b915c2b22e526df0 \
                     file://deps/sljit/LICENSE;md5=97268427d235c41c0be238ce8e5fda17 \
                     "
 
-SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
+SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
+           file://run-ptest \
+"
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
@@ -28,7 +30,7 @@ DEPENDS += "bzip2 zlib"
 
 BINCONFIG = "${bindir}/pcre2-config"
 
-inherit autotools binconfig-disabled github-releases
+inherit autotools binconfig-disabled github-releases ptest
 
 EXTRA_OECONF = "\
     --enable-newline-is-lf \
@@ -56,3 +58,18 @@ FILES:pcre2test = "${bindir}/pcre2test"
 FILES:pcre2test-doc = "${mandir}/man1/pcre2test.1"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_install_ptest() {
+        t=${D}${PTEST_PATH}
+        cp -r ${S}/testdata $t
+        for i in pcre2posix_test pcre2grep pcre2test; \
+          do cp ${B}/.libs/$i $t; \
+        done
+        for i in RunTest RunGrepTest test-driver; \
+          do cp ${S}/$i $t; \
+        done
+        # Skip the fr_FR locale test. If the locale fr_FR is found, it is tested.
+        # If not found, the test is skipped. The test program assumes fr_FR is non-UTF-8
+        # locale so the test fails if fr_FR is UTF-8 locale.
+        sed -i -e 's:do3=yes:do3=no:g' ${D}${PTEST_PATH}/RunTest
+}
-- 
2.34.1


