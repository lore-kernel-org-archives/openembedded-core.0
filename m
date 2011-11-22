Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RSnnt-00047M-Go
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 11:42:18 +0100
Received: by wwp14 with SMTP id 14so52284wwp.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 02:35:44 -0800 (PST)
Received: by 10.216.188.199 with SMTP id a49mr3291844wen.87.1321947679465;
	Mon, 21 Nov 2011 23:41:19 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id hq5sm6299129wib.7.2011.11.21.23.41.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Nov 2011 23:41:18 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 22 Nov 2011 08:41:14 +0100
In-Reply-To: <1321941210-4344-1-git-send-email-msprathap@ti.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1321941210-4344-1-git-send-email-msprathap@ti.com>
Message-Id: <7E669427-959C-4D0B-961D-92D77C776143@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH v2 1/1] kernel.bbclass: stage additional directories
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
X-List-Received-Date: Tue, 22 Nov 2011 10:42:18 -0000
X-Groupsio-MsgNum: 12707
Content-Type: multipart/signed;
	boundary="Apple-Mail=_365EBB7A-1315-4ECC-B2C3-D1DFDC747E3F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_365EBB7A-1315-4ECC-B2C3-D1DFDC747E3F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 22 nov. 2011, om 06:53 heeft Prathap M S het volgende geschreven:

> * The graphics SDK requires additional directories to be staged
>  for compilation.
>=20
> Signed-off-by: Prathap M S <msprathap@ti.com>
> ---
> meta/classes/kernel.bbclass |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 12e0b83..b00461b 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -243,7 +243,7 @@ FILES_kernel-image =3D =
"/boot/${KERNEL_IMAGETYPE}*"
> FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers* =
/boot/config*"
> FILES_kernel-vmlinux =3D "/boot/vmlinux*"
> # misc is a package to contain files we need in staging
> -FILES_kernel-misc =3D "/kernel/include/config /kernel/scripts =
/kernel/drivers/crypto /kernel/drivers/media"
> +FILES_kernel-misc =3D "/kernel/include/config /kernel/scripts =
/kernel/drivers/crypto /kernel/drivers/media /kernel/drivers/video =
/kernel/drivers/gpu /kernel/drivers/base"

This doesn't make it stage anything, it just adds a few dirs to the =
kernel-misc package.



--Apple-Mail=_365EBB7A-1315-4ECC-B2C3-D1DFDC747E3F
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7LUhwACgkQMkyGM64RGpFsWACgvGXs+7aelFC3tk5l3yXzhysU
7CgAnj1ZnJULU5DDPV4MvAalD105liiZ
=mPGS
-----END PGP SIGNATURE-----

--Apple-Mail=_365EBB7A-1315-4ECC-B2C3-D1DFDC747E3F--
