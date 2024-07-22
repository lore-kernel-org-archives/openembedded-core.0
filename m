Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E64BC3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 14:18:35 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.19285.1721657908448350852
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jul 2024 07:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B/D4/Wcn;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-25e3d388580so2377269fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 07:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721657908; x=1722262708; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V04wCpOPWuxEn74Aa3zQhepFAGLbddtAGDndV6hoGDE=;
        b=B/D4/WcnPVcdICFDCgcyqZ0ioCiLdjPMsw0KtV9b4aIMTS11z2+cBHecVNV5c6Zbqt
         Z0Ac6wQd/xtm95ZXyLPp63anQsHcwZmNTsGgDx0fLR8C6wR2qNdH+XiOXuRynUQr/ycz
         gh9CONZrjd6nUWImIO8aKIUcT1+2EGa56PrFqS/rMKeij6kal27mVsh8fd8rI+iqhouc
         eST+lsOeJuoqkhosdXMSCyQdhzQL2YQiJEBsC4TS7WldBlGwK2cCwXAglPPCmFbk2jII
         ZND+D99koscG6g+jAilSeouAlTSE7wZexuBQYOXdUpEm3FVj7+oLseGY/LyMVoB4rCQr
         fCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721657908; x=1722262708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V04wCpOPWuxEn74Aa3zQhepFAGLbddtAGDndV6hoGDE=;
        b=sKv1xojK/sAWndBj1Jbyrx3Mz8MgsiOXljeFSAQkBMGVMCROALXP3HzZId0hgl9QRY
         r3ytUFgiEfe2Y2AQ65kgmi0P2phjvggywbJXqnVz2v2/8hfWQlV3AZlmB7zMLwl/EXM9
         ULxuGBzP5SCf6pbhb4PEL4VqyuA2bxxLFhNUbaQOpGQ38TBr7lojxqLUzACl7yqJ9aQW
         jKiNVD9jOlDl35PM92eRBZN0ccmK8CasFSrLND2lEPOxyZnZH67h8GOu0Ya/lt+YQAIQ
         C+qZXOhBeucIberviIWxJVVXEaOu7PBRX10ukpOLbMjOL9HGGzUNUV9Ak4InLoF8kEaS
         zCWg==
X-Gm-Message-State: AOJu0YwnoYEv8d9tlTHFSNEV/YCI5IZ7fmoN6dN5ok0hYXR5SLmyaGgf
	UDDzw2xLQPgKHo3HDmlLGxOJsX18SFFRWU0RalTtQgBWP4KmQQIps1GkFmiCrBZWYBjwI9ihbuP
	YwgDu4qkkFck2qGqo/28kUj2OVE4=
X-Google-Smtp-Source: AGHT+IGW029l2WMTqgxednidVduKtVfObMA8Cl8OERRvEscfgfrqXF1/zfckwPTK+adSMI8Np23d2VVrjOLYmqJw/LA=
X-Received: by 2002:a05:6870:4706:b0:261:12a8:5b69 with SMTP id
 586e51a60fabf-263ab42d546mr6246295fac.18.1721657907637; Mon, 22 Jul 2024
 07:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240721180336.2642270-1-raj.khem@gmail.com> <f4d52025ba8c00ceaf60819d21ebf62532e8b535.camel@linuxfoundation.org>
In-Reply-To: <f4d52025ba8c00ceaf60819d21ebf62532e8b535.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Jul 2024 07:18:17 -0700
Message-ID: <CAMKF1sroJs_73HtyVYszWog2dr3zrUgsJqmF5+SourfUcg9+ow@mail.gmail.com>
Subject: Re: [OE-core] [RFT][PATCH 1/2] glibc: Upgrade to 2.40
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000002762c061dd6b8e8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 14:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202313

