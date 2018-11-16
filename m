Return-Path: <lukma@denx.de>
X-Greylist: delayed 460 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 16 Nov 2018 12:39:11 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 4B1226C31E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 12:39:11 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 42xHfD1dP2z1qtdm;
	Fri, 16 Nov 2018 13:31:32 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 42xHfD1LHbz1qtfh;
	Fri, 16 Nov 2018 13:31:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id KiXFA8mdpqSU; Fri, 16 Nov 2018 13:31:31 +0100 (CET)
X-Auth-Info: ODEyTe00NfZ/R0M4nr/XUw87889/lTipyTxhcBkvJuo=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 16 Nov 2018 13:31:31 +0100 (CET)
Date: Fri, 16 Nov 2018 13:31:24 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20181116133124.14279e76@jawa>
In-Reply-To: <6338fea41b758f901b90c9d378c50e824fb01593.camel@linuxfoundation.org>
References: <1542339582-13778-1-git-send-email-chunrong.guo@nxp.com>
	<6338fea41b758f901b90c9d378c50e824fb01593.camel@linuxfoundation.org>
Organization: denx.de
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Wolfgang Denk <wd@denx.de>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [thud][PATCH] ppce500v2: remove spe *The PowerPC SPE support is split off to a separate powerpcspe port
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
X-List-Received-Date: Fri, 16 Nov 2018 12:39:11 -0000
X-Groupsio-MsgNum: 118290
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/6zNQZFd8=Gmcvi8/+/C1y3y";
	protocol="application/pgp-signature"

--Sig_/6zNQZFd8=Gmcvi8/+/C1y3y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Richard,

> What does "The PowerPC SPE support is split off to a separate
> powerpcspe port" mean?=20
>=20
> That gcc support is being dropped and its going somewhere separate?=20
>=20
> That we're dropping spe support from OE?

I do hope NOT.

There are still some users of those SPE SoCs. Please do not remove it
from OE.

>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/6zNQZFd8=Gmcvi8/+/C1y3y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlvuuJwACgkQAR8vZIA0
zr0cKAf9GrZuPmUU65A6CI8jCG0EC7+6pBXYYpbKXs/hLjH1whh/oC+Mmdwy/6RK
B6ilYLe/onNUvl9t1vIt12mQVIstxsRDn0BSiwlpniwIYpCw01sMRS+C83TYkL3H
fCSNmUwAZSlMM8xtlhywC4Ki+gSAqaGUKTWQv5u11rbHcrSUFWZ2Hg/2KmmT+AEV
NL08ky65H45UGy7Ay9XEU0L50gOfpyfOD7FbpoG27NrEgckulokWmvNSmoKS5vBV
PNV6K+w5PAurneD9IvGte6og5ESZNDXQxgm5D0JWvWEjfe254S2utw77eugpYOfD
0t4lpVy5RFj9aJ3/EM/QChxaC48+ow==
=t92N
-----END PGP SIGNATURE-----

--Sig_/6zNQZFd8=Gmcvi8/+/C1y3y--
