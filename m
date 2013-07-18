Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 056606B10E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 15:14:20 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id c13so1822857eek.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 08:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rZW9Qaw1ekjcWbB9uSfaaGex0IkHfHgNwF3Qeoj2fUQ=;
	b=tlhFp04IkCfqnhJRiNvnsBl65tfx2P7p/OVYQ6uy1AijjtkN+4nJpiqb1IWhfnB8MO
	CL6vfmUm2KSSmRQ0pPnrgw2ODFmr0r2X2BsmzozSozH1MxH9fKyLxoGQ7jnwBiLf07HG
	1u41lSBtPPVYK8T7iFk3JI8EDt0JCpXlPOI/E69D6rDvQchrecrgdGtIwwszZ3yX+eym
	645rr5Mnd69BpVKAxM/9FCvoGj8JswAbKHq1ziBhPrkO03Gtg/ihIRr9BvV25qFux5+m
	0maTsIlijuMkvBUC0V9jAF92dE2lYvjMWeNNGzY+abKZk6R2VmNvCgoTczMm8luFHgYj
	XH5Q==
X-Received: by 10.15.34.129 with SMTP id e1mr11824781eev.80.1374160461056;
	Thu, 18 Jul 2013 08:14:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c3sm20068911eev.3.2013.07.18.08.14.20 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 18 Jul 2013 08:14:20 -0700 (PDT)
Date: Thu, 18 Jul 2013 17:14:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Jonathan Liu <net147@gmail.com>
Message-ID: <20130718151438.GE9527@jama>
References: <1374157082-20897-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1374157082-20897-1-git-send-email-net147@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: upgrade to 9.1.5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Jul 2013 15:14:21 -0000
X-Groupsio-MsgNum: 42162
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="84ND8YJRMFlzkrP4"
Content-Disposition: inline

--84ND8YJRMFlzkrP4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2013 at 12:18:02AM +1000, Jonathan Liu wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  .../0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch       | 0
>  .../0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch   | 0
>  meta/recipes-graphics/mesa/mesa.inc                                   | =
2 +-
>  meta/recipes-graphics/mesa/{mesa_9.1.3.bb =3D> mesa_9.1.5.bb}           =
| 4 ++--
>  4 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-graphics/mesa/{mesa-9.1.3 =3D> mesa-9.1.5}/0003-EGL-=
Mutate-NativeDisplayType-depending-on-config.patch (100%)
>  rename meta/recipes-graphics/mesa/{mesa-9.1.3 =3D> mesa-9.1.5}/0005-llvm=
pipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch (100%)
>  rename meta/recipes-graphics/mesa/{mesa_9.1.3.bb =3D> mesa_9.1.5.bb} (79=
%)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-9.1.3/0003-EGL-Mutate-Native=
DisplayType-depending-on-config.patch b/meta/recipes-graphics/mesa/mesa-9.1=
=2E5/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-9.1.3/0003-EGL-Mutate-NativeD=
isplayType-depending-on-config.patch
> rename to meta/recipes-graphics/mesa/mesa-9.1.5/0003-EGL-Mutate-NativeDis=
playType-depending-on-config.patch
> diff --git a/meta/recipes-graphics/mesa/mesa-9.1.3/0005-llvmpipe-remove-t=
he-power-of-two-sizeof-struct-cmd_b.patch b/meta/recipes-graphics/mesa/mesa=
-9.1.5/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-9.1.3/0005-llvmpipe-remove-th=
e-power-of-two-sizeof-struct-cmd_b.patch
> rename to meta/recipes-graphics/mesa/mesa-9.1.5/0005-llvmpipe-remove-the-=
power-of-two-sizeof-struct-cmd_b.patch
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index ada1170..4f93b90 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -87,7 +87,7 @@ do_install_append () {
>      rm -f ${D}${libdir}/gallium-pipe/*.la
>      rm -f ${D}${libdir}/gbm/*.la
>     =20
> -    # it was packaged in libdricore9.1.3-1 and preventing upgrades when =
debian.bbclass was used=20
> +    # it was packaged in libdricore and preventing upgrades when debian.=
bbclass was used=20

It's not so important, but the old comment was more correct, the package
is called libdricore${VERSION} when debian.bbclass is used and that's
the reason why it was conflicting (when packagemanager was trying to
install libdricore9.1.2-1 next to libdricore9.1.3-1..

>      rm -f ${D}${sysconfdir}/drirc
>  }
> =20
> diff --git a/meta/recipes-graphics/mesa/mesa_9.1.3.bb b/meta/recipes-grap=
hics/mesa/mesa_9.1.5.bb
> similarity index 79%
> rename from meta/recipes-graphics/mesa/mesa_9.1.3.bb
> rename to meta/recipes-graphics/mesa/mesa_9.1.5.bb
> index a7ccbe6..49fa5dd 100644
> --- a/meta/recipes-graphics/mesa/mesa_9.1.3.bb
> +++ b/meta/recipes-graphics/mesa/mesa_9.1.5.bb
> @@ -8,7 +8,7 @@ SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/Mes=
aLib-${PV}.tar.bz2 \
>             file://0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cm=
d_b.patch \
>             "
> =20
> -SRC_URI[md5sum] =3D "952ccd03547ed72333b64e1746cf8ada"
> -SRC_URI[sha256sum] =3D "8d5dac2202d0355bff5cfd183582ec8167d1d1227b7bb7a6=
69acecbeaa52d766"
> +SRC_URI[md5sum] =3D "4ed2af5943141a85a21869053a2fc2eb"
> +SRC_URI[sha256sum] =3D "89ea0d1afd90a87dab253777bfe414820c4aa3890add1487=
ca2b49f6b3e194fd"
> =20
>  S =3D "${WORKDIR}/Mesa-${PV}"
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--84ND8YJRMFlzkrP4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHoBl4ACgkQN1Ujt2V2gByYvACgh1W+9wrdGva9XV6S5a4ItPIZ
0xoAnjCyOPTrqaVddSY49zg/ok4UO6SY
=YTx2
-----END PGP SIGNATURE-----

--84ND8YJRMFlzkrP4--
