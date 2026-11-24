Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12354.1795500833135583083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:13:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jls8Ml+H;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33fb4680717so11048952eec.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 22:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795500832; x=1796105632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q6cX9n55cV318Xvx+Yk+L8Y2fApFMZUoPovhpq/P8ss=;
        b=jls8Ml+H7oQ+0QyeHuTwrV6Fn8ecq9ZXN+Hjsoa+eaz3IPfVoI5muN95zCzcbWAO/Y
         +OK7cMIwtRBaBDrz5xfDfvitshmlEnY3NENv5AYpBxb2nSjwmfLAcF6u9Dp/qL4CDyHu
         byNFaK0ixKBQKRTP1RP+BZy8Rt/xt8iIp4VCyW9FNuog61KIyQVCOm2RtHsPCbKMo5yL
         H39MTmaITLQo22czbWFKt1Bj9R1ZOfKOalIpTnig6bbTEzG2bFP5PICod5uCXOBjbIXi
         wrLqfSySBFWbLz9Ue9EDPM/S2r9IbdrYLFyuBxyouOm4ernEZ8rUCmZxg62FubaEpsOL
         DSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795500832; x=1796105632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6cX9n55cV318Xvx+Yk+L8Y2fApFMZUoPovhpq/P8ss=;
        b=EULMPkobaCsOmY8jjxXkb/x6xUxgKct9l70IdRYnbKq33nXi5dpD+aThw6TJEsCLsS
         nlNnaZ+eG7b5Oe92rdLcLkAziPbE+7/q+e+o3+a5CFFFtp4b013M30Da7uNlrfvqDMWo
         PgFPNvBS+IJDBfFSdRJqf4/AWKwA3I5BDSGSQ4jjmPLq6TR2do/eCAgcdydgQb5MnfE2
         r7zRLJIV/pkaaRXfv2C56sCUjdFhbqIN+SFBL8uX5iAgPXZy8gS3aXUL3wrTe81EJQuD
         FRWTiTfeULIf5c9Tb3r38cyM3wpLXNNf/YW3LrO1BJAoIqw2BEpIY84t648EIq0f3iCv
         0cCg==
X-Gm-Message-State: APuU4Z8xHJQXMVlRwiud03bs7JZl/lFglHKNKpTfvG85wJs6b4/CYSNl
	ALGZ1iJJpxCHva/0lbyVnuAjXno0E5VPR9Tq5wDYty03LizOa+FXXtJ7MpYdyfRm
X-Gm-Gg: AZFdTZdp5+hrVNWcz0sQkzYGrFCO18wmmTy1DolqlW5IsmmH7ApS/q/oxryi+AHs+3R
	ImzYWupsS6z4H6TKyLLe7bKUjNkySmZyX0wDwGKYFoYOCdD+iPavHYzbXdfwMKO3h8OLSVSJfY3
	RYN2deg6evqyRDQBLAdr7dxG8Swt+JxrrU3Fo+J65I+tdJ0q1cxVZ2CmzCaOqdkmHWXQmaIsPGC
	fcqSC6gmxC+WYrkMppz7JXTUNI/eIF+NVoIVg70rAGN967KT4dC2UAk1SS14aTK6WHGb6xCo46S
	Vk3W4alLxAb9anG7FNPx2HySW+K9I9N17KByDcmY5V9+soJN504J9B7bbU88W4G1VIod2LehpOV
	dAyVccuUjIivZkd0IhQ7DG7jORteD5WuVy9SJCaeIPz3wEqNsUv9/d4yws16x4dBfqC6jCYE0uz
	FgYy6qE7jsf8Sf9W1Q/GRikiuo80Zh/tcm19PH8uXvq2nmvvrgo8zWx2ycVdurS4xSVOUoubVn7
	RwUa7aTgPETuYmWxd7Y+5rAAr8lyoR0DwKHO1mqgetMn9jNfkJ9aJY6lvQ8nsfkJ6r/AwyQVSR7
	UwBubG7vmEyNxvAwXEBeubpeyMvTDiwfGog4lE6crNFaFDTUECamnZxT3H3OeWsTScF8WHRkasa
	AcDHJ/IFCrCmw9KyoJrbQCLUCUBsbofs2L5fATg00F7PY/Q8g72wfr+BkY/fxnal4hPkH3Fjlc2
	ZC8fhCZOn1LCfiejTWxV/367ncAnTbWbh6HYC1xq0CDp9gOumJNeJhOkaiy9exG4g2Duahiw5aO
	HMiq3uujiMl0AeNb5X4FRZ9v76lKK/9C/NJnP7wy3uWiEkeeG8+U4TygDv7nLAHlZeoQQMpkwh0
	tqKx
