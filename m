Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4105C3ABA9
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 03:26:05 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.11442.1746156363035025296
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 20:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mWSvFJ8e;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-72ecb4d9a10so1121924a34.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 20:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746156362; x=1746761162; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIzoI6sMPS21cSPOcXlBkZoSR6XvQPbfhmx1E15SNR0=;
        b=mWSvFJ8eCRqqlANl+A0mpC5Srb4rhyXrmgSNMVLqjNQVRjJYXijIgHbWXPxtvDSDUf
         xdtDq1O0m9uMeHrkdc2l4NMGQL3j49i4eUDUaBU5Y5OS8pATt+AMNS1+GIdVKkvMciHF
         SLmU2Q45jGwGc3V3IFOXwxgSsjlcqmatGruHEzXAeBkk5UyKQwxlXBLJ7QpMpQiT+5u/
         hzMr4vDEna/davWXOXC5XUvZISs1ehpIQJEXibnQIi8kXYDuMF19K1SUGxVOV+IhNunC
         IKhKizyPfmbviOSMrWW6VZJbQtqnQlk69mMxzWMkKMSTyZvsjt4lD3Gj6yPeK2P66VG2
         PkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746156362; x=1746761162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIzoI6sMPS21cSPOcXlBkZoSR6XvQPbfhmx1E15SNR0=;
        b=FS3eUJWLnhnCp7RdLrzAjkdPijxyNW51uPuu5aOWJyS2scowDokvMpEwaniD6MERUN
         PfCvFFWFA4+QlTBeWAlY1qT9RUcLYKk0h2Xf6Zq6Z9O9YYeIZ0Wa96wX/FJraeSvmgmx
         cz2Ed5NUS6kbb/eU2rQPWXg6EZRET3x7qRYCnSoX2rgneX6GWtNaGEHYfzR1njKUJ0Bl
         /5MOtAI28oLuON1Dv0gmd749qcxCYXTs+aX9jY0qgTzqWZ2tMnHpzfPUnB1UU5WY9b5Q
         5Zx+OdAvAWQLukQiaD64fPCgdwnmEP44pTEJ6zDx3XekbuW1Hh+gyRX0ZXlbtK7kn9gY
         KVtg==
X-Gm-Message-State: AOJu0YwmnJlGiAXuITbYq/vSFG3dp1D4H4gLYHiUHMdVVff2BquxeY2c
	RPLzD8ffQTILbwzLhScqg7lxwp08SuOXhD/XnLv/ZCgMYdBTmG8f/UKG4eZ+WhBWqy//+CWxtwR
	CeW3m/LaRUQv59eR/sSxULNgTVplLh7PV
X-Gm-Gg: ASbGncsjGFI2QXPS/xbVF3xZ/RMOmA4A/ACHaK9QQzfXoL5l5rhv/WgsTN2Psnsbz/6
	HdjAdbcjHK38ImhUjHXdS3bOnif4mh5QLzAv1uvJWmqnrJugqJvmPfQdXlbKnCv0DjfZLKhgafU
	tH3PB07eNvMlsJl707m/hi
X-Google-Smtp-Source: AGHT+IHtMnnUTe/O24yBYzMJGN6p5XJkP2UINIAiEuc8iqm9ggNta54fo9BZcYlCjH596NqmtMpSoDruMph5R1G1B4g=
X-Received: by 2002:a05:6808:80ab:b0:403:3673:65f0 with SMTP id
 5614622812f47-4034146a338mr889071b6e.31.1746156362185; Thu, 01 May 2025
 20:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250501030313.638148-1-Deepesh.Varatharajan@windriver.com>
 <CAMKF1soiQ=bmtZwHLLZ4OAEHA=8r04mQ0ATyFmcCaZmy27tXVQ@mail.gmail.com> <c887b509-4283-4488-8e82-8ba35ca99678@windriver.com>
In-Reply-To: <c887b509-4283-4488-8e82-8ba35ca99678@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 May 2025 20:25:36 -0700
X-Gm-Features: ATxdqUGjDOnvS19vdr7qQ92OcYG-V61wC0FjW7InolRK79zTstUaB8W0SRkU1fU
Message-ID: <CAMKF1srKGQAWrGhw-g9ZNtgNvNyUKfT2iSbs30FQQMOAnoD2UQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: stable 2.39 branch updates
To: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
Cc: openembedded-core@lists.openembedded.org, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 03:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215905

