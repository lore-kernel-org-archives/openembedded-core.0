Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B636CC64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 15:19:41 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.10346.1678288778524830299
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 07:19:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KiqjtIv3;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1755e639b65so19084262fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 07:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678288778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOoYIZX775Hn05u/Qz7BjRwGWEwfTTC5lEYPqT9MTMg=;
        b=KiqjtIv3TGW0j44oaE7C0+8BJc/Vdr5EbdrZTjtziCDC3X4ovNfABAtXsHy7ny99pV
         XaooCeyaOPMPd8PVNZkPNKXDHpT9A+1QPhXfW2JObh0QsGPe7llYC3LAddUW6kgqGaab
         2IG672li4xt40JCt+FGQ4MTuj1yPf+5Zph0il49uW/1lqIvNQntP/WdbuIeKs1XvCmK3
         N4CcOY2meV8Kdxcvr2iOf8mIqHWH+jqRhMVQQ/kDM9+WeKWyuoewlBLZelNlhJn1DU6o
         1vU7WMJ5b6nZlcX7Nvh2Kp0fb1L6l1Vuy+5saKLCLs0X3Kd99CA8+b0/CCrRK2ZBSs73
         zC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678288778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOoYIZX775Hn05u/Qz7BjRwGWEwfTTC5lEYPqT9MTMg=;
        b=oxsEA29suLCHHKtzCM7I85S8vSt3Mi467ye71hbijJfZVii6WNc2aE5sBPYgqLk/Us
         WORX7Z6EiYOwQ3WPpm3pAT6bb/UwBJuP+fTwfPs0ZO9cdlIU3g2vQwaoUfO92KU3/JoL
         LVd11fmBsehrL76JL/TBBwXpP9Gb61oRvXC1uQFRwDqWILAgCs3EbEFXEbMHo7S/3Dq8
         u1faFIvAIt8/fGcWlkMEe18yT4WqbmG97V3WFn1IBbqwR0zxZOzho3sObtV0eAOmcXCX
         kjfWzrBDDgD6DnM4ZjS2HxytzRJb2fBcaDviqPP0hHV1cOezJXX8BXGLHni4WCggdj+d
         O0Xw==
X-Gm-Message-State: AO0yUKXLFvvZPY/VITSlbIWugrGjwjNaTgXlKasXgzaEfI8TNpixE2gk
	oqrnySa5Xc/d3yF+juscjSGXkLsvurj+XIYqJzE=
X-Google-Smtp-Source: AK7set+LGmJawg6K/dRbbLUtQk6RbhfMtj/trpiCjjFozGhNepnGXGM8OwZK7Cns7ejcN5uJEpEZ1xOov8Talqz9iRU=
X-Received: by 2002:a05:6870:8c34:b0:176:68fb:88a6 with SMTP id
 ec52-20020a0568708c3400b0017668fb88a6mr5297438oab.4.1678288777681; Wed, 08
 Mar 2023 07:19:37 -0800 (PST)
MIME-Version: 1.0
References: <20230223065816.3151823-1-raj.khem@gmail.com> <174A67E2AA88DEE8.12537@lists.openembedded.org>
 <4d5be496016f74255d2dbf5d8ae56ea45998b2b4.camel@linuxfoundation.org>
In-Reply-To: <4d5be496016f74255d2dbf5d8ae56ea45998b2b4.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Mar 2023 07:19:09 -0800
Message-ID: <CAMKF1sohb38iktD0vWE0yn-7uApqYCPUbBapasS8ptX9RqbovA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: Enable --enable-new-dtags
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 15:19:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178177

Awesome, thanks!  I think any recipe which is using
INHIBIT_DEFAULT_DEPENDENCIES could
run into these sorts of errors.

On Wed, Mar 8, 2023 at 3:53=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2023-03-08 at 09:33 +0000, Richard Purdie via
> lists.openembedded.org wrote:
> > On Wed, 2023-02-22 at 22:58 -0800, Khem Raj wrote:
> > > Use DT_RUNPATH over DT_RPATH. If DT_RUNPATH is present, LD_LIBRARY_PA=
TH is searched before
> > > DT_RUNPATH, Search order is DT_RPATH then LD_LIBRARY_PATH then
> > > DT_RUNPATH, this order ensures that injecting
> > > malicious shared objects is way harder with DT_RUNPATH.
> > >
> > > This is now default on major linux distributions already
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-devtools/binutils/binutils.inc | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recip=
es-devtools/binutils/binutils.inc
> > > index b2dbf241df..c69d29448f 100644
> > > --- a/meta/recipes-devtools/binutils/binutils.inc
> > > +++ b/meta/recipes-devtools/binutils/binutils.inc
> > > @@ -96,6 +96,7 @@ EXTRA_OECONF =3D "--program-prefix=3D${TARGET_PREFI=
X} \
> > >                  --disable-werror \
> > >                  --enable-deterministic-archives \
> > >                  --enable-plugins \
> > > +                --enable-new-dtags \
> > >                  --disable-gdb \
> > >                  --disable-gdbserver \
> > >                  --disable-libdecnumber \
> >
> > FWIW I 100% agree we should look to enable this.
> >
> > Sadly, doing so exposes a bug where things that should rebuild don't.
> > That manifests as a failure in the reproducible test builds on the
> > autobuilder. I suspect a taskhash problem somewhere, maybe hash
> > equivalence, maybe somewhere else, hard to say without debugging it.
> >
> > I've been trying to get to this to help. The first issue was to sort
> > the other gdb issue this appeared to trigger but was in fact unrelated
> > and an issue from the recent binutils/gdb version upgrade. I've
> > debugged the initial buildtools tarball bug and re-deployed buildtools
> > on the infrastructure. That fixed some of the manifestations but not
> > all, I then debugged the remaining ones, worked out the regression in
> > upstream gdb and sent a patch yesterday which was merged upstream to
> > fix it.
> >
> > I am trying to get to helping with the problem this patch causes but
> > these things take a ton of time. Whilst I may get paid to work on the
> > project, I am one person and I'm getting pulled in a ridiculous number
> > of directions at once.
> >
> > People should worry this triggers a reproducibility issue, it means
> > there is a bug somewhere.
> >
> > I am hoping to get to this and to help try and debug it but the patch
> > cannot merge until we get to the bottom of the issue it triggers.
>
> I did have a look and the issue is actually fairly simple, glibc is
> missing a dependency directly on binutils. Most recipes have this
> magically, the magic is disabled for glibc as it is part of toolchain
> bootstrap and has to be manually curated.
>
> Adding the missing dependency appears to resolve things locally so I'll
> send out a patch and we'll have to run some autobuilder tests.
>
> Cheers,
>
> Richard

