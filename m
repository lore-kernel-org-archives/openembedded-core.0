Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.1787.1616430494012542105
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 09:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qy6M7A+5;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id 11so11297964pfn.9
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 09:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y80PKS965VdjluI6Ye3J9xTlKS2/T6f/VASjvLoS5gw=;
        b=Qy6M7A+5yHpdaj4RRyjhne1uyMDgvgDAiltDd2YjGjvc7tVFCPu+t09AdM0aNxo9nw
         R+c+30D7xLWAGMaWH1A21KqScGWVlgpBbqlEnLoAuzyu1Oxi2A7njGV30OAE/Wnm5517
         vGvvJG/85UTHzSv8fuLVL/Nf3LicgX1Ew7M9B0OWkil2cvO+vsOvONrwKvCA9NVxFCum
         YdTMeqy7y2h/kopy04dTbsyZUdWHyA5aTxFzZG0JWEAFn+H1INQxDtobD7xfMD7UFn77
         HJqhNXOvbWJ7Da3yTLKeKIsJS9OruFoZX0B9jGutpiHQO9iNrGMMuyD/Em02s5TjAC75
         Njhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=y80PKS965VdjluI6Ye3J9xTlKS2/T6f/VASjvLoS5gw=;
        b=XgUBvpDfSq20VyFcPmNBeGLwu0FktKuYXm4C4VIc5sBOV1XP4KwFmE80WwdJNMEX7c
         h+SWALXkH9erVXyoBZ2Tq36SQWO8VpNfPG6MAkghLQoyPG+loOfgP2VdOsV+zymykevf
         dcii76EHFMiqPdDrB8yA9NFRhkJMDyMZg0+T9/LKI9/tJP90R1VsYYuJ8ciAs47kXP/1
         srGDJUvk9B1Ca079Tbz8qlgOC5nY7Dlxn6JqdrVARYT6/K3NHkaEz5JGVgtER/7VMace
         KcsiODvaPQVJ7IWkx/3zgydu+AynJj20TfkWdkzi4vPeEGuZlhppUJQ8ReTBrlADZkNZ
         QKYw==
X-Gm-Message-State: AOAM533wyIsP1MX0Z6mMqg6iBsBfGHxIRs9v3Mqzek83j+YypAZIQ1OZ
	yisnvNmqXNeA+eZpV72IZr/CU80g8rWA+g==
X-Google-Smtp-Source: ABdhPJz0mr6CF8FbEry4ltwKOlk86c6sLVrtwN8NDwGuJZ3dqFFFlBoM9iTEKbQVFJgcgN9ADV053w==
X-Received: by 2002:a62:7f45:0:b029:205:9617:a819 with SMTP id a66-20020a627f450000b02902059617a819mr302801pfd.17.1616430493117;
        Mon, 22 Mar 2021 09:28:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:55db:5ea4:e7d7:34b8? ([2601:646:9200:a0f0:55db:5ea4:e7d7:34b8])
        by smtp.gmail.com with ESMTPSA id u66sm13873898pfu.186.2021.03.22.09.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 09:28:12 -0700 (PDT)
Subject: Re: [poky][dunfell][PATCH] glibc: Add and modify CVEs
To: Saloni Jain <Saloni.Jain@kpit.com>,
 openembedded-core@lists.openembedded.org
Cc: nisha.parrakat@kpit.com
References: <20210322102745.19513-1-Saloni.Jain@kpit.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <e5a383e4-c8b1-7fbe-abbe-d087d24d5e43@gmail.com>
Date: Mon, 22 Mar 2021 09:28:11 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210322102745.19513-1-Saloni.Jain@kpit.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

There is another patch on mailing lists to update to latest 2.31 which 
should perhaps address these ?

