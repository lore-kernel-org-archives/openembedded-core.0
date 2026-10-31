Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3741.1793405762545082191
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=VvFzf8bi;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso8818825e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405761; x=1794010561; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=98M2pcD2IMyud5Fc930BxTCtGZSqFPo9LMn5E/lIBH0=;
        b=VvFzf8bi/MWoaFRZgzqUr3ecx7KRKAFgcH/U0kc3AlN4A0MvbqqadBg4K4ZLrHkd8p
         VY38nnBNDGKSdFoJKNamYYwUg2mO5EVpJ/Q9bNvxXIlRneHAUmhw2AnGrA3Y334p/P4c
         fahRlC36PE0zRGUsDwdcx2g6evTfXPTEHWFJ8bse/vpU3LXXQVhUfZKa6ZgEQnMWFlzF
         mHaXjLlFzB2TnVKjgc+fEIEwlW0MbHyuXnqmpTDuERNVfnaJq6dWU15Hpq5Y5nV9/N0L
         PTLMz0rDAy52HCRIQRunNQAGWxXI+wuZcCpBdFvzBjyEEaIuEf5CksNyYK6lHXdbmFHT
         BfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405761; x=1794010561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=98M2pcD2IMyud5Fc930BxTCtGZSqFPo9LMn5E/lIBH0=;
        b=XwcNiQeml9gB01B70auX4d6Ct2E0Mri4o5v06f4RiYMMABWP2bLDVkb8/tCI8rtxrE
         R+TZtKWrpq+56rYcuxp+AMDANbQ57McZ/CeFJ4Tn3eJBmrHtyU+yEXG19Pncd5Dkrf63
         LofwlrZlzyKdsFwyAp62i5CJqZ42IeMOtHOyEPca+IJulQ6VK73ee7bx2nCCzVfwL0qI
         VQyY2ggHafv2405qt8oUW9gyMWSQGmKO4r+k4Q8IRRBeq9ss6f4g1jbfzhgzOBoaJr8B
         6CvTlxfq5G6gaq1xpjgyTVEJG8B91fampZbtLjSsx+nutey12jgrWGcK2gQRAOvbypao
         LNqw==
X-Gm-Message-State: AFq9FYJHAVzj92HTq9SSC8vZ75NYAX3s/Y3U+PCA9ZGi/zvPJ5a6WbIa
	JkVDS/jh0jf0aqvsKX0GWlSXsIyMB0kPcsEZYzP+iYvTHBbUDwttgnRxPVW9NfLZ41wP9lznpXp
	hMgTRsY8=
X-Gm-Gg: AYBFou0GRdA4kg51RQyu8R7WKRLdBSGznnT95u8643vtgsmu/Lq660eyNOLY/AfE6pP
	cR0zXkPTKtWdt72tAPnJ3fJVcVXqy6tEqL+5GuFxNGtyR+ci++kHfJPaMmzX0tk2klmi1D6MtvF
	WfIP+2V7N0nXZtHiJeMsIjE08ELnFdS65lUNH+wDbiluS7XGLLstus/zxOygVI2ACZDZSK4FbR3
	x20ycbFMbbUEr1YEtoxZ0ztd6sQAOG0eQab989ifQ+buTnBp8wbt7e/V98B/JNL7X83BNKvOlga
	vvH/oqz95fqKUg2SYkjmCDPrjySpgBcJlWuk15mKor15KOaBzWSKk4TZJ09drSEi0ubTUwtq+nu
	VOHbpZOT8ekFxJXqshnYswpZJqmmKjhbkPzPqzGVcGg4pp29YwRvrdgag5IpD1EUNuPKA7RfiKd
	1WLrtSx8EuA9qymZoWxwf2ITGgmq8kpOJLgAtbJFD+RzaoQoLDaK1aroTKPD97Lpsfy02wIt8lt
	ERwNUUPdkEyqZmDbxgoBPy5/z4GSPQKtKlWJBOtsJk4PEVKZ9BH16jM65dShOvtfDFJB3qUHjHG
	uANc4vSWIka2OGEeiDpybm07ChrzgnrZLDNgmQ2lLQgwAlCMJH+dCtAKkIfN6lzU81W2EWFwNVJ
	cccMjD4PoLoqVE1geNZPzw6E2xPMB
