Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53778C35274
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 23:47:28 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.194.1702684043126993906
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 15:47:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rv4bJizw;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cc5ee69960so147761fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 15:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702684041; x=1703288841; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUriJ2ABSRPFnMYEcsCkqr0vwRNHJi/RXyOqouRefeQ=;
        b=Rv4bJizw0sgYQKNAdeqWhRQseJIWtwgETsERilWJMlbp50zp/tEpWgyA+cTuGUi76l
         zbU6GPL05OmcbD7oP9E1+KopEEY8pu4y0McsRFKPnVtd6oz9xsBIyEPXhIS2DVTBSS1H
         9PNJbxqVrzJ9+RqjS0AjYMy7gRgo/eE8Sa5cuGl6T6jXPo3Kf/eUhgsdM4XNPPmNdDoO
         lYf8mzXdtL73Uq+j1A9w4yj372bz5sDR8y65E+s25sEjMpy53nh6Bvy1qVIGc47CJM5m
         23HgFTjK9YIlLUdJsXRYlOKq9+LJ781BjYCRfxMHXJH6uPsAiTUhd7N+HuJMOkEbNzH+
         Xz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702684041; x=1703288841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUriJ2ABSRPFnMYEcsCkqr0vwRNHJi/RXyOqouRefeQ=;
        b=STExP5MS7vge88Oufbc1fhY5nl4OQkNlXd0AxiBQKTU8SSsKv3V0F9/es6Td5EuStT
         w52CliJ7AAzgSO8s+pRyc3wTgocCpG6NKGo5qOR28BK92rzbyNirhkzmE4uZaJeBBJSG
         shYnzfOhEcWTNYYomRsg61wL/Ammi5IzPCch1T3V877JwdkFlN8Yh9b8QYwG+MuQwdfv
         ACjKGgskRx2LW8taz8uu2hqeVrZf7nNVDamsMacn6Vup19xkyx2tEdkwFwY0SOqk4xyW
         kUMQKX9Cie4J9Dmm5Gz602BqK5zvswtzXRbJdKdbaCiYhstsKImup7QyPfmDz8dfvC2o
         KUHg==
X-Gm-Message-State: AOJu0YwLgCjUsnQZjEihUjvEP3SbKwhpgxnob0SOSHoZs9N+m3OdY3bE
	OLBdJAGs2TMVu7VMcNlKeUxaAYlzmKB2SfCxJOg=
X-Google-Smtp-Source: AGHT+IH4v/k5hyl4WW4tM6KWEP4i5YsZkWXAaxYocQEfaPdXiv5u6dxrCSfQq/9flH2Cn4dWXh4WVSbMyPtbm9NbGww=
X-Received: by 2002:a2e:be8c:0:b0:2cb:2e7e:2ca with SMTP id
 a12-20020a2ebe8c000000b002cb2e7e02camr4492965ljr.13.1702684040929; Fri, 15
 Dec 2023 15:47:20 -0800 (PST)
MIME-Version: 1.0
References: <20231215203404.2913433-1-JPEWhacker@gmail.com> <08d347b60331523717b0d67152913a059b3188dd.camel@linuxfoundation.org>
In-Reply-To: <08d347b60331523717b0d67152913a059b3188dd.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 15 Dec 2023 16:47:09 -0700
Message-ID: <CAJdd5GbRsRKDR2dK7DnqMBV3rpZgV7s4=iQjY=877tiYKrTkBg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] bitbake.conf: Add runtimedir
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 23:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192552

On Fri, Dec 15, 2023 at 3:47=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2023-12-15 at 13:34 -0700, Joshua Watt wrote:
> > Adds the path to the runtime state directory (/run). In particular,
> > systemd units need to have the correct path to the runtime directory
> > because RequiresMountsFor doesn't follow symbolic links. This means tha=
t
> > if a unit calls out a directory in /var/run (a symbolic link to /run),
> > it may actually start before /run is mounted. The fix is to have the
> > unit specify a directory in /run instead.
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/conf/bitbake.conf | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index e7826e7af96..55166d01784 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -31,6 +31,7 @@ export sysconfdir =3D "${base_prefix}/etc"
> >  export servicedir =3D "${base_prefix}/srv"
> >  export sharedstatedir =3D "${base_prefix}/com"
> >  export localstatedir =3D "${base_prefix}/var"
> > +export runtimedir =3D "${base_prefix}/run"
> >  export datadir =3D "${prefix}/share"
> >  export infodir =3D "${datadir}/info"
> >  export mandir =3D "${datadir}/man"
>
> Is there anything currently using that from the shell environment?

No, nothing is using it today.

>
> Most of this is historical and in many cases not necessary so I'm not
> sure we want to add to it...

Ya fair. Are you saying we shouldn't export it, or we shouldn't add it
at all. I'm fine with either way, the latter just means open-coding it
as "/run" where necessary (e.g. the rpcbind patch)

>
> Cheers,
>
> Richard

