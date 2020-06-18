Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web12.6836.1592524078459465375
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 16:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aNGi0oXs;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id u17so4607438vsu.7
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 16:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PcVsnvqF4EAtv87GLhmYlnHDnNrsX6JUoGBjhkq5itA=;
        b=aNGi0oXspZwJV41Ju3khE4wWKAKbSNELIKepO8EJN+1qu64myp43vOnZ5HtsTxX8H+
         HtT390M5sb43/ylRLweNJ5GFOEItHCj/okPCNMk9O5la4/AJNwVUnHRYyUgr8/UHlNsf
         vqpS5Fn/AQGsD0OZnx9xzi1S82cSy3OkeQ15lLnk8SRvFnrKg97o7gAlcQeIfuuaUuEC
         P2RVOcXL8/HGofd9lB5PeUJLJIJdA6RzRkGupkgAEe2XBhuUDZ2M9yaj4B0RhkOLp7m4
         QLAFq8XEbjwwz0jmoe+3rZa7MiwLiWFrxpuBSBmP+Jb7JPMiH3PU59/RNJDHhfs5O3ux
         YUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PcVsnvqF4EAtv87GLhmYlnHDnNrsX6JUoGBjhkq5itA=;
        b=ZG/swUW0tYW3joQFEJJiXZiF3xQ3/Zl6YAtzzkucTb5hAR5AbIZH0XidnVPEHOoUz8
         /7CMXfTHV1FWPpCD9fWhxfz9Yrzoz5pF9r6D3iw5LHTeb7NcjT5ifx/cuj6pCewmPyCM
         xcsItsXaeK0U1/r7ISsJMY48neeSATiPTdookbTrK2CKeX+T1PPoQoLchvtJWWY3l16z
         9BLxP99OpJNGOqPUCxwUPrpb2KII17PoTSxzRO9cV8heymBpxCBP29x5gMqY7eego3gB
         ZzAG/8lSJoDobefaL4i8g67wnbdwzscCCB/QCITGVIQso/QvY64YL9l6Z3EPt29+LGS2
         WKOg==
X-Gm-Message-State: AOAM533VuYVTZ+GQVrWKxbHnDbM6aDugwAOMkpoulyMFuoYKRXCGPBza
	vzuJ+RydIMmQbLsQ8vCZJ3t2x+0RnEOBA+aiAvk=
X-Google-Smtp-Source: ABdhPJzdoLBHs1C1YBvzA79LI/QEmuQu7PH7KHbHfI91geoiT9MFCNRQ9/ivjfRJnkxRjUh7FbzIEki1CMvHMh0M89s=
X-Received: by 2002:a05:6102:205d:: with SMTP id q29mr5931456vsr.130.1592524077489;
 Thu, 18 Jun 2020 16:47:57 -0700 (PDT)
MIME-Version: 1.0
References: <D7692CC3-34E3-41FE-BBE5-4D5B09947C92@xevo.com>
 <bc728c163c639ffd5c0e6d8fb4c10b94417a2a8a.camel@intel.com>
 <D171668B-2DD3-4650-B4F2-B17DA15F9271@xevo.com> <11814952.jqib13ICcW@tyche>
In-Reply-To: <11814952.jqib13ICcW@tyche>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 18 Jun 2020 16:47:52 -0700
Message-ID: <CAJ86T=WzTgA55KRsztpAjfNbM2udzdxmayNXqkMo-OabzAJj2Q@mail.gmail.com>
Subject: Re: [OE-core] python3 recipe PGO tests
To: Khem Raj <raj.khem@gmail.com>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, Martin Kelly <mkelly@xevo.com>, 
	Jim Broadus <jbroadus@xevo.com>, "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, Ryan Rowe <rrowe@xevo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2020 at 4:25 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Monday, June 15, 2020 1:33:26 PM PDT Ryan Rowe wrote:
