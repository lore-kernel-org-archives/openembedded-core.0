Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Re8Hg-00054x-LU
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 17:47:53 +0100
Received: by werm13 with SMTP id m13so4443031wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 08:40:41 -0800 (PST)
Received: by 10.216.139.94 with SMTP id b72mr8538596wej.38.1324658441377;
	Fri, 23 Dec 2011 08:40:41 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id p2sm14249045wbh.22.2011.12.23.08.40.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Dec 2011 08:40:40 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Fri, 23 Dec 2011 17:40:36 +0100
In-Reply-To: <b3dad82177ad19a44f06edc4b857cb9697fa3950.1324657801.git.shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1324657801.git.shane.wang@intel.com>
	<b3dad82177ad19a44f06edc4b857cb9697fa3950.1324657801.git.shane.wang@intel.com>
Message-Id: <3D030A85-C2B2-4487-AB24-FA0A48A6408D@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 01/14] polkit: upgrade to 0.103
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
X-List-Received-Date: Fri, 23 Dec 2011 16:47:53 -0000
X-Groupsio-MsgNum: 14755
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CAB41779-9154-4295-A340-7B4D6974E3E7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CAB41779-9154-4295-A340-7B4D6974E3E7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 23 dec. 2011, om 17:35 heeft Shane Wang het volgende geschreven:

> Signed-off-by: Shane Wang <shane.wang@intel.com>
> ---
> .../introspection.patch                            |    0
> .../polkit-1_pam.patch                             |    0
> .../polkit/{polkit_0.102.bb =3D> polkit_0.103.bb}    |    6 +++---
> 3 files changed, 3 insertions(+), 3 deletions(-)
> rename meta/recipes-extended/polkit/{polkit-0.102 =3D> =
polkit-0.103}/introspection.patch (100%)
> rename meta/recipes-extended/polkit/{polkit-0.102 =3D> =
polkit-0.103}/polkit-1_pam.patch (100%)
> rename meta/recipes-extended/polkit/{polkit_0.102.bb =3D> =
polkit_0.103.bb} (84%)
>=20
> diff --git =
a/meta/recipes-extended/polkit/polkit-0.102/introspection.patch =
b/meta/recipes-extended/polkit/polkit-0.103/introspection.patch
> similarity index 100%
> rename from =
meta/recipes-extended/polkit/polkit-0.102/introspection.patch
> rename to =
meta/recipes-extended/polkit/polkit-0.103/introspection.patch
> diff --git =
a/meta/recipes-extended/polkit/polkit-0.102/polkit-1_pam.patch =
b/meta/recipes-extended/polkit/polkit-0.103/polkit-1_pam.patch
> similarity index 100%
> rename from =
meta/recipes-extended/polkit/polkit-0.102/polkit-1_pam.patch
> rename to meta/recipes-extended/polkit/polkit-0.103/polkit-1_pam.patch
> diff --git a/meta/recipes-extended/polkit/polkit_0.102.bb =
b/meta/recipes-extended/polkit/polkit_0.103.bb
> similarity index 84%
> rename from meta/recipes-extended/polkit/polkit_0.102.bb
> rename to meta/recipes-extended/polkit/polkit_0.103.bb
> index 714aa8e..0498494 100644
> --- a/meta/recipes-extended/polkit/polkit_0.102.bb
> +++ b/meta/recipes-extended/polkit/polkit_0.103.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "http://code.google.com/p/polkit/"
> LICENSE =3D "LGPLv2+"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D155db86cdbafa7532b41f390409283eb \
>                     =
file://src/polkit/polkit.h;beginline=3D1;endilne=3D20;md5=3D9f797b8912dac8=
a806be820c14e783f8 \
> -                    =
file://docs/polkit/html/license.html;md5=3D570dd8c794dc8df913cb03b86e78d93=
6"
> +                    =
file://docs/polkit/html/license.html;md5=3Dd85a36709a446c10f4ee123f9dda0e3=
8"

What changed?

>=20
> SRC_URI =3D "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
>            file://introspection.patch \
> @@ -28,5 +28,5 @@ do_install_append() {
> 	rm -f ${D}${libdir}/${PN}-1/extensions/*.a
> }
>=20
> -SRC_URI[md5sum] =3D "a3726bdb9728c103e58f62131e26693a"
> -SRC_URI[sha256sum] =3D =
"0a6573da841c6f5c428218f1456aed45724a0127932af0de563d568bb9058641"
> +SRC_URI[md5sum] =3D "aaacf2ef18774ea8a825a426a7cfe763"
> +SRC_URI[sha256sum] =3D =
"36607c8ce576980ee55bd12bab1944f13217eb8e9d04ab56022545861ece3bc5"

These should go next to SRC_URI, not at the bottom=

--Apple-Mail=_CAB41779-9154-4295-A340-7B4D6974E3E7
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk70rwYACgkQMkyGM64RGpG8/QCfZ5In9FNV/p5m/QnR9xXpySYQ
FTgAoKZcNF0pWhkEuA6lDYkNq3bxFNo9
=q98o
-----END PGP SIGNATURE-----

--Apple-Mail=_CAB41779-9154-4295-A340-7B4D6974E3E7--
