Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3733.1793405757026930910
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=FWzdkqnB;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so16511665e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405755; x=1794010555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uv2agkakm/YeH+aatKZoSbg1BvgobRxU0ooaJDgdUW0=;
        b=FWzdkqnBBH2W4MhqAKCPtcODrAHV22ud5LcLyzovq+zzwkNV7Y3If+abhPbY3b7h0R
         rL73NVZReW3qFlsoGJ29NPj5ZhYavXPaNXrqqdN3e9m8YzNsu6DGBvv20HUZKgdPydGf
         sGWEPn8hLKMPTuohuv6DtjRfpMXY45aEFXfm314L/o+vFngNI4XZjxyNkprrzTpe7KNK
         HpRlX0M9vD6A8656M/Ts3JIoJgbEW25R5ClQDJ8JNotzIUgLMhl35LH6LAr0bWL+UCbt
         fYkF4KaSz17MTijx3FuhfVmTdAd1gC4po3bPWOMj+H3daXpRKxHljUoL4zL6FEVV+0Gd
         rH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405755; x=1794010555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Uv2agkakm/YeH+aatKZoSbg1BvgobRxU0ooaJDgdUW0=;
        b=gIl99KG/orW5T7AN0xXD8/lh/7tMN+VWcVwIeWwe+fupCUiPMDo9HUr6t12ZCrBwTD
         tsk3j+t2BFW8OxT74KJYOOpciLAuuP5aBWZ97XRjAq7xkFuT/70nTLjEpJRUPItdWRNU
         2BJkmBa0iQ2Lxz++5h2XOfg7tyAc9px9EnbCOuIpv62g3hCxX7azanAoGdhyiyI0cFlC
         CtheyxxfCFiEl/nxzjzm40CckBOV8fzlW295uzTfEh8tqPE0o9zfg36oM7Sl5OVscDNw
         9FX32JHTleWpptVccP9m1lq1qpZ4idIBq+nWE247pqpJmjPvzgj0vCqkX6OOPzy3442A
         PLRw==
X-Gm-Message-State: AFq9FYLjO6KbleiIqqZ4P3mkvkztv5Fxubb/C/1hjgL+x0NWiRx1jyuU
	DeZbOJU1SZXns4EodR9ous2SedY1vhnUFvJq/qCt93WCoikkWTDQcEN9KJWctHAi3ogk9IxjUd5
	T30Bm490=
X-Gm-Gg: AYBFou23Wr3bsGDIZlGu+9pIBLI6Ze1FLuCTyyGLdHE7VE4Iw4PZrx1T8rCeIAjVBsT
	PwskgvKlDJfcX0rZo9UJps/h4O9VJkceF0RHUv1KCp7yyFQ0WmNMBxcrCq4zYByXCdNgUu2u66g
	81zJf7us3mqLJUzb2PbJtXjcZ64s2Vn7gae7F0H4ZuhKWIZYZNet0wS7YildDL++/J8B1yhlNoZ
	ksPh/8ZiJKwYiJLq64GYqPhsjak6JeImKL6x+UkAvuk3fuLA6Bz3dMFQYIn1gWkgn7a/1PGn9UH
	X2XN09zIPsECEesXBYJxoK4yc9KOCy9yi4j1QxWwtQln3Rsa/dN4rr+JncSEKt4BYzZJ+iNXUrt
	9BRVSaeTTIb9goIWBtzJDmcbCix0wleOhT+7dzXmz0ITMyAyQUqEpdJ1tOl2dhm0+s9SE3enLP0
	ra0F4gT/Fz8VKu4cs7XDEesrrxuh0bYYv4qy4taeNpG24qT0xx6YAmzmraSt/B8oS6OTZ9IbeBz
	vIZNFkTj+DxwO5oSV6CmqhpYqaSIzZ4TGZgdLJ56CfZa9OPP/aoQEEKmhTs7thfEGti7Du48FYw
	HHcK0ReQDbI1KnD6p8YFH9TpZ+v+5uAyGyR/cH6KduQBkF0vK5ljqxyHWTCvjNYnIq9Th7UPk33
	qZQ0pz+O3tmCN5GgI4qrQVQavXmm0rw==
X-Received: by 2002:a05:600c:c87:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4ac17567fe1mr89407265e9.12.1793405755169;
        Fri, 30 Oct 2026 17:15:55 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/55] glibc: patch CVE-2026-5928
Date: Sat, 31 Oct 2026 01:14:42 +0100
Message-ID: <1284d19d8055885de7ab943b8b0ef74b2e9f5493.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249096
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch [1] which is [2] backported to 2.41 (oldest release still
receiving security updates) which is mentioned in [3].

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=8941538b92a574a24e9308e164869239d2b0d845
[2] https://sourceware.org/git/?p=glibc.git;a=commit;h=ef3bfb5f910011f3780cb06aa47e730035f53285
[3] https://security-tracker.debian.org/tracker/CVE-2026-5928

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed a 3.41 -> 2.41 typo in branch name]
---
 .../glibc/glibc/0031-CVE-2026-5928.patch      | 112 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0031-CVE-2026-5928.patch

