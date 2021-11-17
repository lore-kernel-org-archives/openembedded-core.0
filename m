Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA14C433FE
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 17:41:35 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.10484.1637170893844048490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:41:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TZbbcbCY;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id y13so14465017edd.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=CaBOoAU4rErndhhDN5wXntR2FsQAx36m+QCdNi46Qoo=;
        b=TZbbcbCYcYSichS9PC22aS/CrU3eOuS+k54W1i49w6Ax0LvIxDuheYsXAcjwZweqdW
         72lmrrefTPEZYf8GJO8IycvNP2Qvm8x4ubsR/TEZqPFpAW/ImnO1j7NLeLLpanjh+nCP
         oztsfd7cI+CwXO1W2JOcPxDuyE/beCEAiRP4v/fvBmHeu1S9IxzTi+5TRSezvrIkEmfZ
         +D9KOum2eyHP6zpFtYSfWmyspRQ8CSTAN+gIHqzAxuOTo7olz67bXcyjNMlnAjwIDQsa
         UMTEDvzHxsH7VxmPLoy63HpuiITPe8ElGufV+zvsMj2kSf/+s+Fvbp+zkRbb7YmTSoJl
         6qYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=CaBOoAU4rErndhhDN5wXntR2FsQAx36m+QCdNi46Qoo=;
        b=FPJdo3x5EjQTOqTGkPk9d5Woic9HReXX7XQmhQSJyO99rRAOfzBlXA/NM2x8mkh9oW
         kZV7VKx3cnLj1GxEstnUqa6vF9Vm7dT1TJq+6MOjMQG1sg//XV8wDJwOYsxIXEQwRZ+T
         OcBrJqFOarr1dmV6by/zY9HQh8fCNbUM9Kh4B+lxJESmEFfJ+4rBKwqhb9Vf32EllE0S
         7qaQhealUfrIAKMDxEOmOdzC67qO8kiemI3zCYpNLFyrfFt314xcEkwV+PDgGxvkqfq7
         SIX7UrOqFidyTIrcI3KIebUAEtDeYUapOBNEl1YSSS0sYxr2hGD/OytrAto0Mh0igTUh
         lcYg==
X-Gm-Message-State: AOAM532g5sdEOh4pc6pYFYoNCbX7sVC3ZbtvCwWSGIKRKl+aFd6jW18g
	Atom6R5bpQ2TJk8bOQXpgcs=
X-Google-Smtp-Source: 
 ABdhPJxzT84yb+sdtBxNwHO4iIg/LbA6GTzMjwZCEIJjSy7O8Of7awUVEun/P9Wt0A8KTTPW8vd83Q==
X-Received: by 2002:a17:906:b854:: with SMTP id
 ga20mr24267881ejb.308.1637170892279;
        Wed, 17 Nov 2021 09:41:32 -0800 (PST)
Received: from [192.168.1.112] ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 jx10sm242133ejc.102.2021.11.17.09.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 09:41:31 -0800 (PST)
Message-ID: <58f4aeaccff5aa6cc9b92144e20cc1831d503f99.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 0/8] systemd: allow building for nativesdk
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	paul.eggleton@microsoft.com
Date: Wed, 17 Nov 2021 17:41:30 +0000
In-Reply-To: 
 <CANNYZj9BTbgsZznvdiP3Fhcc9Wwmb_5F3AnZ1gGyS0TKnv6gqQ@mail.gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
	 <CANNYZj-tjH20-ocHq_7DWC6qaPA0XhKfk4cGXMPNbs-_YXp8jg@mail.gmail.com>
	 <510650712bc36f761fc9c43d47a1761bc4d60366.camel@gmail.com>
	 <CANNYZj_1r4Gj_CwBE7Rrr3NedxH9saVQeEuu1mpBFx9A=stDGQ@mail.gmail.com>
	 <fe49ca32907173d954160ead0c714eaa654a3ae5.camel@gmail.com>
	 <CANNYZj9BTbgsZznvdiP3Fhcc9Wwmb_5F3AnZ1gGyS0TKnv6gqQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-x0AslL7N+BikIUcKXdpD"
User-Agent: Evolution 3.38.3-1+plugin 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 17:41:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158442


--=-x0AslL7N+BikIUcKXdpD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-11-17 at 17:44 +0100, Alexander Kanavin wrote:
> On Wed, 17 Nov 2021 at 17:11, Luca Boccassi <luca.boccassi@gmail.com>
> wrote:
> > > What I'm trying to say is running those systemd analyzers should
> > be
> > > enabled in regular yocto builds first before it's enabled in
> > SDKs.
> > > It's not a good idea to have a feature that is available in SDKs
> > but
> > > not available in direct use of bitbake to build recipes.
> > >=20
> > > Alex
> >=20
> > But it is already available? And it has been for a long time:
> >=20
> > https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/s=
ystemd/systemd_249.5.bb#n411
>=20
> This is packaging the tool for the target images; what I propose is
> that it's built and used natively.

Which is what this patchset does? Again you can't build these recipes
to run locally without these changes, that's the entire point

--=20
Kind regards,
Luca Boccassi

--=-x0AslL7N+BikIUcKXdpD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCSqx93EIPGOymuRKGv37813JB4FAmGVPsoACgkQKGv37813
JB5M2g//Uhrl4jGkcaa3l6zCBY7qaOAD0vpMrAaFeBKSjIuYwVScnmi5JH5+UvRU
0u0Rbt77SOVYlzOH56sJwY7P4GGDe7JIZDrnVurfIzoOVcm/WBsBbz64C4bq64xy
y5EH0yr6uOOarbT31aMghfngn9wZR7zmfigtCdQchR5zwwiXKpqGVm5e/h+CGquD
etcOt5sPMlZkbpu8/3xuAAFKKYsObDkSlVOap8VXr9UWFfXKjX/EzXcfygC3SHFX
wFkC3kGpZwuyON4i4ipDX18Hvcp8UJo5N1My1Hrwn/eS0lgBRPdYtTmVpAeuPmn+
5x1N22fCKbh6RKjwJWP1vi2rTxr/c4Pp8+bW4J0hbxlgAxifnP8V+z5nbbh9Smo+
781ysVx33mO+RUBNfRh5+z8JoqbPFri4ov0TBa8p1ZaijMM9JAIvI8RNM9Am2xrC
ZAYhWHOtPQLkqjB5OJtEJ2tvBl/IWf4DpOLWUH73cUPS/2w0lb7+qxfz4ukGGETY
YQkD2KUV62UMVQZBakgMQYZjoTNRZN4Ovgny4ixSQTn57Cwp+mi13jfMEWadyWnH
6uurr6NGVSSPdGBdS02HAKYfddgxC9maVRH4JtBXX/EUE28qA3LNMRKKDs2v8Pem
50sSQogT/Bnp309ryfkSrULutdqS38REWqE9YpmeEarHOg9F7Bw=
=MYCq
-----END PGP SIGNATURE-----

--=-x0AslL7N+BikIUcKXdpD--


