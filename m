Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.6388.1592522703037177628
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 16:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lZ/U+fzx;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id i12so3281173pju.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 16:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:organization:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VfU73xUbqjpVCeQEBRpzQ1x6WRAP/CF8ndZbxbItHFc=;
        b=lZ/U+fzxbPXq20sLqhp3oeJxhdaGE4A5xpxdVSb98AbitDzmeQv9jVZapGk5HLkQrH
         2/XuHk/GCHbCs28HJi2mM6+k5p8tB8QH+SgokwY/O/krfYg7rz3DlQxeeX7goZX3BvdB
         Pf8lJKpY5DFdp8CD9dysvC+vEkpJLp6kNXtjaS3oU9TDZSwttEm5N9Oih2PDrduJrIWh
         IAkbA8qFNUXqgxDxh7FgQTpawez/FA32Hn5cYsgCdMl6l9Vr3SVxutcma1+WHHPjz3Gx
         JSaZxPpnfPHKDsEu6Gv51ND5ufZodlQKG++ONg3h9TGupEvy0cLYWNL2o+y7HcAzurXy
         N1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:organization
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=VfU73xUbqjpVCeQEBRpzQ1x6WRAP/CF8ndZbxbItHFc=;
        b=lmbqMuokKwI788bjitFG5i7phHxIYcJalJcXfm/0o5eMUxX0StOG3T1xZDeHuW8X4P
         uEEhOjYX0o8q6hDnWMJOYCWanjL32rEiA4ICl5gQjZKHA0wMS7mk08xPaRLIzbExyGz+
         hxRNCOYrvcZGBBV12gPVdtjNyyTU2I8QYp1xqIJn22UXwy2KIo8+YAD6Cbw//pK/a83q
         fBgqoRlE7T5hxfdRKVovK5/ehB1EXMevd+zeSYZ0a7ZFLO660rmj7t9vA6L8MWUj8CqD
         YA/IuykRUEms745DNtji4d2dCTPSC93PWzYkqOpv2c3y1YyFNBN5yPUmZhGzKkvw4MFa
         wGEQ==
X-Gm-Message-State: AOAM533ruL+Geq1SU8p9Sp9mwzkKwW+zJtrmFmf8OBPmNncc9FnCIGS4
	KlNaqDW6VaBWiDncNNCDkAM=
X-Google-Smtp-Source: ABdhPJxM/bQXbkMcLp7qUHhRA95VsCczug4qvU31bUpa/wM0kSccziifHZq+y4Oz21ZpIZKDqPkGsw==
X-Received: by 2002:a17:90a:284b:: with SMTP id p11mr735751pjf.22.1592522702273;
        Thu, 18 Jun 2020 16:25:02 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from tyche.localnet ([2601:646:9200:4e0::804d])
        by smtp.gmail.com with ESMTPSA id s194sm3409956pgs.24.2020.06.18.16.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 16:25:01 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Cc: Martin Kelly <mkelly@xevo.com>, Jim Broadus <jbroadus@xevo.com>, "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, Ryan Rowe <rrowe@xevo.com>
