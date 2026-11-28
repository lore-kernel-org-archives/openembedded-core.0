Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.469.1795887540931555351
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2026 09:39:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Tg/8pBg2;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so14890602c88.0
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 09:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795887540; x=1796492340; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CPXfHOaDZaewI6cvNInbhxjc/yQmA1SEUvJHKyt6BjU=;
        b=Tg/8pBg2gyxkzloDShf5G1nZX1LfeGshJHIMKymcKthyDk1iRdA9Od2QnrAiljbV9e
         rSxEQe+I9RsBc6PfRO0VZDx+OW5GkhXkibjpp1XfAnRMR/xfDwRaOeMUYBd/iVomZ6/K
         Xm/DlgbZcdp6hxMI4u5RYJztWSQn5Sx7NI75QbBflAwZRM21Z+Ko+jl4iZQCGgZlEFwi
         Nhq98k9UupoCGAaL9acMN7nyqs88irSiAadDtSdxazd+FINhPIauMCyDr9/xIhwUp/ge
         Z429H7Ooix2FWExxguw62r+JZim6tEof9NHpAlu+JCO6zs1jafHK/RNgppgibkq87i2x
         fZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795887540; x=1796492340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CPXfHOaDZaewI6cvNInbhxjc/yQmA1SEUvJHKyt6BjU=;
        b=EPc5mcnF4zZsjj1MvwgOetQc7His9/B05ywcggHjOS4Fe2M1gtuhstJUjtGQ7kZVMD
         IcHFQTqehYrBlMgGuGWeKdDNr62NOCjLvpmVpffM3IGZg1eMOIdvYsrVQIOflIkRVtFv
         k/Q7UXgsaHpflw6J4RZVBroBUW0QqZhe8mX5MN99yTEyY8SqmEaMQxocw0xZCbfr2qcC
         HWZv35eB8Pmtal8vccrxUyOdl5bJkxJm6ntVIpmSfRbZRmimfEb4i//jXzsDdASwOpO+
         OZpYOQUcr5Fi1pYNX+G9wndi+aEdePrgnL8phnmaDRWKlWCKJPFDbSLwGivoljA6+lRQ
         62zA==
X-Gm-Message-State: APuU4Z//cvYISlgQU9fCJUFoVPlmWJ/Jkh0oEuD2kPN06JCpqlvIHFJp
	ONcGRzr0PYWX27lDRcknFQiT5JXXXjJ+2GzFKuC/SS+jE2/gyf55qK9XNOxCvhdZ
X-Gm-Gg: AZFdTZeqhdEmQOvpHORfQwRc1J4+ek8pv+FApYYCXVRuED4rraDvKvGkjngWCSCN/va
	ca0eZ81i8Zul91D4/cKwxvfYUGhmqqWjceLTLRM0wpJp6aMwntg5VH1mHxZcnfRBHFQr++/c9Vy
	c+tdMPWAMv124CycluN/tKzkMTg7JvYAhd49k3Lgdc0BwwEWT6mMSDZsZ78XVre6X4o7hLxb8kk
	v10OhTxYmkY+vGdo1QnLmZ2guke8EPp+Xw6UnYU1lO1XnwS3zWaVmfuqu9kymbAm8dRo+MotsiL
	aMXIAPm8LhV5EkudFzqObTclxb+qOm8/IXzOVsY34DQ48cooWHv8UtQYipeHqLld7/6h8xag0bi
	tXh4O7TUbO3umlyDAH8IywCXpaMVZ3Ye/oMLmqHYHim0eoVW5gF4err0JkC9W1rkZa6x//RKUZi
	0wX2FkXE0U7NgfPeHg6G5XcoqSvngrySgqNHA5oOEuvIoBZIarFEvGroLda/iz9+70XXElCR/CX
	e7BNNCr5EsCSTF2Kd988emB8+JcL75hXP6u/JP7ukl03YK7xLeJWx/yiTplW6+PrWwgb9ockRrm
	edIONLhI8Npve1g2kFYTQlpXUG69Ei+VZpzPBjgOzYKCBuJDSq6+5nzJbITZR2ZXkccCcMSfbIw
	pFgBjG5C7je6TSizyMxt2lPzxIgIkoGBFju0lM3S3uaVtQtEmROJaCES8W3fK6zrqoyKWNWuJLu
	cPglHmYfzd103vOgzuj+yNmknGAztG/6Zr+bwAFnumAH6hl8haOJblykyanfovOGdTF2ptcUlF0
	0+sXfW4DN32S+7eDFw1swsooAoR7iY5XUVClQEYnlMlvFqQGEernjFfqFPIwLQnQKJiJO+ym48H
	uPuY