On 3/22/21 3:27 AM, Saloni Jain wrote:
> Below patch is modified:
> 1. CVE-2019-25013
> The previous patch was modified for dunfell
> context and causing conflict for CVE-2021-3326.
> Hence, the original patch is backported.
> Link: https://security-tracker.debian.org/tracker/CVE-2020-27618
> Link: https://sourceware.org/git/?p=glibc.git;a=patch;h=9a99c682144bdbd40792ebf822fe9264e0376fb5
> 
> Below patch is added:
> 1. CVE-2021-3326
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=1932589
> Link: https://sourceware.org/git/?p=glibc.git;a=patch;h=dca565886b5e8bd7966e15f0ca42ee5cff686673
> 
> Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
> ---
>   .../glibc/glibc/CVE-2019-25013.patch          |  52 +--
>   .../glibc/glibc/CVE-2021-3326.patch           | 297 ++++++++++++++++++
>   meta/recipes-core/glibc/glibc_2.31.bb         |   3 +-
>   3 files changed, 328 insertions(+), 24 deletions(-)
>   create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-3326.patch
> 
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch b/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
> index 73df1da868..3e446f2818 100644
> --- a/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
> +++ b/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
> @@ -8,12 +8,14 @@ area and is not allowed.  The from_euc_kr function used to skip two bytes
>   when told to skip over the unknown designation, potentially running over
>   the buffer end.
> 
> -Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=ee7a3144c9922808181009b7b3e50e852fb4999b]
>   CVE: CVE-2019-25013
> -Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> -[Refreshed for Dundell context; Makefile changes]
> -Signed-off-by: Armin Kuster <akuster@mvista.com>
> +Upstream Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=ee7a3144c9922808181009b7b3e50e852fb4999b]
> +Comment: No change in any hunk
> 
> +The previous change was modified for dunfell context, causing conflict
> +for CVE-2021-3326. Hence, the original patch is backported.
> +
> +Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
>   ---
>    iconvdata/Makefile      |  3 ++-
>    iconvdata/bug-iconv13.c | 53 +++++++++++++++++++++++++++++++++++++++++
> @@ -22,23 +24,25 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
>    4 files changed, 59 insertions(+), 9 deletions(-)
>    create mode 100644 iconvdata/bug-iconv13.c
> 
> -Index: git/iconvdata/Makefile
> -===================================================================
> ---- git.orig/iconvdata/Makefile
> -+++ git/iconvdata/Makefile
> -@@ -73,7 +73,7 @@ modules.so := $(addsuffix .so, $(modules
> +diff --git a/iconvdata/Makefile b/iconvdata/Makefile
> +index 4ec2741cdc..85009f3390 100644
> +--- a/iconvdata/Makefile
> ++++ b/iconvdata/Makefile
> +@@ -73,7 +73,8 @@
>    ifeq (yes,$(build-shared))
>    tests = bug-iconv1 bug-iconv2 tst-loading tst-e2big tst-iconv4 bug-iconv4 \
>          tst-iconv6 bug-iconv5 bug-iconv6 tst-iconv7 bug-iconv8 bug-iconv9 \
>   -      bug-iconv10 bug-iconv11 bug-iconv12
> -+      bug-iconv10 bug-iconv11 bug-iconv12 bug-iconv13
> ++      bug-iconv10 bug-iconv11 bug-iconv12 tst-iconv-big5-hkscs-to-2ucs4 \
> ++       bug-iconv13
>    ifeq ($(have-thread-library),yes)
>    tests += bug-iconv3
>    endif
> -Index: git/iconvdata/bug-iconv13.c
> -===================================================================
> +diff --git a/iconvdata/bug-iconv13.c b/iconvdata/bug-iconv13.c
> +new file mode 100644
> +index 0000000000..87aaff398e
>   --- /dev/null
> -+++ git/iconvdata/bug-iconv13.c
> ++++ b/iconvdata/bug-iconv13.c
>   @@ -0,0 +1,53 @@
>   +/* bug 24973: Test EUC-KR module
>   +   Copyright (C) 2020 Free Software Foundation, Inc.
> @@ -93,11 +97,11 @@ Index: git/iconvdata/bug-iconv13.c
>   +}
>   +
>   +#include <support/test-driver.c>
> -Index: git/iconvdata/euc-kr.c
> -===================================================================
> ---- git.orig/iconvdata/euc-kr.c
> -+++ git/iconvdata/euc-kr.c
> -@@ -80,11 +80,7 @@ euckr_from_ucs4 (uint32_t ch, unsigned c
> +diff --git a/iconvdata/euc-kr.c b/iconvdata/euc-kr.c
> +index b0d56cf3ee..1045bae926 100644
> +--- a/iconvdata/euc-kr.c
> ++++ b/iconvdata/euc-kr.c
> +@@ -80,11 +80,7 @@ euckr_from_ucs4 (uint32_t ch, unsigned char *cp)
>                                                                                \
>        if (ch <= 0x9f)                                                         \
>          ++inptr;                                                                      \
> @@ -110,11 +114,11 @@ Index: git/iconvdata/euc-kr.c
>          {                                                                             \
>          /* This is illegal.  */                                               \
>          STANDARD_FROM_LOOP_ERR_HANDLER (1);                                   \
> -Index: git/iconvdata/ksc5601.h
> -===================================================================
> ---- git.orig/iconvdata/ksc5601.h
> -+++ git/iconvdata/ksc5601.h
> -@@ -50,15 +50,15 @@ ksc5601_to_ucs4 (const unsigned char **s
> +diff --git a/iconvdata/ksc5601.h b/iconvdata/ksc5601.h
> +index d3eb3a4ff8..f5cdc72797 100644
> +--- a/iconvdata/ksc5601.h
> ++++ b/iconvdata/ksc5601.h
> +@@ -50,15 +50,15 @@ ksc5601_to_ucs4 (const unsigned char **s, size_t avail, unsigned char offset)
>      unsigned char ch2;
>      int idx;
> 
> @@ -133,3 +137,5 @@ Index: git/iconvdata/ksc5601.h
>      ch2 = (*s)[1];
>      if (ch2 < offset || (ch2 - offset) <= 0x20 || (ch2 - offset) >= 0x7f)
>        return __UNKNOWN_10646_CHAR;
> +--
> +2.27.0
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-3326.patch b/meta/recipes-core/glibc/glibc/CVE-2021-3326.patch
> new file mode 100644
> index 0000000000..5f4270a6c8
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2021-3326.patch
> @@ -0,0 +1,297 @@
> +From 7d88c6142c6efc160c0ee5e4f85cde382c072888 Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Wed, 27 Jan 2021 13:36:12 +0100
> +Subject: [PATCH] gconv: Fix assertion failure in ISO-2022-JP-3 module (bug
> + 27256)
> +
> +The conversion loop to the internal encoding does not follow
> +the interface contract that __GCONV_FULL_OUTPUT is only returned
> +after the internal wchar_t buffer has been filled completely.  This
> +is enforced by the first of the two asserts in iconv/skeleton.c:
> +
> +             /* We must run out of output buffer space in this
> +                rerun.  */
> +             assert (outbuf == outerr);
> +             assert (nstatus == __GCONV_FULL_OUTPUT);
> +
> +This commit solves this issue by queuing a second wide character
> +which cannot be written immediately in the state variable, like
> +other converters already do (e.g., BIG5-HKSCS or TSCII).
> +
> +Reported-by: Tavis Ormandy <taviso@gmail.com>
> +
> +CVE: CVE-2021-3326
> +Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=7d88c6142c6efc160c0ee5e4f85cde382c072888]
> +Comment: Refreshed only one hunk in Makefile
> +
> +Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
> +---
> + iconvdata/Makefile        |   4 +-
> + iconvdata/bug-iconv14.c   | 127 ++++++++++++++++++++++++++++++++++++++
> + iconvdata/iso-2022-jp-3.c |  67 ++++++++++++++------
> + 3 files changed, 178 insertions(+), 20 deletions(-)
> + create mode 100644 iconvdata/bug-iconv14.c
> +
> +diff --git a/iconvdata/Makefile b/iconvdata/Makefile
> +index c8c532a3e4..55c527a5f7 100644
> +--- a/iconvdata/Makefile
> ++++ b/iconvdata/Makefile
> +@@ -74,7 +74,7 @@
> + tests = bug-iconv1 bug-iconv2 tst-loading tst-e2big tst-iconv4 bug-iconv4 \
> +       tst-iconv6 bug-iconv5 bug-iconv6 tst-iconv7 bug-iconv8 bug-iconv9 \
> +       bug-iconv10 bug-iconv11 bug-iconv12 tst-iconv-big5-hkscs-to-2ucs4 \
> +-       bug-iconv13
> ++       bug-iconv13 bug-iconv14
> + ifeq ($(have-thread-library),yes)
> + tests += bug-iconv3
> + endif
> +@ -322,6 +322,8 @@ $(objpfx)bug-iconv10.out: $(objpfx)gconv-modules \
> +                         $(addprefix $(objpfx),$(modules.so))
> + $(objpfx)bug-iconv12.out: $(objpfx)gconv-modules \
> +                         $(addprefix $(objpfx),$(modules.so))
> ++$(objpfx)bug-iconv14.out: $(objpfx)gconv-modules \
> ++                        $(addprefix $(objpfx),$(modules.so))
> +
> + $(objpfx)iconv-test.out: run-iconv-test.sh $(objpfx)gconv-modules \
> +                        $(addprefix $(objpfx),$(modules.so)) \
> +diff --git a/iconvdata/bug-iconv14.c b/iconvdata/bug-iconv14.c
> +new file mode 100644
> +index 0000000000..902f140fa9
> +--- /dev/null
> ++++ b/iconvdata/bug-iconv14.c
> +@@ -0,0 +1,127 @@
> ++/* Assertion in ISO-2022-JP-3 due to two-character sequence (bug 27256).
> ++   Copyright (C) 2021 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <https://www.gnu.org/licenses/>.  */
> ++
> ++#include <iconv.h>
> ++#include <string.h>
> ++#include <errno.h>
> ++#include <support/check.h>
> ++
> ++/* Use an escape sequence to return to the initial state.  */
> ++static void
> ++with_escape_sequence (void)
> ++{
> ++  iconv_t c = iconv_open ("UTF-8", "ISO-2022-JP-3");
> ++  TEST_VERIFY_EXIT (c != (iconv_t) -1);
> ++
> ++  char in[] = "\e$(O+D\e(B";
> ++  char *inbuf = in;
> ++  size_t inleft = strlen (in);
> ++  char out[3];                  /* Space for one output character.  */
> ++  char *outbuf;
> ++  size_t outleft;
> ++
> ++  outbuf = out;
> ++  outleft = sizeof (out);
> ++  TEST_COMPARE (iconv (c, &inbuf, &inleft, &outbuf, &outleft), (size_t) -1);
> ++  TEST_COMPARE (errno, E2BIG);
> ++  TEST_COMPARE (inleft, 3);
> ++  TEST_COMPARE (inbuf - in, strlen (in) - 3);
> ++  TEST_COMPARE (outleft, sizeof (out) - 2);
> ++  TEST_COMPARE (outbuf - out, 2);
> ++  TEST_COMPARE (out[0] & 0xff, 0xc3);
> ++  TEST_COMPARE (out[1] & 0xff, 0xa6);
> ++
> ++  /* Return to the initial shift state, producing the pending
> ++     character.  */
> ++  outbuf = out;
> ++  outleft = sizeof (out);
> ++  TEST_COMPARE (iconv (c, &inbuf, &inleft, &outbuf, &outleft), 0);
> ++  TEST_COMPARE (inleft, 0);
> ++  TEST_COMPARE (inbuf - in, strlen (in));
> ++  TEST_COMPARE (outleft, sizeof (out) - 2);
> ++  TEST_COMPARE (outbuf - out, 2);
> ++  TEST_COMPARE (out[0] & 0xff, 0xcc);
> ++  TEST_COMPARE (out[1] & 0xff, 0x80);
> ++
> ++  /* Nothing should be flushed the second time.  */
> ++  outbuf = out;
> ++  outleft = sizeof (out);
> ++  TEST_COMPARE (iconv (c, NULL, 0, &outbuf, &outleft), 0);
> ++  TEST_COMPARE (outleft, sizeof (out));
> ++  TEST_COMPARE (outbuf - out, 0);
> ++  TEST_COMPARE (out[0] & 0xff, 0xcc);
> ++  TEST_COMPARE (out[1] & 0xff, 0x80);
> ++
> ++  TEST_COMPARE (iconv_close (c), 0);
> ++}
> ++
> ++/* Use an explicit flush to return to the initial state.  */
> ++static void
> ++with_flush (void)
> ++{
> ++  iconv_t c = iconv_open ("UTF-8", "ISO-2022-JP-3");
> ++  TEST_VERIFY_EXIT (c != (iconv_t) -1);
> ++
> ++  char in[] = "\e$(O+D";
> ++  char *inbuf = in;
> ++  size_t inleft = strlen (in);
> ++  char out[3];                  /* Space for one output character.  */
> ++  char *outbuf;
> ++  size_t outleft;
> ++
> ++  outbuf = out;
> ++  outleft = sizeof (out);
> ++  TEST_COMPARE (iconv (c, &inbuf, &inleft, &outbuf, &outleft), (size_t) -1);
> ++  TEST_COMPARE (errno, E2BIG);
> ++  TEST_COMPARE (inleft, 0);
> ++  TEST_COMPARE (inbuf - in, strlen (in));
> ++  TEST_COMPARE (outleft, sizeof (out) - 2);
> ++  TEST_COMPARE (outbuf - out, 2);
> ++  TEST_COMPARE (out[0] & 0xff, 0xc3);
> ++  TEST_COMPARE (out[1] & 0xff, 0xa6);
> ++
> ++  /* Flush the pending character.  */
> ++  outbuf = out;
> ++  outleft = sizeof (out);
> ++  TEST_COMPARE (iconv (c, NULL, 0, &outbuf, &outleft), 0);
> ++  TEST_COMPARE (outleft, sizeof (out) - 2);
> ++  TEST_COMPARE (outbuf - out, 2);
> ++  TEST_COMPARE (out[0] & 0xff, 0xcc);
> ++  TEST_COMPARE (out[1] & 0xff, 0x80);
> ++
> ++  /* Nothing should be flushed the second time.  */
> ++  outbuf = out;
> ++  outleft = sizeof (out);
> ++  TEST_COMPARE (iconv (c, NULL, 0, &outbuf, &outleft), 0);
> ++  TEST_COMPARE (outleft, sizeof (out));
> ++  TEST_COMPARE (outbuf - out, 0);
> ++  TEST_COMPARE (out[0] & 0xff, 0xcc);
> ++  TEST_COMPARE (out[1] & 0xff, 0x80);
> ++
> ++  TEST_COMPARE (iconv_close (c), 0);
> ++}
> ++
> ++static int
> ++do_test (void)
> ++{
> ++  with_escape_sequence ();
> ++  with_flush ();
> ++  return 0;
> ++}
> ++
> ++#include <support/test-driver.c>
> +diff --git a/iconvdata/iso-2022-jp-3.c b/iconvdata/iso-2022-jp-3.c
> +index 3eaa847ad9..c8ba88cdc9 100644
> +--- a/iconvdata/iso-2022-jp-3.c
> ++++ b/iconvdata/iso-2022-jp-3.c
> +@@ -67,23 +67,34 @@ enum
> +   CURRENT_SEL_MASK = 7 << 3
> + };
> +
> +-/* During UCS-4 to ISO-2022-JP-3 conversion, the COUNT element of the state
> +-   also contains the last two bytes to be output, shifted by 6 bits, and a
> +-   one-bit indicator whether they must be preceded by the shift sequence,
> +-   in bit 22.  */
> ++/* During UCS-4 to ISO-2022-JP-3 conversion, the COUNT element of the
> ++   state also contains the last two bytes to be output, shifted by 6
> ++   bits, and a one-bit indicator whether they must be preceded by the
> ++   shift sequence, in bit 22.  During ISO-2022-JP-3 to UCS-4
> ++   conversion, COUNT may also contain a non-zero pending wide
> ++   character, shifted by six bits.  This happens for certain inputs in
> ++   JISX0213_1_2004_set and JISX0213_2_set if the second wide character
> ++   in a combining sequence cannot be written because the buffer is
> ++   full.  */
> +
> + /* Since this is a stateful encoding we have to provide code which resets
> +    the output state to the initial state.  This has to be done during the
> +    flushing.  */
> + #define EMIT_SHIFT_TO_INIT \
> +-  if ((data->__statep->__count & ~7) != ASCII_set)                          \
> ++  if (data->__statep->__count != ASCII_set)                         \
> +     {                                                                       \
> +       if (FROM_DIRECTION)                                                   \
> +       {                                                                     \
> +-        /* It's easy, we don't have to emit anything, we just reset the     \
> +-           state for the input.  */                                         \
> +-        data->__statep->__count &= 7;                                       \
> +-        data->__statep->__count |= ASCII_set;                               \
> ++        if (__glibc_likely (outbuf + 4 <= outend))                          \
> ++          {                                                                 \
> ++            /* Write out the last character.  */                            \
> ++            *((uint32_t *) outbuf) = data->__statep->__count >> 6;          \
> ++            outbuf += sizeof (uint32_t);                                    \
> ++            data->__statep->__count = ASCII_set;                      \
> ++          }                                                                 \
> ++        else                                                                \
> ++          /* We don't have enough room in the output buffer.  */            \
> ++          status = __GCONV_FULL_OUTPUT;                                     \
> +       }                                                                     \
> +       else                                                                  \
> +       {                                                                     \
> +@@ -151,7 +162,21 @@ enum
> + #define LOOPFCT                       FROM_LOOP
> + #define BODY \
> +   {                                                                         \
> +-    uint32_t ch = *inptr;                                                   \
> ++    uint32_t ch;                                                            \
> ++                                                                            \
> ++    /* Output any pending character.  */                                    \
> ++    ch = set >> 6;                                                          \
> ++    if (__glibc_unlikely (ch != 0))                                         \
> ++      {                                                                             \
> ++      put32 (outptr, ch);                                                   \
> ++      outptr += 4;                                                          \
> ++      /* Remove the pending character, but preserve state bits.  */         \
> ++      set &= (1 << 6) - 1;                                                  \
> ++      continue;                                                             \
> ++      }                                                                             \
> ++                                                                            \
> ++    /* Otherwise read the next input byte.  */                                      \
> ++    ch = *inptr;                                                            \
> +                                                                             \
> +     /* Recognize escape sequences.  */                                              \
> +     if (__glibc_unlikely (ch == ESC))                                       \
> +@@ -297,21 +322,25 @@ enum
> +           uint32_t u1 = __jisx0213_to_ucs_combining[ch - 1][0];             \
> +           uint32_t u2 = __jisx0213_to_ucs_combining[ch - 1][1];             \
> +                                                                             \
> ++          inptr += 2;                                                       \
> ++                                                                            \
> ++          put32 (outptr, u1);                                               \
> ++          outptr += 4;                                                      \
> ++                                                                            \
> +           /* See whether we have room for two characters.  */               \
> +-          if (outptr + 8 <= outend)                                         \
> ++          if (outptr + 4 <= outend)                                         \
> +             {                                                               \
> +-              inptr += 2;                                                   \
> +-              put32 (outptr, u1);                                           \
> +-              outptr += 4;                                                  \
> +               put32 (outptr, u2);                                           \
> +               outptr += 4;                                                  \
> +               continue;                                                     \
> +             }                                                               \
> +-          else                                                              \
> +-            {                                                               \
> +-              result = __GCONV_FULL_OUTPUT;                                 \
> +-              break;                                                        \
> +-            }                                                               \
> ++                                                                            \
> ++          /* Otherwise store only the first character now, and              \
> ++             put the second one into the queue.  */                         \
> ++          set |= u2 << 6;                                                   \
> ++          /* Tell the caller why we terminate the loop.  */                 \
> ++          result = __GCONV_FULL_OUTPUT;                                     \
> ++          break;                                                            \
> +         }                                                                   \
> +                                                                             \
> +       inptr += 2;                                                           \
> +--
> +2.27.0
> diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
> index b75bbb4196..77eb5b481b 100644
> --- a/meta/recipes-core/glibc/glibc_2.31.bb
> +++ b/meta/recipes-core/glibc/glibc_2.31.bb
> @@ -41,9 +41,10 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>              file://0027-intl-Emit-no-lines-in-bison-generated-files.patch \
>              file://0028-inject-file-assembly-directives.patch \
>              file://0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
> +           file://CVE-2019-25013.patch \
>              file://CVE-2020-29562.patch \
>              file://CVE-2020-29573.patch \
> -           file://CVE-2019-25013.patch \
> +           file://CVE-2021-3326.patch \
>              "
>   S = "${WORKDIR}/git"
>   B = "${WORKDIR}/build-${TARGET_SYS}"
> --
> 2.17.1
> 
> This message contains information that may be privileged or confidential and is the property of the KPIT Technologies Ltd. It is intended only for the person to whom it is addressed. If you are not the intended recipient, you are not authorized to read, print, retain copy, disseminate, distribute, or use this message or any part thereof. If you receive this message in error, please notify the sender immediately and delete all copies of this message. KPIT Technologies Ltd. does not accept any liability for virus infected mails.
> 
