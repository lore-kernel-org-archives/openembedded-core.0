Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Rvmne-0003ks-AN for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 10:29:50 +0100
Received: from f053034143.adsl.alicedsl.de ([78.53.34.143]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Rvmfz-0006nm-Pj for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 09:21:56 +0000
Message-ID: <1328865702.4215.8.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 10:21:42 +0100
In-Reply-To: <1328862631-30998-1-git-send-email-sgw@linux.intel.com>
References: <1328862631-30998-1-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] gnupg: Update checksum, fix configure and compliation issues
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
X-List-Received-Date: Fri, 10 Feb 2012 09:29:50 -0000
X-Groupsio-MsgNum: 17398
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-9eWvDX34OJSAlUT5MF7Z"

--=-9eWvDX34OJSAlUT5MF7Z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 10.02.2012, 00:30 -0800 schrieb Saul Wold:

In the summary there should be comp*i*lation.

> This recipe was added, but did not have the correct
> checksum information for the LIC_FILES_CHKSUM or the
> SRC_URI.

How could that happen?

> Also disable Documetnation for now due to older autotools issue.

docum*en*tation

>=20
> [YOCTO #1966]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../gnupg/gnupg-1.4.7/configure.patch              |   17 ++++++++++++++=
+++
>  meta/recipes-support/gnupg/gnupg_1.4.7.bb          |   12 ++++++------
>  2 files changed, 23 insertions(+), 6 deletions(-)
>  create mode 100644 meta/recipes-support/gnupg/gnupg-1.4.7/configure.patc=
h
>=20
> diff --git a/meta/recipes-support/gnupg/gnupg-1.4.7/configure.patch b/met=
a/recipes-support/gnupg/gnupg-1.4.7/configure.patch
> new file mode 100644
> index 0000000..e005ac6
> --- /dev/null
> +++ b/meta/recipes-support/gnupg/gnupg-1.4.7/configure.patch
> @@ -0,0 +1,17 @@

Could you please describe the problem here. PO sounds like translation
to me.

> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Saul Wold <sgw@linux.intel.com>
> +
> +Index: gnupg-1.4.7/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gnupg-1.4.7.orig/configure.ac
> ++++ gnupg-1.4.7/configure.ac
> +@@ -827,7 +827,6 @@ else
> +   AC_SUBST(USE_NLS)
> +   AC_SUBST(USE_INCLUDED_LIBINTL)
> +   AC_SUBST(BUILD_INCLUDED_LIBINTL)
> +-  AM_PO_SUBDIRS
> + fi
> +=20
> + if test "$try_extensions" =3D yes || test x"$card_support" =3D xyes ; t=
hen
> diff --git a/meta/recipes-support/gnupg/gnupg_1.4.7.bb b/meta/recipes-sup=
port/gnupg/gnupg_1.4.7.bb
> index daea5aa..26683df 100644
> --- a/meta/recipes-support/gnupg/gnupg_1.4.7.bb
> +++ b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
> @@ -5,18 +5,17 @@ SECTION =3D "console/utils"
> =20
>  LICENSE =3D "GPLv2"
> =20
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c=
50a"
> =20
>  PR =3D "r4"

Should that be increased? I know the package did not work before but the
content should have changed nevertheless.

> =20
>  SRC_URI =3D "ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-${PV}.tar.bz2 \
>             file://long-long-thumb.patch \
> +           file://configure.patch \
>             file://mips_gcc4.4.patch"
> =20
> -SRC_URI[md5sum] =3D "dcf7ed712997888d616e029637bfc303"
> -SRC_URI[sha256sum] =3D "a2907f4432d67894e425e48ae85785dd60ecb01658c9682b=
cd96f5e91043bb38"
> -
> -S =3D "${WORKDIR}/gnupg-${PV}"
> +SRC_URI[md5sum] =3D "b06a141cca5cd1a55bbdd25ab833303c"
> +SRC_URI[sha256sum] =3D "69d18b7d193f62ca27ed4febcb4c9044aa0c95305d3258fe=
902e2fae5fc6468d"
> =20
>  inherit autotools gettext
> =20
> @@ -73,7 +72,8 @@ EXTRA_OECONF =3D "--disable-ldap \
>  		--with-bzip2=3D${STAGING_LIBDIR}/.. \
>  		--disable-selinux-support \
>                  --with-readline=3D${STAGING_LIBDIR}/.. \
> -                ac_cv_sys_symbol_underscore=3Dyes"
> +                ac_cv_sys_symbol_underscore=3Dno \
> +		"

Does that belong to the documentation change?

> =20
>  do_install () {
>  	autotools_do_install


Thanks,

Paul

--=-9eWvDX34OJSAlUT5MF7Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk804acACgkQPX1aK2wOHVhChgCePHZekHXCXAzZGDSJeGk+yaQM
MWIAniwwaDetgLvIUOEqqcO/AO7seIUc
=G2MY
-----END PGP SIGNATURE-----

--=-9eWvDX34OJSAlUT5MF7Z--