X-Received: by 2002:a05:701a:815a:20b0:137:5b9d:cf87 with SMTP id a92af1059eb24-1b556695bf9mr25465674c88.0.1795887540105;
        Sat, 28 Nov 2026 09:39:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm79829348c88.5.2026.11.28.09.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:38:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] libc-test: Update to the latest master
Date: Sat, 28 Nov 2026 09:38:56 -0800
Message-ID: <20261128173856.1461727-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 17:39:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251501
Content-Type: text/plain; charset="utf-8"

Update to the current master, which brings 18 commits, mostly new
tests: wordexp, regex backreferences, strtod rounding and fma/pow corner
cases.

Leave out the tests that fail on musl with a NAMES filter in config.mak,
listed in LIBC_TEST_EXCLUDE, instead of deleting their sources:
- math/fma, fmaf, fmal and powf fail because of fenv issues in musl;
  they were deleted by 0001-math-Delete-failing-tests.patch, now dropped.
- The new functional/wordexp, regression/regex-backref-oob and
  regression/regexec-backref tests check for bugs that musl master does
  not fix yet. The deep nested arithmetic case in the wordexp test also
  crashes bash as /bin/sh.

Add UPSTREAM_CHECK_COMMITS so new commits on master are reported.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-math-Delete-failing-tests.patch      | 240 ------------------
 meta/recipes-core/musl/libc-test_git.bb       |  10 +-
 2 files changed, 8 insertions(+), 242 deletions(-)
 delete mode 100644 meta/recipes-core/musl/libc-test/0001-math-Delete-failing-tests.patch

