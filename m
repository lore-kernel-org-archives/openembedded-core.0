Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEB2F8D753
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 14:48:17 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11342.1776337917410740692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 04:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eKWkgs5s;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: careers.myinfo@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50b69bf5638so84639431cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 04:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776337916; x=1776942716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kJemU0pmhCzcMFJ+uhdpgwCK7hbxRlfPAVlNvLLmFU0=;
        b=eKWkgs5snC5cGXuIznqo4qNqoM5V/3wKnjDcyCYvy3IvVlKJjMn3nSDYOT+of3cvoC
         bRQX7p9mlGJzWHhvRAUFcUi0n0U2hrp3JpauAgMciyQGzlSFpTfvRNrGgW5sYj8ZK75X
         Q8zfj+cA5/CD26x4P+ZOZhaPJAT7Z0NxFP7IHeQwH9/0OS8h7v1dMebajLkFrxuXnWIp
         Yqo4DDw0ex9zadHJ8upnU4nJG1wO904bO0uwwWIDtlhPBfVnuGQjClW5K6Lh0KR0E54W
         DqMOj7Up5/sqPYT5crPK5Im6rpFZYuCjv8JOL/RsrvxiNDMhTMYSP3SUBQ05PhqSmmon
         P0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776337916; x=1776942716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJemU0pmhCzcMFJ+uhdpgwCK7hbxRlfPAVlNvLLmFU0=;
        b=fEJlija0QLnnsiMBITRx9BJXKsMdhwqEELRQwdYG+Ar26AbPbAzJGOqKHWi87U9seL
         xPI1hxETO84x7g8Qo0sRAX0LBTe0vJU+LknEtGBXhlVyssuvBMzPLnSQq0M94VsWBgow
         VdTT8Xmqrqg44yH6ex2+2si/k8DM5Y2TO/w19xCb/SMYgwvDqx9gPDDZrVeT47IDfhes
         EyLu06vMDRGNyjBTnNJXQ6/pgnRdXirGi/89wL/8/hBvZxo547k3OrtqDGXb+hSYWJWo
         xqAa8I1cGZY+QOqlM2BAckdcwiPm49SHvMvx5v7YNs2B5JE6NfSZhOUNXtGIBp6L1A9K
         +aIA==
X-Gm-Message-State: AOJu0YwfSVBfzOBoUDLSoAON7k9Gv0JYOozSgEH8CxEdTno9QwLEgyto
	TvRbyTCzYoMt0j1YRg/iKjEKD7wFCRYB44Fuyx75Y776uJmWeGit0dLLmjvjjQ==
X-Gm-Gg: AeBDietG4lVNHQ2YZJZv5B0yX+7if98JI7tMZ7rMK0I5+vENP/AN83QSYO6Im/Xso/m
	rsIicuKYiflPRr3fl2zH25VKRQPhrVdHhDYrKecFxe4j3v4VTHa7ilrdWwZLSCKSC7/DAWdziQg
	WiJr6QhWwfty5Tst+9smyqVomS0u/H/4BU4JZQijU5tZhHf2Nrn3rjMbQhz2pUjiEcXNQq+aZ6C
	3CT47TwVgX/tD2VDBaT4HzuRhrZoFfRiVw4P6+a8LpLdDayDCwaFVnt00CWLYr/xSH+9Ms34JPJ
	L8R9CrLJaEY9am/KC3y+UPjyxF1I35E3qZE6GK8C2jCrneUVk2Mk8H08tASQO3W8Oplw7yIl48E
	IX/AHZ4sBnCBaGf9irqDC8qutxyBTixgSv/qX1ot3TLzWj5NqnseabgLWLjhZjD2gJZd0ePfpMR
	3QRlBhQSBkEM6Qh+vZ9Mtr4WZUwaOuGHfwdtnrrq25uEWkxA==
X-Received: by 2002:a05:6a21:6d83:b0:398:e2b9:cce4 with SMTP id adf61e73a8af0-39fe3fe0240mr27468289637.40.1776337587778;
        Thu, 16 Apr 2026 04:06:27 -0700 (PDT)