--00000000000002762c061dd6b8e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 2:22=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2024-07-21 at 11:03 -0700, Khem Raj via lists.openembedded.org
> wrote:
> > Major new features:
> >
> > * The <stdbit.h> header type-generic macros have been changed when usin=
g
> >   GCC 14.1 or later to use __builtin_stdc_bit_ceil etc. built-in
> functions
> >   in order to support unsigned __int128 and/or unsigned _BitInt(N)
> operands
> >   with arbitrary precisions when supported by the target.
> >
> > * The GNU C Library now supports a feature test macro _ISOC23_SOURCE to
> >   enable features from the ISO C23 standard.  Only some features from
> >   this standard are supported by the GNU C Library.  The older name
> >   _ISOC2X_SOURCE is still supported.  Features from C23 are also enable=
d
> >   by _GNU_SOURCE, or by compiling with the GCC options -std=3Dc23,
> >   -std=3Dgnu23, -std=3Dc2x or -std=3Dgnu2x.
> >
> > * The following ISO C23 function families (introduced in TS
> >   18661-4:2015) are now supported in <math.h>.  Each family includes
> >   functions for float, double, long double, _FloatN and _FloatNx, and a
> >   type-generic macro in <tgmath.h>.
> >
> >   - Exponential functions: exp2m1, exp10m1.
> >
> >   - Logarithmic functions: log2p1, log10p1, logp1.
> >
> > * A new tunable, glibc.rtld.enable_secure, can be used to run a program
> >   as if it were a setuid process. This is currently a testing tool to
> allow
> >   more extensive verification tests for AT_SECURE programs and not mean=
t
> to
> >   be a security feature.
> >
> > * On Linux, the epoll header was updated to include epoll ioctl
> definitions
> >   and the related structure added in Linux kernel 6.9.
> >
> > * The fortify functionality has been significantly enhanced for buildin=
g
> >   programs with clang against the GNU C Library.
> >
> > * Many functions have been added to the vector library for aarch64:
> >     acosh, asinh, atanh, cbrt, cosh, erf, erfc, hypot, pow, sinh, tanh
> >
> > * On x86, memset can now use non-temporal stores to improve the
> performance
> >   of large writes. This behaviour is controlled by a new tunable
> >   x86_memset_non_temporal_threshold.
> >
> > Deprecated and removed features, and other changes affecting
> compatibility:
> >
> > * Architectures which use a 32-bit seconds-since-epoch field in struct
> >   lastlog, struct utmp, struct utmpx (such as i386, powerpc64le, rv32,
> >   rv64, x86-64) switched from a signed to an unsigned type for that
> >   field.  This allows these fields to store timestamps beyond the year
> >   2038, until the year 2106.  Please note that applications are still
> >   expected to migrate off the interfaces declared in <utmp.h> and
> >   <utmpx.h> (except for login_tty) due to locking and session managemen=
t
> >   problems.
> >
> > * __rseq_size now denotes the size of the active rseq area (20 bytes
> >   initially), not the size of struct rseq (32 bytes initially).
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Thanks Khem. I ran this through the autobuilder and there were only two
> failures. One expected as it tests the buildtools libc which doesn't
> work until we upgrade uninative. The other looks to be an intermittent
> qemuarm failure. From my perspective I think we're looking good to
> merge this!



Cool yeah and today the release also came out so I am not expecting to make
any more changes to the RFT series

>
>
> Cheers,
>
> Richard
>

--00000000000002762c061dd6b8e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jul 22, 2024 at 2:22=E2=80=AFAM Richard Purdie &lt;=
<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxf=
oundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sun=
, 2024-07-21 at 11:03 -0700, Khem Raj via <a href=3D"http://lists.openembed=
ded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wr=
ote:<br>
&gt; Major new features:<br>
&gt; <br>
&gt; * The &lt;stdbit.h&gt; header type-generic macros have been changed wh=
en using<br>
&gt; =C2=A0 GCC 14.1 or later to use __builtin_stdc_bit_ceil etc. built-in =
functions<br>
&gt; =C2=A0 in order to support unsigned __int128 and/or unsigned _BitInt(N=
) operands<br>
&gt; =C2=A0 with arbitrary precisions when supported by the target.<br>
&gt; <br>
&gt; * The GNU C Library now supports a feature test macro _ISOC23_SOURCE t=
o<br>
&gt; =C2=A0 enable features from the ISO C23 standard.=C2=A0 Only some feat=
ures from<br>
&gt; =C2=A0 this standard are supported by the GNU C Library.=C2=A0 The old=
er name<br>
&gt; =C2=A0 _ISOC2X_SOURCE is still supported.=C2=A0 Features from C23 are =
also enabled<br>
&gt; =C2=A0 by _GNU_SOURCE, or by compiling with the GCC options -std=3Dc23=
,<br>
&gt; =C2=A0 -std=3Dgnu23, -std=3Dc2x or -std=3Dgnu2x.<br>
&gt; <br>
&gt; * The following ISO C23 function families (introduced in TS<br>
&gt; =C2=A0 18661-4:2015) are now supported in &lt;math.h&gt;.=C2=A0 Each f=
amily includes<br>
&gt; =C2=A0 functions for float, double, long double, _FloatN and _FloatNx,=
 and a<br>
