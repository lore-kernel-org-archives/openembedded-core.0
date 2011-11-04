Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RMORG-0001av-OK
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 19:24:26 +0100
Received: by wwf4 with SMTP id 4so3269173wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2011 11:18:17 -0700 (PDT)
Received: by 10.216.9.141 with SMTP id 13mr1273002wet.79.1320430696026;
	Fri, 04 Nov 2011 11:18:16 -0700 (PDT)
Received: from [172.20.1.32] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v6sm166250wiv.10.2011.11.04.11.18.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 11:18:15 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Fri, 4 Nov 2011 19:18:09 +0100
In-Reply-To: <8ae5b3cd9ef609e444cc360e226f857685e2e254.1320429060.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320429060.git.paul.eggleton@linux.intel.com>
	<8ae5b3cd9ef609e444cc360e226f857685e2e254.1320429060.git.paul.eggleton@linux.intel.com>
Message-Id: <E2FAFDF6-ABD2-4242-8BAC-8124ED2B1013@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 2/3] core-image-minimal-initramfs: force IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 04 Nov 2011 18:24:26 -0000
X-Groupsio-MsgNum: 11923
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BFB3FCA2-391A-4495-B408-7F15C77CF744";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BFB3FCA2-391A-4495-B408-7F15C77CF744
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 4 nov. 2011, om 18:52 heeft Paul Eggleton het volgende geschreven:

> If the user has set their own value for IMAGE_FSTYPES, they may have
> disabled the cpio.gz image type, preventing the initramfs from being
> produced in the format that image-live.bbclass expects; so force
> IMAGE_FSTYPES to cpio.gz within the initramfs image recipe.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> .../images/core-image-minimal-initramfs.bb         |    1 +
> 1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb =
b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> index 0bac27a..e4d0e51 100644
> --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
> +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> @@ -13,3 +13,4 @@ LICENSE =3D "MIT"
> inherit core-image
>=20
> IMAGE_ROOTFS_SIZE =3D "8192"
> +IMAGE_FSTYPES =3D "cpio.gz"

_append or +=3D would give less suprises.

regards,

Koen=

--Apple-Mail=_BFB3FCA2-391A-4495-B408-7F15C77CF744
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk60LGIACgkQMkyGM64RGpGqzACeMWIFmRwmJ8YLdF5x9m/HZkYX
PDEAmgLRQiXd3/tSJf+QlkPdD8LViRI9
=M8CX
-----END PGP SIGNATURE-----

--Apple-Mail=_BFB3FCA2-391A-4495-B408-7F15C77CF744--
