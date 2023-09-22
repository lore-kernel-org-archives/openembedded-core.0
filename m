Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16490CD4847
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 17:44:54 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.3963.1695404684682490617
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 10:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IVwj6yBt;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1dc9c2b2b79so957482fac.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 10:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695404684; x=1696009484; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERbeIuFcyFdlPiVQmHckAT+Ilxg9I2uNED4EPcpj+Wo=;
        b=IVwj6yBtRqCSdmqofFiU7GCMmNwG4Ym9WD8Em51MiNuzIj01FHIw76RUc0lvGl+SwZ
         DC1Z3/Cb3ZLz7SWBQPKUvtCH1pm0c+HJatT3Oj9Hv7sBZkdXarnEdy3tgcoRffvvWd8y
         ehTL+0RN4pJVwllNJXdwAW0TJLUNc2yUESWjOCDSP8pR2O9IyPzFvpYwiIJMvxceiJ/g
         R6pFCscWkVJrrnDnFqAFgapX+YuumsVHG5Kliiuq5P/59KGw0bzMOX063EPnedk6l5S9
         gMJvtgvMOQm+RgyuuSp79ufAVYwZyMaxbAcpYqaBqp/VL/mZONY9hlppxBfypjeFPcmq
         syMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695404684; x=1696009484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ERbeIuFcyFdlPiVQmHckAT+Ilxg9I2uNED4EPcpj+Wo=;
        b=u3SmtrUoQXVtltU1VJdJ3XX+Xjc2Q2g1NEzTJq9FG518zh1mUbGGIqsO10hNluhXwE
         sLT9tHaFzjF9b94plgLhb418Pp4tcQtq66L9a2311z2viEwDYI/EQ2DtxEZOnjxKn9Am
         cCX2rTNqpqFcRy/wm0GanmcWhdNIb3+7W4FDMudVCfEAxzP43ltutsQ/WlVjYV9HUlMy
         qKD5tJuE7irrzmChqwB0SWtZpUOHlalHmNoblEFMTeci9cVrV0E6+g/K9rgjmEuLRSe5
         hl7XxZwypyScxZFamYOQrI6xNWKqS97nTSVSG/o9UOM1arCZoEYyhiP90+I3cB3PLnC4
         ETsg==
X-Gm-Message-State: AOJu0YzXtZDFX0VJZ3M0iXrJp++GXKbKqDbBd/pbDiwog8EJW8xkMTT2
	rXe7j8qAlBsnKY16qbiBFug4ceZrKZSaNEPOiD8=
X-Google-Smtp-Source: AGHT+IFg2DqJE9bSgxYyg1WSiImYCwf/M9EtaBl7u48upb+iofC+WnUg8woQTgfW+s3KVzXWHzVk4X2Cs21FbGjASaQ=
X-Received: by 2002:a05:6870:213:b0:1d4:d016:229f with SMTP id
 j19-20020a056870021300b001d4d016229fmr163385oad.10.1695404683772; Fri, 22 Sep
 2023 10:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230922011520.23704-1-raj.khem@gmail.com> <20230922160715acd68410@mail.local>
In-Reply-To: <20230922160715acd68410@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Sep 2023 10:44:17 -0700
Message-ID: <CAMKF1spwTR8At8TNshFutm_6y852KgqoNsSsZSgGf1RU-qW4NA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] musl: Drop MIRRORS
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 17:44:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188130

yeah I am trying to investigate, locally I reproduced it once but then
I did bitbake -ccleanall musl and then it started to work.

I see this in log.do_fetch on AB

http://sprunge.us/c5J8K3

says

fatal: protocol error: bad line length character: erro


On Fri, Sep 22, 2023 at 9:07=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/8149/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/7837/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7859/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/7193/st=
eps/13/logs/stdio
>
> On 21/09/2023 18:15:20-0700, Khem Raj wrote:
> > When using mirrors fetcher gets into a weird state when shallow clones
> > are enables.
> >
> > ERROR: Bitbake Fetcher Error: UnpackError('No up to date source found: =
clone directory not available or not up to date: /mnt/b/yoe/master/download=
s/git2/git.musl-libc.org.git.musl.git; shallow clone not available: /mnt/b/=
yoe/master/downloads/gitshallow_git.musl-libc.org.git.musl.git_79bdacf-1_ma=
ster.tar.gz', 'git://git.musl-libc.org/git/musl.git;branch=3Dmaster;protoco=
l=3Dhttps')
> >
> > Anyway the mirrors were added as backup when we had issues with musl gi=
t
> > in past.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/musl/musl_git.bb | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/mus=
l/musl_git.bb
> > index dbc31e1d83b..72253636dc8 100644
> > --- a/meta/recipes-core/musl/musl_git.bb
> > +++ b/meta/recipes-core/musl/musl_git.bb
> > @@ -10,15 +10,11 @@ BASEVER =3D "1.2.4"
> >
> >  PV =3D "${BASEVER}+git"
> >
> > -# mirror is at git://github.com/kraj/musl.git
> > -
> > -SRC_URI =3D "git://git.musl-libc.org/git/musl.git;branch=3Dmaster;prot=
ocol=3Dhttps \
> > +SRC_URI =3D "git://git.musl-libc.org/git/musl;branch=3Dmaster;protocol=
=3Dhttps \
> >             file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.=
patch \
> >             file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes=
-to-l.patch \
> >            "
> >
> > -MIRRORS +=3D "git://git.musl-libc.org/git/musl.git git://github.com/kr=
aj/musl.git"
> > -
> >  S =3D "${WORKDIR}/git"
> >
> >  PROVIDES +=3D "virtual/libc virtual/libiconv virtual/libintl virtual/c=
rypt"
> > --
> > 2.42.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#188034): https://lists.openembedded.org/g/openembed=
ded-core/message/188034
> > Mute This Topic: https://lists.openembedded.org/mt/101513420/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

