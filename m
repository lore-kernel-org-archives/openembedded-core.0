Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.9855.1616277987165633065
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Mar 2021 15:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dl2nI1Es;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id b184so8361894pfa.11
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Mar 2021 15:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=szucUXyz7Xta4lRFX3VJhtGocDaBAwvW7uwrHEg+hDA=;
        b=dl2nI1EsCVeuovrEXDfPsmf7lJmumxi2OrLHnfMDAcQ86ztbh+46CtWS11NY8WAO4H
         hlSip6tfAx4jXUBQkzrXgMfCfBJeoCZ39HG7pe1QW3vTUNnKcWi2iiSo4jN6keezLEU6
         HH48mjgO/YzWzSiHGx0/PMmgRvqQ4x+U7BAJX4buDFpZFgmmJJ7yLFuk6WiHAL92AdZU
         xDzTGIAkj+YAT0EQhF2uuUmry+2ZtdlVGfgKH8WdvEIpCicDpIYkAugnTMkhmKKAm6Ch
         B200Bi5XBLLlAqPbuY8Sv4Wsp2+wg1kaIJJAkEFR3YUGqsrairBORRbQk0oo6Isspdr0
         7uBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=szucUXyz7Xta4lRFX3VJhtGocDaBAwvW7uwrHEg+hDA=;
        b=Y2RrHinzyu747IsKcdGGmOgUwohzLw0o/gOTiSj5OKJpHjCU8R0xtud5EimIX0iYTL
         OYXCc3udTitpqYviLBAEGoDo9sbCpydLCPAqvB3b8mzXfpo4Qx6U/0alPn2XeawVRs3B
         te7JvZdzZdsz7KfORV2X3K3R2dz7L/KS7PLjn/+A8rvz85TrGsCbHaxZHvgtt5PJEjnI
         N7K3JxfFYc+LqNx7TgS2g02yurgDH2Br70FS6k8c2NgOWKCpZ1nCpwGJ6+W3q9FuZTf+
         YX1EPIcmdXJWkozgH3XvJzhCUto4sjGJHwGEPqC1a6d/BkfSqamyUe4tQvKyOfM2PH6y
         cuIw==
X-Gm-Message-State: AOAM533BtVbJ9mF8f2L/aKPpM3lv/F1EOHU0+DxBJnbujkgin+hfRu3x
	BCdj23HJwdT9Mwt3SpSLTjtedKnc34HV/Q==
X-Google-Smtp-Source: ABdhPJy9outQUowm4huTWeAqydtlW0r9a5nf1I+HQ/WLQuNi55FK/ht6tyX6w/AB2ReFIPzXqjpbqg==
X-Received: by 2002:a63:508:: with SMTP id 8mr2642979pgf.220.1616277986285;
        Sat, 20 Mar 2021 15:06:26 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:c4a9:4187:9c07:8080? ([2601:646:9200:a0f0:c4a9:4187:9c07:8080])
        by smtp.gmail.com with ESMTPSA id v23sm8577320pfn.71.2021.03.20.15.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Mar 2021 15:06:25 -0700 (PDT)
Subject: Re: [OE-core] [dunfell][PATCH] glibc: Pull latest 2.31 HEAD
To: Anatol Belski <anbelski@linux.microsoft.com>,
 openembedded-core@lists.openembedded.org
