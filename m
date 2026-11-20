Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3553.1795204540186900002
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 11:55:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=jQq4u2Aw;
 spf=pass (domain: baylibre.com, ip: 209.85.219.48, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-921342fae7eso14207466d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 11:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795204539; x=1795809339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mghSQO7C9CY+Qwk8VMGdy1GtmIkKsFU6jn43McUEoHU=;
        b=jQq4u2Awbfa+5Ft93jM0WVVXIFyrS8m5S/cW90Ha2AHRTVU1ps6Ui/o4pH2XBa0F8k
         /1v/b+ppzfrdY8++q7+6vrl3bLzUPye+JhjfEHTRRzRkTdSE7olhfS/zTme7ZV5aK25Y
         I+SH9MoAbMImY7LAttFXOTPJVQ2cTfL7Yz0g+W1+4J/ExrJOS9vSmNyRJyErb4v1sVTl
         GdZoicylK57vu3an36Dr8R6n1przsdYc1+2gCT4kCLNUSKqW41rdRRfIWkxMGTZdOc6h
         ZOKNwZRwgTLdvPBt42OX1UNCpIQ5GcZ68CFOztkky0spAx66q+L9iAOeE0DDxTofybSW
         3Hhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204539; x=1795809339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mghSQO7C9CY+Qwk8VMGdy1GtmIkKsFU6jn43McUEoHU=;
        b=QngqLilIA+VznsU7VuXiVhT/dPEkYAEe+CKRnq+PqWGaNPsWbeM783kjYgKGl2tOzo
         skw5c89w6LOG5TML/OM3sn6THldcUhQgFyr0VWluHH72KPXUdoyjiN0OrCLlX1WZZSTo
         vdC0D5bkEosOeY3TE/aWJTDWnUaKGFlSjbQJl6IdYn+yEmuomLlmktD/LD/9qaWypPNA
         RBG4zJKwhYHP7DqYWwGxIQElB0qwR8rlq0GuFaUza8ztgbIorHDyLMs4e0OovP/ivTcE
         TVvnnsz7A+uOPX2PSdgRpBC/EozlyXD8nYsoxjF8RZZzN3fbQp+dD9gezDfL3KqvJkcA
         IGMg==
X-Gm-Message-State: APuU4Z/S0UPBma5OeKMKkYaYU7/Ls6gPBh2J1F9+5r/rMgeGr1NPmvcc
	IPGqqBVx3v7TSZFmtzX/6uCdBqTruUA37PZm+VCfjj4v05V9s2rWWxA74muCx+8XxNq7+lTyJe2
	bprPu
X-Gm-Gg: AZFdTZeVFbKZsDwb+8ir1ihvG2pyO7v5ZbMh8r2wPOr1+Kyfcf5QUPdl1qVNoMGr6SB
	NzdY7JBY10xwv9Wo3gvqZdMTiCv7oWU7NMakZGnAZXi7WRQWuOgM81bQzgVDd5jp/vXO6UHoXuJ
	8bTkWzZQpdE2Emy9r+YY8wn0V+Jfeen2nrc/cJ2K96WjW4HRnBmmYtf4k9MO5bVSUgoEVhd7amb
	dc/7RnZADymNdY92kSph8zQHc+oYyLuJUjgid2IdwGfFmzxYhgmuM8jL2r9H6EeDAoHFxq0N5ja
	EI9mdBGDHC+ZQCCoTNlZZ4GyWUxn9ft2NhARfyDQA/UwT/vDlsHVINo1RCZyJvr7b3Z7v2ebmZ0
	xnb2qKF+O5WTQxqdThQbl5XLtYPpT2YV10cMESNX4nxFVshQYtoEQRnnwRVLHbaRE4PiUhbNvyx
	Y7ZbUgjEUiomgthiuorkpuIhfLTcRS1BQ65w+CC4AsuNpLj6u094sDhQwt+IjfJ3GyN4JYN7ZUl
	LBRFFuu0ap8fNJvUGTJZ2WukHjsUcgIiB+6VsHJkGe8kn3MSApUSSXa1YfoX/yDB63d7OSdalBv
	uw3v4/fo1V47erDU7rb6Tb7P0Da2y1CYYaq1cYoXD6ifZTbdoj1gngElslwDYVDKZWaWEV1Uj/j
	IN2yBRecpNw==
X-Received: by 2002:a05:6214:763:b0:921:24aa:10c3 with SMTP id 6a1803df08f44-92134a60fa4mr68950576d6.30.1795204538966;
        Fri, 20 Nov 2026 11:55:38 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.oryx-coho.ts.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b50besm33975846d6.9.2026.11.20.11.55.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:38 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-numpy: set '--rootdir' in run-ptest
Date: Fri, 20 Nov 2026 14:55:35 -0500
Message-ID: <20261120195535.2843075-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 19:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250824
Content-Type: text/plain; charset="utf-8"

pytest looks for a common rootdir between the current working directory
and the args provided[1], which in our case is /usr/lib:

|platform linux -- Python 3.15.2, pytest-9.2.0, pluggy-1.7.0
|rootdir: /usr/lib
|plugins: putao-0.4, hypothesis-6.170.12
|collected 2741 items

Specifying '--rootdir=@PYTHON_SITEPACKAGES_DIR@' changes it to the
actual numpy directory where the test suites live. This significantly
improves ptest runtime, without changing the test results. Examples:

qemux86-64 without patch:

|============================================================================
|Testsuite summary
|# TOTAL: 48757
|# PASS: 47548
|# SKIP: 1176
|# XFAIL: 31
|# FAIL: 0
|# XPASS: 2
|# ERROR: 0
|DURATION: 184
|END: /usr/lib/python3-numpy/ptest
|2026-11-20T16:54
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

and with patch:

|============================================================================
|Testsuite summary
|# TOTAL: 48757
|# PASS: 47548
|# SKIP: 1176
|# XFAIL: 31
|# FAIL: 0
|# XPASS: 2
|# ERROR: 0
|DURATION: 149
|END: /usr/lib/python3-numpy/ptest
|2026-11-20T17:15
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

[1]: https://docs.pytest.org/en/stable/reference/customize.html#finding-the-rootdir

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-devtools/python/python3-numpy/run-ptest | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-numpy/run-ptest b/meta/recipes-devtools/python/python3-numpy/run-ptest
index b5edc5cf48..6f5073b518 100644
--- a/meta/recipes-devtools/python/python3-numpy/run-ptest
+++ b/meta/recipes-devtools/python/python3-numpy/run-ptest
@@ -12,6 +12,9 @@ mkdir -p "$PYTEST_DEBUG_TEMPROOT"
 # include gcc as a ptest dependency, so skip that. test_big_arrays uses up a
 # large amount of storage, so skip that too.
 # remove test_validate_transcendentals if
-# https://github.com/numpy/numpy/issues/27460 is resolved
-pytest --automake -m "not slow" -k "not test_mem_policy and not test_big_arrays and not test_validate_transcendentals" @PYTHON_SITEPACKAGES_DIR@/numpy
+# https://github.com/numpy/numpy/issues/27460 is resolved.
+# Set the rootdir explicitly so that pytest doesn't use a common ancestor of the
+# ptest directory and test path for it, which slows down the ptest suite's
+# runtime
+pytest --automake --rootdir=@PYTHON_SITEPACKAGES_DIR@ -m "not slow" -k "not test_mem_policy and not test_big_arrays and not test_validate_transcendentals" @PYTHON_SITEPACKAGES_DIR@/numpy
 rm -rf "$PYTEST_DEBUG_TEMPROOT"
-- 
2.56.0