Received: from L-15597L.kpit.com ([49.205.102.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79581d6341sm4093760a12.30.2026.04.16.04.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 04:06:26 -0700 (PDT)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moin.shaik@partner.bmwgroup.com>
To: openembedded-core@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [OE-core][master][PATCH] libsamplerate0: Adding ptest for libsamplerate0
Date: Thu, 16 Apr 2026 16:35:25 +0530
Message-Id: <20260416110525.1048871-1-moin.shaik@partner.bmwgroup.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 14:48:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235409

From: Shaik Moin <careers.myinfo@gmail.com>

Executables Description:
 callback_hang_test		-	Verifies that callback-based processing does not hang and that the library properly returns control without deadlocks.
 callback_test			-	Tests the callback-driven processing mode of libsamplerate (SRC's non-blocking interface).
 clone_test			-	Ensures the SRC state objects can be cloned correctly and continue producing identical output.
 downsample_test		-	Tests accuracy and behavior when downsampling audio (reducing sample rate).
 float_short_test		-	Tests conversions between float and short integer sample formats.
 misc_test			-	Runs assorted sanity and utility tests that don't fit into other categories.
 multi_channel_test		-	Verifies correct handling of multi-channel audio (e.g., stereo, 5.1) during sample-rate conversion.
 multichan_throughput_test	-	Measures throughput and performance for multi-channel SRC processing.
 nullptr_test			-	Ensures libsamplerate properly rejects or handles NULL pointers and invalid state.
 reset_test			-	Tests the reset() behavior - state clearing, flushing buffers, resetting filters.
 simple_test			-	The most basic test of sample-rate conversion functionality - often converting a small buffer to ensure fundamental correctness.
 snr_bw_test			-	Measures Signal - Noise Ratio (SNR) and bandwidth performance for different converter algorithms.
 src-evaluate			-	Evaluates internal SRC filter performance, quality, and algorithmic behavior.
 termination_test		-	Ensures end - stream / termination behavior is handled correctly without artifacts or crashes.
 throughput_test		-	Benchmarks throughput for mono or simple use cases to measure raw processing speed.
 varispeed_test			-	Tests variable sample-rate operation (changing SRC ratio on the fly).

Time taken to execute the ptest:- Approx ~3 mins

Signed-off-by: Shaik Moin <careers.myinfo@gmail.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libsamplerate/files/run-ptest             | 47 +++++++++++++++++++
 .../libsamplerate/libsamplerate0_0.2.2.bb     | 16 ++++++-
 3 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libsamplerate/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 11a894accf..b5b536bb92 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -127,6 +127,7 @@ PTESTS_SLOW = "\
     libmodule-build-perl \
     libpng \
     ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'libseccomp', '',d)} \
+    libsamplerate0 \
     lttng-tools \
     lz4 \
     openssh \
diff --git a/meta/recipes-multimedia/libsamplerate/files/run-ptest b/meta/recipes-multimedia/libsamplerate/files/run-ptest
new file mode 100644
index 0000000000..9fc9739b7c
--- /dev/null
+++ b/meta/recipes-multimedia/libsamplerate/files/run-ptest
@@ -0,0 +1,47 @@
+#!/bin/sh
+
+set -e
+
+TESTDIR="$(dirname "$0")/tests"
+
+total=0
+pass=0
+fail=0
+
+if [ ! -d "$TESTDIR" ]; then
+    echo "(tests directory missing)"
+    exit 1
+fi
+
+echo "----- Executables are: -----"
+
+for t in "$TESTDIR"/*; do
+    [ -x "$t" ] || continue
+    echo "$(basename "$t")"
+done
+
+echo "----------------------------------------------"
+
+for t in "$TESTDIR"/*; do
+    [ -x "$t" ] || continue
+
+    name="$(basename "$t")"
+    echo "Running $name"
+    total=$((total + 1))
+
+    if "$t"; then
+        echo "PASS: $name"
+        pass=$((pass + 1))
+    else
+        status=$?
+        echo "FAIL: $name (exit=$status)"
+        fail=$((fail + 1))
+	fi
+done
+
+echo "============================================================================"
+echo "# TOTAL: $total"
+echo "# PASS:  $pass"
+echo "# FAIL:  $fail"
+echo "============================================================================"
+[ "$fail" -eq 0 ]
diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb
index 819096878b..52ff7f313d 100644
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=336d6faf40fb600bafb0061f4052f1f4 \
 DEPENDS = "libsndfile1"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsamplerate-${PV}.tar.xz \
+           file://run-ptest \
 "
 
 SRC_URI[sha256sum] = "3258da280511d24b49d6b08615bbe824d0cacc9842b0e4caf11c52cf2b043893"
@@ -18,9 +19,22 @@ GITHUB_BASE_URI = "https://github.com/libsndfile/libsamplerate/releases"
 
 S = "${UNPACKDIR}/libsamplerate-${PV}"
 
-inherit autotools pkgconfig github-releases
+inherit autotools pkgconfig github-releases ptest
 
 # FFTW and ALSA are only used in tests and examples, so they don't affect
 # normal builds. It should be safe to ignore these, but explicitly disabling
 # them adds some extra certainty that builds are deterministic.
 EXTRA_OECONF = "--disable-fftw --disable-alsa"
+do_compile:append() {
+    oe_runmake buildtest-TESTS
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    for t in $(makefile-getvar ${B}/Makefile check_PROGRAMS); do
+        [ -x "${B}/$t" ] || continue
+        "${B}/libtool" --mode=install install -c \
+            "${B}/$t" "${D}${PTEST_PATH}/tests/$(basename "$t")"
+    done
+}
-- 
2.34.1