> > On 14/6/20, 18:05, "Mittal, Anuj" <anuj.mittal@intel.com> wrote:
> >
> > > On Fri, 2020-06-12 at 21:28 +0000, Ryan Rowe wrote:
> > >
> > > > Hello Alex,
> > > >
> > > >
> > > >
> > > > I=E2=80=99m investigating Python 3 performance issues on a Raspber=
ry Pi Yocto
> > > > build; I appreciate any insights you can provide into the problem.
> > > >
> > > >
> > > >
> > > > In my investigation, I noticed that PGO was disabled in all cases =
due
> > > > to a small bug. I fixed it in a patch submitted to OE-Core (#13945=
9).
> > > > Even when PGO is indeed enabled, Python 3 runs significantly slowe=
r
> > > > on Yocto-compiled Python 3.8.3 than the same version compiled on
> > > > Raspbian.
> > > >
> > > >
> > > >
> > > > In your patch, 0001-Makefile.pre-use-qemu-wrapper-when-gathering-
> > > > profile.patch, I see that you override the default PROFILE_TASK,
> > > > which did not explicitly specify test suites, to a command that
> > > > explicitly provides test suites. How did you decide on these tests=
?
> > > > The standard PGO command runs 43 tests, while you specify 7. When =
I
> > > > compile Python 3.8.3 on Raspbian, I see no intersection between th=
e
> > > > 43 tests run by default and the 7 you specify. Additionally, the
> > > > default module for PROFILE is test while you use test.regrtest.
> > >
> > >
> > >
> > > We used to run pybench and then switched to regrtest:
> > >
> > >
> > >
> > > https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3Dd9f7b9d=
3ad44195
> > > e68b2c1b09e3eb42e623c9a20
> >
> > >
> > >
> > > The PROFILE_TASK value it looks like was changed recently:
> > >
> > >
> > >
> > > https://github.com/python/cpython/commit/2406672984e4c1b18629e615eda=
d52928
> > > a72ffcc#diff-45e8b91057f0c5b60efcb5944125b585
> >
> > >
> > >
> > > If the performance is actually degrading, may be we should change it=
 to
> > > something more useful. Do you know much time does the default set of
> > > tasks take to run in qemu?
> > >
> > >
> > >
> > > Thanks,
> > >
> > >
> > >
> > > Anuj
> >
> >
> > Thanks for looking into this. It took me about 20 minutes to run the P=
GO
> > tests and I did notice a significant improvement in Python runtime.
> > However, that is compared against a non-PGO build. I have not compared
> > the existing PGO arguments against the new upstream arguments.
> >
> > We've come to realize that our performance issues are not due to Pytho=
n,
> > but in fact a much deeper rooted issue. Simple C code takes 2-3 times
> > longer to run on our image based on meta-raspberrypi's raspberrypi4
> > machine than stock Raspbian.
> >
> > On a side node, it seems that cPython now exposes PROFILE_TASK as a
> > configuration option, so we can override that variable with our
> > desired profiling arguments rather than modifying the Makefile
> > directly with a patch.
> >
>
> The patch 0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patc=
h
> seems to hardcode what tests to run, perhaps it will be better to use
> PROFILE_TASK
>
> When 3.5 -> 3.7 upgrade was done in
>
> https://git.openembedded.org/openembedded-core/commit/?
> id=3D02714c105426b0d687620913c1a7401b386428b6
>
> it dropped using PYTHON3_PROFILE_TASK silently, among large swath of cha=
nges
> this patch carried. I guess we have not checked the py3 runtime performa=
nce to
> detect this regression.

Are we sure there is a regression? Ryan posted a follow up saying
everything was slower in his tests, not just python.

> so it will be good to reinstate the variable to choose what tests one wa=
nts to
> run with defaults being whatever is optimal for autobuilder.
>
> > Thanks,
> > Ryan
> >
> >
> > > >
> > > >
> > > > For reference, here=E2=80=99s the results of a simple CPU-bound te=
st. These
> > > > tests were run on the same Raspberry Pi 4 with same SD card.
> > > >
> > > >
> > > >
> > > > python3 -m timeit -r 10 --setup '
> > > > def fib(n):
> > > >
> > > >  if n < 2:
> > > >
> > > >    return n
> > > >
> > > >  if n =3D=3D 2:
> > > >
> > > >    return 1
> > > >
> > > >  return fib(n - 1) + fib(n - 2)
> > > >
> > > > ' '[fib(n) for n in range(20)]'
> > > >
> > > >
> > > >
> > > > # Yocto Python 3.8.3
> > > > # 10 loops, best of 10: 28.9 msec per loop
> > > > # 10 loops, best of 10: 29.3 msec per loop
> > > > # 10 loops, best of 10: 27.9 msec per loop
> > > > # 10 loops, best of 10: 30.4 msec per loop
> > > > # Average result: 31.625 msec per loop
> > > >
> > > >
> > > >
> > > > # Raspbian Python 3.8.3
> > > > # 50 loops, best of 10: 7.73 msec per loop
> > > > # 50 loops, best of 10: 7.72 msec per loop
> > > > # 50 loops, best of 10: 7.67 msec per loop
> > > > # 50 loops, best of 10: 7.74 msec per loop
> > > > # Average result: 7.715 msec per loop
> > > >
> > > >
> > > >
> > > > # Raspbian speedup: 4.09x
> > > >
> > > >
> > > >
> > > > Best,
> > > > Ryan Rowe
> > > >
> >
> >
>
>
>
>
>=20
