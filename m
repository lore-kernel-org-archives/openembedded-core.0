Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C366C53210
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 14:57:22 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.14696.1672930636243130160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 06:57:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K8OETjaE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so1503930wms.4
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 06:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BktDNt8mwryv5/uN3Fhw8L2EpYLUMq+PwFLIwyATbM4=;
        b=K8OETjaEBa4gOhWXPONwGrIxnsT3d5mLjWzUsTdmvkH60aJkenWokLhkN+IFWlxUIh
         nfYRB5+3l3CfT0vg5aJfA3iRGXHoF+mZNYCqx+6ZKg9wEIlzZj+pt8gHbF16HUCGHIkm
         A5KgoymYV66x0S8EKELRIKQcRmxPSTVX4JafA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BktDNt8mwryv5/uN3Fhw8L2EpYLUMq+PwFLIwyATbM4=;
        b=62hJgI1PxLzDesUQpUnXzQNuSrghl9oYu7WLoIGFsKZV917pcWzO+mZEh4k7nF4G0A
         z1vWFADKPom3o71oTL2g97MCLJbwey6O+mbZj0ojK35OXO+04+UcfN4s3kslFXWT5t5U
         vd9PJ+JwfNQNtT398IznNy7WUCSuOxabyp2vjNtpUsX1JEykzvmb55OwnpCr1Q08Y3/m
         ODzYex0Cv32ZS+6yj+xyJ7mYgA1QSvwC8g09OMssb0JicWgjz37oF39xNzQBjUHS0WvR
         1tTgQeDQY8O4lBU9439umLYwZm+DVfQtqy7Pkxyfl+sEbN2Ws8SS4sbXP+CvGEpD55nK
         SvwQ==
X-Gm-Message-State: AFqh2kp0Ma7F7ykeuuYQJAvkWLBkEHnIBGvnDYaHzlEjgdXGHnkcFl9x
	YnyMoPmR2WeRzpTXvnk2W4lO5A==
X-Google-Smtp-Source: AMrXdXsyYcEMXpyAcNADOYj7Ju8ncOfvsm5V1exu5UBf6kxjjL20MHGbNz2OjugbeDvPFxpXcP8cpg==
X-Received: by 2002:a05:600c:3d86:b0:3cf:9ac8:c537 with SMTP id bi6-20020a05600c3d8600b003cf9ac8c537mr37848595wmb.14.1672930634496;
        Thu, 05 Jan 2023 06:57:14 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:990c:167e:ef8f:7586? ([2001:8b0:aba:5f3c:990c:167e:ef8f:7586])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c358c00b003d237d60318sm3045964wmq.2.2023.01.05.06.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 06:57:14 -0800 (PST)
Message-ID: <d92b4751144e16c0d97823b7eef1b88b3a20b760.camel@linuxfoundation.org>
Subject: Re: [OE-core] is "poky" distro defined to use "sysvinit" as
 INIT_MANAGER?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, Khem
 Raj <raj.khem@gmail.com>, "Robert P. J. Day" <rpjday@crashcourse.ca>, YP
 docs mailing list <docs@lists.yoctoproject.org>
Date: Thu, 05 Jan 2023 14:57:13 +0000
In-Reply-To: <b725dbd2-3825-1eb7-3f71-a19a17c2ef7f@bootlin.com>
References: <2893205d-57e1-e63e-5c12-c57c7bbcb924@crashcourse.ca>
	 <CAMKF1spKw-X-JTvdicfBBNNGk93EPL=gqD3jixvJkb7YfT1P0g@mail.gmail.com>
	 <1736D38C7177CA6A.6604@lists.openembedded.org>
	 <b725dbd2-3825-1eb7-3f71-a19a17c2ef7f@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 14:57:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175534

On Thu, 2023-01-05 at 15:23 +0100, Michael Opdenacker wrote:
> Am 03.01.23 um 15:41 schrieb Michael Opdenacker via lists.openembedded.or=
g:
> > Hello Richard,
> >=20
> > Trying to improve the documentation about the selection of the init=20
> > system, I'm jumping back to this old conversation, following a change=
=20
> > that you made (https://lists.yoctoproject.org/g/poky/message/12760).
> >=20
> > Am 06.07.22 um 18:40 schrieb Khem Raj:
> > > On Wed, Jul 6, 2022 at 12:38 PM Robert P. J. Day=20
> > > <rpjday@crashcourse.ca> wrote:
> > > >=20
> > > > =C2=A0=C2=A0 not sure why i never noticed this before, but i starte=
d a new
> > > > project from the poky layer (not OE), and realized that poky.conf
> > > > explicitly sets:
> > > >=20
> > > > =C2=A0=C2=A0 INIT_MANAGER =3D "sysvinit"
> > > >=20
> > > > which can't be overridden in my local.conf. if i want systemd, i gu=
ess
> > > > i can initialize my project from the OE layer, and i also notice th=
at
> > > > i could use poky-altcfg.conf.
> > > >=20
> > > > =C2=A0=C2=A0 but is there a reason that the default poky-based proj=
ect fixes
> > > > INIT_MANAGER to "sysvinit". perhaps just for simplicity?
> > > >=20
> > > poky defaults to sysvinit.
> > > poky has poky-alt distro fi you want to use say systemd
> >=20
> > But why not setting INIT_MANAGER with "?=3D" instead of "=3D" in poky.c=
onf?
> >=20
> > This way, we could just override INIT_MANAGER from local.conf.
> >=20
> > I checked that the generated system works. This would make things=20
> > easier to document, unless I'm missing other reasons.
>=20
>=20
> Richard told me on IRC that, from memory, this was set because of=20
> interference poky-altcfg (if I understood correctly).
>=20
> I understand one recommended way to have systemd instead of sysvinit in=
=20
> Poky is to use "poky-altcfg" instead of "poky" as distro.
>=20
> Similarly, I guess I should use "poky-tiny" if I want to use=20
> "mdev-busybox" as INIT_MANAGER.
>=20
> Then, I guess I'll document something like this:
>=20
>   * With the OpenEmbedded build system, you can choose your init system
>     by setting INIT_MANAGER to "sysvinit", "systemd", "busybox-mdev" or
>     "none"
>   * BUT if you're using Poky, that won't work, so your options will be
>     to use either "poky" (sysvinit), "poky-altcfg" (systemd) or
>     "poky-tiny" (mdev-busybox).
>=20
> Does this sound like the right way to document this?

We should really fix poky so this works correctly. I just have a memory
of trying to fix it and it not being as straightforward it first
appears. I'd then have got distracted by the next problem :/

Cheers,

Richard

