Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0F02A6CBD3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 17:59:12 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id w10so3204098pde.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 09:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-type;
	bh=YwkuLZ6+O7URWvyvTdI8TSmNWwXIoDOp5eCOCzp0C4Y=;
	b=dr3UFna9AAjuTm7heBsVmrcIz9J9N+7EUTcYV4tckfn43Fkaz8AVX/f3GxDhQRHkmk
	XmY/GBMa2cEBY6nH7HA+QsEMHuhyWVkbTHfFVM6/zLc6hpkLrbasT9f1xPIyBrKWxV6t
	9XeUO2LVf0n20oOsh7X6DVrq7rPeFglNsXV47NHSyZDhYOKkOG6GDIqjUXdqSXm2eff1
	+GEtog/DCuWLcbZz/5zcfwf28FGe7p+mAPZfHmlmkLyg4sVjXV3r2wpz8zC/5wjdVb6v
	f2+4TQElOVcs+ZFGRhFbi8MfFplbexMqDse8kXwKjSW9UZJVBuxabWGR0Zm8lSFWqwQ0
	dEQg==
X-Received: by 10.66.248.130 with SMTP id ym2mr26455489pac.9.1390327152728;
	Tue, 21 Jan 2014 09:59:12 -0800 (PST)
Received: from leo.localnet (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30])
	by mx.google.com with ESMTPSA id y9sm30263706pas.10.2014.01.21.09.59.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 09:59:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2014 09:59:13 -0800
Message-ID: <1877769.UoNhV5qYuS@leo>
X-Face: (*D:+-|[O9m:a&dKxg#R`m^Nxy<HmNPV<Ic-_>RMPm0'o70t~39kUjcE\?l`>41l^%&x; O
	ss*RIK.m#<6OwX.R&K={4[\RYyqeUgI^7G0BRJfLXVkrEjSlX5rk\rOt"ur?`%"2}`hDBt
	QHQ|<@r6-hq"([T&r02ayw^tEXBwsh6g%qt!Q?)*H$OE6mk^BUm30s`G[u:_wi&vIUh&Lh
	L_.\+; 0Q:nB(8TJq\bWseix)aav+[*-wMDT5+55W^jS%u-J{Hv)&lSoaU^m_+*>]"
User-Agent: KMail/4.12.1 (Linux/3.12.7-2-ARCH; KDE/4.12.1; x86_64; ; )
In-Reply-To: <1390044007.14987.151.camel@ted>
References: <1389365286-4830-1-git-send-email-david.nystrom@enea.com>
	<55ea22e5d71c47f3b812e845106f2d19@DM2PR03MB368.namprd03.prod.outlook.com>
	<1390044007.14987.151.camel@ted>
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "cross-canadian: Handle powerpc linux verses linux-gnuspe"
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
X-List-Received-Date: Tue, 21 Jan 2014 17:59:12 -0000
X-Groupsio-MsgNum: 49282
Content-Type: multipart/signed; boundary="nextPart3384276.actG2ITX0R";
	micalg="pgp-sha1"; protocol="application/pgp-signature"

--nextPart3384276.actG2ITX0R
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Saturday, January 18, 2014 11:20:07 AM Richard Purdie wrote:
> On Fri, 2014-01-17 at 14:43 +0000, alexandru.sardan@freescale.com wro=
te:
> > e500v1/v2 uses SPE to handle floating point operations
> > using general purpose regs.
> > So using the non-SPE compiler with SPE libraries won't work.
> > However the soft-fp libraries are compatible with the e500
> > ABI (with a considerable performance penalty).
> >=20
> > From what I can see, eglibc is built with SPE. So GCC should
> > be built also for SPE (target powerpc-poky-linux-gnuspe).
>=20
> The key question is this:
>=20
> Can one gcc binary generate code for both non-SPE and SPE targets,
> assuming its pointed at an appropriate sysroot containing appropriate=

> libraries?
>=20
> If we can have one such binary, how do we configure it? If we can't, =
we
> need to redo the way gcc-cross-canadian is working on powerpc.
>=20

I think gcc can generate the code all you would need is option, real pr=
oblem
is gcc runtime which will need different set of libraries and init file=
s.


> The change there was to have one gcc for each different target
> architecture rather than each "tune" since that was horribly
> inefficient.
>=20

We dont need specific to tune but spe is ABI identifier that should be =
treated=20
differently then defaul tunes IMO

> Cheers,
>=20
> Richard
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

=2D-=20
=2DKhem

--nextPart3384276.actG2ITX0R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEABECAAYFAlLetXoACgkQuwUzVZGdMxTPhACeMEuEV1Pb548GD6hxDcDCMmAo
EiEAn3yU7kFdytWGtD8o0Cmk5m/BGaBx
=n43w
-----END PGP SIGNATURE-----

--nextPart3384276.actG2ITX0R--