diff --git a/meta/recipes-core/glibc/glibc/0031-CVE-2026-5928.patch b/meta/recipes-core/glibc/glibc/0031-CVE-2026-5928.patch
new file mode 100644
index 00000000000..60b81e74529
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0031-CVE-2026-5928.patch
@@ -0,0 +1,112 @@
+From 8941538b92a574a24e9308e164869239d2b0d845 Mon Sep 17 00:00:00 2001
+From: Rocket Ma <marocketbd@gmail.com>
+Date: Fri, 1 May 2026 20:39:07 -0700
+Subject: [PATCH] libio: Fix ungetwc operating on byte stream [BZ #33998]
+
+* libio/wgenops.c: When _IO_wdefault_pbackfail attempts to push back one
+character, it accidently compare the wchar to push back with the last
+char from byte stream, instead of wide stream. Under specific coding,
+attacker may exploit this to leak information. This commit fix bug
+33998, or CVE-2026-5928.
+
+Signed-off-by: Rocket Ma <marocketbd@gmail.com>
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+(cherry picked from commit ef3bfb5f910011f3780cb06aa47e730035f53285)
+
+CVE: CVE-2026-5928
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=8941538b92a574a24e9308e164869239d2b0d845]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libio/Makefile              |  1 +
+ libio/bug-wgenops-bz33998.c | 54 +++++++++++++++++++++++++++++++++++++
+ libio/wgenops.c             |  4 +--
+ 3 files changed, 57 insertions(+), 2 deletions(-)
+ create mode 100644 libio/bug-wgenops-bz33998.c
+
+diff --git a/libio/Makefile b/libio/Makefile
+index e143ccdb2c..43ee8db06d 100644
+--- a/libio/Makefile
++++ b/libio/Makefile
+@@ -83,6 +83,7 @@ tests = \
+   bug-ungetwc1 \
+   bug-ungetwc2 \
+   bug-wfflush \
++  bug-wgenops-bz33998 \
+   bug-wmemstream1 \
+   bug-wsetpos \
+   test-fmemopen \
+diff --git a/libio/bug-wgenops-bz33998.c b/libio/bug-wgenops-bz33998.c
+new file mode 100644
+index 0000000000..cc4067da99
+--- /dev/null
++++ b/libio/bug-wgenops-bz33998.c
+@@ -0,0 +1,54 @@
++/* Regression test for ungetwc operating on byte stream (BZ #33998)
++   Copyright (C) 2026 The GNU Toolchain Authors.
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
++#include "support/temp_file.h"
++#include "support/xstdio.h"
++#include "support/xunistd.h"
++#include <stdlib.h>
++#include <unistd.h>
++#include <sys/mman.h>
++#include <stdio.h>
++#include <wchar.h>
++#include <support/check.h>
++
++static int
++do_test (void)
++{
++  char *filename;
++  int fd = create_temp_file ("tst-bz33998-", &filename);
++  TEST_VERIFY (fd != -1);
++  xwrite (fd, "A", sizeof ("A")); // write "A\0" by design
++  xclose (fd);
++
++  FILE *fp = xfopen (filename, "r+");
++  TEST_COMPARE (getwc (fp), L'A');
++  /* If the bug is fixed, then ungetwc should not touch byte stream.
++     If the bug is not fixed, ungetwc firstly match last read char, L'A',
++     failed, then the pbackfail branch, matching last read char in byte
++     stream, that is, '\0' (initialized when setup wide stream). */
++  char *old_read_ptr = fp->_IO_read_ptr;
++  TEST_COMPARE (ungetwc (L'\0', fp), L'\0');
++  TEST_VERIFY (fp->_IO_read_ptr == old_read_ptr);
++
++  xfclose (fp);
++  free (filename);
++
++  return 0;
++}
++
++#include <support/test-driver.c>
+diff --git a/libio/wgenops.c b/libio/wgenops.c
+index 0a11d1b1de..9e0b2c00ea 100644
+--- a/libio/wgenops.c
++++ b/libio/wgenops.c
+@@ -108,8 +108,8 @@ _IO_wdefault_pbackfail (FILE *fp, wint_t c)
+ {
+   if (fp->_wide_data->_IO_read_ptr > fp->_wide_data->_IO_read_base
+       && !_IO_in_backup (fp)
+-      && (wint_t) fp->_IO_read_ptr[-1] == c)
+-    --fp->_IO_read_ptr;
++      && (wint_t) fp->_wide_data->_IO_read_ptr[-1] == c)
++    --fp->_wide_data->_IO_read_ptr;
+   else
+     {
+       /* Need to handle a filebuf in write mode (switch to read mode). FIXME!*/
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index d31c8656414..0a4f7ac3bd6 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -63,6 +63,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-CVE-2026-6238-0004.patch \
            file://0029-CVE-2026-6238-0005.patch \
            file://0030-CVE-2026-6238-0006.patch \
+           file://0031-CVE-2026-5928.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