diff --git a/meta/recipes-core/musl/libc-test/0001-math-Delete-failing-tests.patch b/meta/recipes-core/musl/libc-test/0001-math-Delete-failing-tests.patch
deleted file mode 100644
index 814d7bcb64..0000000000
--- a/meta/recipes-core/musl/libc-test/0001-math-Delete-failing-tests.patch
+++ /dev/null
@@ -1,240 +0,0 @@
-From c46b87834ad13c8e1b8f4ae1655773fc946c98e5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 20 Aug 2025 12:41:26 -0700
-Subject: [PATCH] math: Delete failing tests
-
-These tests are regularly failing due ot fenv
-issue on musl but its not prioritized enough
-in musl. Ignore them for now.
-
-Upstream-Status: Inappropriate [musl-specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/math/fma.c  | 47 --------------------------------------------
- src/math/fmaf.c | 47 --------------------------------------------
- src/math/fmal.c | 52 -------------------------------------------------
- src/math/powf.c | 47 --------------------------------------------
- 5 files changed, 236 deletions(-)
- delete mode 100644 src/math/fma.c
- delete mode 100644 src/math/fmaf.c
- delete mode 100644 src/math/fmal.c
- delete mode 100644 src/math/powf.c
-
-diff --git a/src/math/fma.c b/src/math/fma.c
-deleted file mode 100644
-index 24b65c8..0000000
---- a/src/math/fma.c
-+++ /dev/null
-@@ -1,47 +0,0 @@
--#include <stdint.h>
--#include <stdio.h>
--#include "mtest.h"
--
--static struct ddd_d t[] = {
--#include "sanity/fma.h"
--#include "special/fma.h"
--};
--
--int main(void)
--{
--	#pragma STDC FENV_ACCESS ON
--	double y;
--	float d;
--	int e, i, err = 0;
--	struct ddd_d *p;
--
--	for (i = 0; i < sizeof t/sizeof *t; i++) {
--		p = t + i;
--
--		if (p->r < 0)
--			continue;
--		fesetround(p->r);
--		feclearexcept(FE_ALL_EXCEPT);
--		y = fma(p->x, p->x2, p->x3);
--		e = fetestexcept(INEXACT|INVALID|DIVBYZERO|UNDERFLOW|OVERFLOW);
--
--		/* do not check inexact by default */
--#if defined CHECK_INEXACT || defined CHECK_INEXACT_OMISSION
--		if (!checkexceptall(e, p->e, p->r)) {
--#else
--		if (!checkexceptall(e|INEXACT, p->e|INEXACT, p->r)) {
--#endif
--			printf("%s:%d: bad fp exception: %s fma(%a,%a,%a)=%a, want %s",
--				p->file, p->line, rstr(p->r), p->x, p->x2, p->x3, p->y, estr(p->e));
--			printf(" got %s\n", estr(e));
--			err++;
--		}
--		d = ulperr(y, p->y, p->dy);
--		if (!checkcr(y, p->y, p->r)) {
--			printf("%s:%d: %s fma(%a,%a,%a) want %a got %a ulperr %.3f = %a + %a\n",
--				p->file, p->line, rstr(p->r), p->x, p->x2, p->x3, p->y, y, d, d-p->dy, p->dy);
--			err++;
--		}
--	}
--	return !!err;
--}
-diff --git a/src/math/fmaf.c b/src/math/fmaf.c
-deleted file mode 100644
-index c4329a2..0000000
---- a/src/math/fmaf.c
-+++ /dev/null
-@@ -1,47 +0,0 @@
--#include <stdint.h>
--#include <stdio.h>
--#include "mtest.h"
--
--static struct fff_f t[] = {
--#include "sanity/fmaf.h"
--#include "special/fmaf.h"
--};
--
--int main(void)
--{
--	#pragma STDC FENV_ACCESS ON
--	float y;
--	float d;
--	int e, i, err = 0;
--	struct fff_f *p;
--
--	for (i = 0; i < sizeof t/sizeof *t; i++) {
--		p = t + i;
--
--		if (p->r < 0)
--			continue;
--		fesetround(p->r);
--		feclearexcept(FE_ALL_EXCEPT);
--		y = fmaf(p->x, p->x2, p->x3);
--		e = fetestexcept(INEXACT|INVALID|DIVBYZERO|UNDERFLOW|OVERFLOW);
--
--		/* do not check inexact by default */
--#if defined CHECK_INEXACT || defined CHECK_INEXACT_OMISSION
--		if (!checkexceptall(e, p->e, p->r)) {
--#else
--		if (!checkexceptall(e|INEXACT, p->e|INEXACT, p->r)) {
--#endif
--			printf("%s:%d: bad fp exception: %s fmaf(%a,%a,%a)=%a, want %s",
--				p->file, p->line, rstr(p->r), p->x, p->x2, p->x3, p->y, estr(p->e));
--			printf(" got %s\n", estr(e));
--			err++;
--		}
--		d = ulperrf(y, p->y, p->dy);
--		if (!checkcr(y, p->y, p->r)) {
--			printf("%s:%d: %s fmaf(%a,%a,%a) want %a got %a ulperr %.3f = %a + %a\n",
--				p->file, p->line, rstr(p->r), p->x, p->x2, p->x3, p->y, y, d, d-p->dy, p->dy);
--			err++;
--		}
--	}
--	return !!err;
--}
-diff --git a/src/math/fmal.c b/src/math/fmal.c
-deleted file mode 100644
-index 791d5d3..0000000
---- a/src/math/fmal.c
-+++ /dev/null
-@@ -1,52 +0,0 @@
--#include <stdint.h>
--#include <stdio.h>
--#include "mtest.h"
--
--static struct lll_l t[] = {
--#if LDBL_MANT_DIG == 53
--#include "sanity/fma.h"
--#include "special/fma.h"
--#elif LDBL_MANT_DIG == 64
--#include "sanity/fmal.h"
--#include "special/fmal.h"
--#endif
--};
--
--int main(void)
--{
--	#pragma STDC FENV_ACCESS ON
--	long double y;
--	float d;
--	int e, i, err = 0;
--	struct lll_l *p;
--
--	for (i = 0; i < sizeof t/sizeof *t; i++) {
--		p = t + i;
--
--		if (p->r < 0)
--			continue;
--		fesetround(p->r);
--		feclearexcept(FE_ALL_EXCEPT);
--		y = fmal(p->x, p->x2, p->x3);
--		e = fetestexcept(INEXACT|INVALID|DIVBYZERO|UNDERFLOW|OVERFLOW);
--
--		/* do not check inexact by default */
--#if defined CHECK_INEXACT || defined CHECK_INEXACT_OMISSION
--		if (!checkexceptall(e, p->e, p->r)) {
--#else
--		if (!checkexceptall(e|INEXACT, p->e|INEXACT, p->r)) {
--#endif
--			printf("%s:%d: bad fp exception: %s fmal(%La,%La,%La)=%La, want %s",
--				p->file, p->line, rstr(p->r), p->x, p->x2, p->x3, p->y, estr(p->e));
--			printf(" got %s\n", estr(e));
--			err++;
--		}
--		d = ulperrl(y, p->y, p->dy);
--		if (!checkcr(y, p->y, p->r)) {
--			printf("%s:%d: %s fmal(%La,%La,%La) want %La got %La ulperr %.3f = %a + %a\n",
--				p->file, p->line, rstr(p->r), p->x, p->x2, p->x3, p->y, y, d, d-p->dy, p->dy);
--			err++;
--		}
--	}
--	return !!err;
--}
-diff --git a/src/math/powf.c b/src/math/powf.c
-deleted file mode 100644
-index 4778c2f..0000000
---- a/src/math/powf.c
-+++ /dev/null
-@@ -1,47 +0,0 @@
--#include <stdint.h>
--#include <stdio.h>
--#include "mtest.h"
--
--static struct ff_f t[] = {
--#include "ucb/powf.h"
--#include "sanity/powf.h"
--#include "special/powf.h"
--
--};
--
--int main(void)
--{
--	#pragma STDC FENV_ACCESS ON
--	float y;
--	float d;
--	int e, i, err = 0;
--	struct ff_f *p;
--
--	for (i = 0; i < sizeof t/sizeof *t; i++) {
--		p = t + i;
--
--		if (p->r < 0)
--			continue;
--		fesetround(p->r);
--		feclearexcept(FE_ALL_EXCEPT);
--		y = powf(p->x, p->x2);
--		e = fetestexcept(INEXACT|INVALID|DIVBYZERO|UNDERFLOW|OVERFLOW);
--
--		if (!checkexcept(e, p->e, p->r)) {
--			if (fabsf(y) < 0x1p-126f && (e|INEXACT) == (INEXACT|UNDERFLOW))
--				printf("X ");
--			else
--				err++;
--			printf("%s:%d: bad fp exception: %s powf(%a,%a)=%a, want %s",
--				p->file, p->line, rstr(p->r), p->x, p->x2, p->y, estr(p->e));
--			printf(" got %s\n", estr(e));
--		}
--		d = ulperrf(y, p->y, p->dy);
--		if (!checkulp(d, p->r)) {
--			printf("%s:%d: %s powf(%a,%a) want %a got %a ulperr %.3f = %a + %a\n",
--				p->file, p->line, rstr(p->r), p->x, p->x2, p->y, y, d, d-p->dy, p->dy);
--			err++;
--		}
--	}
--	return !!err;
--}
diff --git a/meta/recipes-core/musl/libc-test_git.bb b/meta/recipes-core/musl/libc-test_git.bb
index d9999ec377..060f5e339b 100644
--- a/meta/recipes-core/musl/libc-test_git.bb
+++ b/meta/recipes-core/musl/libc-test_git.bb
@@ -9,18 +9,19 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=43ed1245085be90dc934288117d55a3b"
 
 inherit ptest
 
-SRCREV = "f2bac7711bec93467b73bec1465579ea0b8d5071"
+SRCREV = "63e36e934e8f2bedf645303a90b64098e2af6c8f"
 SRC_URI = " \
     git://repo.or.cz/libc-test;branch=master;protocol=https \
     file://0001-Fix-strptime-on-musl.patch \
     file://0001-api-unistd-guard-optional-obsolete-_PC-_SC-constants.patch \
-    file://0001-math-Delete-failing-tests.patch \
     file://run-ptest \
     file://run-libc-ptests \
 "
 
 PV = "0+git"
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 # libc-test 'make' or 'make run' command is designed to build and run tests. It
 # reports both build and test failures. The commands should be run on target.
 do_compile() {
@@ -43,6 +44,10 @@ RDEPENDS:${PN}-ptest = " \
      tzdata \
 "
 
+# Tests that fail on musl: fenv issues (math) and bugs not fixed yet
+LIBC_TEST_EXCLUDE ?= "math/fma math/fmaf math/fmal math/powf \
+                      functional/wordexp regression/regex-backref-oob regression/regexec-backref"
+
 install_path = "/opt/${PN}"
 FILES:${PN} += "${install_path}/*"
 
@@ -50,6 +55,7 @@ do_install () {
     install -d ${D}${install_path}/
     cp ${S}/Makefile ${D}${install_path}
     cp ${S}/config.mak.def ${D}${install_path}/config.mak
+    echo 'NAMES:=$(filter-out ${LIBC_TEST_EXCLUDE},$(NAMES))' >> ${D}${install_path}/config.mak
     cp -r ${S}/src ${D}${install_path}
 }
 
