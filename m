Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.61.1592524644509968658
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 16:57:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=olyVKOhe;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id n11so7407214qkn.8
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 16:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hPycY9hEEfoKffW7C/CkyBPxF/aErTaDOLloen+jdl0=;
        b=olyVKOheNb6kdce5bLGFI+PBkDzF1WyBhb8hN7XQEG5C0zDBY7MNLPK00nfhhJHn7F
         6pJ2yqbz62dfMbllBc8IBeuerq7SvpeAM1ePiv3HSF3ZinaIE+SXTEsVthJNdzxzcMa+
         3E0b+zleO2DOqHRBUCnqikG+UeoDSAMAofhpCyRhuHwV+xVJzoL0l6vbGMZOrf4o3gpw
         mojgdLjVT4PCB+yMRax59QE5rgB1FFKXycfbuUKIJDQ0Ri/SrkVGMQla55+MfC7ppFgU
         m11RI0Iz7AHRamkp6IVjIJedkDDzw0Tfr3pVDvn82m54SmXfueFTbANhbodvnwfX8zB5
         7h2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hPycY9hEEfoKffW7C/CkyBPxF/aErTaDOLloen+jdl0=;
        b=a/86p8Xv9NSWklZR9QefRIfnbK0FWIPzbfLOAhpeMIXhrIbokrwW5vo1XwM/BiSaWK
         T6BrFTpHXtTIlVXgewbYPEDLNViz2aknI6o+XJxwJnm60zjG3UEr5STSGx/39VGD5BdG
         xRUcttER9cUeauRVOMEzVv/MQDYpOekNIIrjXS88r672BHb/L5XVFfM+AsCD0GjjZrwF
         b7eVT4Y9JMbS+QTa9yF3hioAWN5BGn1UI1bzoobPbfEE7ZV/RUefTL2yZ+8UWoXkkpDC
         UV6ZzPIguSSaF01cncpS8vK9HT/jUj7UUFuZkg8wvt4FhhDay8KvfH/rLbaLzK2GQdDA
         7+qg==
X-Gm-Message-State: AOAM533yKnKhMh01UTC0/Qws5MbBX7bmCCpyUG3BJtA5Pkhbe+0jhBN+
	OgtwQzsKWgozkRfRDYpQl1nDncNWhflUOYdQG+k=
X-Google-Smtp-Source: ABdhPJxMMaU9qWveTzxbBCJOs/d8tPUBivV0WCtgtoO7nx78zS/mi6UZDCIEFpKZUX/4bP+vExyycO8vBC4/5L9E0os=
X-Received: by 2002:a05:620a:8c1:: with SMTP id z1mr964061qkz.431.1592524643361;
 Thu, 18 Jun 2020 16:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <D7692CC3-34E3-41FE-BBE5-4D5B09947C92@xevo.com>
 <bc728c163c639ffd5c0e6d8fb4c10b94417a2a8a.camel@intel.com>
 <D171668B-2DD3-4650-B4F2-B17DA15F9271@xevo.com> <11814952.jqib13ICcW@tyche> <CAJ86T=WzTgA55KRsztpAjfNbM2udzdxmayNXqkMo-OabzAJj2Q@mail.gmail.com>
In-Reply-To: <CAJ86T=WzTgA55KRsztpAjfNbM2udzdxmayNXqkMo-OabzAJj2Q@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 18 Jun 2020 16:56:55 -0700
Message-ID: <CAMKF1srfRUXg=zcThoW_Jus0j1t5wdkpRq4O2V-BdbPXxHHahQ@mail.gmail.com>
Subject: Re: [OE-core] python3 recipe PGO tests
To: Andre McCurdy <armccurdy@gmail.com>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, Martin Kelly <mkelly@xevo.com>, 
	Jim Broadus <jbroadus@xevo.com>, "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, Ryan Rowe <rrowe@xevo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2020 at 4:47 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Thu, Jun 18, 2020 at 4:25 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Monday, June 15, 2020 1:33:26 PM PDT Ryan Rowe wrote:
> > > On 14/6/20, 18:05, "Mittal, Anuj" <anuj.mittal@intel.com> wrote:
> > >
> > > > On Fri, 2020-06-12 at 21:28 +0000, Ryan Rowe wrote:
> > > >
> > > > > Hello Alex,
> > > > >
> > > > >
> > > > >
> > > > > I=E2=80=99m investigating Python 3 performance issues on a Raspb=
erry Pi Yocto
> > > > > build; I appreciate any insights you can provide into the proble=
m.
> > > > >
> > > > >
> > > > >
> > > > > In my investigation, I noticed that PGO was disabled in all case=
s due
> > > > > to a small bug. I fixed it in a patch submitted to OE-Core (#139=
459).
> > > > > Even when PGO is indeed enabled, Python 3 runs significantly slo=
wer
> > > > > on Yocto-compiled Python 3.8.3 than the same version compiled on
> > > > > Raspbian.
> > > > >
> > > > >
> > > > >
> > > > > In your patch, 0001-Makefile.pre-use-qemu-wrapper-when-gathering=
-
> > > > > profile.patch, I see that you override the default PROFILE_TASK,
> > > > > which did not explicitly specify test suites, to a command that
> > > > > explicitly provides test suites. How did you decide on these tes=
ts?
> > > > > The standard PGO command runs 43 tests, while you specify 7. Whe=
n I
> > > > > compile Python 3.8.3 on Raspbian, I see no intersection between =
the
> > > > > 43 tests run by default and the 7 you specify. Additionally, the
> > > > > default module for PROFILE is test while you use test.regrtest.
> > > >
> > > >
> > > >
> > > > We used to run pybench and then switched to regrtest:
> > > >
> > > >
> > > >
> > > > https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3Dd9f7b=
9d3ad44195
> > > > e68b2c1b09e3eb42e623c9a20
> > >
> > > >
> > > >
> > > > The PROFILE_TASK value it looks like was changed recently:
> > > >
> > > >
> > > >
> > > > https://github.com/python/cpython/commit/2406672984e4c1b18629e615e=
dad52928
> > > > a72ffcc#diff-45e8b91057f0c5b60efcb5944125b585
> > >
> > > >
> > > >
> > > > If the performance is actually degrading, may be we should change =
it to
> > > > something more useful. Do you know much time does the default set =
of
> > > > tasks take to run in qemu?
> > > >
> > > >
> > > >
> > > > Thanks,
> > > >
> > > >
> > > >
> > > > Anuj
> > >
> > >
> > > Thanks for looking into this. It took me about 20 minutes to run the=
 PGO
> > > tests and I did notice a significant improvement in Python runtime.
> > > However, that is compared against a non-PGO build. I have not compar=
ed
> > > the existing PGO arguments against the new upstream arguments.
> > >
> > > We've come to realize that our performance issues are not due to Pyt=
hon,
> > > but in fact a much deeper rooted issue. Simple C code takes 2-3 time=
s
> > > longer to run on our image based on meta-raspberrypi's raspberrypi4
> > > machine than stock Raspbian.
> > >
> > > On a side node, it seems that cPython now exposes PROFILE_TASK as a
> > > configuration option, so we can override that variable with our
> > > desired profiling arguments rather than modifying the Makefile
> > > directly with a patch.
> > >
> >
> > The patch 0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.pa=
tch
> > seems to hardcode what tests to run, perhaps it will be better to use
> > PROFILE_TASK
> >
> > When 3.5 -> 3.7 upgrade was done in
> >
> > https://git.openembedded.org/openembedded-core/commit/?
> > id=3D02714c105426b0d687620913c1a7401b386428b6
> >
> > it dropped using PYTHON3_PROFILE_TASK silently, among large swath of c=
hanges
> > this patch carried. I guess we have not checked the py3 runtime perfor=
mance to
> > detect this regression.
>
> Are we sure there is a regression? Ryan posted a follow up saying
> everything was slower in his tests, not just python.

regression is disabling it with e53ebf29

>
> > so it will be good to reinstate the variable to choose what tests one =
wants to
> > run with defaults being whatever is optimal for autobuilder.
> >
> > > Thanks,
> > > Ryan
> > >
> > >
> > > > >
> > > > >
> > > > > For reference, here=E2=80=99s the results of a simple CPU-bound =
test. These
> > > > > tests were run on the same Raspberry Pi 4 with same SD card.
> > > > >
> > > > >
> > > > >
> > > > > python3 -m timeit -r 10 --setup '
> > > > > def fib(n):
> > > > >
> > > > >  if n < 2:
> > > > >
> > > > >    return n
> > > > >
> > > > >  if n =3D=3D 2:
> > > > >
> > > > >    return 1
> > > > >
> > > > >  return fib(n - 1) + fib(n - 2)
> > > > >
> > > > > ' '[fib(n) for n in range(20)]'
> > > > >
> > > > >
> > > > >
> > > > > # Yocto Python 3.8.3
> > > > > # 10 loops, best of 10: 28.9 msec per loop
> > > > > # 10 loops, best of 10: 29.3 msec per loop
> > > > > # 10 loops, best of 10: 27.9 msec per loop
> > > > > # 10 loops, best of 10: 30.4 msec per loop
> > > > > # Average result: 31.625 msec per loop
> > > > >
> > > > >
> > > > >
> > > > > # Raspbian Python 3.8.3
> > > > > # 50 loops, best of 10: 7.73 msec per loop
> > > > > # 50 loops, best of 10: 7.72 msec per loop
> > > > > # 50 loops, best of 10: 7.67 msec per loop
> > > > > # 50 loops, best of 10: 7.74 msec per loop
> > > > > # Average result: 7.715 msec per loop
> > > > >
> > > > >
> > > > >
> > > > > # Raspbian speedup: 4.09x
> > > > >
> > > > >
> > > > >
> > > > > Best,
> > > > > Ryan Rowe
> > > > >
> > >
> > >
> >
> >
> >
> >
> >=20
