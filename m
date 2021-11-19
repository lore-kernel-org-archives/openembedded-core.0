Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A3D3C433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 11:36:05 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.7739.1637321764595186931
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:36:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ddUjjIRa;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id x6so29733450edr.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=XwNbjdGXxC4H2fE7y48kpB8PPu1qSRHns9Nvnosf4TQ=;
        b=ddUjjIRa8OCqO7QLpcEHvXZdvF/e84UQozVboAtilWlIv8aHWpop9br5qRa1+HAcg3
         BK3VLwCuyQPPddqQtF0YJP/aSMrYz8vOKR6pb2DeaZU8gUJhars0u91lAo1w2z82D+Da
         SvBbKoMUs8EluMdst33S7uNXJJKzaqssHnF7A78wiGFNetrTskvCIafOssu/aAtXrnQ/
         OOchW/qzSiIBFmrJBBfHTNtxohlxkXcqh4rHoVro3b/ACKCE8bDFNfyN0nEzybHv0k/v
         Si1zsiMQttMJbA0JinwUaJRQW9KLEBVdFCWGsYhRRTCLvsiDPmxSgT7yu7n78y3HLwdu
         YYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=XwNbjdGXxC4H2fE7y48kpB8PPu1qSRHns9Nvnosf4TQ=;
        b=TGmB4qSD5F4zLd6tK1lcZDr3YQeBFbSZoExynmUtq23XRDDzA2ufM4ymjdT1QAyh/F
         FGPUzjz6TDi4sMTIjfdNfqv5CHIl402tzzpF2Ts4SzCPL/Scww4cOEq4ARFBRLAeV//9
         MTU24OjxYYNBA0q6mlYWQWzm1yV0JS9ivLLqtoRQE9u7qyNXfyoJOHEm1ilHdTSbpGuq
         I6PPmb+VAc5EB3oR1SalRrSdS1WIMCQSqT218P1tzFZXdG/VFjuSZOO0tIPQtwLnWZqi
         Nv1DHP39W/jWt4GOiKJ/r6IvgMOlcz41XjamY/ItW7OpPiFuOmwMMamS4y+DOVyKcNtg
         CoLg==
X-Gm-Message-State: AOAM533TIQ7RG94riXL3NtHPZr8Zn2i+4uykXxIAIcF4v9MC+eh7YKSN
	e1laEKqwdCWC6TLK3e/E8LsnctoFuwDx4A==
X-Google-Smtp-Source: 
 ABdhPJydPqDIM+wbk4QMUBntUKZI5szRhPcLS2+7duqedk9lToy6N8hnetuNMpjQRzZ/e/ARTmN/5w==
X-Received: by 2002:a05:6402:1e93:: with SMTP id
 f19mr23642670edf.60.1637321763072;
        Fri, 19 Nov 2021 03:36:03 -0800 (PST)
Received: from [192.168.1.112] ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 z1sm1306080edq.54.2021.11.19.03.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 03:36:02 -0800 (PST)
Message-ID: <b3fe78a5701f12313b5901565fc0836406f06c0c.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 5/8] volatile-binds: add nativesdk
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Date: Fri, 19 Nov 2021 11:36:00 +0000
In-Reply-To: <9f94181cd068f119c33f964b22b9d436258c95c9.camel@gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
	 <20211117123201.111905-6-luca.boccassi@gmail.com>
	 <24a38d0e0d0dddc136c3840cecd18c88236d9b20.camel@linuxfoundation.org>
	 <9f94181cd068f119c33f964b22b9d436258c95c9.camel@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ycxkyxQOul29kKAziCUm"
User-Agent: Evolution 3.38.3-1+plugin 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 11:36:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158515


--=-ycxkyxQOul29kKAziCUm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-11-17 at 17:42 +0000, Luca Boccassi wrote:
> On Wed, 2021-11-17 at 17:40 +0000, Richard Purdie wrote:
> > On Wed, 2021-11-17 at 12:31 +0000, Luca Bocassi wrote:
> > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > >=20
> > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > ---
> > > =C2=A0meta/recipes-core/volatile-binds/volatile-binds.bb | 2 ++
> > > =C2=A01 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/met=
a/recipes-core/volatile-binds/volatile-binds.bb
> > > index 66e28f4fc9..0f27353031 100644
> > > --- a/meta/recipes-core/volatile-binds/volatile-binds.bb
> > > +++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
> > > @@ -84,3 +84,5 @@ do_install[dirs] =3D "${WORKDIR}"
> > > =C2=A0do_install_append_class-nativesdk () {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rm -rf ${D}/var
> > > =C2=A0}
> > > +
> > > +BBCLASSEXTEND =3D "nativesdk"
> >=20
> > Is there any useful component left in volatile-binds in the SDK case? I=
 don't
> > think we should be extending this as the recipe makes no sense. Rather =
nativesdk
> > variants probably shouldn't be depending upon it?
>=20
> It's pulled in automatically. I don't know enough about yocto to be
> able to tell whether it's intentional and needed or not.

Looks like it's working without, so changed in v2 to remove the
dependency for nativesdk instead.

--=20
Kind regards,
Luca Boccassi

--=-ycxkyxQOul29kKAziCUm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCSqx93EIPGOymuRKGv37813JB4FAmGXjCEACgkQKGv37813
JB66iRAAzfEiNw8ABEF1wRJdCe9g2ahJhVleVsOEI7R8dIyMe5VApPM4DOURjDwA
zdA+Q5GGKyzVCZCwBqdMvcwjKSha7XGpdVE0epy15q/VxFNAM5Q/T1jjommSHdX8
Ab/1mG5x/Dj9VzYQQdyevkR8IeLFVcqJJw2ZDQP3y+aJrU9o7gHO2xNN5aTj+5nR
n9EC5gkQ2aNdn6sTh2qgLZ8uog+q9UgvAEfdF0M/5qsPp9o54xzmqnLABjGBcwLk
Yl68rJo5diQJblPfMqN5FtxoUcPCSI7nNrQ41HdZWkbezdWr3DAJTJVdvSwENpMX
1WcCnABcvthIDIpEsHAHj8yeHYPzCHCV5QHE7MHAOltIhE8dxEre865VPamtxKDP
HTIcpAG9c/oxItSEvVVBptYFfkzsi9xIQ7hmYINg5Q8ClJPucb9ytL95w3dLINeB
4JTG4cEaQ2ZC8U/djZQ1MjtzoUE4lTd3JSUJk+dztLcHrouzncQD72SAVuMEOfm7
EUww9+TvNNEqCiY7S+3DM3o1FGF6V70xjVMWuuR8XG0zJvxooKGAdOZqkB68iaxp
4efyrQMIbmjLE/d/JNgHfVcReP/HnUZKD0oqOVA+sm2XWN65zvTvko52TSP3Q+tG
/29we68C+U8zP8Ew39E2Cqzrm+eB1ZMYFLi4tvxk0Xyrl8Al2FI=
=RJoW
-----END PGP SIGNATURE-----

--=-ycxkyxQOul29kKAziCUm--


