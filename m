Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C624C433F5
	for <webhook@archiver.kernel.org>; Sun, 13 Feb 2022 16:27:18 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web09.22991.1644769636345824375
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 08:27:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dajvk8jV;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id k25so32815034ejp.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 08:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KRmbxtQ7e4zaSJx0dazUD2eH6OVAQHuiaNZHX0x31cc=;
        b=Dajvk8jVdNeLo2h8gPLxRRGINPWB1x6kQ6jtAJFir9XAfcXt1em+i688QOGL1/kPxN
         ojoeQnWj2vqKVlCXUgpjGd+WvVk7Bo6FhK+RAMCR31lfgfd5L0bke8Ef16vZ25Orbenh
         LeFuOMTLBQLfDLw7RZz6bbcJrOvj9e8AQAp42CyPiyal6ohX84mU3ht2uM4K2emKrgVB
         weGS4gDJ2Pgu/f+Um4rdBuESbjxDViiFVVhXiAZj3EanUNrNaDKPhD8jO47JiEAodMU3
         teSuqjpVG1p5WXpDjgEeTiSnt52UzaZPFhMeFlXjHcovm13M5LOjjYyk5wmWr9J9kcp6
         Ma3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KRmbxtQ7e4zaSJx0dazUD2eH6OVAQHuiaNZHX0x31cc=;
        b=EgvGLfDSFbgAv5sP1R/yHX3NEu89v48unC0Q7bbkYfz+orFXZc296rLYAnMW+O3yPl
         yBw2lMKRvCy7hTfrnTZaL+tSwfB8qo9G2lWNwZTIEgbVQ8yp1Tw41x464NMOBMrS3Q3S
         a1VpTxzRS5LsbZXmEfVh5tJZ57mGMvQ4L0GRBURQnsu7rOnhdjGuxGJ5r5GYkcR/RHEG
         ZrvnlvRASCo4ExPwpMPKZ8nmLAbY9vgGIXZrsdxzeJshfc+JT42j5XjrCIiHB0c83uP6
         RNVD2KoW9pRyowsOotb+npEu5zuqa8gRL/Vz2d2eYGfPzoDNVIJLmaaoCoxTwCw7vzpN
         L0uw==
X-Gm-Message-State: AOAM533ABVlIQkEHlVZqih9yJy/wgNMUpIUdm6jx7KjyLtt5Th5ekCub
	/8vMthd56CmnA5J5Beia49F76VfUQuQMno+/syM=
X-Google-Smtp-Source: 
 ABdhPJzWel4Pn796qE5gRAxSlYPEK/7AjuI6anbsuTD33pgzQxZTfGnKsC0FME4wV9/QBdLo1sbCLgHJXQyorPn0KSw=
X-Received: by 2002:a17:907:8a1f:: with SMTP id
 sc31mr5544889ejc.651.1644769634598;
 Sun, 13 Feb 2022 08:27:14 -0800 (PST)
MIME-Version: 1.0
References: <20220210183719.3213809-1-raj.khem@gmail.com>
 <708e70534079e11e5db614f43e314aef62587a3c.camel@linuxfoundation.org>
 <CAMKF1sqrEhQWAv7UzK7OwP7mR17nc3UxufnxcV05tLzr+G29wg@mail.gmail.com>
 <CADkTA4Nj137Tn58UQkZvDJVUjts5+OQtJ_6TuiWEq3GKQ7V2bw@mail.gmail.com>
 <c33e356bc1429ff6b8175dd056603a21cae833d4.camel@linuxfoundation.org>
In-Reply-To: 
 <c33e356bc1429ff6b8175dd056603a21cae833d4.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 13 Feb 2022 11:27:03 -0500
Message-ID: 
 <CADkTA4N-yxzSMuhVpPWyddcaOLkmBpEwgs4TECr8SNup8tE__Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.38 release
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Feb 2022 16:27:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161687

On Sun, Feb 13, 2022 at 9:27 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2022-02-12 at 20:25 -0500, Bruce Ashfield wrote:
> > On Sat, Feb 12, 2022 at 12:27 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Sat, Feb 12, 2022 at 5:27 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Thu, 2022-02-10 at 10:37 -0800, Khem Raj wrote:
> > > > > Release Notes are here [1]
> > > > >
> > > > > [1] https://lists.gnu.org/archive/html/info-gnu/2022-02/msg00009.html
> > > > >
> > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > >
> > > > So far there was a mingw failure:
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/4729
> > >
> > > This seems a race
> > >
> > > > i686-w64-mingw32-dlltool: lib32/libd3dcompiler_35.a: error reading
> > > D3DCompiler_dll_t.o: No such file or directory
> > > > Assembler messages:
> > > > Error: can't open D3DCompiler_dll_h.s for reading: No such file or directory
> > > > i686-w64-mingw32-dlltool: i686-w64-mingw32-as exited with status 1
> > > > i686-w64-mingw32-dlltool: failed to open temporary head file:
> > > D3DCompiler_dll_h.o: No such file or directory
> > > > Makefile:82403: recipe for target 'lib32/libd3dcompiler_35.a' failed
> > > > make[1]: *** [lib32/libd3dcompiler_35.a] Error 1
> > >
> > >
> > >
> > > >
> > > > and a qemuppc kernel build issue:
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4688
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/2632
> > > >
> > >
> > > this needs a kernel patch backported ( looking towards Bruce to include it)
> > >
> > > https://lore.kernel.org/lkml/20220211005113.1361436-1-anders.roxell@linaro.org/T/
> >
> > I've grabbed this change, and the riscv one, and applied them to 5.10 and 5.15.
> >
> > The pull request is on the list for the binutils fixes and -stable updates.
>
> Thanks Bruce. Unfortunately this doesn't seem to fix the qemuppc build issues:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4691
> https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/2634

I see a patch from January on lkml with the shortlog: "powerpc/mm:
Switch obsolete dssall to .long", which may be related.

But I'm not setup to see the build issues myself this weekend, but can
start looking more closely on Monday.

Bruce

>
> Cheers,
>
> Richard
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

