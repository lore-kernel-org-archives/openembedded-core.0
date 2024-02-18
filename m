Return-Path: <simone.weiss@posteo.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E97C48BC4
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 18:37:44 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.23734.1708281463047083665
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 10:37:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.net header.s=2017 header.b=TllGodR1;
 spf=pass (domain: posteo.net, ip: 185.67.36.66, mailfrom: simone.weiss@posteo.net)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 93E8A240103
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 19:37:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1708281460; bh=faT+CFbvGmiWSYPRP9DMXUl0BqH/LHBBOnqM4WH+HRE=;
	h=Message-ID:Subject:From:To:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=TllGodR1oB/BF0DSHy+fXyNuzLnp+7bNrTKgCk95JweYRt0Bhb3DRsnasdFYNVGAL
	 m0/mCidEvG2BU6aefBuym/JThtiQr8MF12iz0t2lD7DGCNy7+cXzP/vOca++Vbejy5
	 iG9zTae/zb2r0mgYwX2dtLNJlobLDW8z+4FNbiQF2s+08yWWS5x9g3UFXrJH71Gx6b
	 F8tJGm25RDbhWItObqsGMrti7V3S8aGO9ig7xPA2WR5HLQ4gupuPGdoTCtXHwMiVMG
	 pqnq07uOUx3lxfl+eWN6Fadt1PHh3IdTvRpu0biFDJdh1rbBn08N5qpq1hl8+EFWq2
	 l1E7k+s55Ny3Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TdDtV6S6Bz9rxK;
	Sun, 18 Feb 2024 19:37:38 +0100 (CET)
Message-ID: <4f6804fef0eb7168a4f1d7750c33285cfcb3f362.camel@posteo.net>
Subject: Re: [OE-core] [PATCH] qemu: Set CVE_STATUS for wrong CVEs
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.weiss@posteo.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Simone
 =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>,
 openembedded-core@lists.openembedded.org
Date: Sun, 18 Feb 2024 18:37:38 +0000
In-Reply-To: <8f04b69f1dbe38748a0679e294c6b33a607fd1de.camel@linuxfoundation.org>
References: <20240218165256.2804353-1-simone.p.weiss@posteo.com>
	 <8f04b69f1dbe38748a0679e294c6b33a607fd1de.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 18:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195844

On Sun, 2024-02-18 at 17:42 +0000, Richard Purdie wrote:
> On Sun, 2024-02-18 at 16:52 +0000, Simone Wei=C3=9F wrote:
> > From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> >=20
> > All are already fixed in 8.2.1, NVD was informed that cpes are wrong.
> >=20
> > Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> > ---
> > =C2=A0meta/recipes-devtools/qemu/qemu.inc | 6 ++++++
> > =C2=A01 file changed, 6 insertions(+)
> >=20
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-
> > devtools/qemu/qemu.inc
> > index 5d953e5ef5..233652fc49 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -68,6 +68,12 @@ CVE_STATUS[CVE-2023-0664] =3D "not-applicable-
> > platform: Issue only applies on Wind
> > =C2=A0# As per https://bugzilla.redhat.com/show_bug.cgi?id=3D2203387
> > =C2=A0CVE_STATUS[CVE-2023-2680] =3D "not-applicable-platform: RHEL spec=
ific
> > issue."
> > =C2=A0
> > +CVE_STATUS[CVE-2023-3019] =3D "cpe-incorrect: Applies against versions
> > > 8.2.0 only"
> > +
> > +CVE_STATUS[CVE-2023-5088] =3D "cpe-incorrect: Applies against versions
> > >=3D 8.2.0 only"
> > +
> > +CVE_STATUS[CVE-2023-6693] =3D "cpe-incorrect: Applies against versions
> > >=3D 8.2.0 only"
> > +
> > =C2=A0COMPATIBLE_HOST:mipsarchn32 =3D "null"
> > =C2=A0COMPATIBLE_HOST:mipsarchn64 =3D "null"
> > =C2=A0COMPATIBLE_HOST:riscv32 =3D "null"
> >=20
>=20
> Thanks for trying to resolve these. =C2=A0
>=20
> I'm struggling a little to read the above since to me that says the CVE
> applies to versions greater than 8.2.0 so 8.2.1 would be affected?
> Should the operators be the other way around, or should we spell it out
> ("applies to versions 8.2.0 and earlier")?
>=20
> Cheers,
>=20
> Richard
I'll spell it out=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195840):
> https://lists.openembedded.org/g/openembedded-core/message/195840
> Mute This Topic: https://lists.openembedded.org/mt/104430283/8052774
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[simone.p.w=
eiss@posteo.com
> ]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


