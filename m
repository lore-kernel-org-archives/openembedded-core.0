Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3741.1793405761822090395
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=BJMb9xev;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso13601415e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405760; x=1794010560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G1BSwD2yOYEo7wHo9m0oH696bE7lDCYieal0pyH2igg=;
        b=BJMb9xevKf/1Tt7/CRADRSBTO34b3jMKxweEtr+OJDHwE0tK6fh3oC8hTUMAoxkhGk
         fIWVUXIG18xo/vQdWtTzrOFII+Su5XTjseCy4AX/44syLSDqDHYa0Mde+iVNeTYCLFVc
         IQ+u0LGGdQhVgWieiGAYPrA/bXW43eH8vgrW6eZMsbw5Le9eklYSEp11NwX0s+slOzOO
         uzNOjRQ9vtFjz71Zxxw36s2gqdYiiPHRoLvjgmemELAHCnkYFXYnDzIs7KXZI5iWI0MU
         SH7bz2u57OQKmTvvQSf1EgIYuJcLGFSGJ5oZI/kncynGUaNhTspC0/jVlZCvFL/Ib6fK
         t7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405760; x=1794010560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G1BSwD2yOYEo7wHo9m0oH696bE7lDCYieal0pyH2igg=;
        b=yaUxDPxgCJVjG44M2BwBgGp38DHQ60fG3S0Vd59WO+i1MrtDfNAyxVz2xsLKtiLJRQ
         C/7nIFsejPUlPZ7mDk/0nFWTdbx3Xwk+7kuUAu09ic1VfN4+HmITHchiqzKsbT8xpBDB
         hqDRFbQlP1uSRxLHY885Q5m7wcvCa8CoBKz/w/0FoS5cPwIAj59YlXY0USAmWoT0WJB5
         wpbMbJK7S7NsPs6tqYQPSCRAiu9XWvoVgwtKcVgkxN0As/rbseJZbZNC40ChuREkxN5e
         WrrTI8bpr5N5WyUfHK8KYb1ZDjEzIX+eN2pxNIwpIjsRXBGSjTqtB5HtbtueLQYO2zSh
         WwLA==
X-Gm-Message-State: AFq9FYKCnKJspxrSJqqkvkFT9U/TpqDpf0W2B44nm156QvJHwXmrSJ7Z
	3WelZ9VsZ0+5dxCXV4SWSIgxui2iNaU486a1bnPFw6o3yNiXjr4NI8lxW5rZQil81WMh/LyxULu
	bdID7q5k=
X-Gm-Gg: AYBFou3v5H2qc/mHblhAWboyLHEwkS/CSsZjfCAokQKY1Q/JYnqJ2KK3ZN+5Wq+AUmg
	n4Al435ZUa0YCLDd3Sb/c7pnPXGjBZvOKDzP3DQ0J1aLph44YWMFIS3ngu9pLGz9MQ7/N6gSXQW
	iY+if6jQAJ34JsDnQ3qvHkePU9DSEmRmC0rMsEw5gF0pKNkyJVTfh47fktWs7Awil4XofnFh2j9
	b4DTbq4ZKF0HS0CRwPNHAd4gutthVhkpFyEXu1GfHzm8qfyd3uq5mRE7EarnuR30voWofi9gJFg
	t02nrXiPdMF0/UbROXISDNmlnaYveTtToHibxQmaVakXxHk9+HUjXUHyjFV5B0A8ylVpr8asiZc
	GmMzUvjtG9V3lSKnUrvbLvCkW1Ikz/pdLpk0/PE2Mq19F6z3DTFhiD+p5yHEdK21EPCHdRi3far
	AX4jM4l1R/1Ww9diLtx3bcVBX3RZNAjhBeK3zpOt+jkxFPhkIdxlsFOBfaCDDj/yYMNmm0+r2va
	znCTTdpVEZWOYcii5t/vnxkHV8SorDWTQmgbcoyzkveSco8sxO1PNP4hnm2zyEvuGgFH50jHndX
	lALUyREvuBW9L+jvlvDIkqorfPOWxc16TRlK5zfuT4uD7Sg2RKsqOv68CThID0QmZ9FY+wb/DNS
	+NPIVkkwRgkUwzr0LdosGZLZo/Cey
