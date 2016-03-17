Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 018026FEF5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 15:44:17 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id l68so231267547wml.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 08:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=rbZ3Hp+b8jHPQf7ZzIy91SuFA2QUIfgbfE3699oUReE=;
	b=YyNOc4Q9EprgxbFUFmkBWgnZE/AVtJW7y3P7dzaEcMxdAiV0Ng+J1FbNU94QJKNx40
	SdwgUbnAb3sWwIQaFzDCDAHD997xv/qw+EoUbe09UlxBnI0M78i147pNJve65DVyBGBO
	jfNg90OYNpujwb2M5lvvYUbRv2IPLvBO4VRXATPv0t5GsKha7B57zPoy/5mU2awLeDdZ
	Tjv2emFeZRz+Vdv+kj1eMVTZLEBSx19EUc9ESk1ZmppyiyfkroL2yjWd39q7hVPgsfXb
	kxdXjQbSAPmICvD26d2t6rRZmh/q8Rm9SF07Hk8yZ6fdp201y8BLMAu6yqkhZBMXSNj1
	1fgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=rbZ3Hp+b8jHPQf7ZzIy91SuFA2QUIfgbfE3699oUReE=;
	b=LH7Ysi0bEGsmrtUrbbhnQ+o7auoAz+y7aJvR3t9g/JYdui+9y4onAsIMMnIWP2jcto
	j0hcUgD36aZYEj3UX+Um2PzcmEx41Ps36ZI2Mwg2ox+x5hSdJcCxyRUvCt3wSWubznWT
	p8C13fzqNSfiAN3mNi0iPviRCYcr6cKIL5jUtlVn0cAXyvLLPxYrGLQPK/ti2pQGoVfq
	o+C4w2Wu7F3ROGG+IWLE/jfrG/MwIEGiTjOxvZE2aYYoyXBQQche9H39QXqP2+GNCtvw
	zjRd7NvgssrO9WXT6yO1egA9s6hDcdUNUbr/wkZJySXMhrd+3mTRx2Kk8LQZZ+qvvM7e
	qYGQ==
X-Gm-Message-State: AD7BkJKnUZw9tJyhPvAQ4MKhK5BNRgpIR9k+IyEx4PbNXUQH0sqn0GsmIWTss/RJOQvLzg==
X-Received: by 10.28.126.131 with SMTP id z125mr12115921wmc.77.1458229457670; 
	Thu, 17 Mar 2016 08:44:17 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ys9sm8195429wjc.35.2016.03.17.08.44.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Mar 2016 08:44:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Mar 2016 16:48:00 +0100
To: "akuster@mvista" <akuster@mvista.com>
Message-ID: <20160317154800.GE2553@jama>
References: <1456685615-901-1-git-send-email-akuster808@gmail.com>
	<1456685615-901-3-git-send-email-akuster808@gmail.com>
	<20160303081642.GA2569@jama> <56D89FF7.2050201@mvista.com>
	<CA+chaQf2WdTt2fsToY9sdnapD+RaPp4OZV_3ybH0J401DXhusA@mail.gmail.com>
	<20160311135857.GB2555@jama>
MIME-Version: 1.0
In-Reply-To: <20160311135857.GB2555@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Thu, 17 Mar 2016 15:44:18 -0000
X-Groupsio-MsgNum: 79738
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u5E4XgoOPWr4PD9E"
Content-Disposition: inline

--u5E4XgoOPWr4PD9E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 11, 2016 at 02:58:57PM +0100, Martin Jansa wrote:
> On Thu, Mar 03, 2016 at 09:47:11PM +0100, Martin Jansa wrote:
> > I was asking you about the CVE number (but I realize it was already mer=
ged
> > in other branches with wrong number so maybe it will be less confusing =
use
> > the same in Dizzy)
> >=20
> > And "please merge" was informal
> > Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
> >=20
> > after testing this series in our Dizzy based builds.
>=20
> Any ETA on getting these in dizzy branch?
>=20
> I know that everybody is busy with Mx release, I just need the ETA to
> decide if
> 1) we'll upgrade oe-core now with only the first security fix
>    and upgrade again later when these are merged
> 2) we'll upgrade oe-core now with only the first security fix
>    and backport other 4 fixes in our internal layer - and remove these
>    backports in next oe-core upgrade when these are merged
> 3) we'll wait a bit more to get all 5 fixes in one oe-core upgrade
>=20
> I've already tested all 5 in our builds, only issue I've noticed
> is incorrect CVE number used in patches as reported.

ping

> =20
> > On Thu, Mar 3, 2016 at 9:35 PM, akuster@mvista <akuster@mvista.com> wro=
te:
> >=20
> > > On 3/3/16 12:16 AM, Martin Jansa wrote:
> > > > On Sun, Feb 28, 2016 at 10:53:34AM -0800, Armin Kuster wrote:
> > > >> From: Armin Kuster <akuster@mvista.com>
> > > >
> > > > I think this is 2014-9761 not 2015-9761
> > > >
> > > > But other than that please merge this series.
> > >
> > > Are you asking me? I don't have write perms.
> > >
> > > - armin
> > > >
> > > >> A stack overflow vulnerability was found in nan* functions that co=
uld
> > > cause
> > > >> applications which process long strings with the nan function to c=
rash
> > > or,
> > > >> potentially, execute arbitrary code.
> > > >>
> > > >> (From OE-Core rev: fd3da8178c8c06b549dbc19ecec40e98ab934d49)
> > > >>
> > > >> Signed-off-by: Armin Kuster <akuster@mvista.com>
> > > >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > > >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > >> Signed-off-by: Armin Kuster <akuster@mvista.com>
> > > >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > > >> ---
> > > >>  .../recipes-core/glibc/glibc/CVE-2015-9761_1.patch | 1039
> > > ++++++++++++++++++++
> > > >>  .../recipes-core/glibc/glibc/CVE-2015-9761_2.patch |  388 ++++++++
> > > >>  meta/recipes-core/glibc/glibc_2.20.bb              |    2 +
> > > >>  3 files changed, 1429 insertions(+)
> > > >>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-9761_1.=
patch
> > > >>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-9761_2.=
patch
> > > >>
> > > >> diff --git a/meta/recipes-core/glibc/glibc/CVE-2015-9761_1.patch
> > > b/meta/recipes-core/glibc/glibc/CVE-2015-9761_1.patch
> > > >> new file mode 100644
> > > >> index 0000000..3aca913
> > > >> --- /dev/null
> > > >> +++ b/meta/recipes-core/glibc/glibc/CVE-2015-9761_1.patch
> > > >> @@ -0,0 +1,1039 @@
> > > >> +From e02cabecf0d025ec4f4ddee290bdf7aadb873bb3 Mon Sep 17 00:00:00=
 2001
> > > >> +From: Joseph Myers <joseph@codesourcery.com>
> > > >> +Date: Tue, 24 Nov 2015 22:24:52 +0000
> > > >> +Subject: [PATCH] Refactor strtod parsing of NaN payloads.
> > > >> +
> > > >> +The nan* functions handle their string argument by constructing a
> > > >> +NAN(...) string on the stack as a VLA and passing it to strtod
> > > >> +functions.
> > > >> +
> > > >> +This approach has problems discussed in bug 16961 and bug 16962: =
the
> > > >> +stack usage is unbounded, and it gives incorrect results in certa=
in
> > > >> +cases where the argument is not a valid n-char-sequence.
> > > >> +
> > > >> +The natural fix for both issues is to refactor the NaN payload pa=
rsing
> > > >> +out of strtod into a separate function that the nan* functions can
> > > >> +call directly, so that no temporary string needs constructing on =
the
> > > >> +stack at all.  This patch does that refactoring in preparation for
> > > >> +fixing those bugs (but without actually using the new functions f=
rom
> > > >> +nan* - which will also require exporting them from libc at version
> > > >> +GLIBC_PRIVATE).  This patch is not intended to change any user-vi=
sible
> > > >> +behavior, so no tests are added (fixes for the above bugs will of
> > > >> +course add tests for them).
> > > >> +
> > > >> +This patch builds on my recent fixes for strtol and strtod issues=
 in
