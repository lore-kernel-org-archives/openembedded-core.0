Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RfsWm-0000tM-6E
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 13:22:40 +0100
Received: by eeit10 with SMTP id t10so7498920eei.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 04:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mznedOEgkXZoXFN6JYP9gqwI5/qMq0+X5EE+8BxO6vo=;
	b=PZLQd5MbjawNFNmePLvsUWQJZAIsRBUwQefllQBSgKLpBcsm0rPhTXLGLLwkCTSV5o
	mQ3t0+ipi/I0/YYUN4CQ0zMYRcUKljugEuaz/VGMHDJwdFf8xGTjXNiuLnK2uJifiAFC
	eV3yqbvQpFATODRhgB2fso6C/UAL0bG+WZO3o=
Received: by 10.213.7.11 with SMTP id b11mr5061248ebb.26.1325074526008;
	Wed, 28 Dec 2011 04:15:26 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u53sm71736084eeu.6.2011.12.28.04.15.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 04:15:24 -0800 (PST)
Date: Wed, 28 Dec 2011 13:15:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111228121512.GB3995@jama.jama.net>
References: <1325055308-17731-1-git-send-email-b19537@freescale.com>
	<8285067.9cfZeAKmYZ@helios>
	<CA452391058F6D4E9715FB2C29D9312A010BD589@039-SN2MPN1-023.039d.mgd.msft.net>
	<2295923.3R0Nmqr59V@helios>
	<80E8B5C9-63CE-4BFA-8C5F-39ABA85736C7@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <80E8B5C9-63CE-4BFA-8C5F-39ABA85736C7@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Garg Vakul-B16394 <B16394@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Re: [PATCH oe-core] valgrind: add powerpc to the compatible host and add eglibc-dbg in rdepends
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Dec 2011 12:22:40 -0000
X-Groupsio-MsgNum: 14852
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline

--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 28, 2011 at 11:32:13AM +0100, Koen Kooi wrote:
>=20
> Op 28 dec. 2011, om 11:18 heeft Paul Eggleton het volgende geschreven:
>=20
> > On Wednesday 28 December 2011 10:01:13 Luo Zhenhua-B19537 wrote:
> >> May I know what's the concern with eglibc instead of uclibc?
> >=20
> > So my concern is, if you add a runtime dependency on eglibc-dbg to valg=
rind=20
> > and you've selected uclibc instead, it will force installation of eglib=
c when=20
> > you install valgrind (not to mention building it when you build valgrin=
d);=20
> > this is almost certainly not what you want.
> >=20
> > If a dependency on the libc debug packages is really needed you could d=
o=20
> > something this instead:
> >=20
> > RRECOMMENDS_${PN} +=3D "${TCLIBC}-dbg"
>=20
> Or:
>=20
> RECOMMENDS_libc-glibc =3D "glibc-dbg"

with extra R and PN, right?
RRECOMMENDS_${PN}_libc-glibc =3D "glibc-dbg"

Regards,

> I'm not sure which one is better, but I wanted to point out the libc over=
rides :)
>=20
> regards,
>=20
> Koen



> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk77CFAACgkQN1Ujt2V2gByGogCgjh8HAs2l5Nj2XA0Emou4WITq
x4sAoJunJIhdSgOEpAL+O6HBrcQvxiKi
=vtAE
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
