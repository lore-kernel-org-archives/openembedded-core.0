Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4BD8977162
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 20:47:11 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 1so884056wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 12:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=gu1f5fLuCy/ONA8mtSYSuKMeCPYwwqlqCRrovmsPdp0=;
	b=vEIBkZabI429T6G8N1zxVl+5H/aTVCmeJ8X44h37MdoHxTpFoNEFjyztJUa/5Vgda4
	BvcRLglEih6pDjNKzG+4I2DJqmr1IyUAkOMfWaQUHNgZokoRRMZM2pMTQVAj2wyNudxz
	140laYG8vn5aeTeB1tpsPoLAke2nBz3l67BtLtgnA1bkOEF8uzE9vtePZ/r1oLUImwyh
	7TQLnombrTJFfA2MKSaaOTtyvSKsDfOsJC9dVdB5DI4/SnSeVpofwO9lT7LKLzuArOfi
	vRtBU5iJCVLb2P5QiHyEPBsWiA8w4uEZavAxtCnQjDweDan60P7FRl3JvUTEcBGkqtQT
	IUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=gu1f5fLuCy/ONA8mtSYSuKMeCPYwwqlqCRrovmsPdp0=;
	b=RewzcnJ/RwGJcvAj0zmIRvb0s8HT9GEqlh8mqlb/bEbyXJgDQWv+XIQh6IHPtbA1Th
	YkRIlHCAlYkoLhaL9Csg6lGopSDRMT32fyRIcwNovATcG7s+AvPjCKeBlsT7Nba0MkoP
	riwd4cTyKOb+f71pClkf4yEjmFmzgOADHYPryKmMiwx3Wv9W4pgAGTNFV9LEnHgYvDBs
	ENnx7vtHsj1QPk5CkReHB6RapDTISpOHLNf2qDtPdv3+JDaMk6PJey6iZd02izBvtTYY
	RDk5MGXCf4bJme7M9FBt1gzG0PSVeB8L2B8OVyd2o1Xx+t8IK4gQkUIqe5cRPWzCqwhY
	MZhQ==
X-Gm-Message-State: AD7BkJJIhvorKfDQ1PMiih0noVcWL4e9pba965wdE4UIRQ5l00nWSDqGfq+vRkjg5gjtCRbCqfBNLPkDdwSRQw==
MIME-Version: 1.0
X-Received: by 10.28.170.137 with SMTP id t131mr1045990wme.74.1457038031295;
	Thu, 03 Mar 2016 12:47:11 -0800 (PST)
Received: by 10.194.58.176 with HTTP; Thu, 3 Mar 2016 12:47:11 -0800 (PST)
In-Reply-To: <56D89FF7.2050201@mvista.com>
References: <1456685615-901-1-git-send-email-akuster808@gmail.com>
	<1456685615-901-3-git-send-email-akuster808@gmail.com>
	<20160303081642.GA2569@jama> <56D89FF7.2050201@mvista.com>
Date: Thu, 3 Mar 2016 21:47:11 +0100
Message-ID: <CA+chaQf2WdTt2fsToY9sdnapD+RaPp4OZV_3ybH0J401DXhusA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: "akuster@mvista" <akuster@mvista.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dizzy][PATCH 3/4] glibc: CVE-2015-9761
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Mar 2016 20:47:13 -0000
Content-Type: multipart/alternative; boundary=001a1144250e479fe3052d2b1a0d

--001a1144250e479fe3052d2b1a0d
Content-Type: text/plain; charset=UTF-8

I was asking you about the CVE number (but I realize it was already merged
in other branches with wrong number so maybe it will be less confusing use
the same in Dizzy)

And "please merge" was informal
Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

after testing this series in our Dizzy based builds.

On Thu, Mar 3, 2016 at 9:35 PM, akuster@mvista <akuster@mvista.com> wrote:

