Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11906.1794485672891429883
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 04:14:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=aYMRtCc8;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.17, mailfrom: upstream_ip-sp@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=skqkBTNWa88VLjltFfSX9TSDpgVoBNDnmvAvrZrH8vRX+YXfJKWKfXICESaYmkkbRYKOmiL2X4oD955jv4CYavzheGOGBDFW/lZwp1by+5whCanXrhAsTmh9LedNyze/Zip2Dc3I9uTlFyj6/OJ9ptrdp+jTpBFLTts7xOKsWqdv+ypSsriYiBNn1bu/xJ30enzNb/te/LWxdtFXUHdBVrix436F/z+Wmx7Ma95i/YFBXkM7eDsLDLxBGEK2OaRFFrabx3m2ZCHy/KPP7Q0T3rYa9DjjPIRROQxB4/pxbqRvzloMfe01kCa7ttveS+RM+CAPu/kMX/zucQC4mGr4oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pc8Xn9Bc5AGFgi9+fs8vwZ/Xjh30Bcwy79r1EQfYppE=;
 b=U0w+xzWf56HeFEPXfBJDgjMHue+BuZybzHB0oBS/J44yKSkm1KJ0Y0MkVDElWtDBsRwOamOn/Sjf0MtEquRdcCyuFtZ5nozuYXfoKL42LG4xpp+ncGN5ZA1/R7mJlAgzWvMs0aJ+tSoKeuy/hguqXRXZpuU225eZXk1xPutswyzkAYi53IR4drgJCBkToLRd+FzlrS43ZHz7OAn1jxjKrwW9nAns5qhQb63qO2n4V4eB/BgJwOya9SG2iAtSmO3SXNxOGdTn8M6oznWFhHdP1HZjXiA8KO6ILFZHOrHvLdTaVzLcew6O5RSwH0Nd8kqNk+uca7mdpOnvYbul1HMAZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pc8Xn9Bc5AGFgi9+fs8vwZ/Xjh30Bcwy79r1EQfYppE=;
 b=aYMRtCc80OQGZzS2yvMEUnBaqoLCaglU74B84kQbPR9NsXEdM3g+PXYkAjLx0ykA0aLmGhCEvuAXbwaIwNSH6Q8gmSiQcG/5Sft58b8mhK4/gytFgMnyLwIVPtnKjwQfOoIsLjd4YPa6mdGYwb04CgtrI1d1XNw0198eEIFbyizAzMIfLMihg4OQyYVAICK0JaFH28J3YCimXOk2fIZYsoxMZnyqHUrar/eIoDgr1PNAgUVBt120jQF+oo2hzZr4o8m0bMkUysW/TTBXkYgFhl88L8SoN/Pte9So1zlY9vGRgzT2xe92aj+eESuOVzFUmNMNqkIGFG0GK3WkcXUW1Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA5P287MB5315.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1bb::5)
 by MA5P287MB345665.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:249::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 11:58:31 +0000
