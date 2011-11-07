Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RNNbN-0001Re-3k
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 12:42:57 +0100
Received: by wyh5 with SMTP id 5so4547802wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 03:36:43 -0800 (PST)
Received: by 10.216.160.208 with SMTP id u58mr7118770wek.27.1320665803455;
	Mon, 07 Nov 2011 03:36:43 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	et20sm27419983wbb.15.2011.11.07.03.36.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 03:36:42 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Mon, 7 Nov 2011 12:36:37 +0100
In-Reply-To: <2a7edb60d8e4495033d7e938fa6a1e2930529a8f.1320664163.git.xiaofeng.yan@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320664163.git.xiaofeng.yan@windriver.com>
	<2a7edb60d8e4495033d7e938fa6a1e2930529a8f.1320664163.git.xiaofeng.yan@windriver.com>
Message-Id: <D8A7C44A-5902-42ED-986A-C0944BC7D0E0@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/2] libarchive: update to 2.8.5
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
X-List-Received-Date: Mon, 07 Nov 2011 11:42:57 -0000
X-Groupsio-MsgNum: 11983
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BF763E67-0B14-4DF2-A37C-2BB071F275C0";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BF763E67-0B14-4DF2-A37C-2BB071F275C0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 7 nov. 2011, om 12:13 heeft Xiaofeng Yan het volgende geschreven:

> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>=20
> libarchive: update to 2.8.5
>=20
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
> ...rchive_2.8.4.yocto.1.bb =3D> libarchive_2.8.5.bb} |    8 ++++----
> 1 files changed, 4 insertions(+), 4 deletions(-)
> rename meta/recipes-extended/libarchive/{libarchive_2.8.4.yocto.1.bb =
=3D> libarchive_2.8.5.bb} (76%)
>=20
> diff --git =
a/meta/recipes-extended/libarchive/libarchive_2.8.4.yocto.1.bb =
b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
> similarity index 76%
> rename from =
meta/recipes-extended/libarchive/libarchive_2.8.4.yocto.1.bb
> rename to meta/recipes-extended/libarchive/libarchive_2.8.5.bb
> index 94d261b..1bc49e2 100644
> --- a/meta/recipes-extended/libarchive/libarchive_2.8.4.yocto.1.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
> @@ -9,19 +9,19 @@ DEPENDS =3D "libxml2"
>=20
> # We need to repack the tarball due undistributable content on the =
upstream one.
> # More details at =
http://code.google.com/p/libarchive/issues/detail?id=3D162
> -SRC_URI =3D =
"http://autobuilder.yoctoproject.org/sources/libarchive-${PV}.tar.gz \
> +SRC_URI =3D =
"http://libarchive.googlecode.com/files/libarchive-${PV}.tar.gz \
>            file://0001-Patch-from-upstream-revision-1990.patch \
>            file://0002-Patch-from-upstream-revision-1991.patch \
> -           file://0003-Patch-from-upstream-rev-2516.patch \

Why was only that patch removed? The commit message doesn't mention =
anything about it.

regards,

Koen


--Apple-Mail=_BF763E67-0B14-4DF2-A37C-2BB071F275C0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk63wsgACgkQMkyGM64RGpEW/QCeJxGAPQXuUjR5e+FpOB/jZpPK
XUgAoJWVWAD1pqy/8ps2tAP7IWtBWCqA
=mY0V
-----END PGP SIGNATURE-----

--Apple-Mail=_BF763E67-0B14-4DF2-A37C-2BB071F275C0--
