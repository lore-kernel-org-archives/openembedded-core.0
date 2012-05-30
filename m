Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SZhnk-0006pV-Bp; Wed, 30 May 2012 14:14:57 +0200
Received: by wgbdr1 with SMTP id dr1so4497442wgb.24
	for <multiple recipients>; Wed, 30 May 2012 05:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dSLEVYNY7HU6CKWKjZhAvhxu83+iKn+KdHbfyllCfAY=;
	b=hLf5C3qPQkEQgv89DQReravML32FBIGfCrse4OixRosg2+GXVNHrP7xdHaiifW/0DX
	0pfLaWgS/o6iymczQDkuAmeWwy72RabEs8gbKLj27uVa/l/wbJovbMfVM/XKejh8M5/0
	eb3pPYb+YlmyiyGLIdkaWqn41bDZhIVXzVE6ad5i2PjY0UWaPRle01y1ZMpZGMUfUCAq
	mArLUiizOcQOjRTOI9vwSoXZSZ3GBvfM4sVElqPUBCjOrTRPoVxvOAj/OsTgW8xSY4eF
	Zpor2EVKKFMkgF2QFfK2TcdmYUnEFY1JKnus19tkTQ+ch19o7ls1KPGiC8qMqb1X5PD5
	z2TA==
Received: by 10.216.140.35 with SMTP id d35mr10319236wej.105.1338379476543;
	Wed, 30 May 2012 05:04:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ei4sm55854628wid.5.2012.05.30.05.04.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 May 2012 05:04:35 -0700 (PDT)
Date: Wed, 30 May 2012 14:04:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120530120443.GL3138@jama.jama.net>
References: <20120530110550.04FA710217@opal>
MIME-Version: 1.0
In-Reply-To: <20120530110550.04FA710217@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Valentin Popa : xz: updated to version 5.1.1alpha
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
X-List-Received-Date: Wed, 30 May 2012 12:14:57 -0000
X-Groupsio-MsgNum: 22957
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4e5ZDkbgLEOfWmLx"
Content-Disposition: inline

--4e5ZDkbgLEOfWmLx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 30, 2012 at 11:05:49AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: da98266f3a228cf65f279db9810a5326c8bd5422
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dda98266f3a228cf65f279db9810a5326c8bd5422
>=20
> Author: Valentin Popa <valentin.popa@intel.com>
> Date:   Wed May 23 14:08:58 2012 +0300
>=20
> xz: updated to version 5.1.1alpha

this upgrade is causing liblzma package name change
-liblzma5_5.0.3-r1_armv4te.ipk
+liblzma_5.1.1alpha-r0_armv4t.ipk

so all packages which rdepends on liblzma should get PR bump, e.g.:
 *libsystemd-journal0
 *libpoppler18
 *libsdl-image-1.2-0
 *libpoppler-glib8
 *systemd
 *ethumb
 *libtiff5
 *epdf

Cheers,

>=20
> The licenses are the same, only some white spaces added/removed.
>=20
> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  .../xz/{xz_5.0.3.bb =3D> xz_5.1.1alpha.bb}           |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-extended/xz/xz_5.0.3.bb b/meta/recipes-extended=
/xz/xz_5.1.1alpha.bb
> similarity index 72%
> rename from meta/recipes-extended/xz/xz_5.0.3.bb
> rename to meta/recipes-extended/xz/xz_5.1.1alpha.bb
> index e8f96b6..7fa7177 100644
> --- a/meta/recipes-extended/xz/xz_5.0.3.bb
> +++ b/meta/recipes-extended/xz/xz_5.1.1alpha.bb
> @@ -4,17 +4,17 @@ SECTION =3D "base"
> =20
>  LICENSE =3D "GPLv2+ & GPLv3+ & LGPLv2.1+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc475b6c7dca236740ace4bba553e8=
e1c \
> -                    file://COPYING.GPLv2;md5=3D751419260aa954499f7abaaba=
a882bbe \
> +                    file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263 \
>                      file://COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80d4=
7fae504 \
> -                    file://COPYING.LGPLv2.1;md5=3Dfbc093901857fcd118f065=
f900982c24 \
> +                    file://COPYING.LGPLv2.1;md5=3D4fbd65380cdd2559510790=
08b364516c \
>                      file://lib/getopt.c;endline=3D23;md5=3D2069b0ee71057=
2c03bb3114e4532cd84 "
> =20
>  SRC_URI =3D "http://tukaani.org/xz/xz-${PV}.tar.gz"
> =20
> -SRC_URI[md5sum] =3D "fefe52f9ecd521de2a8ce38c21a27574"
> -SRC_URI[sha256sum] =3D "10eb4df72dffb2fb14c3d2d82b450e72282ffcb9ee3908a8=
e5b392b8f09681bf"
> +SRC_URI[md5sum] =3D "bb24436fa12780808e1c142980484104"
> +SRC_URI[sha256sum] =3D "54e59a83690a4a0ec88a7d7c3bdef90c6b196c892a934638=
63c71c24fe87951a"
> =20
> -PR =3D "r1"
> +PR =3D "r0"
> =20
>  inherit autotools gettext
> =20
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4e5ZDkbgLEOfWmLx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/GDNsACgkQN1Ujt2V2gByzjQCfTxnDw0Bjy3SBNBJykK6gEBrl
WvMAnjxVmbulSYK6mChxp4RNlpaCqVSb
=bZWa
-----END PGP SIGNATURE-----

--4e5ZDkbgLEOfWmLx--