Received: from MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
 ([fe80::69b8:6140:9c:b6de]) by MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
 ([fe80::69b8:6140:9c:b6de%2]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 11:58:31 +0000
From: Sourav Kumar Pramanik <UpStream_IP-SP@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>
Subject: [scarthgap][PATCH v3 2/2] glibc: Fix CVE-2026-5928
Date: Thu, 12 Nov 2026 17:28:18 +0530
Message-ID: <20261112115818.76259-2-UpStream_IP-SP@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112115818.76259-1-UpStream_IP-SP@bmwtechworks.in>
References: <20261112115818.76259-1-UpStream_IP-SP@bmwtechworks.in>
X-ClientProxiedBy: PN0PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::10) To MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1bb::5)
Return-Path: UpStream_IP-SP@bmwtechworks.in
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5P287MB5315:EE_|MA5P287MB345665:EE_
X-MS-Office365-Filtering-Correlation-Id: fe6db2e1-5065-4e4b-3697-08df40b4455b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|23010399003|366016|38350700014|10067099003|5023799004|11063799006|56012099006|261022105027099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|55112099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: cJi+w/huLUwDjqn2fsOBubNna0/csUGlSpd5h1LYuXBJ4AhQibhPf4mb38B1VEyHRmJJ5rFeFuMJGa7Mnvh9Sg8OolJ6B5FmefntZKK/K3TipYjxSU6kUHKYnW/aV/AGNRbeAMPoSto20SylC318G4s6ltOjo/W3LIRKxsQs3SspojBHC5fW/ypPFAHvAlqlEmJqJlR83bGaHlwSjttU6t+wrmw7TF5xpxII2jWUQAeBRP8C0lfPOdOt3nTYu9dRmxr5DNFNEQYG6oIs9GXhT15o1JipvWpldn9yi1wtgN/813twdNdJa4h/dNJ3KkhBC36+rSDYlgxr3zsE9K3oN15ECJkbEGxvUQtkb2yXPekRcSENCp89/TSoLTalbK00MeJFvMxzYWmZRe1FOeYBU84v3nU0cU6kzF9NNiEkzbSYrSkOkgA4iOKBdL6dLM5ylKu/K+rkOKXPOoTdS5QpZjF2ju1Mq9vv/u/PRfI2mtz1JfnEsfPyAKJGG0V1/2zwFW44LRWYwr4vWEJjt56yfQJN9EdmAwqYZV/ohmZ6RFqqp74MrpWtS67IR23sSVO2bfCBi/WRlTtCXgIEV+ggA91CuV5TrM/f/z+Y/1skx/Kk58meiZy8BDV54+kHA8gaTX3DBXTjwcdJ+fYAlfrwnQmqzu2x+QFYUe8sPaotpaI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA5P287MB5315.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(23010399003)(366016)(38350700014)(10067099003)(5023799004)(11063799006)(56012099006)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(55112099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XN/LCeDNjm000/8LvIWIegxH5DVJg8sm683iD246jmXOmXPDSPBifmaqfVQ0?=
 =?us-ascii?Q?4jAUG+f5UKqCB1DwoCAHE1DbdYaHD6tlYMMMa7AU+Y34guUCLR+NGqneqxOZ?=
 =?us-ascii?Q?OQDsM7mTi9hyezQrXIBIuwJg8AcdMRFwLQu9kanTYjOcFzUQMi+S3JgN5fqw?=
 =?us-ascii?Q?cqF9hDCOgX/jM68uOcwOogPJhryhctYiDgftYcTFMBrDHd/GzHcX+EiTZXpv?=
 =?us-ascii?Q?lFXXy0RBKxWYz3jXzPEDS69a57O15fAVcLZG4yi2uXGbCzRMEhM5e1VZ89k7?=
 =?us-ascii?Q?FFwMmfTy2eJLQhxdNBgXq0yGjZCynYv1yZrIOb9EmGitxCG70beOYn3FkUfZ?=
 =?us-ascii?Q?CT7sN6OhcnysqmykHkfkf38odJl5xIPJBDKi60uf95S02nIr3EDf2XX2Br7B?=
 =?us-ascii?Q?FxZzY9rvBe5JKM3NxuS2UaYQEa0IXKTnOjH7tsZjZwDQmUwl71gxKqho1Xp1?=
 =?us-ascii?Q?vLgU37jtcZ0ZuRzn25fBP1F63rPS3NHRBzOt1sUi+IB4RC4y5ADCZwzuF3xw?=
 =?us-ascii?Q?z/xt4mQS3DE2TAIMF6xvdX4NBQjJkihZ3LQ7bE42T8YUtWQWprysqVR3gCsv?=
 =?us-ascii?Q?njltjq9Dqkj4Qa5wNFImKvGOKMz3E61sZdlzrUtXi5gl6aQXyJWnxRGXfyVf?=
 =?us-ascii?Q?r3AD7RHby5uJ0fDH3v8P3dWmVRSPHsxZYwxH4Bv4g/c4GcJrDhLwBEBadqeZ?=
 =?us-ascii?Q?zybLjooHR4hb4mE1G20PBDSTTHSRkiVxSWSFMUgtYgf/cwy6OfagTvFZHuvw?=
 =?us-ascii?Q?mp3s1JgRMK/gVepLxJaoa9SBMZt1KTRSY9zTr0EgaOcnkhF4+mk0S0vWEe5C?=
 =?us-ascii?Q?Y4DAA6Yiejh74897EnWZzIKaycLG4k/WK7JRBG55ftkaszVM8C3fVbedNTCh?=
 =?us-ascii?Q?4Ud8xkOboPryw5cggcYeuSFhiPcKAaskU0fNpLkqb9Au9q7avHXzK/ICruK0?=
 =?us-ascii?Q?uPWtRqqRu9azIuWfwyX7NuTT10oGo0iiGNhDRAmAvhmIVNG8uLGML1xYhr3/?=
 =?us-ascii?Q?LhFBlUK3e94lmdmd+su9YvuOaMJ8rv/2IBUtQtI2fcSt2fbuZW3gvuTjLTqG?=
 =?us-ascii?Q?L3lRlfNqqMhZLZyEIW544/6h//69Qrg7geQ29H9rcHeniAgYVrYEe46BgPpF?=
 =?us-ascii?Q?d/r4+7TWkPqYwB7UgDPYcOnrab5hsaiiYW7J65S9EQZZeRe2pXLcA2NHBMQc?=
 =?us-ascii?Q?w2PycM1qP47C6+362AgWLa8fsVOHxmvFMMDRqUu+dkysGNIVqTpAIwrnEWyp?=
 =?us-ascii?Q?4giB4NDZ/81SuH8wXP9RyilVYW4mPQ3f7BPC2V/VXQOfB/A2d6LJh++CCwao?=
 =?us-ascii?Q?xojHRe6yEWzTwUaS/nDImo7IcGIezWMprQ2rc70bfDjw9iz18DKmBg+UuNml?=
 =?us-ascii?Q?WD63irCipGFEn03Fc1BLrw8qQOXIzYvkcMXGx7CGhvHMvDO46eS4j0RL7YTJ?=
 =?us-ascii?Q?iSIr6KiHTB9oYao0Sna6ju3WDTYFl6lDsNLjcdyo57I9EBj5IRntqrUbPKHx?=
 =?us-ascii?Q?2MPen5VuqBRXVYCASM+QYwwt2/iURLSkwcGHmH8bAa8h4Mu70mxGmHeGZ7pa?=
 =?us-ascii?Q?viJY7e3p7uxOum9G8JAqoy/K6yWOeX6b6hbGo5ny4ZpO8vQjBmsUqaRAaqBc?=
 =?us-ascii?Q?nUzoIXMuSfE8MbkLjrcrdKRMTNZrYJleZjxyT68d6Hmy6l422+0D9nzdGPeT?=
 =?us-ascii?Q?xiaEEIJMj75Tgi2RAxoeA6LXr2MXYoziy4QXDwdZK81FsCmn1WzMTa4xr7pQ?=
 =?us-ascii?Q?PIkzhJ8f7IMKAY1gfPlhoft1hh1XDc8=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6db2e1-5065-4e4b-3697-08df40b4455b
X-MS-Exchange-CrossTenant-AuthSource: MA5P287MB5315.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 11:58:31.2373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VgHv8t/1MWtmvOTMdSe4YDec6FdcD6Gy1tYk5nRsGyQ/O/BYmP7YKp/r/IDrfOo6VrvQ9Mtciaoa2L+KOmrK+fcm2uJG/c+MAlyAQh9l4gQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB345665
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 14:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250098
Content-Type: text/plain; charset="utf-8"

From: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>

NVD describes CVE-2026-5928 as a buffer under-read in ungetwc in
glibc 2.43 and earlier, including the 2.39 version used here. With
certain character encodings, this can disclose neighboring heap
data. An uninitialized byte-stream read pointer can also cause a
program crash.

Backport upstream commit ef3bfb5f910011f3780cb06aa47e730035f53285.
It fixes _IO_wdefault_pbackfail to compare and decrement the wide
stream read pointer instead of the byte stream read pointer. The
regression test checks that ungetwc leaves the byte stream read
pointer unchanged.

Reference: https://nvd.nist.gov/vuln/detail/CVE-2026-5928

Comment: Refreshed for glibc 2.39[adjusted source hunk locations and
Makefile contexts]

Signed-off-by: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>
---
 .../glibc/glibc/CVE-2026-5928.patch           | 112 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2026-5928.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2026-5928.patch b/meta/recip=
es-core/glibc/glibc/CVE-2026-5928.patch
new file mode 100644
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2026-5928.patch
@@ -0,0 +1,112 @@
+From ef3bfb5f910011f3780cb06aa47e730035f53285 Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2026-5928
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=3Dc=
ommit;h=3Def3bfb5f910011f3780cb06aa47e730035f53285]
+Comment: Refreshed for glibc 2.39[adjusted source hunk locations and
+Makefile contexts]
+
+Signed-off-by: Rocket Ma <marocketbd@gmail.com>
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Signed-off-by: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in=
>
+---
+ libio/Makefile            |  1 +
+ libio/bug-wgenops-bz33998.c | 54 ++++++++++++++++++++++++++++++++++++++++=
++++++
+ libio/wgenops.c           |  4 ++--
+ 3 files changed, 57 insertions(+), 2 deletions(-)
+ create mode 100644 libio/bug-wgenops-bz33998.c
+
+diff --git a/libio/Makefile b/libio/Makefile
+--- a/libio/Makefile
++++ b/libio/Makefile
+@@ -83,6 +83,7 @@ tests =3D \
+   bug-ungetwc1 \
+   bug-ungetwc2 \
+   bug-wfflush \
++  bug-wgenops-bz33998 \
+   bug-wmemstream1 \
+   bug-wsetpos \
+   test-fmemopen \
+diff --git a/libio/bug-wgenops-bz33998.c b/libio/bug-wgenops-bz33998.c
+new file mode 100644
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
++  int fd =3D create_temp_file ("tst-bz33998-", &filename);
++  TEST_VERIFY (fd !=3D -1);
++  xwrite (fd, "A", sizeof ("A")); // write "A\0" by design
++  xclose (fd);
++
++  FILE *fp =3D xfopen (filename, "r+");
++  TEST_COMPARE (getwc (fp), L'A');
++  /* If the bug is fixed, then ungetwc should not touch byte stream.
++     If the bug is not fixed, ungetwc firstly match last read char, L'A',
++     failed, then the pbackfail branch, matching last read char in byte
++     stream, that is, '\0' (initialized when setup wide stream). */
++  char *old_read_ptr =3D fp->_IO_read_ptr;
++  TEST_COMPARE (ungetwc (L'\0', fp), L'\0');
++  TEST_VERIFY (fp->_IO_read_ptr =3D=3D old_read_ptr);
++
++  xfclose (fp);
++  free (filename);
++
++  return 0;
++}
++
++#include <support/test-driver.c>
+diff --git a/libio/wgenops.c b/libio/wgenops.c
+--- a/libio/wgenops.c
++++ b/libio/wgenops.c
+@@ -108,8 +108,8 @@ _IO_wdefault_pbackfail (FILE *fp, wint_t c)
+ {
+   if (fp->_wide_data->_IO_read_ptr > fp->_wide_data->_IO_read_base
+       && !_IO_in_backup (fp)
+-      && (wint_t) fp->_IO_read_ptr[-1] =3D=3D c)
+-    --fp->_IO_read_ptr;
++      && (wint_t) fp->_wide_data->_IO_read_ptr[-1] =3D=3D c)
++    --fp->_wide_data->_IO_read_ptr;
+   else
+     {
+       /* Need to handle a filebuf in write mode (switch to read mode). FI=
XME!*/
+--=20
+2.43.0
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glib=
c/glibc_2.39.bb
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -64,6 +64,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=
=3Dglibc \
            file://0029-CVE-2026-6238-0005.patch \
            file://0030-CVE-2026-6238-0006.patch \
            file://CVE-2026-5450.patch \
+           file://CVE-2026-5928.patch \
 "
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
--=20
2.43.0