X-Received: by 2002:a05:693c:87d3:20b0:382:8358:9e03 with SMTP id 5a478bee46e88-3856ef457c4mr16029358eec.17.1795500832290;
        Mon, 23 Nov 2026 22:13:52 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm39413457eec.7.2026.11.23.22.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:13:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] gawk: Fix intformat ptest failure with clang
Date: Mon, 23 Nov 2026 22:13:48 -0800
Message-ID: <20261124061348.3997765-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 06:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250947
Content-Type: text/plain; charset="utf-8"

format_int() relies on undefined behavior when converting out of range
doubles to integers, which clang optimizes in a way that makes the
intformat test fail. Add a patch to range check before converting.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...efined-behavior-converting-out-of-ra.patch | 70 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.4.1.bb      |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/0002-printf-Avoid-undefined-behavior-converting-out-of-ra.patch

diff --git a/meta/recipes-extended/gawk/gawk/0002-printf-Avoid-undefined-behavior-converting-out-of-ra.patch b/meta/recipes-extended/gawk/gawk/0002-printf-Avoid-undefined-behavior-converting-out-of-ra.patch
new file mode 100644
index 0000000000..2e7d35e7e8
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/0002-printf-Avoid-undefined-behavior-converting-out-of-ra.patch
@@ -0,0 +1,70 @@
+From e00db6a8ee76f2618f38c0dde477cb111fb0df41 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 16 Oct 2026 08:14:03 +0000
+Subject: [PATCH] printf: Avoid undefined behavior converting out of range
+ doubles
+
+format_int() casts the value to uintmax_t (or intmax_t) and then
+checks whether converting it back yields the original value to decide
+if it fits. A double that is out of range for the integer type makes
+the conversion itself undefined behavior, and clang folds the
+round-trip check away, so e.g. sprintf("%x", 2^64) prints
+0x8000000000000000 instead of falling back to %g. This makes the
+intformat test fail when gawk is built with clang.
+
+Check the range before doing the conversion instead.
+
+Upstream-Status: Pending
+Reported upstream: https://lists.gnu.org/archive/html/bug-gawk/2026-11/msg00028.html
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ printf.c | 29 ++++++++++++-----------------
+ 1 file changed, 12 insertions(+), 17 deletions(-)
+
+diff --git a/printf.c b/printf.c
+index 0264692..dd80b80 100644
+--- a/printf.c
++++ b/printf.c
+@@ -925,26 +925,21 @@ format_integer_digits(NODE *arg, struct flags *flags, bool *used_float)
+ 		// octal or hex or unsigned decimal
+ 		chbuf = (flags->format == 'X' ? Uchbuf : lchbuf);
+
+-		if (tmpval < 0) {
+-			uval = (uintmax_t) (intmax_t) tmpval;
+-			if ((AWKNUM)(intmax_t)uval != double_to_int(tmpval)) {
+-				flags->format = 'g';
+-				free((void *) buf);
+-				*used_float = true;
+-
+-				return format_float(arg, flags);
+-			}
+-		} else {
+-			uval = (uintmax_t) tmpval;
+-			if ((AWKNUM)uval != double_to_int(tmpval)) {
+-				flags->format = 'g';
+-				free((void *) buf);
+-				*used_float = true;
++		if (tmpval < 0
++		    ? tmpval < (double) INTMAX_MIN
++		    : tmpval >= -2.0 * (double) INTMAX_MIN) {
++			flags->format = 'g';
++			free((void *) buf);
++			*used_float = true;
+
+-				return format_float(arg, flags);
+-			}
++			return format_float(arg, flags);
+ 		}
+
++		if (tmpval < 0)
++			uval = (uintmax_t) (intmax_t) tmpval;
++		else
++			uval = (uintmax_t) tmpval;
++
+ 		// generate the digits backwards.
+ 		do {
+ 			if (cp >= buf + buflen)
+--
+2.43.0
+
diff --git a/meta/recipes-extended/gawk/gawk_5.4.1.bb b/meta/recipes-extended/gawk/gawk_5.4.1.bb
index d3bf532528..ba28f8832a 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.1.bb
@@ -28,6 +28,7 @@ PACKAGECONFIG[pma-if-64bit] = "--enable-pma,--disable-pma, "
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \
            file://run-ptest \
            file://0001-configure.ac-re-enable-disabled-printf-features.patch \
+           file://0002-printf-Avoid-undefined-behavior-converting-out-of-ra.patch \
            "
 
 SRC_URI[sha256sum] = "07f6f7342b7febe4313fc2c2542ad93d64fe20ad8717200109f105a826f5fd37"
