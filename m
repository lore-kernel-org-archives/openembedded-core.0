Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id DE853605A0;
	Sun,  4 Aug 2013 11:10:15 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so1079001eei.21
	for <multiple recipients>; Sun, 04 Aug 2013 04:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AlbW+h+FienyhPUjCUtiEGM7N8Ub+gj4MrY6mIbg7Fc=;
	b=q7/7VZkZeg5cm+zVWfZsoIkvfnX56ArgJhg5PatBOlDjhrlvqs1gEEuxk7H5DVaPyB
	DeGB77Ua1jdx24T1cLyI3U8QSskTYd98mJ6jLJP3begbFC0kmDoKM3vWxZ48arpynYUR
	F6z1mPbpRXx/GAqDfszwt/Wa+86gjk82oq3nUVON5fzuLl5aTaA1faj/OVfHRipQJEce
	8S+QIMu4Ia8vYzl+JuYI9RrCplMfhvqpxRba6dAihK9nFIBESpo2/G8R8UWTPQo/go4M
	ioFBpxWKitqdPUWEE9jy0vCZYdhL8qW/KA0XB7AF+/VQVKEwCeK6EPkQXQn0XqMMF1tp
	o+0Q==
X-Received: by 10.14.69.206 with SMTP id n54mr12486748eed.118.1375614615574;
	Sun, 04 Aug 2013 04:10:15 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm25440160eeh.15.2013.08.04.04.10.14 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 04 Aug 2013 04:10:14 -0700 (PDT)
Date: Sun, 4 Aug 2013 13:10:54 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Andrei Dinu <andrei.adrianx.dinu@intel.com>
Message-ID: <20130804111054.GC3280@jama>
References: <20130731055135.2CC81504BA@opal>
MIME-Version: 1.0
In-Reply-To: <20130731055135.2CC81504BA@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Andrei Dinu : libpng : upgrade to 1.6.3
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
X-List-Received-Date: Sun, 04 Aug 2013 11:10:16 -0000
X-Groupsio-MsgNum: 42946
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WG0/bXtUnGTsWt66"
Content-Disposition: inline

--WG0/bXtUnGTsWt66
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2013 at 05:51:35AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 776c753bc5745b098d6a80e61c7332d956ae7f4f
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D776c753bc5745b098d6a80e61c7332d956ae7f4f
>=20
> Author: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> Date:   Fri Jul 26 13:45:11 2013 +0300
>=20
> libpng : upgrade to 1.6.3
>=20
> upgrade from 1.6.2 -> 1.6.3
>=20
> LICENSE and png.h checksum changed caused by
> dates and release numbers.
>=20
> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Sigh,

Are you using buildhistory and checking changes in it when upgrading
packages?

debian.bbclass didn't rename last libpng, because 2 ${bindir}
files are included now, was it intentional?

diff --git a/packages/x86_64-oe-linux/libpng/libpng/latest b/packages/x86_6=
4-oe-linux/libpng/libpng/latest
index 7e88312..04b3ca7 100644
--- a/packages/x86_64-oe-linux/libpng/libpng/latest
+++ b/packages/x86_64-oe-linux/libpng/libpng/latest
@@ -1,10 +1,9 @@
-PV =3D 1.6.2
+PV =3D 1.6.3
 PR =3D r0
 PKGR =3D r0.0
-PKG =3D libpng16-16
 RPROVIDES =3D=20
-RDEPENDS =3D eglibc (>=3D 2.17) zlib (>=3D 1.2.8)
+RDEPENDS =3D eglibc (>=3D 2.18) zlib (>=3D 1.2.8)
 RRECOMMENDS =3D=20
-PKGSIZE =3D 204562
+PKGSIZE =3D 252458
 FILES =3D /usr/bin/* /usr/sbin/* /usr/lib/libpng/* /usr/lib/lib*.so.* /etc=
 /com /var /bin/* /sbin/* /lib/*.so.* /lib/udev/rules.d /usr/lib/udev/rules=
=2Ed /usr/sh
-FILELIST =3D /usr/lib/libpng16.so.16 /usr/lib/libpng16.so.16.2.0
+FILELIST =3D /usr/bin/png-fix-itxt /usr/bin/pngfix /usr/lib/libpng16.so.16=
 /usr/lib/libpng16.so.16.3.0


>  .../libpng/{libpng_1.6.2.bb =3D> libpng_1.6.3.bb}    |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.2.bb b/meta/recipe=
s-multimedia/libpng/libpng_1.6.3.bb
> similarity index 64%
> rename from meta/recipes-multimedia/libpng/libpng_1.6.2.bb
> rename to meta/recipes-multimedia/libpng/libpng_1.6.3.bb
> index 7a19313..11e735c 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.2.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.3.bb
> @@ -3,16 +3,16 @@ DESCRIPTION =3D "PNG Library"
>  HOMEPAGE =3D "http://www.libpng.org/"
>  SECTION =3D "libs"
>  LICENSE =3D "Libpng"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db7c6b3f443bd29d45da5575f36293=
606 \
> -                    file://png.h;beginline=3D207;endline=3D321;md5=3Df8e=
34d28a077eca674b739ded0de063c"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6a42d0002ce5c11e4a529c29f78d1=
3dd \
> +                    file://png.h;beginline=3D207;endline=3D321;md5=3Dde9=
33190ded7f9d6c22110c8509ea85a"
>  DEPENDS =3D "zlib"
>  LIBV =3D "16"
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/li=
bpng-${PV}.tar.xz \
>             file://0001-configure-lower-automake-requirement.patch \
>            "
> -SRC_URI[md5sum] =3D "9d838f6fca9948a9f360a0cc1b516d5f"
> -SRC_URI[sha256sum] =3D "1c97a90bc22107e50f04f77a0115f4ec890d5c6a373ac4c5=
60e8fb87259e92de"
> +SRC_URI[md5sum] =3D "9307f8ab04f4be3c1889ffb504f0fe5c"
> +SRC_URI[sha256sum] =3D "c5ecc0d38663b944a828145ed59cf15dfbad2217512875bc=
05ecf9b92afa0f45"
> =20
>  inherit autotools binconfig pkgconfig
> =20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WG0/bXtUnGTsWt66
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlH+Nr4ACgkQN1Ujt2V2gByk1ACgqOo/1y6YVT4WX7alpti2RKlm
8G8AnRtWKV2C5c6YImO/ecKQRKQUZSlM
=mfiv
-----END PGP SIGNATURE-----

--WG0/bXtUnGTsWt66--
