Return-Path: <martin.jansa@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0D28B6A352;
	Wed, 22 May 2013 16:07:31 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id 6so1495709pdd.6
	for <multiple recipients>; Wed, 22 May 2013 09:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WrFQd+reFA7Ugcq8chrA4HfnBs8S8HzKIjDx8Dr3G58=;
	b=re45zJHnZuk8KikEWstkziHC7jMBIIItgJ3E2HvvZ8+reMG5jN0+m9JGYR+2nXX/bA
	ZdpValbxYEd+EimjI7Mq21h8C301oba+xQMMVY4ece1NEBhCFKfeWHtM07ZYsCTz2ZYb
	clWfYo9N9spQq5rkztDrjxZcdfjlyw9mtrNsijzUrn9UN0kLYVw1yY2IVjeVNxwMX2Gy
	m2M94jAdnbHriy5jo+LJ+VfuZYC+dBiR9KXPAIdcDpOdZ9CwLgrRs1htwbzPMY4eZXO3
	tDOzBZRDUrc1Ls6m48WcRJay9/kBcEKH5pszoc/8RHBmteRUZUEFDdkCYHECzZkbhJx/
	RMwA==
X-Received: by 10.66.220.197 with SMTP id py5mr9078814pac.86.1369238851632;
	Wed, 22 May 2013 09:07:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id l4sm7809379pbo.6.2013.05.22.09.07.28
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 22 May 2013 09:07:30 -0700 (PDT)
Date: Wed, 22 May 2013 18:07:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20130522160725.GM32431@jama>
References: <20130512163307.035FC504FC@opal>
MIME-Version: 1.0
In-Reply-To: <20130512163307.035FC504FC@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Laurentiu Palcu : libdrm: upgrade to 2.4.44
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
X-List-Received-Date: Wed, 22 May 2013 16:07:31 -0000
X-Groupsio-MsgNum: 39599
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iAzLNm1y1mIRgolD"
Content-Disposition: inline

--iAzLNm1y1mIRgolD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 12, 2013 at 04:33:07PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 563edb321594b007cae2294e807235ad22fd27da
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D563edb321594b007cae2294e807235ad22fd27da
>=20
> Author: Laurentiu Palcu <laurentiu.palcu@intel.com>
> Date:   Fri May 10 16:23:33 2013 +0300
>=20
> libdrm: upgrade to 2.4.44
>=20
> Removed part of the installtests.patch since tests can now be installed
> giving an option to configure script.
>=20
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Are you using buildhistory to test such upgrades?

This was caused by added --enable-install-test-programs.

Buildhistory shows that kmstest and vbltest were added to PN causing PKG to=
=20
change from libdrm2 to libdrm and breaking upgrade path

${PN}-tests looks like better place for tests.

 * check_data_file_clashes: Package libdrm wants to install file /usr/lib/l=
ibdrm.so.2
        But that file is already provided by package  * libdrm2
 * check_data_file_clashes: Package libdrm wants to install file /usr/lib/l=
ibdrm.so.2.4.0
        But that file is already provided by package  * libdrm2

-PV =3D 2.4.42
-PR =3D r4.0
-PKGR =3D r4.0.2
-PKG =3D libdrm2
+PV =3D 2.4.44
+PR =3D r0
+PKGR =3D r0.0
 RPROVIDES =3D=20
-RDEPENDS =3D eglibc (>=3D 2.17)
+RDEPENDS =3D eglibc (>=3D 2.17) libdrm-kms (>=3D 2.4.44)
 RRECOMMENDS =3D=20