X-Received: by 2002:a05:600c:354c:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4ac18c7389amr90804745e9.34.1793405760692;
        Fri, 30 Oct 2026 17:16:00 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 30/55] glibc: patch CVE-2026-18374
Date: Sat, 31 Oct 2026 01:14:51 +0100
Message-ID: <c1929f8f641c206a400e5e054b920e1eb1fd3269.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249105
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patches referencing this CVE from 2.41 branch (oldest release
still receiving security updates).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed a 3.41 -> 2.41 typo in branch name]
---
 .../glibc/glibc/0040-CVE-2026-18374-01.patch  |  53 +++++++++
 .../glibc/glibc/0041-CVE-2026-18374-02.patch  | 103 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   2 +
 3 files changed, 158 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0040-CVE-2026-18374-01.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0041-CVE-2026-18374-02.patch

diff --git a/meta/recipes-core/glibc/glibc/0040-CVE-2026-18374-01.patch b/meta/recipes-core/glibc/glibc/0040-CVE-2026-18374-01.patch
new file mode 100644
index 00000000000..a5a71473ab2
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0040-CVE-2026-18374-01.patch
@@ -0,0 +1,53 @@
+From f806c45178dbca3be08a25cc5dd6d5542ce84a59 Mon Sep 17 00:00:00 2001
+From: Dongkyun Son <dongkyun.s@samsung.com>
+Date: Fri, 4 Sep 2026 21:28:41 +0900
+Subject: [PATCH] libio: Fix CVE-2026-18374 heap buffer overflow in ccs=
+ handling
+
+When fopen() is called with a ,ccs= parameter whose value becomes empty
+after strip(), the code must reject it with EINVAL instead of attempting
+to use it.  The original upstr() fallback could read past the ',' delimiter
+and cause a heap buffer overflow.
+
+The fix checks if the charset specification is empty after strip() and
+returns EINVAL immediately, preventing the overflow and following the
+approach described in BZ #34574.
+
+CVE-2026-18374 - CVSS 4.9 (AV:L/AC:H/PR:N/UI:N/S:U/C:L/I:L/A:L)
+
+Reported-by: AISLE in partnership with Red Hat
+Signed-off-by: Dongkyun Son <dongkyun.s@samsung.com>
+Reviewed-by: Florian Weimer <fweimer@redhat.com>
+(cherry picked from commit 9765a538ebf8661a6e5578e01e35a3dd30db7eb4)
+
+CVE: CVE-2026-18374
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=f806c45178dbca3be08a25cc5dd6d5542ce84a59]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libio/fileops.c | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/libio/fileops.c b/libio/fileops.c
+index 775999deb3..18efe8e0c0 100644
+--- a/libio/fileops.c
++++ b/libio/fileops.c
+@@ -305,12 +305,14 @@ _IO_new_file_fopen (FILE *fp, const char *filename, const char *mode,
+ 	  *((char *) __mempcpy (ccs, cs + 5, endp - (cs + 5))) = '\0';
+ 	  strip (ccs, ccs);
+ 
+-	  if (__wcsmbs_named_conv (&fcts, ccs[2] == '\0'
+-				   ? upstr (ccs, cs + 5) : ccs) != 0)
++	  /* After stripping, ccs[2] == '\0' means the charset name is empty.
++	     This is not a valid charset and would cause problems downstream.
++	     Reject it with EINVAL (BZ #34574, CVE-2026-18374).  */
++	  if (ccs[2] == '\0' || __wcsmbs_named_conv (&fcts, ccs) != 0)
+ 	    {
+-	      /* Something went wrong, we cannot load the conversion modules.
+-		 This means we cannot proceed since the user explicitly asked
+-		 for these.  */
++	      /* Either the charset name is empty after strip(), or conversion
++		 modules cannot be loaded.  This means we cannot proceed since
++		 the user explicitly asked for character conversion.  */
+ 	      (void) _IO_file_close_it (fp);
+ 	      free (ccs);
+ 	      __set_errno (EINVAL);
diff --git a/meta/recipes-core/glibc/glibc/0041-CVE-2026-18374-02.patch b/meta/recipes-core/glibc/glibc/0041-CVE-2026-18374-02.patch
new file mode 100644
index 00000000000..d653d545f51
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0041-CVE-2026-18374-02.patch
@@ -0,0 +1,103 @@
+From 5dd252cf1d113644b3679f5a158e9ef20217865e Mon Sep 17 00:00:00 2001
+From: Shamil Abdulaev <ashamil435@gmail.com>
+Date: Thu, 3 Sep 2026 20:19:42 +0300
+Subject: [PATCH] libio: Add test for fopen with an empty ", ccs=" value [BZ
+ #34574]
+
+This goes on top of the fix for CVE-2026-18374.  The test runs the
+reproducer from the bug report, plus "w,ccs=" and "w,ccs=,", and
+expects NULL with errno set to EINVAL.
+
+Signed-off-by: Shamil Abdulaev <ashamil435@gmail.com>
+Reviewed-by: Florian Weimer <fweimer@redhat.com>
+(cherry picked from commit cca93e5d88d3d4ed073c03100467696f652269e7)
+
+CVE: CVE-2026-18374
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5dd252cf1d113644b3679f5a158e9ef20217865e]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libio/Makefile              |  1 +
+ libio/tst-fopen-ccs-empty.c | 62 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 63 insertions(+)
+ create mode 100644 libio/tst-fopen-ccs-empty.c
+
+diff --git a/libio/Makefile b/libio/Makefile
+index 43ee8db06d..5b9929c3de 100644
+--- a/libio/Makefile
++++ b/libio/Makefile
+@@ -99,6 +99,7 @@ tests = \
+   tst-fgetc-after-eof \
+   tst-fgetwc \
+   tst-fgetws \
++  tst-fopen-ccs-empty \
+   tst-fopenloc2 \
+   tst-fputws \
+   tst-freopen \
+diff --git a/libio/tst-fopen-ccs-empty.c b/libio/tst-fopen-ccs-empty.c
+new file mode 100644
+index 0000000000..64723965e1
+--- /dev/null
++++ b/libio/tst-fopen-ccs-empty.c
+@@ -0,0 +1,62 @@
++/* Test fopen with an empty ",ccs=" value in the mode string (bug 34574).
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
++#include <errno.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <support/check.h>
++#include <support/support.h>
++#include <support/temp_file.h>
++#include <support/xunistd.h>
++
++static void
++check_fopen_fails (const char *path, const char *mode)
++{
++  errno = 0;
++  FILE *fp = fopen (path, mode);
++  TEST_VERIFY (fp == NULL);
++  TEST_COMPARE (errno, EINVAL);
++  if (fp != NULL)
++    fclose (fp);
++}
++
++static int
++do_test (void)
++{
++  char *path;
++  xclose (create_temp_file ("tst-fopen-ccs-empty", &path));
++
++  /* The value is blank and the mode string continues well past it.  */
++  enum { size = 1024 * 1024 };
++  char *mode = xmalloc (size);
++  memset (mode, 'X', size);
++  mode[size - 1] = '\0';
++  static const char prefix[] = "w,ccs=                     ,";
++  memcpy (mode, prefix, sizeof (prefix) - 1);
++  check_fopen_fails (path, mode);
++  free (mode);
++
++  check_fopen_fails (path, "w,ccs=");
++  check_fopen_fails (path, "w,ccs=,");
++
++  free (path);
++  return 0;
++}
++
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 144ce36ccc2..3e95792b359 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -72,6 +72,8 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0037-CVE-2026-77117.patch \
            file://0038-CVE-2026-80489.patch \
            file://0039-CVE-2026-77117-CVE-2026-80489.patch \
+           file://0040-CVE-2026-18374-01.patch \
+           file://0041-CVE-2026-18374-02.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
