Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11876.1794485564734479946
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 04:12:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=oEw+cxBn;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.42, mailfrom: upstream_ip-sp@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6OuUWCy0TbBFfqKRFgIMbKAR98BKxxUn2zND22kDCzlJ/u2WN6VrMNg2qVbwKi2hxtasmMn/AZdObLwriWpmQ4hQxVTCovkcl+gdGIZ8Fv/Jh4v1lqQk5Ad7R6qzBuwewn6acJSYdhAx1nvXDrI5/y75hoMuxmw9BXwxchRYsLkBh/1rCvYNBiE0buxFXqL4u6K8Z3piOSYNKojXmRIpkdGtfKmWTyB8dMApQ1A9PwiTIRfK+z23vcFJGzZPw2OLEY10+KLeUGprF5CLQY7UHwhgnUEdcre6+yRA1IrSr6/QQO4Mzoj+npGGUvm1jAbE42PxD9RfIucfTzt3qLPdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYDWhPHAeKYFzhNPL2uv9ylgfQv6ODplE9ttFZf/EP8=;
 b=lkXDSQQl0Zbh0Hpc4dHlSc+OaNFhKMZgztAgwSvpEao3SrFULvm3gN+++1k0lrY+c4qxkCUh4COo7/csYidl3xhN5XiIVv4ZzDk3HbqTa6zED4jYK5JaKkSUP5WviI4TURWKJyfPsBBtML2yxuwxir8r/Fp/8O2jRs3htObVhc7wXtfTyZAzCYd+/kCugW8yFaHllfcxnOyCzKOw3vVt5QFiczCszTXmPuxCMnDkSRJCv2NdUW3WynT5hlzbf14+mh+IH5AfecOXXi2A704GC54ocvK0UZnCZzlIK8Z0OPU1lpllfVagy/Q93SR43TTSGLNQgq3SquH0zVGzv6HzSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYDWhPHAeKYFzhNPL2uv9ylgfQv6ODplE9ttFZf/EP8=;
 b=oEw+cxBn59DBtuGcoXf19+QN6pbXmiEPeHuwRe2WW+0wN+OTl67Gk8aHnG556G3zIXtrEXRjj2obQ6gE+d36Aa+RpvxWmT4cAXeXppm4vdlO2G16lMw509xui4RC3/zGl9qUBzjSgvJJ8lp3E1GBWJoM1FMWFHhGTFQyfZAm1sAwYvTxsArvEVxwU/WFZSukuse4wf3AYeWLtugmJuAXFHgkZu9yk9CPt6t/aWjfDzXH2BiYo2dHiR6KTphYp9DF+NbRQBSsOmjtxEnN4yeL0wQWTz0CJ7t9KIeRIYsA21VjEyJznsu3xL3JaTnpUKazrRgQxCqeZpein4AGChUMIA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA5P287MB5315.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1bb::5)
 by MA5P287MB345665.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:249::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 11:58:25 +0000
