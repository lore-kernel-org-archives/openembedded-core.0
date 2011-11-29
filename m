Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVWsG-0002NE-3D
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:14:04 +0100
Received: by bkbzs2 with SMTP id zs2so10035873bkb.6
	for <openembedded-core@openembedded.org>;
	Tue, 29 Nov 2011 15:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=J8yqqbr2pMvY3BTxsPKFhqtlYRaTrTH2cYZOB4WOFBo=;
	b=gl6uwXDy7ojUJGf+Uvw4SmdJrM3UwZh+my9/29nbomNAB6zSKvxoei586jGf+KbnMQ
	gv1SyqOZQt5KnYzwY0/iTv84AaTzqREuuvyg2au8Csj/A0Qg3bqi05/kV2JaM9VUmpR5
	SQdpu42+Ms15kyNwDV9zKbeFgmo8LRjM/xUyA=
Received: by 10.204.151.144 with SMTP id c16mr18955037bkw.45.1322608039729;
	Tue, 29 Nov 2011 15:07:19 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q6sm40224913bka.6.2011.11.29.15.07.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 15:07:18 -0800 (PST)
Date: Wed, 30 Nov 2011 00:07:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111129230717.GM7441@jama.jama.net>
References: <cover.1322607016.git.sgw@linux.intel.com>
	<c3dbce57812344c0c13051ba3bdc4a8c4dafd179.1322607016.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <c3dbce57812344c0c13051ba3bdc4a8c4dafd179.1322607016.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH 15/26] xserver-xorg*: Update to 1.11.2
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
X-List-Received-Date: Tue, 29 Nov 2011 23:14:04 -0000
X-Groupsio-MsgNum: 13212
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C01fF7hLGvN0zd9s"
Content-Disposition: inline

--C01fF7hLGvN0zd9s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2011 at 03:00:15PM -0800, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  ...ver-xorg-1.11.1.inc =3D> xserver-xorg-1.11.2.inc} |    4 +---
>  .../crosscompile.patch                             |    0
>  .../fix_open_max_preprocessor_error.patch          |    0
>  .../macro_tweak.patch                              |    0
>  ...-lite_1.11.1.bb =3D> xserver-xorg-lite_1.11.2.bb} |    0
>  ...erver-xorg_1.11.1.bb =3D> xserver-xorg_1.11.2.bb} |    0
>  6 files changed, 1 insertions(+), 3 deletions(-)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.1.inc =3D> =
xserver-xorg-1.11.2.inc} (47%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.1 =3D> xser=
ver-xorg-1.11.2}/crosscompile.patch (100%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.1 =3D> xser=
ver-xorg-1.11.2}/fix_open_max_preprocessor_error.patch (100%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.1 =3D> xser=
ver-xorg-1.11.2}/macro_tweak.patch (100%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-lite_1.11.1.bb =
=3D> xserver-xorg-lite_1.11.2.bb} (100%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.11.1.bb =3D> x=
server-xorg_1.11.2.bb} (100%)
>=20
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc b=
/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> similarity index 47%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> index 8b0808d..8eba932 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> @@ -3,7 +3,5 @@ SRC_URI +=3D "file://crosscompile.patch"
>  # Misc build failure for master HEAD
>  SRC_URI +=3D "file://fix_open_max_preprocessor_error.patch"
> =20
> -PR =3D "r2"
> +PR =3D "r0"
> =20
> -SRC_URI[md5sum] =3D "4cdf54dc569b6a5548257c93a45dcd3d"
> -SRC_URI[sha256sum] =3D "c069c177d9a80bca2ee1d49aa1af6d9f996c83e4ff12393c=
ab2ca3f8817276f6"

where are checksums now?

Cheers,

--C01fF7hLGvN0zd9s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7VZaUACgkQN1Ujt2V2gBwJoQCdHUbaO7OLZ5/aEwP+Ah06S060
uPMAn0YMvuGO/3VGX7TaqHGWOZoppCnz
=fq92
-----END PGP SIGNATURE-----

--C01fF7hLGvN0zd9s--
