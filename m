Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RNNwP-0002kE-PV
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 13:04:42 +0100
Received: by wyh5 with SMTP id 5so4566780wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 03:58:25 -0800 (PST)
Received: by 10.227.208.71 with SMTP id gb7mr28435464wbb.7.1320667105092;
	Mon, 07 Nov 2011 03:58:25 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id em4sm18654619wbb.20.2011.11.07.03.58.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 03:58:24 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Mon, 7 Nov 2011 12:58:19 +0100
In-Reply-To: <fea248bae1ee38a8c74392d47bf4480cb405cfae.1320665106.git.xiaofeng.yan@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320665106.git.xiaofeng.yan@windriver.com>
	<fea248bae1ee38a8c74392d47bf4480cb405cfae.1320665106.git.xiaofeng.yan@windriver.com>
Message-Id: <94D2553B-05A3-4DA1-918D-26E66F3E9DCC@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/2] qmmp: update to 0.5.2
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
X-List-Received-Date: Mon, 07 Nov 2011 12:04:42 -0000
X-Groupsio-MsgNum: 11987
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FD3945F4-2CBF-4EE2-9DFB-33EE1F28BBA9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_FD3945F4-2CBF-4EE2-9DFB-33EE1F28BBA9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 7 nov. 2011, om 12:57 heeft Xiaofeng Yan het volgende geschreven:

> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>=20
> qmmp: remove old recipe and add new recipe
>=20
> Use do_split_package for each grouping and name them correctly besides =
updating package.
> The format to name plugins of qmmp:
> qmmp-plugin-<group>-<library>   with the Description: Qmmp<Group>  =
plugin for %s"
>=20
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
> meta/recipes-qt/qt-apps/qmmp_0.5.1.bb |   47 =
----------------------------
>=20
> -FILES_${PN}-plugin-input-mad =3D "${libdir}/qmmp/Input/libmad.so"
> -RDEPENDS_${PN}-plugin-input-mad =3D "libmad"
> -FILES_${PN}-plugin-input-vorbis =3D =
"${libdir}/qmmp/Input/libvorbis.so"
> -RDEPENDS_${PN}-plugin-input-vorbis =3D "libvorbis libogg"

> diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb =
b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
> new file mode 100644
> index 0000000..035b50f
> --- /dev/null
> +++ b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
> @@ -0,0 +1,54 @@
> +dESCRIPTION =3D "Qmmp (Qt-based Multimedia Player) is an =
audio-player, written with help of Qt library"
> +HOMEPAGE =3D "http://qmmp.ylsoftware.com"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D393a5ca445f6965873eca0259a17f833"
> +SECTION =3D "multimedia"
> +
> +PR =3D "r0"
> +
> +DEPENDS =3D "taglib libmad libvorbis libogg alsa-lib"
> +RDEPENDS_${PN} +=3D "taglib alsa-lib libmad curl"

RDEPENDS go below do_install, like in the old recipe. The variable =
follow the task order, so DEPENDS goes at the top, RDEPENDS (do_package) =
goes down below do_install.

regards,

Koen=

--Apple-Mail=_FD3945F4-2CBF-4EE2-9DFB-33EE1F28BBA9
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk63x94ACgkQMkyGM64RGpH+qwCfcBo6BLH/YbFk7S1MOC9hh2HT
HJ8AoJTndZlvCUflKRyIJXBpjBOgAt0H
=6vqD
-----END PGP SIGNATURE-----

--Apple-Mail=_FD3945F4-2CBF-4EE2-9DFB-33EE1F28BBA9--