On Thu, May 1, 2025 at 8:15=E2=80=AFPM Deepesh Varatharajan
<deepesh.varatharajan@windriver.com> wrote:
>
>
> On 01-05-2025 11:24, Khem Raj wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On Wed, Apr 30, 2025 at 8:03=E2=80=AFPM Varatharajan, Deepesh via
> > lists.openembedded.org
> > <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
> >> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> >>
> >> 3463100f2d x86: Detect Intel Diamond Rapids
> >> e09436c2cb x86: Handle unknown Intel processor with default tuning
> >> 7620d98186 x86: Add ARL/PTL/CWF model detection support
> >> 765ff3d0d4 x86: Optimize xstate size calculation
> >> 65ae73be01 x86: Use `Avoid_Non_Temporal_Memset` to control non-tempora=
l path
> >> 2be36448c4 x86: Tunables may incorrectly set Prefer_PMINUB_for_stringo=
p (bug 32047)
> >> bde201e92c x86: Disable non-temporal memset on Skylake Server
> >> 38a7632f2d x86: Fix value for `x86_memset_non_temporal_threshold` when=
 it is undesirable
> >> cc59fa5dbc x86: Enable non-temporal memset tunable for AMD
> >> 0da58e8be0 x86: Add seperate non-temporal tunable for memset
> >> 837a36c371 x86: Link tst-gnu2-tls2-x86-noxsave{,c,xsavec} with libpthr=
ead
> >> 87ab0c7f7f x86: Use separate variable for TLSDESC XSAVE/XSAVEC state s=
ize (bug 32810)
> >> 60cd7123a6 x86: Skip XSAVE state size reset if ISA level requires XSAV=
E
> >> 4cf3f9df54 x86_64: Add atanh with FMA
> >> 01ed435e2e x86_64: Add sinh with FMA
> >> 0edcc77fe7 x86_64: Add tanh with FMA
> >> 7ecf0d3bde x86-64: Exclude FMA4 IFUNC functions for -mapxf
> >> e1fe22368e nptl: clear the whole rseq area before registration
> >> dd8c0c3bbd math: Improve layout of exp/exp10 data
> >> a1b09e59e2 AArch64: Use prefer_sve_ifuncs for SVE memset
> >> d0e2133470 AArch64: Add SVE memset
> >> 0cc12d9c47 math: Improve layout of expf data
> >> 0cd10047bf AArch64: Remove zva_128 from memset
> >> dd1e63ab58 AArch64: Optimize memset
> >> 65a96a6f2b AArch64: Improve generic strlen
> >> 4073e4ee2c AArch64: Improve codegen for SVE logs
> >> 78abd3ef6e AArch64: Improve codegen in SVE tans
> >> a10183b633 AArch64: Improve codegen of AdvSIMD atan(2)(f)
> >> dcd1229e5b AArch64: Improve codegen of AdvSIMD logf function family
> >> 72156cb90b AArch64: Improve codegen in AdvSIMD logs
> >> 5e354bf4e2 AArch64: Simplify rounding-multiply pattern in several AdvS=
IMD routines
> >> 80df456112 aarch64: Avoid redundant MOVs in AdvSIMD F32 logs
> >> d591876303 aarch64: Fix AdvSIMD libmvec routines for big-endian
> >> f6d48470ae assert: Add test for CVE-2025-0395
> >>
> >> Testresults:
> >> After update    |Before update   |Difference
> >> PASS: 5068      |PASS: 5072      |PASS: +4
> > +4 should mean more passes after update but the table shows otherwise.
> > Can you list the 4 tests which are passing now ?
> Hi Khem,
>
> Apologies for the confusion, there was a typo. I mistakenly listed the
> 'after update'
> passing test cases under 'before update' and vice versa. The following fo=
ur
> additional test cases passed after the update:
>
> PASS: assert/tst-assert-sa-2025-0001
> PASS: elf/tst-gnu2-tls2-x86-noxsave
> PASS: elf/tst-gnu2-tls2-x86-noxsavec
> PASS: elf/tst-gnu2-tls2-x86-noxsavexsavec

That looks good. Thanks

>
> Regards,
> Deepesh
> >> FAIL: 120       |FAIL: 120       |FAIL: 0
> >> XPASS: 4        |XPASS: 4        |XPASS: 0
> >> XFAIL: 16       |XFAIL: 16       |XFAIL: 0
> >> UNSUPPORTED: 157|UNSUPPORTED: 157|UNSUPPORTED: 0
> >>
> >> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
> >> ---
> >>   meta/recipes-core/glibc/glibc-version.inc | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-=
core/glibc/glibc-version.inc
> >> index da9227ccca..040fc793b1 100644
> >> --- a/meta/recipes-core/glibc/glibc-version.inc
> >> +++ b/meta/recipes-core/glibc/glibc-version.inc
> >> @@ -1,6 +1,6 @@
> >>   SRCBRANCH ?=3D "release/2.39/master"
> >>   PV =3D "2.39+git"
> >> -SRCREV_glibc ?=3D "662516aca8b6bf6aa6555f471055d5eb512b1ddc"
> >> +SRCREV_glibc ?=3D "3463100f2d47f2897a24ba8023a5c7aaf2d26550"
> >>   SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
> >>
> >>   GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dht=
tps"
> >> --
> >> 2.43.0
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#215761): https://lists.openembedded.org/g/openembe=
dded-core/message/215761
> >> Mute This Topic: https://lists.openembedded.org/mt/112554022/1997914
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>