Received: from MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
 ([fe80::69b8:6140:9c:b6de]) by MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
 ([fe80::69b8:6140:9c:b6de%2]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 11:58:25 +0000
From: Sourav Kumar Pramanik <UpStream_IP-SP@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>
Subject: [scarthgap][PATCH v3 1/2] glibc: Fix CVE-2026-5450
Date: Thu, 12 Nov 2026 17:28:17 +0530
Message-ID: <20261112115818.76259-1-UpStream_IP-SP@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN0PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::10) To MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1bb::5)
Return-Path: UpStream_IP-SP@bmwtechworks.in
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5P287MB5315:EE_|MA5P287MB345665:EE_
X-MS-Office365-Filtering-Correlation-Id: 20f08551-38f3-480f-8e8e-08df40b4420b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|23010399003|366016|38350700014|10067099003|5023799004|11063799006|56012099006|261022105027099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|55112099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: hYcgn6TL7Og5Z4xpeMgvjxXLl9MXxkjzWU6XWeP2XYLVi5QncQaZeqVyJWafbNPAZbSWYkTX6aGPT2sLONlhDXS2VSIvWuSaTv9coO/V6O/l60vii+UkXktC0bzbvgEDBdFC/EPq7PZCIlKBx+llwkJxl0y4sgeWPUI14aQfDjcKeI9xfXyNDo2X7dylIjKH8Y2lVt9kqvzRPvdS1rP3u8/IYHYyc4zPax/lZtbvvlG6byWTxJoajZ9vUWfaUiWjVzGn5UpZxE6IYQUEVr4KtlcYPos+xqd7TcPW3RE2xcKpTOUpBRU5g/pQ+YfyxVDSxib/cSXc+h7bEWkgD5CWijIkSaZKBgEcc/yPIlvj16u+4rOq9mMQtf3CUYH8/1dNuSgQuqGodcL+lfCmPT3CvFUcpKOHc2w2IyRlbedBA8LpOTtc7SYykeTKC0qxchsnDYNezqAfr1vyYKa0SXmvZhBfe0kDrbdNSC4kxa9Rs4HrscSdaB+JeASb0kXsq/LgQ6J4ZrqZM0h7a+EWMJ6aME81Q147aa94iT4LjbxldJvvTyjPDCfMpQlnuyuJmEPUJ4eZ0YHi2Hwt0gXV11874mYxW6Ew4EcgVZuWCluAUGXQtAbh0EefouF5DUw0db1kN9zY/1074U5/P6CJTjKL7WRosPtrBt9xVAcoGSA5erc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA5P287MB5315.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(23010399003)(366016)(38350700014)(10067099003)(5023799004)(11063799006)(56012099006)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(55112099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cygkg18ReDaimpmp/tFwEz/4inpS7qpesXRgpOsx6fCeW0kfNGP8uWWbyBIw?=
 =?us-ascii?Q?NZpL4TEZr749H484cAfOriDnPeR7z6uVuaFQB3reCWmsoqBJ9ntYCoBnbf64?=
 =?us-ascii?Q?e7xhhIXoDVhVaQtM86oTgt1LXKt09ACEIfMqsLowZoXBvciT001wGV3o9GHr?=
 =?us-ascii?Q?Me7wdYSNCoZN86xizrvv7jgyvxEDWtrohACswakIbs2uPScTHo7vCxoC2wXA?=
 =?us-ascii?Q?neUvu6B/Z/c3dVUP8fEP5aaPiYDp0mEIMdGSTm8B5g9igqcTegG3OzZ+YQgK?=
 =?us-ascii?Q?uPaCVnkFtAUGGGnDf4PbbeRq5BwnG81Mtl4Gl1LQHQzpTGjl7rvXR6I6JOOV?=
 =?us-ascii?Q?MFsHaU14rciOCuc9ms+B9MYYF/Pw+k9SNsSdYKXMgtv1oqQiKN4eT3OtMPcp?=
 =?us-ascii?Q?DgFF2tHK33F9+jM5hg/yg7aHvaYfj52sVcFWy9tIfh2HOOWugM4tlOYyrApZ?=
 =?us-ascii?Q?D7ekzuzKvwxPnP9j1KC2Y9GzRel1e2h3n7hKrwxYdxqZaZIndmlAjwkIkgEp?=
 =?us-ascii?Q?HBfaY5JSexE8W6IrXxj+AOYHgxzJi3GkCsTfFwoLCWLbkylkLg534tUvyOaI?=
 =?us-ascii?Q?kGKQD64KVJmCQFhDo0nSgB+BXpCxK3v+1FtJLQBusGF1EvXeF/4XTCrSuZpZ?=
 =?us-ascii?Q?beJWg6/kE1gkPxkjc6dQiKc1RgU8KXxpkp/9OohSLFOIM3MOUZ5zntwDeGTd?=
 =?us-ascii?Q?IW2Z9rXeKAYBJbswRdteBoPl7xT2HnYhEKbkj/OkqEELFU8h03fv6rByUN6Z?=
 =?us-ascii?Q?QSI+Br//YEeMerAGrFCi+GJREGU14ThwAbbv+R+Lik08vSKnd8jVlYgtHw5B?=
 =?us-ascii?Q?1k2EWU92treW2aryf6UN2j1fMUYPpoYS7BIc84ewVoxZ/UfkhsoenI6hYBYA?=
 =?us-ascii?Q?uL9gsxWcroaKUIe/zqnx7B4GqiDRRro+5qFxT0wDsx+ZTsd4lp+T/rsdUdl1?=
 =?us-ascii?Q?k11eCxBjKsws8JGBRo4V0zLmizPPa6HTzNDia8+bEnHrh1Vwl+mbQFCqXtb4?=
 =?us-ascii?Q?s7MqECxfVcqw6U2O83LEH8b49pKVyP3GdhJ+FPgJU8keoXW/RqE/pjoUbI3I?=
 =?us-ascii?Q?MnwImkobESA42E8QZALwgkMTWDLlVZYYyUxidmi4JYmRrVo7dHN4KWYXT94X?=
 =?us-ascii?Q?SAczfQEwXRlHO2dV29mVGmeEFUD+ZRUrEvrElp4BpYSnJlFQ1UQRk3L0AFb/?=
 =?us-ascii?Q?FT5j4JG4CdlKvdC6ICEGcKE+v0dlHmWzOMdOVP4NRxnN+BWxmwYigCNo6EQ5?=
 =?us-ascii?Q?eja8/t3nNfFAv7OvgPgxxcUTqlNRONZZO6ZicS1dUya689f/D7GKsuAxwASa?=
 =?us-ascii?Q?xh9yf/7JOkGDeDhKkkW5EN0P+jWzr/b8fve3muy7gYasYDFWp2fVh9bWngMw?=
 =?us-ascii?Q?UUPGzIdb5Qn7snfufX/k4aWdayRdR9HBpu01qgdYhzlotI5h+X5Kc+vHdTev?=
 =?us-ascii?Q?sTN1i+lK4h9VUkHmfTdhCBWIepps+NjzbM6Jczcsvx7/yMs7a3nbnzwIOYUF?=
 =?us-ascii?Q?x9mugrinwE25xGm8R1oNvaGkQ9NZY9WzJaO9WnRmokcX/t3GRw6Hn/qBCHKC?=
 =?us-ascii?Q?QUqQ+1o82x7rTQOqh9b5NAFVLwt2XpFoKkGJtACmzOCSNOTSrN6UMiwKl79c?=
 =?us-ascii?Q?Uk63UugyClqNy1RoCRwlaiCX4tXJpphwslkDfWPbaiTYv7WAIwrTKUNAKb6c?=
 =?us-ascii?Q?emcxgB0xspr3pkXVspH9511vLhLrJzIMD1qZuSHnfHCRa14grDlvYWfyI+Ai?=
 =?us-ascii?Q?7PtOs3E1InmvjCLJ5fBi4RZiSVOTI8E=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f08551-38f3-480f-8e8e-08df40b4420b
X-MS-Exchange-CrossTenant-AuthSource: MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 11:58:25.6992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YtmUdJGPGhKtdrIb1+B2aDz1ZHvL41/fMDK+O5XsEou11GJNdwRjX4cI8rJ9bOiFznOpycsQ+PCSByFvq7fVimCj6NzJl+dQd+ZSPHSVuKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB345665
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 14:04:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250097
Content-Type: text/plain; charset="utf-8"

From: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>

NVD describes CVE-2026-5450 as a one-byte heap buffer overflow in the
scanf family when using %mc with an explicit field width greater than
1024. The affected versions are glibc 2.7 through 2.43, including the
2.39 version used by this recipe.

Backport upstream commit 839898 fixes the buffer-growth calculation
in vfscanf-internal.c, which can allocate one element too few,
and adds a regression test using %1040mc with malloc
checking enabled.

Reference: https://nvd.nist.gov/vuln/detail/CVE-2026-5450

Comment: Refreshed for glibc 2.39[adjusted source hunk locations and
Makefile contexts]

Signed-off-by: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>
---
 .../glibc/glibc/CVE-2026-5450.patch           | 132 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2026-5450.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2026-5450.patch b/meta/recip=
es-core/glibc/glibc/CVE-2026-5450.patch
new file mode 100644
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2026-5450.patch
@@ -0,0 +1,132 @@
+From 839898777226a3ed88c0859f25ffe712519b4ead Mon Sep 17 00:00:00 2001
+From: Rocket Ma <marocketbd@gmail.com>
+Date: Fri, 17 Apr 2026 23:48:41 -0700
+Subject: [PATCH] stdio-common: Fix buffer overflow in scanf %mc [BZ #34008=
]
+
+* stdio-common/vfscanf-internal.c: When enlarging allocated buffer with
+format %mc or %mC, glibc allocates one byte less, leading to
+user-controlled one byte overflow. This commit fixes BZ #34008, or
+CVE-2026-5450.
+
+CVE: CVE-2026-5450
+Upstream-Status: Backport [https://sourceware.org/cgit/glibc/commit/?id=3D=
839898777226a3ed88c0859f25ffe712519b4ead]
+Comment: Refreshed for glibc 2.39[adjusted source hunk locations and
+Makefile contexts]
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Signed-off-by: Rocket Ma <marocketbd@gmail.com>
+Reviewed-by: H.J. Lu <hjl.tools@gmail.com>
+Signed-off-by: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in=
>
+---
+ stdio-common/Makefile             |  4 ++++
+ stdio-common/tst-vfscanf-bz34008.c | 48 +++++++++++++++++++++++++++++++++=
+++++++
+ stdio-common/vfscanf-internal.c   |  6 ++---
+ 3 files changed, 55 insertions(+), 3 deletions(-)
+ create mode 100644 stdio-common/tst-vfscanf-bz34008.c
+
+diff --git a/stdio-common/Makefile b/stdio-common/Makefile
+--- a/stdio-common/Makefile
++++ b/stdio-common/Makefile
+@@ -266,6 +266,7 @@ tests :=3D \
+   tst-vfprintf-width-i18n \
+   tst-vfprintf-width-prec \
+   tst-vfprintf-width-prec-alloc \
++  tst-vfscanf-bz34008 \
+   tst-wc-printf \
+   tstdiomisc \
+   tstgetln \
+@@ -401,6 +402,9 @@ tst-printf-bz18872-ENV =3D MALLOC_TRACE=3D$(objpfx)tst=
-printf-bz18872.mtrace \
+ tst-vfprintf-width-prec-ENV =3D \
+   MALLOC_TRACE=3D$(objpfx)tst-vfprintf-width-prec.mtrace \
+   LD_PRELOAD=3D$(common-objpfx)/malloc/libc_malloc_debug.so
++tst-vfscanf-bz34008-ENV =3D \
++  MALLOC_CHECK_=3D3 \
++  LD_PRELOAD=3D$(common-objpfx)/malloc/libc_malloc_debug.so
+ tst-printf-bz25691-ENV =3D \
+   MALLOC_TRACE=3D$(objpfx)tst-printf-bz25691.mtrace \
+   LD_PRELOAD=3D$(common-objpfx)/malloc/libc_malloc_debug.so
+diff --git a/stdio-common/tst-vfscanf-bz34008.c b/stdio-common/tst-vfscanf=
-bz34008.c
+new file mode 100644
+--- /dev/null
++++ b/stdio-common/tst-vfscanf-bz34008.c
+@@ -0,0 +1,48 @@
++/* Regression test for vfscanf %Nmc out-of-bound write (BZ #34008)
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
++#include "malloc/mcheck.h"
++#include <stddef.h>
++#include <stdio.h>
++#include <string.h>
++#include <wchar.h>
++#include <stdlib.h>
++#include <malloc.h>
++#include <support/check.h>
++
++#define WIDTH 0x410
++#define SCANFSTR "%1040mc"
++static int
++do_test (void)
++{
++  mcheck_pedantic (NULL);
++  char *input =3D malloc (WIDTH + 1);
++  TEST_VERIFY (input !=3D NULL);
++  memset (input, 'A', WIDTH);
++  input[WIDTH] =3D '\0';
++
++  char *buf =3D NULL;
++  TEST_VERIFY (sscanf (input, SCANFSTR, &buf) !=3D -1);
++  TEST_VERIFY (buf !=3D NULL);
++
++  free (buf);
++  free (input);
++  return 0;
++}
++
++#include <support/test-driver.c>
+diff --git a/stdio-common/vfscanf-internal.c b/stdio-common/vfscanf-intern=
al.c
+--- a/stdio-common/vfscanf-internal.c
++++ b/stdio-common/vfscanf-internal.c
+@@ -854,7 +854,7 @@ __vfscanf_internal (FILE *s, const char *format, va_li=
st argptr,
+ 			  /* Enlarge the buffer.  */
+ 			  size_t newsize
+ 			    =3D strsize
+-			      + (strsize >=3D width ? width - 1 : strsize);
++			      + (strsize >=3D width ? width : strsize);
+=20
+ 			  str =3D (char *) realloc (*strptr, newsize);
+ 			  if (str =3D=3D NULL)
+@@ -925,7 +925,7 @@ __vfscanf_internal (FILE *s, const char *format, va_li=
st argptr,
+ 		      && wstr =3D=3D (wchar_t *) *strptr + strsize)
+ 		    {
+ 		      size_t newsize
+-			=3D strsize + (strsize > width ? width - 1 : strsize);
++			=3D strsize + (strsize >=3D width ? width : strsize);
+ 		      /* Enlarge the buffer.  */
+ 		      wstr =3D (wchar_t *) realloc (*strptr,
+ 						  newsize * sizeof (wchar_t));
+@@ -980,7 +980,7 @@ __vfscanf_internal (FILE *s, const char *format, va_li=
st argptr,
+ 		    && wstr =3D=3D (wchar_t *) *strptr + strsize)
+ 		  {
+ 		    size_t newsize
+-		      =3D strsize + (strsize > width ? width - 1 : strsize);
++		      =3D strsize + (strsize >=3D width ? width : strsize);
+ 		    /* Enlarge the buffer.  */
+ 		    wstr =3D (wchar_t *) realloc (*strptr,
+ 						newsize * sizeof (wchar_t));
+--=20
+2.43.0
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glib=
c/glibc_2.39.bb
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -63,6 +63,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=
=3Dglibc \
            file://0028-CVE-2026-6238-0004.patch \
            file://0029-CVE-2026-6238-0005.patch \
            file://0030-CVE-2026-6238-0006.patch \
+           file://CVE-2026-5450.patch \
 "
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
--=20
2.43.0

