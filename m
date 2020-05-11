Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.14210.1589210589290117765
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 08:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XzXzhWNk;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id x8so8143270qtr.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 08:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1SGdDtltM4BjoEqmaBAVnt6OG/s9cAKnLE2bNpQ4H4M=;
        b=XzXzhWNkj7Lgk0j/7K776FUBFMw8j3Tq06P2BABPd2bzKRVchyO6KPGvMQyIB6QtDi
         VWJO4pzUqcKb365L+jPVd67WHUMyor+xTkpPt10TD54FcZa1Hi8Gyj/Oq3vJnZjtKROR
         Y2a0K6YSv5di6x9jPTuEqqwZad1yRrmDRZH830sLdn99dyk8BbQO1iV6cRQNC0iVBOKE
         rH/9+flQlK/ilfo9GKrt+QajbzWCTEGoFaIAPqR9s1lxJO8JPLU/ol36wjDq4HOgvkAT
         N4JtxT5/6pclllwWg7vxYNC39Vrc7jGrV3YjAo0vKfeuQw3rxbvblI1uNja7Bgl7PXVK
         ER1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1SGdDtltM4BjoEqmaBAVnt6OG/s9cAKnLE2bNpQ4H4M=;
        b=OwVUJiUk8njVlGFFdJzTi27RbvGpBEedGSr54jcP87OGA5BJQoSIZfqzAHyokl2wbk
         n2EFp53xhwDUECv9oxeB1NU2kcauWtfTAC+XsI1EK6sFiq4ZxMZBAUIeDe+c/zy8I1Fv
         aDs4LEYfdRyldusHYcqWhf83wshXYBwIzuiRsCOllmNY5+btRd1F7GbH44a0SjjfV2cj
         TpVU76wqAiL11QgcgKcllKV5kGDeUs0Y14CEFVCEUPACu6VGnpOhcUuPsoxMfErOs1Ke
         SjetxU0myjW3JrJkCdYPrH2SrTOo+omNj9i6Fn68s1paDDcf9uSB9UrTdmKa2J6Ob2OF
         J9BQ==
X-Gm-Message-State: AGi0PuZa6m05GNuSSIlXNRwdesk6WDidwiTyejrYZRce2jNzbKNj3WTM
	PqeR/+QVp0oM39OGBHwGd2vZ4ZgTHZjAy05gPys=
X-Google-Smtp-Source: APiQypITXjLjMCNstKyKdBcuHQbYKbaGE1YcmkV7hDSqiRaZ5AeUo/njjpKn4vQk5rDyaqn7W5HxOW+r+E7b6nX8GZA=
X-Received: by 2002:ac8:4e8d:: with SMTP id 13mr17093704qtp.293.1589210588029;
 Mon, 11 May 2020 08:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200510195050.3470835-1-raj.khem@gmail.com> <160DF24277C7EAFD.21511@lists.openembedded.org>
 <77ef2a6d2521c5bc7cab1ba109dc0ad03a17bae0.camel@linuxfoundation.org>
In-Reply-To: <77ef2a6d2521c5bc7cab1ba109dc0ad03a17bae0.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 11 May 2020 08:22:41 -0700
Message-ID: <CAMKF1sr3y6zrgJma3971Qc=oQOhigVMFUBHrebbbx1zJSkeBZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2 1/2] gcc10: Update to GCC 10.1 Release
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2020 at 7:22 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2020-05-11 at 11:23 +0100, Richard Purdie via lists.openembedded.=
org wrote:
> > On Sun, 2020-05-10 at 12:50 -0700, Khem Raj wrote:
> > > * Package new gomp header acc_prof.h
> > > * Package lto-dump which is a new tool in gcc10
> > > * All Changes are here [1]
> > > * Porting apps to gcc 10 help is here [2]
> > >
> > > [1] https://gcc.gnu.org/gcc-10/changes.html
> > > [2] https://gcc.gnu.org/gcc-10/porting_to.html
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > > v2: Correct SRC_URI checksums
> >
> > Fails, in gcc, nativesdk-gcc and gcc-cross-canadian.
> >
> > e.g.
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/1885
> >
> > (but many more)
> >
> > I think we may need something like:
> >
> > https://patchwork.ozlabs.org/project/gcc/patch/20200508131105.170077-1-=
hjl.tools@gmail.com/
>
> I added that in master-next and things do look better.
>

OK, I will include it in v3

> meta-mingw fails in gcc-runtime:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/1888

I have a local fix for this.

>
> also valgrind failed for qemuarm64 on arm64
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/690
>
> 10.1.0/ld: /home/pokybuild/yocto-worker/qemuarm64-ptest/build/build/tmp/w=
ork/aarch64-poky-linux/valgrind/3.15.0-r0/recipe-sysroot/usr/lib/aarch64-po=
ky-linux/10.1.0/libgcc.a(lse-init.o): in function `init_have_lse_atomics':
> | /usr/src/debug/libgcc/10.1.0-r0/gcc-10.1.0/build.aarch64-poky-linux.aar=
ch64-poky-linux/libgcc/../../../../../../../work-shared/gcc-10.1.0-r0/gcc-1=
0.1.0/libgcc/config/aarch64/lse-init.c:44: undefined reference to `__getaux=
val'
> | /usr/src/debug/libgcc/10.1.0-r0/gcc-10.1.0/build.aarch64-poky-linux.aar=
ch64-poky-linux/libgcc/../../../../../../../work-shared/gcc-10.1.0-r0/gcc-1=
0.1.0/libgcc/config/aarch64/lse-init.c:44:(.text.startup+0xc): relocation t=
runcated to fit: R_AARCH64_CALL26 against undefined symbol `__getauxval'

This seems interesting, I am trying to reproduce here. Should be
straight forward perhaps there is an assumption about glibc
version somewhere

>
> The build is still running so there may be other issues...
>
> Cheers,
>
> Richard
>
