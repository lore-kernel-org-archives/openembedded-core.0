Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF10D2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 07:46:52 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1821.1768895121930818607
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 23:45:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LPV31mlw;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: careers.myinfo@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c532d8be8cso481916885a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 23:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768895120; x=1769499920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7RINxvXUOkA6zCn8uI0y0AgjKcGE+1r5lEfk2eE8thU=;
        b=LPV31mlwyh4o+HlZ1+AcoEjBe6MwmkiCSXNo2Fkngyh/pk4TYg1vijdC9bevMJNz5C
         FMItRL9STPDqTA5Q9ihG4qvElL+Vaz4kR12DswHX6NCK8YRgK+lqQUazId9FknIadqgp
         2umTo2/frR10wbZCpkQeNLngSaeP3tQX4RNtuQgzMvMJWGPlbBgJfmkRXSd/OB78zMKh
         FN4kZTrzvDc99Ae71M5mSeIkBOqZdl8XBcX3aGQEw82FufJ25+xbQWm31Yj/wdWBUksE
         4JFDScYzcA0c9Qbwo57/YUqLbSMPMFNmxbVOi/+V7tJpTtJG6r1Y13XiXz81mA2ecRt3
         Or/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768895120; x=1769499920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RINxvXUOkA6zCn8uI0y0AgjKcGE+1r5lEfk2eE8thU=;
        b=nFm0o+foq2m0WRyMMv9mR3sNBUG+AJdI/durEOqyReJjo+/5USJBzl+dyMUjWNjljq
         bRcKoXYwSJol25Erf//5EYIPI4quR9MTw2bONZKAL8b432DMVefO9jZuEkhfl6kUg9rU
         0enO10S52z2kuwMVYyJFEYbnTDtv1FfoA67pAoXEHIaOx9f/PAGyANdXlG11xbU3yc3U
         MrdZsBc2wCXuTLcpjwvENeWKR+WqFzJzZLJ3dRgYu8QrtGxGhAymyngyAtuIUfwRpnSs
         lWvMlXVQFrC/ygsPHaNDsZLpvssh0Zo+KWHmTus98tws8hxO2/DuRBsSjiNxCoYJPOeu
         T7Ng==
X-Gm-Message-State: AOJu0YyV3wiGI6V36Awjz0UHLOcaVISPwTopwwxlSGz/HqRrP/Tr0+4b
	WIoHvtZrovhoMODuzhXY7AaLgkWBYzXxyiidqVHIr38G3LiGXdtvHaFy9iVH0w==
X-Gm-Gg: AY/fxX5oc5OcUc0bG/xhoCIg1aEx44jL6lJUW5F3hC9sicCEG2iXjoGgO6nLTEVoOMr
	bGcWCl0bHEwJr+5GuiNowIvbNZilU8YHIywH1zTGhucNI4lvjvtxoy1C5zYzEZWjwZYkisVTejE
	uWlOYHoxiqZFN4WOf6NJSdM7ZNUTuNeT+icgNbz7BBjzgbIhqWgfUSg/RcD0YRbqDiNQllzlKsC
	t5cwl2VGTk42qEC4BccKfAVZmmYtYCvf9NddkqGRXbC4HztwZnKAgjr72GRisLP1bBN3RQqz6Jh
	Ds0S+no7/EcywXMvFnhaxn7lBTle5A6g5kRYwfnpsDflxpFVJtYiLtN3HghBMu66NT5/lBsMJW3
	zHYfmPXzFAmX0aZJVZE3cmAjpnM8rizg5DezovHWUHyi/ccp9o15Cx7peKut6SxipcRpVL5iCgC
	RA6/y9WVXOEQ==
X-Received: by 2002:a17:902:d503:b0:267:a5df:9b07 with SMTP id d9443c01a7336-2a7175189a1mr109585455ad.12.1768894717992;
        Mon, 19 Jan 2026 23:38:37 -0800 (PST)
Received: from L-15597L.kpit.com ([36.255.86.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fb998sm116018645ad.69.2026.01.19.23.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 23:38:37 -0800 (PST)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moins@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [OE-core][kirkstone][PATCH 1/2] libpcre2: Enabling Ptest Support
Date: Tue, 20 Jan 2026 13:07:57 +0530
Message-Id: <20260120073758.508608-1-moins@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 07:46:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229648

Install libpcre2 test suite and run it as ptest.

Add tests for POSIX wrapper (pcre2posix_test), core PCRE2 engine (RunTest), and grep utility (RunGrepTest).

pcre2posix_test: Verifies the POSIX wrapper API
RunTest: Executes the core PCRE2 test suite through pcre2test
RunGrepTest: Checks pcre2grep to ensure its grepâ€‘style matching works as expected with various patterns and input files.

Signed-off-by: Shaik Moin <moins@kpit.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libpcre/libpcre2/run-ptest                | 45 +++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.40.bb | 18 +++++++-
 3 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 53c023bb81..3df4c5db10 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -29,6 +29,7 @@ PTESTS_FAST = "\
     libnl-ptest \
     libmodule-build-perl-ptest \
     libpcre-ptest \
+    libpcre2-ptest \
     libssh2-ptest \
     libtimedate-perl-ptest \
     libtest-needs-perl-ptest \
diff --git a/meta/recipes-support/libpcre/libpcre2/run-ptest b/meta/recipes-support/libpcre/libpcre2/run-ptest
new file mode 100644
index 0000000000..a227cdec29
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/run-ptest
@@ -0,0 +1,45 @@
+#!/bin/sh
+
+echo "START: ptest-runner"
+date +"%Y-%m-%dT%H:%M"
+echo "BEGIN: $(pwd)"
+
+# Space-separated list of test binaries
+TESTS="RunGrepTest RunTest"
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
+
diff --git a/meta/recipes-support/libpcre/libpcre2_10.40.bb b/meta/recipes-support/libpcre/libpcre2_10.40.bb
index ba5f8cff32..8aec420d4a 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.40.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.40.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=41bfb977e4933c506588724ce69bf5d2"
 
 SRC_URI = "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
     file://CVE-2022-41409.patch \
+    file://run-ptest \
 "
 UPSTREAM_CHECK_URI = "https://github.com/PhilipHazel/pcre2/releases"
 
@@ -30,7 +31,7 @@ DEPENDS += "bzip2 zlib"
 
 BINCONFIG = "${bindir}/pcre2-config"
 
-inherit autotools binconfig-disabled
+inherit autotools binconfig-disabled ptest
 
 EXTRA_OECONF = "\
     --enable-newline-is-lf \
@@ -57,3 +58,18 @@ FILES:pcre2test = "${bindir}/pcre2test"
 FILES:pcre2test-doc = "${mandir}/man1/pcre2test.1"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_install_ptest() {
+        t=${D}${PTEST_PATH}
+        cp -r ${S}/testdata $t
+        for i in pcre2grep pcre2test; \
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


