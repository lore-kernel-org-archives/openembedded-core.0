Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3FCE36B05F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 16:43:17 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id kp14so2062704pab.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 08:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-type;
	bh=JZpboaRkenuceXfceehAcS3K5espy1UzDl5D1b7yH8k=;
	b=X7Do5qLrIDcyesPnWt1S7K7+5qsbnUWZ4JysQc1y02qf+cCiat/voxotYyi7XoZ1oq
	varXm0ATM4crlahpJStgbmLI2bcIg9rAO2GzfzIk4LmLAuXbxU9MZt8tOtrCwxle7Zty
	+ZbWYL0Ghk9TxPVgRMuHHy1sDp89utoUMKcG4qTa7eDevehkw72hqB5gaSATYolSeNZz
	NsrZfKAj5ehjMrg07P3EAkxYaiYtmKR6eAtOV++7lYyYvlVHK1Zk+wGKdmeeLL01rhea
	P3TJFUuEK0xjllqId9KZZ1ADOgAuljTkXKeq2XGveGl8xyG+tlCK/zIMeLISo6uFzOkL
	Stew==
X-Received: by 10.66.26.236 with SMTP id o12mr9338718pag.15.1390495397878;
	Thu, 23 Jan 2014 08:43:17 -0800 (PST)
Received: from leo.localnet (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	qq5sm38562156pbb.24.2014.01.23.08.43.15 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jan 2014 08:43:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: Chris Larson <clarson@kergoth.com>
Date: Thu, 23 Jan 2014 08:43:29 -0800
Message-ID: <5712962.WyPAeLeASC@leo>
X-Face: (*D:+-|[O9m:a&dKxg#R`m^Nxy<HmNPV<Ic-_>RMPm0'o70t~39kUjcE\?l`>41l^%&x; O
	ss*RIK.m#<6OwX.R&K={4[\RYyqeUgI^7G0BRJfLXVkrEjSlX5rk\rOt"ur?`%"2}`hDBt
	QHQ|<@r6-hq"([T&r02ayw^tEXBwsh6g%qt!Q?)*H$OE6mk^BUm30s`G[u:_wi&vIUh&Lh
	L_.\+; 0Q:nB(8TJq\bWseix)aav+[*-wMDT5+55W^jS%u-J{Hv)&lSoaU^m_+*>]"
User-Agent: KMail/4.12.1 (Linux/3.12.8-1-ARCH; KDE/4.12.1; x86_64; ; )
In-Reply-To: <CABcZANk3D=dL=73=spKrnL-YeOmcxng1EN5ucQu0LD-O48Vd5g@mail.gmail.com>
References: <1386380546-13936-1-git-send-email-raj.khem@gmail.com>
	<1760931.7HjZTF9m8R@leo>
	<CABcZANk3D=dL=73=spKrnL-YeOmcxng1EN5ucQu0LD-O48Vd5g@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: Convert ??= weaker assingment to weak ?= assignment
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
X-List-Received-Date: Thu, 23 Jan 2014 16:43:18 -0000
X-Groupsio-MsgNum: 49472
Content-Type: multipart/signed; boundary="nextPart2228375.4JbiU4UDPc";
	micalg="pgp-sha1"; protocol="application/pgp-signature"

--nextPart2228375.4JbiU4UDPc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Thursday, January 23, 2014 09:31:47 AM Chris Larson wrote:
> On Wed, Jan 22, 2014 at 6:16 PM, Khem Raj <raj.khem@gmail.com> wrote:=

> > On Friday, December 06, 2013 05:42:26 PM Khem Raj wrote:
> > > ??=3D does not react at all with
> > > BOOST_LIBS +=3D "${@base_contains('PACKAGECONFIG', 'python', 'pyt=
hon', '',
> > > d)}"
> > >=20
> > > even though we have
> > >=20
> > > PACKAGECONFIG ??=3D "" it does not honor it and always add python=
 to
> > > BOOST_LIBS but the dependency is not added so it fails to build
> > > complaining for missing python headers which is a understood outc=
ome
> > >=20
> > > When converted to ?=3D it works as expected and only add --with-p=
ython
> > > in bjam when python is specified in PACKAGECONFIG otherwise not.
> > >=20
> > > Is it a bitbake bug ? in anycase ?=3D should be enough of loose r=
ope
> > > to let user/distro configure the packageconfig policy
> >=20
> > OK so the problem is that I have meta-ros in my layer-mix and in th=
at
> > layer
> > it defines PACKAGECONFIG ?=3D "python" IMO it should have appended =
instead
> > of
> > redefining. Thats why I was seeing what I was seeing.
>=20
> It's worth noting that recipes, in general, should use ?=3D rather th=
an ??=3D,
> but config files, in general, should use ??=3D. Otherwise it becomes
> impossible for the config metadata to define an overriding default --=
 the
> last ??=3D wins, after all, and that would always be the recipe. IMO =
default
> values in the recipe are there to give sane behavior when there's no
> configuration coming in from elsewhere, not to override configuration=

> defaults.

yes I think thats a good point. so lets consider this patch for inclusi=
on
now we know the reason, I can resubmit with proper subject and patch he=
ader

=2D-=20
=2DKhem

--nextPart2228375.4JbiU4UDPc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEABECAAYFAlLhRrEACgkQuwUzVZGdMxS9lgCghLjifXEjVCIgTTu4E5jkwosO
uwUAn2AeP4G02JZp4B9XjL5RzB7ZAFiG
=2W+3
-----END PGP SIGNATURE-----

--nextPart2228375.4JbiU4UDPc--
