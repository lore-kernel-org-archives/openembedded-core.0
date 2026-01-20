Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC568D2ECF9
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 07:46:22 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1798.1768894958238245545
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 23:42:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XZk6DPeX;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: careers.myinfo@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c5349ba802so473494685a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 23:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768894957; x=1769499757; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VVlnHxeyl9VgP8DHJtvcw3YzIXgmd4SntrIsn5/dt1E=;
        b=XZk6DPeXE2OP1c8SmKerZrddQndG03NLQfNHSY+3hxLkBKqQYawH7Di3cVxNcwzDbR
         vHWm5sYu2S0uGQU1/9J4WmA1lP70ehaiz1fcpgZbr/Exi/K/mltf0PZenC3SNroGaLML
         IY5MBbs+U9HjTY3yuasjk9QngjkJAzc80H+pQpmI/uTaqg2+UBiK9kbBKbyt3YRdItny
         s+3xTkDrOPGmJ20cR/B7/vnPaehnHDeD6jR2mSO1bzmhMaWzJcIL1AR1i4MRNoCi1tjq
         kOgnYRjMlNGsse4bwADHMQktVttearj5iHW6aBGuVeEsfATTA02/PwQOPxSqM8U4oE78
         z65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768894957; x=1769499757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVlnHxeyl9VgP8DHJtvcw3YzIXgmd4SntrIsn5/dt1E=;
        b=B4TE3ktik74L4fIZUA7H7ukbWN3g4NV9/54SJBaacAYxsgIjaTubKg0MVLG/RYdqA+
         hj8kZ0IM2vLxnNpD2fVOLS8sS2r+yuK5sw2aug2ddTrnhL/b/5ykKnpAfovm4ttJB3b0
         RiKq5PVwQr/yjJZwbWUTF+AoujpYq6gnqimK6qvCGBRl3VH/zgLkwYjnmX1uFOLOfyGY
         rZIrOGonCrRgCxKB06VE+ih1Md07/9zk5+td0QwFaCuaECGl/Pguershc582aSPcNcQl
         jNtEqt5OsxjAM0EOevFaFjAr/hPMVH+MepNsNtzSRrvE+yn6JJRJM4shD/PSuj8/qvvy
         JIGQ==
X-Gm-Message-State: AOJu0YzRaSDV3S/Jr6NNI9PDNA+G7b3zgwxl+VpF+z4O12HePALtOFPz
	LXLFF2drAE+OTB9khdaVzDgfcJDSsUcffrwNnoQuwKyy0zWz3DUExaKKT1xGNg==
X-Gm-Gg: AY/fxX45mfbYhg/8V+AxAnv1V29eIYjUF4ddBCIKPrBKR20zfgKIACIvyustdSxl7pE
	yJY5b+ltUNLq63Hb8rUCEBVlKA/OGrV7RdjovYp4YDyB4BQ7ves7pIOWH0UNNNIaVu2CwGPo1EF
	FA/5ZZTF3BhjUJkvHPHgnQNlm+Yx+EB7wc6paGe8rdLKyZkSsrP3zG+NBaTu5rAVjkdLqTetNH0
	XClmrwrG/3fQ3dB2AumW4I5jYWRD4jvISRPRLQmjWVdhmvCoAGnDUjg8V/xFUHbwb+IX1kifoFE
	r0qkTNJVy0U14yw3mppc3+6Pylo+5Ir4gHKJMbb8q0gc3EINGKxydWfVE0vCWilOWob3PMiPwUo
	OOTzxsoPGCOuz7FWnaqq/59t3JtOfoQ3H58z4xlXVER6DFyUcclxH2MP9UHkatLMGpOZzBAta0X
	+bWxMSzzzzMFld93+s/ugD
X-Received: by 2002:a05:6a00:f9a:b0:81e:63b9:5830 with SMTP id d2e1a72fcca58-81f9f6abad1mr12400599b3a.18.1768894634738;
        Mon, 19 Jan 2026 23:37:14 -0800 (PST)
Received: from L-15597L.kpit.com ([36.255.86.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa12b51d9sm11120070b3a.65.2026.01.19.23.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 23:37:14 -0800 (PST)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moins@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [OE-core][scarthgap][PATCH 1/2] libpcre2: Enable Ptest Support
Date: Tue, 20 Jan 2026 13:06:31 +0530
Message-Id: <20260120073632.508451-1-moins@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 07:46:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229646

Install libpcre2 test suite and run it as ptest.

Add tests for POSIX wrapper (pcre2posix_test), core PCRE2 engine (RunTest), and grep utility (RunGrepTest).

pcre2posix_test: Verifies the POSIX wrapper API
RunTest: Executes the core PCRE2 test suite through pcre2test
RunGrepTest: Checks pcre2grep to ensure its grepâ€‘style matching works as expected with various patterns and input files.

Signed-off-by: Shaik Moin <moins@kpit.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libpcre/libpcre2/run-ptest                | 45 +++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.43.bb | 21 ++++++++-
 3 files changed, 65 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 9950e46776..b7393a7c65 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -31,6 +31,7 @@ PTESTS_FAST = "\
     libgpg-error\
     libnl \
     libpcre \
+    libpcre2 \
     libssh2 \
     libtimedate-perl \
     libtest-fatal-perl \
diff --git a/meta/recipes-support/libpcre/libpcre2/run-ptest b/meta/recipes-support/libpcre/libpcre2/run-ptest
new file mode 100644
index 0000000000..aefb971141
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
+
diff --git a/meta/recipes-support/libpcre/libpcre2_10.43.bb b/meta/recipes-support/libpcre/libpcre2_10.43.bb
index f744df88fa..57c4f0d0e7 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.43.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.43.bb
@@ -10,7 +10,9 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=321a5eb46acae6b6c1ff2c7a866d836a"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
+SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
+           file://run-ptest \
+"
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
@@ -26,7 +28,7 @@ DEPENDS += "bzip2 zlib"
 
 BINCONFIG = "${bindir}/pcre2-config"
 
-inherit autotools binconfig-disabled github-releases
+inherit autotools binconfig-disabled github-releases ptest
 
 EXTRA_OECONF = "\
     --enable-newline-is-lf \
@@ -53,3 +55,18 @@ FILES:pcre2test = "${bindir}/pcre2test"
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


