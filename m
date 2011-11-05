Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RMkU2-0007og-OJ
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Nov 2011 18:56:46 +0100
Received: by wwf4 with SMTP id 4so4072116wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Nov 2011 10:50:35 -0700 (PDT)
Received: by 10.216.11.209 with SMTP id 59mr2078636wex.58.1320515431287;
	Sat, 05 Nov 2011 10:50:31 -0700 (PDT)
Received: from [172.20.1.32] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v6sm1905134wix.1.2011.11.05.10.50.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 05 Nov 2011 10:50:30 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Sat, 5 Nov 2011 18:50:21 +0100
In-Reply-To: <58510082c4abac45919b92b88f8f0cfdb2ae5eb9.1320513631.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320513631.git.sgw@linux.intel.com>
	<58510082c4abac45919b92b88f8f0cfdb2ae5eb9.1320513631.git.sgw@linux.intel.com>
Message-Id: <7D67EA79-F7DE-4439-A1CC-8ED767F6A73C@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [CONSOLIDATED PULL 06/28] qmmp: update to 0.5.2
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
X-List-Received-Date: Sat, 05 Nov 2011 17:56:46 -0000
X-Groupsio-MsgNum: 11966
Content-Type: multipart/signed;
	boundary="Apple-Mail=_90EFEFFE-43D2-4BE5-B485-35B23A03F5F0";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_90EFEFFE-43D2-4BE5-B485-35B23A03F5F0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 5 nov. 2011, om 18:22 heeft Saul Wold het volgende geschreven:

> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>=20
> Remove recipe qmmp_0.5.1 and add qmmp_0.5.2

That isn't formatted according to the commit policy

>=20
> Use do_split_package for each grouping and name them correctly besides =
updating package.
> The format to name plugins of qmmp:
> qmmp-plugin-<group>-<library>   with the Description: Qmmp<Group>  =
plugin for %s"
>=20
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
> .../conf/distro/include/distro_tracking_fields.inc |    9 +++-
> .../qt-apps/{qmmp_0.5.1.bb =3D> qmmp_0.5.2.bb}       |   52 =
++++++++++++--------

This should be in a seperate commit

>=20
> --- a/meta/recipes-qt/qt-apps/qmmp_0.5.1.bb
> +++ b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
> @@ -1,23 +1,24 @@
> -DESCRIPTION =3D "Qmmp (Qt-based Multimedia Player) is an =
audio-player, written with help of Qt library"
> +dESCRIPTION =3D "Qmmp (Qt-based Multimedia Player) is an =
audio-player, written with help of Qt library"
> HOMEPAGE =3D "http://qmmp.ylsoftware.com"
> LICENSE =3D "GPLv2"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D393a5ca445f6965873eca0259a17f833"
> SECTION =3D "multimedia"
>=20
> -PR =3D "r0"
> +PR =3D "r4"

When upgrading to a new PV you need to reset PR to r0, not increase it


> +PROVIDES =3D "qmmp"

${PN} is always in provides, no?


> DEPENDS =3D "qt4-x11-free taglib libmad libvorbis libogg alsa-lib"

please use 'inherit qt4x11' for the qt depends.

> -RDEPENDS_${PN} +=3D "taglib alsa-lib curl"
> +RDEPENDS_${PN} +=3D "taglib alsa-lib libmad curl"

RDEPENDS go below do_install

>=20
> SRC_URI =3D "http://qmmp.ylsoftware.com/files/${BPN}-${PV}.tar.bz2"
>=20
> -SRC_URI[md5sum] =3D "7934c069256bf2fc4ab762ad2683db2f"
> -SRC_URI[sha256sum] =3D =
"16ab0334f368a5ef14d631a1d43d7cae876ee06b7185643377b5e9cfd6143099"
> +SRC_URI[md5sum] =3D "20852f3cce3471bfc5affa9b2e947dc6"
> +SRC_URI[sha256sum] =3D =
"6391dec020d2a381d7f4b7890fae6c49eadf88b3c9aef571fe3c5e96140822ec"
>=20
>=20
> PARALLEL_MAKE =3D ""

Is this still needed?

>=20
> -inherit qmake2 cmake
> +inherit qmake2 cmake package

Why do you inherit package.bbclass here ?!?!?!




--Apple-Mail=_90EFEFFE-43D2-4BE5-B485-35B23A03F5F0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk61d18ACgkQMkyGM64RGpFRzgCePd/PRVFLAYAfa5ymIUq00mJG
9n8AoIeES5+b9J3bhXpONlUC+oc7ZmVW
=T/Rb
-----END PGP SIGNATURE-----

--Apple-Mail=_90EFEFFE-43D2-4BE5-B485-35B23A03F5F0--
