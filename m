Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5347.1794386246120278231
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 00:37:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0e8xrM/5;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37071c0f42aso5093901eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 00:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794386245; x=1794991045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AnFA6LUxd7/kcUMlrZtCpjAjs7iZOJ57Vb/nH48kiDw=;
        b=0e8xrM/57Gcadtmn0/jh0v/PA6h8nwTwS8oHsPaNFbhDh3TM4cfMMIF3030SPa3FN1
         /8xtWSwoD56twaSyzjoi6lT8fDTORAMwn+r1h3Z/MUzTufAS/JNSp0WZTj5MS2uBpcfO
         A3QiBDNjzr/nctsMmp45n07eHDwLgRLC2emPCXEUYUTC2h86QnSDEfSFi38isAx9l8Zh
         +eQMLJkb8MWlqWpNdbPcwPOT+0VsIMfWR63Qj+UNxTzG4LS7kD0zFnRaI0ChIJonwcZ0
         Z/ZLABFmGYaou+tqK9TEozSmQXEfeeg21c8MMGo2ndeAmVFhddwDeBaBFfT2rlQk5Q9o
         qDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386245; x=1794991045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AnFA6LUxd7/kcUMlrZtCpjAjs7iZOJ57Vb/nH48kiDw=;
        b=uF3h80nUK9uEWRqJn8cf8H1m/4m5hKK6oltrahBI8x/uVWIlVJVKlSsj6CsG3iaT4v
         aJQpV8DmVABIU4ClE5o3xX1NfWjnsW5SJv+AbGf+VbRYmnv6vejmmMxNIQJLmaoyhirH
         qqUz/eaK6w8HRVBCxADSjU9JDtnU5ECRFM3SA978FtpKCO8yLFgqRSQA7UgplxU93q+B
         76AMyg903qjX75+dNxLmDsihZuhIl5OoYEQhEDruRS7z780qi5qLyM0QykJlZUNmQ0pn
         USdDMTH8unqhc/6vobo2vUKwYzrsMxEEV4JBGWluPykWpE2EHZ92X9Upr/Es11pNtMbU
         waqw==
X-Gm-Message-State: APuU4Z+AcqCxJKe6dnZfmiXWOiTLiwE8XQcfStk9wYOalmRZQIbNDlaG
	11v7OvK/xoSLJPiEOgiBxHQPNMo85Ki4hYWPG8vMQQygaFn0UGq7hqiYO0hHQHuVJqeQxg==
X-Gm-Gg: AYBFou1tMxurivvd8TZQfIdscYROcxIt2o6My9cVwS3J0k8XXbSbp8lUerdwfUzYEa1
	4v7iiAPPchz2AMaHuvYIi82NSrgEmxi6zMWtwc+xW5uAStHiIOg3sYQ3qTOjwwUfaBiDrlZFTpr
	azRUe0/sUtU93rbsAw3uafvErk46PaGbNuj8K0//A6mAmSTwPeayiqTJb07AJSLp9oSVBSWwAB6
	1gzvknfbEONP2lrSLVEwzVt0vkAh47fe9tKt6k+7Rq0EakL00smiB1DTXpoiKwt0nDGV8I6WAR9
	F9CvkDnzg+k6KyitiBl1GwK6NxK4HLvbefo7mqEbMmBPUCCYyD4U1SzjU3hcmXALQzc/AIpoMlq
	+plXlCuX5pqX0uC5zxT+v1+3GTRrc6HPP+3+m5dYGKizkCXTg66qcqosxn1eEWfzRUgv+kzvsN3
	usx404MNVV4Rladux695UZ9UJZkdPeKlDjGOXAks7hSJI6KOevzBxA4ZOHaJyubBdGhEoS7t/UY
	FPpgY5RoQv+TwLg3wodasa0pxxOQv3gaESSjzS9vvOy3QjlDbzyB5+XbAeqh9F5YAWwk/4LwfdE
	xx7VHX+f8OaHZDxKgbMr1vdoDBBm4CTUdGQl2kP2ZFDXS4/c77V77lmF6/wIlJBTcaKu4rHyjx4
	AVDOb0lpHPtbczm6vDeQardp3ezMwgXOWNEz67LT47eDJbnOOo76kiQ3jOrrVgs+Azz5b/5sw5l
	gWxWv7UJdeB2Loti1xyGg9ikSEuhbJKV8+hcoA32PaB6xe0h71RNCqhxmrH06AqL5VrLUa3Vh10
	TB+ZpfJ6x4ixaEk8W+G16N/JG4J8Q3RWbuvFFfsd+agwVQKc8alq+kQYNxWLjK+nnx1qwET5Oma
	RvYl
