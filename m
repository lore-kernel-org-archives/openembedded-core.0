Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7243.1795874303884628431
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2026 05:58:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@pengutronix.de header.s=20260414 header.b=FT5YskUG;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: mfe@pengutronix.de)
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::109])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 7BCF3205A72;
	Sat, 28 Nov 2026 14:58:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795874301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tmMpGtEwW78+CQ6BXdD/ounDMsI1T4PzA3nF2s4BC5U=;
	b=FT5YskUGqqmuih0cYZpjUoPIVIDcqvra2si+Kooo8A+DL4Pv+XF2gCTugF6fQij694vWum
	2463z8LGn70IuqcDWtkYJ6ZQ61tKtwuLRNs4HUe/C4VHW8oSoggmjl71ShqEuD3qnrgQgi
	3XaXKxJf14K20rAoTiV7nv1sO69Y1vlzhfanJoX9MVBjEd/qiWe5nhyWzXintbOzB453OZ
	XOkb4MI8bYFqqzWtyeAwjY2YF1hqxzAc50rxFrFWo6jKZ9nklJMs4v9Sj2PuqEZM1WSZZe
	uJGYTquGUSVM9u2YzWoxJ4DZxX3gyr/IRVJZIKL6wvsaPusFcAO1X+w3vLMFAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795874301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tmMpGtEwW78+CQ6BXdD/ounDMsI1T4PzA3nF2s4BC5U=;
	b=PKIhsk6tZ/7fdQc37utPjgZIViLFxH20KmjrNngAN71pIXkUcuPZCGdjzB+VIlZ2y7oJo8
	12BuD/o9mUej1NrhC3KX/i/Dec01nFuhIruF84xoLqynwr44qSEuu4wDAhN99b+J28MGZU
	oaiC/1Q615SREgLZtspTfFwsLefshbyUsosMM45tMCsuL0GBe39Fy/gGRtxpy2ELiPi4WX
	aG3vxYnLSRgMkuTHAKS0owM6Nn6U1kiSYsc44bPb3qE+w6A2YyxJ+46wwqjUC9imkyGVRL
	UfukwiSRRManPSfiGDlFg2BeGfBYTyM8QQNIOmCYkIB4HRPuDxGtOQuBBGu1DQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=mfe@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795874301; a=rsa-sha256;
	cv=none;
	b=avfKv5p1d1/RcnhGnmLbrFtPeWlSWWDNaKLW/f6mbpF4pPJtmc5aHciv7HHTJH2zO1tDn0
	+2PXxegOhYE8RdzoOS7Oz48MQg1GraC5Hqp8/owxBIo8vWnTB8zzN/LZTFKGuPk3OtcqhQ
	bLoVykJFwGvGd9fASnTTGrqaMWbA7ETw4LE3dr4SjEVGFxIbC3U5qujqnQiQpSlTUYVNrc
	fKHLEAWDW7wuALyxLd1AzoajTJEyljv0OMWO3i4P8TNSZ6CMmMErAD1ZdLjfgvz2SCRRIa
	Y3cuUnkrRGTAx63OU7MGSJmj5VzxXXaQ7cR5oxbDoyV7c/67C3v1VYXiSontnA==
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1064)
	id 6165F1BF2DC; Sat, 28 Nov 2026 14:58:21 +0100 (CET)
Date: Sat, 28 Nov 2026 14:58:21 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Antoine Lubineau <antoine.lubineau@tld-robotics.com>
Cc: openembedded-core@lists.openembedded.org, peter.kjellerstedt@axis.com, 
	yocto@pengutronix.de
Subject: Re: [OE-core] [PATCH v3] classes/cargo-update-recipe-crates: support
 multiple Cargo.lock search directories
Message-ID: <thxdyvr7bswxzc4itrhhq5uqkioaotrz2yu6l4qoizcd4uh7dg@wvtftsxuho5w>
References: <20261126-mfe-multi-cargo-lock-files-v3-1-7ee885214204@pengutronix.de>
 <CAMPh3wqn5VMvufgZyUC3+=yzm3b0n3aciiROqnTYGDcsg2wgxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMPh3wqn5VMvufgZyUC3+=yzm3b0n3aciiROqnTYGDcsg2wgxg@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 13:58:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251498

On 26-11-27 13:25, Antoine Lubineau wrote:
> Hi,
>=20
> On Thu, 26 Nov 2026 at 09:37, Marco Felsch via openembedded-core <m.fel=
sch=3D
> pengutronix.de@lists.openembedded.org> wrote:
>=20
> > ../..
> > +    for cargo_lock_src_dir in d.getVar("CARGO_LOCK_SRC_DIR").split()=
:
> > +        for root, dirs, files in os.walk(cargo_lock_src_dir):
> >
>=20
> May I suggest adding 'dirs.sort()' here? The order of the lists is
> dependent on the filesystem, so the operation may not be stable between
> runs. That=E2=80=99s not a new issue when having multiple Cargo.lock fi=
les in the
> same source tree but I never submitted the patch.

I would like to keep the same behavior as before. Can you send a fixes
patch please?

Regards,
  Marco

>=20
> Regards,
> Antoine
>=20
> --=20
>=20
>=20
> *This email and any attachment contains EasyMile=E2=80=99s confidential=
=20
> information, and must not be modified or circulated without EasyMile=E2=
=80=99s=20
> prior written consent. It is intended exclusively for their recipient.s=
. If=20
> you received this message by mistake, please notify us promptly and=20
> immediately delete this email and any of its attachments.*
>=20
> *As data=20
> controller, EasyMile processes personal data, in compliance with the=20
> European GDPR (EU) 2016/679 of 27 April 2016. To exercise your rights, =
you=20
> can contact EasyMile at=C2=A0privacy@easymile.com, and if necessary, yo=
u may=20
> contact the local competent supervisory authority.=E2=80=9D*
>=20
> *Cet e-mail et toute=20
> pi=C3=A8ce jointe contiennent des informations confidentielles d'EasyMi=
le et ne=20
> doivent pas =C3=AAtre modifi=C3=A9s ou diffus=C3=A9s sans le consenteme=
nt =C3=A9crit pr=C3=A9alable=20
> d'EasyMile. Ils sont destin=C3=A9s exclusivement =C3=A0 leur destinatai=
re.s. Si vous=20
> avez re=C3=A7u ce message par erreur, veuillez nous en informer rapidem=
ent et=20
> supprimer imm=C3=A9diatement cet e-mail et toutes ses pi=C3=A8ces joint=
es.=C2=A0=C2=A0*
>=20
> *En=20
> tant que responsable de traitement, EasyMile traite des donn=C3=A9es=20
> personnelles, conform=C3=A9ment au RGPD europ=C3=A9en (UE) 2016/679 du =
27 avril 2016.=20
> Pour exercer vos droits, vous pouvez contacter EasyMile =C3=A0=C2=A0
> privacy@easymile.com <mailto:privacy@easymile.com>, et si n=C3=A9cessai=
re, vous=20
> pouvez contacter l'autorit=C3=A9 de contr=C3=B4le locale comp=C3=A9tent=
e.*