X-Received: by 2002:a05:600c:8b0a:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4ac1709ae4emr93577105e9.14.1793405759997;
        Fri, 30 Oct 2026 17:15:59 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 29/55] glibc: add tests for CVE-2026-77117 and CVE-2026-80489.
Date: Sat, 31 Oct 2026 01:14:50 +0100
Message-ID: <a07c06404450f90a1dceeca7fb38b1c2c875b259.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249104
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick commit referencing bug IDs from patches for these CVEs from 2.41
branch (oldest release still receiving security updates).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed a 3.41 -> 2.41 typo in branch name]
---
 .../0039-CVE-2026-77117-CVE-2026-80489.patch  | 172 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 173 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0039-CVE-2026-77117-CVE-2026-80489.patch

diff --git a/meta/recipes-core/glibc/glibc/0039-CVE-2026-77117-CVE-2026-80489.patch b/meta/recipes-core/glibc/glibc/0039-CVE-2026-77117-CVE-2026-80489.patch
new file mode 100644
index 00000000000..7e9141bd9f7
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0039-CVE-2026-77117-CVE-2026-80489.patch
@@ -0,0 +1,172 @@
+From 3d141c23899d90559741b5fe74db97ccf0ef5c29 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 28 Aug 2026 10:26:07 +0200
+Subject: [PATCH] iconvdata: Test case for bug 34556, bug 34568
+
+Assisted-by: LLM
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+(cherry picked from commit 35efcffa97553df071bc37ab31fd7dc2c634e7da)
+
+CVE: CVE-2026-77117
+CVE: CVE-2026-80489
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=3d141c23899d90559741b5fe74db97ccf0ef5c29]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ iconvdata/Makefile                |   5 +-
+ iconvdata/tst-jisx0213-progress.c | 124 ++++++++++++++++++++++++++++++
+ 2 files changed, 128 insertions(+), 1 deletion(-)
+ create mode 100644 iconvdata/tst-jisx0213-progress.c
+
+diff --git a/iconvdata/Makefile b/iconvdata/Makefile
+index cc689f63e9..36f48749d2 100644
+--- a/iconvdata/Makefile
++++ b/iconvdata/Makefile
+@@ -76,7 +76,8 @@ tests = bug-iconv1 bug-iconv2 tst-loading tst-e2big tst-iconv4 bug-iconv4 \
+ 	tst-iconv6 bug-iconv5 bug-iconv6 tst-iconv7 bug-iconv8 bug-iconv9 \
+ 	bug-iconv10 bug-iconv11 bug-iconv12 tst-iconv-big5-hkscs-to-2ucs4 \
+ 	bug-iconv13 bug-iconv14 bug-iconv15 \
+-	tst-iconv-iso-2022-cn-ext tst-bug33980
++	tst-iconv-iso-2022-cn-ext tst-bug33980 \
++	tst-jisx0213-progress
+ ifeq ($(have-thread-library),yes)
+ tests += bug-iconv3
+ endif
+@@ -335,6 +336,8 @@ $(objpfx)tst-iconv-iso-2022-cn-ext.out: $(addprefix $(objpfx), $(gconv-modules))
+ 					$(addprefix $(objpfx),$(modules.so))
+ $(objpfx)tst-bug33980.out: $(addprefix $(objpfx), $(gconv-modules)) \
+ 			   $(addprefix $(objpfx),$(modules.so))
++$(objpfx)tst-jisx0213-progress.out: \
++  $(addprefix $(objpfx), $(gconv-modules)) $(addprefix $(objpfx),$(modules.so))
+ 
+ $(objpfx)iconv-test.out: run-iconv-test.sh \
+ 			 $(addprefix $(objpfx), $(gconv-modules)) \
+diff --git a/iconvdata/tst-jisx0213-progress.c b/iconvdata/tst-jisx0213-progress.c
+new file mode 100644
+index 0000000000..7b2073be1f
+--- /dev/null
++++ b/iconvdata/tst-jisx0213-progress.c
+@@ -0,0 +1,124 @@
++/* Test JISX0213 combining character conversion progress (bug 34556, bug 34568).
++   Copyright (C) 2026 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++/* Certain JISX0213 byte sequences map to a combining sequence, for
++   example U+304B (HIRAGANA LETTER KA) followed by U+309A (COMBINING
++   SEMI-VOICED SOUND MARK).  When converting to internal encoding
++   (actually UTF-32) with a small output buffer, the first code point
++   is emitted and the second is queued in the converter state.  This
++   test verifies that the queued code point is consumed exactly once
++   on retry, so that the conversion makes progress and terminates.  */
++
++#include <errno.h>
++#include <iconv.h>
++#include <stdio.h>
++#include <string.h>
++
++#include <support/check.h>
++#include <support/support.h>
++
++static void
++test_one (const char *charset, const char *input, size_t outbufsize)
++{
++  printf ("info: %s: testing output buffer size %zu\n", charset, outbufsize);
++
++  /* Expected UTF-32 output.  */
++  static const wchar_t expected[] = { 0x304b, 0x309a, 'A' };
++
++  /* Use WCHAR_T encoding to avoid the BOM.  */
++  iconv_t cd = iconv_open ("WCHAR_T", charset);
++  TEST_VERIFY_EXIT (cd != (iconv_t) -1);
++
++  char result[64];
++  size_t result_len = 0;
++
++  char *inptr = (char *) input;
++  size_t inleft = strlen (input);
++
++  char outbuf[64];
++
++  int iterations = 0;
++  while (inleft > 0)
++    {
++      char *outptr = outbuf;
++      size_t outleft = outbufsize;
++      size_t inleft_before = inleft;
++
++      size_t ret = iconv (cd, &inptr, &inleft, &outptr, &outleft);
++      size_t produced = outptr - outbuf;
++
++      TEST_VERIFY_EXIT (result_len + produced <= sizeof (result));
++      memcpy (result + result_len, outbuf, produced);
++      result_len += produced;
++
++      if (ret == (size_t) -1 && errno == E2BIG)
++	{
++	  if (produced == 0 && inleft == inleft_before)
++	    {
++	      /* Output buffer too small for a single code point.  */
++	      TEST_VERIFY_EXIT (outbufsize < 4);
++	      break;
++	    }
++	  /* Bound iterations to detect non-progress bugs.  */
++	  if (++iterations < 10)
++	    continue;
++	  else
++	    {
++	      FAIL ("%s: no progress", charset);
++	      goto out;
++	    }
++	}
++      if (ret == (size_t) -1)
++	FAIL_EXIT1 ("outbufsize %zu: iconv: %m", outbufsize);
++      break;
++    }
++
++  /* Flush pending converter state.  */
++  {
++    char *outptr = outbuf;
++    size_t outleft = outbufsize;
++    size_t ret = iconv (cd, NULL, NULL, &outptr, &outleft);
++    TEST_VERIFY (ret == 0);
++    size_t produced = outptr - outbuf;
++    memcpy (result + result_len, outbuf, produced);
++    result_len += produced;
++  }
++
++  if (outbufsize >= 4)
++    {
++      TEST_COMPARE (inleft, 0);
++      TEST_COMPARE_BLOB (result, result_len,
++			 expected, sizeof (expected));
++    }
++
++ out:
++  TEST_VERIFY_EXIT (iconv_close (cd) == 0);
++}
++
++static int
++do_test (void)
++{
++  for (size_t outbufsize = 1; outbufsize <= 16; outbufsize++)
++    {
++      test_one ("EUC-JISX0213", "\244\367A", outbufsize);
++      test_one ("SHIFT_JISX0213", "\202\365A", outbufsize);
++    }
++  return 0;
++}
++
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index bd0b4f06190..144ce36ccc2 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -71,6 +71,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0036-CVE-2026-19499.patch \
            file://0037-CVE-2026-77117.patch \
            file://0038-CVE-2026-80489.patch \
+           file://0039-CVE-2026-77117-CVE-2026-80489.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
