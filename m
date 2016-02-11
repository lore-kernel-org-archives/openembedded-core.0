Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id B06CF7317C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 19:16:21 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id g62so82522380wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 11:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GOgg2p0zjNALT2GWemBjR1WjIGnQ6YD02ZX5s3adOpE=;
	b=zbr+k7du2nkcooJv+k5h8PZpgWUg3gAJncdfsaL7TTY0N0SbNdVMrWIl5w5VgJCxxc
	UQWLQ6/11Z772qSbHwFy/VtCGNp7wuEwZfmdP9Z9d50nUIg7zG4IiOeSN3M7ubA3FiiV
	e+aZi22hOhm5RKF6lvTzveGvSOOk6ZsWqM+b3qAngkm/O1yXhSTWeQTNSSLnh+KDpM6J
	ksCEIMIUNL8sO+/9L0BlmLA6l4dctbvxLbfbTcwV0ZgsAtBKRuHxRr335AmynFGQ98ab
	NWyx16kSjOG16SH/RC3gNkQNPaWSLGaM/KjR0yBLeHVlOdgfRHat0upxoeOFHfo4TUqU
	+pVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=GOgg2p0zjNALT2GWemBjR1WjIGnQ6YD02ZX5s3adOpE=;
	b=AVt6PsRKq5wArJDJJSwp9ivD4d2v/OT5w0HfCp0LcQtQFrRxE96bnvHbmUjkZ9JMUS
	ToueT6fpy9cf9iJubdCSBn0HuQAm+/+SIluOQnvrW5EcGZ+ybYb/vRPulNm1W/+/heHt
	e/lDbbsju9txLf2V3+Qf7bTsXUtUvIdOaUSt7rdS1mvnhojtYzXQKb/b4MZ72WeWeNtN
	fX6yWJbSW25ysBxc/hAre7asrpEMw18L/iN1jneNcLk4hx4H4gTsRNYCeb/wf75VKFX6
	WyQ2RJq3J2YMSGUCMOLUiRcv7i2DSQIi/w4S20uCOfXdz1asR8ZFQ0USJr3RHkz6RB9m
	AwMA==
X-Gm-Message-State: AG10YOTVfBJwYkC0otabDSkwUIsZOTJIH0oRyVGJ1fkEVWNAgFpPxRqVFK+JMcLvUL+2nA==
X-Received: by 10.194.175.198 with SMTP id cc6mr48462076wjc.24.1455218182043; 
	Thu, 11 Feb 2016 11:16:22 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id s8sm8834727wje.35.2016.02.11.11.16.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Feb 2016 11:16:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 11 Feb 2016 20:20:24 +0100
To: Trevor Woerner <twoerner@gmail.com>
Message-ID: <20160211192024.GD2595@jama>
References: <56B922B3.9070604@gmail.com> <56BAB9F8.4000106@gmail.com>
	<A7F6AE58-0DBC-4180-B232-4876DD5E20E6@gmail.com>
	<56BCC3F8.9000908@gmail.com>
MIME-Version: 1.0
In-Reply-To: <56BCC3F8.9000908@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: noticeably longer build (link?) times with binutils 2.26
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Feb 2016 19:16:22 -0000
X-Groupsio-MsgNum: 78020
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MAH+hnPXVZWQ5cD/"
Content-Disposition: inline

--MAH+hnPXVZWQ5cD/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2016 at 12:25:12PM -0500, Trevor Woerner wrote:
> On 02/09/16 23:37, Khem Raj wrote:
> > IIRC gold has its own notions to enable gold
> > so you need to enable that
> >
> >> On Feb 9, 2016, at 8:18 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> >>
> >> I've tried every combination I can think of and no matter what I try, =
if gold is the linker the chromium build always errors out with:
> >>
> >>     collect2: fatal error: cannot find 'ld'
>=20
> Building with gold does cut the build time of the chromium component=20
> back down.
>=20
> binutils 2.25, bfd:  00:47:51, 00:44:24, 00:44:25
> binutils 2.26, bfd:  02:07:45, 02:09:31, 02:02:42
>=20
> binutils 2.26, gold: 00:43:49, 00:45:18, 00:42:51
>=20
>=20
> But the only way I could get it to work was to manually perform the=20
> following steps:
> $ cd <oe tmp dir>/sysroots/<native sysroot>/usr/bin
> $ ln -s <cross toolchain prefix>/<cross toolchain prefix>ld.gold ld.gold
>=20
> where:
>    <native sysroot> =3D x86_64-linux
>    <cross toolchain prefix> =3D x86_64-poky-linux
>=20
> to give:
> $ cd <oe-tmp-dir>/sysroots/x86_64-linux
> $ ln -s x86_64-poky-linux/x86_64-poky-linux-ld.gold ld.gold
>=20
> Maybe I can play with the recipe a bit more to get this to work=20
> "automatically"; maybe by setting the LD environment variable=20
> differently or something.

Did you add ld-is-gold to DISTRO_FEATURES?

>=20
> But, as I said before, the last time I tried booting a gold-linked image=
=20
> on the minnow grub2 refused to work :-(
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MAH+hnPXVZWQ5cD/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAla83vcACgkQN1Ujt2V2gBxuVQCgkKBfFvSPl0zLYaE/Qb5REwyj
zYUAnioTy9jFMAHRw+I425VpqKMsur7Q
=SoNp
-----END PGP SIGNATURE-----

--MAH+hnPXVZWQ5cD/--
