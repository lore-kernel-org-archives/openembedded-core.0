Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BF3C35274
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 23:49:28 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.231.1702684158622154819
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 15:49:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EGRsqqdX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40c3fe6c08fso13030605e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 15:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702684157; x=1703288957; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r2Orhe9drs72ZZ0b673rO2eA77pjeOlS4OX3ljiJn04=;
        b=EGRsqqdXhANCeB/gNl6/SVrEYDk9ACfZ9jHDmbw0Hpx/DHQMZZnwoxehcJSDWwNh4Z
         1Vsy8JTz/ik/B5SnxjsZZbYJDbqRjarcJmd2vQvQK542j87+2CYSlvPhW0lvjT6+P06f
         t5Eje4Nsw4psFRt8FH4tLylqQURO1VcxOV1D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702684157; x=1703288957;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r2Orhe9drs72ZZ0b673rO2eA77pjeOlS4OX3ljiJn04=;
        b=i1QWlVFJR3GW8LBJIDnDBpe/JW/mPygXx56nm1ApgcyPPI3GplG5nLUhxGGEswZ+I0
         3QAng06qsGgk83rNjmCRxhcDKlahbnzNHjPFUcm844ZnD/+4yt1V5POOMi+rnk6gptyU
         ITw/aagmgQj5IOgNc8uLQvZ4DlrjkqBxrk61H8GgSJLHD4RC29IQmaDRTQpOQ24agY8I
         rZilDezMr2HNAo7sFisiaXX/BwMrx3ObXkImOO94egcf4CpmTh6D5ZScaGWSv9Ene3tl
         q3o/Lemzgw6uhgO/MXQ3h8/g+9Apdw2Ul6yY+V/bUirbt3425F3VSB6Fhbg5vlsNUuFN
         nVYA==
X-Gm-Message-State: AOJu0Yy19UAf3H3QRNiiShHceQEQT+4uwL70Bif6kai1SqwBrSCWZdid
	j7+/X6enJRbv1zoQ1zzW8UvDZg==
X-Google-Smtp-Source: AGHT+IEzLuKQldk2crePeS/cSbXmk6Qj7GngJi4RXbKQuWEPFQIiaLci3Bw2GJScVFdknxXXIWEPow==
X-Received: by 2002:a05:600c:3794:b0:40c:32b3:f297 with SMTP id o20-20020a05600c379400b0040c32b3f297mr4451317wmr.55.1702684157017;
        Fri, 15 Dec 2023 15:49:17 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fec1:d6ff:46af:def5? ([2001:8b0:aba:5f3c:fec1:d6ff:46af:def5])
        by smtp.gmail.com with ESMTPSA id j25-20020a05600c1c1900b004076f522058sm33474745wms.0.2023.12.15.15.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 15:49:16 -0800 (PST)
Message-ID: <cc78e7c4defb778dc1ab1a61d9c2558bad72e9b6.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 1/2] bitbake.conf: Add runtimedir
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 15 Dec 2023 23:49:16 +0000
In-Reply-To: <CAJdd5GbRsRKDR2dK7DnqMBV3rpZgV7s4=iQjY=877tiYKrTkBg@mail.gmail.com>
References: <20231215203404.2913433-1-JPEWhacker@gmail.com>
	 <08d347b60331523717b0d67152913a059b3188dd.camel@linuxfoundation.org>
	 <CAJdd5GbRsRKDR2dK7DnqMBV3rpZgV7s4=iQjY=877tiYKrTkBg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 23:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192553

On Fri, 2023-12-15 at 16:47 -0700, Joshua Watt wrote:
> On Fri, Dec 15, 2023 at 3:47=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Fri, 2023-12-15 at 13:34 -0700, Joshua Watt wrote:
> > > Adds the path to the runtime state directory (/run). In particular,
> > > systemd units need to have the correct path to the runtime directory
> > > because RequiresMountsFor doesn't follow symbolic links. This means t=
hat
> > > if a unit calls out a directory in /var/run (a symbolic link to /run)=
,
> > > it may actually start before /run is mounted. The fix is to have the
> > > unit specify a directory in /run instead.
> > >=20
> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > ---
> > >  meta/conf/bitbake.conf | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > index e7826e7af96..55166d01784 100644
> > > --- a/meta/conf/bitbake.conf
> > > +++ b/meta/conf/bitbake.conf
> > > @@ -31,6 +31,7 @@ export sysconfdir =3D "${base_prefix}/etc"
> > >  export servicedir =3D "${base_prefix}/srv"
> > >  export sharedstatedir =3D "${base_prefix}/com"
> > >  export localstatedir =3D "${base_prefix}/var"
> > > +export runtimedir =3D "${base_prefix}/run"
> > >  export datadir =3D "${prefix}/share"
> > >  export infodir =3D "${datadir}/info"
> > >  export mandir =3D "${datadir}/man"
> >=20
> > Is there anything currently using that from the shell environment?
>=20
> No, nothing is using it today.
>=20
> >=20
> > Most of this is historical and in many cases not necessary so I'm not
> > sure we want to add to it...
>=20
> Ya fair. Are you saying we shouldn't export it, or we shouldn't add it
> at all. I'm fine with either way, the latter just means open-coding it
> as "/run" where necessary (e.g. the rpcbind patch)

I'm just saying not to export it. We have enough of a mess already in
the environment!

Cheers,

Richard

