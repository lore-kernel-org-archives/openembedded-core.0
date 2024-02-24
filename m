Return-Path: <simone.weiss@posteo.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5CBEC48BF6
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 15:41:43 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.21204.1708789295358600211
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Feb 2024 07:41:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.net header.s=2017 header.b=b6GBpPbC;
 spf=pass (domain: posteo.net, ip: 185.67.36.66, mailfrom: simone.weiss@posteo.net)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 93AE0240101
	for <openembedded-core@lists.openembedded.org>; Sat, 24 Feb 2024 16:41:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1708789293; bh=IdzN2ztMMc4s02z1lU6qyZSVJZQQJZdVfcx1pICMWy4=;
	h=Message-ID:Subject:From:To:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=b6GBpPbCpnatEoI0ZnqO+KaR2KmLOBMg/IW7xeEu4wfSEUxXJ0nCcBIfl4p+dxVu2
	 dr41J7RdwH/HHSy7XMqama3ThBlzrdb7MkgzfdI8jvcJFd7uJaYZ7c1tMgh0mOQQ4x
	 omvcPzhpOoJaVOSW3rn7dp3sWICPkjPQv55yIrUxHtSPI0XppVyipia+od/JVvE3KG
	 DqGOmabKiNAu7aFoJ1QdN/JEJ7jD8EzAiGFUmNWS3lkEcHdFn9RvyPnc3mLq7ufa03
	 sEbJ2pNZTKmzZywiagJ49tyFGLo54QBcrALxGwxnM6PHZoDP+M+QUKJsbKl8C6GDAb
	 YrG0auj0GhzGQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ThrhX09Y0z9rxM;
	Sat, 24 Feb 2024 16:41:31 +0100 (CET)
Message-ID: <4ac39d0d2db4f5f1716d36d3b4ca02e4929f54f4.camel@posteo.net>
Subject: Re: [OE-core] [PATCH] cve-check: Log if CVE_STATUS set but not
 reported for component
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.weiss@posteo.net>
To: peter.marko@siemens.com, "simone.p.weiss@posteo.com"
	 <simone.p.weiss@posteo.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 24 Feb 2024 15:41:31 +0000
In-Reply-To: <AS1PR10MB56977B0654F86221C1B4A70AFD542@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240223210848.21731-1-simone.p.weiss@posteo.com>
	 <AS1PR10MB56977B0654F86221C1B4A70AFD542@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Feb 2024 15:41:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196132

On Sat, 2024-02-24 at 14:28 +0000, Peter Marko via lists.openembedded.org
wrote:
> Hello,
>=20
> This change looks like the right way forward, but it will need two
> things first:
> * dissolve cve-extra-exclusions.inc into recipes, as every exclusion in
> that file will generate a warning in all components except the one for
> which the exclusion actually is meant
> * create a (per-recipe) variable to disable it, especially for kernels
> where we have auto-generated exclusion lists which do not match NVD DB
> state
Hi,
this is disabled per default, so I think those points are not to pressing.

Cheers,
Simone
>=20
> Best Regards,
> =C2=A0 Peter
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196131):
> https://lists.openembedded.org/g/openembedded-core/message/196131
> Mute This Topic: https://lists.openembedded.org/mt/104536878/8052774
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[simone.p.w=
eiss@posteo.com
> ]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


