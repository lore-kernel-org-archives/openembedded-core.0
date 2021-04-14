Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.17139.1618422818757994531
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 10:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U5lhFw0f;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id d23so10259542qko.12
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Apr 2021 10:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P58N6R2Swqu7TAOdW5THN3R+MgyYYmgrFrednPeq3do=;
        b=U5lhFw0fAtonNYg8FKop6TrAnbodT9eGGj2ypvSub8m/Wsc7it/leCjqxcH7uZPEW9
         e/UzvI42r2OlngwNNJvqsrwItaM0cKD9aDYM27YP9JKKqWxYXkmGV9L2bY0b8ORyXhGL
         JVvfDpHcAUwryYdYtEIXTZKA2Ft2QV5tPr3CsBCr/HqeCw+meCfpNOuk2a+OIrWxPcH0
         UCgbnbJhUUCSLsFR1sbBgGnngd5cVl/HSsyV8Sgu2KGSFgdfC0beqFA/6dvf5ugsHJXg
         UVAsDzLYF0Tkmb8oJOIQ2uwiPN/b/ldE6P2nZXVy7ry2bIBWw7wMSOQ9DsL/Bp3VDbAF
         lEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P58N6R2Swqu7TAOdW5THN3R+MgyYYmgrFrednPeq3do=;
        b=QD8A47Mp3VAFd2tTY70+zmQmVfOFGbJ0HceGqTtI2kMLNZo+Et/R5OS0gJfvWBwfgd
         Bn30tbgiIYzmZJS1AicXBkLlRyQ8gE/7SnUd2okln+CjOjgqRF7ZUivotanxtl3BMTVr
         MGvp/1VIz/3If999PBRhnjgJbYcIvF2QtMG2ax+CuNguXaEOf9trDkByaClDPvF0igDz
         2/rXS/A+vXGkPfoc+cqN95dsO/ESxtk/AM6TJ2p+cTHUYsoqmmWtpnHHQ6uRAlCNZw8A
         vkCbY100uzF85trqiuF2BqcUaVJb+QanloOzqgRkLRbtIodKEMh6ELxxlnIHrNL67wIR
         k1Fg==
X-Gm-Message-State: AOAM530wJw8SRXO1Wsq3cq5Jy8CuP1M8Lp2nN2YXXrevUzEYLsT7Beii
	PHHNsXc4/oRXD6bCtLPeK8gabTqCohEpeJXbWOw=
X-Google-Smtp-Source: ABdhPJwpqQkao29qePIJVFqHGQ4PX4CAz1WA+bAIAyGsnK3fA5avH2uoFGylLON0Tr6Sy89BIlImbdcnyaizHA0AuHQ=
X-Received: by 2002:a37:8c4:: with SMTP id 187mr13434693qki.125.1618422817710;
 Wed, 14 Apr 2021 10:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210413092432.3688149-1-krellan@google.com> <a15e36dd1ef45bba25c2f7ca78ce17110d767723.camel@linuxfoundation.org>
 <CANPkJS9XmUp1FqKLJDXT8gdJBWPM13k-Rx0vn+bf4B9ijw--Yg@mail.gmail.com>
 <CANNYZj9heipn=vQ0W1ca6ggSij8xU_Wvf4yKzFqAmYh=SSoUEQ@mail.gmail.com>
 <CANNYZj9AjWNbAcXuKShuHe1iKfamM2p80M38Pt2hBVTXV-khMQ@mail.gmail.com>
 <CANPkJS_KLvz2Ym9wDObKyGzOuajLxdNri_9WSGKo7POys-5OTA@mail.gmail.com>
 <CANNYZj-cq4QDHTJwGi3NozsuNMa5UQwHWs-FnE9FczYPTPQO8Q@mail.gmail.com> <CAPnigKkpgAqXG02an=hJhZnywpUQ8AdSXrNUEzb1gYrj4OAgcA@mail.gmail.com>
