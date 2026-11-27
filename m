Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1530.1795801777288907782
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=YLfbcE3i;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so6526686f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801775; x=1796406575; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpVDyfAF8K6k1M6fjeq1CSPMgAmipusF1jqBKzXj8XE=;
        b=YLfbcE3i9qiwljTZ1tKPurkYkXvGhZrVDRPwC/PGUP/mVQ7v5YBHTJV2lp4+s9IdxE
         bIZspkum0OzuAEtHi+/kmCiA0LXI0M1qyr9OiTU56IfqZ555DXoy2CPvHIKthNMd52PQ
         S3J0n6rbDq6dutapL5DNff/2lpn6n4Eu/Ookb74X1n3GFLBNlilII3oq526FLk8FEDOC
         VjIEBo5swz9N2795LIDhfVEIIFHiSbQKjMEp/RsoSWQVVIS3FIHlRSb0RhtSTNZ+UdV8
         NzYX7018yEmaSomHOXWdmdPgE6B+qWnYOSz80SYJhLy9nAMOnECwn/t53k2lQj3JgzG+
         3vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801775; x=1796406575;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpVDyfAF8K6k1M6fjeq1CSPMgAmipusF1jqBKzXj8XE=;
        b=njaLv8MEXyVtAWXCEWQJavKVLTEF5UikXg7gWM9Ori2UCft62YmhXTM5BmYouo2hO+
         qJkdInScfhaVen/4bSgUNu88NfdrFc16gmvDHP2bq76WNAHJzoSJJGRTuYeUYTsV5f+b
         6Wai13PaBnVFjDUGMUk7rnRq+OOPljRa8Z3zAinKFzmhDXp+CsYdoC/po5U5GAy9GtYf
         E0UQRMuGZuu4VHJc21sHByrakCy5pU8LUruP7eoosp9sJufChNCwuvGzsH6M0wmrblid
         GrENdggfjkWlCOmhPXku7FJBS7cQmMadfkYJpmFwBw0FxhEOVIu3B6qS+hosFl/Smnwf
         upbQ==
X-Gm-Message-State: APuU4Z8jdrLvwJUzrRp1qS7kQuU1BhvHF/yRmK8co+V30Gn0KOyJeDVv
	1Z5AjNvTvykyxSpPF7iJ6JDthXWNd66mcxl6TvRuecJpKvoJ5m7tSaMmKbRCaBuWKpYEpmfI0+8
	qPVc97lw=
X-Gm-Gg: AZFdTZeYt7U/jpsEAGFxbabAVCkoXEce4k6a9ibDSefxNs9/FD7XjMSkWbFGdaKEM/8
	pgiU/8Ew29hRqsU5swE39JUa1EpDYXrqoIBgHsqrTvupJzOTi9yRIXrQCpfUrpoYJ6UEFkRK6xt
	ArlXsQmms7g0hgGo3KO8zP/29iSpOYoeSU/IdduoEquf7fsZuJ3r1+c44gtYDBhPHwBi0aJS/Sp
	hk8Ee164EHQracFkmULuz8VDalWPMhCVR4HWOl6jclna2+ueyLX55ULr4sEQdDHyLTiTa/RulK2
	uP5JjFzZrgh8X7NfMwflr8FK3fg+vvoWh7zpgcKf5yv2YAvcW7RQ9fnzfpKx30Fmk7W+nIT0Tv/
	D9UbueMcXpj2VMUoHbpmuUZ9lyies6jQ5//zbZZ+tm8vqi6hwPDrpHAKpUDhLRbYi9Hrk2x/YeW
	CHRF/dn1MFzuY5AP6C4AUjr7yS2Uxw1s8J3tcZKI5bqiOPbKcdXl4fxp3ZtPmAXAvVU73r3PV2e
	nezzhp51Boydkbb36bDJKADw5DB38vV1dIFKy8fXutnNhwLxAkDgSu8TwV6vznK+KbOpj2QHkCz
	K+WnquZtbBOv2w9M1Ovyr1f6LjWOO3SA2OghlWOKlCwiJ6c8ny+erjY/ZcgZNiG2gp6f9L4whXX
	WfrWD+N0YfUp2D2iYlV0RKRG0gsJ2
X-Received: by 2002:a05:6000:4908:b0:4bc:38c7:aad6 with SMTP id ffacd0b85a97d-4be43dbd129mr7806883f8f.36.1795801775453;
        Fri, 27 Nov 2026 09:49:35 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:35 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/37] glibc: fix CVE-2026-84243
Date: Fri, 27 Nov 2026 18:48:46 +0100
Message-ID: <8cbce6eaece54ab617cde5663a929d33dd9e203f.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251409
Content-Type: text/plain; charset="utf-8"

From: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>

This vulnerability, marked as High [1], was fixed upstream [2] since
2.45.

Backport the fix to glibc v2.39.

The only changes not included in the backport are the ones in NEWS file.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-84243
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=17142

