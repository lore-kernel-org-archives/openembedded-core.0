Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SmRpz-0000IW-SX
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 17:49:55 +0200
Received: by wgbdr1 with SMTP id dr1so6800846wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2012 08:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Hav51OEn2BYOak0plSqp2IMX9JBTAl7hqObG5dalqfg=;
	b=IMjpJFbwBTM2kyBNaKXDU5oYJP8QdQ1Vw5TUgj9I5SbREG8zh87ec6ODs2oFJb95Ri
	wVW74a3h54Vw9xcp7Krh3P5DgcsIQ7G7eI9ytGW6zyPziR7PtBMN6Jxth6QcGGvZtNtk
	ILsj7wySZ2S6odcHf/KXl/RClqxUBl9S7+T0d3AWCb0XsTosWMnEJ78puQofEGBfO18j
	PMrzt7yUfqVvy3eEgwqKJ00TPDUxw1kG3vhjB7qnVHyqL1lH/MQI+gut/VUjHIVAkGuH
	fQHp3ZIOIEzdTdRg265oiSkV4xJIzrdZoBcRYdOD5NV+vglzj9ZRG0Z8xX6iw0Si6hal
	0RPg==
Received: by 10.216.211.19 with SMTP id v19mr6255067weo.89.1341416332298;
	Wed, 04 Jul 2012 08:38:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bg10sm67454293wib.9.2012.07.04.08.38.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Jul 2012 08:38:49 -0700 (PDT)
Date: Wed, 4 Jul 2012 17:38:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120704153843.GD15100@jama.jama.net>
References: <4FF33085.1070703@linux.intel.com>
	<1341415425-16073-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1341415425-16073-1-git-send-email-paul.gortmaker@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] u-boot: make FILESDIR a shared setting via FILESPATH
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
X-List-Received-Date: Wed, 04 Jul 2012 15:49:56 -0000
X-Groupsio-MsgNum: 24671
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EXKGNeO8l0xGFBjy"
Content-Disposition: inline

--EXKGNeO8l0xGFBjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 04, 2012 at 11:23:45AM -0400, Paul Gortmaker wrote:
> The setting is the same in all recipes, so move it to
> the shared settings in u-boot.inc
>=20
> Since FILESDIR is also being phased out, use the FILESPATH
> setting as suggested by Richard Purdie.

Shouldn't it be added in FILESEXTRAPATHS instead of FILESPATH?

Cheers,

> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>=20
> [ PG: Retested builds for 8315 and beagleboard ]
>=20
>  meta/recipes-bsp/u-boot/u-boot.inc           |    1 +
>  meta/recipes-bsp/u-boot/u-boot_2011.03.bb    |    2 --
>  meta/recipes-bsp/u-boot/u-boot_2011.06.bb    |    2 --
>  meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb |    2 --
>  4 files changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot=
/u-boot.inc
> index 5de3583..664c2e6 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -59,6 +59,7 @@ do_install () {
>  }
> =20
>  FILES_${PN} =3D "/boot"
> +FILESPATH =3D. "${FILE_DIRNAME}/u-boot-git/${MACHINE}:"
> =20
>  do_deploy () {
>      install -d ${DEPLOYDIR}
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb b/meta/recipes-bsp=
/u-boot/u-boot_2011.03.bb
> index e99bc2c..ed38f54 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
> @@ -10,8 +10,6 @@ LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a5651=
ecb \
>                      file://README;beginline=3D1;endline=3D22;md5=3D3a00e=
f51d3fc96e9d6c1bc4708ccd3b5"
> =20
> -FILESDIR =3D "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHI=
NE}"
> -
>  # This revision corresponds to the tag "v2011.03"
>  # We use the revision in order to avoid having to fetch it from the repo=
 during parse
>  SRCREV =3D "19b54a701811220221fc4d5089a2bb18892018ca"
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb b/meta/recipes-bsp=
/u-boot/u-boot_2011.06.bb
> index 680401f..da61852 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
> @@ -10,8 +10,6 @@ LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a5651=
ecb \
>                      file://README;beginline=3D1;endline=3D22;md5=3D5ba42=
18ac89af7846802d0348df3fb90"
> =20
> -FILESDIR =3D "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHI=
NE}"
> -
>  # This revision corresponds to the tag "v2011.06"
>  # We use the revision in order to avoid having to fetch it from the repo=
 during parse
>  SRCREV =3D "b1af6f532e0d348b153d5c148369229d24af361a"
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb b/meta/recipes-=
bsp/u-boot/u-boot_2012.04.01.bb
> index dbdc663..25cc8c9 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
> @@ -14,8 +14,6 @@ DEFAULT_PREFERENCE =3D "-1"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a5651=
ecb"
> =20
> -FILESDIR =3D "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHI=
NE}"
> -
>  # This revision corresponds to the tag "v2012.04.01"
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> --=20
> 1.7.9.6
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EXKGNeO8l0xGFBjy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/0Y4MACgkQN1Ujt2V2gByfgQCeIWs4halmN/1fM1QaAqCoBcpJ
bjMAmgKWMo0NGHELAPhpKqmIOiaYHqvb
=oW+T
-----END PGP SIGNATURE-----

--EXKGNeO8l0xGFBjy--