Subject: Re: [OE-core] python3 recipe PGO tests
Date: Thu, 18 Jun 2020 16:24:59 -0700
Message-ID: <11814952.jqib13ICcW@tyche>
Organization: HIMVIS
In-Reply-To: <D171668B-2DD3-4650-B4F2-B17DA15F9271@xevo.com>
References: <D7692CC3-34E3-41FE-BBE5-4D5B09947C92@xevo.com> <bc728c163c639ffd5c0e6d8fb4c10b94417a2a8a.camel@intel.com> <D171668B-2DD3-4650-B4F2-B17DA15F9271@xevo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Monday, June 15, 2020 1:33:26 PM PDT Ryan Rowe wrote:
> On 14/6/20, 18:05, "Mittal, Anuj" <anuj.mittal@intel.com> wrote:
>=20
> > On Fri, 2020-06-12 at 21:28 +0000, Ryan Rowe wrote:
> >=20
> > > Hello Alex,
> > >
> > >
> > >
> > > I=E2=80=99m investigating Python 3 performance issues on a Raspberry =
Pi Yocto
> > > build; I appreciate any insights you can provide into the problem.
> > >
> > >
> > >
> > > In my investigation, I noticed that PGO was disabled in all cases due
> > > to a small bug. I fixed it in a patch submitted to OE-Core (#139459).
> > > Even when PGO is indeed enabled, Python 3 runs significantly slower
> > > on Yocto-compiled Python 3.8.3 than the same version compiled on
> > > Raspbian.
> > >
> > >
> > >
> > > In your patch, 0001-Makefile.pre-use-qemu-wrapper-when-gathering-
> > > profile.patch, I see that you override the default PROFILE_TASK,
> > > which did not explicitly specify test suites, to a command that
> > > explicitly provides test suites. How did you decide on these tests?
> > > The standard PGO command runs 43 tests, while you specify 7. When I
> > > compile Python 3.8.3 on Raspbian, I see no intersection between the
> > > 43 tests run by default and the 7 you specify. Additionally, the
> > > default module for PROFILE is test while you use test.regrtest.
> >
> >
> >
> > We used to run pybench and then switched to regrtest:
> >
> >
> >
> > https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3Dd9f7b9d3ad=
44195
> > e68b2c1b09e3eb42e623c9a20
>
> >
> >
> > The PROFILE_TASK value it looks like was changed recently:
> >
> >
> >
> > https://github.com/python/cpython/commit/2406672984e4c1b18629e615edad52=
928
> > a72ffcc#diff-45e8b91057f0c5b60efcb5944125b585
>
> >
> >
> > If the performance is actually degrading, may be we should change it to
> > something more useful. Do you know much time does the default set of
> > tasks take to run in qemu?
> >
> >
> >
> > Thanks,
> >
> >
> >
> > Anuj
>=20
>=20
> Thanks for looking into this. It took me about 20 minutes to run the PGO
> tests and I did notice a significant improvement in Python runtime.
> However, that is compared against a non-PGO build. I have not compared
> the existing PGO arguments against the new upstream arguments.
>=20
> We've come to realize that our performance issues are not due to Python,
> but in fact a much deeper rooted issue. Simple C code takes 2-3 times
> longer to run on our image based on meta-raspberrypi's raspberrypi4
> machine than stock Raspbian.
>=20
> On a side node, it seems that cPython now exposes PROFILE_TASK as a
> configuration option, so we can override that variable with our
> desired profiling arguments rather than modifying the Makefile
> directly with a patch.
>=20

The patch 0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch=20
seems to hardcode what tests to run, perhaps it will be better to use=20
PROFILE_TASK

When 3.5 -> 3.7 upgrade was done in=20

https://git.openembedded.org/openembedded-core/commit/?
id=3D02714c105426b0d687620913c1a7401b386428b6

it dropped using PYTHON3_PROFILE_TASK silently, among large swath of changes
this patch carried. I guess we have not checked the py3 runtime performance=
 to=20
detect this regression.

so it will be good to reinstate the variable to choose what tests one wants=
 to=20
run with defaults being whatever is optimal for autobuilder.=20

> Thanks,
> Ryan
>=20
>=20
> > >
> > >
> > > For reference, here=E2=80=99s the results of a simple CPU-bound test.=
 These
> > > tests were run on the same Raspberry Pi 4 with same SD card.
> > >
> > >
> > >
> > > python3 -m timeit -r 10 --setup '
> > > def fib(n):
> > >=20
> > >  if n < 2:
> > > =20
> > >    return n
> > > =20
> > >  if n =3D=3D 2:
> > > =20
> > >    return 1
> > > =20
> > >  return fib(n - 1) + fib(n - 2)
> > >=20
> > > ' '[fib(n) for n in range(20)]'
> > >
> > >
> > >
> > > # Yocto Python 3.8.3
> > > # 10 loops, best of 10: 28.9 msec per loop
> > > # 10 loops, best of 10: 29.3 msec per loop
> > > # 10 loops, best of 10: 27.9 msec per loop
> > > # 10 loops, best of 10: 30.4 msec per loop
> > > # Average result: 31.625 msec per loop
> > >
> > >
> > >
> > > # Raspbian Python 3.8.3
> > > # 50 loops, best of 10: 7.73 msec per loop
> > > # 50 loops, best of 10: 7.72 msec per loop
> > > # 50 loops, best of 10: 7.67 msec per loop
> > > # 50 loops, best of 10: 7.74 msec per loop
> > > # Average result: 7.715 msec per loop
> > >
> > >
> > >
> > > # Raspbian speedup: 4.09x
> > >
> > >
> > >
> > > Best,
> > > Ryan Rowe
> > >=20
>=20
>=20