References: <20210320163427.8554-1-anbelski@linux.microsoft.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <649543ea-d852-fc72-c985-d80f79c75f5c@gmail.com>
Date: Sat, 20 Mar 2021 15:06:25 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210320163427.8554-1-anbelski@linux.microsoft.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/20/21 9:34 AM, Anatol Belski wrote:
> The relevant commit log:
> 
> $ git log --format="%h %s" df31c7ca927242d5d4eee97f93a01e23ff47e332..f84949f1c4bbf20e6a1d9a5859cf012cde060ede
> f84949f1c4 powerpc64: Workaround sigtramp vdso return call
> 5e43566f0f nscd: Fix double free in netgroupcache [BZ #27462]
> d0c84d22b6 gconv: Fix assertion failure in ISO-2022-JP-3 module (bug 27256)
> af316e4627 x86: Check IFUNC definition in unrelocated executable [BZ #20019]
> 36eb01dd85 x86: Set header.feature_1 in TCB for always-on CET [BZ #27177]
> 8b7be87aa2 x86-64: Avoid rep movsb with short distance [BZ #27130]
> c4f5e32aae Fix buffer overrun in EUC-KR conversion module (bz #24973)
> 0858f46440 Add NEWS entry for CVE-2020-29562 (BZ #26923)
> 1e40391de2 iconv: Fix incorrect UCS4 inner loop bounds (BZ#26923)
> 568c86274a tests-mcheck: New variable to run tests with MALLOC_CHECK_=3
> 


thanks this looks good to me. Thansk for good changelog

> Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
> ---
>   meta/recipes-core/glibc/glibc-version.inc     |   2 +-
>   .../glibc/glibc/CVE-2019-25013.patch          | 135 ---------------
>   .../glibc/glibc/CVE-2020-29562.patch          | 156 ------------------
>   meta/recipes-core/glibc/glibc_2.31.bb         |   6 +-
>   4 files changed, 4 insertions(+), 295 deletions(-)
>   delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
>   delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-29562.patch
> 
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
> index 5f726537ff..7ae64a190f 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>   SRCBRANCH ?= "release/2.31/master"
>   PV = "2.31+git${SRCPV}"
> -SRCREV_glibc ?= "df31c7ca927242d5d4eee97f93a01e23ff47e332"
> +SRCREV_glibc ?= "f84949f1c4bbf20e6a1d9a5859cf012cde060ede"
>   SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
>   
>   GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch b/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
> deleted file mode 100644
> index 73df1da868..0000000000
> --- a/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
> +++ /dev/null
> @@ -1,135 +0,0 @@
> -From ee7a3144c9922808181009b7b3e50e852fb4999b Mon Sep 17 00:00:00 2001
> -From: Andreas Schwab <schwab@suse.de>
> -Date: Mon, 21 Dec 2020 08:56:43 +0530
> -Subject: [PATCH] Fix buffer overrun in EUC-KR conversion module (bz #24973)
> -
> -The byte 0xfe as input to the EUC-KR conversion denotes a user-defined
> -area and is not allowed.  The from_euc_kr function used to skip two bytes
> -when told to skip over the unknown designation, potentially running over
> -the buffer end.
> -
> -Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=ee7a3144c9922808181009b7b3e50e852fb4999b]
> -CVE: CVE-2019-25013
> -Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> -[Refreshed for Dundell context; Makefile changes]
> -Signed-off-by: Armin Kuster <akuster@mvista.com>
> -
> ----
> - iconvdata/Makefile      |  3 ++-
> - iconvdata/bug-iconv13.c | 53 +++++++++++++++++++++++++++++++++++++++++
> - iconvdata/euc-kr.c      |  6 +----
> - iconvdata/ksc5601.h     |  6 ++---
> - 4 files changed, 59 insertions(+), 9 deletions(-)
> - create mode 100644 iconvdata/bug-iconv13.c
> -
> -Index: git/iconvdata/Makefile
> -===================================================================
> ---- git.orig/iconvdata/Makefile
> -+++ git/iconvdata/Makefile
> -@@ -73,7 +73,7 @@ modules.so := $(addsuffix .so, $(modules
> - ifeq (yes,$(build-shared))
> - tests = bug-iconv1 bug-iconv2 tst-loading tst-e2big tst-iconv4 bug-iconv4 \
> - 	tst-iconv6 bug-iconv5 bug-iconv6 tst-iconv7 bug-iconv8 bug-iconv9 \
> --	bug-iconv10 bug-iconv11 bug-iconv12
> -+	bug-iconv10 bug-iconv11 bug-iconv12 bug-iconv13
> - ifeq ($(have-thread-library),yes)
> - tests += bug-iconv3
> - endif
> -Index: git/iconvdata/bug-iconv13.c
> -===================================================================
> ---- /dev/null
> -+++ git/iconvdata/bug-iconv13.c
> -@@ -0,0 +1,53 @@
> -+/* bug 24973: Test EUC-KR module
> -+   Copyright (C) 2020 Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library; if not, see
> -+   <https://www.gnu.org/licenses/>.  */
> -+
> -+#include <errno.h>
> -+#include <iconv.h>
> -+#include <stdio.h>
> -+#include <support/check.h>
> -+
> -+static int
> -+do_test (void)
> -+{
> -+  iconv_t cd = iconv_open ("UTF-8//IGNORE", "EUC-KR");
> -+  TEST_VERIFY_EXIT (cd != (iconv_t) -1);
> -+
> -+  /* 0xfe (->0x7e : row 94) and 0xc9 (->0x49 : row 41) are user-defined
> -+     areas, which are not allowed and should be skipped over due to
> -+     //IGNORE.  The trailing 0xfe also is an incomplete sequence, which
> -+     should be checked first.  */
> -+  char input[4] = { '\xc9', '\xa1', '\0', '\xfe' };
> -+  char *inptr = input;
> -+  size_t insize = sizeof (input);
> -+  char output[4];
> -+  char *outptr = output;
> -+  size_t outsize = sizeof (output);
> -+
> -+  /* This used to crash due to buffer overrun.  */
> -+  TEST_VERIFY (iconv (cd, &inptr, &insize, &outptr, &outsize) == (size_t) -1);
> -+  TEST_VERIFY (errno == EINVAL);
> -+  /* The conversion should produce one character, the converted null
> -+     character.  */
> -+  TEST_VERIFY (sizeof (output) - outsize == 1);
> -+
> -+  TEST_VERIFY_EXIT (iconv_close (cd) != -1);
> -+
> -+  return 0;
> -+}
> -+
> -+#include <support/test-driver.c>
> -Index: git/iconvdata/euc-kr.c
> -===================================================================
> ---- git.orig/iconvdata/euc-kr.c
> -+++ git/iconvdata/euc-kr.c
> -@@ -80,11 +80,7 @@ euckr_from_ucs4 (uint32_t ch, unsigned c
> - 									      \
> -     if (ch <= 0x9f)							      \
> -       ++inptr;								      \
> --    /* 0xfe(->0x7e : row 94) and 0xc9(->0x59 : row 41) are		      \
> --       user-defined areas.  */						      \
> --    else if (__builtin_expect (ch == 0xa0, 0)				      \
> --	     || __builtin_expect (ch > 0xfe, 0)				      \
> --	     || __builtin_expect (ch == 0xc9, 0))			      \
> -+    else if (__glibc_unlikely (ch == 0xa0))				      \
> -       {									      \
> - 	/* This is illegal.  */						      \
> - 	STANDARD_FROM_LOOP_ERR_HANDLER (1);				      \
> -Index: git/iconvdata/ksc5601.h
> -===================================================================
> ---- git.orig/iconvdata/ksc5601.h
> -+++ git/iconvdata/ksc5601.h
> -@@ -50,15 +50,15 @@ ksc5601_to_ucs4 (const unsigned char **s
> -   unsigned char ch2;
> -   int idx;
> -
> -+  if (avail < 2)
> -+    return 0;
> -+
> -   /* row 94(0x7e) and row 41(0x49) are user-defined area in KS C 5601 */
> -
> -   if (ch < offset || (ch - offset) <= 0x20 || (ch - offset) >= 0x7e
> -       || (ch - offset) == 0x49)
> -     return __UNKNOWN_10646_CHAR;
> -
> --  if (avail < 2)
> --    return 0;
> --
> -   ch2 = (*s)[1];
> -   if (ch2 < offset || (ch2 - offset) <= 0x20 || (ch2 - offset) >= 0x7f)
> -     return __UNKNOWN_10646_CHAR;
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-29562.patch b/meta/recipes-core/glibc/glibc/CVE-2020-29562.patch
> deleted file mode 100644
> index c51fb3223a..0000000000
> --- a/meta/recipes-core/glibc/glibc/CVE-2020-29562.patch
> +++ /dev/null
> @@ -1,156 +0,0 @@
> -From 228edd356f03bf62dcf2b1335f25d43c602ee68d Mon Sep 17 00:00:00 2001
> -From: Michael Colavita <mcolavita@fb.com>
> -Date: Thu, 19 Nov 2020 11:44:40 -0500
> -Subject: [PATCH] iconv: Fix incorrect UCS4 inner loop bounds (BZ#26923)
> -
> -Previously, in UCS4 conversion routines we limit the number of
> -characters we examine to the minimum of the number of characters in the
> -input and the number of characters in the output. This is not the
> -correct behavior when __GCONV_IGNORE_ERRORS is set, as we do not consume
> -an output character when we skip a code unit. Instead, track the input
> -and output pointers and terminate the loop when either reaches its
> -limit.
> -
> -This resolves assertion failures when resetting the input buffer in a step of
> -iconv, which assumes that the input will be fully consumed given sufficient
> -output space.
> -
> -Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=228edd356f03bf62dcf2b1335f25d43c602ee68d]
> -CVE: CVE-2020-29562
> -Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> -
> ----
> - iconv/Makefile       |  2 +-
> - iconv/gconv_simple.c | 16 ++++----------
> - iconv/tst-iconv8.c   | 50 ++++++++++++++++++++++++++++++++++++++++++++
> - 3 files changed, 55 insertions(+), 13 deletions(-)
> - create mode 100644 iconv/tst-iconv8.c
> -
> -diff --git a/iconv/Makefile b/iconv/Makefile
> -index 30bf996d3a..f9b51e23ec 100644
> ---- a/iconv/Makefile
> -+++ b/iconv/Makefile
> -@@ -44,7 +44,7 @@ CFLAGS-linereader.c += -DNO_TRANSLITERATION
> - CFLAGS-simple-hash.c += -I../locale
> -
> - tests	= tst-iconv1 tst-iconv2 tst-iconv3 tst-iconv4 tst-iconv5 tst-iconv6 \
> --	  tst-iconv7 tst-iconv-mt tst-iconv-opt
> -+	  tst-iconv7 tst-iconv8 tst-iconv-mt tst-iconv-opt
> -
> - others		= iconv_prog iconvconfig
> - install-others-programs	= $(inst_bindir)/iconv
> -diff --git a/iconv/gconv_simple.c b/iconv/gconv_simple.c
> -index d4797fba17..963b29f246 100644
> ---- a/iconv/gconv_simple.c
> -+++ b/iconv/gconv_simple.c
> -@@ -239,11 +239,9 @@ ucs4_internal_loop (struct __gconv_step *step,
> -   int flags = step_data->__flags;
> -   const unsigned char *inptr = *inptrp;
> -   unsigned char *outptr = *outptrp;
> --  size_t n_convert = MIN (inend - inptr, outend - outptr) / 4;
> -   int result;
> --  size_t cnt;
> -
> --  for (cnt = 0; cnt < n_convert; ++cnt, inptr += 4)
> -+  for (; inptr + 4 <= inend && outptr + 4 <= outend; inptr += 4)
> -     {
> -       uint32_t inval;
> -
> -@@ -307,11 +305,9 @@ ucs4_internal_loop_unaligned (struct __gconv_step *step,
> -   int flags = step_data->__flags;
> -   const unsigned char *inptr = *inptrp;
> -   unsigned char *outptr = *outptrp;
> --  size_t n_convert = MIN (inend - inptr, outend - outptr) / 4;
> -   int result;
> --  size_t cnt;
> -
> --  for (cnt = 0; cnt < n_convert; ++cnt, inptr += 4)
> -+  for (; inptr + 4 <= inend && outptr + 4 <= outend; inptr += 4)
> -     {
> -       if (__glibc_unlikely (inptr[0] > 0x80))
> - 	{
> -@@ -613,11 +609,9 @@ ucs4le_internal_loop (struct __gconv_step *step,
> -   int flags = step_data->__flags;
> -   const unsigned char *inptr = *inptrp;
> -   unsigned char *outptr = *outptrp;
> --  size_t n_convert = MIN (inend - inptr, outend - outptr) / 4;
> -   int result;
> --  size_t cnt;
> -
> --  for (cnt = 0; cnt < n_convert; ++cnt, inptr += 4)
> -+  for (; inptr + 4 <= inend && outptr + 4 <= outend; inptr += 4)
> -     {
> -       uint32_t inval;
> -
> -@@ -684,11 +678,9 @@ ucs4le_internal_loop_unaligned (struct __gconv_step *step,
> -   int flags = step_data->__flags;
> -   const unsigned char *inptr = *inptrp;
> -   unsigned char *outptr = *outptrp;
> --  size_t n_convert = MIN (inend - inptr, outend - outptr) / 4;
> -   int result;
> --  size_t cnt;
> -
> --  for (cnt = 0; cnt < n_convert; ++cnt, inptr += 4)
> -+  for (; inptr + 4 <= inend && outptr + 4 <= outend; inptr += 4)
> -     {
> -       if (__glibc_unlikely (inptr[3] > 0x80))
> - 	{
> -diff --git a/iconv/tst-iconv8.c b/iconv/tst-iconv8.c
> -new file mode 100644
> -index 0000000000..0b92b19f66
> ---- /dev/null
> -+++ b/iconv/tst-iconv8.c
> -@@ -0,0 +1,50 @@
> -+/* Test iconv behavior on UCS4 conversions with //IGNORE.
> -+   Copyright (C) 2020 Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library; if not, see
> -+   <http://www.gnu.org/licenses/>.  */
> -+
> -+/* Derived from BZ #26923 */
> -+#include <errno.h>
> -+#include <iconv.h>
> -+#include <stdio.h>
> -+#include <support/check.h>
> -+
> -+static int
> -+do_test (void)
> -+{
> -+  iconv_t cd = iconv_open ("UTF-8//IGNORE", "ISO-10646/UCS4/");
> -+  TEST_VERIFY_EXIT (cd != (iconv_t) -1);
> -+
> -+  /*
> -+   * Convert sequence beginning with an irreversible character into buffer that
> -+   * is too small.
> -+   */
> -+  char input[12] = "\xe1\x80\xa1" "AAAAAAAAA";
> -+  char *inptr = input;
> -+  size_t insize = sizeof (input);
> -+  char output[6];
> -+  char *outptr = output;
> -+  size_t outsize = sizeof (output);
> -+
> -+  TEST_VERIFY (iconv (cd, &inptr, &insize, &outptr, &outsize) == -1);
> -+  TEST_VERIFY (errno == E2BIG);
> -+
> -+  TEST_VERIFY_EXIT (iconv_close (cd) != -1);
> -+
> -+  return 0;
> -+}
> -+
> -+#include <support/test-driver.c>
> ---
> -2.27.0
> -
> diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
> index b75bbb4196..22858bc563 100644
> --- a/meta/recipes-core/glibc/glibc_2.31.bb
> +++ b/meta/recipes-core/glibc/glibc_2.31.bb
> @@ -1,7 +1,9 @@
>   require glibc.inc
>   require glibc-version.inc
>   
> -CVE_CHECK_WHITELIST += "CVE-2020-10029 CVE-2020-6096 CVE-2016-10228 CVE-2020-1751 CVE-2020-1752"
> +CVE_CHECK_WHITELIST += "CVE-2020-10029 CVE-2020-6096 CVE-2016-10228 CVE-2020-1751 CVE-2020-1752 \
> +                        CVE-2021-27645 CVE-2021-3326 CVE-2020-27618 CVE-2020-29562 CVE-2019-25013 \
> +"
>   
>   DEPENDS += "gperf-native bison-native make-native"
>   
> @@ -41,9 +43,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>              file://0027-intl-Emit-no-lines-in-bison-generated-files.patch \
>              file://0028-inject-file-assembly-directives.patch \
>              file://0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
> -           file://CVE-2020-29562.patch \
>              file://CVE-2020-29573.patch \
> -           file://CVE-2019-25013.patch \
>              "
>   S = "${WORKDIR}/git"
>   B = "${WORKDIR}/build-${TARGET_SYS}"
> 
> 
> 
> 
> 