> > > >> +Turkish locales.  Given those fixes, the parsing of NaN payloads =
is
> > > >> +locale-independent; thus, the new functions do not need to take a
> > > >> +locale_t argument.
> > > >> +
> > > >> +Tested for x86_64, x86, mips64 and powerpc.
> > > >> +
> > > >> +    * stdlib/strtod_nan.c: New file.
> > > >> +    * stdlib/strtod_nan_double.h: Likewise.
> > > >> +    * stdlib/strtod_nan_float.h: Likewise.
> > > >> +    * stdlib/strtod_nan_main.c: Likewise.
> > > >> +    * stdlib/strtod_nan_narrow.h: Likewise.
> > > >> +    * stdlib/strtod_nan_wide.h: Likewise.
> > > >> +    * stdlib/strtof_nan.c: Likewise.
> > > >> +    * stdlib/strtold_nan.c: Likewise.
> > > >> +    * sysdeps/ieee754/ldbl-128/strtod_nan_ldouble.h: Likewise.
> > > >> +    * sysdeps/ieee754/ldbl-128ibm/strtod_nan_ldouble.h: Likewise.
> > > >> +    * sysdeps/ieee754/ldbl-96/strtod_nan_ldouble.h: Likewise.
> > > >> +    * wcsmbs/wcstod_nan.c: Likewise.
> > > >> +    * wcsmbs/wcstof_nan.c: Likewise.
> > > >> +    * wcsmbs/wcstold_nan.c: Likewise.
> > > >> +    * stdlib/Makefile (routines): Add strtof_nan, strtod_nan and
> > > >> +    strtold_nan.
> > > >> +    * wcsmbs/Makefile (routines): Add wcstod_nan, wcstold_nan and
> > > >> +    wcstof_nan.
> > > >> +    * include/stdlib.h (__strtof_nan): Declare and use
> > > >> +    libc_hidden_proto.
> > > >> +    (__strtod_nan): Likewise.
> > > >> +    (__strtold_nan): Likewise.
> > > >> +    (__wcstof_nan): Likewise.
> > > >> +    (__wcstod_nan): Likewise.
> > > >> +    (__wcstold_nan): Likewise.
> > > >> +    * include/wchar.h (____wcstoull_l_internal): Declare.
> > > >> +    * stdlib/strtod_l.c: Do not include <ieee754.h>.
> > > >> +    (____strtoull_l_internal): Remove declaration.
> > > >> +    (STRTOF_NAN): Define macro.
> > > >> +    (SET_MANTISSA): Remove macro.
> > > >> +    (STRTOULL): Likewise.
> > > >> +    (____STRTOF_INTERNAL): Use STRTOF_NAN to parse NaN payload.
> > > >> +    * stdlib/strtof_l.c (____strtoull_l_internal): Remove declara=
tion.
> > > >> +    (STRTOF_NAN): Define macro.
> > > >> +    (SET_MANTISSA): Remove macro.
> > > >> +    * sysdeps/ieee754/ldbl-128/strtold_l.c (STRTOF_NAN): Define m=
acro.
> > > >> +    (SET_MANTISSA): Remove macro.
> > > >> +    * sysdeps/ieee754/ldbl-128ibm/strtold_l.c (STRTOF_NAN): Define
> > > >> +    macro.
> > > >> +    (SET_MANTISSA): Remove macro.
> > > >> +    * sysdeps/ieee754/ldbl-64-128/strtold_l.c (STRTOF_NAN): Define
> > > >> +    macro.
> > > >> +    (SET_MANTISSA): Remove macro.
> > > >> +    * sysdeps/ieee754/ldbl-96/strtold_l.c (STRTOF_NAN): Define ma=
cro.
> > > >> +    (SET_MANTISSA): Remove macro.
> > > >> +    * wcsmbs/wcstod_l.c (____wcstoull_l_internal): Remove declara=
tion.
> > > >> +    * wcsmbs/wcstof_l.c (____wcstoull_l_internal): Likewise.
> > > >> +    * wcsmbs/wcstold_l.c (____wcstoull_l_internal): Likewise.
> > > >> +
> > > >> +Upstream-Status: Backport
> > > >> +CVE: CVE-2015-9761 patch #1
> > > >> +[Yocto # 8980]
> > > >> +
> > > >> +
> > > https://sourceware.org/git/gitweb.cgi?p=3Dglibc.git;h=3De02cabecf0d02=
5ec4f4ddee290bdf7aadb873bb3
> > > >> +
> > > >> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> > > >> +
> > > >> +---
> > > >> + ChangeLog                                        | 49
> > > ++++++++++++++++++
> > > >> + include/stdlib.h                                 | 18 +++++++
> > > >> + include/wchar.h                                  |  3 ++
> > > >> + stdlib/Makefile                                  |  1 +
> > > >> + stdlib/strtod_l.c                                | 48
> > > ++++--------------
> > > >> + stdlib/strtod_nan.c                              | 24 +++++++++
> > > >> + stdlib/strtod_nan_double.h                       | 30 +++++++++++
> > > >> + stdlib/strtod_nan_float.h                        | 29 +++++++++++
> > > >> + stdlib/strtod_nan_main.c                         | 63
> > > ++++++++++++++++++++++++
> > > >> + stdlib/strtod_nan_narrow.h                       | 22 +++++++++
> > > >> + stdlib/strtod_nan_wide.h                         | 22 +++++++++
> > > >> + stdlib/strtof_l.c                                | 11 +----
> > > >> + stdlib/strtof_nan.c                              | 24 +++++++++
> > > >> + stdlib/strtold_nan.c                             | 30 +++++++++++
> > > >> + sysdeps/ieee754/ldbl-128/strtod_nan_ldouble.h    | 33 ++++++++++=
+++
> > > >> + sysdeps/ieee754/ldbl-128/strtold_l.c             | 13 +----
> > > >> + sysdeps/ieee754/ldbl-128ibm/strtod_nan_ldouble.h | 30 +++++++++++
> > > >> + sysdeps/ieee754/ldbl-128ibm/strtold_l.c          | 10 +---
> > > >> + sysdeps/ieee754/ldbl-64-128/strtold_l.c          | 13 +----
> > > >> + sysdeps/ieee754/ldbl-96/strtod_nan_ldouble.h     | 30 +++++++++++
> > > >> + sysdeps/ieee754/ldbl-96/strtold_l.c              | 10 +---
> > > >> + wcsmbs/Makefile                                  |  1 +
> > > >> + wcsmbs/wcstod_l.c                                |  3 --
> > > >> + wcsmbs/wcstod_nan.c                              | 23 +++++++++
> > > >> + wcsmbs/wcstof_l.c                                |  3 --
> > > >> + wcsmbs/wcstof_nan.c                              | 23 +++++++++
> > > >> + wcsmbs/wcstold_l.c                               |  3 --
> > > >> + wcsmbs/wcstold_nan.c                             | 30 +++++++++++
> > > >> + 28 files changed, 504 insertions(+), 95 deletions(-)
> > > >> + create mode 100644 stdlib/strtod_nan.c
> > > >> + create mode 100644 stdlib/strtod_nan_double.h
> > > >> + create mode 100644 stdlib/strtod_nan_float.h
> > > >> + create mode 100644 stdlib/strtod_nan_main.c
> > > >> + create mode 100644 stdlib/strtod_nan_narrow.h
> > > >> + create mode 100644 stdlib/strtod_nan_wide.h
> > > >> + create mode 100644 stdlib/strtof_nan.c
> > > >> + create mode 100644 stdlib/strtold_nan.c
> > > >> + create mode 100644 sysdeps/ieee754/ldbl-128/strtod_nan_ldouble.h
> > > >> + create mode 100644 sysdeps/ieee754/ldbl-128ibm/strtod_nan_ldoubl=
e.h
> > > >> + create mode 100644 sysdeps/ieee754/ldbl-96/strtod_nan_ldouble.h
> > > >> + create mode 100644 wcsmbs/wcstod_nan.c
> > > >> + create mode 100644 wcsmbs/wcstof_nan.c
> > > >> + create mode 100644 wcsmbs/wcstold_nan.c
> > > >> +
> > > >> +Index: git/include/stdlib.h
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- git.orig/include/stdlib.h
> > > >> ++++ git/include/stdlib.h
> > > >> +@@ -203,6 +203,24 @@ libc_hidden_proto (strtoll)
> > > >> + libc_hidden_proto (strtoul)
> > > >> + libc_hidden_proto (strtoull)
> > > >> +
> > > >> ++extern float __strtof_nan (const char *, char **, char)
> > > internal_function;
> > > >> ++extern double __strtod_nan (const char *, char **, char)
> > > internal_function;
> > > >> ++extern long double __strtold_nan (const char *, char **, char)
> > > >> ++     internal_function;
> > > >> ++extern float __wcstof_nan (const wchar_t *, wchar_t **, wchar_t)
> > > >> ++     internal_function;
> > > >> ++extern double __wcstod_nan (const wchar_t *, wchar_t **, wchar_t)
> > > >> ++     internal_function;
> > > >> ++extern long double __wcstold_nan (const wchar_t *, wchar_t **,
> > > wchar_t)
> > > >> ++     internal_function;
> > > >> ++
> > > >> ++libc_hidden_proto (__strtof_nan)
> > > >> ++libc_hidden_proto (__strtod_nan)
> > > >> ++libc_hidden_proto (__strtold_nan)
> > > >> ++libc_hidden_proto (__wcstof_nan)
> > > >> ++libc_hidden_proto (__wcstod_nan)
> > > >> ++libc_hidden_proto (__wcstold_nan)
> > > >> ++
> > > >> + extern char *__ecvt (double __value, int __ndigit, int *__restri=
ct
> > > __decpt,
> > > >> +                 int *__restrict __sign);
> > > >> + extern char *__fcvt (double __value, int __ndigit, int *__restri=
ct
> > > __decpt,
> > > >> +Index: git/include/wchar.h
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- git.orig/include/wchar.h
> > > >> ++++ git/include/wchar.h
> > > >> +@@ -52,6 +52,9 @@ extern unsigned long long int __wcstoull
> > > >> +                                               __restrict __endpt=
r,
> > > >> +                                               int __base,
> > > >> +                                               int __group) __THR=
OW;
> > > >> ++extern unsigned long long int ____wcstoull_l_internal (const wch=
ar_t
> > > *,
> > > >> ++                                                  wchar_t **, in=
t,
> > > int,
> > > >> ++                                                  __locale_t);
> > > >> + libc_hidden_proto (__wcstof_internal)
> > > >> + libc_hidden_proto (__wcstod_internal)
> > > >> + libc_hidden_proto (__wcstold_internal)
> > > >> +Index: git/stdlib/Makefile
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- git.orig/stdlib/Makefile
> > > >> ++++ git/stdlib/Makefile
> > > >> +@@ -51,6 +51,7 @@ routines-y        :=3D
> > >                             \
> > > >> +    strtol_l strtoul_l strtoll_l strtoull_l
> > >    \
> > > >> +    strtof strtod strtold
> > >    \
> > > >> +    strtof_l strtod_l strtold_l
> > >    \
> > > >> ++   strtof_nan strtod_nan strtold_nan
> > >    \
> > > >> +    system canonicalize
> > >    \
> > > >> +    a64l l64a
> > >    \
> > > >> +    getsubopt xpg_basename
> > >     \
> > > >> +Index: git/stdlib/strtod_l.c
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- git.orig/stdlib/strtod_l.c
> > > >> ++++ git/stdlib/strtod_l.c
> > > >> +@@ -21,8 +21,6 @@
> > > >> + #include <xlocale.h>
> > > >> +
> > > >> + extern double ____strtod_l_internal (const char *, char **, int,
> > > __locale_t);
> > > >> +-extern unsigned long long int ____strtoull_l_internal (const cha=
r *,
> > > char **,
> > > >> +-                                                  int, int,
> > > __locale_t);
> > > >> +
> > > >> + /* Configuration part.  These macros are defined by `strtold.c',
> > > >> +    `strtof.c', `wcstod.c', `wcstold.c', and `wcstof.c' to produc=
e the
> > > >> +@@ -34,27 +32,20 @@ extern unsigned long long int ____strtou
> > > >> + # ifdef USE_WIDE_CHAR
> > > >> + #  define STRTOF   wcstod_l
> > > >> + #  define __STRTOF __wcstod_l
> > > >> ++#  define STRTOF_NAN       __wcstod_nan
> > > >> + # else
> > > >> + #  define STRTOF   strtod_l
> > > >> + #  define __STRTOF __strtod_l
> > > >> ++#  define STRTOF_NAN       __strtod_nan
> > > >> + # endif
> > > >> + # define MPN2FLOAT __mpn_construct_double
> > > >> + # define FLOAT_HUGE_VAL    HUGE_VAL
> > > >> +-# define SET_MANTISSA(flt, mant) \
> > > >> +-  do { union ieee754_double u;
> > >            \
> > > >> +-       u.d =3D (flt);
> > >             \
> > > >> +-       u.ieee_nan.mantissa0 =3D (mant) >> 32;
> > >             \
> > > >> +-       u.ieee_nan.mantissa1 =3D (mant);
> > >             \
> > > >> +-       if ((u.ieee.mantissa0 | u.ieee.mantissa1) !=3D 0)
> > >            \
> > > >> +-    (flt) =3D u.d;
> > >    \
> > > >> +-  } while (0)
> > > >> + #endif
> > > >> + /* End of configuration part.  */
> > > >> +
> > > >> + #include <ctype.h>
> > > >> + #include <errno.h>
> > > >> + #include <float.h>
> > > >> +-#include <ieee754.h>
> > > >> + #include "../locale/localeinfo.h"
> > > >> + #include <locale.h>
> > > >> + #include <math.h>
> > > >> +@@ -105,7 +96,6 @@ extern unsigned long long int ____strtou
> > > >> + # define TOLOWER_C(Ch) __towlower_l ((Ch), _nl_C_locobj_ptr)
> > > >> + # define STRNCASECMP(S1, S2, N) \
> > > >> +   __wcsncasecmp_l ((S1), (S2), (N), _nl_C_locobj_ptr)
> > > >> +-# define STRTOULL(S, E, B) ____wcstoull_l_internal ((S), (E), (B=
), 0,
> > > loc)
> > > >> + #else
> > > >> + # define STRING_TYPE char
> > > >> + # define CHAR_TYPE char
> > > >> +@@ -117,7 +107,6 @@ extern unsigned long long int ____strtou
> > > >> + # define TOLOWER_C(Ch) __tolower_l ((Ch), _nl_C_locobj_ptr)
> > > >> + # define STRNCASECMP(S1, S2, N) \
> > > >> +   __strncasecmp_l ((S1), (S2), (N), _nl_C_locobj_ptr)
> > > >> +-# define STRTOULL(S, E, B) ____strtoull_l_internal ((S), (E), (B=
), 0,
> > > loc)
> > > >> + #endif
> > > >> +
> > > >> +
> > > >> +@@ -668,33 +657,14 @@ ____STRTOF_INTERNAL (nptr, endptr, group
> > > >> +      if (*cp =3D=3D L_('('))
> > > >> +        {
> > > >> +          const STRING_TYPE *startp =3D cp;
> > > >> +-         do
> > > >> +-           ++cp;
> > > >> +-         while ((*cp >=3D L_('0') && *cp <=3D L_('9'))
> > > >> +-                || ({ CHAR_TYPE lo =3D TOLOWER (*cp);
> > > >> +-                      lo >=3D L_('a') && lo <=3D L_('z'); })
> > > >> +-                || *cp =3D=3D L_('_'));
> > > >> +-
> > > >> +-         if (*cp !=3D L_(')'))
> > > >> +-           /* The closing brace is missing.  Only match the NAN
> > > >> +-              part.  */
> > > >> +-           cp =3D startp;
> > > >> ++          STRING_TYPE *endp;
> > > >> ++          retval =3D STRTOF_NAN (cp + 1, &endp, L_(')'));
> > > >> ++          if (*endp =3D=3D L_(')'))
> > > >> ++            /* Consume the closing parenthesis.  */
> > > >> ++            cp =3D endp + 1;
> > > >> +          else
> > > >> +-           {
> > > >> +-             /* This is a system-dependent way to specify the
> > > >> +-                bitmask used for the NaN.  We expect it to be
> > > >> +-                a number which is put in the mantissa of the
> > > >> +-                number.  */
> > > >> +-             STRING_TYPE *endp;
> > > >> +-             unsigned long long int mant;
> > > >> +-
> > > >> +-             mant =3D STRTOULL (startp + 1, &endp, 0);
> > > >> +-             if (endp =3D=3D cp)
> > > >> +-               SET_MANTISSA (retval, mant);
> > > >> +-
> > > >> +-             /* Consume the closing brace.  */
> > > >> +-             ++cp;
> > > >> +-           }
> > > >> ++               /* Only match the NAN part.  */
> > > >> ++               cp =3D startp;
> > > >> +        }
> > > >> +
> > > >> +      if (endptr !=3D NULL)
> > > >> +Index: git/stdlib/strtod_nan.c
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- /dev/null
> > > >> ++++ git/stdlib/strtod_nan.c
> > > >> +@@ -0,0 +1,24 @@
> > > >> ++/* Convert string for NaN payload to corresponding NaN.  Narrow
> > > >> ++   strings, double.
> > > >> ++   Copyright (C) 2015 Free Software Foundation, Inc.
> > > >> ++   This file is part of the GNU C Library.
> > > >> ++
> > > >> ++   The GNU C Library is free software; you can redistribute it a=
nd/or
> > > >> ++   modify it under the terms of the GNU Lesser General Public
> > > >> ++   License as published by the Free Software Foundation; either
> > > >> ++   version 2.1 of the License, or (at your option) any later ver=
sion.
> > > >> ++
> > > >> ++   The GNU C Library is distributed in the hope that it will be
> > > useful,
> > > >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=
 GNU
> > > >> ++   Lesser General Public License for more details.
> > > >> ++
> > > >> ++   You should have received a copy of the GNU Lesser General Pub=
lic
> > > >> ++   License along with the GNU C Library; if not, see
> > > >> ++   <http://www.gnu.org/licenses/>.  */
> > > >> ++
> > > >> ++#include <strtod_nan_narrow.h>
> > > >> ++#include <strtod_nan_double.h>
> > > >> ++
> > > >> ++#define STRTOD_NAN __strtod_nan
> > > >> ++#include <strtod_nan_main.c>
> > > >> +Index: git/stdlib/strtod_nan_double.h
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- /dev/null
> > > >> ++++ git/stdlib/strtod_nan_double.h
> > > >> +@@ -0,0 +1,30 @@
> > > >> ++/* Convert string for NaN payload to corresponding NaN.  For dou=
ble.
> > > >> ++   Copyright (C) 1997-2015 Free Software Foundation, Inc.
> > > >> ++   This file is part of the GNU C Library.
> > > >> ++
> > > >> ++   The GNU C Library is free software; you can redistribute it a=
nd/or
> > > >> ++   modify it under the terms of the GNU Lesser General Public
> > > >> ++   License as published by the Free Software Foundation; either
> > > >> ++   version 2.1 of the License, or (at your option) any later ver=
sion.
> > > >> ++
> > > >> ++   The GNU C Library is distributed in the hope that it will be
> > > useful,
> > > >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=
 GNU
> > > >> ++   Lesser General Public License for more details.
> > > >> ++
> > > >> ++   You should have received a copy of the GNU Lesser General Pub=
lic
> > > >> ++   License along with the GNU C Library; if not, see
> > > >> ++   <http://www.gnu.org/licenses/>.  */
> > > >> ++
> > > >> ++#define FLOAT              double
> > > >> ++#define SET_MANTISSA(flt, mant)                            \
> > > >> ++  do                                                       \
> > > >> ++    {                                                      \
> > > >> ++      union ieee754_double u;                              \
> > > >> ++      u.d =3D (flt);                                 \
> > > >> ++      u.ieee_nan.mantissa0 =3D (mant) >> 32;         \
> > > >> ++      u.ieee_nan.mantissa1 =3D (mant);                       \
> > > >> ++      if ((u.ieee.mantissa0 | u.ieee.mantissa1) !=3D 0)      \
> > > >> ++   (flt) =3D u.d;                                    \
> > > >> ++    }                                                      \
> > > >> ++  while (0)
> > > >> +Index: git/stdlib/strtod_nan_float.h
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- /dev/null
> > > >> ++++ git/stdlib/strtod_nan_float.h
> > > >> +@@ -0,0 +1,29 @@
> > > >> ++/* Convert string for NaN payload to corresponding NaN.  For flo=
at.
> > > >> ++   Copyright (C) 1997-2015 Free Software Foundation, Inc.
> > > >> ++   This file is part of the GNU C Library.
> > > >> ++
> > > >> ++   The GNU C Library is free software; you can redistribute it a=
nd/or
> > > >> ++   modify it under the terms of the GNU Lesser General Public
> > > >> ++   License as published by the Free Software Foundation; either
> > > >> ++   version 2.1 of the License, or (at your option) any later ver=
sion.
> > > >> ++
> > > >> ++   The GNU C Library is distributed in the hope that it will be
> > > useful,
> > > >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=
 GNU
> > > >> ++   Lesser General Public License for more details.
> > > >> ++
> > > >> ++   You should have received a copy of the GNU Lesser General Pub=
lic
> > > >> ++   License along with the GNU C Library; if not, see
> > > >> ++   <http://www.gnu.org/licenses/>.  */
> > > >> ++
> > > >> ++#define    FLOAT           float
> > > >> ++#define SET_MANTISSA(flt, mant)                    \
> > > >> ++  do                                               \
> > > >> ++    {                                              \
> > > >> ++      union ieee754_float u;                       \
> > > >> ++      u.f =3D (flt);                         \
> > > >> ++      u.ieee_nan.mantissa =3D (mant);                \
> > > >> ++      if (u.ieee.mantissa !=3D 0)                    \
> > > >> ++   (flt) =3D u.f;                            \
> > > >> ++    }                                              \
> > > >> ++  while (0)
> > > >> +Index: git/stdlib/strtod_nan_main.c
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- /dev/null
> > > >> ++++ git/stdlib/strtod_nan_main.c
> > > >> +@@ -0,0 +1,63 @@
> > > >> ++/* Convert string for NaN payload to corresponding NaN.
> > > >> ++   Copyright (C) 1997-2015 Free Software Foundation, Inc.
> > > >> ++   This file is part of the GNU C Library.
> > > >> ++
> > > >> ++   The GNU C Library is free software; you can redistribute it a=
nd/or
> > > >> ++   modify it under the terms of the GNU Lesser General Public
> > > >> ++   License as published by the Free Software Foundation; either
> > > >> ++   version 2.1 of the License, or (at your option) any later ver=
sion.
> > > >> ++
> > > >> ++   The GNU C Library is distributed in the hope that it will be
> > > useful,
> > > >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=
 GNU
> > > >> ++   Lesser General Public License for more details.
> > > >> ++
> > > >> ++   You should have received a copy of the GNU Lesser General Pub=
lic
> > > >> ++   License along with the GNU C Library; if not, see
> > > >> ++   <http://www.gnu.org/licenses/>.  */
> > > >> ++
> > > >> ++#include <ieee754.h>
> > > >> ++#include <locale.h>
> > > >> ++#include <math.h>
> > > >> ++#include <stdlib.h>
> > > >> ++#include <wchar.h>
> > > >> ++
> > > >> ++
> > > >> ++/* If STR starts with an optional n-char-sequence as defined by =
ISO C
> > > >> ++   (a sequence of ASCII letters, digits and underscores), follow=
ed by
> > > >> ++   ENDC, return a NaN whose payload is set based on STR.  Otherw=
ise,
> > > >> ++   return a default NAN.  If ENDPTR is not NULL, set *ENDPTR to =
point
> > > >> ++   to the character after the initial n-char-sequence.  */
> > > >> ++
> > > >> ++internal_function
> > > >> ++FLOAT
> > > >> ++STRTOD_NAN (const STRING_TYPE *str, STRING_TYPE **endptr, STRING=
_TYPE
> > > endc)
> > > >> ++{
> > > >> ++  const STRING_TYPE *cp =3D str;
> > > >> ++
> > > >> ++  while ((*cp >=3D L_('0') && *cp <=3D L_('9'))
> > > >> ++    || (*cp >=3D L_('A') && *cp <=3D L_('Z'))
> > > >> ++    || (*cp >=3D L_('a') && *cp <=3D L_('z'))
> > > >> ++    || *cp =3D=3D L_('_'))
> > > >> ++    ++cp;
> > > >> ++
> > > >> ++  FLOAT retval =3D NAN;
> > > >> ++  if (*cp !=3D endc)
> > > >> ++    goto out;
> > > >> ++
> > > >> ++  /* This is a system-dependent way to specify the bitmask used =
for
> > > >> ++     the NaN.  We expect it to be a number which is put in the
> > > >> ++     mantissa of the number.  */
> > > >> ++  STRING_TYPE *endp;
> > > >> ++  unsigned long long int mant;
> > > >> ++
> > > >> ++  mant =3D STRTOULL (str, &endp, 0);
> > > >> ++  if (endp =3D=3D cp)
> > > >> ++    SET_MANTISSA (retval, mant);
> > > >> ++
> > > >> ++ out:
> > > >> ++  if (endptr !=3D NULL)
> > > >> ++    *endptr =3D (STRING_TYPE *) cp;
> > > >> ++  return retval;
> > > >> ++}
> > > >> ++libc_hidden_def (STRTOD_NAN)
> > > >> +Index: git/stdlib/strtod_nan_narrow.h
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- /dev/null
> > > >> ++++ git/stdlib/strtod_nan_narrow.h
> > > >> +@@ -0,0 +1,22 @@
> > > >> ++/* Convert string for NaN payload to corresponding NaN.  Narrow
> > > strings.
> > > >> ++   Copyright (C) 1997-2015 Free Software Foundation, Inc.
> > > >> ++   This file is part of the GNU C Library.
> > > >> ++
> > > >> ++   The GNU C Library is free software; you can redistribute it a=
nd/or
> > > >> ++   modify it under the terms of the GNU Lesser General Public
> > > >> ++   License as published by the Free Software Foundation; either
> > > >> ++   version 2.1 of the License, or (at your option) any later ver=
sion.
> > > >> ++
> > > >> ++   The GNU C Library is distributed in the hope that it will be
> > > useful,
> > > >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=
 GNU
> > > >> ++   Lesser General Public License for more details.
> > > >> ++
> > > >> ++   You should have received a copy of the GNU Lesser General Pub=
lic
> > > >> ++   License along with the GNU C Library; if not, see
> > > >> ++   <http://www.gnu.org/licenses/>.  */
> > > >> ++
> > > >> ++#define STRING_TYPE char
> > > >> ++#define L_(Ch) Ch
> > > >> ++#define STRTOULL(S, E, B) ____strtoull_l_internal ((S), (E), (B)=
, 0,
> > >      \
> > > >> ++                                              _nl_C_locobj_ptr)
> > > >> +Index: git/stdlib/strtod_nan_wide.h
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- /dev/null
> > > >> ++++ git/stdlib/strtod_nan_wide.h
> > > >> +@@ -0,0 +1,22 @@
> > > >> ++/* Convert string for NaN payload to corresponding NaN.  Wide st=
rings.
> > > >> ++   Copyright (C) 1997-2015 Free Software Foundation, Inc.
> > > >> ++   This file is part of the GNU C Library.
> > > >> ++
> > > >> ++   The GNU C Library is free software; you can redistribute it a=
nd/or
> > > >> ++   modify it under the terms of the GNU Lesser General Public
> > > >> ++   License as published by the Free Software Foundation; either
> > > >> ++   version 2.1 of the License, or (at your option) any later ver=
sion.
> > > >> ++
> > > >> ++   The GNU C Library is distributed in the hope that it will be
> > > useful,
> > > >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=
 GNU
> > > >> ++   Lesser General Public License for more details.
> > > >> ++
> > > >> ++   You should have received a copy of the GNU Lesser General Pub=
lic
> > > >> ++   License along with the GNU C Library; if not, see
> > > >> ++   <http://www.gnu.org/licenses/>.  */
> > > >> ++
> > > >> ++#define STRING_TYPE wchar_t
> > > >> ++#define L_(Ch) L##Ch
> > > >> ++#define STRTOULL(S, E, B) ____wcstoull_l_internal ((S), (E), (B)=
, 0,
> > >      \
> > > >> ++                                              _nl_C_locobj_ptr)
> > > >> +Index: git/stdlib/strtof_l.c
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- git.orig/stdlib/strtof_l.c
> > > >> ++++ git/stdlib/strtof_l.c
> > > >> +@@ -20,26 +20,19 @@
> > > >> + #include <xlocale.h>
> > > >> +
> > > >> + extern float ____strtof_l_internal (const char *, char **, int,
> > > __locale_t);
> > > >> +-extern unsigned long long int ____strtoull_l_internal (const cha=
r *,
> > > char **,
> > > >> +-                                                  int, int,
> > > __locale_t);
> > > >> +
> > > >> + #define    FLOAT           float
> > > >> + #define    FLT             FLT
> > > >> + #ifdef USE_WIDE_CHAR
> > > >> + # define STRTOF            wcstof_l
> > > >> + # define __STRTOF  __wcstof_l
> > > >> ++# define STRTOF_NAN        __wcstof_nan
> > > >> + #else
> > > >> + # define STRTOF            strtof_l
> > > >> + # define __STRTOF  __strtof_l
> > > >> ++# define STRTOF_NAN        __strtof_nan
> > > >> + #endif
> > > >> + #define    MPN2FLOAT       __mpn_construct_float
> > > >> + #define    FLOAT_HUGE_VAL  HUGE_VALF
> > > >> +-#define SET_MANTISSA(flt, mant) \
> > > >> +-  do { union ieee754_float u;
> > >             \
> > > >> +-       u.f =3D (flt);
> > >             \
> > > >> +-       u.ieee_nan.mantissa =3D (mant);
> > >            \
> > > >> +-       if (u.ieee.mantissa !=3D 0)
> > >    \
> > > >> +-    (flt) =3D u.f;
> > >    \
> > > >> +-  } while (0)
> > > >> +
> > > >> + #include "strtod_l.c"
> > > >> +Index: git/stdlib/strtof_nan.c
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- /dev/null
> > > >> ++++ git/stdlib/strtof_nan.c
> > > >> +@@ -0,0 +1,24 @@
> > > >> ++/* Convert string for NaN payload to corresponding NaN.  Narrow
> > > >> ++   strings, float.
> > > >> ++   Copyright (C) 2015 Free Software Foundation, Inc.
> > > >> ++   This file is part of the GNU C Library.
> > > >> ++
> > > >> ++   The GNU C Library is free software; you can redistribute it a=
nd/or
> > > >> ++   modify it under the terms of the GNU Lesser General Public
> > > >> ++   License as published by the Free Software Foundation; either
> > > >> ++   version 2.1 of the License, or (at your option) any later ver=
sion.
> > > >> ++
> > > >> ++   The GNU C Library is distributed in the hope that it will be
> > > useful,
> > > >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=
 GNU
> > > >> ++   Lesser General Public License for more details.
> > > >> ++
> > > >> ++   You should have received a copy of the GNU Lesser General Pub=
lic
> > > >> ++   License along with the GNU C Library; if not, see
> > > >> ++   <http://www.gnu.org/licenses/>.  */
> > > >> ++
> > > >> ++#include <strtod_nan_narrow.h>
> > > >> ++#include <strtod_nan_float.h>
> > > >> ++
> > > >> ++#define STRTOD_NAN __strtof_nan
> > > >> ++#include <strtod_nan_main.c>
> > > >> +Index: git/stdlib/strtold_nan.c
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- /dev/null
> > > >> ++++ git/stdlib/strtold_nan.c
> > > >> +@@ -0,0 +1,30 @@
> > > >> ++/* Convert string for NaN payload to corresponding NaN.  Narrow
> > > >> ++   strings, long double.
> > > >> ++   Copyright (C) 2015 Free Software Foundation, Inc.
> > > >> ++   This file is part of the GNU C Library.
> > > >> ++
> > > >> ++   The GNU C Library is free software; you can redistribute it a=
nd/or
> > > >> ++   modify it under the terms of the GNU Lesser General Public
> > > >> ++   License as published by the Free Software Foundation; either
> > > >> ++   version 2.1 of the License, or (at your option) any later ver=
sion.
> > > >> ++
> > > >> ++   The GNU C Library is distributed in the hope that it will be
> > > useful,
> > > >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=
 GNU
> > > >> ++   Lesser General Public License for more details.
> > > >> ++
> > > >> ++   You should have received a copy of the GNU Lesser General Pub=
lic
> > > >> ++   License along with the GNU C Library; if not, see
> > > >> ++   <http://www.gnu.org/licenses/>.  */
> > > >> ++
> > > >> ++#include <math.h>
> > > >> ++
> > > >> ++/* This function is unused if long double and double have the sa=
me
> > > >> ++   representation.  */
> > > >> ++#ifndef __NO_LONG_DOUBLE_MATH
> > > >> ++# include <strtod_nan_narrow.h>
> > > >> ++# include <strtod_nan_ldouble.h>
> > > >> ++
> > > >> ++# define STRTOD_NAN __strtold_nan
> > > >> ++# include <strtod_nan_main.c>
> > > >> ++#endif
> > > >> +Index: git/sysdeps/ieee754/ldbl-128/strtod_nan_ldouble.h
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- /dev/null
> > > >> ++++ git/sysdeps/ieee754/ldbl-128/strtod_nan_ldouble.h
> > > >> +@@ -0,0 +1,33 @@
> > > >> ++/* Convert string for NaN payload to corresponding NaN.  For ldb=
l-128.
> > > >> ++   Copyright (C) 1997-2015 Free Software Foundation, Inc.
> > > >> ++   This file is part of the GNU C Library.
> > > >> ++
> > > >> ++   The GNU C Library is free software; you can redistribute it a=
nd/or
> > > >> ++   modify it under the terms of the GNU Lesser General Public
> > > >> ++   License as published by the Free Software Foundation; either
> > > >> ++   version 2.1 of the License, or (at your option) any later ver=
sion.
> > > >> ++
> > > >> ++   The GNU C Library is distributed in the hope that it will be
> > > useful,
> > > >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=
 GNU
> > > >> ++   Lesser General Public License for more details.
> > > >> ++
> > > >> ++   You should have received a copy of the GNU Lesser General Pub=
lic
> > > >> ++   License along with the GNU C Library; if not, see
> > > >> ++   <http://www.gnu.org/licenses/>.  */
> > > >> ++
> > > >> ++#define FLOAT              long double
> > > >> ++#define SET_MANTISSA(flt, mant)                            \
> > > >> ++  do                                                       \
> > > >> ++    {                                                      \
> > > >> ++      union ieee854_long_double u;                 \
> > > >> ++      u.d =3D (flt);                                 \
> > > >> ++      u.ieee_nan.mantissa0 =3D 0;                            \
> > > >> ++      u.ieee_nan.mantissa1 =3D 0;                            \
> > > >> ++      u.ieee_nan.mantissa2 =3D (mant) >> 32;         \
> > > >> ++      u.ieee_nan.mantissa3 =3D (mant);                       \
> > > >> ++      if ((u.ieee.mantissa0 | u.ieee.mantissa1             \
> > > >> ++      | u.ieee.mantissa2 | u.ieee.mantissa3) !=3D 0) \
> > > >> ++   (flt) =3D u.d;                                    \
> > > >> ++    }                                                      \
> > > >> ++  while (0)
> > > >> +Index: git/sysdeps/ieee754/ldbl-128/strtold_l.c
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- git.orig/sysdeps/ieee754/ldbl-128/strtold_l.c
> > > >> ++++ git/sysdeps/ieee754/ldbl-128/strtold_l.c
> > > >> +@@ -25,22 +25,13 @@
> > > >> + #ifdef USE_WIDE_CHAR
> > > >> + # define STRTOF            wcstold_l
> > > >> + # define __STRTOF  __wcstold_l
> > > >> ++# define STRTOF_NAN        __wcstold_nan
> > > >> + #else
> > > >> + # define STRTOF            strtold_l
> > > >> + # define __STRTOF  __strtold_l
> > > >> ++# define STRTOF_NAN        __strtold_nan
> > > >> + #endif
> > > >> + #define MPN2FLOAT  __mpn_construct_long_double
> > > >> + #define FLOAT_HUGE_VAL     HUGE_VALL
> > > >> +-#define SET_MANTISSA(flt, mant) \
> > > >> +-  do { union ieee854_long_double u;
> > >             \
> > > >> +-       u.d =3D (flt);
> > >             \
> > > >> +-       u.ieee_nan.mantissa0 =3D 0;
> > >    \
> > > >> +-       u.ieee_nan.mantissa1 =3D 0;
> > >    \
> > > >> +-       u.ieee_nan.mantissa2 =3D (mant) >> 32;
> > >             \
> > > >> +-       u.ieee_nan.mantissa3 =3D (mant);
> > >             \
> > > >> +-       if ((u.ieee.mantissa0 | u.ieee.mantissa1
> > >             \
> > > >> +-       | u.ieee.mantissa2 | u.ieee.mantissa3) !=3D 0)
> > >     \
> > > >> +-    (flt) =3D u.d;
> > >    \
> > > >> +-  } while (0)
> > > >> +
> > > >> + #include <strtod_l.c>
> > > >> +Index: git/sysdeps/ieee754/ldbl-128ibm/strtod_nan_ldouble.h
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- /dev/null
> > > >> ++++ git/sysdeps/ieee754/ldbl-128ibm/strtod_nan_ldouble.h
> > > >> +@@ -0,0 +1,30 @@
> > > >> ++/* Convert string for NaN payload to corresponding NaN.  For
> > > ldbl-128ibm.
> > > >> ++   Copyright (C) 1997-2015 Free Software Foundation, Inc.
> > > >> ++   This file is part of the GNU C Library.
> > > >> ++
> > > >> ++   The GNU C Library is free software; you can redistribute it a=
nd/or
> > > >> ++   modify it under the terms of the GNU Lesser General Public
> > > >> ++   License as published by the Free Software Foundation; either
> > > >> ++   version 2.1 of the License, or (at your option) any later ver=
sion.
> > > >> ++
> > > >> ++   The GNU C Library is distributed in the hope that it will be
> > > useful,
> > > >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=
 GNU
> > > >> ++   Lesser General Public License for more details.
> > > >> ++
> > > >> ++   You should have received a copy of the GNU Lesser General Pub=
lic
> > > >> ++   License along with the GNU C Library; if not, see
> > > >> ++   <http://www.gnu.org/licenses/>.  */
> > > >> ++
> > > >> ++#define FLOAT              long double
> > > >> ++#define SET_MANTISSA(flt, mant)                                 =
   \