-PKGSIZE =3D 34635
+PKGSIZE =3D 46491
 FILES =3D /usr/bin/* /usr/sbin/* /usr/lib/libdrm/* /usr/lib/lib*.so.* /etc=
 /com /var /bin/* /sbin/* /lib/*.so.* /lib/udev/rules.d /usr/lib/udev/rules=
=2Ed /usr/share/libdrm /usr/lib/libdrm/* /usr/share/pixmaps /usr/share/appl=
ications /usr/share/idl /usr/share/omf /usr/share/sounds /usr/lib/bonobo/se=
rvers
-FILELIST =3D /usr/lib/libdrm.so.2 /usr/lib/libdrm.so.2.4.0
+FILELIST =3D /usr/bin/kmstest /usr/bin/vbltest /usr/lib/libdrm.so.2 /usr/l=
ib/libdrm.so.2.4.0

> ---
>=20
>  meta/recipes-graphics/drm/libdrm.inc               |    1 +
>  .../recipes-graphics/drm/libdrm/installtests.patch |   26 --------------=
------
>  meta/recipes-graphics/drm/libdrm_2.4.42.bb         |   10 -------
>  meta/recipes-graphics/drm/libdrm_2.4.44.bb         |    8 ++++++
>  4 files changed, 9 insertions(+), 36 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics=
/drm/libdrm.inc
> index 9c1124e..e395e03 100644
> --- a/meta/recipes-graphics/drm/libdrm.inc
> +++ b/meta/recipes-graphics/drm/libdrm.inc
> @@ -20,6 +20,7 @@ inherit autotools pkgconfig
> =20
>  EXTRA_OECONF +=3D "--disable-cairo-tests \
>                   --enable-omap-experimental-api \
> +                 --enable-install-test-programs \
>                  "
>  ALLOW_EMPTY_${PN}-drivers =3D "1"
>  PACKAGES =3D+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN=
}-omap \
> diff --git a/meta/recipes-graphics/drm/libdrm/installtests.patch b/meta/r=
ecipes-graphics/drm/libdrm/installtests.patch
> index 1f39719..7d443af 100644
> --- a/meta/recipes-graphics/drm/libdrm/installtests.patch
> +++ b/meta/recipes-graphics/drm/libdrm/installtests.patch
> @@ -21,29 +21,3 @@ index bf1987f..d909e19 100644
>   SUBDIRS =3D modeprint
>  =20
>   if HAVE_LIBKMS
> -diff --git a/tests/modeprint/Makefile.am b/tests/modeprint/Makefile.am
> -index c4862ac..7db76ea 100644
> ---- a/tests/modeprint/Makefile.am
> -+++ b/tests/modeprint/Makefile.am
> -@@ -2,7 +2,7 @@ AM_CFLAGS =3D \
> - 	-I$(top_srcdir)/include/drm \
> - 	-I$(top_srcdir)
> -=20
> --noinst_PROGRAMS =3D \
> -+bin_PROGRAMS =3D \
> - 	modeprint
> -=20
> - modeprint_SOURCES =3D \
> -diff --git a/tests/modetest/Makefile.am b/tests/modetest/Makefile.am
> -index 2191242..1d2c1b0 100644
> ---- a/tests/modetest/Makefile.am
> -+++ b/tests/modetest/Makefile.am
> -@@ -4,7 +4,7 @@ AM_CFLAGS =3D \
> - 	-I$(top_srcdir) \
> - 	$(CAIRO_CFLAGS)
> -=20
> --noinst_PROGRAMS =3D \
> -+bin_PROGRAMS =3D \
> - 	modetest
> -=20
> - modetest_SOURCES =3D \
> diff --git a/meta/recipes-graphics/drm/libdrm_2.4.42.bb b/meta/recipes-gr=
aphics/drm/libdrm_2.4.42.bb
> deleted file mode 100644
> index 67ae2e6..0000000
> --- a/meta/recipes-graphics/drm/libdrm_2.4.42.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require libdrm.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI +=3D "file://installtests.patch \
> -            file://GNU_SOURCE_definition.patch \
> -           "
> -
> -SRC_URI[md5sum] =3D "a6e2e26951bcc920b2049b65e86a659f"
> -SRC_URI[sha256sum] =3D "e0671082a77871c8474d3c0f09dbf5ff82d2429cd248088a=
691f7b484cbc76e1"
> diff --git a/meta/recipes-graphics/drm/libdrm_2.4.44.bb b/meta/recipes-gr=
aphics/drm/libdrm_2.4.44.bb
> new file mode 100644
> index 0000000..b016958
> --- /dev/null
> +++ b/meta/recipes-graphics/drm/libdrm_2.4.44.bb
> @@ -0,0 +1,8 @@
> +require libdrm.inc
> +
> +SRC_URI +=3D "file://installtests.patch \
> +            file://GNU_SOURCE_definition.patch \
> +           "
> +SRC_URI[md5sum] =3D "b760b1f2ae4ec6452383164ec697cd5d"
> +SRC_URI[sha256sum] =3D "42b45ad15bb1bc52630a4b37b7afcfaea27e01b3c0b4791e=
f25d0f7b2456f6a2"
> +
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iAzLNm1y1mIRgolD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGc7T0ACgkQN1Ujt2V2gBwCkgCeL1Wz30EXEyy5sItaxXBaouVN
/JwAn0wW2UGwEKu31lHdHmh0ayZdmpoa
=BWt3
-----END PGP SIGNATURE-----

--iAzLNm1y1mIRgolD--
