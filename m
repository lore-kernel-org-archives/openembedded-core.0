Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81903EC01BD
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 10:12:51 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13223.1774258240230940003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 02:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GQJvO30P;
 spf=pass (domain: gmail.com, ip: 209.85.221.175, mailfrom: careers.myinfo@gmail.com)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56739adfa1aso2888730e0c.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 02:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774258239; x=1774863039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lFYKHkBOLsF4gZ8l/DaHqe2007okXS1IPrhFiZ35crI=;
        b=GQJvO30PE+H72b4YuZ4lG7DP+i4S73lBfAl0ELq7wKve7S+Kt6YPP24T7BbR0H8K1r
         N6oJrf8knj4tgnDnzQtYknMaYO+M0ncCh7jRkNeZBOdz/Okz065zHHdL5xgaFTKiZ6QU
         AXll4taAYyGkct57II/UVQ2H3tFPWRWuTdWcXFf6DTMPs6gh2muQZVTmK4ZpTwvG9fgo
         18or5dSL+kXAR7H+iDTHtsYTlL+LlARGXtqtr5DNt5HSRO7J7c32cMUJLH4c0N6LyrMK
         +7b6P5/X9hsebKnxVV1vdTt6BLowfFifaklMEVSmppyMWzdfY1oQVyiiBxypuJUDqOMB
         oeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774258239; x=1774863039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFYKHkBOLsF4gZ8l/DaHqe2007okXS1IPrhFiZ35crI=;
        b=qXT3s9j9wBfNM51LsY0cHyart5bYb1Yz0HgQ06zeTxi44mAPtsV/FxxNHvIIsOyryo
         X7zGBK28s9DtNRQHNkcAsUdOIXBDnhOxN9LcE8I++VMa7mEdUr4ayaMeeDn4+seT9Bny
         9quRPXPaUQ60BS9IYY3f/Kdl/opTa9ZebBAj6VSLCuJQCRRcPHJLDoxtlmFE6M7Ztq/W
         qWoGCD3N3Gh7HdwaVnLUB0zpGOTeL7oXqczhy3KuC3N09HCUcp3ijcytHahHGTqYqTSK
         jspNwBuqVvMR0YlqB5FMKADMNTPkVIZhqdDxheQVhyUsh9w1/3ESsxwnnhuSZ5sooQ1c
         8yqQ==
X-Gm-Message-State: AOJu0YxkBOJ88kzQHBgGb5XdHn/8gL2LOzChkcP+i45+e2cWnyC5bm3d
	O+pWHsMEQuDLKQLBlRZoHwUXY/YJ7Zquf3MSR4Ps9tbX2I29kmycCPtr1r0eBw==
X-Gm-Gg: ATEYQzx5frU9+818XEHhjfe4CvzThnqFuwxAPd4LcmC3+iytJrT23IeoYWUKUOCW36x
	PbrkxKFE8/sErTlQw7qwdNX0+8hiLstfQWHaq+wBzKQ/NzDeVjFoDoduCsIrjZmog0UcZwHu5Hp
	C3xiNS1+0EzseddOu8RdD/lugkX8p6/BR+qXdvg5E8MW+hIUsmUX5+2oMa6WJkmuEpd4di14iwZ
	guYcPT3pWPp4OYs9JFsorRnlk2zysI01dse0m+2opwksyP4t159HEv1O7lndZxo7TdlIU4aOw8x
	JsW8ABX1CTtE4u20HBOX1JgroYsacX79n2kn0rgBgCQ53kEj/eoW1UJ+jbwzojbXdossHeaJ53m
	GcjUmZg0A3d8aeGk1DTGCnlZBy7i+86WQrJcTe5UApmUClDFULiOf/f0MajbWbnQ0uXjrRK2RSw
	yycUNxVMmJslgBo94VjmczKw==
X-Received: by 2002:a05:6a00:428d:b0:829:8c23:f70c with SMTP id d2e1a72fcca58-82a8c3415fcmr9414571b3a.47.1774257787078;
        Mon, 23 Mar 2026 02:23:07 -0700 (PDT)