Signed-off-by: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>
Signed-off-by: Bastien Jauny <bastien.jauny@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../glibc/glibc/CVE-2026-84243.patch          | 193 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 194 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2026-84243.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2026-84243.patch b/meta/recipes-core/glibc/glibc/CVE-2026-84243.patch
new file mode 100644
index 00000000000..640a166c08d
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2026-84243.patch
@@ -0,0 +1,193 @@
+From 02449c3a9751f801d49a41952291a6c09a24de15 Mon Sep 17 00:00:00 2001
+From: Avinal Kumar <avinal.xlvii@gmail.com>
+Date: Mon, 2 Nov 2026 17:18:03 -0300
+Subject: [PATCH] intl: Restrict path traversal when using LANGUAGE env var [BZ
+ #17142, CVE-2026-84243]
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The fix for CVE-2014-0475 (Bug 17137) added valid_locale_name() in
+locale/findlocale.c to reject locale names containing ".." path
+components.  However, the LANGUAGE environment variable processing in
+intl/dcigettext.c was not covered by that fix.  An attacker who can
+set LANGUAGE (e.g. via SSH AcceptEnv) can force any gettext-using
+program to load a crafted .mo file from an arbitrary filesystem
+location via directory traversal.  A crafted .mo file can crash the
+program through out-of-range offsets or through format-string
+translations that consume more arguments than the caller passes,
+causing undefined behaviour in *printf.  glibc cannot fully protect
+against the latter at the gettext level.  The safety of .mo files
+normally relies on them being produced by msgmerge and msgfmt -c and
+installed in read-only locations; path traversal bypasses this trust
+model.
+
+Remove the ENABLE_SECURE gate from the IS_PATH_WITH_DIR check so it
+applies to all binaries, not just SUID/SGID ones, and extend it to
+also reject the bare ".." entry which contains no directory separator
+but still names the parent directory.
+
+Add tst-gettext-path-traversal to verify that locale names containing
+path separators or equal to ".." are rejected by the LANGUAGE processing loop.
+
+This fixes bug 17142 and CVE-2026-84243.
+
+Suggested-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Signed-off-by: Avinal Kumar <avinal.xlvii@gmail.com>
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+
+CVE: CVE-2026-84243
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=03067f3c5e39aec5ec250a44bc1b395a1afd45e8]
+
+Signed-off-by: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>
+---
+ intl/Makefile                     |  4 ++
+ intl/dcigettext.c                 |  8 +--
+ intl/tst-gettext-path-traversal.c | 83 +++++++++++++++++++++++++++++++
+ 3 files changed, 91 insertions(+), 4 deletions(-)
+ create mode 100644 intl/tst-gettext-path-traversal.c
+
+diff --git a/intl/Makefile b/intl/Makefile
+index 9b79198e68..02b217d471 100644
+--- a/intl/Makefile
++++ b/intl/Makefile
+@@ -53,6 +53,7 @@ $(objpfx)plural.o: $(objpfx)plural.c
+ ifeq ($(run-built-tests),yes)
+ ifeq (yes,$(build-shared))
+ ifneq ($(strip $(MSGFMT)),:)
++tests += tst-gettext-path-traversal
+ tests-special += $(objpfx)tst-translit.out $(objpfx)tst-gettext.out \
+ 		 $(objpfx)tst-gettext2.out $(objpfx)tst-codeset.out \
+ 		 $(objpfx)tst-gettext3.out
+@@ -107,6 +108,7 @@ $(objpfx)tst-gettext6.out: tst-gettext6.sh $(objpfx)tst-gettext6
+ $(objpfx)tst-codeset.out: $(codeset_mo)
+ $(objpfx)tst-gettext3.out: $(codeset_mo)
+ $(objpfx)tst-gettext5.out: $(codeset_mo)
++$(objpfx)tst-gettext-path-traversal.out: $(codeset_mo)
+ endif
+ 
+ LOCALES := de_DE.ISO-8859-1 de_DE.UTF-8 en_US.ANSI_X3.4-1968 fr_FR.ISO-8859-1 \
+@@ -121,6 +123,7 @@ $(objpfx)tst-gettext4.out: $(gen-locales)
+ $(objpfx)tst-gettext5.out: $(gen-locales)
+ $(objpfx)tst-gettext6.out: $(gen-locales)
+ $(objpfx)tst-gettext-c-utf8.out: $(gen-locales)
++$(objpfx)tst-gettext-path-traversal.out: $(gen-locales)
+ $(objpfx)tst-translit.out: $(gen-locales)
+ endif
+ 
+@@ -140,6 +143,7 @@ CFLAGS-tst-gettext3.c += -DOBJPFX=\"$(objpfx)\"
+ CFLAGS-tst-gettext4.c += -DOBJPFX=\"$(objpfx)\"
+ CFLAGS-tst-gettext5.c += -DOBJPFX=\"$(objpfx)\"
+ CFLAGS-tst-gettext6.c += -DOBJPFX=\"$(objpfx)\"
++CFLAGS-tst-gettext-path-traversal.c += -DOBJPFX=\"$(objpfx)\"
+ 
+ ifeq ($(have-thread-library),yes)
+ ifeq (yes,$(build-shared))
+diff --git a/intl/dcigettext.c b/intl/dcigettext.c
+index a028518c2a..57f422f437 100644
+--- a/intl/dcigettext.c
++++ b/intl/dcigettext.c
+@@ -684,10 +684,10 @@ DCIGETTEXT (const char *domainname, const char *msgid1, const char *msgid2,
+ 	    *cp++ = *categoryvalue++;
+ 	  *cp = '\0';
+ 
+-	  /* When this is a SUID binary we must not allow accessing files
+-	     outside the dedicated directories.  */
+-	  if (ENABLE_SECURE && IS_PATH_WITH_DIR (single_locale))
+-	    /* Ingore this entry.  */
++	  /* Do not allow accessing files outside the dedicated
++	     directories.  */
++	  if (IS_PATH_WITH_DIR (single_locale)
++	      || strcmp (single_locale, "..") == 0)
+ 	    continue;
+ 	}
+ 
+diff --git a/intl/tst-gettext-path-traversal.c b/intl/tst-gettext-path-traversal.c
+new file mode 100644
+index 0000000000..95ad326f64
+--- /dev/null
++++ b/intl/tst-gettext-path-traversal.c
+@@ -0,0 +1,83 @@
++/* Test that LANGUAGE values with path traversal are rejected [BZ #17142].
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
++#include <libintl.h>
++#include <locale.h>
++#include <stdlib.h>
++#include <support/check.h>
++#include <support/support.h>
++
++static const char *const domaindir = OBJPFX "domaindir";
++static const char *const localedir = OBJPFX "domaindir/de_DE";
++static const char *const msgdir = OBJPFX "domaindir/de_DE/LC_MESSAGES";
++
++static int
++do_test (void)
++{
++  unsetenv ("OUTPUT_CHARSET");
++  /* LANGUAGE is only consulted if the locale is not "C" or "C.<codeset>".
++     The catalog is in ISO-8859-1, as is the locale, so no conversion of
++     the translation takes place.  */
++  xsetlocale (LC_ALL, "de_DE.ISO-8859-1");
++  textdomain ("codeset");
++
++  /* Verify that a legitimate LANGUAGE value produces the expected
++     translation.  This exercises the normal lookup path and confirms
++     that the test .mo catalog is in place.  */
++  bindtextdomain ("codeset", domaindir);
++  setenv ("LANGUAGE", "de_DE", 1);
++  TEST_COMPARE_STRING (gettext ("cheese"), "K\344se");
++
++  /* A bare ".." must be rejected.  Without the fix this would resolve
++     to msgdir/../LC_MESSAGES/codeset.mo, which is the real catalog,
++     so the translation would succeed.  */
++  bindtextdomain ("codeset", msgdir);
++  setenv ("LANGUAGE", "..", 1);
++  TEST_COMPARE_STRING (gettext ("cheese"), "cheese");
++
++  /* A relative path that leaves and re-enters the catalog directory
++     must be rejected.  Without the fix this would resolve to
++     localedir/../de_DE/LC_MESSAGES/codeset.mo.  */
++  bindtextdomain ("codeset", localedir);
++  setenv ("LANGUAGE", "../de_DE", 1);
++  TEST_COMPARE_STRING (gettext ("cheese"), "cheese");
++
++  /* Multiple levels of directory traversal must be rejected.  Without
++     the fix this would resolve to
++     msgdir/../../de_DE/LC_MESSAGES/codeset.mo.  */
++  bindtextdomain ("codeset", msgdir);
++  setenv ("LANGUAGE", "../../de_DE", 1);
++  TEST_COMPARE_STRING (gettext ("cheese"), "cheese");
++
++  /* Invalid entries in a colon-separated LANGUAGE list must be
++     skipped individually; valid entries that follow are still
++     used.  */
++  bindtextdomain ("codeset", domaindir);
++  setenv ("LANGUAGE", "..:../de_DE:de_DE", 1);
++  TEST_COMPARE_STRING (gettext ("cheese"), "K\344se");
++
++  /* A path containing "/.." must be rejected.  Use localedir so the
++     binding changes, which invalidates the DCIGETTEXT result cache.  */
++  bindtextdomain ("codeset", localedir);
++  setenv ("LANGUAGE", "LC_MESSAGES/..", 1);
++  TEST_COMPARE_STRING (gettext ("cheese"), "cheese");
++
++  return 0;
++}
++
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 1598249b7b3..d306e7b0a7c 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -78,6 +78,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0047-CVE-2026-89092.patch \
            file://0048-CVE-2026-97399.patch \
            file://0049-CVE-2026-86805-CVE-2026-95818.patch \
+           file://CVE-2026-84243.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