X-Received: by 2002:a05:693c:80cd:b0:36f:202c:48 with SMTP id 5a478bee46e88-37685d728d6mr2740537eec.14.1794386245371;
        Wed, 11 Nov 2026 00:37:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm14504599eec.7.2026.11.11.00.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:37:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 3/3] libc-test: Re-enable yn test
Date: Wed, 11 Nov 2026 00:37:11 -0800
Message-ID: <20261111083711.549321-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111083711.549321-1-khem.raj@oss.qualcomm.com>
References: <20261111083711.549321-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 08:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249970
Content-Type: text/plain; charset="utf-8"

its now fixed in musl

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-math-Delete-failing-tests.patch      | 51 -------------------
 1 file changed, 51 deletions(-)

diff --git a/meta/recipes-core/musl/libc-test/0001-math-Delete-failing-tests.patch b/meta/recipes-core/musl/libc-test/0001-math-Delete-failing-tests.patch
index 96ff279fa6..814d7bcb64 100644
--- a/meta/recipes-core/musl/libc-test/0001-math-Delete-failing-tests.patch
+++ b/meta/recipes-core/musl/libc-test/0001-math-Delete-failing-tests.patch
@@ -15,13 +15,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/math/fmaf.c | 47 --------------------------------------------
  src/math/fmal.c | 52 -------------------------------------------------
  src/math/powf.c | 47 --------------------------------------------
- src/math/yn.c   | 43 ----------------------------------------
  5 files changed, 236 deletions(-)
  delete mode 100644 src/math/fma.c
  delete mode 100644 src/math/fmaf.c
  delete mode 100644 src/math/fmal.c
  delete mode 100644 src/math/powf.c
- delete mode 100644 src/math/yn.c
 
 diff --git a/src/math/fma.c b/src/math/fma.c
 deleted file mode 100644
@@ -240,52 +238,3 @@ index 4778c2f..0000000
 -	}
 -	return !!err;
 -}
-diff --git a/src/math/yn.c b/src/math/yn.c
-deleted file mode 100644
-index 244dbb8..0000000
---- a/src/math/yn.c
-+++ /dev/null
-@@ -1,43 +0,0 @@
--#define _XOPEN_SOURCE 700
--#include <stdint.h>
--#include <stdio.h>
--#include "mtest.h"
--
--static struct di_d t[] = {
--#include "sanity/yn.h"
--#include "special/yn.h"
--};
--
--int main(void)
--{
--	#pragma STDC FENV_ACCESS ON
--	double y;
--	float d;
--	int e, i, err = 0;
--	struct di_d *p;
--
--	for (i = 0; i < sizeof t/sizeof *t; i++) {
--		p = t + i;
--
--		if (p->r < 0)
--			continue;
--		fesetround(p->r);
--		feclearexcept(FE_ALL_EXCEPT);
--		y = yn(p->i, p->x);
--		e = fetestexcept(INEXACT|INVALID|DIVBYZERO|UNDERFLOW|OVERFLOW);
--
--		if (!checkexcept(e, p->e, p->r)) {
--			printf("%s:%d: bad fp exception: %s yn(%lld, %a)=%a, want %s",
--				p->file, p->line, rstr(p->r), p->i, p->x, p->y, estr(p->e));
--			printf(" got %s\n", estr(e));
--			err++;
--		}
--		d = ulperr(y, p->y, p->dy);
--		if ((!(p->x < 0) && !checkulp(d, p->r)) || (p->x < 0 && !isnan(y) && y != -inf)) {
--			printf("%s:%d: %s yn(%lld, %a) want %a got %a, ulperr %.3f = %a + %a\n",
--				p->file, p->line, rstr(p->r), p->i, p->x, p->y, y, d, d-p->dy, p->dy);
--			err++;
--		}
--	}
--	return !!err;
--}