> > > >> ++  do                                                            =
   \
> > > >> ++    {                                                           =
   \
> > > >> ++      union ibm_extended_long_double u;                         =
   \
> > > >> ++      u.ld =3D (flt);                                           =
     \
> > > >> ++      u.d[0].ieee_nan.mantissa0 =3D (mant) >> 32;               =
     \
> > > >> ++      u.d[0].ieee_nan.mantissa1 =3D (mant);                  \
> > > >> ++      if ((u.d[0].ieee.mantissa0 | u.d[0].ieee.mantissa1) !=3D 0=
)    \
> > > >> ++   (flt) =3D u.ld;                                           \
> > > >> ++    }                                                           =
   \
> > > >> ++  while (0)
> > > >> +Index: git/sysdeps/ieee754/ldbl-128ibm/strtold_l.c
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- git.orig/sysdeps/ieee754/ldbl-128ibm/strtold_l.c
> > > >> ++++ git/sysdeps/ieee754/ldbl-128ibm/strtold_l.c
> > > >> +@@ -30,25 +30,19 @@ extern long double ____new_wcstold_l (co
> > > >> + # define STRTOF            __new_wcstold_l
> > > >> + # define __STRTOF  ____new_wcstold_l
> > > >> + # define ____STRTOF_INTERNAL ____wcstold_l_internal
> > > >> ++# define STRTOF_NAN        __wcstold_nan
> > > >> + #else
> > > >> + extern long double ____new_strtold_l (const char *, char **,
> > > __locale_t);
> > > >> + # define STRTOF            __new_strtold_l
> > > >> + # define __STRTOF  ____new_strtold_l
> > > >> + # define ____STRTOF_INTERNAL ____strtold_l_internal
> > > >> ++# define STRTOF_NAN        __strtold_nan
> > > >> + #endif
> > > >> + extern __typeof (__STRTOF) STRTOF;
> > > >> + libc_hidden_proto (__STRTOF)
> > > >> + libc_hidden_proto (STRTOF)
> > > >> + #define MPN2FLOAT  __mpn_construct_long_double
> > > >> + #define FLOAT_HUGE_VAL     HUGE_VALL
> > > >> +-# define SET_MANTISSA(flt, mant) \
> > > >> +-  do { union ibm_extended_long_double u;
> > >    \
> > > >> +-       u.ld =3D (flt);
> > >            \
> > > >> +-       u.d[0].ieee_nan.mantissa0 =3D (mant) >> 32;
> > >    \
> > > >> +-       u.d[0].ieee_nan.mantissa1 =3D (mant);
> > >    \
> > > >> +-       if ((u.d[0].ieee.mantissa0 | u.d[0].ieee.mantissa1) !=3D =
0)
> > >    \
> > > >> +-    (flt) =3D u.ld;
> > >     \
> > > >> +-  } while (0)
> > > >> +
> > > >> + #include <strtod_l.c>
> > > >> +
> > > >> +Index: git/sysdeps/ieee754/ldbl-64-128/strtold_l.c
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- git.orig/sysdeps/ieee754/ldbl-64-128/strtold_l.c
> > > >> ++++ git/sysdeps/ieee754/ldbl-64-128/strtold_l.c
> > > >> +@@ -30,28 +30,19 @@ extern long double ____new_wcstold_l (co
> > > >> + # define STRTOF            __new_wcstold_l
> > > >> + # define __STRTOF  ____new_wcstold_l
> > > >> + # define ____STRTOF_INTERNAL ____wcstold_l_internal
> > > >> ++# define STRTOF_NAN        __wcstold_nan
> > > >> + #else
> > > >> + extern long double ____new_strtold_l (const char *, char **,
> > > __locale_t);
> > > >> + # define STRTOF            __new_strtold_l
> > > >> + # define __STRTOF  ____new_strtold_l
> > > >> + # define ____STRTOF_INTERNAL ____strtold_l_internal
> > > >> ++# define STRTOF_NAN        __strtold_nan
> > > >> + #endif
> > > >> + extern __typeof (__STRTOF) STRTOF;
> > > >> + libc_hidden_proto (__STRTOF)
> > > >> + libc_hidden_proto (STRTOF)
> > > >> + #define MPN2FLOAT  __mpn_construct_long_double
> > > >> + #define FLOAT_HUGE_VAL     HUGE_VALL
> > > >> +-#define SET_MANTISSA(flt, mant) \
> > > >> +-  do { union ieee854_long_double u;
> > >             \
> > > >> +-       u.d =3D (flt);
> > >             \
> > > >> +-       u.ieee_nan.mantissa0 =3D 0;
> > >    \
> > > >> +-       u.ieee_nan.mantissa1 =3D 0;
> > >    \
> > > >> +-       u.ieee_nan.mantissa2 =3D (mant) >> 32;
> > >             \
> > > >> +-       u.ieee_nan.mantissa3 =3D (mant);
> > >             \
> > > >> +-       if ((u.ieee.mantissa0 | u.ieee.mantissa1
> > >             \
> > > >> +-       | u.ieee.mantissa2 | u.ieee.mantissa3) !=3D 0)
> > >     \
> > > >> +-    (flt) =3D u.d;
> > >    \
> > > >> +-  } while (0)
> > > >> +
> > > >> + #include <strtod_l.c>
> > > >> +
> > > >> +Index: git/sysdeps/ieee754/ldbl-96/strtod_nan_ldouble.h
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- /dev/null
> > > >> ++++ git/sysdeps/ieee754/ldbl-96/strtod_nan_ldouble.h
> > > >> +@@ -0,0 +1,30 @@
> > > >> ++/* Convert string for NaN payload to corresponding NaN.  For ldb=
l-96.
> > > >> ++   Copyright (C) 1997-2015 Free Software Foundation, Inc.
> > > >> ++   This file is part of the GNU C Library.
> > > >> ++
> > > >> ++   The GNU C Library is free software; you can redistribute it a=
nd/or
> > > >> ++   modify it under the terms of the GNU Lesser General Public
> > > >> ++   License as published by the Free Software Foundation; either
> > > >> ++   version 2.1 of the License, or (at your option) any later ver=
sion.
> > > >> ++
> > > >> ++   The GNU C Library is distributed in the hope that it will be
> > > useful,
> > > >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=
 GNU
> > > >> ++   Lesser General Public License for more details.
> > > >> ++
> > > >> ++   You should have received a copy of the GNU Lesser General Pub=
lic
> > > >> ++   License along with the GNU C Library; if not, see
> > > >> ++   <http://www.gnu.org/licenses/>.  */
> > > >> ++
> > > >> ++#define FLOAT              long double
> > > >> ++#define SET_MANTISSA(flt, mant)                            \
> > > >> ++  do                                                       \
> > > >> ++    {                                                      \
> > > >> ++      union ieee854_long_double u;                 \
> > > >> ++      u.d =3D (flt);                                 \
> > > >> ++      u.ieee_nan.mantissa0 =3D (mant) >> 32;         \
> > > >> ++      u.ieee_nan.mantissa1 =3D (mant);                       \
> > > >> ++      if ((u.ieee.mantissa0 | u.ieee.mantissa1) !=3D 0)      \
> > > >> ++   (flt) =3D u.d;                                    \
> > > >> ++    }                                                      \
> > > >> ++  while (0)
> > > >> +Index: git/sysdeps/ieee754/ldbl-96/strtold_l.c
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- git.orig/sysdeps/ieee754/ldbl-96/strtold_l.c
> > > >> ++++ git/sysdeps/ieee754/ldbl-96/strtold_l.c
> > > >> +@@ -25,19 +25,13 @@
> > > >> + #ifdef USE_WIDE_CHAR
> > > >> + # define STRTOF            wcstold_l
> > > >> + # define __STRTOF  __wcstold_l
> > > >> ++# define STRTOF_NAN        __wcstold_nan
> > > >> + #else
> > > >> + # define STRTOF            strtold_l
> > > >> + # define __STRTOF  __strtold_l
> > > >> ++# define STRTOF_NAN        __strtold_nan
> > > >> + #endif
> > > >> + #define MPN2FLOAT  __mpn_construct_long_double
> > > >> + #define FLOAT_HUGE_VAL     HUGE_VALL
> > > >> +-#define SET_MANTISSA(flt, mant) \
> > > >> +-  do { union ieee854_long_double u;
> > >             \
> > > >> +-       u.d =3D (flt);
> > >             \
> > > >> +-       u.ieee_nan.mantissa0 =3D (mant) >> 32;
> > >             \
> > > >> +-       u.ieee_nan.mantissa1 =3D (mant);
> > >             \
> > > >> +-       if ((u.ieee.mantissa0 | u.ieee.mantissa1) !=3D 0)
> > >            \
> > > >> +-    (flt) =3D u.d;
> > >    \
> > > >> +-  } while (0)
> > > >> +
> > > >> + #include <stdlib/strtod_l.c>
> > > >> +Index: git/wcsmbs/Makefile
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- git.orig/wcsmbs/Makefile
> > > >> ++++ git/wcsmbs/Makefile
> > > >> +@@ -39,6 +39,7 @@ routines-$(OPTION_POSIX_C_LANG_WIDE_CHAR
> > > >> +        wcstol wcstoul wcstoll wcstoull wcstod wcstold wcstof \
> > > >> +        wcstol_l wcstoul_l wcstoll_l wcstoull_l \
> > > >> +        wcstod_l wcstold_l wcstof_l \
> > > >> ++       wcstod_nan wcstold_nan wcstof_nan \
> > > >> +        wcscoll wcsxfrm \
> > > >> +        wcwidth wcswidth \
> > > >> +        wcscoll_l wcsxfrm_l \
> > > >> +Index: git/wcsmbs/wcstod_l.c
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- git.orig/wcsmbs/wcstod_l.c
> > > >> ++++ git/wcsmbs/wcstod_l.c
> > > >> +@@ -23,9 +23,6 @@
> > > >> +
> > > >> + extern double ____wcstod_l_internal (const wchar_t *, wchar_t **=
, int,
> > > >> +                                 __locale_t);
> > > >> +-extern unsigned long long int ____wcstoull_l_internal (const wch=
ar_t
> > > *,
> > > >> +-                                                  wchar_t **, in=
t,
> > > int,
> > > >> +-                                                  __locale_t);
> > > >> +
> > > >> + #define    USE_WIDE_CHAR   1
> > > >> +
> > > >> +Index: git/wcsmbs/wcstod_nan.c
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- /dev/null
> > > >> ++++ git/wcsmbs/wcstod_nan.c
> > > >> +@@ -0,0 +1,23 @@
> > > >> ++/* Convert string for NaN payload to corresponding NaN.  Wide
> > > strings, double.
> > > >> ++   Copyright (C) 2015 Free Software Foundation, Inc.
> > > >> ++   This file is part of the GNU C Library.
> > > >> ++
> > > >> ++   The GNU C Library is free software; you can redistribute it a=
nd/or
> > > >> ++   modify it under the terms of the GNU Lesser General Public
> > > >> ++   License as published by the Free Software Foundation; either
> > > >> ++   version 2.1 of the License, or (at your option) any later ver=
sion.
> > > >> ++
> > > >> ++   The GNU C Library is distributed in the hope that it will be
> > > useful,
> > > >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=
 GNU
> > > >> ++   Lesser General Public License for more details.
> > > >> ++
> > > >> ++   You should have received a copy of the GNU Lesser General Pub=
lic
> > > >> ++   License along with the GNU C Library; if not, see
> > > >> ++   <http://www.gnu.org/licenses/>.  */
> > > >> ++
> > > >> ++#include "../stdlib/strtod_nan_wide.h"
> > > >> ++#include "../stdlib/strtod_nan_double.h"
> > > >> ++
> > > >> ++#define STRTOD_NAN __wcstod_nan
> > > >> ++#include "../stdlib/strtod_nan_main.c"
> > > >> +Index: git/wcsmbs/wcstof_l.c
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- git.orig/wcsmbs/wcstof_l.c
> > > >> ++++ git/wcsmbs/wcstof_l.c
> > > >> +@@ -25,8 +25,5 @@
> > > >> +
> > > >> + extern float ____wcstof_l_internal (const wchar_t *, wchar_t **,=
 int,
> > > >> +                                __locale_t);
> > > >> +-extern unsigned long long int ____wcstoull_l_internal (const wch=
ar_t
> > > *,
> > > >> +-                                                  wchar_t **, in=
t,
> > > int,
> > > >> +-                                                  __locale_t);
> > > >> +
> > > >> + #include <stdlib/strtof_l.c>
> > > >> +Index: git/wcsmbs/wcstof_nan.c
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- /dev/null
> > > >> ++++ git/wcsmbs/wcstof_nan.c
> > > >> +@@ -0,0 +1,23 @@
> > > >> ++/* Convert string for NaN payload to corresponding NaN.  Wide
> > > strings, float.
> > > >> ++   Copyright (C) 2015 Free Software Foundation, Inc.
> > > >> ++   This file is part of the GNU C Library.
> > > >> ++
> > > >> ++   The GNU C Library is free software; you can redistribute it a=
nd/or
> > > >> ++   modify it under the terms of the GNU Lesser General Public
> > > >> ++   License as published by the Free Software Foundation; either
> > > >> ++   version 2.1 of the License, or (at your option) any later ver=
sion.
> > > >> ++
> > > >> ++   The GNU C Library is distributed in the hope that it will be
> > > useful,
> > > >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=
 GNU
> > > >> ++   Lesser General Public License for more details.
> > > >> ++
> > > >> ++   You should have received a copy of the GNU Lesser General Pub=
lic
> > > >> ++   License along with the GNU C Library; if not, see
> > > >> ++   <http://www.gnu.org/licenses/>.  */
> > > >> ++
> > > >> ++#include "../stdlib/strtod_nan_wide.h"
> > > >> ++#include "../stdlib/strtod_nan_float.h"
> > > >> ++
> > > >> ++#define STRTOD_NAN __wcstof_nan
> > > >> ++#include "../stdlib/strtod_nan_main.c"
> > > >> +Index: git/wcsmbs/wcstold_l.c
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- git.orig/wcsmbs/wcstold_l.c
> > > >> ++++ git/wcsmbs/wcstold_l.c
> > > >> +@@ -24,8 +24,5 @@
> > > >> +
> > > >> + extern long double ____wcstold_l_internal (const wchar_t *, wcha=
r_t
> > > **, int,
> > > >> +                                       __locale_t);
> > > >> +-extern unsigned long long int ____wcstoull_l_internal (const wch=
ar_t
> > > *,
> > > >> +-                                                  wchar_t **, in=
t,
> > > int,
> > > >> +-                                                  __locale_t);
> > > >> +
> > > >> + #include <strtold_l.c>
> > > >> +Index: git/wcsmbs/wcstold_nan.c
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- /dev/null
> > > >> ++++ git/wcsmbs/wcstold_nan.c
> > > >> +@@ -0,0 +1,30 @@
> > > >> ++/* Convert string for NaN payload to corresponding NaN.  Wide st=
rings,
> > > >> ++   long double.
> > > >> ++   Copyright (C) 2015 Free Software Foundation, Inc.
> > > >> ++   This file is part of the GNU C Library.
> > > >> ++
> > > >> ++   The GNU C Library is free software; you can redistribute it a=
nd/or
> > > >> ++   modify it under the terms of the GNU Lesser General Public
> > > >> ++   License as published by the Free Software Foundation; either
> > > >> ++   version 2.1 of the License, or (at your option) any later ver=
sion.
> > > >> ++
> > > >> ++   The GNU C Library is distributed in the hope that it will be
> > > useful,
> > > >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=
 GNU
> > > >> ++   Lesser General Public License for more details.
> > > >> ++
> > > >> ++   You should have received a copy of the GNU Lesser General Pub=
lic
> > > >> ++   License along with the GNU C Library; if not, see
> > > >> ++   <http://www.gnu.org/licenses/>.  */
> > > >> ++
> > > >> ++#include <math.h>
> > > >> ++
> > > >> ++/* This function is unused if long double and double have the sa=
me
> > > >> ++   representation.  */
> > > >> ++#ifndef __NO_LONG_DOUBLE_MATH
> > > >> ++# include "../stdlib/strtod_nan_wide.h"
> > > >> ++# include <strtod_nan_ldouble.h>
> > > >> ++
> > > >> ++# define STRTOD_NAN __wcstold_nan
> > > >> ++# include "../stdlib/strtod_nan_main.c"
> > > >> ++#endif
> > > >> +Index: git/ChangeLog
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- git.orig/ChangeLog
> > > >> ++++ git/ChangeLog
> > > >> +@@ -1,3 +1,57 @@
> > > >> ++2015-11-24  Joseph Myers  <joseph@codesourcery.com>
> > > >> ++
> > > >> ++   * stdlib/strtod_nan.c: New file.
> > > >> ++   * stdlib/strtod_nan_double.h: Likewise.
> > > >> ++   * stdlib/strtod_nan_float.h: Likewise.
> > > >> ++   * stdlib/strtod_nan_main.c: Likewise.
> > > >> ++   * stdlib/strtod_nan_narrow.h: Likewise.
> > > >> ++   * stdlib/strtod_nan_wide.h: Likewise.
> > > >> ++   * stdlib/strtof_nan.c: Likewise.
> > > >> ++   * stdlib/strtold_nan.c: Likewise.
> > > >> ++   * sysdeps/ieee754/ldbl-128/strtod_nan_ldouble.h: Likewise.
> > > >> ++   * sysdeps/ieee754/ldbl-128ibm/strtod_nan_ldouble.h: Likewise.
> > > >> ++   * sysdeps/ieee754/ldbl-96/strtod_nan_ldouble.h: Likewise.
> > > >> ++   * wcsmbs/wcstod_nan.c: Likewise.
> > > >> ++   * wcsmbs/wcstof_nan.c: Likewise.
> > > >> ++   * wcsmbs/wcstold_nan.c: Likewise.
> > > >> ++   * stdlib/Makefile (routines): Add strtof_nan, strtod_nan and
> > > >> ++   strtold_nan.
> > > >> ++   * wcsmbs/Makefile (routines): Add wcstod_nan, wcstold_nan and
> > > >> ++   wcstof_nan.
> > > >> ++   * include/stdlib.h (__strtof_nan): Declare and use
> > > >> ++   libc_hidden_proto.
> > > >> ++   (__strtod_nan): Likewise.
> > > >> ++   (__strtold_nan): Likewise.
> > > >> ++   (__wcstof_nan): Likewise.
> > > >> ++   (__wcstod_nan): Likewise.
> > > >> ++   (__wcstold_nan): Likewise.
> > > >> ++   * include/wchar.h (____wcstoull_l_internal): Declare.
> > > >> ++   * stdlib/strtod_l.c: Do not include <ieee754.h>.
> > > >> ++   (____strtoull_l_internal): Remove declaration.
> > > >> ++   (STRTOF_NAN): Define macro.
> > > >> ++   (SET_MANTISSA): Remove macro.
> > > >> ++   (STRTOULL): Likewise.
> > > >> ++   (____STRTOF_INTERNAL): Use STRTOF_NAN to parse NaN payload.
> > > >> ++   * stdlib/strtof_l.c (____strtoull_l_internal): Remove declara=
tion.
> > > >> ++   (STRTOF_NAN): Define macro.
> > > >> ++   (SET_MANTISSA): Remove macro.
> > > >> ++   * sysdeps/ieee754/ldbl-128/strtold_l.c (STRTOF_NAN): Define m=
acro.
> > > >> ++   (SET_MANTISSA): Remove macro.
> > > >> ++   * sysdeps/ieee754/ldbl-128ibm/strtold_l.c (STRTOF_NAN): Define
> > > >> ++   macro.
> > > >> ++   (SET_MANTISSA): Remove macro.
> > > >> ++   * sysdeps/ieee754/ldbl-64-128/strtold_l.c (STRTOF_NAN): Define
> > > >> ++   macro.
> > > >> ++   (SET_MANTISSA): Remove macro.
> > > >> ++   * sysdeps/ieee754/ldbl-96/strtold_l.c (STRTOF_NAN): Define ma=
cro.
> > > >> ++   (SET_MANTISSA): Remove macro.
> > > >> ++   * wcsmbs/wcstod_l.c (____wcstoull_l_internal): Remove declara=
tion.
> > > >> ++   * wcsmbs/wcstof_l.c (____wcstoull_l_internal): Likewise.
> > > >> ++   * wcsmbs/wcstold_l.c (____wcstoull_l_internal): Likewise.
> > > >> ++
> > > >> ++   [BZ #19266]
> > > >> ++   * stdlib/strtod_l.c (____STRTOF_INTERNAL): Check directly for
> > > >> ++   upper case and lower case letters inside NAN(), not using TOL=
OWER.
> > > >> + 2015-08-08  Paul Pluzhnikov  <ppluzhnikov@google.com>
> > > >> +
> > > >> +    [BZ #17905]
> > > >> diff --git a/meta/recipes-core/glibc/glibc/CVE-2015-9761_2.patch
> > > b/meta/recipes-core/glibc/glibc/CVE-2015-9761_2.patch
> > > >> new file mode 100644
> > > >> index 0000000..0df5e50
> > > >> --- /dev/null
> > > >> +++ b/meta/recipes-core/glibc/glibc/CVE-2015-9761_2.patch
> > > >> @@ -0,0 +1,388 @@
> > > >> +From 8f5e8b01a1da2a207228f2072c934fa5918554b8 Mon Sep 17 00:00:00=
 2001
> > > >> +From: Joseph Myers <joseph@codesourcery.com>
> > > >> +Date: Fri, 4 Dec 2015 20:36:28 +0000
> > > >> +Subject: [PATCH] Fix nan functions handling of payload strings (b=
ug
> > > 16961, bug
> > > >> + 16962).
> > > >> +
> > > >> +The nan, nanf and nanl functions handle payload strings by doing =
e.g.:
> > > >> +
> > > >> +  if (tagp[0] !=3D '\0')
> > > >> +    {
> > > >> +      char buf[6 + strlen (tagp)];
> > > >> +      sprintf (buf, "NAN(%s)", tagp);
> > > >> +      return strtod (buf, NULL);
> > > >> +    }
> > > >> +
> > > >> +This is an unbounded stack allocation based on the length of the
> > > >> +argument.  Furthermore, if the argument starts with an n-char-seq=
uence
> > > >> +followed by ')', that n-char-sequence is wrongly treated as
> > > >> +significant for determining the payload of the resulting NaN, whe=
n ISO
> > > >> +C says the call should be equivalent to strtod ("NAN", NULL), wit=
hout
> > > >> +being affected by that initial n-char-sequence.  This patch fixes=
 both
> > > >> +those problems by using the __strtod_nan etc. functions recently
> > > >> +factored out of strtod etc. for that purpose, with those functions
> > > >> +being exported from libc at version GLIBC_PRIVATE.
> > > >> +
> > > >> +Tested for x86_64, x86, mips64 and powerpc.
> > > >> +
> > > >> +    [BZ #16961]
> > > >> +    [BZ #16962]
> > > >> +    * math/s_nan.c (__nan): Use __strtod_nan instead of construct=
ing a
> > > >> +    string on the stack for strtod.
> > > >> +    * math/s_nanf.c (__nanf): Use __strtof_nan instead of constru=
cting
> > > >> +    a string on the stack for strtof.
> > > >> +    * math/s_nanl.c (__nanl): Use __strtold_nan instead of
> > > >> +    constructing a string on the stack for strtold.
> > > >> +    * stdlib/Versions (libc): Add __strtof_nan, __strtod_nan and
> > > >> +    __strtold_nan to GLIBC_PRIVATE.
> > > >> +    * math/test-nan-overflow.c: New file.
> > > >> +    * math/test-nan-payload.c: Likewise.
> > > >> +    * math/Makefile (tests): Add test-nan-overflow and
> > > >> +    test-nan-payload.
> > > >> +
> > > >> +Upstream-Status: Backport
> > > >> +CVE: CVE-2015-9761 patch #2
> > > >> +[Yocto # 8980]
> > > >> +
> > > >> +
> > > https://sourceware.org/git/gitweb.cgi?p=3Dglibc.git;h=3D8f5e8b01a1da2=
a207228f2072c934fa5918554b8
> > > >> +
> > > >> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> > > >> +
> > > >> +---
> > > >> + ChangeLog                |  17 +++++++
> > > >> + NEWS                     |   6 +++
> > > >> + math/Makefile            |   3 +-
> > > >> + math/s_nan.c             |   9 +---
> > > >> + math/s_nanf.c            |   9 +---
> > > >> + math/s_nanl.c            |   9 +---
> > > >> + math/test-nan-overflow.c |  66 +++++++++++++++++++++++++
> > > >> + math/test-nan-payload.c  | 122
> > > +++++++++++++++++++++++++++++++++++++++++++++++
> > > >> + stdlib/Versions          |   1 +
> > > >> + 9 files changed, 217 insertions(+), 25 deletions(-)
> > > >> + create mode 100644 math/test-nan-overflow.c
> > > >> + create mode 100644 math/test-nan-payload.c
> > > >> +
> > > >> +Index: git/ChangeLog
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- git.orig/ChangeLog
> > > >> ++++ git/ChangeLog
> > > >> +@@ -1,3 +1,20 @@
> > > >> ++2015-12-04  Joseph Myers  <joseph@codesourcery.com>
> > > >> ++
> > > >> ++   [BZ #16961]
> > > >> ++   [BZ #16962]
> > > >> ++   * math/s_nan.c (__nan): Use __strtod_nan instead of construct=
ing a
> > > >> ++   string on the stack for strtod.
> > > >> ++   * math/s_nanf.c (__nanf): Use __strtof_nan instead of constru=
cting
> > > >> ++   a string on the stack for strtof.
> > > >> ++   * math/s_nanl.c (__nanl): Use __strtold_nan instead of
> > > >> ++   constructing a string on the stack for strtold.
> > > >> ++   * stdlib/Versions (libc): Add __strtof_nan, __strtod_nan and
> > > >> ++   __strtold_nan to GLIBC_PRIVATE.
> > > >> ++   * math/test-nan-overflow.c: New file.
> > > >> ++   * math/test-nan-payload.c: Likewise.
> > > >> ++   * math/Makefile (tests): Add test-nan-overflow and
> > > >> ++   test-nan-payload.
> > > >> ++
> > > >> + 2015-11-24  Joseph Myers  <joseph@codesourcery.com>
> > > >> +
> > > >> +    * stdlib/strtod_nan.c: New file.
> > > >> +Index: git/NEWS
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- git.orig/NEWS
> > > >> ++++ git/NEWS
> > > >> +@@ -7,6 +7,12 @@ using `glibc' in the "product" field.
> > > >> +
> > > >> + Version 2.21
> > > >> +
> > > >> ++Security related changes:
> > > >> ++
> > > >> ++* The nan, nanf and nanl functions no longer have unbounded stack
> > > usage
> > > >> ++  depending on the length of the string passed as an argument to=
 the
> > > >> ++  functions.  Reported by Joseph Myers.
> > > >> ++
> > > >> + * The following bugs are resolved with this release:
> > > >> +
> > > >> +   6652, 10672, 12674, 12847, 12926, 13862, 14132, 14138, 14171, =
14498,
> > > >> +Index: git/math/s_nan.c
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- git.orig/math/s_nan.c
> > > >> ++++ git/math/s_nan.c
> > > >> +@@ -28,14 +28,7 @@
> > > >> + double
> > > >> + __nan (const char *tagp)
> > > >> + {
> > > >> +-  if (tagp[0] !=3D '\0')
> > > >> +-    {
> > > >> +-      char buf[6 + strlen (tagp)];
> > > >> +-      sprintf (buf, "NAN(%s)", tagp);
> > > >> +-      return strtod (buf, NULL);
> > > >> +-    }
> > > >> +-
> > > >> +-  return NAN;
> > > >> ++  return __strtod_nan (tagp, NULL, 0);
> > > >> + }
> > > >> + weak_alias (__nan, nan)
> > > >> + #ifdef NO_LONG_DOUBLE
> > > >> +Index: git/math/s_nanf.c
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- git.orig/math/s_nanf.c
> > > >> ++++ git/math/s_nanf.c
> > > >> +@@ -28,13 +28,6 @@
> > > >> + float
> > > >> + __nanf (const char *tagp)
> > > >> + {
> > > >> +-  if (tagp[0] !=3D '\0')
> > > >> +-    {
> > > >> +-      char buf[6 + strlen (tagp)];
> > > >> +-      sprintf (buf, "NAN(%s)", tagp);
> > > >> +-      return strtof (buf, NULL);
> > > >> +-    }
> > > >> +-
> > > >> +-  return NAN;
> > > >> ++  return __strtof_nan (tagp, NULL, 0);
> > > >> + }
> > > >> + weak_alias (__nanf, nanf)
> > > >> +Index: git/math/s_nanl.c
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- git.orig/math/s_nanl.c
> > > >> ++++ git/math/s_nanl.c
> > > >> +@@ -28,13 +28,6 @@
> > > >> + long double
> > > >> + __nanl (const char *tagp)
> > > >> + {
> > > >> +-  if (tagp[0] !=3D '\0')
> > > >> +-    {
> > > >> +-      char buf[6 + strlen (tagp)];
> > > >> +-      sprintf (buf, "NAN(%s)", tagp);
> > > >> +-      return strtold (buf, NULL);
> > > >> +-    }
> > > >> +-
> > > >> +-  return NAN;
> > > >> ++  return __strtold_nan (tagp, NULL, 0);
> > > >> + }
> > > >> + weak_alias (__nanl, nanl)
> > > >> +Index: git/math/test-nan-overflow.c
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- /dev/null
> > > >> ++++ git/math/test-nan-overflow.c
> > > >> +@@ -0,0 +1,66 @@
> > > >> ++/* Test nan functions stack overflow (bug 16962).
> > > >> ++   Copyright (C) 2015 Free Software Foundation, Inc.
> > > >> ++   This file is part of the GNU C Library.
> > > >> ++
> > > >> ++   The GNU C Library is free software; you can redistribute it a=
nd/or
> > > >> ++   modify it under the terms of the GNU Lesser General Public
> > > >> ++   License as published by the Free Software Foundation; either
> > > >> ++   version 2.1 of the License, or (at your option) any later ver=
sion.
> > > >> ++
> > > >> ++   The GNU C Library is distributed in the hope that it will be
> > > useful,
> > > >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=
 GNU
> > > >> ++   Lesser General Public License for more details.
> > > >> ++
> > > >> ++   You should have received a copy of the GNU Lesser General Pub=
lic
> > > >> ++   License along with the GNU C Library; if not, see
> > > >> ++   <http://www.gnu.org/licenses/>.  */
> > > >> ++
> > > >> ++#include <math.h>
> > > >> ++#include <stdio.h>
> > > >> ++#include <string.h>
> > > >> ++#include <sys/resource.h>
> > > >> ++
> > > >> ++#define STACK_LIM 1048576
> > > >> ++#define STRING_SIZE (2 * STACK_LIM)
> > > >> ++
> > > >> ++static int
> > > >> ++do_test (void)
> > > >> ++{
> > > >> ++  int result =3D 0;
> > > >> ++  struct rlimit lim;
> > > >> ++  getrlimit (RLIMIT_STACK, &lim);
> > > >> ++  lim.rlim_cur =3D STACK_LIM;
> > > >> ++  setrlimit (RLIMIT_STACK, &lim);
> > > >> ++  char *nanstr =3D malloc (STRING_SIZE);
> > > >> ++  if (nanstr =3D=3D NULL)
> > > >> ++    {
> > > >> ++      puts ("malloc failed, cannot test");
> > > >> ++      return 77;
> > > >> ++    }
> > > >> ++  memset (nanstr, '0', STRING_SIZE - 1);
> > > >> ++  nanstr[STRING_SIZE - 1] =3D 0;
> > > >> ++#define NAN_TEST(TYPE, FUNC)                       \
> > > >> ++  do                                               \
> > > >> ++    {                                              \
> > > >> ++      char *volatile p =3D nanstr;           \
> > > >> ++      volatile TYPE v =3D FUNC (p);          \
> > > >> ++      if (isnan (v))                               \
> > > >> ++   puts ("PASS: " #FUNC);                  \
> > > >> ++      else                                 \
> > > >> ++   {                                       \
> > > >> ++     puts ("FAIL: " #FUNC);                \
> > > >> ++     result =3D 1;                           \
> > > >> ++   }                                       \
> > > >> ++    }                                              \
> > > >> ++  while (0)
> > > >> ++  NAN_TEST (float, nanf);
> > > >> ++  NAN_TEST (double, nan);
> > > >> ++#ifndef NO_LONG_DOUBLE
> > > >> ++  NAN_TEST (long double, nanl);
> > > >> ++#endif
> > > >> ++  return result;
> > > >> ++}
> > > >> ++
> > > >> ++#define TEST_FUNCTION do_test ()
> > > >> ++#include "../test-skeleton.c"
> > > >> +Index: git/math/test-nan-payload.c
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- /dev/null
> > > >> ++++ git/math/test-nan-payload.c
> > > >> +@@ -0,0 +1,122 @@
> > > >> ++/* Test nan functions payload handling (bug 16961).
> > > >> ++   Copyright (C) 2015 Free Software Foundation, Inc.
> > > >> ++   This file is part of the GNU C Library.
> > > >> ++
> > > >> ++   The GNU C Library is free software; you can redistribute it a=
nd/or
> > > >> ++   modify it under the terms of the GNU Lesser General Public
> > > >> ++   License as published by the Free Software Foundation; either
> > > >> ++   version 2.1 of the License, or (at your option) any later ver=
sion.
> > > >> ++
> > > >> ++   The GNU C Library is distributed in the hope that it will be
> > > useful,
> > > >> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > >> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=
 GNU
> > > >> ++   Lesser General Public License for more details.
> > > >> ++
> > > >> ++   You should have received a copy of the GNU Lesser General Pub=
lic
> > > >> ++   License along with the GNU C Library; if not, see
> > > >> ++   <http://www.gnu.org/licenses/>.  */
> > > >> ++
> > > >> ++#include <float.h>
> > > >> ++#include <math.h>
> > > >> ++#include <stdio.h>
> > > >> ++#include <stdlib.h>
> > > >> ++#include <string.h>
> > > >> ++
> > > >> ++/* Avoid built-in functions.  */
> > > >> ++#define WRAP_NAN(FUNC, STR) \
> > > >> ++  ({ const char *volatile wns =3D (STR); FUNC (wns); })
> > > >> ++#define WRAP_STRTO(FUNC, STR) \
> > > >> ++  ({ const char *volatile wss =3D (STR); FUNC (wss, NULL); })
> > > >> ++
> > > >> ++#define CHECK_IS_NAN(TYPE, A)                      \
> > > >> ++  do                                               \
> > > >> ++    {                                              \
> > > >> ++      if (isnan (A))                               \
> > > >> ++   puts ("PASS: " #TYPE " " #A);           \
> > > >> ++      else                                 \
> > > >> ++   {                                       \
> > > >> ++     puts ("FAIL: " #TYPE " " #A);         \
> > > >> ++     result =3D 1;                           \
> > > >> ++   }                                       \
> > > >> ++    }                                              \
> > > >> ++  while (0)
> > > >> ++
> > > >> ++#define CHECK_SAME_NAN(TYPE, A, B)                 \
> > > >> ++  do                                                       \
> > > >> ++    {                                                      \
> > > >> ++      if (memcmp (&(A), &(B), sizeof (A)) =3D=3D 0)            \
> > > >> ++   puts ("PASS: " #TYPE " " #A " =3D " #B);          \
> > > >> ++      else                                         \
> > > >> ++   {                                               \
> > > >> ++     puts ("FAIL: " #TYPE " " #A " =3D " #B);        \
> > > >> ++     result =3D 1;                                   \
> > > >> ++   }                                               \
> > > >> ++    }                                                      \
> > > >> ++  while (0)
> > > >> ++
> > > >> ++#define CHECK_DIFF_NAN(TYPE, A, B)                 \
> > > >> ++  do                                                       \
> > > >> ++    {                                                      \
> > > >> ++      if (memcmp (&(A), &(B), sizeof (A)) !=3D 0)            \
> > > >> ++   puts ("PASS: " #TYPE " " #A " !=3D " #B);         \
> > > >> ++      else                                         \
> > > >> ++   {                                               \
> > > >> ++     puts ("FAIL: " #TYPE " " #A " !=3D " #B);       \
> > > >> ++     result =3D 1;                                   \
> > > >> ++   }                                               \
> > > >> ++    }                                                      \
> > > >> ++  while (0)
> > > >> ++
> > > >> ++/* Cannot test payloads by memcmp for formats where NaNs have pa=
dding
> > > >> ++   bits.  */
> > > >> ++#define CAN_TEST_EQ(MANT_DIG) ((MANT_DIG) !=3D 64 && (MANT_DIG) =
!=3D 106)
> > > >> ++
> > > >> ++#define RUN_TESTS(TYPE, SFUNC, FUNC, MANT_DIG)             \
> > > >> ++  do                                                       \
> > > >> ++    {                                                      \
> > > >> ++     TYPE n123 =3D WRAP_NAN (FUNC, "123");           \
> > > >> ++     CHECK_IS_NAN (TYPE, n123);                            \
> > > >> ++     TYPE s123 =3D WRAP_STRTO (SFUNC, "NAN(123)");   \
> > > >> ++     CHECK_IS_NAN (TYPE, s123);                            \
> > > >> ++     TYPE n456 =3D WRAP_NAN (FUNC, "456");           \
> > > >> ++     CHECK_IS_NAN (TYPE, n456);                            \
> > > >> ++     TYPE s456 =3D WRAP_STRTO (SFUNC, "NAN(456)");   \
> > > >> ++     CHECK_IS_NAN (TYPE, s456);                            \
> > > >> ++     TYPE n123x =3D WRAP_NAN (FUNC, "123)");         \
> > > >> ++     CHECK_IS_NAN (TYPE, n123x);                   \
> > > >> ++     TYPE nemp =3D WRAP_NAN (FUNC, "");                      \
> > > >> ++     CHECK_IS_NAN (TYPE, nemp);                            \
> > > >> ++     TYPE semp =3D WRAP_STRTO (SFUNC, "NAN()");              \
> > > >> ++     CHECK_IS_NAN (TYPE, semp);                            \
> > > >> ++     TYPE sx =3D WRAP_STRTO (SFUNC, "NAN");          \
> > > >> ++     CHECK_IS_NAN (TYPE, sx);                              \
> > > >> ++     if (CAN_TEST_EQ (MANT_DIG))                   \
> > > >> ++       CHECK_SAME_NAN (TYPE, n123, s123);          \
> > > >> ++     if (CAN_TEST_EQ (MANT_DIG))                   \
> > > >> ++       CHECK_SAME_NAN (TYPE, n456, s456);          \
> > > >> ++     if (CAN_TEST_EQ (MANT_DIG))                   \
> > > >> ++       CHECK_SAME_NAN (TYPE, nemp, semp);          \
> > > >> ++     if (CAN_TEST_EQ (MANT_DIG))                   \
> > > >> ++       CHECK_SAME_NAN (TYPE, n123x, sx);           \
> > > >> ++     CHECK_DIFF_NAN (TYPE, n123, n456);                    \
> > > >> ++     CHECK_DIFF_NAN (TYPE, n123, nemp);                    \
> > > >> ++     CHECK_DIFF_NAN (TYPE, n123, n123x);           \
> > > >> ++     CHECK_DIFF_NAN (TYPE, n456, nemp);                    \
> > > >> ++     CHECK_DIFF_NAN (TYPE, n456, n123x);           \
> > > >> ++    }                                                      \
> > > >> ++  while (0)
> > > >> ++
> > > >> ++static int
> > > >> ++do_test (void)
> > > >> ++{
> > > >> ++  int result =3D 0;
> > > >> ++  RUN_TESTS (float, strtof, nanf, FLT_MANT_DIG);
> > > >> ++  RUN_TESTS (double, strtod, nan, DBL_MANT_DIG);
> > > >> ++#ifndef NO_LONG_DOUBLE
> > > >> ++  RUN_TESTS (long double, strtold, nanl, LDBL_MANT_DIG);
> > > >> ++#endif
> > > >> ++  return result;
> > > >> ++}
> > > >> ++
> > > >> ++#define TEST_FUNCTION do_test ()
> > > >> ++#include "../test-skeleton.c"
> > > >> +Index: git/stdlib/Versions
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- git.orig/stdlib/Versions
> > > >> ++++ git/stdlib/Versions
> > > >> +@@ -118,5 +118,6 @@ libc {
> > > >> +     # Used from other libraries
> > > >> +     __libc_secure_getenv;
> > > >> +     __call_tls_dtors;
> > > >> ++    __strtof_nan; __strtod_nan; __strtold_nan;
> > > >> +   }
> > > >> + }
> > > >> +Index: git/math/Makefile
> > > >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >> +--- git.orig/math/Makefile
> > > >> ++++ git/math/Makefile
> > > >> +@@ -92,7 +92,9 @@ tests =3D test-matherr test-fenv atest-exp
> > > >> +    test-misc test-fpucw test-fpucw-ieee tst-definitions test-tgm=
ath \
> > > >> +    test-tgmath-ret bug-nextafter bug-nexttoward bug-tgmath1 \
> > > >> +    test-tgmath-int test-tgmath2 test-powl tst-CMPLX tst-CMPLX2
> > > test-snan \
> > > >> +-   test-fenv-tls test-fenv-preserve test-fenv-return $(tests-sta=
tic)
> > > >> ++   test-fenv-tls test-fenv-preserve test-fenv-return \
> > > >> ++    test-nan-overflow test-nan-payload \
> > > >> ++    $(tests-static)
> > > >> + tests-static =3D test-fpucw-static test-fpucw-ieee-static
> > > >> + # We do the `long double' tests only if this data type is availa=
ble
> > > and
> > > >> + # distinct from `double'.
> > > >> diff --git a/meta/recipes-core/glibc/glibc_2.20.bb
> > > b/meta/recipes-core/glibc/glibc_2.20.bb
> > > >> index af568d9..d099d5d 100644
> > > >> --- a/meta/recipes-core/glibc/glibc_2.20.bb
> > > >> +++ b/meta/recipes-core/glibc/glibc_2.20.bb
> > > >> @@ -50,6 +50,8 @@ CVEPATCHES =3D "\
> > > >>          file://CVE-2015-7547.patch \
> > > >>          file://CVE-2015-8777.patch \
> > > >>          file://CVE-2015-8779.patch \
> > > >> +        file://CVE-2015-9761_1.patch \
> > > >> +        file://CVE-2015-9761_2.patch \
> > > >>  "
> > > >>
> > > >>  LIC_FILES_CHKSUM =3D
> > > "file://LICENSES;md5=3De9a558e243b36d3209f380deb394b213 \
> > > >> --
> > > >> 2.3.5
> > > >>
> > > >> --
> > > >> _______________________________________________
> > > >> Openembedded-core mailing list
> > > >> Openembedded-core@lists.openembedded.org
> > > >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > > >
> > >
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--u5E4XgoOPWr4PD9E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbq0a8ACgkQN1Ujt2V2gBx3CwCfcy/V64IWk5lo65zPvwPEO2OP
9pgAoIgcUefTRV89bIP+X03oBbHksS6z
=e7/2
-----END PGP SIGNATURE-----

--u5E4XgoOPWr4PD9E--