In-Reply-To: <CAPnigKkpgAqXG02an=hJhZnywpUQ8AdSXrNUEzb1gYrj4OAgcA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 14 Apr 2021 10:53:11 -0700
Message-ID: <CAMKF1srPeOZTfvFL8zytMs2u--1S3jQDLf1CPRucFaedQvP=VQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxcb: Add inherit python3native
To: "William A. Kennington III" <wak@google.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Josh Lehan <krellan@google.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, Ross Burton <ross@burtonini.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 2:55 AM William A. Kennington III via
lists.openembedded.org <wak=3Dgoogle.com@lists.openembedded.org> wrote:
>
> It's correct because the package it depends on (xcb-proto-native) is
> already `inherit python3native`. This package's xcbgen invocation is
> broken because it is using a combination of files generated for native
> python but executed through host python (look at the site-packages
> version). It can't bloat our dependency tree any more as it already
> implicitly depends on python3-native.

I tend to agree. Although this makes me think if we have more such mix
and match happening elsewhere too
in that case, would it be better to always use a captured version of
python3 on native build hosts and ignore distro
version of python3 always something like buildtools-tarball should
then become mandatory.

>
> On Wed, Apr 14, 2021 at 12:25 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > As a matter of policy, yocto recipes default to using python from the =
host, and are only switched to native python when there host python does no=
t come with needed 3rd party modules (which are then pulled in via -native =
DEPENDS), or there is some other issue that cannot be resolved with host py=
thon. Native python dependency lengthens the dependency chains, which is es=
pecially critical for -native recipes.
> >
> > In this case, the problem is that libxcb in your build is too old for =
the latest python 3.9, so you need to either update libxcb or backport an u=
pstream fix to make it work with 3.9 again. Your patch would not resolve th=
e issue, as native python in latest oe-core  master is also 3.9, and the fa=
ilure would be the same.
> >
> > Alex
> >
> > On Wed, 14 Apr 2021 at 07:15, Josh Lehan <krellan@google.com> wrote:
> >>
> >> Thanks. It's true, my local build is a little bit outdated. I'm runni=
ng OpenBMC and it's slightly behind the latest upstream master. For now, it=
 is still compiling with Python 3.8.
> >>
> >> However, there is the same underlying problem, even if I upgraded. It=
 looks like the version of Python on the build machine is wrongly leaking i=
nto the build, and it's being used instead of the oe-core preferred version=
 of Python. Ideally, the locally-installed Python wouldn't influence the ou=
tcome of the build, as oe-core has its own Python that it should prefer to =
use instead, as it does for other packages. This is what "inherit python3na=
tive" enables, right? Otherwise, the problem will happen again in the futur=
e, whenever somebody wants to try out a new Python version on their machine=
. The idea is to obtain some separation, for safety, and to help ensure a c=
lean reproducible build. It's a good practice, I think, to minimize the opp=
ortunities for local variance to creep into the build.
> >>
> >> As for "from fractions import gcd" becoming an error in 3.9, there wa=
s this change: https://bugs.python.org/issue39350
> >>
> >> It appears fractions.gcd was deprecated for a while. It was moved to =
math.gcd a while ago, and deprecated, but not deleted entirely until Python=
 3.9. So, that's why it works in 3.8 (what my old oe-core build is running)=
, but not in 3.9 (what my local distribution is running).
> >>
> >> Josh
> >>
> >> Josh Lehan | Software Engineer | krellan@google.com | +1 650-733-8941
> >>
> >>
> >>
> >> On Tue, Apr 13, 2021 at 1:08 PM Alexander Kanavin <alex.kanavin@gmail=
.com> wrote:
> >>>
> >>> Also note: oe-core master already has 3.9, so you need to find out w=
hy '3.8' shows up in install paths as well. Something doesn't compute here.
> >>>
> >>> Alex
> >>>
> >>> On Tue, 13 Apr 2021 at 22:07, Alexander Kanavin <alex.kanavin@gmail.=
com> wrote:
> >>>>
> >>>> I think you need to dig a little deeper. Why 'from fractions import=
 gcd' is a problem with host python3.9 but not a problem with native python=
 3.9?
> >>>>
> >>>> Alex
> >>>>
> >>>> On Tue, 13 Apr 2021 at 20:58, Josh Lehan via lists.openembedded.org=
 <krellan=3Dgoogle.com@lists.openembedded.org> wrote:
