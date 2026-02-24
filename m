Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 413F8EFB7EA
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 02:43:57 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11497.1771899085065589794
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 18:11:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Eg/b+o0v;
 spf=pass (domain: gmail.com, ip: 209.85.221.172, mailfrom: careers.myinfo@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5670ea44187so3865520e0c.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 18:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771899084; x=1772503884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ugZUslND27t+z14m9o9G17YNgPryqr2dAOueUv/ZaA0=;
        b=Eg/b+o0v8QMLwWaG/B9SEZd4z5GPso2w9EtXFpO87LUIn1QFP8itGe/zoG/leiib/o
         j+aiKmM2fyrCOCWx7J9eSlHZiroYHdOFibEdyb5grZTF1nkderkMGtUhtIFSUkeOOEY2
         io3LHWd9eQFL2ayTvLukmXn9cy5UkbzUeWssXK0bxFMAN1q+IrnEzIFoAD56J3/ZPmg2
         M1ewircaXdFKJtOut3BWdHya1k8cwZMDotOqrvV+hFJrsmdbyzW98wxLYGjU/sslGwIS
         IMZkkPKjnhcPxpbI++hKq8koS8j6/GKM/aP9saPpjNbtELMf1g0fRh1aRd4lxFK5A1ya
         FiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771899084; x=1772503884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugZUslND27t+z14m9o9G17YNgPryqr2dAOueUv/ZaA0=;
        b=lL1qfOL0iz/fvQyfMYZwskQjbj4qnNl3AHm2w1uCxWXVdWIxDjMzlqCFpBm/BGMYOI
         rVZU05A3RcKnbog3eA+rVDG5PYeySCLXMo0XQmot6rngVB5aayMCak6J/fsncZMJi2FT
         kNMA4ya5mWglnmXcyEQGSQEOllnmB0s6sojsyr5R+EICteycOCPCp9N4POa+YiO2MdWy
         D2mEVI/3LDBFEF37cRGs6RiUDOxdOrfXDWDEsqIBI8tHT9Jya+XaW2+5+8d8WYVUuqbB
         7M1Zz9aBp6ZntKxd6z1K0Grdf4ym/06DGm21hyGlIS1Gyn+jxBAVsGonpRfLeryRwRk7
         5pcg==
X-Gm-Message-State: AOJu0YwYZZW4vzthDHFCcaWPAtTKAcYU4FyV2nRy6l7XzDTcT+yMTno5
	SMEMdjN4W8Qb/UTxDnNQHqAD6P0iLiUE4M4zuKiKZITeVSlbfQNtssuXHwHrTqxc
X-Gm-Gg: ATEYQzzkc5T9UfgK2GghLidvsMQ8TCLGizm7d76Vx6fhEHB5zjBs+m+YbTrtWKKKR4o
	yzzgn6CMjz/Zt4neYtKZHnzsj5Zkvdyeo20upKYAOM7R1AQGGVHvM3C6B2A8p/GYu96HA42EZeY
	+QyCSBKv2/OrVmvkBWgVKH3QxZkh8jNJFMPD0dN9zGxj5soF2mLINS642kncryV1bRL0s5IE20X
	YfM+Nbys9wRxPICc44Iy1CuE3AM5KwEmZ5KijxLZQc4HmrebJCcHBeI7hwTLVlJDr2NAsn3KUqn
	FyUc9DzFwRIbcsWgMpwUD32yyMI2TsqYYETCa5Wbm95g9wNoB/u4/63EJWR4Hv8A/xCA7o82yFi
	pJS3HXCyumlZfPLhAaEbpEIWUFQAVoY+DmYflaz1db9fSMG8jGv0hNo4gGFdTi1FMfOdBQuIGP/
	+5H8ito120BfLUqRtzfP8soUKEbfIsEdwx
X-Received: by 2002:a17:903:1aa6:b0:2aa:d60c:d48a with SMTP id d9443c01a7336-2ad743e3993mr100572765ad.7.1771898647098;
        Mon, 23 Feb 2026 18:04:07 -0800 (PST)
Received: from L-15597L.kpit.com ([36.255.86.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7502abc2sm87207095ad.73.2026.02.23.18.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 18:04:06 -0800 (PST)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moins@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [OE-core][master][PATCH] libsamplerate0: Adding ptest for libsamplerate0
Date: Tue, 24 Feb 2026 07:33:11 +0530
Message-Id: <20260224020311.167778-1-moins@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 02:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231734

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
index 80414f1cb8..922c341b30 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -122,6 +122,7 @@ PTESTS_SLOW = "\
     libmodule-build-perl \
     libpng \
     ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'libseccomp', '',d)} \
+    libsamplerate0 \
     lttng-tools \
     lz4 \
     openssh \
diff --git a/meta/recipes-multimedia/libsamplerate/files/run-ptest b/meta/recipes-multimedia/libsamplerate/files/run-ptest
new file mode 100644
index 0000000000..bcbe4db7ff
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
+  ! -name "$(basename "$0")" \
+  ! -name ".*" \
+  -printf '%f\n' \
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