> On 3/3/16 12:16 AM, Martin Jansa wrote:
> > On Sun, Feb 28, 2016 at 10:53:34AM -0800, Armin Kuster wrote:
> >> From: Armin Kuster <akuster@mvista.com>
> >
> > I think this is 2014-9761 not 2015-9761
> >
> > But other than that please merge this series.
>
> Are you asking me? I don't have write perms.
>
> - armin
> >
> >> A stack overflow vulnerability was found in nan* functions that could
> cause
> >> applications which process long strings with the nan function to crash
> or,
> >> potentially, execute arbitrary code.
> >>
> >> (From OE-Core rev: fd3da8178c8c06b549dbc19ecec40e98ab934d49)
> >>
> >> Signed-off-by: Armin Kuster <akuster@mvista.com>
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> Signed-off-by: Armin Kuster <akuster@mvista.com>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >> ---
> >>  .../recipes-core/glibc/glibc/CVE-2015-9761_1.patch | 1039
> ++++++++++++++++++++
> >>  .../recipes-core/glibc/glibc/CVE-2015-9761_2.patch |  388 ++++++++
> >>  meta/recipes-core/glibc/glibc_2.20.bb              |    2 +
> >>  3 files changed, 1429 insertions(+)
> >>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-9761_1.patch
> >>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-9761_2.patch
> >>
> >> diff --git a/meta/recipes-core/glibc/glibc/CVE-2015-9761_1.patch
> b/meta/recipes-core/glibc/glibc/CVE-2015-9761_1.patch
> >> new file mode 100644
> >> index 0000000..3aca913
> >> --- /dev/null
> >> +++ b/meta/recipes-core/glibc/glibc/CVE-2015-9761_1.patch
> >> @@ -0,0 +1,1039 @@
> >> +From e02cabecf0d025ec4f4ddee290bdf7aadb873bb3 Mon Sep 17 00:00:00 2001
> >> +From: Joseph Myers <joseph@codesourcery.com>
> >> +Date: Tue, 24 Nov 2015 22:24:52 +0000
> >> +Subject: [PATCH] Refactor strtod parsing of NaN payloads.
> >> +
> >> +The nan* functions handle their string argument by constructing a
> >> +NAN(...) string on the stack as a VLA and passing it to strtod
> >> +functions.
> >> +
> >> +This approach has problems discussed in bug 16961 and bug 16962: the
> >> +stack usage is unbounded, and it gives incorrect results in certain
> >> +cases where the argument is not a valid n-char-sequence.
> >> +
> >> +The natural fix for both issues is to refactor the NaN payload parsing
> >> +out of strtod into a separate function that the nan* functions can
> >> +call directly, so that no temporary string needs constructing on the
> >> +stack at all.  This patch does that refactoring in preparation for
> >> +fixing those bugs (but without actually using the new functions from
> >> +nan* - which will also require exporting them from libc at version
> >> +GLIBC_PRIVATE).  This patch is not intended to change any user-visible
> >> +behavior, so no tests are added (fixes for the above bugs will of
> >> +course add tests for them).
> >> +
> >> +This patch builds on my recent fixes for strtol and strtod issues in
> >> +Turkish locales.  Given those fixes, the parsing of NaN payloads is
> >> +locale-independent; thus, the new functions do not need to take a
> >> +locale_t argument.
> >> +
> >> +Tested for x86_64, x86, mips64 and powerpc.
> >> +
> >> +    * stdlib/strtod_nan.c: New file.
> >> +    * stdlib/strtod_nan_double.h: Likewise.
> >> +    * stdlib/strtod_nan_float.h: Likewise.
> >> +    * stdlib/strtod_nan_main.c: Likewise.
> >> +    * stdlib/strtod_nan_narrow.h: Likewise.
> >> +    * stdlib/strtod_nan_wide.h: Likewise.
> >> +    * stdlib/strtof_nan.c: Likewise.
> >> +    * stdlib/strtold_nan.c: Likewise.
> >> +    * sysdeps/ieee754/ldbl-128/strtod_nan_ldouble.h: Likewise.
> >> +    * sysdeps/ieee754/ldbl-128ibm/strtod_nan_ldouble.h: Likewise.
> >> +    * sysdeps/ieee754/ldbl-96/strtod_nan_ldouble.h: Likewise.
> >> +    * wcsmbs/wcstod_nan.c: Likewise.
> >> +    * wcsmbs/wcstof_nan.c: Likewise.
> >> +    * wcsmbs/wcstold_nan.c: Likewise.
> >> +    * stdlib/Makefile (routines): Add strtof_nan, strtod_nan and
> >> +    strtold_nan.
> >> +    * wcsmbs/Makefile (routines): Add wcstod_nan, wcstold_nan and
> >> +    wcstof_nan.
> >> +    * include/stdlib.h (__strtof_nan): Declare and use
> >> +    libc_hidden_proto.
> >> +    (__strtod_nan): Likewise.
> >> +    (__strtold_nan): Likewise.
> >> +    (__wcstof_nan): Likewise.
> >> +    (__wcstod_nan): Likewise.
> >> +    (__wcstold_nan): Likewise.
> >> +    * include/wchar.h (____wcstoull_l_internal): Declare.
> >> +    * stdlib/strtod_l.c: Do not include <ieee754.h>.
> >> +    (____strtoull_l_internal): Remove declaration.
> >> +    (STRTOF_NAN): Define macro.
> >> +    (SET_MANTISSA): Remove macro.
> >> +    (STRTOULL): Likewise.
> >> +    (____STRTOF_INTERNAL): Use STRTOF_NAN to parse NaN payload.
> >> +    * stdlib/strtof_l.c (____strtoull_l_internal): Remove declaration.
> >> +    (STRTOF_NAN): Define macro.
> >> +    (SET_MANTISSA): Remove macro.
> >> +    * sysdeps/ieee754/ldbl-128/strtold_l.c (STRTOF_NAN): Define macro.
> >> +    (SET_MANTISSA): Remove macro.
> >> +    * sysdeps/ieee754/ldbl-128ibm/strtold_l.c (STRTOF_NAN): Define
> >> +    macro.
> >> +    (SET_MANTISSA): Remove macro.
> >> +    * sysdeps/ieee754/ldbl-64-128/strtold_l.c (STRTOF_NAN): Define
> >> +    macro.
> >> +    (SET_MANTISSA): Remove macro.
> >> +    * sysdeps/ieee754/ldbl-96/strtold_l.c (STRTOF_NAN): Define macro.
> >> +    (SET_MANTISSA): Remove macro.
> >> +    * wcsmbs/wcstod_l.c (____wcstoull_l_internal): Remove declaration.
> >> +    * wcsmbs/wcstof_l.c (____wcstoull_l_internal): Likewise.
> >> +    * wcsmbs/wcstold_l.c (____wcstoull_l_internal): Likewise.
> >> +
> >> +Upstream-Status: Backport
> >> +CVE: CVE-2015-9761 patch #1
> >> +[Yocto # 8980]
> >> +
> >> +
> https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=e02cabecf0d025ec4f4ddee290bdf7aadb873bb3
> >> +
> >> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> >> +
> >> +---
> >> + ChangeLog                                        | 49
> ++++++++++++++++++
> >> + include/stdlib.h                                 | 18 +++++++
> >> + include/wchar.h                                  |  3 ++
> >> + stdlib/Makefile                                  |  1 +
> >> + stdlib/strtod_l.c                                | 48
> ++++--------------
> >> + stdlib/strtod_nan.c                              | 24 +++++++++
> >> + stdlib/strtod_nan_double.h                       | 30 +++++++++++
> >> + stdlib/strtod_nan_float.h                        | 29 +++++++++++
> >> + stdlib/strtod_nan_main.c                         | 63
> ++++++++++++++++++++++++
> >> + stdlib/strtod_nan_narrow.h                       | 22 +++++++++
> >> + stdlib/strtod_nan_wide.h                         | 22 +++++++++
> >> + stdlib/strtof_l.c                                | 11 +----
> >> + stdlib/strtof_nan.c                              | 24 +++++++++
> >> + stdlib/strtold_nan.c                             | 30 +++++++++++
> >> + sysdeps/ieee754/ldbl-128/strtod_nan_ldouble.h    | 33 +++++++++++++
> >> + sysdeps/ieee754/ldbl-128/strtold_l.c             | 13 +----
> >> + sysdeps/ieee754/ldbl-128ibm/strtod_nan_ldouble.h | 30 +++++++++++
> >> + sysdeps/ieee754/ldbl-128ibm/strtold_l.c          | 10 +---
> >> + sysdeps/ieee754/ldbl-64-128/strtold_l.c          | 13 +----
> >> + sysdeps/ieee754/ldbl-96/strtod_nan_ldouble.h     | 30 +++++++++++
> >> + sysdeps/ieee754/ldbl-96/strtold_l.c              | 10 +---
> >> + wcsmbs/Makefile                                  |  1 +
> >> + wcsmbs/wcstod_l.c                                |  3 --
> >> + wcsmbs/wcstod_nan.c                              | 23 +++++++++
> >> + wcsmbs/wcstof_l.c                                |  3 --
> >> + wcsmbs/wcstof_nan.c                              | 23 +++++++++
> >> + wcsmbs/wcstold_l.c                               |  3 --
> >> + wcsmbs/wcstold_nan.c                             | 30 +++++++++++
> >> + 28 files changed, 504 insertions(+), 95 deletions(-)
> >> + create mode 100644 stdlib/strtod_nan.c
> >> + create mode 100644 stdlib/strtod_nan_double.h
> >> + create mode 100644 stdlib/strtod_nan_float.h
> >> + create mode 100644 stdlib/strtod_nan_main.c
> >> + create mode 100644 stdlib/strtod_nan_narrow.h
> >> + create mode 100644 stdlib/strtod_nan_wide.h
> >> + create mode 100644 stdlib/strtof_nan.c
> >> + create mode 100644 stdlib/strtold_nan.c
> >> + create mode 100644 sysdeps/ieee754/ldbl-128/strtod_nan_ldouble.h
> >> + create mode 100644 sysdeps/ieee754/ldbl-128ibm/strtod_nan_ldouble.h
> >> + create mode 100644 sysdeps/ieee754/ldbl-96/strtod_nan_ldouble.h
> >> + create mode 100644 wcsmbs/wcstod_nan.c
> >> + create mode 100644 wcsmbs/wcstof_nan.c
> >> + create mode 100644 wcsmbs/wcstold_nan.c
> >> +
> >> +Index: git/include/stdlib.h
> >> +===================================================================
> >> +--- git.orig/include/stdlib.h
> >> ++++ git/include/stdlib.h
> >> +@@ -203,6 +203,24 @@ libc_hidden_proto (strtoll)
> >> + libc_hidden_proto (strtoul)
> >> + libc_hidden_proto (strtoull)
> >> +
> >> ++extern float __strtof_nan (const char *, char **, char)
> internal_function;
> >> ++extern double __strtod_nan (const char *, char **, char)
> internal_function;
> >> ++extern long double __strtold_nan (const char *, char **, char)
> >> ++     internal_function;
> >> ++extern float __wcstof_nan (const wchar_t *, wchar_t **, wchar_t)
> >> ++     internal_function;
> >> ++extern double __wcstod_nan (const wchar_t *, wchar_t **, wchar_t)
> >> ++     internal_function;
> >> ++extern long double __wcstold_nan (const wchar_t *, wchar_t **,
> wchar_t)
> >> ++     internal_function;
> >> ++
> >> ++libc_hidden_proto (__strtof_nan)
> >> ++libc_hidden_proto (__strtod_nan)
> >> ++libc_hidden_proto (__strtold_nan)
> >> ++libc_hidden_proto (__wcstof_nan)
> >> ++libc_hidden_proto (__wcstod_nan)
> >> ++libc_hidden_proto (__wcstold_nan)
> >> ++
> >> + extern char *__ecvt (double __value, int __ndigit, int *__restrict
> __decpt,
> >> +                 int *__restrict __sign);
> >> + extern char *__fcvt (double __value, int __ndigit, int *__restrict
> __decpt,
> >> +Index: git/include/wchar.h
> >> +===================================================================
> >> +--- git.orig/include/wchar.h
> >> ++++ git/include/wchar.h
> >> +@@ -52,6 +52,9 @@ extern unsigned long long int __wcstoull
> >> +                                               __restrict __endptr,
> >> +                                               int __base,
> >> +                                               int __group) __THROW;
> >> ++extern unsigned long long int ____wcstoull_l_internal (const wchar_t
> *,
> >> ++                                                  wchar_t **, int,
> int,
> >> ++                                                  __locale_t);
> >> + libc_hidden_proto (__wcstof_internal)
> >> + libc_hidden_proto (__wcstod_internal)
> >> + libc_hidden_proto (__wcstold_internal)
> >> +Index: git/stdlib/Makefile
> >> +===================================================================
> >> +--- git.orig/stdlib/Makefile
> >> ++++ git/stdlib/Makefile
> >> +@@ -51,6 +51,7 @@ routines-y        :=
>                             \
> >> +    strtol_l strtoul_l strtoll_l strtoull_l
>    \
> >> +    strtof strtod strtold
>    \
> >> +    strtof_l strtod_l strtold_l
>    \
> >> ++   strtof_nan strtod_nan strtold_nan
>    \
> >> +    system canonicalize
>    \
> >> +    a64l l64a
>    \
> >> +    getsubopt xpg_basename
>     \
> >> +Index: git/stdlib/strtod_l.c
> >> +===================================================================
> >> +--- git.orig/stdlib/strtod_l.c
> >> ++++ git/stdlib/strtod_l.c
> >> +@@ -21,8 +21,6 @@
> >> + #include <xlocale.h>
> >> +
> >> + extern double ____strtod_l_internal (const char *, char **, int,
> __locale_t);
> >> +-extern unsigned long long int ____strtoull_l_internal (const char *,
> char **,
> >> +-                                                  int, int,
> __locale_t);
> >> +
> >> + /* Configuration part.  These macros are defined by `strtold.c',
> >> +    `strtof.c', `wcstod.c', `wcstold.c', and `wcstof.c' to produce the
> >> +@@ -34,27 +32,20 @@ extern unsigned long long int ____strtou
> >> + # ifdef USE_WIDE_CHAR
> >> + #  define STRTOF   wcstod_l
> >> + #  define __STRTOF __wcstod_l
> >> ++#  define STRTOF_NAN       __wcstod_nan
> >> + # else
> >> + #  define STRTOF   strtod_l
> >> + #  define __STRTOF __strtod_l
> >> ++#  define STRTOF_NAN       __strtod_nan
> >> + # endif
> >> + # define MPN2FLOAT __mpn_construct_double
> >> + # define FLOAT_HUGE_VAL    HUGE_VAL
> >> +-# define SET_MANTISSA(flt, mant) \
> >> +-  do { union ieee754_double u;
>            \
> >> +-       u.d = (flt);
>             \
> >> +-       u.ieee_nan.mantissa0 = (mant) >> 32;
>             \
> >> +-       u.ieee_nan.mantissa1 = (mant);
>             \
> >> +-       if ((u.ieee.mantissa0 | u.ieee.mantissa1) != 0)
>            \
> >> +-    (flt) = u.d;
>    \
> >> +-  } while (0)
> >> + #endif
> >> + /* End of configuration part.  */
> >> +
> >> + #include <ctype.h>
> >> + #include <errno.h>
> >> + #include <float.h>
> >> +-#include <ieee754.h>
> >> + #include "../locale/localeinfo.h"
> >> + #include <locale.h>
> >> + #include <math.h>
> >> +@@ -105,7 +96,6 @@ extern unsigned long long int ____strtou
> >> + # define TOLOWER_C(Ch) __towlower_l ((Ch), _nl_C_locobj_ptr)
> >> + # define STRNCASECMP(S1, S2, N) \
> >> +   __wcsncasecmp_l ((S1), (S2), (N), _nl_C_locobj_ptr)
> >> +-# define STRTOULL(S, E, B) ____wcstoull_l_internal ((S), (E), (B), 0,
> loc)
> >> + #else
> >> + # define STRING_TYPE char
> >> + # define CHAR_TYPE char
> >> +@@ -117,7 +107,6 @@ extern unsigned long long int ____strtou
> >> + # define TOLOWER_C(Ch) __tolower_l ((Ch), _nl_C_locobj_ptr)
> >> + # define STRNCASECMP(S1, S2, N) \
> >> +   __strncasecmp_l ((S1), (S2), (N), _nl_C_locobj_ptr)
> >> +-# define STRTOULL(S, E, B) ____strtoull_l_internal ((S), (E), (B), 0,
> loc)
> >> + #endif
> >> +
> >> +
> >> +@@ -668,33 +657,14 @@ ____STRTOF_INTERNAL (nptr, endptr, group
> >> +      if (*cp == L_('('))
> >> +        {
> >> +          const STRING_TYPE *startp = cp;
> >> +-         do
> >> +-           ++cp;
> >> +-         while ((*cp >= L_('0') && *cp <= L_('9'))
> >> +-                || ({ CHAR_TYPE lo = TOLOWER (*cp);
> >> +-                      lo >= L_('a') && lo <= L_('z'); })
> >> +-                || *cp == L_('_'));
> >> +-
> >> +-         if (*cp != L_(')'))
> >> +-           /* The closing brace is missing.  Only match the NAN
> >> +-              part.  */
> >> +-           cp = startp;
> >> ++          STRING_TYPE *endp;
> >> ++          retval = STRTOF_NAN (cp + 1, &endp, L_(')'));
> >> ++          if (*endp == L_(')'))
> >> ++            /* Consume the closing parenthesis.  */
> >> ++            cp = endp + 1;
> >> +          else
> >> +-           {
> >> +-             /* This is a system-dependent way to specify the
> >> +-                bitmask used for the NaN.  We expect it to be
> >> +-                a number which is put in the mantissa of the
> >> +-                number.  */
> >> +-             STRING_TYPE *endp;
> >> +-             unsigned long long int mant;
> >> +-
> >> +-             mant = STRTOULL (startp + 1, &endp, 0);
> >> +-             if (endp == cp)
> >> +-               SET_MANTISSA (retval, mant);
> >> +-
> >> +-             /* Consume the closing brace.  */
> >> +-             ++cp;
> >> +-           }
> >> ++               /* Only match the NAN part.  */
> >> ++               cp = startp;
> >> +        }
> >> +
> >> +      if (endptr != NULL)
> >> +Index: git/stdlib/strtod_nan.c
> >> +===================================================================
> >> +--- /dev/null
> >> ++++ git/stdlib/strtod_nan.c
> >> +@@ -0,0 +1,24 @@
> >> ++/* Convert string for NaN payload to corresponding NaN.  Narrow
> >> ++   strings, double.
> >> ++   Copyright (C) 2015 Free Software Foundation, Inc.
> >> ++   This file is part of the GNU C Library.
> >> ++
> >> ++   The GNU C Library is free software; you can redistribute it and/or
> >> ++   modify it under the terms of the GNU Lesser General Public
> >> ++   License as published by the Free Software Foundation; either
> >> ++   version 2.1 of the License, or (at your option) any later version.
> >> ++
> >> ++   The GNU C Library is distributed in the hope that it will be
> useful,
> >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> >> ++   Lesser General Public License for more details.
> >> ++
> >> ++   You should have received a copy of the GNU Lesser General Public
> >> ++   License along with the GNU C Library; if not, see
> >> ++   <http://www.gnu.org/licenses/>.  */
> >> ++
> >> ++#include <strtod_nan_narrow.h>
> >> ++#include <strtod_nan_double.h>
> >> ++
> >> ++#define STRTOD_NAN __strtod_nan
> >> ++#include <strtod_nan_main.c>
> >> +Index: git/stdlib/strtod_nan_double.h
> >> +===================================================================
> >> +--- /dev/null
> >> ++++ git/stdlib/strtod_nan_double.h
> >> +@@ -0,0 +1,30 @@
> >> ++/* Convert string for NaN payload to corresponding NaN.  For double.
> >> ++   Copyright (C) 1997-2015 Free Software Foundation, Inc.
> >> ++   This file is part of the GNU C Library.
> >> ++
> >> ++   The GNU C Library is free software; you can redistribute it and/or
> >> ++   modify it under the terms of the GNU Lesser General Public
> >> ++   License as published by the Free Software Foundation; either
> >> ++   version 2.1 of the License, or (at your option) any later version.
> >> ++
> >> ++   The GNU C Library is distributed in the hope that it will be
> useful,
> >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> >> ++   Lesser General Public License for more details.
> >> ++
> >> ++   You should have received a copy of the GNU Lesser General Public
> >> ++   License along with the GNU C Library; if not, see
> >> ++   <http://www.gnu.org/licenses/>.  */
> >> ++
> >> ++#define FLOAT              double
> >> ++#define SET_MANTISSA(flt, mant)                            \
> >> ++  do                                                       \
> >> ++    {                                                      \
> >> ++      union ieee754_double u;                              \
> >> ++      u.d = (flt);                                 \
> >> ++      u.ieee_nan.mantissa0 = (mant) >> 32;         \
> >> ++      u.ieee_nan.mantissa1 = (mant);                       \
> >> ++      if ((u.ieee.mantissa0 | u.ieee.mantissa1) != 0)      \
> >> ++   (flt) = u.d;                                    \
> >> ++    }                                                      \
> >> ++  while (0)
> >> +Index: git/stdlib/strtod_nan_float.h
> >> +===================================================================
> >> +--- /dev/null
> >> ++++ git/stdlib/strtod_nan_float.h
> >> +@@ -0,0 +1,29 @@
> >> ++/* Convert string for NaN payload to corresponding NaN.  For float.
> >> ++   Copyright (C) 1997-2015 Free Software Foundation, Inc.
> >> ++   This file is part of the GNU C Library.
> >> ++
> >> ++   The GNU C Library is free software; you can redistribute it and/or
> >> ++   modify it under the terms of the GNU Lesser General Public
> >> ++   License as published by the Free Software Foundation; either
> >> ++   version 2.1 of the License, or (at your option) any later version.
> >> ++
> >> ++   The GNU C Library is distributed in the hope that it will be
> useful,
> >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> >> ++   Lesser General Public License for more details.
> >> ++
> >> ++   You should have received a copy of the GNU Lesser General Public
> >> ++   License along with the GNU C Library; if not, see
> >> ++   <http://www.gnu.org/licenses/>.  */
> >> ++
> >> ++#define    FLOAT           float
> >> ++#define SET_MANTISSA(flt, mant)                    \
> >> ++  do                                               \
> >> ++    {                                              \
> >> ++      union ieee754_float u;                       \
> >> ++      u.f = (flt);                         \
> >> ++      u.ieee_nan.mantissa = (mant);                \
> >> ++      if (u.ieee.mantissa != 0)                    \
> >> ++   (flt) = u.f;                            \
> >> ++    }                                              \
> >> ++  while (0)
> >> +Index: git/stdlib/strtod_nan_main.c
> >> +===================================================================
> >> +--- /dev/null
> >> ++++ git/stdlib/strtod_nan_main.c
> >> +@@ -0,0 +1,63 @@
> >> ++/* Convert string for NaN payload to corresponding NaN.
> >> ++   Copyright (C) 1997-2015 Free Software Foundation, Inc.
> >> ++   This file is part of the GNU C Library.
> >> ++
> >> ++   The GNU C Library is free software; you can redistribute it and/or
> >> ++   modify it under the terms of the GNU Lesser General Public
> >> ++   License as published by the Free Software Foundation; either
> >> ++   version 2.1 of the License, or (at your option) any later version.
> >> ++
> >> ++   The GNU C Library is distributed in the hope that it will be
> useful,
> >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> >> ++   Lesser General Public License for more details.
> >> ++
> >> ++   You should have received a copy of the GNU Lesser General Public
> >> ++   License along with the GNU C Library; if not, see
> >> ++   <http://www.gnu.org/licenses/>.  */
> >> ++
> >> ++#include <ieee754.h>
> >> ++#include <locale.h>
> >> ++#include <math.h>
> >> ++#include <stdlib.h>
> >> ++#include <wchar.h>
> >> ++
> >> ++
> >> ++/* If STR starts with an optional n-char-sequence as defined by ISO C
> >> ++   (a sequence of ASCII letters, digits and underscores), followed by
> >> ++   ENDC, return a NaN whose payload is set based on STR.  Otherwise,
> >> ++   return a default NAN.  If ENDPTR is not NULL, set *ENDPTR to point
> >> ++   to the character after the initial n-char-sequence.  */
> >> ++
> >> ++internal_function
> >> ++FLOAT
> >> ++STRTOD_NAN (const STRING_TYPE *str, STRING_TYPE **endptr, STRING_TYPE
> endc)
> >> ++{
> >> ++  const STRING_TYPE *cp = str;
> >> ++
> >> ++  while ((*cp >= L_('0') && *cp <= L_('9'))
> >> ++    || (*cp >= L_('A') && *cp <= L_('Z'))
> >> ++    || (*cp >= L_('a') && *cp <= L_('z'))
> >> ++    || *cp == L_('_'))
> >> ++    ++cp;
> >> ++
> >> ++  FLOAT retval = NAN;
> >> ++  if (*cp != endc)
> >> ++    goto out;
> >> ++
> >> ++  /* This is a system-dependent way to specify the bitmask used for
> >> ++     the NaN.  We expect it to be a number which is put in the
> >> ++     mantissa of the number.  */
> >> ++  STRING_TYPE *endp;
> >> ++  unsigned long long int mant;
> >> ++
> >> ++  mant = STRTOULL (str, &endp, 0);
> >> ++  if (endp == cp)
> >> ++    SET_MANTISSA (retval, mant);
> >> ++
> >> ++ out:
> >> ++  if (endptr != NULL)
> >> ++    *endptr = (STRING_TYPE *) cp;
> >> ++  return retval;
> >> ++}
> >> ++libc_hidden_def (STRTOD_NAN)
> >> +Index: git/stdlib/strtod_nan_narrow.h
> >> +===================================================================
> >> +--- /dev/null
> >> ++++ git/stdlib/strtod_nan_narrow.h
> >> +@@ -0,0 +1,22 @@
> >> ++/* Convert string for NaN payload to corresponding NaN.  Narrow
> strings.
> >> ++   Copyright (C) 1997-2015 Free Software Foundation, Inc.
> >> ++   This file is part of the GNU C Library.
> >> ++
> >> ++   The GNU C Library is free software; you can redistribute it and/or
> >> ++   modify it under the terms of the GNU Lesser General Public
> >> ++   License as published by the Free Software Foundation; either
> >> ++   version 2.1 of the License, or (at your option) any later version.
> >> ++
> >> ++   The GNU C Library is distributed in the hope that it will be
> useful,
> >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> >> ++   Lesser General Public License for more details.
> >> ++
> >> ++   You should have received a copy of the GNU Lesser General Public
> >> ++   License along with the GNU C Library; if not, see
> >> ++   <http://www.gnu.org/licenses/>.  */
> >> ++
> >> ++#define STRING_TYPE char
> >> ++#define L_(Ch) Ch
> >> ++#define STRTOULL(S, E, B) ____strtoull_l_internal ((S), (E), (B), 0,
>      \
> >> ++                                              _nl_C_locobj_ptr)
> >> +Index: git/stdlib/strtod_nan_wide.h
> >> +===================================================================
> >> +--- /dev/null
> >> ++++ git/stdlib/strtod_nan_wide.h
> >> +@@ -0,0 +1,22 @@
> >> ++/* Convert string for NaN payload to corresponding NaN.  Wide strings.
> >> ++   Copyright (C) 1997-2015 Free Software Foundation, Inc.
> >> ++   This file is part of the GNU C Library.
> >> ++
> >> ++   The GNU C Library is free software; you can redistribute it and/or
> >> ++   modify it under the terms of the GNU Lesser General Public
> >> ++   License as published by the Free Software Foundation; either
> >> ++   version 2.1 of the License, or (at your option) any later version.
> >> ++
> >> ++   The GNU C Library is distributed in the hope that it will be
> useful,
> >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> >> ++   Lesser General Public License for more details.
> >> ++
> >> ++   You should have received a copy of the GNU Lesser General Public
> >> ++   License along with the GNU C Library; if not, see
> >> ++   <http://www.gnu.org/licenses/>.  */
> >> ++
> >> ++#define STRING_TYPE wchar_t
> >> ++#define L_(Ch) L##Ch
> >> ++#define STRTOULL(S, E, B) ____wcstoull_l_internal ((S), (E), (B), 0,
>      \
> >> ++                                              _nl_C_locobj_ptr)
> >> +Index: git/stdlib/strtof_l.c
> >> +===================================================================
> >> +--- git.orig/stdlib/strtof_l.c
> >> ++++ git/stdlib/strtof_l.c
> >> +@@ -20,26 +20,19 @@
> >> + #include <xlocale.h>
> >> +
> >> + extern float ____strtof_l_internal (const char *, char **, int,
> __locale_t);
> >> +-extern unsigned long long int ____strtoull_l_internal (const char *,
> char **,
> >> +-                                                  int, int,
> __locale_t);
> >> +
> >> + #define    FLOAT           float
> >> + #define    FLT             FLT
> >> + #ifdef USE_WIDE_CHAR
> >> + # define STRTOF            wcstof_l
> >> + # define __STRTOF  __wcstof_l
> >> ++# define STRTOF_NAN        __wcstof_nan
> >> + #else
> >> + # define STRTOF            strtof_l
> >> + # define __STRTOF  __strtof_l
> >> ++# define STRTOF_NAN        __strtof_nan
> >> + #endif
> >> + #define    MPN2FLOAT       __mpn_construct_float
> >> + #define    FLOAT_HUGE_VAL  HUGE_VALF
> >> +-#define SET_MANTISSA(flt, mant) \
> >> +-  do { union ieee754_float u;
>             \
> >> +-       u.f = (flt);
>             \
> >> +-       u.ieee_nan.mantissa = (mant);
>            \
> >> +-       if (u.ieee.mantissa != 0)
>    \
> >> +-    (flt) = u.f;
>    \
> >> +-  } while (0)
> >> +
> >> + #include "strtod_l.c"
> >> +Index: git/stdlib/strtof_nan.c
> >> +===================================================================
> >> +--- /dev/null
> >> ++++ git/stdlib/strtof_nan.c
> >> +@@ -0,0 +1,24 @@
> >> ++/* Convert string for NaN payload to corresponding NaN.  Narrow
> >> ++   strings, float.
> >> ++   Copyright (C) 2015 Free Software Foundation, Inc.
> >> ++   This file is part of the GNU C Library.
> >> ++
> >> ++   The GNU C Library is free software; you can redistribute it and/or
> >> ++   modify it under the terms of the GNU Lesser General Public
> >> ++   License as published by the Free Software Foundation; either
> >> ++   version 2.1 of the License, or (at your option) any later version.
> >> ++
> >> ++   The GNU C Library is distributed in the hope that it will be
> useful,
> >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> >> ++   Lesser General Public License for more details.
> >> ++
> >> ++   You should have received a copy of the GNU Lesser General Public
> >> ++   License along with the GNU C Library; if not, see
> >> ++   <http://www.gnu.org/licenses/>.  */
> >> ++
> >> ++#include <strtod_nan_narrow.h>
> >> ++#include <strtod_nan_float.h>
> >> ++
> >> ++#define STRTOD_NAN __strtof_nan
> >> ++#include <strtod_nan_main.c>
> >> +Index: git/stdlib/strtold_nan.c
> >> +===================================================================
> >> +--- /dev/null
> >> ++++ git/stdlib/strtold_nan.c
> >> +@@ -0,0 +1,30 @@
> >> ++/* Convert string for NaN payload to corresponding NaN.  Narrow
> >> ++   strings, long double.
> >> ++   Copyright (C) 2015 Free Software Foundation, Inc.
> >> ++   This file is part of the GNU C Library.
> >> ++
> >> ++   The GNU C Library is free software; you can redistribute it and/or
> >> ++   modify it under the terms of the GNU Lesser General Public
> >> ++   License as published by the Free Software Foundation; either
> >> ++   version 2.1 of the License, or (at your option) any later version.
> >> ++
> >> ++   The GNU C Library is distributed in the hope that it will be
> useful,
> >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> >> ++   Lesser General Public License for more details.
> >> ++
> >> ++   You should have received a copy of the GNU Lesser General Public
> >> ++   License along with the GNU C Library; if not, see
> >> ++   <http://www.gnu.org/licenses/>.  */
> >> ++
> >> ++#include <math.h>
> >> ++
> >> ++/* This function is unused if long double and double have the same
> >> ++   representation.  */
> >> ++#ifndef __NO_LONG_DOUBLE_MATH
> >> ++# include <strtod_nan_narrow.h>
> >> ++# include <strtod_nan_ldouble.h>
> >> ++
> >> ++# define STRTOD_NAN __strtold_nan
> >> ++# include <strtod_nan_main.c>
> >> ++#endif
> >> +Index: git/sysdeps/ieee754/ldbl-128/strtod_nan_ldouble.h
> >> +===================================================================
> >> +--- /dev/null
> >> ++++ git/sysdeps/ieee754/ldbl-128/strtod_nan_ldouble.h
> >> +@@ -0,0 +1,33 @@
> >> ++/* Convert string for NaN payload to corresponding NaN.  For ldbl-128.
> >> ++   Copyright (C) 1997-2015 Free Software Foundation, Inc.
> >> ++   This file is part of the GNU C Library.
> >> ++
> >> ++   The GNU C Library is free software; you can redistribute it and/or
> >> ++   modify it under the terms of the GNU Lesser General Public
> >> ++   License as published by the Free Software Foundation; either
> >> ++   version 2.1 of the License, or (at your option) any later version.
> >> ++
> >> ++   The GNU C Library is distributed in the hope that it will be
> useful,
> >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> >> ++   Lesser General Public License for more details.
> >> ++
> >> ++   You should have received a copy of the GNU Lesser General Public
> >> ++   License along with the GNU C Library; if not, see
> >> ++   <http://www.gnu.org/licenses/>.  */
> >> ++
> >> ++#define FLOAT              long double
> >> ++#define SET_MANTISSA(flt, mant)                            \
> >> ++  do                                                       \
> >> ++    {                                                      \
> >> ++      union ieee854_long_double u;                 \
> >> ++      u.d = (flt);                                 \
> >> ++      u.ieee_nan.mantissa0 = 0;                            \
> >> ++      u.ieee_nan.mantissa1 = 0;                            \
> >> ++      u.ieee_nan.mantissa2 = (mant) >> 32;         \
> >> ++      u.ieee_nan.mantissa3 = (mant);                       \
> >> ++      if ((u.ieee.mantissa0 | u.ieee.mantissa1             \
> >> ++      | u.ieee.mantissa2 | u.ieee.mantissa3) != 0) \
> >> ++   (flt) = u.d;                                    \
> >> ++    }                                                      \
> >> ++  while (0)
> >> +Index: git/sysdeps/ieee754/ldbl-128/strtold_l.c
> >> +===================================================================
> >> +--- git.orig/sysdeps/ieee754/ldbl-128/strtold_l.c
> >> ++++ git/sysdeps/ieee754/ldbl-128/strtold_l.c
> >> +@@ -25,22 +25,13 @@
> >> + #ifdef USE_WIDE_CHAR
> >> + # define STRTOF            wcstold_l
> >> + # define __STRTOF  __wcstold_l
> >> ++# define STRTOF_NAN        __wcstold_nan
> >> + #else
> >> + # define STRTOF            strtold_l
> >> + # define __STRTOF  __strtold_l
> >> ++# define STRTOF_NAN        __strtold_nan
> >> + #endif
> >> + #define MPN2FLOAT  __mpn_construct_long_double
> >> + #define FLOAT_HUGE_VAL     HUGE_VALL
> >> +-#define SET_MANTISSA(flt, mant) \
> >> +-  do { union ieee854_long_double u;
>             \
> >> +-       u.d = (flt);
>             \
> >> +-       u.ieee_nan.mantissa0 = 0;
>    \
> >> +-       u.ieee_nan.mantissa1 = 0;
>    \
> >> +-       u.ieee_nan.mantissa2 = (mant) >> 32;
>             \
> >> +-       u.ieee_nan.mantissa3 = (mant);
>             \
> >> +-       if ((u.ieee.mantissa0 | u.ieee.mantissa1
>             \
> >> +-       | u.ieee.mantissa2 | u.ieee.mantissa3) != 0)
>     \
> >> +-    (flt) = u.d;
>    \
> >> +-  } while (0)
> >> +
> >> + #include <strtod_l.c>
> >> +Index: git/sysdeps/ieee754/ldbl-128ibm/strtod_nan_ldouble.h
> >> +===================================================================
> >> +--- /dev/null
> >> ++++ git/sysdeps/ieee754/ldbl-128ibm/strtod_nan_ldouble.h
> >> +@@ -0,0 +1,30 @@
> >> ++/* Convert string for NaN payload to corresponding NaN.  For
> ldbl-128ibm.
> >> ++   Copyright (C) 1997-2015 Free Software Foundation, Inc.
> >> ++   This file is part of the GNU C Library.
> >> ++
> >> ++   The GNU C Library is free software; you can redistribute it and/or
> >> ++   modify it under the terms of the GNU Lesser General Public
> >> ++   License as published by the Free Software Foundation; either
> >> ++   version 2.1 of the License, or (at your option) any later version.
> >> ++
> >> ++   The GNU C Library is distributed in the hope that it will be
> useful,
> >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> >> ++   Lesser General Public License for more details.
> >> ++
> >> ++   You should have received a copy of the GNU Lesser General Public
> >> ++   License along with the GNU C Library; if not, see
> >> ++   <http://www.gnu.org/licenses/>.  */
> >> ++
> >> ++#define FLOAT              long double
> >> ++#define SET_MANTISSA(flt, mant)                                    \
> >> ++  do                                                               \
> >> ++    {                                                              \
> >> ++      union ibm_extended_long_double u;                            \
> >> ++      u.ld = (flt);                                                \
> >> ++      u.d[0].ieee_nan.mantissa0 = (mant) >> 32;                    \
> >> ++      u.d[0].ieee_nan.mantissa1 = (mant);                  \
> >> ++      if ((u.d[0].ieee.mantissa0 | u.d[0].ieee.mantissa1) != 0)    \
> >> ++   (flt) = u.ld;                                           \
> >> ++    }                                                              \
> >> ++  while (0)
> >> +Index: git/sysdeps/ieee754/ldbl-128ibm/strtold_l.c
> >> +===================================================================
> >> +--- git.orig/sysdeps/ieee754/ldbl-128ibm/strtold_l.c
> >> ++++ git/sysdeps/ieee754/ldbl-128ibm/strtold_l.c
> >> +@@ -30,25 +30,19 @@ extern long double ____new_wcstold_l (co
> >> + # define STRTOF            __new_wcstold_l
> >> + # define __STRTOF  ____new_wcstold_l
> >> + # define ____STRTOF_INTERNAL ____wcstold_l_internal
> >> ++# define STRTOF_NAN        __wcstold_nan
> >> + #else
> >> + extern long double ____new_strtold_l (const char *, char **,
> __locale_t);
> >> + # define STRTOF            __new_strtold_l
> >> + # define __STRTOF  ____new_strtold_l
> >> + # define ____STRTOF_INTERNAL ____strtold_l_internal
> >> ++# define STRTOF_NAN        __strtold_nan
> >> + #endif
> >> + extern __typeof (__STRTOF) STRTOF;
> >> + libc_hidden_proto (__STRTOF)
> >> + libc_hidden_proto (STRTOF)
> >> + #define MPN2FLOAT  __mpn_construct_long_double
> >> + #define FLOAT_HUGE_VAL     HUGE_VALL
> >> +-# define SET_MANTISSA(flt, mant) \
> >> +-  do { union ibm_extended_long_double u;
>    \
> >> +-       u.ld = (flt);
>            \
> >> +-       u.d[0].ieee_nan.mantissa0 = (mant) >> 32;
>    \
> >> +-       u.d[0].ieee_nan.mantissa1 = (mant);
>    \
> >> +-       if ((u.d[0].ieee.mantissa0 | u.d[0].ieee.mantissa1) != 0)
>    \
> >> +-    (flt) = u.ld;
>     \
> >> +-  } while (0)
> >> +
> >> + #include <strtod_l.c>
> >> +
> >> +Index: git/sysdeps/ieee754/ldbl-64-128/strtold_l.c
> >> +===================================================================
> >> +--- git.orig/sysdeps/ieee754/ldbl-64-128/strtold_l.c
> >> ++++ git/sysdeps/ieee754/ldbl-64-128/strtold_l.c
> >> +@@ -30,28 +30,19 @@ extern long double ____new_wcstold_l (co
> >> + # define STRTOF            __new_wcstold_l
> >> + # define __STRTOF  ____new_wcstold_l
> >> + # define ____STRTOF_INTERNAL ____wcstold_l_internal
> >> ++# define STRTOF_NAN        __wcstold_nan
> >> + #else
> >> + extern long double ____new_strtold_l (const char *, char **,
> __locale_t);
> >> + # define STRTOF            __new_strtold_l
> >> + # define __STRTOF  ____new_strtold_l
> >> + # define ____STRTOF_INTERNAL ____strtold_l_internal
> >> ++# define STRTOF_NAN        __strtold_nan
> >> + #endif
> >> + extern __typeof (__STRTOF) STRTOF;
> >> + libc_hidden_proto (__STRTOF)
> >> + libc_hidden_proto (STRTOF)
> >> + #define MPN2FLOAT  __mpn_construct_long_double
> >> + #define FLOAT_HUGE_VAL     HUGE_VALL
> >> +-#define SET_MANTISSA(flt, mant) \
> >> +-  do { union ieee854_long_double u;
>             \
> >> +-       u.d = (flt);
>             \
> >> +-       u.ieee_nan.mantissa0 = 0;
>    \
> >> +-       u.ieee_nan.mantissa1 = 0;
>    \
> >> +-       u.ieee_nan.mantissa2 = (mant) >> 32;
>             \
> >> +-       u.ieee_nan.mantissa3 = (mant);
>             \
> >> +-       if ((u.ieee.mantissa0 | u.ieee.mantissa1
>             \
> >> +-       | u.ieee.mantissa2 | u.ieee.mantissa3) != 0)
>     \
> >> +-    (flt) = u.d;
>    \
> >> +-  } while (0)
> >> +
> >> + #include <strtod_l.c>
> >> +
> >> +Index: git/sysdeps/ieee754/ldbl-96/strtod_nan_ldouble.h
> >> +===================================================================
> >> +--- /dev/null
> >> ++++ git/sysdeps/ieee754/ldbl-96/strtod_nan_ldouble.h
> >> +@@ -0,0 +1,30 @@
> >> ++/* Convert string for NaN payload to corresponding NaN.  For ldbl-96.
> >> ++   Copyright (C) 1997-2015 Free Software Foundation, Inc.
> >> ++   This file is part of the GNU C Library.
> >> ++
> >> ++   The GNU C Library is free software; you can redistribute it and/or
> >> ++   modify it under the terms of the GNU Lesser General Public
> >> ++   License as published by the Free Software Foundation; either
> >> ++   version 2.1 of the License, or (at your option) any later version.
> >> ++
> >> ++   The GNU C Library is distributed in the hope that it will be
> useful,
> >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> >> ++   Lesser General Public License for more details.
> >> ++
> >> ++   You should have received a copy of the GNU Lesser General Public
> >> ++   License along with the GNU C Library; if not, see
> >> ++   <http://www.gnu.org/licenses/>.  */
> >> ++
> >> ++#define FLOAT              long double
> >> ++#define SET_MANTISSA(flt, mant)                            \
> >> ++  do                                                       \
> >> ++    {                                                      \
> >> ++      union ieee854_long_double u;                 \
> >> ++      u.d = (flt);                                 \
> >> ++      u.ieee_nan.mantissa0 = (mant) >> 32;         \
> >> ++      u.ieee_nan.mantissa1 = (mant);                       \
> >> ++      if ((u.ieee.mantissa0 | u.ieee.mantissa1) != 0)      \
> >> ++   (flt) = u.d;                                    \
> >> ++    }                                                      \
> >> ++  while (0)
> >> +Index: git/sysdeps/ieee754/ldbl-96/strtold_l.c
> >> +===================================================================
> >> +--- git.orig/sysdeps/ieee754/ldbl-96/strtold_l.c
> >> ++++ git/sysdeps/ieee754/ldbl-96/strtold_l.c
> >> +@@ -25,19 +25,13 @@
> >> + #ifdef USE_WIDE_CHAR
> >> + # define STRTOF            wcstold_l
> >> + # define __STRTOF  __wcstold_l
> >> ++# define STRTOF_NAN        __wcstold_nan
> >> + #else
> >> + # define STRTOF            strtold_l
> >> + # define __STRTOF  __strtold_l
> >> ++# define STRTOF_NAN        __strtold_nan
> >> + #endif
> >> + #define MPN2FLOAT  __mpn_construct_long_double
> >> + #define FLOAT_HUGE_VAL     HUGE_VALL
> >> +-#define SET_MANTISSA(flt, mant) \
> >> +-  do { union ieee854_long_double u;
>             \
> >> +-       u.d = (flt);
>             \
> >> +-       u.ieee_nan.mantissa0 = (mant) >> 32;
>             \
> >> +-       u.ieee_nan.mantissa1 = (mant);
>             \
> >> +-       if ((u.ieee.mantissa0 | u.ieee.mantissa1) != 0)
>            \
> >> +-    (flt) = u.d;
>    \
> >> +-  } while (0)
> >> +
> >> + #include <stdlib/strtod_l.c>
> >> +Index: git/wcsmbs/Makefile
> >> +===================================================================
> >> +--- git.orig/wcsmbs/Makefile
> >> ++++ git/wcsmbs/Makefile
> >> +@@ -39,6 +39,7 @@ routines-$(OPTION_POSIX_C_LANG_WIDE_CHAR
> >> +        wcstol wcstoul wcstoll wcstoull wcstod wcstold wcstof \
> >> +        wcstol_l wcstoul_l wcstoll_l wcstoull_l \
> >> +        wcstod_l wcstold_l wcstof_l \
> >> ++       wcstod_nan wcstold_nan wcstof_nan \
> >> +        wcscoll wcsxfrm \
> >> +        wcwidth wcswidth \
> >> +        wcscoll_l wcsxfrm_l \
> >> +Index: git/wcsmbs/wcstod_l.c
> >> +===================================================================
> >> +--- git.orig/wcsmbs/wcstod_l.c
> >> ++++ git/wcsmbs/wcstod_l.c
> >> +@@ -23,9 +23,6 @@
> >> +
> >> + extern double ____wcstod_l_internal (const wchar_t *, wchar_t **, int,
> >> +                                 __locale_t);
> >> +-extern unsigned long long int ____wcstoull_l_internal (const wchar_t
> *,
> >> +-                                                  wchar_t **, int,
> int,
> >> +-                                                  __locale_t);
> >> +
> >> + #define    USE_WIDE_CHAR   1
> >> +
> >> +Index: git/wcsmbs/wcstod_nan.c
> >> +===================================================================
> >> +--- /dev/null
> >> ++++ git/wcsmbs/wcstod_nan.c
> >> +@@ -0,0 +1,23 @@
> >> ++/* Convert string for NaN payload to corresponding NaN.  Wide
> strings, double.
> >> ++   Copyright (C) 2015 Free Software Foundation, Inc.
> >> ++   This file is part of the GNU C Library.
> >> ++
> >> ++   The GNU C Library is free software; you can redistribute it and/or
> >> ++   modify it under the terms of the GNU Lesser General Public
> >> ++   License as published by the Free Software Foundation; either
> >> ++   version 2.1 of the License, or (at your option) any later version.
> >> ++
> >> ++   The GNU C Library is distributed in the hope that it will be
> useful,
> >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> >> ++   Lesser General Public License for more details.
> >> ++
> >> ++   You should have received a copy of the GNU Lesser General Public
> >> ++   License along with the GNU C Library; if not, see
> >> ++   <http://www.gnu.org/licenses/>.  */
> >> ++
> >> ++#include "../stdlib/strtod_nan_wide.h"
> >> ++#include "../stdlib/strtod_nan_double.h"
> >> ++
> >> ++#define STRTOD_NAN __wcstod_nan
> >> ++#include "../stdlib/strtod_nan_main.c"
> >> +Index: git/wcsmbs/wcstof_l.c
> >> +===================================================================
> >> +--- git.orig/wcsmbs/wcstof_l.c
> >> ++++ git/wcsmbs/wcstof_l.c
> >> +@@ -25,8 +25,5 @@
> >> +
> >> + extern float ____wcstof_l_internal (const wchar_t *, wchar_t **, int,
> >> +                                __locale_t);
> >> +-extern unsigned long long int ____wcstoull_l_internal (const wchar_t
> *,
> >> +-                                                  wchar_t **, int,
> int,
> >> +-                                                  __locale_t);
> >> +
> >> + #include <stdlib/strtof_l.c>
> >> +Index: git/wcsmbs/wcstof_nan.c
> >> +===================================================================
> >> +--- /dev/null
> >> ++++ git/wcsmbs/wcstof_nan.c
> >> +@@ -0,0 +1,23 @@
> >> ++/* Convert string for NaN payload to corresponding NaN.  Wide
> strings, float.
> >> ++   Copyright (C) 2015 Free Software Foundation, Inc.
> >> ++   This file is part of the GNU C Library.
> >> ++
> >> ++   The GNU C Library is free software; you can redistribute it and/or
> >> ++   modify it under the terms of the GNU Lesser General Public
> >> ++   License as published by the Free Software Foundation; either
> >> ++   version 2.1 of the License, or (at your option) any later version.
> >> ++
> >> ++   The GNU C Library is distributed in the hope that it will be
> useful,
> >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> >> ++   Lesser General Public License for more details.
> >> ++
> >> ++   You should have received a copy of the GNU Lesser General Public
> >> ++   License along with the GNU C Library; if not, see
> >> ++   <http://www.gnu.org/licenses/>.  */
> >> ++
> >> ++#include "../stdlib/strtod_nan_wide.h"
> >> ++#include "../stdlib/strtod_nan_float.h"
> >> ++
> >> ++#define STRTOD_NAN __wcstof_nan
> >> ++#include "../stdlib/strtod_nan_main.c"
> >> +Index: git/wcsmbs/wcstold_l.c
> >> +===================================================================
> >> +--- git.orig/wcsmbs/wcstold_l.c
> >> ++++ git/wcsmbs/wcstold_l.c
> >> +@@ -24,8 +24,5 @@
> >> +
> >> + extern long double ____wcstold_l_internal (const wchar_t *, wchar_t
> **, int,
> >> +                                       __locale_t);
> >> +-extern unsigned long long int ____wcstoull_l_internal (const wchar_t
> *,
> >> +-                                                  wchar_t **, int,
> int,
> >> +-                                                  __locale_t);
> >> +
> >> + #include <strtold_l.c>
> >> +Index: git/wcsmbs/wcstold_nan.c
> >> +===================================================================
> >> +--- /dev/null
> >> ++++ git/wcsmbs/wcstold_nan.c
> >> +@@ -0,0 +1,30 @@
> >> ++/* Convert string for NaN payload to corresponding NaN.  Wide strings,
> >> ++   long double.
> >> ++   Copyright (C) 2015 Free Software Foundation, Inc.
> >> ++   This file is part of the GNU C Library.
> >> ++
> >> ++   The GNU C Library is free software; you can redistribute it and/or
> >> ++   modify it under the terms of the GNU Lesser General Public
> >> ++   License as published by the Free Software Foundation; either
> >> ++   version 2.1 of the License, or (at your option) any later version.
> >> ++
> >> ++   The GNU C Library is distributed in the hope that it will be
> useful,
> >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> >> ++   Lesser General Public License for more details.
> >> ++
> >> ++   You should have received a copy of the GNU Lesser General Public
> >> ++   License along with the GNU C Library; if not, see
> >> ++   <http://www.gnu.org/licenses/>.  */
> >> ++
> >> ++#include <math.h>
> >> ++
> >> ++/* This function is unused if long double and double have the same
> >> ++   representation.  */
> >> ++#ifndef __NO_LONG_DOUBLE_MATH
> >> ++# include "../stdlib/strtod_nan_wide.h"
> >> ++# include <strtod_nan_ldouble.h>
> >> ++
> >> ++# define STRTOD_NAN __wcstold_nan
> >> ++# include "../stdlib/strtod_nan_main.c"
> >> ++#endif
> >> +Index: git/ChangeLog
> >> +===================================================================
> >> +--- git.orig/ChangeLog
> >> ++++ git/ChangeLog
> >> +@@ -1,3 +1,57 @@
> >> ++2015-11-24  Joseph Myers  <joseph@codesourcery.com>
> >> ++
> >> ++   * stdlib/strtod_nan.c: New file.
> >> ++   * stdlib/strtod_nan_double.h: Likewise.
> >> ++   * stdlib/strtod_nan_float.h: Likewise.
> >> ++   * stdlib/strtod_nan_main.c: Likewise.
> >> ++   * stdlib/strtod_nan_narrow.h: Likewise.
> >> ++   * stdlib/strtod_nan_wide.h: Likewise.
> >> ++   * stdlib/strtof_nan.c: Likewise.
> >> ++   * stdlib/strtold_nan.c: Likewise.
> >> ++   * sysdeps/ieee754/ldbl-128/strtod_nan_ldouble.h: Likewise.
> >> ++   * sysdeps/ieee754/ldbl-128ibm/strtod_nan_ldouble.h: Likewise.
> >> ++   * sysdeps/ieee754/ldbl-96/strtod_nan_ldouble.h: Likewise.
> >> ++   * wcsmbs/wcstod_nan.c: Likewise.
> >> ++   * wcsmbs/wcstof_nan.c: Likewise.
> >> ++   * wcsmbs/wcstold_nan.c: Likewise.
> >> ++   * stdlib/Makefile (routines): Add strtof_nan, strtod_nan and
> >> ++   strtold_nan.
> >> ++   * wcsmbs/Makefile (routines): Add wcstod_nan, wcstold_nan and
> >> ++   wcstof_nan.
> >> ++   * include/stdlib.h (__strtof_nan): Declare and use
> >> ++   libc_hidden_proto.
> >> ++   (__strtod_nan): Likewise.
> >> ++   (__strtold_nan): Likewise.
> >> ++   (__wcstof_nan): Likewise.
> >> ++   (__wcstod_nan): Likewise.
> >> ++   (__wcstold_nan): Likewise.
> >> ++   * include/wchar.h (____wcstoull_l_internal): Declare.
> >> ++   * stdlib/strtod_l.c: Do not include <ieee754.h>.
> >> ++   (____strtoull_l_internal): Remove declaration.
> >> ++   (STRTOF_NAN): Define macro.
> >> ++   (SET_MANTISSA): Remove macro.
> >> ++   (STRTOULL): Likewise.
> >> ++   (____STRTOF_INTERNAL): Use STRTOF_NAN to parse NaN payload.
> >> ++   * stdlib/strtof_l.c (____strtoull_l_internal): Remove declaration.
> >> ++   (STRTOF_NAN): Define macro.
> >> ++   (SET_MANTISSA): Remove macro.
> >> ++   * sysdeps/ieee754/ldbl-128/strtold_l.c (STRTOF_NAN): Define macro.
> >> ++   (SET_MANTISSA): Remove macro.
> >> ++   * sysdeps/ieee754/ldbl-128ibm/strtold_l.c (STRTOF_NAN): Define
> >> ++   macro.
> >> ++   (SET_MANTISSA): Remove macro.
> >> ++   * sysdeps/ieee754/ldbl-64-128/strtold_l.c (STRTOF_NAN): Define
> >> ++   macro.
> >> ++   (SET_MANTISSA): Remove macro.
> >> ++   * sysdeps/ieee754/ldbl-96/strtold_l.c (STRTOF_NAN): Define macro.
> >> ++   (SET_MANTISSA): Remove macro.
> >> ++   * wcsmbs/wcstod_l.c (____wcstoull_l_internal): Remove declaration.
> >> ++   * wcsmbs/wcstof_l.c (____wcstoull_l_internal): Likewise.
> >> ++   * wcsmbs/wcstold_l.c (____wcstoull_l_internal): Likewise.
> >> ++
> >> ++   [BZ #19266]
> >> ++   * stdlib/strtod_l.c (____STRTOF_INTERNAL): Check directly for
> >> ++   upper case and lower case letters inside NAN(), not using TOLOWER.
> >> + 2015-08-08  Paul Pluzhnikov  <ppluzhnikov@google.com>
> >> +
> >> +    [BZ #17905]
> >> diff --git a/meta/recipes-core/glibc/glibc/CVE-2015-9761_2.patch
> b/meta/recipes-core/glibc/glibc/CVE-2015-9761_2.patch
> >> new file mode 100644
> >> index 0000000..0df5e50
> >> --- /dev/null
> >> +++ b/meta/recipes-core/glibc/glibc/CVE-2015-9761_2.patch
> >> @@ -0,0 +1,388 @@
> >> +From 8f5e8b01a1da2a207228f2072c934fa5918554b8 Mon Sep 17 00:00:00 2001
> >> +From: Joseph Myers <joseph@codesourcery.com>
> >> +Date: Fri, 4 Dec 2015 20:36:28 +0000
> >> +Subject: [PATCH] Fix nan functions handling of payload strings (bug
> 16961, bug
> >> + 16962).
> >> +
> >> +The nan, nanf and nanl functions handle payload strings by doing e.g.:
> >> +
> >> +  if (tagp[0] != '\0')
> >> +    {
> >> +      char buf[6 + strlen (tagp)];
> >> +      sprintf (buf, "NAN(%s)", tagp);
> >> +      return strtod (buf, NULL);
> >> +    }
> >> +
> >> +This is an unbounded stack allocation based on the length of the
> >> +argument.  Furthermore, if the argument starts with an n-char-sequence
> >> +followed by ')', that n-char-sequence is wrongly treated as
> >> +significant for determining the payload of the resulting NaN, when ISO
> >> +C says the call should be equivalent to strtod ("NAN", NULL), without
> >> +being affected by that initial n-char-sequence.  This patch fixes both
> >> +those problems by using the __strtod_nan etc. functions recently
> >> +factored out of strtod etc. for that purpose, with those functions
> >> +being exported from libc at version GLIBC_PRIVATE.
> >> +
> >> +Tested for x86_64, x86, mips64 and powerpc.
> >> +
> >> +    [BZ #16961]
> >> +    [BZ #16962]
> >> +    * math/s_nan.c (__nan): Use __strtod_nan instead of constructing a
> >> +    string on the stack for strtod.
> >> +    * math/s_nanf.c (__nanf): Use __strtof_nan instead of constructing
> >> +    a string on the stack for strtof.
> >> +    * math/s_nanl.c (__nanl): Use __strtold_nan instead of
> >> +    constructing a string on the stack for strtold.
> >> +    * stdlib/Versions (libc): Add __strtof_nan, __strtod_nan and
> >> +    __strtold_nan to GLIBC_PRIVATE.
> >> +    * math/test-nan-overflow.c: New file.
> >> +    * math/test-nan-payload.c: Likewise.
> >> +    * math/Makefile (tests): Add test-nan-overflow and
> >> +    test-nan-payload.
> >> +
> >> +Upstream-Status: Backport
> >> +CVE: CVE-2015-9761 patch #2
> >> +[Yocto # 8980]
> >> +
> >> +
> https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=8f5e8b01a1da2a207228f2072c934fa5918554b8
> >> +
> >> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> >> +
> >> +---
> >> + ChangeLog                |  17 +++++++
> >> + NEWS                     |   6 +++
> >> + math/Makefile            |   3 +-
> >> + math/s_nan.c             |   9 +---
> >> + math/s_nanf.c            |   9 +---
> >> + math/s_nanl.c            |   9 +---
> >> + math/test-nan-overflow.c |  66 +++++++++++++++++++++++++
> >> + math/test-nan-payload.c  | 122
> +++++++++++++++++++++++++++++++++++++++++++++++
> >> + stdlib/Versions          |   1 +
> >> + 9 files changed, 217 insertions(+), 25 deletions(-)
> >> + create mode 100644 math/test-nan-overflow.c
> >> + create mode 100644 math/test-nan-payload.c
> >> +
> >> +Index: git/ChangeLog
> >> +===================================================================
> >> +--- git.orig/ChangeLog
> >> ++++ git/ChangeLog
> >> +@@ -1,3 +1,20 @@
> >> ++2015-12-04  Joseph Myers  <joseph@codesourcery.com>
> >> ++
> >> ++   [BZ #16961]
> >> ++   [BZ #16962]
> >> ++   * math/s_nan.c (__nan): Use __strtod_nan instead of constructing a
> >> ++   string on the stack for strtod.
> >> ++   * math/s_nanf.c (__nanf): Use __strtof_nan instead of constructing
> >> ++   a string on the stack for strtof.
> >> ++   * math/s_nanl.c (__nanl): Use __strtold_nan instead of
> >> ++   constructing a string on the stack for strtold.
> >> ++   * stdlib/Versions (libc): Add __strtof_nan, __strtod_nan and
> >> ++   __strtold_nan to GLIBC_PRIVATE.
> >> ++   * math/test-nan-overflow.c: New file.
> >> ++   * math/test-nan-payload.c: Likewise.
> >> ++   * math/Makefile (tests): Add test-nan-overflow and
> >> ++   test-nan-payload.
> >> ++
> >> + 2015-11-24  Joseph Myers  <joseph@codesourcery.com>
> >> +
> >> +    * stdlib/strtod_nan.c: New file.
> >> +Index: git/NEWS
> >> +===================================================================
> >> +--- git.orig/NEWS
> >> ++++ git/NEWS
> >> +@@ -7,6 +7,12 @@ using `glibc' in the "product" field.
> >> +
> >> + Version 2.21
> >> +
> >> ++Security related changes:
> >> ++
> >> ++* The nan, nanf and nanl functions no longer have unbounded stack
> usage
> >> ++  depending on the length of the string passed as an argument to the
> >> ++  functions.  Reported by Joseph Myers.
> >> ++
> >> + * The following bugs are resolved with this release:
> >> +
> >> +   6652, 10672, 12674, 12847, 12926, 13862, 14132, 14138, 14171, 14498,
> >> +Index: git/math/s_nan.c
> >> +===================================================================
> >> +--- git.orig/math/s_nan.c
> >> ++++ git/math/s_nan.c
> >> +@@ -28,14 +28,7 @@
> >> + double
> >> + __nan (const char *tagp)
> >> + {
> >> +-  if (tagp[0] != '\0')
> >> +-    {
> >> +-      char buf[6 + strlen (tagp)];
> >> +-      sprintf (buf, "NAN(%s)", tagp);
> >> +-      return strtod (buf, NULL);
> >> +-    }
> >> +-
> >> +-  return NAN;
> >> ++  return __strtod_nan (tagp, NULL, 0);
> >> + }
> >> + weak_alias (__nan, nan)
> >> + #ifdef NO_LONG_DOUBLE
> >> +Index: git/math/s_nanf.c
> >> +===================================================================
> >> +--- git.orig/math/s_nanf.c
> >> ++++ git/math/s_nanf.c
> >> +@@ -28,13 +28,6 @@
> >> + float
> >> + __nanf (const char *tagp)
> >> + {
> >> +-  if (tagp[0] != '\0')
> >> +-    {
> >> +-      char buf[6 + strlen (tagp)];
> >> +-      sprintf (buf, "NAN(%s)", tagp);
> >> +-      return strtof (buf, NULL);
> >> +-    }
> >> +-
> >> +-  return NAN;
> >> ++  return __strtof_nan (tagp, NULL, 0);
> >> + }
> >> + weak_alias (__nanf, nanf)
> >> +Index: git/math/s_nanl.c
> >> +===================================================================
> >> +--- git.orig/math/s_nanl.c
> >> ++++ git/math/s_nanl.c
> >> +@@ -28,13 +28,6 @@
> >> + long double
> >> + __nanl (const char *tagp)
> >> + {
> >> +-  if (tagp[0] != '\0')
> >> +-    {
> >> +-      char buf[6 + strlen (tagp)];
> >> +-      sprintf (buf, "NAN(%s)", tagp);
> >> +-      return strtold (buf, NULL);
> >> +-    }
> >> +-
> >> +-  return NAN;
> >> ++  return __strtold_nan (tagp, NULL, 0);
> >> + }
> >> + weak_alias (__nanl, nanl)
> >> +Index: git/math/test-nan-overflow.c
> >> +===================================================================
> >> +--- /dev/null
> >> ++++ git/math/test-nan-overflow.c
> >> +@@ -0,0 +1,66 @@
> >> ++/* Test nan functions stack overflow (bug 16962).
> >> ++   Copyright (C) 2015 Free Software Foundation, Inc.
> >> ++   This file is part of the GNU C Library.
> >> ++
> >> ++   The GNU C Library is free software; you can redistribute it and/or
> >> ++   modify it under the terms of the GNU Lesser General Public
> >> ++   License as published by the Free Software Foundation; either
> >> ++   version 2.1 of the License, or (at your option) any later version.
> >> ++
> >> ++   The GNU C Library is distributed in the hope that it will be
> useful,
> >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> >> ++   Lesser General Public License for more details.
> >> ++
> >> ++   You should have received a copy of the GNU Lesser General Public
> >> ++   License along with the GNU C Library; if not, see
> >> ++   <http://www.gnu.org/licenses/>.  */
> >> ++
> >> ++#include <math.h>
> >> ++#include <stdio.h>
> >> ++#include <string.h>
> >> ++#include <sys/resource.h>
> >> ++
> >> ++#define STACK_LIM 1048576
> >> ++#define STRING_SIZE (2 * STACK_LIM)
> >> ++
> >> ++static int
> >> ++do_test (void)
> >> ++{
> >> ++  int result = 0;
> >> ++  struct rlimit lim;
> >> ++  getrlimit (RLIMIT_STACK, &lim);
> >> ++  lim.rlim_cur = STACK_LIM;
> >> ++  setrlimit (RLIMIT_STACK, &lim);
> >> ++  char *nanstr = malloc (STRING_SIZE);
> >> ++  if (nanstr == NULL)
> >> ++    {
> >> ++      puts ("malloc failed, cannot test");
> >> ++      return 77;
> >> ++    }
> >> ++  memset (nanstr, '0', STRING_SIZE - 1);
> >> ++  nanstr[STRING_SIZE - 1] = 0;
> >> ++#define NAN_TEST(TYPE, FUNC)                       \
> >> ++  do                                               \
> >> ++    {                                              \
> >> ++      char *volatile p = nanstr;           \
> >> ++      volatile TYPE v = FUNC (p);          \
> >> ++      if (isnan (v))                               \
> >> ++   puts ("PASS: " #FUNC);                  \
> >> ++      else                                 \
> >> ++   {                                       \
> >> ++     puts ("FAIL: " #FUNC);                \
> >> ++     result = 1;                           \
> >> ++   }                                       \
> >> ++    }                                              \
> >> ++  while (0)
> >> ++  NAN_TEST (float, nanf);
> >> ++  NAN_TEST (double, nan);
> >> ++#ifndef NO_LONG_DOUBLE
> >> ++  NAN_TEST (long double, nanl);
> >> ++#endif
> >> ++  return result;
> >> ++}
> >> ++
> >> ++#define TEST_FUNCTION do_test ()
> >> ++#include "../test-skeleton.c"
> >> +Index: git/math/test-nan-payload.c
> >> +===================================================================
> >> +--- /dev/null
> >> ++++ git/math/test-nan-payload.c
> >> +@@ -0,0 +1,122 @@
> >> ++/* Test nan functions payload handling (bug 16961).
> >> ++   Copyright (C) 2015 Free Software Foundation, Inc.
> >> ++   This file is part of the GNU C Library.
> >> ++
> >> ++   The GNU C Library is free software; you can redistribute it and/or
> >> ++   modify it under the terms of the GNU Lesser General Public
> >> ++   License as published by the Free Software Foundation; either
> >> ++   version 2.1 of the License, or (at your option) any later version.
> >> ++
> >> ++   The GNU C Library is distributed in the hope that it will be
> useful,
> >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> >> ++   Lesser General Public License for more details.
> >> ++
> >> ++   You should have received a copy of the GNU Lesser General Public
> >> ++   License along with the GNU C Library; if not, see
> >> ++   <http://www.gnu.org/licenses/>.  */
> >> ++
> >> ++#include <float.h>
> >> ++#include <math.h>
> >> ++#include <stdio.h>
> >> ++#include <stdlib.h>
> >> ++#include <string.h>
> >> ++
> >> ++/* Avoid built-in functions.  */
> >> ++#define WRAP_NAN(FUNC, STR) \
> >> ++  ({ const char *volatile wns = (STR); FUNC (wns); })
> >> ++#define WRAP_STRTO(FUNC, STR) \
> >> ++  ({ const char *volatile wss = (STR); FUNC (wss, NULL); })
> >> ++
> >> ++#define CHECK_IS_NAN(TYPE, A)                      \
> >> ++  do                                               \
> >> ++    {                                              \
> >> ++      if (isnan (A))                               \
> >> ++   puts ("PASS: " #TYPE " " #A);           \
> >> ++      else                                 \
> >> ++   {                                       \
> >> ++     puts ("FAIL: " #TYPE " " #A);         \
> >> ++     result = 1;                           \
> >> ++   }                                       \
> >> ++    }                                              \
> >> ++  while (0)
> >> ++
> >> ++#define CHECK_SAME_NAN(TYPE, A, B)                 \
> >> ++  do                                                       \
> >> ++    {                                                      \
> >> ++      if (memcmp (&(A), &(B), sizeof (A)) == 0)            \
> >> ++   puts ("PASS: " #TYPE " " #A " = " #B);          \
> >> ++      else                                         \
> >> ++   {                                               \
> >> ++     puts ("FAIL: " #TYPE " " #A " = " #B);        \
> >> ++     result = 1;                                   \
> >> ++   }                                               \
> >> ++    }                                                      \
> >> ++  while (0)
> >> ++
> >> ++#define CHECK_DIFF_NAN(TYPE, A, B)                 \
> >> ++  do                                                       \
> >> ++    {                                                      \
> >> ++      if (memcmp (&(A), &(B), sizeof (A)) != 0)            \
> >> ++   puts ("PASS: " #TYPE " " #A " != " #B);         \
> >> ++      else                                         \
> >> ++   {                                               \
> >> ++     puts ("FAIL: " #TYPE " " #A " != " #B);       \
> >> ++     result = 1;                                   \
> >> ++   }                                               \
> >> ++    }                                                      \
> >> ++  while (0)
> >> ++
> >> ++/* Cannot test payloads by memcmp for formats where NaNs have padding
> >> ++   bits.  */
> >> ++#define CAN_TEST_EQ(MANT_DIG) ((MANT_DIG) != 64 && (MANT_DIG) != 106)
> >> ++
> >> ++#define RUN_TESTS(TYPE, SFUNC, FUNC, MANT_DIG)             \
> >> ++  do                                                       \
> >> ++    {                                                      \
> >> ++     TYPE n123 = WRAP_NAN (FUNC, "123");           \
> >> ++     CHECK_IS_NAN (TYPE, n123);                            \
> >> ++     TYPE s123 = WRAP_STRTO (SFUNC, "NAN(123)");   \
> >> ++     CHECK_IS_NAN (TYPE, s123);                            \
> >> ++     TYPE n456 = WRAP_NAN (FUNC, "456");           \
> >> ++     CHECK_IS_NAN (TYPE, n456);                            \
> >> ++     TYPE s456 = WRAP_STRTO (SFUNC, "NAN(456)");   \
> >> ++     CHECK_IS_NAN (TYPE, s456);                            \
> >> ++     TYPE n123x = WRAP_NAN (FUNC, "123)");         \
> >> ++     CHECK_IS_NAN (TYPE, n123x);                   \
> >> ++     TYPE nemp = WRAP_NAN (FUNC, "");                      \
> >> ++     CHECK_IS_NAN (TYPE, nemp);                            \
> >> ++     TYPE semp = WRAP_STRTO (SFUNC, "NAN()");              \
> >> ++     CHECK_IS_NAN (TYPE, semp);                            \
> >> ++     TYPE sx = WRAP_STRTO (SFUNC, "NAN");          \
> >> ++     CHECK_IS_NAN (TYPE, sx);                              \
> >> ++     if (CAN_TEST_EQ (MANT_DIG))                   \
> >> ++       CHECK_SAME_NAN (TYPE, n123, s123);          \
> >> ++     if (CAN_TEST_EQ (MANT_DIG))                   \
> >> ++       CHECK_SAME_NAN (TYPE, n456, s456);          \
> >> ++     if (CAN_TEST_EQ (MANT_DIG))                   \
> >> ++       CHECK_SAME_NAN (TYPE, nemp, semp);          \
> >> ++     if (CAN_TEST_EQ (MANT_DIG))                   \
> >> ++       CHECK_SAME_NAN (TYPE, n123x, sx);           \
> >> ++     CHECK_DIFF_NAN (TYPE, n123, n456);                    \
> >> ++     CHECK_DIFF_NAN (TYPE, n123, nemp);                    \
> >> ++     CHECK_DIFF_NAN (TYPE, n123, n123x);           \
> >> ++     CHECK_DIFF_NAN (TYPE, n456, nemp);                    \
> >> ++     CHECK_DIFF_NAN (TYPE, n456, n123x);           \
> >> ++    }                                                      \
> >> ++  while (0)
> >> ++
> >> ++static int
> >> ++do_test (void)
> >> ++{
> >> ++  int result = 0;
> >> ++  RUN_TESTS (float, strtof, nanf, FLT_MANT_DIG);
> >> ++  RUN_TESTS (double, strtod, nan, DBL_MANT_DIG);
> >> ++#ifndef NO_LONG_DOUBLE
> >> ++  RUN_TESTS (long double, strtold, nanl, LDBL_MANT_DIG);
> >> ++#endif
> >> ++  return result;
> >> ++}
> >> ++
> >> ++#define TEST_FUNCTION do_test ()
> >> ++#include "../test-skeleton.c"
> >> +Index: git/stdlib/Versions
> >> +===================================================================
> >> +--- git.orig/stdlib/Versions
> >> ++++ git/stdlib/Versions
> >> +@@ -118,5 +118,6 @@ libc {
> >> +     # Used from other libraries
> >> +     __libc_secure_getenv;
> >> +     __call_tls_dtors;
> >> ++    __strtof_nan; __strtod_nan; __strtold_nan;
> >> +   }
> >> + }
> >> +Index: git/math/Makefile
> >> +===================================================================
> >> +--- git.orig/math/Makefile
> >> ++++ git/math/Makefile
> >> +@@ -92,7 +92,9 @@ tests = test-matherr test-fenv atest-exp
> >> +    test-misc test-fpucw test-fpucw-ieee tst-definitions test-tgmath \
> >> +    test-tgmath-ret bug-nextafter bug-nexttoward bug-tgmath1 \
> >> +    test-tgmath-int test-tgmath2 test-powl tst-CMPLX tst-CMPLX2
> test-snan \
> >> +-   test-fenv-tls test-fenv-preserve test-fenv-return $(tests-static)
> >> ++   test-fenv-tls test-fenv-preserve test-fenv-return \
> >> ++    test-nan-overflow test-nan-payload \
> >> ++    $(tests-static)
> >> + tests-static = test-fpucw-static test-fpucw-ieee-static
> >> + # We do the `long double' tests only if this data type is available
> and
> >> + # distinct from `double'.
> >> diff --git a/meta/recipes-core/glibc/glibc_2.20.bb
> b/meta/recipes-core/glibc/glibc_2.20.bb
> >> index af568d9..d099d5d 100644
> >> --- a/meta/recipes-core/glibc/glibc_2.20.bb
> >> +++ b/meta/recipes-core/glibc/glibc_2.20.bb
> >> @@ -50,6 +50,8 @@ CVEPATCHES = "\
> >>          file://CVE-2015-7547.patch \
> >>          file://CVE-2015-8777.patch \
> >>          file://CVE-2015-8779.patch \
> >> +        file://CVE-2015-9761_1.patch \
> >> +        file://CVE-2015-9761_2.patch \
> >>  "
> >>
> >>  LIC_FILES_CHKSUM =
> "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
> >> --
> >> 2.3.5
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>

--001a1144250e479fe3052d2b1a0d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I was asking you about the CVE number (but I realize it wa=
s already merged in other branches with wrong number so maybe it will be le=
ss confusing use the same in Dizzy)<div><br></div><div>And &quot;please mer=
ge&quot; was informal</div><div>Acked-by: Martin Jansa &lt;<a href=3D"mailt=
o:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;</div><div><br></di=
v><div>after testing this series in our Dizzy based builds.</div></div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Mar 3, 2016 a=
t 9:35 PM, akuster@mvista <span dir=3D"ltr">&lt;<a href=3D"mailto:akuster@m=
vista.com" target=3D"_blank">akuster@mvista.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><span class=3D"">On 3/3/16 12:16 AM, Martin Ja=
nsa wrote:<br>
&gt; On Sun, Feb 28, 2016 at 10:53:34AM -0800, Armin Kuster wrote:<br>
&gt;&gt; From: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com">akust=
er@mvista.com</a>&gt;<br>
&gt;<br>
&gt; I think this is 2014-9761 not 2015-9761<br>
&gt;<br>
&gt; But other than that please merge this series.<br>
<br>
</span>Are you asking me? I don&#39;t have write perms.<br>
<br>
- armin<br>
<div class=3D"HOEnZb"><div class=3D"h5">&gt;<br>
&gt;&gt; A stack overflow vulnerability was found in nan* functions that co=
uld cause<br>
&gt;&gt; applications which process long strings with the nan function to c=
rash or,<br>
&gt;&gt; potentially, execute arbitrary code.<br>
&gt;&gt;<br>
&gt;&gt; (From OE-Core rev: fd3da8178c8c06b549dbc19ecec40e98ab934d49)<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.c=
om">akuster@mvista.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windr=
iver.com">liezhi.yang@windriver.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie=
@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt;&gt; Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.c=
om">akuster@mvista.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie=
@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt;&gt; Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail=
.com">akuster808@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../recipes-core/glibc/glibc/CVE-2015-9761_1.patch | 1039 ++=
++++++++++++++++++<br>
&gt;&gt;=C2=A0 .../recipes-core/glibc/glibc/CVE-2015-9761_2.patch |=C2=A0 3=
88 ++++++++<br>
&gt;&gt;=C2=A0 meta/recipes-core/glibc/<a href=3D"http://glibc_2.20.bb" rel=
=3D"noreferrer" target=3D"_blank">glibc_2.20.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
&gt;&gt;=C2=A0 3 files changed, 1429 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-97=
61_1.patch<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-97=
61_2.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-core/glibc/glibc/CVE-2015-9761_1.patch b=
/meta/recipes-core/glibc/glibc/CVE-2015-9761_1.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000..3aca913<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-core/glibc/glibc/CVE-2015-9761_1.patch<br>
&gt;&gt; @@ -0,0 +1,1039 @@<br>
&gt;&gt; +From e02cabecf0d025ec4f4ddee290bdf7aadb873bb3 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Joseph Myers &lt;<a href=3D"mailto:joseph@codesourcery.com"=
>joseph@codesourcery.com</a>&gt;<br>
&gt;&gt; +Date: Tue, 24 Nov 2015 22:24:52 +0000<br>
&gt;&gt; +Subject: [PATCH] Refactor strtod parsing of NaN payloads.<br>
&gt;&gt; +<br>
&gt;&gt; +The nan* functions handle their string argument by constructing a=
<br>
&gt;&gt; +NAN(...) string on the stack as a VLA and passing it to strtod<br=
>
&gt;&gt; +functions.<br>
&gt;&gt; +<br>
&gt;&gt; +This approach has problems discussed in bug 16961 and bug 16962: =
the<br>
&gt;&gt; +stack usage is unbounded, and it gives incorrect results in certa=
in<br>
&gt;&gt; +cases where the argument is not a valid n-char-sequence.<br>
&gt;&gt; +<br>
&gt;&gt; +The natural fix for both issues is to refactor the NaN payload pa=
rsing<br>
&gt;&gt; +out of strtod into a separate function that the nan* functions ca=
n<br>
&gt;&gt; +call directly, so that no temporary string needs constructing on =
the<br>
&gt;&gt; +stack at all.=C2=A0 This patch does that refactoring in preparati=
on for<br>
&gt;&gt; +fixing those bugs (but without actually using the new functions f=
rom<br>
&gt;&gt; +nan* - which will also require exporting them from libc at versio=
n<br>
&gt;&gt; +GLIBC_PRIVATE).=C2=A0 This patch is not intended to change any us=
er-visible<br>
&gt;&gt; +behavior, so no tests are added (fixes for the above bugs will of=
<br>
&gt;&gt; +course add tests for them).<br>
&gt;&gt; +<br>
&gt;&gt; +This patch builds on my recent fixes for strtol and strtod issues=
 in<br>
&gt;&gt; +Turkish locales.=C2=A0 Given those fixes, the parsing of NaN payl=
oads is<br>
&gt;&gt; +locale-independent; thus, the new functions do not need to take a=
<br>
&gt;&gt; +locale_t argument.<br>
&gt;&gt; +<br>
&gt;&gt; +Tested for x86_64, x86, mips64 and powerpc.<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 * stdlib/strtod_nan.c: New file.<br>
&gt;&gt; +=C2=A0 =C2=A0 * stdlib/strtod_nan_double.h: Likewise.<br>
&gt;&gt; +=C2=A0 =C2=A0 * stdlib/strtod_nan_float.h: Likewise.<br>
&gt;&gt; +=C2=A0 =C2=A0 * stdlib/strtod_nan_main.c: Likewise.<br>
&gt;&gt; +=C2=A0 =C2=A0 * stdlib/strtod_nan_narrow.h: Likewise.<br>
&gt;&gt; +=C2=A0 =C2=A0 * stdlib/strtod_nan_wide.h: Likewise.<br>
&gt;&gt; +=C2=A0 =C2=A0 * stdlib/strtof_nan.c: Likewise.<br>
&gt;&gt; +=C2=A0 =C2=A0 * stdlib/strtold_nan.c: Likewise.<br>
&gt;&gt; +=C2=A0 =C2=A0 * sysdeps/ieee754/ldbl-128/strtod_nan_ldouble.h: Li=
kewise.<br>
&gt;&gt; +=C2=A0 =C2=A0 * sysdeps/ieee754/ldbl-128ibm/strtod_nan_ldouble.h:=
 Likewise.<br>
&gt;&gt; +=C2=A0 =C2=A0 * sysdeps/ieee754/ldbl-96/strtod_nan_ldouble.h: Lik=
ewise.<br>
&gt;&gt; +=C2=A0 =C2=A0 * wcsmbs/wcstod_nan.c: Likewise.<br>
&gt;&gt; +=C2=A0 =C2=A0 * wcsmbs/wcstof_nan.c: Likewise.<br>
&gt;&gt; +=C2=A0 =C2=A0 * wcsmbs/wcstold_nan.c: Likewise.<br>
&gt;&gt; +=C2=A0 =C2=A0 * stdlib/Makefile (routines): Add strtof_nan, strto=
d_nan and<br>
&gt;&gt; +=C2=A0 =C2=A0 strtold_nan.<br>
&gt;&gt; +=C2=A0 =C2=A0 * wcsmbs/Makefile (routines): Add wcstod_nan, wcsto=
ld_nan and<br>
&gt;&gt; +=C2=A0 =C2=A0 wcstof_nan.<br>
&gt;&gt; +=C2=A0 =C2=A0 * include/stdlib.h (__strtof_nan): Declare and use<=
br>
&gt;&gt; +=C2=A0 =C2=A0 libc_hidden_proto.<br>
&gt;&gt; +=C2=A0 =C2=A0 (__strtod_nan): Likewise.<br>
&gt;&gt; +=C2=A0 =C2=A0 (__strtold_nan): Likewise.<br>
&gt;&gt; +=C2=A0 =C2=A0 (__wcstof_nan): Likewise.<br>
&gt;&gt; +=C2=A0 =C2=A0 (__wcstod_nan): Likewise.<br>
&gt;&gt; +=C2=A0 =C2=A0 (__wcstold_nan): Likewise.<br>
&gt;&gt; +=C2=A0 =C2=A0 * include/wchar.h (____wcstoull_l_internal): Declar=
e.<br>
&gt;&gt; +=C2=A0 =C2=A0 * stdlib/strtod_l.c: Do not include &lt;ieee754.h&g=
t;.<br>
&gt;&gt; +=C2=A0 =C2=A0 (____strtoull_l_internal): Remove declaration.<br>
&gt;&gt; +=C2=A0 =C2=A0 (STRTOF_NAN): Define macro.<br>
&gt;&gt; +=C2=A0 =C2=A0 (SET_MANTISSA): Remove macro.<br>
&gt;&gt; +=C2=A0 =C2=A0 (STRTOULL): Likewise.<br>
&gt;&gt; +=C2=A0 =C2=A0 (____STRTOF_INTERNAL): Use STRTOF_NAN to parse NaN =
payload.<br>
&gt;&gt; +=C2=A0 =C2=A0 * stdlib/strtof_l.c (____strtoull_l_internal): Remo=
ve declaration.<br>
&gt;&gt; +=C2=A0 =C2=A0 (STRTOF_NAN): Define macro.<br>
&gt;&gt; +=C2=A0 =C2=A0 (SET_MANTISSA): Remove macro.<br>
&gt;&gt; +=C2=A0 =C2=A0 * sysdeps/ieee754/ldbl-128/strtold_l.c (STRTOF_NAN)=
: Define macro.<br>
&gt;&gt; +=C2=A0 =C2=A0 (SET_MANTISSA): Remove macro.<br>
&gt;&gt; +=C2=A0 =C2=A0 * sysdeps/ieee754/ldbl-128ibm/strtold_l.c (STRTOF_N=
AN): Define<br>
&gt;&gt; +=C2=A0 =C2=A0 macro.<br>
&gt;&gt; +=C2=A0 =C2=A0 (SET_MANTISSA): Remove macro.<br>
&gt;&gt; +=C2=A0 =C2=A0 * sysdeps/ieee754/ldbl-64-128/strtold_l.c (STRTOF_N=
AN): Define<br>
&gt;&gt; +=C2=A0 =C2=A0 macro.<br>
&gt;&gt; +=C2=A0 =C2=A0 (SET_MANTISSA): Remove macro.<br>
&gt;&gt; +=C2=A0 =C2=A0 * sysdeps/ieee754/ldbl-96/strtold_l.c (STRTOF_NAN):=
 Define macro.<br>
&gt;&gt; +=C2=A0 =C2=A0 (SET_MANTISSA): Remove macro.<br>
&gt;&gt; +=C2=A0 =C2=A0 * wcsmbs/wcstod_l.c (____wcstoull_l_internal): Remo=
ve declaration.<br>
&gt;&gt; +=C2=A0 =C2=A0 * wcsmbs/wcstof_l.c (____wcstoull_l_internal): Like=
wise.<br>
&gt;&gt; +=C2=A0 =C2=A0 * wcsmbs/wcstold_l.c (____wcstoull_l_internal): Lik=
ewise.<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Backport<br>
&gt;&gt; +CVE: CVE-2015-9761 patch #1<br>
&gt;&gt; +[Yocto # 8980]<br>
&gt;&gt; +<br>
&gt;&gt; +<a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dglibc.git;h=
=3De02cabecf0d025ec4f4ddee290bdf7aadb873bb3" rel=3D"noreferrer" target=3D"_=
blank">https://sourceware.org/git/gitweb.cgi?p=3Dglibc.git;h=3De02cabecf0d0=
25ec4f4ddee290bdf7aadb873bb3</a><br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.=
com">akuster@mvista.com</a>&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +---<br>
&gt;&gt; + ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 49 ++++++++++++++++++<br>
&gt;&gt; + include/stdlib.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 =
+++++++<br>
&gt;&gt; + include/wchar.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 3 ++<br>
&gt;&gt; + stdlib/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 1 +<br>
&gt;&gt; + stdlib/strtod_l.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 48 +++=
+--------------<br>
&gt;&gt; + stdlib/strtod_nan.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 24 +++++++++<=
br>
&gt;&gt; + stdlib/strtod_nan_double.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 30 +++++++++++<br>
&gt;&gt; + stdlib/strtod_nan_float.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 29 +++++++++++<br>
&gt;&gt; + stdlib/strtod_nan_main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 63 ++++++++++++++++++=
++++++<br>
&gt;&gt; + stdlib/strtod_nan_narrow.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 22 +++++++++<br>
&gt;&gt; + stdlib/strtod_nan_wide.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 22 +++++++++<br>
&gt;&gt; + stdlib/strtof_l.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +--=
--<br>
&gt;&gt; + stdlib/strtof_nan.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 24 +++++++++<=
br>
&gt;&gt; + stdlib/strtold_nan.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 30 ++++++++=
+++<br>
&gt;&gt; + sysdeps/ieee754/ldbl-128/strtod_nan_ldouble.h=C2=A0 =C2=A0 | 33 =
+++++++++++++<br>
&gt;&gt; + sysdeps/ieee754/ldbl-128/strtold_l.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 13 +----<br>
&gt;&gt; + sysdeps/ieee754/ldbl-128ibm/strtod_nan_ldouble.h | 30 ++++++++++=
+<br>
&gt;&gt; + sysdeps/ieee754/ldbl-128ibm/strtold_l.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 10 +---<br>
&gt;&gt; + sysdeps/ieee754/ldbl-64-128/strtold_l.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 13 +----<br>
&gt;&gt; + sysdeps/ieee754/ldbl-96/strtod_nan_ldouble.h=C2=A0 =C2=A0 =C2=A0=
| 30 +++++++++++<br>
&gt;&gt; + sysdeps/ieee754/ldbl-96/strtold_l.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 10 +---<br>
&gt;&gt; + wcsmbs/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 1 +<br>
&gt;&gt; + wcsmbs/wcstod_l.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
3 --<br>
&gt;&gt; + wcsmbs/wcstod_nan.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23 +++++++++<=
br>
&gt;&gt; + wcsmbs/wcstof_l.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
3 --<br>
&gt;&gt; + wcsmbs/wcstof_nan.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23 +++++++++<=
br>
&gt;&gt; + wcsmbs/wcstold_l.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3=
 --<br>
&gt;&gt; + wcsmbs/wcstold_nan.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 30 ++++++++=
+++<br>
&gt;&gt; + 28 files changed, 504 insertions(+), 95 deletions(-)<br>
&gt;&gt; + create mode 100644 stdlib/strtod_nan.c<br>
&gt;&gt; + create mode 100644 stdlib/strtod_nan_double.h<br>
&gt;&gt; + create mode 100644 stdlib/strtod_nan_float.h<br>
&gt;&gt; + create mode 100644 stdlib/strtod_nan_main.c<br>
&gt;&gt; + create mode 100644 stdlib/strtod_nan_narrow.h<br>
&gt;&gt; + create mode 100644 stdlib/strtod_nan_wide.h<br>
&gt;&gt; + create mode 100644 stdlib/strtof_nan.c<br>
&gt;&gt; + create mode 100644 stdlib/strtold_nan.c<br>
&gt;&gt; + create mode 100644 sysdeps/ieee754/ldbl-128/strtod_nan_ldouble.h=
<br>
&gt;&gt; + create mode 100644 sysdeps/ieee754/ldbl-128ibm/strtod_nan_ldoubl=
e.h<br>
&gt;&gt; + create mode 100644 sysdeps/ieee754/ldbl-96/strtod_nan_ldouble.h<=
br>
&gt;&gt; + create mode 100644 wcsmbs/wcstod_nan.c<br>
&gt;&gt; + create mode 100644 wcsmbs/wcstof_nan.c<br>
&gt;&gt; + create mode 100644 wcsmbs/wcstold_nan.c<br>
&gt;&gt; +<br>
&gt;&gt; +Index: git/include/stdlib.h<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- git.orig/include/stdlib.h<br>
&gt;&gt; ++++ git/include/stdlib.h<br>
&gt;&gt; +@@ -203,6 +203,24 @@ libc_hidden_proto (strtoll)<br>
&gt;&gt; + libc_hidden_proto (strtoul)<br>
&gt;&gt; + libc_hidden_proto (strtoull)<br>
&gt;&gt; +<br>
&gt;&gt; ++extern float __strtof_nan (const char *, char **, char) internal=
_function;<br>
&gt;&gt; ++extern double __strtod_nan (const char *, char **, char) interna=
l_function;<br>
&gt;&gt; ++extern long double __strtold_nan (const char *, char **, char)<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0internal_function;<br>
&gt;&gt; ++extern float __wcstof_nan (const wchar_t *, wchar_t **, wchar_t)=
<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0internal_function;<br>
&gt;&gt; ++extern double __wcstod_nan (const wchar_t *, wchar_t **, wchar_t=
)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0internal_function;<br>
&gt;&gt; ++extern long double __wcstold_nan (const wchar_t *, wchar_t **, w=
char_t)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0internal_function;<br>
&gt;&gt; ++<br>
&gt;&gt; ++libc_hidden_proto (__strtof_nan)<br>
&gt;&gt; ++libc_hidden_proto (__strtod_nan)<br>
&gt;&gt; ++libc_hidden_proto (__strtold_nan)<br>
&gt;&gt; ++libc_hidden_proto (__wcstof_nan)<br>
&gt;&gt; ++libc_hidden_proto (__wcstod_nan)<br>
&gt;&gt; ++libc_hidden_proto (__wcstold_nan)<br>
&gt;&gt; ++<br>
&gt;&gt; + extern char *__ecvt (double __value, int __ndigit, int *__restri=
ct __decpt,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int=
 *__restrict __sign);<br>
&gt;&gt; + extern char *__fcvt (double __value, int __ndigit, int *__restri=
ct __decpt,<br>
&gt;&gt; +Index: git/include/wchar.h<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- git.orig/include/wchar.h<br>
&gt;&gt; ++++ git/include/wchar.h<br>
&gt;&gt; +@@ -52,6 +52,9 @@ extern unsigned long long int __wcstoull<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__restrict __endptr,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int __base,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int __group) __THROW;<br>
&gt;&gt; ++extern unsigned long long int ____wcstoull_l_internal (const wch=
ar_t *,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wchar_t **, int, int,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __locale_t);<br>
&gt;&gt; + libc_hidden_proto (__wcstof_internal)<br>
&gt;&gt; + libc_hidden_proto (__wcstod_internal)<br>
&gt;&gt; + libc_hidden_proto (__wcstold_internal)<br>
&gt;&gt; +Index: git/stdlib/Makefile<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- git.orig/stdlib/Makefile<br>
&gt;&gt; ++++ git/stdlib/Makefile<br>
&gt;&gt; +@@ -51,6 +51,7 @@ routines-y=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +=C2=A0 =C2=A0 strtol_l strtoul_l strtoll_l strtoull_l=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 strtof strtod strtold=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
&gt;&gt; +=C2=A0 =C2=A0 strtof_l strtod_l strtold_l=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0strtof_nan strtod_nan strtold_nan=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 system canonicalize=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 a64l l64a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 getsubopt xpg_basename=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +Index: git/stdlib/strtod_l.c<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- git.orig/stdlib/strtod_l.c<br>
&gt;&gt; ++++ git/stdlib/strtod_l.c<br>
&gt;&gt; +@@ -21,8 +21,6 @@<br>
&gt;&gt; + #include &lt;xlocale.h&gt;<br>
&gt;&gt; +<br>
&gt;&gt; + extern double ____strtod_l_internal (const char *, char **, int,=
 __locale_t);<br>
&gt;&gt; +-extern unsigned long long int ____strtoull_l_internal (const cha=
r *, char **,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int, int, __locale_t);<br>
&gt;&gt; +<br>
&gt;&gt; + /* Configuration part.=C2=A0 These macros are defined by `strtol=
d.c&#39;,<br>
&gt;&gt; +=C2=A0 =C2=A0 `strtof.c&#39;, `wcstod.c&#39;, `wcstold.c&#39;, an=
d `wcstof.c&#39; to produce the<br>
&gt;&gt; +@@ -34,27 +32,20 @@ extern unsigned long long int ____strtou<br>
&gt;&gt; + # ifdef USE_WIDE_CHAR<br>
&gt;&gt; + #=C2=A0 define STRTOF=C2=A0 =C2=A0wcstod_l<br>
&gt;&gt; + #=C2=A0 define __STRTOF __wcstod_l<br>
&gt;&gt; ++#=C2=A0 define STRTOF_NAN=C2=A0 =C2=A0 =C2=A0 =C2=A0__wcstod_nan=
<br>
&gt;&gt; + # else<br>
&gt;&gt; + #=C2=A0 define STRTOF=C2=A0 =C2=A0strtod_l<br>
&gt;&gt; + #=C2=A0 define __STRTOF __strtod_l<br>
&gt;&gt; ++#=C2=A0 define STRTOF_NAN=C2=A0 =C2=A0 =C2=A0 =C2=A0__strtod_nan=
<br>
&gt;&gt; + # endif<br>
&gt;&gt; + # define MPN2FLOAT __mpn_construct_double<br>
&gt;&gt; + # define FLOAT_HUGE_VAL=C2=A0 =C2=A0 HUGE_VAL<br>
&gt;&gt; +-# define SET_MANTISSA(flt, mant) \<br>
&gt;&gt; +-=C2=A0 do { union ieee754_double u;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0u.d =3D (flt);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0u.ieee_nan.mantissa0 =3D (mant) &gt;&=
gt; 32;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0u.ieee_nan.mantissa1 =3D (mant);=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((u.ieee.mantissa0 | u.ieee.mantis=
sa1) !=3D 0)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 (flt) =3D u.d;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 } while (0)<br>
&gt;&gt; + #endif<br>
&gt;&gt; + /* End of configuration part.=C2=A0 */<br>
&gt;&gt; +<br>
&gt;&gt; + #include &lt;ctype.h&gt;<br>
&gt;&gt; + #include &lt;errno.h&gt;<br>
&gt;&gt; + #include &lt;float.h&gt;<br>
&gt;&gt; +-#include &lt;ieee754.h&gt;<br>
&gt;&gt; + #include &quot;../locale/localeinfo.h&quot;<br>
&gt;&gt; + #include &lt;locale.h&gt;<br>
&gt;&gt; + #include &lt;math.h&gt;<br>
&gt;&gt; +@@ -105,7 +96,6 @@ extern unsigned long long int ____strtou<br>
&gt;&gt; + # define TOLOWER_C(Ch) __towlower_l ((Ch), _nl_C_locobj_ptr)<br>
&gt;&gt; + # define STRNCASECMP(S1, S2, N) \<br>
&gt;&gt; +=C2=A0 =C2=A0__wcsncasecmp_l ((S1), (S2), (N), _nl_C_locobj_ptr)<=
br>
&gt;&gt; +-# define STRTOULL(S, E, B) ____wcstoull_l_internal ((S), (E), (B=
), 0, loc)<br>
&gt;&gt; + #else<br>
&gt;&gt; + # define STRING_TYPE char<br>
&gt;&gt; + # define CHAR_TYPE char<br>
&gt;&gt; +@@ -117,7 +107,6 @@ extern unsigned long long int ____strtou<br>
&gt;&gt; + # define TOLOWER_C(Ch) __tolower_l ((Ch), _nl_C_locobj_ptr)<br>
&gt;&gt; + # define STRNCASECMP(S1, S2, N) \<br>
&gt;&gt; +=C2=A0 =C2=A0__strncasecmp_l ((S1), (S2), (N), _nl_C_locobj_ptr)<=
br>
&gt;&gt; +-# define STRTOULL(S, E, B) ____strtoull_l_internal ((S), (E), (B=
), 0, loc)<br>
&gt;&gt; + #endif<br>
&gt;&gt; +<br>
&gt;&gt; +<br>
&gt;&gt; +@@ -668,33 +657,14 @@ ____STRTOF_INTERNAL (nptr, endptr, group<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 if (*cp =3D=3D L_(&#39;(&#39;))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const STRING_TYPE *startp =3D =
cp;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0++cp;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while ((*cp &gt;=3D L_(&#39;0&=
#39;) &amp;&amp; *cp &lt;=3D L_(&#39;9&#39;))<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || ({ CH=
AR_TYPE lo =3D TOLOWER (*cp);<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 lo &gt;=3D L_(&#39;a&#39;) &amp;&amp; lo &lt;=3D L_(&#39;z&#3=
9;); })<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || *cp =
=3D=3D L_(&#39;_&#39;));<br>
&gt;&gt; +-<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*cp !=3D L_(&#39;)&#39;))<=
br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* The closing brace is=
 missing.=C2=A0 Only match the NAN<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 part.=C2=A0 */<=
br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp =3D startp;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 STRING_TYPE *endp;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retval =3D STRTOF_NAN (cp + 1=
, &amp;endp, L_(&#39;)&#39;));<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*endp =3D=3D L_(&#39;)&#3=
9;))<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Consume the closing=
 parenthesis.=C2=A0 */<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp =3D endp + 1;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This is a sys=
tem-dependent way to specify the<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bitmask =
used for the NaN.=C2=A0 We expect it to be<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a number=
 which is put in the mantissa of the<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 number.=
=C2=A0 */<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STRING_TYPE *end=
p;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long lo=
ng int mant;<br>
&gt;&gt; +-<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mant =3D STRTOUL=
L (startp + 1, &amp;endp, 0);<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (endp =3D=3D =
cp)<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SET_MANTI=
SSA (retval, mant);<br>
&gt;&gt; +-<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Consume the c=
losing brace.=C2=A0 */<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0++cp;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Only m=
atch the NAN part.=C2=A0 */<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp =3D st=
artp;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 if (endptr !=3D NULL)<br>
&gt;&gt; +Index: git/stdlib/strtod_nan.c<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- /dev/null<br>
&gt;&gt; ++++ git/stdlib/strtod_nan.c<br>
&gt;&gt; +@@ -0,0 +1,24 @@<br>
&gt;&gt; ++/* Convert string for NaN payload to corresponding NaN.=C2=A0 Na=
rrow<br>
&gt;&gt; ++=C2=A0 =C2=A0strings, double.<br>
&gt;&gt; ++=C2=A0 =C2=A0Copyright (C) 2015 Free Software Foundation, Inc.<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is free software; you can redistr=
ibute it and/or<br>
&gt;&gt; ++=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General=
 Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License as published by the Free Software Foundatio=
n; either<br>
&gt;&gt; ++=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any=
 later version.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is distributed in the hope that i=
t will be useful,<br>
&gt;&gt; ++=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied =
warranty of<br>
&gt;&gt; ++=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.=C2=A0 See the GNU<br>
&gt;&gt; ++=C2=A0 =C2=A0Lesser General Public License for more details.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0You should have received a copy of the GNU Lesser G=
eneral Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License along with the GNU C Library; if not, see<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0&lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D=
"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.=C2=A0 =
*/<br>
&gt;&gt; ++<br>
&gt;&gt; ++#include &lt;strtod_nan_narrow.h&gt;<br>
&gt;&gt; ++#include &lt;strtod_nan_double.h&gt;<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define STRTOD_NAN __strtod_nan<br>
&gt;&gt; ++#include &lt;strtod_nan_main.c&gt;<br>
&gt;&gt; +Index: git/stdlib/strtod_nan_double.h<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- /dev/null<br>
&gt;&gt; ++++ git/stdlib/strtod_nan_double.h<br>
&gt;&gt; +@@ -0,0 +1,30 @@<br>
&gt;&gt; ++/* Convert string for NaN payload to corresponding NaN.=C2=A0 Fo=
r double.<br>
&gt;&gt; ++=C2=A0 =C2=A0Copyright (C) 1997-2015 Free Software Foundation, I=
nc.<br>
&gt;&gt; ++=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is free software; you can redistr=
ibute it and/or<br>
&gt;&gt; ++=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General=
 Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License as published by the Free Software Foundatio=
n; either<br>
&gt;&gt; ++=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any=
 later version.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is distributed in the hope that i=
t will be useful,<br>
&gt;&gt; ++=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied =
warranty of<br>
&gt;&gt; ++=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.=C2=A0 See the GNU<br>
&gt;&gt; ++=C2=A0 =C2=A0Lesser General Public License for more details.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0You should have received a copy of the GNU Lesser G=
eneral Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License along with the GNU C Library; if not, see<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0&lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D=
"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.=C2=A0 =
*/<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define FLOAT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do=
uble<br>
&gt;&gt; ++#define SET_MANTISSA(flt, mant)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 do=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 union ieee754_double u;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 u.d =3D (flt);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 u.ieee_nan.mantissa0 =3D (mant) &gt;&gt; 32=
;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 u.ieee_nan.mantissa1 =3D (mant);=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if ((u.ieee.mantissa0 | u.ieee.mantissa1) !=
=3D 0)=C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0(flt) =3D u.d;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 while (0)<br>
&gt;&gt; +Index: git/stdlib/strtod_nan_float.h<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- /dev/null<br>
&gt;&gt; ++++ git/stdlib/strtod_nan_float.h<br>
&gt;&gt; +@@ -0,0 +1,29 @@<br>
&gt;&gt; ++/* Convert string for NaN payload to corresponding NaN.=C2=A0 Fo=
r float.<br>
&gt;&gt; ++=C2=A0 =C2=A0Copyright (C) 1997-2015 Free Software Foundation, I=
nc.<br>
&gt;&gt; ++=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is free software; you can redistr=
ibute it and/or<br>
&gt;&gt; ++=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General=
 Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License as published by the Free Software Foundatio=
n; either<br>
&gt;&gt; ++=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any=
 later version.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is distributed in the hope that i=
t will be useful,<br>
&gt;&gt; ++=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied =
warranty of<br>
&gt;&gt; ++=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.=C2=A0 See the GNU<br>
&gt;&gt; ++=C2=A0 =C2=A0Lesser General Public License for more details.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0You should have received a copy of the GNU Lesser G=
eneral Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License along with the GNU C Library; if not, see<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0&lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D=
"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.=C2=A0 =
*/<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define=C2=A0 =C2=A0 FLOAT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0float<br>
&gt;&gt; ++#define SET_MANTISSA(flt, mant)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 do=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 union ieee754_float u;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 u.f =3D (flt);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 u.ieee_nan.mantissa =3D (mant);=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if (u.ieee.mantissa !=3D 0)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0(flt) =3D u.f;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 while (0)<br>
&gt;&gt; +Index: git/stdlib/strtod_nan_main.c<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- /dev/null<br>
&gt;&gt; ++++ git/stdlib/strtod_nan_main.c<br>
&gt;&gt; +@@ -0,0 +1,63 @@<br>
&gt;&gt; ++/* Convert string for NaN payload to corresponding NaN.<br>
&gt;&gt; ++=C2=A0 =C2=A0Copyright (C) 1997-2015 Free Software Foundation, I=
nc.<br>
&gt;&gt; ++=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is free software; you can redistr=
ibute it and/or<br>
&gt;&gt; ++=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General=
 Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License as published by the Free Software Foundatio=
n; either<br>
&gt;&gt; ++=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any=
 later version.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is distributed in the hope that i=
t will be useful,<br>
&gt;&gt; ++=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied =
warranty of<br>
&gt;&gt; ++=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.=C2=A0 See the GNU<br>
&gt;&gt; ++=C2=A0 =C2=A0Lesser General Public License for more details.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0You should have received a copy of the GNU Lesser G=
eneral Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License along with the GNU C Library; if not, see<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0&lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D=
"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.=C2=A0 =
*/<br>
&gt;&gt; ++<br>
&gt;&gt; ++#include &lt;ieee754.h&gt;<br>
&gt;&gt; ++#include &lt;locale.h&gt;<br>
&gt;&gt; ++#include &lt;math.h&gt;<br>
&gt;&gt; ++#include &lt;stdlib.h&gt;<br>
&gt;&gt; ++#include &lt;wchar.h&gt;<br>
&gt;&gt; ++<br>
&gt;&gt; ++<br>
&gt;&gt; ++/* If STR starts with an optional n-char-sequence as defined by =
ISO C<br>
&gt;&gt; ++=C2=A0 =C2=A0(a sequence of ASCII letters, digits and underscore=
s), followed by<br>
&gt;&gt; ++=C2=A0 =C2=A0ENDC, return a NaN whose payload is set based on ST=
R.=C2=A0 Otherwise,<br>
&gt;&gt; ++=C2=A0 =C2=A0return a default NAN.=C2=A0 If ENDPTR is not NULL, =
set *ENDPTR to point<br>
&gt;&gt; ++=C2=A0 =C2=A0to the character after the initial n-char-sequence.=
=C2=A0 */<br>
&gt;&gt; ++<br>
&gt;&gt; ++internal_function<br>
&gt;&gt; ++FLOAT<br>
&gt;&gt; ++STRTOD_NAN (const STRING_TYPE *str, STRING_TYPE **endptr, STRING=
_TYPE endc)<br>
&gt;&gt; ++{<br>
&gt;&gt; ++=C2=A0 const STRING_TYPE *cp =3D str;<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 while ((*cp &gt;=3D L_(&#39;0&#39;) &amp;&amp; *cp &lt;=
=3D L_(&#39;9&#39;))<br>
&gt;&gt; ++=C2=A0 =C2=A0 || (*cp &gt;=3D L_(&#39;A&#39;) &amp;&amp; *cp &lt=
;=3D L_(&#39;Z&#39;))<br>
&gt;&gt; ++=C2=A0 =C2=A0 || (*cp &gt;=3D L_(&#39;a&#39;) &amp;&amp; *cp &lt=
;=3D L_(&#39;z&#39;))<br>
&gt;&gt; ++=C2=A0 =C2=A0 || *cp =3D=3D L_(&#39;_&#39;))<br>
&gt;&gt; ++=C2=A0 =C2=A0 ++cp;<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 FLOAT retval =3D NAN;<br>
&gt;&gt; ++=C2=A0 if (*cp !=3D endc)<br>
&gt;&gt; ++=C2=A0 =C2=A0 goto out;<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 /* This is a system-dependent way to specify the bitmask =
used for<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0the NaN.=C2=A0 We expect it to be a number w=
hich is put in the<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0mantissa of the number.=C2=A0 */<br>
&gt;&gt; ++=C2=A0 STRING_TYPE *endp;<br>
&gt;&gt; ++=C2=A0 unsigned long long int mant;<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 mant =3D STRTOULL (str, &amp;endp, 0);<br>
&gt;&gt; ++=C2=A0 if (endp =3D=3D cp)<br>
&gt;&gt; ++=C2=A0 =C2=A0 SET_MANTISSA (retval, mant);<br>
&gt;&gt; ++<br>
&gt;&gt; ++ out:<br>
&gt;&gt; ++=C2=A0 if (endptr !=3D NULL)<br>
&gt;&gt; ++=C2=A0 =C2=A0 *endptr =3D (STRING_TYPE *) cp;<br>
&gt;&gt; ++=C2=A0 return retval;<br>
&gt;&gt; ++}<br>
&gt;&gt; ++libc_hidden_def (STRTOD_NAN)<br>
&gt;&gt; +Index: git/stdlib/strtod_nan_narrow.h<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- /dev/null<br>
&gt;&gt; ++++ git/stdlib/strtod_nan_narrow.h<br>
&gt;&gt; +@@ -0,0 +1,22 @@<br>
&gt;&gt; ++/* Convert string for NaN payload to corresponding NaN.=C2=A0 Na=
rrow strings.<br>
&gt;&gt; ++=C2=A0 =C2=A0Copyright (C) 1997-2015 Free Software Foundation, I=
nc.<br>
&gt;&gt; ++=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is free software; you can redistr=
ibute it and/or<br>
&gt;&gt; ++=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General=
 Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License as published by the Free Software Foundatio=
n; either<br>
&gt;&gt; ++=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any=
 later version.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is distributed in the hope that i=
t will be useful,<br>
&gt;&gt; ++=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied =
warranty of<br>
&gt;&gt; ++=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.=C2=A0 See the GNU<br>
&gt;&gt; ++=C2=A0 =C2=A0Lesser General Public License for more details.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0You should have received a copy of the GNU Lesser G=
eneral Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License along with the GNU C Library; if not, see<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0&lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D=
"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.=C2=A0 =
*/<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define STRING_TYPE char<br>
&gt;&gt; ++#define L_(Ch) Ch<br>
&gt;&gt; ++#define STRTOULL(S, E, B) ____strtoull_l_internal ((S), (E), (B)=
, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 _nl_C_locobj_ptr)<br>
&gt;&gt; +Index: git/stdlib/strtod_nan_wide.h<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- /dev/null<br>
&gt;&gt; ++++ git/stdlib/strtod_nan_wide.h<br>
&gt;&gt; +@@ -0,0 +1,22 @@<br>
&gt;&gt; ++/* Convert string for NaN payload to corresponding NaN.=C2=A0 Wi=
de strings.<br>
&gt;&gt; ++=C2=A0 =C2=A0Copyright (C) 1997-2015 Free Software Foundation, I=
nc.<br>
&gt;&gt; ++=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is free software; you can redistr=
ibute it and/or<br>
&gt;&gt; ++=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General=
 Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License as published by the Free Software Foundatio=
n; either<br>
&gt;&gt; ++=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any=
 later version.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is distributed in the hope that i=
t will be useful,<br>
&gt;&gt; ++=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied =
warranty of<br>
&gt;&gt; ++=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.=C2=A0 See the GNU<br>
&gt;&gt; ++=C2=A0 =C2=A0Lesser General Public License for more details.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0You should have received a copy of the GNU Lesser G=
eneral Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License along with the GNU C Library; if not, see<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0&lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D=
"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.=C2=A0 =
*/<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define STRING_TYPE wchar_t<br>
&gt;&gt; ++#define L_(Ch) L##Ch<br>
&gt;&gt; ++#define STRTOULL(S, E, B) ____wcstoull_l_internal ((S), (E), (B)=
, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 _nl_C_locobj_ptr)<br>
&gt;&gt; +Index: git/stdlib/strtof_l.c<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- git.orig/stdlib/strtof_l.c<br>
&gt;&gt; ++++ git/stdlib/strtof_l.c<br>
&gt;&gt; +@@ -20,26 +20,19 @@<br>
&gt;&gt; + #include &lt;xlocale.h&gt;<br>
&gt;&gt; +<br>
&gt;&gt; + extern float ____strtof_l_internal (const char *, char **, int, =
__locale_t);<br>
&gt;&gt; +-extern unsigned long long int ____strtoull_l_internal (const cha=
r *, char **,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int, int, __locale_t);<br>
&gt;&gt; +<br>
&gt;&gt; + #define=C2=A0 =C2=A0 FLOAT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0float<br>
&gt;&gt; + #define=C2=A0 =C2=A0 FLT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0FLT<br>
&gt;&gt; + #ifdef USE_WIDE_CHAR<br>
&gt;&gt; + # define STRTOF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wcstof_=
l<br>
&gt;&gt; + # define __STRTOF=C2=A0 __wcstof_l<br>
&gt;&gt; ++# define STRTOF_NAN=C2=A0 =C2=A0 =C2=A0 =C2=A0 __wcstof_nan<br>
&gt;&gt; + #else<br>
&gt;&gt; + # define STRTOF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strtof_=
l<br>
&gt;&gt; + # define __STRTOF=C2=A0 __strtof_l<br>
&gt;&gt; ++# define STRTOF_NAN=C2=A0 =C2=A0 =C2=A0 =C2=A0 __strtof_nan<br>
&gt;&gt; + #endif<br>
&gt;&gt; + #define=C2=A0 =C2=A0 MPN2FLOAT=C2=A0 =C2=A0 =C2=A0 =C2=A0__mpn_c=
onstruct_float<br>
&gt;&gt; + #define=C2=A0 =C2=A0 FLOAT_HUGE_VAL=C2=A0 HUGE_VALF<br>
&gt;&gt; +-#define SET_MANTISSA(flt, mant) \<br>
&gt;&gt; +-=C2=A0 do { union ieee754_float u;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0u.f =3D (flt);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0u.ieee_nan.mantissa =3D (mant);=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (u.ieee.mantissa !=3D 0)=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 (flt) =3D u.f;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 } while (0)<br>
&gt;&gt; +<br>
&gt;&gt; + #include &quot;strtod_l.c&quot;<br>
&gt;&gt; +Index: git/stdlib/strtof_nan.c<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- /dev/null<br>
&gt;&gt; ++++ git/stdlib/strtof_nan.c<br>
&gt;&gt; +@@ -0,0 +1,24 @@<br>
&gt;&gt; ++/* Convert string for NaN payload to corresponding NaN.=C2=A0 Na=
rrow<br>
&gt;&gt; ++=C2=A0 =C2=A0strings, float.<br>
&gt;&gt; ++=C2=A0 =C2=A0Copyright (C) 2015 Free Software Foundation, Inc.<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is free software; you can redistr=
ibute it and/or<br>
&gt;&gt; ++=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General=
 Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License as published by the Free Software Foundatio=
n; either<br>
&gt;&gt; ++=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any=
 later version.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is distributed in the hope that i=
t will be useful,<br>
&gt;&gt; ++=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied =
warranty of<br>
&gt;&gt; ++=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.=C2=A0 See the GNU<br>
&gt;&gt; ++=C2=A0 =C2=A0Lesser General Public License for more details.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0You should have received a copy of the GNU Lesser G=
eneral Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License along with the GNU C Library; if not, see<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0&lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D=
"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.=C2=A0 =
*/<br>
&gt;&gt; ++<br>
&gt;&gt; ++#include &lt;strtod_nan_narrow.h&gt;<br>
&gt;&gt; ++#include &lt;strtod_nan_float.h&gt;<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define STRTOD_NAN __strtof_nan<br>
&gt;&gt; ++#include &lt;strtod_nan_main.c&gt;<br>
&gt;&gt; +Index: git/stdlib/strtold_nan.c<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- /dev/null<br>
&gt;&gt; ++++ git/stdlib/strtold_nan.c<br>
&gt;&gt; +@@ -0,0 +1,30 @@<br>
&gt;&gt; ++/* Convert string for NaN payload to corresponding NaN.=C2=A0 Na=
rrow<br>
&gt;&gt; ++=C2=A0 =C2=A0strings, long double.<br>
&gt;&gt; ++=C2=A0 =C2=A0Copyright (C) 2015 Free Software Foundation, Inc.<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is free software; you can redistr=
ibute it and/or<br>
&gt;&gt; ++=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General=
 Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License as published by the Free Software Foundatio=
n; either<br>
&gt;&gt; ++=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any=
 later version.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is distributed in the hope that i=
t will be useful,<br>
&gt;&gt; ++=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied =
warranty of<br>
&gt;&gt; ++=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.=C2=A0 See the GNU<br>
&gt;&gt; ++=C2=A0 =C2=A0Lesser General Public License for more details.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0You should have received a copy of the GNU Lesser G=
eneral Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License along with the GNU C Library; if not, see<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0&lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D=
"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.=C2=A0 =
*/<br>
&gt;&gt; ++<br>
&gt;&gt; ++#include &lt;math.h&gt;<br>
&gt;&gt; ++<br>
&gt;&gt; ++/* This function is unused if long double and double have the sa=
me<br>
&gt;&gt; ++=C2=A0 =C2=A0representation.=C2=A0 */<br>
&gt;&gt; ++#ifndef __NO_LONG_DOUBLE_MATH<br>
&gt;&gt; ++# include &lt;strtod_nan_narrow.h&gt;<br>
&gt;&gt; ++# include &lt;strtod_nan_ldouble.h&gt;<br>
&gt;&gt; ++<br>
&gt;&gt; ++# define STRTOD_NAN __strtold_nan<br>
&gt;&gt; ++# include &lt;strtod_nan_main.c&gt;<br>
&gt;&gt; ++#endif<br>
&gt;&gt; +Index: git/sysdeps/ieee754/ldbl-128/strtod_nan_ldouble.h<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- /dev/null<br>
&gt;&gt; ++++ git/sysdeps/ieee754/ldbl-128/strtod_nan_ldouble.h<br>
&gt;&gt; +@@ -0,0 +1,33 @@<br>
&gt;&gt; ++/* Convert string for NaN payload to corresponding NaN.=C2=A0 Fo=
r ldbl-128.<br>
&gt;&gt; ++=C2=A0 =C2=A0Copyright (C) 1997-2015 Free Software Foundation, I=
nc.<br>
&gt;&gt; ++=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is free software; you can redistr=
ibute it and/or<br>
&gt;&gt; ++=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General=
 Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License as published by the Free Software Foundatio=
n; either<br>
&gt;&gt; ++=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any=
 later version.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is distributed in the hope that i=
t will be useful,<br>
&gt;&gt; ++=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied =
warranty of<br>
&gt;&gt; ++=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.=C2=A0 See the GNU<br>
&gt;&gt; ++=C2=A0 =C2=A0Lesser General Public License for more details.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0You should have received a copy of the GNU Lesser G=
eneral Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License along with the GNU C Library; if not, see<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0&lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D=
"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.=C2=A0 =
*/<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define FLOAT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lo=
ng double<br>
&gt;&gt; ++#define SET_MANTISSA(flt, mant)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 do=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 union ieee854_long_double u;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 u.d =3D (flt);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 u.ieee_nan.mantissa0 =3D 0;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 u.ieee_nan.mantissa1 =3D 0;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 u.ieee_nan.mantissa2 =3D (mant) &gt;&gt; 32=
;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 u.ieee_nan.mantissa3 =3D (mant);=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if ((u.ieee.mantissa0 | u.ieee.mantissa1=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 | u.ieee.mantissa2 | u.ieee.mantissa3) !=3D=
 0) \<br>
&gt;&gt; ++=C2=A0 =C2=A0(flt) =3D u.d;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 while (0)<br>
&gt;&gt; +Index: git/sysdeps/ieee754/ldbl-128/strtold_l.c<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- git.orig/sysdeps/ieee754/ldbl-128/strtold_l.c<br>
&gt;&gt; ++++ git/sysdeps/ieee754/ldbl-128/strtold_l.c<br>
&gt;&gt; +@@ -25,22 +25,13 @@<br>
&gt;&gt; + #ifdef USE_WIDE_CHAR<br>
&gt;&gt; + # define STRTOF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wcstold=
_l<br>
&gt;&gt; + # define __STRTOF=C2=A0 __wcstold_l<br>
&gt;&gt; ++# define STRTOF_NAN=C2=A0 =C2=A0 =C2=A0 =C2=A0 __wcstold_nan<br>
&gt;&gt; + #else<br>
&gt;&gt; + # define STRTOF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strtold=
_l<br>
&gt;&gt; + # define __STRTOF=C2=A0 __strtold_l<br>
&gt;&gt; ++# define STRTOF_NAN=C2=A0 =C2=A0 =C2=A0 =C2=A0 __strtold_nan<br>
&gt;&gt; + #endif<br>
&gt;&gt; + #define MPN2FLOAT=C2=A0 __mpn_construct_long_double<br>
&gt;&gt; + #define FLOAT_HUGE_VAL=C2=A0 =C2=A0 =C2=A0HUGE_VALL<br>
&gt;&gt; +-#define SET_MANTISSA(flt, mant) \<br>
&gt;&gt; +-=C2=A0 do { union ieee854_long_double u;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0u.d =3D (flt);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0u.ieee_nan.mantissa0 =3D 0;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0u.ieee_nan.mantissa1 =3D 0;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0u.ieee_nan.mantissa2 =3D (mant) &gt;&=
gt; 32;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0u.ieee_nan.mantissa3 =3D (mant);=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((u.ieee.mantissa0 | u.ieee.mantis=
sa1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0| u.ieee.mantissa2 | u.ieee.mantissa3=
) !=3D 0)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt;&gt; +-=C2=A0 =C2=A0 (flt) =3D u.d;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 } while (0)<br>
&gt;&gt; +<br>
&gt;&gt; + #include &lt;strtod_l.c&gt;<br>
&gt;&gt; +Index: git/sysdeps/ieee754/ldbl-128ibm/strtod_nan_ldouble.h<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- /dev/null<br>
&gt;&gt; ++++ git/sysdeps/ieee754/ldbl-128ibm/strtod_nan_ldouble.h<br>
&gt;&gt; +@@ -0,0 +1,30 @@<br>
&gt;&gt; ++/* Convert string for NaN payload to corresponding NaN.=C2=A0 Fo=
r ldbl-128ibm.<br>
&gt;&gt; ++=C2=A0 =C2=A0Copyright (C) 1997-2015 Free Software Foundation, I=
nc.<br>
&gt;&gt; ++=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is free software; you can redistr=
ibute it and/or<br>
&gt;&gt; ++=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General=
 Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License as published by the Free Software Foundatio=
n; either<br>
&gt;&gt; ++=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any=
 later version.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is distributed in the hope that i=
t will be useful,<br>
&gt;&gt; ++=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied =
warranty of<br>
&gt;&gt; ++=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.=C2=A0 See the GNU<br>
&gt;&gt; ++=C2=A0 =C2=A0Lesser General Public License for more details.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0You should have received a copy of the GNU Lesser G=
eneral Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License along with the GNU C Library; if not, see<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0&lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D=
"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.=C2=A0 =
*/<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define FLOAT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lo=
ng double<br>
&gt;&gt; ++#define SET_MANTISSA(flt, mant)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 do=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 union ibm_extended_long_double u;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 u.ld =3D (flt);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 u.d[0].ieee_nan.mantissa0 =3D (mant) &gt;&g=
t; 32;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 u.d[0].ieee_nan.mantissa1 =3D (mant);=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if ((u.d[0].ieee.mantissa0 | u.d[0].ieee.ma=
ntissa1) !=3D 0)=C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0(flt) =3D u.ld;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 while (0)<br>
&gt;&gt; +Index: git/sysdeps/ieee754/ldbl-128ibm/strtold_l.c<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- git.orig/sysdeps/ieee754/ldbl-128ibm/strtold_l.c<br>
&gt;&gt; ++++ git/sysdeps/ieee754/ldbl-128ibm/strtold_l.c<br>
&gt;&gt; +@@ -30,25 +30,19 @@ extern long double ____new_wcstold_l (co<br>
&gt;&gt; + # define STRTOF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __new_w=
cstold_l<br>
&gt;&gt; + # define __STRTOF=C2=A0 ____new_wcstold_l<br>
&gt;&gt; + # define ____STRTOF_INTERNAL ____wcstold_l_internal<br>
&gt;&gt; ++# define STRTOF_NAN=C2=A0 =C2=A0 =C2=A0 =C2=A0 __wcstold_nan<br>
&gt;&gt; + #else<br>
&gt;&gt; + extern long double ____new_strtold_l (const char *, char **, __l=
ocale_t);<br>
&gt;&gt; + # define STRTOF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __new_s=
trtold_l<br>
&gt;&gt; + # define __STRTOF=C2=A0 ____new_strtold_l<br>
&gt;&gt; + # define ____STRTOF_INTERNAL ____strtold_l_internal<br>
&gt;&gt; ++# define STRTOF_NAN=C2=A0 =C2=A0 =C2=A0 =C2=A0 __strtold_nan<br>
&gt;&gt; + #endif<br>
&gt;&gt; + extern __typeof (__STRTOF) STRTOF;<br>
&gt;&gt; + libc_hidden_proto (__STRTOF)<br>
&gt;&gt; + libc_hidden_proto (STRTOF)<br>
&gt;&gt; + #define MPN2FLOAT=C2=A0 __mpn_construct_long_double<br>
&gt;&gt; + #define FLOAT_HUGE_VAL=C2=A0 =C2=A0 =C2=A0HUGE_VALL<br>
&gt;&gt; +-# define SET_MANTISSA(flt, mant) \<br>
&gt;&gt; +-=C2=A0 do { union ibm_extended_long_double u;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0u.ld =3D (flt);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0u.d[0].ieee_nan.mantissa0 =3D (mant) =
&gt;&gt; 32;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0u.d[0].ieee_nan.mantissa1 =3D (mant);=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((u.d[0].ieee.mantissa0 | u.d[0].i=
eee.mantissa1) !=3D 0)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 (flt) =3D u.ld;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
&gt;&gt; +-=C2=A0 } while (0)<br>
&gt;&gt; +<br>
&gt;&gt; + #include &lt;strtod_l.c&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +Index: git/sysdeps/ieee754/ldbl-64-128/strtold_l.c<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- git.orig/sysdeps/ieee754/ldbl-64-128/strtold_l.c<br>
&gt;&gt; ++++ git/sysdeps/ieee754/ldbl-64-128/strtold_l.c<br>
&gt;&gt; +@@ -30,28 +30,19 @@ extern long double ____new_wcstold_l (co<br>
&gt;&gt; + # define STRTOF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __new_w=
cstold_l<br>
&gt;&gt; + # define __STRTOF=C2=A0 ____new_wcstold_l<br>
&gt;&gt; + # define ____STRTOF_INTERNAL ____wcstold_l_internal<br>
&gt;&gt; ++# define STRTOF_NAN=C2=A0 =C2=A0 =C2=A0 =C2=A0 __wcstold_nan<br>
&gt;&gt; + #else<br>
&gt;&gt; + extern long double ____new_strtold_l (const char *, char **, __l=
ocale_t);<br>
&gt;&gt; + # define STRTOF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __new_s=
trtold_l<br>
&gt;&gt; + # define __STRTOF=C2=A0 ____new_strtold_l<br>
&gt;&gt; + # define ____STRTOF_INTERNAL ____strtold_l_internal<br>
&gt;&gt; ++# define STRTOF_NAN=C2=A0 =C2=A0 =C2=A0 =C2=A0 __strtold_nan<br>
&gt;&gt; + #endif<br>
&gt;&gt; + extern __typeof (__STRTOF) STRTOF;<br>
&gt;&gt; + libc_hidden_proto (__STRTOF)<br>
&gt;&gt; + libc_hidden_proto (STRTOF)<br>
&gt;&gt; + #define MPN2FLOAT=C2=A0 __mpn_construct_long_double<br>
&gt;&gt; + #define FLOAT_HUGE_VAL=C2=A0 =C2=A0 =C2=A0HUGE_VALL<br>
&gt;&gt; +-#define SET_MANTISSA(flt, mant) \<br>
&gt;&gt; +-=C2=A0 do { union ieee854_long_double u;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0u.d =3D (flt);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0u.ieee_nan.mantissa0 =3D 0;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0u.ieee_nan.mantissa1 =3D 0;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0u.ieee_nan.mantissa2 =3D (mant) &gt;&=
gt; 32;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0u.ieee_nan.mantissa3 =3D (mant);=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((u.ieee.mantissa0 | u.ieee.mantis=
sa1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0| u.ieee.mantissa2 | u.ieee.mantissa3=
) !=3D 0)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt;&gt; +-=C2=A0 =C2=A0 (flt) =3D u.d;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 } while (0)<br>
&gt;&gt; +<br>
&gt;&gt; + #include &lt;strtod_l.c&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +Index: git/sysdeps/ieee754/ldbl-96/strtod_nan_ldouble.h<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- /dev/null<br>
&gt;&gt; ++++ git/sysdeps/ieee754/ldbl-96/strtod_nan_ldouble.h<br>
&gt;&gt; +@@ -0,0 +1,30 @@<br>
&gt;&gt; ++/* Convert string for NaN payload to corresponding NaN.=C2=A0 Fo=
r ldbl-96.<br>
&gt;&gt; ++=C2=A0 =C2=A0Copyright (C) 1997-2015 Free Software Foundation, I=
nc.<br>
&gt;&gt; ++=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is free software; you can redistr=
ibute it and/or<br>
&gt;&gt; ++=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General=
 Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License as published by the Free Software Foundatio=
n; either<br>
&gt;&gt; ++=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any=
 later version.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is distributed in the hope that i=
t will be useful,<br>
&gt;&gt; ++=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied =
warranty of<br>
&gt;&gt; ++=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.=C2=A0 See the GNU<br>
&gt;&gt; ++=C2=A0 =C2=A0Lesser General Public License for more details.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0You should have received a copy of the GNU Lesser G=
eneral Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License along with the GNU C Library; if not, see<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0&lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D=
"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.=C2=A0 =
*/<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define FLOAT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lo=
ng double<br>
&gt;&gt; ++#define SET_MANTISSA(flt, mant)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 do=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 union ieee854_long_double u;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 u.d =3D (flt);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 u.ieee_nan.mantissa0 =3D (mant) &gt;&gt; 32=
;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 u.ieee_nan.mantissa1 =3D (mant);=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if ((u.ieee.mantissa0 | u.ieee.mantissa1) !=
=3D 0)=C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0(flt) =3D u.d;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 while (0)<br>
&gt;&gt; +Index: git/sysdeps/ieee754/ldbl-96/strtold_l.c<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- git.orig/sysdeps/ieee754/ldbl-96/strtold_l.c<br>
&gt;&gt; ++++ git/sysdeps/ieee754/ldbl-96/strtold_l.c<br>
&gt;&gt; +@@ -25,19 +25,13 @@<br>
&gt;&gt; + #ifdef USE_WIDE_CHAR<br>
&gt;&gt; + # define STRTOF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wcstold=
_l<br>
&gt;&gt; + # define __STRTOF=C2=A0 __wcstold_l<br>
&gt;&gt; ++# define STRTOF_NAN=C2=A0 =C2=A0 =C2=A0 =C2=A0 __wcstold_nan<br>
&gt;&gt; + #else<br>
&gt;&gt; + # define STRTOF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strtold=
_l<br>
&gt;&gt; + # define __STRTOF=C2=A0 __strtold_l<br>
&gt;&gt; ++# define STRTOF_NAN=C2=A0 =C2=A0 =C2=A0 =C2=A0 __strtold_nan<br>
&gt;&gt; + #endif<br>
&gt;&gt; + #define MPN2FLOAT=C2=A0 __mpn_construct_long_double<br>
&gt;&gt; + #define FLOAT_HUGE_VAL=C2=A0 =C2=A0 =C2=A0HUGE_VALL<br>
&gt;&gt; +-#define SET_MANTISSA(flt, mant) \<br>
&gt;&gt; +-=C2=A0 do { union ieee854_long_double u;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0u.d =3D (flt);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0u.ieee_nan.mantissa0 =3D (mant) &gt;&=
gt; 32;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0u.ieee_nan.mantissa1 =3D (mant);=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((u.ieee.mantissa0 | u.ieee.mantis=
sa1) !=3D 0)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 =C2=A0 (flt) =3D u.d;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +-=C2=A0 } while (0)<br>
&gt;&gt; +<br>
&gt;&gt; + #include &lt;stdlib/strtod_l.c&gt;<br>
&gt;&gt; +Index: git/wcsmbs/Makefile<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- git.orig/wcsmbs/Makefile<br>
&gt;&gt; ++++ git/wcsmbs/Makefile<br>
&gt;&gt; +@@ -39,6 +39,7 @@ routines-$(OPTION_POSIX_C_LANG_WIDE_CHAR<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wcstol wcstoul wcstoll wcstoull wcsto=
d wcstold wcstof \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wcstol_l wcstoul_l wcstoll_l wcstoull=
_l \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wcstod_l wcstold_l wcstof_l \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0wcstod_nan wcstold_nan wcstof_nan \<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wcscoll wcsxfrm \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wcwidth wcswidth \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wcscoll_l wcsxfrm_l \<br>
&gt;&gt; +Index: git/wcsmbs/wcstod_l.c<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- git.orig/wcsmbs/wcstod_l.c<br>
&gt;&gt; ++++ git/wcsmbs/wcstod_l.c<br>
&gt;&gt; +@@ -23,9 +23,6 @@<br>
&gt;&gt; +<br>
&gt;&gt; + extern double ____wcstod_l_internal (const wchar_t *, wchar_t **=
, int,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__locale_t);<br>
&gt;&gt; +-extern unsigned long long int ____wcstoull_l_internal (const wch=
ar_t *,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wchar_t **, int, int,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __locale_t);<br>
&gt;&gt; +<br>
&gt;&gt; + #define=C2=A0 =C2=A0 USE_WIDE_CHAR=C2=A0 =C2=A01<br>
&gt;&gt; +<br>
&gt;&gt; +Index: git/wcsmbs/wcstod_nan.c<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- /dev/null<br>
&gt;&gt; ++++ git/wcsmbs/wcstod_nan.c<br>
&gt;&gt; +@@ -0,0 +1,23 @@<br>
&gt;&gt; ++/* Convert string for NaN payload to corresponding NaN.=C2=A0 Wi=
de strings, double.<br>
&gt;&gt; ++=C2=A0 =C2=A0Copyright (C) 2015 Free Software Foundation, Inc.<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is free software; you can redistr=
ibute it and/or<br>
&gt;&gt; ++=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General=
 Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License as published by the Free Software Foundatio=
n; either<br>
&gt;&gt; ++=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any=
 later version.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is distributed in the hope that i=
t will be useful,<br>
&gt;&gt; ++=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied =
warranty of<br>
&gt;&gt; ++=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.=C2=A0 See the GNU<br>
&gt;&gt; ++=C2=A0 =C2=A0Lesser General Public License for more details.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0You should have received a copy of the GNU Lesser G=
eneral Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License along with the GNU C Library; if not, see<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0&lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D=
"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.=C2=A0 =
*/<br>
&gt;&gt; ++<br>
&gt;&gt; ++#include &quot;../stdlib/strtod_nan_wide.h&quot;<br>
&gt;&gt; ++#include &quot;../stdlib/strtod_nan_double.h&quot;<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define STRTOD_NAN __wcstod_nan<br>
&gt;&gt; ++#include &quot;../stdlib/strtod_nan_main.c&quot;<br>
&gt;&gt; +Index: git/wcsmbs/wcstof_l.c<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- git.orig/wcsmbs/wcstof_l.c<br>
&gt;&gt; ++++ git/wcsmbs/wcstof_l.c<br>
&gt;&gt; +@@ -25,8 +25,5 @@<br>
&gt;&gt; +<br>
&gt;&gt; + extern float ____wcstof_l_internal (const wchar_t *, wchar_t **,=
 int,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __locale_t);<br>
&gt;&gt; +-extern unsigned long long int ____wcstoull_l_internal (const wch=
ar_t *,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wchar_t **, int, int,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __locale_t);<br>
&gt;&gt; +<br>
&gt;&gt; + #include &lt;stdlib/strtof_l.c&gt;<br>
&gt;&gt; +Index: git/wcsmbs/wcstof_nan.c<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- /dev/null<br>
&gt;&gt; ++++ git/wcsmbs/wcstof_nan.c<br>
&gt;&gt; +@@ -0,0 +1,23 @@<br>
&gt;&gt; ++/* Convert string for NaN payload to corresponding NaN.=C2=A0 Wi=
de strings, float.<br>
&gt;&gt; ++=C2=A0 =C2=A0Copyright (C) 2015 Free Software Foundation, Inc.<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is free software; you can redistr=
ibute it and/or<br>
&gt;&gt; ++=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General=
 Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License as published by the Free Software Foundatio=
n; either<br>
&gt;&gt; ++=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any=
 later version.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is distributed in the hope that i=
t will be useful,<br>
&gt;&gt; ++=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied =
warranty of<br>
&gt;&gt; ++=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.=C2=A0 See the GNU<br>
&gt;&gt; ++=C2=A0 =C2=A0Lesser General Public License for more details.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0You should have received a copy of the GNU Lesser G=
eneral Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License along with the GNU C Library; if not, see<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0&lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D=
"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.=C2=A0 =
*/<br>
&gt;&gt; ++<br>
&gt;&gt; ++#include &quot;../stdlib/strtod_nan_wide.h&quot;<br>
&gt;&gt; ++#include &quot;../stdlib/strtod_nan_float.h&quot;<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define STRTOD_NAN __wcstof_nan<br>
&gt;&gt; ++#include &quot;../stdlib/strtod_nan_main.c&quot;<br>
&gt;&gt; +Index: git/wcsmbs/wcstold_l.c<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- git.orig/wcsmbs/wcstold_l.c<br>
&gt;&gt; ++++ git/wcsmbs/wcstold_l.c<br>
&gt;&gt; +@@ -24,8 +24,5 @@<br>
&gt;&gt; +<br>
&gt;&gt; + extern long double ____wcstold_l_internal (const wchar_t *, wcha=
r_t **, int,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0__locale_t);<br>
&gt;&gt; +-extern unsigned long long int ____wcstoull_l_internal (const wch=
ar_t *,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wchar_t **, int, int,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __locale_t);<br>
&gt;&gt; +<br>
&gt;&gt; + #include &lt;strtold_l.c&gt;<br>
&gt;&gt; +Index: git/wcsmbs/wcstold_nan.c<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- /dev/null<br>
&gt;&gt; ++++ git/wcsmbs/wcstold_nan.c<br>
&gt;&gt; +@@ -0,0 +1,30 @@<br>
&gt;&gt; ++/* Convert string for NaN payload to corresponding NaN.=C2=A0 Wi=
de strings,<br>
&gt;&gt; ++=C2=A0 =C2=A0long double.<br>
&gt;&gt; ++=C2=A0 =C2=A0Copyright (C) 2015 Free Software Foundation, Inc.<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is free software; you can redistr=
ibute it and/or<br>
&gt;&gt; ++=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General=
 Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License as published by the Free Software Foundatio=
n; either<br>
&gt;&gt; ++=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any=
 later version.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is distributed in the hope that i=
t will be useful,<br>
&gt;&gt; ++=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied =
warranty of<br>
&gt;&gt; ++=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.=C2=A0 See the GNU<br>
&gt;&gt; ++=C2=A0 =C2=A0Lesser General Public License for more details.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0You should have received a copy of the GNU Lesser G=
eneral Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License along with the GNU C Library; if not, see<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0&lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D=
"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.=C2=A0 =
*/<br>
&gt;&gt; ++<br>
&gt;&gt; ++#include &lt;math.h&gt;<br>
&gt;&gt; ++<br>
&gt;&gt; ++/* This function is unused if long double and double have the sa=
me<br>
&gt;&gt; ++=C2=A0 =C2=A0representation.=C2=A0 */<br>
&gt;&gt; ++#ifndef __NO_LONG_DOUBLE_MATH<br>
&gt;&gt; ++# include &quot;../stdlib/strtod_nan_wide.h&quot;<br>
&gt;&gt; ++# include &lt;strtod_nan_ldouble.h&gt;<br>
&gt;&gt; ++<br>
&gt;&gt; ++# define STRTOD_NAN __wcstold_nan<br>
&gt;&gt; ++# include &quot;../stdlib/strtod_nan_main.c&quot;<br>
&gt;&gt; ++#endif<br>
&gt;&gt; +Index: git/ChangeLog<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- git.orig/ChangeLog<br>
&gt;&gt; ++++ git/ChangeLog<br>
&gt;&gt; +@@ -1,3 +1,57 @@<br>
&gt;&gt; ++2015-11-24=C2=A0 Joseph Myers=C2=A0 &lt;<a href=3D"mailto:joseph=
@codesourcery.com">joseph@codesourcery.com</a>&gt;<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0* stdlib/strtod_nan.c: New file.<br>
&gt;&gt; ++=C2=A0 =C2=A0* stdlib/strtod_nan_double.h: Likewise.<br>
&gt;&gt; ++=C2=A0 =C2=A0* stdlib/strtod_nan_float.h: Likewise.<br>
&gt;&gt; ++=C2=A0 =C2=A0* stdlib/strtod_nan_main.c: Likewise.<br>
&gt;&gt; ++=C2=A0 =C2=A0* stdlib/strtod_nan_narrow.h: Likewise.<br>
&gt;&gt; ++=C2=A0 =C2=A0* stdlib/strtod_nan_wide.h: Likewise.<br>
&gt;&gt; ++=C2=A0 =C2=A0* stdlib/strtof_nan.c: Likewise.<br>
&gt;&gt; ++=C2=A0 =C2=A0* stdlib/strtold_nan.c: Likewise.<br>
&gt;&gt; ++=C2=A0 =C2=A0* sysdeps/ieee754/ldbl-128/strtod_nan_ldouble.h: Li=
kewise.<br>
&gt;&gt; ++=C2=A0 =C2=A0* sysdeps/ieee754/ldbl-128ibm/strtod_nan_ldouble.h:=
 Likewise.<br>
&gt;&gt; ++=C2=A0 =C2=A0* sysdeps/ieee754/ldbl-96/strtod_nan_ldouble.h: Lik=
ewise.<br>
&gt;&gt; ++=C2=A0 =C2=A0* wcsmbs/wcstod_nan.c: Likewise.<br>
&gt;&gt; ++=C2=A0 =C2=A0* wcsmbs/wcstof_nan.c: Likewise.<br>
&gt;&gt; ++=C2=A0 =C2=A0* wcsmbs/wcstold_nan.c: Likewise.<br>
&gt;&gt; ++=C2=A0 =C2=A0* stdlib/Makefile (routines): Add strtof_nan, strto=
d_nan and<br>
&gt;&gt; ++=C2=A0 =C2=A0strtold_nan.<br>
&gt;&gt; ++=C2=A0 =C2=A0* wcsmbs/Makefile (routines): Add wcstod_nan, wcsto=
ld_nan and<br>
&gt;&gt; ++=C2=A0 =C2=A0wcstof_nan.<br>
&gt;&gt; ++=C2=A0 =C2=A0* include/stdlib.h (__strtof_nan): Declare and use<=
br>
&gt;&gt; ++=C2=A0 =C2=A0libc_hidden_proto.<br>
&gt;&gt; ++=C2=A0 =C2=A0(__strtod_nan): Likewise.<br>
&gt;&gt; ++=C2=A0 =C2=A0(__strtold_nan): Likewise.<br>
&gt;&gt; ++=C2=A0 =C2=A0(__wcstof_nan): Likewise.<br>
&gt;&gt; ++=C2=A0 =C2=A0(__wcstod_nan): Likewise.<br>
&gt;&gt; ++=C2=A0 =C2=A0(__wcstold_nan): Likewise.<br>
&gt;&gt; ++=C2=A0 =C2=A0* include/wchar.h (____wcstoull_l_internal): Declar=
e.<br>
&gt;&gt; ++=C2=A0 =C2=A0* stdlib/strtod_l.c: Do not include &lt;ieee754.h&g=
t;.<br>
&gt;&gt; ++=C2=A0 =C2=A0(____strtoull_l_internal): Remove declaration.<br>
&gt;&gt; ++=C2=A0 =C2=A0(STRTOF_NAN): Define macro.<br>
&gt;&gt; ++=C2=A0 =C2=A0(SET_MANTISSA): Remove macro.<br>
&gt;&gt; ++=C2=A0 =C2=A0(STRTOULL): Likewise.<br>
&gt;&gt; ++=C2=A0 =C2=A0(____STRTOF_INTERNAL): Use STRTOF_NAN to parse NaN =
payload.<br>
&gt;&gt; ++=C2=A0 =C2=A0* stdlib/strtof_l.c (____strtoull_l_internal): Remo=
ve declaration.<br>
&gt;&gt; ++=C2=A0 =C2=A0(STRTOF_NAN): Define macro.<br>
&gt;&gt; ++=C2=A0 =C2=A0(SET_MANTISSA): Remove macro.<br>
&gt;&gt; ++=C2=A0 =C2=A0* sysdeps/ieee754/ldbl-128/strtold_l.c (STRTOF_NAN)=
: Define macro.<br>
&gt;&gt; ++=C2=A0 =C2=A0(SET_MANTISSA): Remove macro.<br>
&gt;&gt; ++=C2=A0 =C2=A0* sysdeps/ieee754/ldbl-128ibm/strtold_l.c (STRTOF_N=
AN): Define<br>
&gt;&gt; ++=C2=A0 =C2=A0macro.<br>
&gt;&gt; ++=C2=A0 =C2=A0(SET_MANTISSA): Remove macro.<br>
&gt;&gt; ++=C2=A0 =C2=A0* sysdeps/ieee754/ldbl-64-128/strtold_l.c (STRTOF_N=
AN): Define<br>
&gt;&gt; ++=C2=A0 =C2=A0macro.<br>
&gt;&gt; ++=C2=A0 =C2=A0(SET_MANTISSA): Remove macro.<br>
&gt;&gt; ++=C2=A0 =C2=A0* sysdeps/ieee754/ldbl-96/strtold_l.c (STRTOF_NAN):=
 Define macro.<br>
&gt;&gt; ++=C2=A0 =C2=A0(SET_MANTISSA): Remove macro.<br>
&gt;&gt; ++=C2=A0 =C2=A0* wcsmbs/wcstod_l.c (____wcstoull_l_internal): Remo=
ve declaration.<br>
&gt;&gt; ++=C2=A0 =C2=A0* wcsmbs/wcstof_l.c (____wcstoull_l_internal): Like=
wise.<br>
&gt;&gt; ++=C2=A0 =C2=A0* wcsmbs/wcstold_l.c (____wcstoull_l_internal): Lik=
ewise.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0[BZ #19266]<br>
&gt;&gt; ++=C2=A0 =C2=A0* stdlib/strtod_l.c (____STRTOF_INTERNAL): Check di=
rectly for<br>
&gt;&gt; ++=C2=A0 =C2=A0upper case and lower case letters inside NAN(), not=
 using TOLOWER.<br>
&gt;&gt; + 2015-08-08=C2=A0 Paul Pluzhnikov=C2=A0 &lt;<a href=3D"mailto:ppl=
uzhnikov@google.com">ppluzhnikov@google.com</a>&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 [BZ #17905]<br>
&gt;&gt; diff --git a/meta/recipes-core/glibc/glibc/CVE-2015-9761_2.patch b=
/meta/recipes-core/glibc/glibc/CVE-2015-9761_2.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000..0df5e50<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-core/glibc/glibc/CVE-2015-9761_2.patch<br>
&gt;&gt; @@ -0,0 +1,388 @@<br>
&gt;&gt; +From 8f5e8b01a1da2a207228f2072c934fa5918554b8 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Joseph Myers &lt;<a href=3D"mailto:joseph@codesourcery.com"=
>joseph@codesourcery.com</a>&gt;<br>
&gt;&gt; +Date: Fri, 4 Dec 2015 20:36:28 +0000<br>
&gt;&gt; +Subject: [PATCH] Fix nan functions handling of payload strings (b=
ug 16961, bug<br>
&gt;&gt; + 16962).<br>
&gt;&gt; +<br>
&gt;&gt; +The nan, nanf and nanl functions handle payload strings by doing =
e.g.:<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 if (tagp[0] !=3D &#39;\0&#39;)<br>
&gt;&gt; +=C2=A0 =C2=A0 {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 char buf[6 + strlen (tagp)];<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 sprintf (buf, &quot;NAN(%s)&quot;, tagp);<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 return strtod (buf, NULL);<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +This is an unbounded stack allocation based on the length of the<=
br>
&gt;&gt; +argument.=C2=A0 Furthermore, if the argument starts with an n-cha=
r-sequence<br>
&gt;&gt; +followed by &#39;)&#39;, that n-char-sequence is wrongly treated =
as<br>
&gt;&gt; +significant for determining the payload of the resulting NaN, whe=
n ISO<br>
&gt;&gt; +C says the call should be equivalent to strtod (&quot;NAN&quot;, =
NULL), without<br>
&gt;&gt; +being affected by that initial n-char-sequence.=C2=A0 This patch =
fixes both<br>
&gt;&gt; +those problems by using the __strtod_nan etc. functions recently<=
br>
&gt;&gt; +factored out of strtod etc. for that purpose, with those function=
s<br>
&gt;&gt; +being exported from libc at version GLIBC_PRIVATE.<br>
&gt;&gt; +<br>
&gt;&gt; +Tested for x86_64, x86, mips64 and powerpc.<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 [BZ #16961]<br>
&gt;&gt; +=C2=A0 =C2=A0 [BZ #16962]<br>
&gt;&gt; +=C2=A0 =C2=A0 * math/s_nan.c (__nan): Use __strtod_nan instead of=
 constructing a<br>
&gt;&gt; +=C2=A0 =C2=A0 string on the stack for strtod.<br>
&gt;&gt; +=C2=A0 =C2=A0 * math/s_nanf.c (__nanf): Use __strtof_nan instead =
of constructing<br>
&gt;&gt; +=C2=A0 =C2=A0 a string on the stack for strtof.<br>
&gt;&gt; +=C2=A0 =C2=A0 * math/s_nanl.c (__nanl): Use __strtold_nan instead=
 of<br>
&gt;&gt; +=C2=A0 =C2=A0 constructing a string on the stack for strtold.<br>
&gt;&gt; +=C2=A0 =C2=A0 * stdlib/Versions (libc): Add __strtof_nan, __strto=
d_nan and<br>
&gt;&gt; +=C2=A0 =C2=A0 __strtold_nan to GLIBC_PRIVATE.<br>
&gt;&gt; +=C2=A0 =C2=A0 * math/test-nan-overflow.c: New file.<br>
&gt;&gt; +=C2=A0 =C2=A0 * math/test-nan-payload.c: Likewise.<br>
&gt;&gt; +=C2=A0 =C2=A0 * math/Makefile (tests): Add test-nan-overflow and<=
br>
&gt;&gt; +=C2=A0 =C2=A0 test-nan-payload.<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Backport<br>
&gt;&gt; +CVE: CVE-2015-9761 patch #2<br>
&gt;&gt; +[Yocto # 8980]<br>
&gt;&gt; +<br>
&gt;&gt; +<a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dglibc.git;h=
=3D8f5e8b01a1da2a207228f2072c934fa5918554b8" rel=3D"noreferrer" target=3D"_=
blank">https://sourceware.org/git/gitweb.cgi?p=3Dglibc.git;h=3D8f5e8b01a1da=
2a207228f2072c934fa5918554b8</a><br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.=
com">akuster@mvista.com</a>&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +---<br>
&gt;&gt; + ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 17 +++++++<br>
&gt;&gt; + NEWS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +++<br>
&gt;&gt; + math/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A03 +-<br>
&gt;&gt; + math/s_nan.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A09 +---<br>
&gt;&gt; + math/s_nanf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A09 +---<br>
&gt;&gt; + math/s_nanl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A09 +---<br>
&gt;&gt; + math/test-nan-overflow.c |=C2=A0 66 +++++++++++++++++++++++++<br=
>
&gt;&gt; + math/test-nan-payload.c=C2=A0 | 122 ++++++++++++++++++++++++++++=
+++++++++++++++++++<br>
&gt;&gt; + stdlib/Versions=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
1 +<br>
&gt;&gt; + 9 files changed, 217 insertions(+), 25 deletions(-)<br>
&gt;&gt; + create mode 100644 math/test-nan-overflow.c<br>
&gt;&gt; + create mode 100644 math/test-nan-payload.c<br>
&gt;&gt; +<br>
&gt;&gt; +Index: git/ChangeLog<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- git.orig/ChangeLog<br>
&gt;&gt; ++++ git/ChangeLog<br>
&gt;&gt; +@@ -1,3 +1,20 @@<br>
&gt;&gt; ++2015-12-04=C2=A0 Joseph Myers=C2=A0 &lt;<a href=3D"mailto:joseph=
@codesourcery.com">joseph@codesourcery.com</a>&gt;<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0[BZ #16961]<br>
&gt;&gt; ++=C2=A0 =C2=A0[BZ #16962]<br>
&gt;&gt; ++=C2=A0 =C2=A0* math/s_nan.c (__nan): Use __strtod_nan instead of=
 constructing a<br>
&gt;&gt; ++=C2=A0 =C2=A0string on the stack for strtod.<br>
&gt;&gt; ++=C2=A0 =C2=A0* math/s_nanf.c (__nanf): Use __strtof_nan instead =
of constructing<br>
&gt;&gt; ++=C2=A0 =C2=A0a string on the stack for strtof.<br>
&gt;&gt; ++=C2=A0 =C2=A0* math/s_nanl.c (__nanl): Use __strtold_nan instead=
 of<br>
&gt;&gt; ++=C2=A0 =C2=A0constructing a string on the stack for strtold.<br>
&gt;&gt; ++=C2=A0 =C2=A0* stdlib/Versions (libc): Add __strtof_nan, __strto=
d_nan and<br>
&gt;&gt; ++=C2=A0 =C2=A0__strtold_nan to GLIBC_PRIVATE.<br>
&gt;&gt; ++=C2=A0 =C2=A0* math/test-nan-overflow.c: New file.<br>
&gt;&gt; ++=C2=A0 =C2=A0* math/test-nan-payload.c: Likewise.<br>
&gt;&gt; ++=C2=A0 =C2=A0* math/Makefile (tests): Add test-nan-overflow and<=
br>
&gt;&gt; ++=C2=A0 =C2=A0test-nan-payload.<br>
&gt;&gt; ++<br>
&gt;&gt; + 2015-11-24=C2=A0 Joseph Myers=C2=A0 &lt;<a href=3D"mailto:joseph=
@codesourcery.com">joseph@codesourcery.com</a>&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 * stdlib/strtod_nan.c: New file.<br>
&gt;&gt; +Index: git/NEWS<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- git.orig/NEWS<br>
&gt;&gt; ++++ git/NEWS<br>
&gt;&gt; +@@ -7,6 +7,12 @@ using `glibc&#39; in the &quot;product&quot; fie=
ld.<br>
&gt;&gt; +<br>
&gt;&gt; + Version 2.21<br>
&gt;&gt; +<br>
&gt;&gt; ++Security related changes:<br>
&gt;&gt; ++<br>
&gt;&gt; ++* The nan, nanf and nanl functions no longer have unbounded stac=
k usage<br>
&gt;&gt; ++=C2=A0 depending on the length of the string passed as an argume=
nt to the<br>
&gt;&gt; ++=C2=A0 functions.=C2=A0 Reported by Joseph Myers.<br>
&gt;&gt; ++<br>
&gt;&gt; + * The following bugs are resolved with this release:<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A06652, 10672, 12674, 12847, 12926, 13862, 14132, 1413=
8, 14171, 14498,<br>
&gt;&gt; +Index: git/math/s_nan.c<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- git.orig/math/s_nan.c<br>
&gt;&gt; ++++ git/math/s_nan.c<br>
&gt;&gt; +@@ -28,14 +28,7 @@<br>
&gt;&gt; + double<br>
&gt;&gt; + __nan (const char *tagp)<br>
&gt;&gt; + {<br>
&gt;&gt; +-=C2=A0 if (tagp[0] !=3D &#39;\0&#39;)<br>
&gt;&gt; +-=C2=A0 =C2=A0 {<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 char buf[6 + strlen (tagp)];<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 sprintf (buf, &quot;NAN(%s)&quot;, tagp);<b=
r>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 return strtod (buf, NULL);<br>
&gt;&gt; +-=C2=A0 =C2=A0 }<br>
&gt;&gt; +-<br>
&gt;&gt; +-=C2=A0 return NAN;<br>
&gt;&gt; ++=C2=A0 return __strtod_nan (tagp, NULL, 0);<br>
&gt;&gt; + }<br>
&gt;&gt; + weak_alias (__nan, nan)<br>
&gt;&gt; + #ifdef NO_LONG_DOUBLE<br>
&gt;&gt; +Index: git/math/s_nanf.c<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- git.orig/math/s_nanf.c<br>
&gt;&gt; ++++ git/math/s_nanf.c<br>
&gt;&gt; +@@ -28,13 +28,6 @@<br>
&gt;&gt; + float<br>
&gt;&gt; + __nanf (const char *tagp)<br>
&gt;&gt; + {<br>
&gt;&gt; +-=C2=A0 if (tagp[0] !=3D &#39;\0&#39;)<br>
&gt;&gt; +-=C2=A0 =C2=A0 {<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 char buf[6 + strlen (tagp)];<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 sprintf (buf, &quot;NAN(%s)&quot;, tagp);<b=
r>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 return strtof (buf, NULL);<br>
&gt;&gt; +-=C2=A0 =C2=A0 }<br>
&gt;&gt; +-<br>
&gt;&gt; +-=C2=A0 return NAN;<br>
&gt;&gt; ++=C2=A0 return __strtof_nan (tagp, NULL, 0);<br>
&gt;&gt; + }<br>
&gt;&gt; + weak_alias (__nanf, nanf)<br>
&gt;&gt; +Index: git/math/s_nanl.c<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- git.orig/math/s_nanl.c<br>
&gt;&gt; ++++ git/math/s_nanl.c<br>
&gt;&gt; +@@ -28,13 +28,6 @@<br>
&gt;&gt; + long double<br>
&gt;&gt; + __nanl (const char *tagp)<br>
&gt;&gt; + {<br>
&gt;&gt; +-=C2=A0 if (tagp[0] !=3D &#39;\0&#39;)<br>
&gt;&gt; +-=C2=A0 =C2=A0 {<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 char buf[6 + strlen (tagp)];<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 sprintf (buf, &quot;NAN(%s)&quot;, tagp);<b=
r>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 return strtold (buf, NULL);<br>
&gt;&gt; +-=C2=A0 =C2=A0 }<br>
&gt;&gt; +-<br>
&gt;&gt; +-=C2=A0 return NAN;<br>
&gt;&gt; ++=C2=A0 return __strtold_nan (tagp, NULL, 0);<br>
&gt;&gt; + }<br>
&gt;&gt; + weak_alias (__nanl, nanl)<br>
&gt;&gt; +Index: git/math/test-nan-overflow.c<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- /dev/null<br>
&gt;&gt; ++++ git/math/test-nan-overflow.c<br>
&gt;&gt; +@@ -0,0 +1,66 @@<br>
&gt;&gt; ++/* Test nan functions stack overflow (bug 16962).<br>
&gt;&gt; ++=C2=A0 =C2=A0Copyright (C) 2015 Free Software Foundation, Inc.<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is free software; you can redistr=
ibute it and/or<br>
&gt;&gt; ++=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General=
 Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License as published by the Free Software Foundatio=
n; either<br>
&gt;&gt; ++=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any=
 later version.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is distributed in the hope that i=
t will be useful,<br>
&gt;&gt; ++=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied =
warranty of<br>
&gt;&gt; ++=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.=C2=A0 See the GNU<br>
&gt;&gt; ++=C2=A0 =C2=A0Lesser General Public License for more details.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0You should have received a copy of the GNU Lesser G=
eneral Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License along with the GNU C Library; if not, see<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0&lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D=
"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.=C2=A0 =
*/<br>
&gt;&gt; ++<br>
&gt;&gt; ++#include &lt;math.h&gt;<br>
&gt;&gt; ++#include &lt;stdio.h&gt;<br>
&gt;&gt; ++#include &lt;string.h&gt;<br>
&gt;&gt; ++#include &lt;sys/resource.h&gt;<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define STACK_LIM 1048576<br>
&gt;&gt; ++#define STRING_SIZE (2 * STACK_LIM)<br>
&gt;&gt; ++<br>
&gt;&gt; ++static int<br>
&gt;&gt; ++do_test (void)<br>
&gt;&gt; ++{<br>
&gt;&gt; ++=C2=A0 int result =3D 0;<br>
&gt;&gt; ++=C2=A0 struct rlimit lim;<br>
&gt;&gt; ++=C2=A0 getrlimit (RLIMIT_STACK, &amp;lim);<br>
&gt;&gt; ++=C2=A0 lim.rlim_cur =3D STACK_LIM;<br>
&gt;&gt; ++=C2=A0 setrlimit (RLIMIT_STACK, &amp;lim);<br>
&gt;&gt; ++=C2=A0 char *nanstr =3D malloc (STRING_SIZE);<br>
&gt;&gt; ++=C2=A0 if (nanstr =3D=3D NULL)<br>
&gt;&gt; ++=C2=A0 =C2=A0 {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 puts (&quot;malloc failed, cannot test&quot=
;);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return 77;<br>
&gt;&gt; ++=C2=A0 =C2=A0 }<br>
&gt;&gt; ++=C2=A0 memset (nanstr, &#39;0&#39;, STRING_SIZE - 1);<br>
&gt;&gt; ++=C2=A0 nanstr[STRING_SIZE - 1] =3D 0;<br>
&gt;&gt; ++#define NAN_TEST(TYPE, FUNC)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 do=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 char *volatile p =3D nanstr;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 volatile TYPE v =3D FUNC (p);=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if (isnan (v))=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0puts (&quot;PASS: &quot; #FUNC);=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 else=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0puts (&quot;FAIL: &quot; #FUNC);=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0result =3D 1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 while (0)<br>
&gt;&gt; ++=C2=A0 NAN_TEST (float, nanf);<br>
&gt;&gt; ++=C2=A0 NAN_TEST (double, nan);<br>
&gt;&gt; ++#ifndef NO_LONG_DOUBLE<br>
&gt;&gt; ++=C2=A0 NAN_TEST (long double, nanl);<br>
&gt;&gt; ++#endif<br>
&gt;&gt; ++=C2=A0 return result;<br>
&gt;&gt; ++}<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define TEST_FUNCTION do_test ()<br>
&gt;&gt; ++#include &quot;../test-skeleton.c&quot;<br>
&gt;&gt; +Index: git/math/test-nan-payload.c<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- /dev/null<br>
&gt;&gt; ++++ git/math/test-nan-payload.c<br>
&gt;&gt; +@@ -0,0 +1,122 @@<br>
&gt;&gt; ++/* Test nan functions payload handling (bug 16961).<br>
&gt;&gt; ++=C2=A0 =C2=A0Copyright (C) 2015 Free Software Foundation, Inc.<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is free software; you can redistr=
ibute it and/or<br>
&gt;&gt; ++=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General=
 Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License as published by the Free Software Foundatio=
n; either<br>
&gt;&gt; ++=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any=
 later version.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0The GNU C Library is distributed in the hope that i=
t will be useful,<br>
&gt;&gt; ++=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied =
warranty of<br>
&gt;&gt; ++=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.=C2=A0 See the GNU<br>
&gt;&gt; ++=C2=A0 =C2=A0Lesser General Public License for more details.<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0You should have received a copy of the GNU Lesser G=
eneral Public<br>
&gt;&gt; ++=C2=A0 =C2=A0License along with the GNU C Library; if not, see<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0&lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D=
"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.=C2=A0 =
*/<br>
&gt;&gt; ++<br>
&gt;&gt; ++#include &lt;float.h&gt;<br>
&gt;&gt; ++#include &lt;math.h&gt;<br>
&gt;&gt; ++#include &lt;stdio.h&gt;<br>
&gt;&gt; ++#include &lt;stdlib.h&gt;<br>
&gt;&gt; ++#include &lt;string.h&gt;<br>
&gt;&gt; ++<br>
&gt;&gt; ++/* Avoid built-in functions.=C2=A0 */<br>
&gt;&gt; ++#define WRAP_NAN(FUNC, STR) \<br>
&gt;&gt; ++=C2=A0 ({ const char *volatile wns =3D (STR); FUNC (wns); })<br>
&gt;&gt; ++#define WRAP_STRTO(FUNC, STR) \<br>
&gt;&gt; ++=C2=A0 ({ const char *volatile wss =3D (STR); FUNC (wss, NULL); =
})<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define CHECK_IS_NAN(TYPE, A)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 do=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if (isnan (A))=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0puts (&quot;PASS: &quot; #TYPE &quot; &quot; #A);=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 else=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0puts (&quot;FAIL: &quot; #TYPE &quot; &quot;=
 #A);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0result =3D 1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 while (0)<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define CHECK_SAME_NAN(TYPE, A, B)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 do=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if (memcmp (&amp;(A), &amp;(B), sizeof (A))=
 =3D=3D 0)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0puts (&quot;PASS: &quot; #TYPE &quot; &quot; #A &qu=
ot; =3D &quot; #B);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 else=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0puts (&quot;FAIL: &quot; #TYPE &quot; &quot;=
 #A &quot; =3D &quot; #B);=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0result =3D 1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 while (0)<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define CHECK_DIFF_NAN(TYPE, A, B)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 do=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if (memcmp (&amp;(A), &amp;(B), sizeof (A))=
 !=3D 0)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0puts (&quot;PASS: &quot; #TYPE &quot; &quot; #A &qu=
ot; !=3D &quot; #B);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 else=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0puts (&quot;FAIL: &quot; #TYPE &quot; &quot;=
 #A &quot; !=3D &quot; #B);=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0result =3D 1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 while (0)<br>
&gt;&gt; ++<br>
&gt;&gt; ++/* Cannot test payloads by memcmp for formats where NaNs have pa=
dding<br>
&gt;&gt; ++=C2=A0 =C2=A0bits.=C2=A0 */<br>
&gt;&gt; ++#define CAN_TEST_EQ(MANT_DIG) ((MANT_DIG) !=3D 64 &amp;&amp; (MA=
NT_DIG) !=3D 106)<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define RUN_TESTS(TYPE, SFUNC, FUNC, MANT_DIG)=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 do=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0TYPE n123 =3D WRAP_NAN (FUNC, &quot;123&quot=
;);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0CHECK_IS_NAN (TYPE, n123);=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0TYPE s123 =3D WRAP_STRTO (SFUNC, &quot;NAN(1=
23)&quot;);=C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0CHECK_IS_NAN (TYPE, s123);=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0TYPE n456 =3D WRAP_NAN (FUNC, &quot;456&quot=
;);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0CHECK_IS_NAN (TYPE, n456);=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0TYPE s456 =3D WRAP_STRTO (SFUNC, &quot;NAN(4=
56)&quot;);=C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0CHECK_IS_NAN (TYPE, s456);=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0TYPE n123x =3D WRAP_NAN (FUNC, &quot;123)&qu=
ot;);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0CHECK_IS_NAN (TYPE, n123x);=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0TYPE nemp =3D WRAP_NAN (FUNC, &quot;&quot;);=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0CHECK_IS_NAN (TYPE, nemp);=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0TYPE semp =3D WRAP_STRTO (SFUNC, &quot;NAN()=
&quot;);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0CHECK_IS_NAN (TYPE, semp);=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0TYPE sx =3D WRAP_STRTO (SFUNC, &quot;NAN&quo=
t;);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0CHECK_IS_NAN (TYPE, sx);=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0if (CAN_TEST_EQ (MANT_DIG))=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0CHECK_SAME_NAN (TYPE, n123, s123);=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0if (CAN_TEST_EQ (MANT_DIG))=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0CHECK_SAME_NAN (TYPE, n456, s456);=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0if (CAN_TEST_EQ (MANT_DIG))=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0CHECK_SAME_NAN (TYPE, nemp, semp);=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0if (CAN_TEST_EQ (MANT_DIG))=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0CHECK_SAME_NAN (TYPE, n123x, sx);=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0CHECK_DIFF_NAN (TYPE, n123, n456);=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0CHECK_DIFF_NAN (TYPE, n123, nemp);=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0CHECK_DIFF_NAN (TYPE, n123, n123x);=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0CHECK_DIFF_NAN (TYPE, n456, nemp);=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0CHECK_DIFF_NAN (TYPE, n456, n123x);=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; ++=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; ++=C2=A0 while (0)<br>
&gt;&gt; ++<br>
&gt;&gt; ++static int<br>
&gt;&gt; ++do_test (void)<br>
&gt;&gt; ++{<br>
&gt;&gt; ++=C2=A0 int result =3D 0;<br>
&gt;&gt; ++=C2=A0 RUN_TESTS (float, strtof, nanf, FLT_MANT_DIG);<br>
&gt;&gt; ++=C2=A0 RUN_TESTS (double, strtod, nan, DBL_MANT_DIG);<br>
&gt;&gt; ++#ifndef NO_LONG_DOUBLE<br>
&gt;&gt; ++=C2=A0 RUN_TESTS (long double, strtold, nanl, LDBL_MANT_DIG);<br=
>
&gt;&gt; ++#endif<br>
&gt;&gt; ++=C2=A0 return result;<br>
&gt;&gt; ++}<br>
&gt;&gt; ++<br>
&gt;&gt; ++#define TEST_FUNCTION do_test ()<br>
&gt;&gt; ++#include &quot;../test-skeleton.c&quot;<br>
&gt;&gt; +Index: git/stdlib/Versions<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- git.orig/stdlib/Versions<br>
&gt;&gt; ++++ git/stdlib/Versions<br>
&gt;&gt; +@@ -118,5 +118,6 @@ libc {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0# Used from other libraries<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0__libc_secure_getenv;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0__call_tls_dtors;<br>
&gt;&gt; ++=C2=A0 =C2=A0 __strtof_nan; __strtod_nan; __strtold_nan;<br>
&gt;&gt; +=C2=A0 =C2=A0}<br>
&gt;&gt; + }<br>
&gt;&gt; +Index: git/math/Makefile<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- git.orig/math/Makefile<br>
&gt;&gt; ++++ git/math/Makefile<br>
&gt;&gt; +@@ -92,7 +92,9 @@ tests =3D test-matherr test-fenv atest-exp<br>
&gt;&gt; +=C2=A0 =C2=A0 test-misc test-fpucw test-fpucw-ieee tst-definition=
s test-tgmath \<br>
&gt;&gt; +=C2=A0 =C2=A0 test-tgmath-ret bug-nextafter bug-nexttoward bug-tg=
math1 \<br>
&gt;&gt; +=C2=A0 =C2=A0 test-tgmath-int test-tgmath2 test-powl tst-CMPLX ts=
t-CMPLX2 test-snan \<br>
&gt;&gt; +-=C2=A0 =C2=A0test-fenv-tls test-fenv-preserve test-fenv-return $=
(tests-static)<br>
&gt;&gt; ++=C2=A0 =C2=A0test-fenv-tls test-fenv-preserve test-fenv-return \=
<br>
&gt;&gt; ++=C2=A0 =C2=A0 test-nan-overflow test-nan-payload \<br>
&gt;&gt; ++=C2=A0 =C2=A0 $(tests-static)<br>
&gt;&gt; + tests-static =3D test-fpucw-static test-fpucw-ieee-static<br>
&gt;&gt; + # We do the `long double&#39; tests only if this data type is av=
ailable and<br>
&gt;&gt; + # distinct from `double&#39;.<br>
&gt;&gt; diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.20.=
bb" rel=3D"noreferrer" target=3D"_blank">glibc_2.20.bb</a> b/meta/recipes-c=
ore/glibc/<a href=3D"http://glibc_2.20.bb" rel=3D"noreferrer" target=3D"_bl=
ank">glibc_2.20.bb</a><br>
&gt;&gt; index af568d9..d099d5d 100644<br>
&gt;&gt; --- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.20.bb" rel=
=3D"noreferrer" target=3D"_blank">glibc_2.20.bb</a><br>
&gt;&gt; +++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.20.bb" rel=
=3D"noreferrer" target=3D"_blank">glibc_2.20.bb</a><br>
&gt;&gt; @@ -50,6 +50,8 @@ CVEPATCHES =3D &quot;\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2015-7547.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2015-8777.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2015-8779.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2015-9761_1.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2015-9761_2.patch \<br>
&gt;&gt;=C2=A0 &quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSES;md5=3De9a558e243b=
36d3209f380deb394b213 \<br>
&gt;&gt; --<br>
&gt;&gt; 2.3.5<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openem=
bedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core</a><br>
&gt;<br>
</div></div></blockquote></div><br></div>

--001a1144250e479fe3052d2b1a0d--