> >>>>>
> >>>>> Hi there, thanks. I'm not entirely sure what "python3native" does =
exactly, but this is my observation. The problem we are seeing is that, wit=
hout "inherit python3native", the build machine's local Python version (wha=
tever it happens to be) takes precedence over the Yocto-included Python ver=
sion. In our case, the build machine is running Python 3.9, and evidently s=
omething changed between Python 3.8 and Python 3.9 to be incompatible with =
libxcb. Here's the error message:
> >>>>>
> >>>>> Failed to load the xcbgen Python package!
> >>>>> Make sure that xcb/proto installed it on your Python path.
> >>>>> If not, you will need to create a .pth file or define $PYTHONPATH
> >>>>> to extend the path.
> >>>>> Refer to the README file in xcb/proto for more info.
> >>>>>
> >>>>> Traceback (most recent call last):
> >>>>>   File "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0=
/build/src/../../libxcb-1.14/src/c_client.py", line 3338, in <module>
> >>>>>     from xcbgen.state import Module
> >>>>>   File "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0=
/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-pa=
ckages/xcbgen/state.py", line 7, in <module>
> >>>>>     from xcbgen import matcher
> >>>>>   File "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0=
/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-pa=
ckages/xcbgen/matcher.py", line 12, in <module>
> >>>>>     from xcbgen.xtypes import *
> >>>>>   File "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0=
/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-pa=
ckages/xcbgen/xtypes.py", line 5, in <module>
> >>>>>     from xcbgen.align import Alignment, AlignmentLog
> >>>>>   File "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0=
/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-pa=
ckages/xcbgen/align.py", line 5, in <module>
> >>>>>     from fractions import gcd
> >>>>> ImportError: cannot import name 'gcd' from 'fractions' (/usr/lib/p=
ython3.9/fractions.py)
> >>>>>
> >>>>> The above error text repeats for many of the files it tries to com=
pile within libxcb.
> >>>>>
> >>>>> In general, it seems the safest approach is to standardize on a Py=
thon version that's known to work, without depending on whatever version of=
 Python the developer has installed locally on their build machine (which c=
an vary due to distribution, developer's preference, and so on).
> >>>>>
> >>>>> Josh
> >>>>>
> >>>>> Josh Lehan | Software Engineer | krellan@google.com | +1 650-733-8=
941
> >>>>>
> >>>>>
> >>>>>
> >>>>> On Tue, Apr 13, 2021 at 2:45 AM Richard Purdie <richard.purdie@lin=
uxfoundation.org> wrote:
> >>>>>>
> >>>>>> On Tue, 2021-04-13 at 02:24 -0700, Josh Lehan via lists.openembed=
ded.org wrote:
> >>>>>> > During compilation, the local Python environment leaks into
> >>>>>> > the Bitbake build. Adding "inherit python3native" fixes this.
> >>>>>> >
> >>>>>> > Signed-off-by: Josh Lehan <krellan@google.com>
> >>>>>> > ---
> >>>>>> >  meta/recipes-graphics/xorg-lib/libxcb_1.14.bb | 1 +
> >>>>>> >  1 file changed, 1 insertion(+)
> >>>>>> >
> >>>>>> > diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb b/me=
ta/recipes-graphics/xorg-lib/libxcb_1.14.bb
> >>>>>> > index f0a223a19c..40c7b1cc3c 100644
> >>>>>> > --- a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
> >>>>>> > +++ b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
> >>>>>> > @@ -24,6 +24,7 @@ PACKAGES_DYNAMIC =3D "^${PN}-.*"
> >>>>>> >  FILES_${PN} =3D "${libdir}/libxcb.so.*"
> >>>>>> >
> >>>>>> >  inherit autotools pkgconfig features_check
> >>>>>> > +inherit python3native
> >>>>>> >
> >>>>>>
> >>>>>>
> >>>>>> Could you provide a little more information about how this is bre=
aking things?
> >>>>>>
> >>>>>> Whilst python is used by the libxcb build, I believe it shouldn't=
 change the
> >>>>>> output, it doesn't in our reproducibity tests.
> >>>>>>
> >>>>>> Adding a python-native dependency does slow the build down a bit =
so if we
> >>>>>> don't need it, it would be good to avoid it.
> >>>>>>
> >>>>>> Cheers,
> >>>>>>
> >>>>>> Richard
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>
> >>>>>
> >>>>>
> >
> >
> >
>
>=20
>
