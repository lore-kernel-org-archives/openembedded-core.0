Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rfquy-0006W0-Rn
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 11:39:33 +0100
Received: by lami14 with SMTP id i14so4483637lam.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 02:32:15 -0800 (PST)
Received: by 10.152.146.99 with SMTP id tb3mr15120384lab.7.1325068335893;
	Wed, 28 Dec 2011 02:32:15 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id s13sm24366188lad.8.2011.12.28.02.32.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 02:32:15 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2295923.3R0Nmqr59V@helios>
Date: Wed, 28 Dec 2011 11:32:13 +0100
Message-Id: <80E8B5C9-63CE-4BFA-8C5F-39ABA85736C7@dominion.thruhere.net>
References: <1325055308-17731-1-git-send-email-b19537@freescale.com>
	<8285067.9cfZeAKmYZ@helios>
	<CA452391058F6D4E9715FB2C29D9312A010BD589@039-SN2MPN1-023.039d.mgd.msft.net>
	<2295923.3R0Nmqr59V@helios>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
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
X-List-Received-Date: Wed, 28 Dec 2011 10:39:33 -0000
X-Groupsio-MsgNum: 14849
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8A41AA8A-86EB-4750-A20F-605E356DF031";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8A41AA8A-86EB-4750-A20F-605E356DF031
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 28 dec. 2011, om 11:18 heeft Paul Eggleton het volgende geschreven:

> On Wednesday 28 December 2011 10:01:13 Luo Zhenhua-B19537 wrote:
>> May I know what's the concern with eglibc instead of uclibc?
>=20
> So my concern is, if you add a runtime dependency on eglibc-dbg to =
valgrind=20
> and you've selected uclibc instead, it will force installation of =
eglibc when=20
> you install valgrind (not to mention building it when you build =
valgrind);=20
> this is almost certainly not what you want.
>=20
> If a dependency on the libc debug packages is really needed you could =
do=20
> something this instead:
>=20
> RRECOMMENDS_${PN} +=3D "${TCLIBC}-dbg"

Or:

RECOMMENDS_libc-glibc =3D "glibc-dbg"

I'm not sure which one is better, but I wanted to point out the libc =
overrides :)

regards,

Koen=

--Apple-Mail=_8A41AA8A-86EB-4750-A20F-605E356DF031
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk768C0ACgkQMkyGM64RGpHPGACggRHoD2onHQq2myaj9S6dbV3U
W/IAmgOKPw3O8OYLhj5aV3wuHFhIkzx4
=l5EL
-----END PGP SIGNATURE-----

--Apple-Mail=_8A41AA8A-86EB-4750-A20F-605E356DF031--
