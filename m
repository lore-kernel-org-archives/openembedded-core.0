Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RrtHv-000433-Bh
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 16:36:59 +0100
Received: by wibhq7 with SMTP id hq7so3298721wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 07:29:06 -0800 (PST)
Received: by 10.180.109.77 with SMTP id hq13mr28834868wib.7.1327937346786;
	Mon, 30 Jan 2012 07:29:06 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id d9sm30974326wiy.2.2012.01.30.07.29.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jan 2012 07:29:04 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Mon, 30 Jan 2012 16:29:02 +0100
In-Reply-To: <1327936840-13937-5-git-send-email-steve@sakoman.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1327936840-13937-1-git-send-email-steve@sakoman.com>
	<1327936840-13937-5-git-send-email-steve@sakoman.com>
Message-Id: <87FF40C2-C1D3-42D0-BB4E-50F2F39203EA@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 4/4] zypper: add missing runtime dependences on gzip and gnupg
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
X-List-Received-Date: Mon, 30 Jan 2012 15:36:59 -0000
X-Groupsio-MsgNum: 16703
Content-Type: multipart/signed;
	boundary="Apple-Mail=_13C650F9-767F-4DD6-9D79-36A077151238";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_13C650F9-767F-4DD6-9D79-36A077151238
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 30 jan. 2012, om 16:20 heeft Steve Sakoman het volgende geschreven:

> gzip is required to uncompress repository files
> gnupg is required for the support of signed repositories.
>=20
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
> meta/recipes-extended/zypper/zypper_git.bb |    4 +++-
> 1 files changed, 3 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-extended/zypper/zypper_git.bb =
b/meta/recipes-extended/zypper/zypper_git.bb
> index e5963be..1a6b83c 100644
> --- a/meta/recipes-extended/zypper/zypper_git.bb
> +++ b/meta/recipes-extended/zypper/zypper_git.bb
> @@ -5,7 +5,9 @@ LICENSE  =3D "GPLv2+"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D3201406e350b39e05a82e28b5020f413"
>=20
> DEPENDS  =3D "libzypp augeas"
> -PR =3D "r1"
> +RDEPENDS =3D "gzip gnupg"

RDEPENDS_${PN} and move it to the proper place in the recipe.=

--Apple-Mail=_13C650F9-767F-4DD6-9D79-36A077151238
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk8mtz8ACgkQMkyGM64RGpGOlACdEdUUwI9soHTH+ot/SqQh8maS
5QIAnRxyU40bAnP7woYZ9n/JzzFMHEDh
=QOhV
-----END PGP SIGNATURE-----

--Apple-Mail=_13C650F9-767F-4DD6-9D79-36A077151238--