Received: from L-15597L.kpit.com ([36.255.86.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04220d9asm8479763b3a.60.2026.03.23.02.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:23:06 -0700 (PDT)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moins@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [OE-core][master][PATCH v2] libsamplerate0: Adding ptest for libsamplerate0
Date: Mon, 23 Mar 2026 14:52:10 +0530
Message-Id: <20260323092210.1947308-1-moins@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 10:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233708

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

Signed-off-by: Shaik Moin <moins@kpit.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libsamplerate/files/run-ptest             | 51 +++++++++++++++++++
 .../libsamplerate/libsamplerate0_0.2.2.bb     | 34 ++++++++++++-
 3 files changed, 85 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libsamplerate/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index d0c2c2816c..bf1605e78b 100644
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
index 0000000000..0e2afde1f6
--- /dev/null
+++ b/meta/recipes-multimedia/libsamplerate/files/run-ptest
@@ -0,0 +1,51 @@
+#!/bin/sh
+
+DIR="."
+
+total=0
+pass=0
+fail=0
+
+list_tmp="$(mktemp)"
+
+# Build list of test executables, excluding this runner script
+# Portable: use -perm -u+x instead of -executable
+find "$DIR" -maxdepth 1 -type f -perm -u+x 2>/dev/null \
+  ! -name run-ptest \
+  ! -name ".*" \
+| sed 's|^\./||' \
+| LC_ALL=C sort > "$list_tmp"
+
+echo "----- Executables are:-----"
+if [ -s "$list_tmp" ]; then
+    cat "$list_tmp"
+else
+    echo "(none)"
+fi
+echo "----------------------------------------------"
+
+while IFS= read -r T; do
+    [ -n "$T" ] || continue
+    echo "Running $T"
+    total=$((total + 1))
+
+    if "$DIR/$T"; then
+        echo "PASS: $T"
+        pass=$((pass + 1))
+    else
+        status=$?
+        echo "FAIL: $T (exit=$status)"
+        fail=$((fail + 1))
+    fi
+done < "$list_tmp"
+
+rm -f "$list_tmp"
+
+echo "============================================================================"
+echo "# TOTAL: $total"
+echo "# PASS:  $pass"
+echo "# FAIL:  $fail"
+echo "============================================================================"
+
+# Exit non-zero if any test failed
+[ "$fail" -eq 0 ] && exit 0 || exit 1
diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb
index 819096878b..8a0fe4e108 100644
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=336d6faf40fb600bafb0061f4052f1f4 \
 DEPENDS = "libsndfile1"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsamplerate-${PV}.tar.xz \
+           file://run-ptest \
 "
 
 SRC_URI[sha256sum] = "3258da280511d24b49d6b08615bbe824d0cacc9842b0e4caf11c52cf2b043893"
@@ -18,9 +19,40 @@ GITHUB_BASE_URI = "https://github.com/libsndfile/libsamplerate/releases"
 
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
+    t=${D}${PTEST_PATH}
+
+    #    This lets libtool do any needed relinking and install the right binary.
+    if [ -x "${B}/libtool" ] && [ -d "${B}/tests" ]; then
+        find "${B}/tests" -maxdepth 1 -type f -perm -111 2>/dev/null \
+        | while IFS= read -r wrapper; do
+            bn=$(basename "$wrapper")
+            case "$bn" in
+                *.a|*.la|*.o|*.lo|*.la~) continue ;;
+            esac
+            [ -e "$t/$bn" ] && continue
+            # Install via libtool using the wrapper
+            "${B}/libtool" --mode=install install -c "$wrapper" "$t/$bn"
+        done
+    fi
+
+    #    install them directly.
+    if [ -d "${B}/tests/.libs" ]; then
+        find "${B}/tests/.libs" -maxdepth 1 -type f -perm -111 2>/dev/null \
+        | while IFS= read -r realbin; do
+            bn=$(basename "$realbin")
+            [ -e "$t/$bn" ] && continue
+            install -m 0755 "$realbin" "$t/$bn"
+        done
+    fi
+}
-- 
2.34.1


