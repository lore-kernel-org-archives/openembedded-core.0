Return-Path: <lukma@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 507226C11B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 10:23:51 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 42z4gW5r4bz1qtPc;
	Mon, 19 Nov 2018 11:23:51 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 42z4gW5SXcz1qr2R;
	Mon, 19 Nov 2018 11:23:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id H3vrxGwc6qT8; Mon, 19 Nov 2018 11:23:50 +0100 (CET)
X-Auth-Info: kMb7ShYP+CA+c8xjSycmQTF3iF4JEw5bXQ/OsK2M+A4=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 19 Nov 2018 11:23:50 +0100 (CET)
Date: Mon, 19 Nov 2018 11:23:43 +0100
From: Lukasz Majewski <lukma@denx.de>
To: "C.r. Guo" <chunrong.guo@nxp.com>
Message-ID: <20181119112343.0a90ba2b@jawa>
In-Reply-To: <DB7PR04MB5068B1F79EED7E9F1531147184D80@DB7PR04MB5068.eurprd04.prod.outlook.com>
References: <1542339582-13778-1-git-send-email-chunrong.guo@nxp.com>
	<6338fea41b758f901b90c9d378c50e824fb01593.camel@linuxfoundation.org>
	<20181116133124.14279e76@jawa>
	<79fd2ed2fc241bf2770b4e471d94cb024c313140.camel@linuxfoundation.org>
	<DB7PR04MB5068B1F79EED7E9F1531147184D80@DB7PR04MB5068.eurprd04.prod.outlook.com>
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
X-List-Received-Date: Mon, 19 Nov 2018 10:23:51 -0000
X-Groupsio-MsgNum: 118326
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/Np5mMkR=h8VEm=QOJVWkqOt";
	protocol="application/pgp-signature"

--Sig_/Np5mMkR=h8VEm=QOJVWkqOt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 19 Nov 2018 09:56:35 +0000
"C.r. Guo" <chunrong.guo@nxp.com> wrote:

> Hello all,
> Please review gcc changes about issue.
> https://www.gnu.org/software/gcc/gcc-8/changes.html
> https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
>=20

Thanks for the info.

Shall I assume that NXP is regarding this port (SPE) as an obsolete one
and do not plan to spent any more resources on it?

> thanks
> chunrong
>=20
>=20
>=20
>=20
>=20
> -----Original Message-----
> From: richard.purdie@linuxfoundation.org
> <richard.purdie@linuxfoundation.org> Sent: 2018=E5=B9=B411=E6=9C=8816=E6=
=97=A5 20:46
> To: Lukasz Majewski <lukma@denx.de>
> Cc: C.r. Guo <chunrong.guo@nxp.com>;
> openembedded-core@lists.openembedded.org; Wolfgang Denk <wd@denx.de>
> Subject: Re: [OE-core] [thud][PATCH] ppce500v2: remove spe *The
> PowerPC SPE support is split off to a separate powerpcspe port
>=20
> On Fri, 2018-11-16 at 13:31 +0100, Lukasz Majewski wrote:
> > Hi Richard,
> >  =20
> > > What does "The PowerPC SPE support is split off to a separate=20
> > > powerpcspe port" mean?
> > >=20
> > > That gcc support is being dropped and its going somewhere
> > > separate?
> > >=20
> > > That we're dropping spe support from OE? =20
> >=20
> > I do hope NOT.
> >=20
> > There are still some users of those SPE SoCs. Please do not remove
> > it from OE. =20
>=20
> I would highlight that Yocto Project and OE get very little support
> for anything PowerPC related and that upstream gcc have already
> removed parts of the SPE support. We will likely end up having to
> follow what gcc does, we have a hack in place now but it won't last
> another gcc major version upgrade.
>=20
> So if you or your customers care about SPE or PowerPC in general, we
> really need to see more support at the Yocto Project advisory board
> to continue to keep it as a first class citizen.
>=20
> Cheers,
>=20
> Richard
>=20
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/Np5mMkR=h8VEm=QOJVWkqOt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlvyjy8ACgkQAR8vZIA0
zr1LwggAwx4vzoe1CZ4Tsa05mmx3BbSEw+AlVNX39F1pmOk2vFDzI4lvnkJCX4Vg
WNKOcHXmSMHmGwovckIQlbh5GaIDsKmITlWB13ff9S8j1eTtuVIjoLUvV60ObVZb
2d4/yph527JY9IhRtGlAAhPuMMaVK0/xPMoNQm8A9IXQJUjhZiPwMdobd+CNVHMD
3/MbEtRP1oIUlTH6low/Jhka/t4tNzTYa55Un9Fgz93wtXgLPApksGc+drgGFqcU
30hqV/9gxb12xk/uVuwWjW/+O5+mYyjCqHnS1IwwocD28Mr3ANtilv5NXXX5oLfT
ZmDf6QFV+hRtU+ih0/U4SIVNv+EVqw==
=j6DK
-----END PGP SIGNATURE-----

--Sig_/Np5mMkR=h8VEm=QOJVWkqOt--
