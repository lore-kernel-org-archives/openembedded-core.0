Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DDDC0015E
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 06:30:18 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.5426.1690353010557714073
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 23:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ExRCEodX;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1bb571ea965so2623080fac.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 23:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690353010; x=1690957810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWZrrWucZLG01WSdyDwbzOikHeB62qj4SAyLq8XQdus=;
        b=ExRCEodXidEmZF3bc7GE42YlyRrEyKJ3bAMpw9mE7hkH8E+g+ZmpwIQr78qyta/+wf
         M5nhnVsaSOo7FjSxqusfyonSoOfNU1BedFnGITNK+i9F/oaMA6zqffrzsusr2wHv5oAG
         Ys8+m9eUjSv8mropGN5GQtHIdcFqjB7UPUhYVrMaVtrVGbjXwpLGOnx8Tuf6kvxXr8Wk
         5A8KYj08Zg5WJSBECnHGx2lRgiLjsbOZIghhhnL+8Fn+QLS0A25Z0Yl+Nrr1CkQVGdiE
         +UCuWzT2oG4x5UFanGLbFaiUuTvwisGNBwoJ36LwVowRRWqOmLCHvzSCWvbycbW63eC5
         Qmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690353010; x=1690957810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WWZrrWucZLG01WSdyDwbzOikHeB62qj4SAyLq8XQdus=;
        b=AvVRT5zcFxLi8UunbWqK0FsMoVaTazS50cPMCzmQbZWBlXbTfT43b+bndjn83jWXPD
         axbdQrBmjCeT/tSxyMW8DsUXCI5bKs+0vsPNSWuqePuGok3/funNqU1TRKO2eO7k6A8d
         ehcwTmHkSS81r5grasx8yXwO/bIKJq9lZ4Bx23+wO2OlvEwccOts9ZOR/uifgmgiKhGC
         x8lngeWp1tYi9CO/4yRtVH+F6K3oLfVtf2cKy+3YiY+vXZqvPnHLRQZi3VFxQygwxDwX
         EO8PICf84MChxERydKIAV2YErHIjmOgsSyoiIe7JWGtfxrh0k5qDi3QzoaIH/WN6c+lv
         k9XQ==
X-Gm-Message-State: ABy/qLaP7C1c/ggN1Nu54UmfHj1C9BquZ7f0Zwz1a1o6380Jn5vJZAjb
	ATTGiISGIN8Sk60eecvccCJwdErPm3FbImsTVXY=
X-Google-Smtp-Source: APBJJlGNEMZmibOs5zuyGl96Jm97mhYmxe1G6UF6K7JfhbCQiGJ6ZbycWq25CxmqDP9Gf+Zei/UVCduU/rudGubqPjo=
X-Received: by 2002:a05:6870:3906:b0:1ba:66c1:da53 with SMTP id
 b6-20020a056870390600b001ba66c1da53mr1396530oap.22.1690353009517; Tue, 25 Jul
 2023 23:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <1772EB68FCA90E64.1400@lists.openembedded.org> <1c22b4fdfdcf22b58f7e06df872a9e0980645328.camel@linuxfoundation.org>
 <e6b6426580c3f6be5f492e2d1b9ae2a0b8049d12.camel@intel.com>
In-Reply-To: <e6b6426580c3f6be5f492e2d1b9ae2a0b8049d12.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Jul 2023 23:29:43 -0700
Message-ID: <CAMKF1soZWn6xa=+Xrafm62BXXwwm+BooOTU0P8u9kmq9CWB0fQ@mail.gmail.com>
Subject: Re: [OE-core] Toolchain test results
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"steve@sakoman.com" <steve@sakoman.com>, "ross.burton@arm.com" <ross.burton@arm.com>, 
	"randy.macleod@windriver.com" <randy.macleod@windriver.com>, 
	"Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 06:30:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184860

On Tue, Jul 25, 2023 at 11:00=E2=80=AFPM Anuj Mittal <anuj.mittal@intel.com=
> wrote:
>
> On Thu, 2023-07-20 at 12:26 +0100, Richard Purdie wrote:
> > On Tue, 2023-07-18 at 10:14 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > qemuarm has ~350 failures
> > > qemuarm64 has ~350 failures
> > > qemux86-64 has ~4000 (3900 in glibc)
> > > qemux86 has ~4000 (3500 in glibc)
> > > qemuppc has ~600 failures
> > > qemumips64 has ~5000 failures (all over)
> > > qemumips has ~1600 failures
> > >
> > > Anuj: Can Intel look into the glibc test failures on x86?
> >
> > I realised the glibc issues were due to the network being disabled
> > for
> > the tests and have sent a patch to fix that. That reduces the
> > failures
> > from ~3900 to ~330. We should really try and reduce that further but
> > it
> > is a start!
> >
>
> A lot of locale/iconv tests seemed to be failing when calling write
> with large buffers/files over NFS. Some of others were triggering OOM.
>
> I ran the tests again after making a few changes:
>
> https://autobuilder.yocto.io/pub/non-release/20230726-11/testresults/qemu=
x86-64-tc/
>
> After switching NFS mount to TCP and increasing the memory available to
> 1024, the number of tests failed came down to 69.
>

This is a nice, thanks for doing it. I looked quickly at your results
especially glibc part
and it seems some of remaining failures are in nss module. I could not
see detail logs
why those tests were failing but few things to check is if we install

libnss-db and glibc-extra-nss packages into image or not. some of
these tests edit
/etc/nsswitch.conf, so are these tests running in parallel and racing.

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> qemux86-64 PTest Result Summary
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -----------------------------------------------------------------------
> ---------------------------------------
> Recipe           | Passed       | Failed   | Skipped     | Time(s)
> -----------------------------------------------------------------------
> ---------------------------------------
> binutils         | 289          | 0        | 8           | -
> binutils-gas     | 1582         | 4        | 1           | -
> binutils-ld      | 1622         | 6        | 111         | -
> gcc              | 149696       | 28       | 27599       | -
> gcc-g++          | 219260       | 30       | 21108       | -
> gcc-libatomic    | 27           | 1        | 27          | -
> gcc-libgomp      | 3426         | 1        | 1962        | -
> gcc-libitm       | 24           | 1        | 24          | -
> gcc-libstdc++-v3 | 9695         | 32       | 5459        | -
> glibc            | 4984         | 69       | 147         | -
> rust             | 15768        | 0        | 554         | -
> -----------------------------------------------------------------------
> ---------------------------------------
>
> Thanks,
>
> Anuj
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184858): https://lists.openembedded.org/g/openembedde=
d-core/message/184858
> Mute This Topic: https://lists.openembedded.org/mt/100212267/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