&gt; =C2=A0 type-generic macro in &lt;tgmath.h&gt;.<br>
&gt; <br>
&gt; =C2=A0 - Exponential functions: exp2m1, exp10m1.<br>
&gt; <br>
&gt; =C2=A0 - Logarithmic functions: log2p1, log10p1, logp1.<br>
&gt; <br>
&gt; * A new tunable, glibc.rtld.enable_secure, can be used to run a progra=
m<br>
&gt; =C2=A0 as if it were a setuid process. This is currently a testing too=
l to allow<br>
&gt; =C2=A0 more extensive verification tests for AT_SECURE programs and no=
t meant to<br>
&gt; =C2=A0 be a security feature.<br>
&gt; <br>
&gt; * On Linux, the epoll header was updated to include epoll ioctl defini=
tions<br>
&gt; =C2=A0 and the related structure added in Linux kernel 6.9.<br>
&gt; <br>
&gt; * The fortify functionality has been significantly enhanced for buildi=
ng<br>
&gt; =C2=A0 programs with clang against the GNU C Library.<br>
&gt; <br>
&gt; * Many functions have been added to the vector library for aarch64:<br=
>
&gt; =C2=A0=C2=A0=C2=A0 acosh, asinh, atanh, cbrt, cosh, erf, erfc, hypot, =
pow, sinh, tanh<br>
&gt; <br>
&gt; * On x86, memset can now use non-temporal stores to improve the perfor=
mance<br>
&gt; =C2=A0 of large writes. This behaviour is controlled by a new tunable<=
br>
&gt; =C2=A0 x86_memset_non_temporal_threshold.<br>
&gt; <br>
&gt; Deprecated and removed features, and other changes affecting compatibi=
lity:<br>
&gt; <br>
&gt; * Architectures which use a 32-bit seconds-since-epoch field in struct=
<br>
&gt; =C2=A0 lastlog, struct utmp, struct utmpx (such as i386, powerpc64le, =
rv32,<br>
&gt; =C2=A0 rv64, x86-64) switched from a signed to an unsigned type for th=
at<br>
&gt; =C2=A0 field.=C2=A0 This allows these fields to store timestamps beyon=
d the year<br>
&gt; =C2=A0 2038, until the year 2106.=C2=A0 Please note that applications =
are still<br>
&gt; =C2=A0 expected to migrate off the interfaces declared in &lt;utmp.h&g=
t; and<br>
&gt; =C2=A0 &lt;utmpx.h&gt; (except for login_tty) due to locking and sessi=
on management<br>
&gt; =C2=A0 problems.<br>
&gt; <br>
&gt; * __rseq_size now denotes the size of the active rseq area (20 bytes<b=
r>
&gt; =C2=A0 initially), not the size of struct rseq (32 bytes initially).<b=
r>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
<br>
Thanks Khem. I ran this through the autobuilder and there were only two<br>
failures. One expected as it tests the buildtools libc which doesn&#39;t<br=
>
work until we upgrade uninative. The other looks to be an intermittent<br>
qemuarm failure. From my perspective I think we&#39;re looking good to<br>
merge this!</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Cool yeah and today the release also came out so I a=
m not expecting to make any more changes to the RFT series=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--00000000000002762c061dd6b8e8--

