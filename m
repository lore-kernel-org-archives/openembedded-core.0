Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SWMeA-0000O5-Fz
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 09:03:14 +0200
Received: by wibhn14 with SMTP id hn14so2368109wib.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2012 23:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ThR3hTF5ur4y8q41OCymzWKim1Wk6xeJdjShoIaWhZM=;
	b=tfU7WvFxr/OZnsWTN863ZeiJjLSo5h81J8oJakkGjH+dDj/eYq4Kkt7AgO0Fzla0UJ
	iwXJF+ilBEVGIGwWaUvRBBSx0GBYXtBx6QtfUs9BZ4161P48M14rTz9A7XNu8GDTrLQ0
	uvVFDVhZc2dPxNWcXienLZXrAv4R/W7deBDh2TY7GchTesOPM5OBS3wkCQmZRxKTmEl3
	Rm00gdIYuM3FgBp7mUbqSnbn6aV2Svzuaal3hEmm/i5i5z2o3PWoi7F5cObpj5xn7ycD
	tjELGwxG89/YTmygV5s3YHzdUQgG5e8FpaLWYOK+5Il/LKe4DqX2FL7xTICEpqtKnIpe
	OdRg==
Received: by 10.180.104.168 with SMTP id gf8mr22185947wib.12.1337583187286;
	Sun, 20 May 2012 23:53:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q6sm15841397wiy.0.2012.05.20.23.53.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 May 2012 23:53:06 -0700 (PDT)
Date: Mon, 21 May 2012 08:53:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120521065305.GB3166@jama.jama.net>
References: <cover.1337581961.git.sgw@linux.intel.com>
	<cd6ae3da72e2e0052b409d73bb9533f63070e4e9.1337581961.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cd6ae3da72e2e0052b409d73bb9533f63070e4e9.1337581961.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC v1 1/1] Reorder and -dev
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
X-List-Received-Date: Mon, 21 May 2012 07:03:14 -0000
X-Groupsio-MsgNum: 22414
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p4qYPpj5QlsIQJ0K"
Content-Disposition: inline

--p4qYPpj5QlsIQJ0K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 20, 2012 at 11:42:16PM -0700, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/binconfig.bbclass                     |    2 ++
>  meta/conf/bitbake.conf                             |    8 +++++---
>  meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb        |   10 ++++++++++
>  meta/recipes-connectivity/libpcap/libpcap.inc      |    2 +-
>  meta/recipes-core/eglibc/eglibc-package.inc        |    2 +-
>  meta/recipes-core/eglibc/eglibc_2.15.bb            |    2 +-
>  meta/recipes-core/gettext/gettext_0.16.1.bb        |    3 ++-
>  meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    4 +++-
>  meta/recipes-core/libxml/libxml2.inc               |    2 +-
>  meta/recipes-core/ncurses/ncurses.inc              |    2 +-
>  meta/recipes-extended/cups/cups14.inc              |    1 +
>  meta/recipes-extended/cups/cups_1.4.6.bb           |    2 +-
>  meta/recipes-extended/groff/groff_1.20.1.bb        |    4 +++-
>  meta/recipes-extended/slang/slang_2.2.4.bb         |    4 ++--
>  meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |   14 ++++++++++----
>  meta/recipes-gnome/gthumb/gthumb_2.12.4.bb         |   12 ++++++++----
>  meta/recipes-graphics/directfb/directfb_1.4.15.bb  |    2 +-
>  meta/recipes-graphics/freetype/freetype_2.4.8.bb   |    5 +----
>  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |    2 +-
>  meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb    |    6 ++++--
>  meta/recipes-multimedia/libpng/libpng_1.2.49.bb    |    4 +---
>  meta/recipes-support/apr/apr-util_1.4.1.bb         |    2 +-
>  meta/recipes-support/apr/apr_1.4.6.bb              |    2 +-
>  meta/recipes-support/curl/curl_7.24.0.bb           |    2 +-
>  meta/recipes-support/db/db_5.1.19.bb               |    1 +
>  meta/recipes-support/gnutls/gnutls.inc             |    5 ++---
>  meta/recipes-support/gnutls/libtasn1_2.12.bb       |    2 +-
>  meta/recipes-support/gpgme/gpgme_1.3.1.bb          |    5 ++---
>  meta/recipes-support/icu/icu-3.6.inc               |    2 ++
>  meta/recipes-support/icu/icu_3.6.bb                |    2 +-
>  meta/recipes-support/libassuan/libassuan_2.0.3.bb  |    1 +
>  meta/recipes-support/libgcrypt/libgcrypt.inc       |    4 ----
>  .../libgpg-error/libgpg-error_1.10.bb              |    6 +-----
>  meta/recipes-support/libksba/libksba_1.2.0.bb      |    1 +
>  meta/recipes-support/libpcre/libpcre_8.21.bb       |    5 +----
>  meta/recipes-support/libproxy/libproxy_0.4.7.bb    |    3 ++-
>  meta/recipes-support/libusb/libusb-compat_0.1.3.bb |    4 +---
>  meta/recipes-support/libxslt/libxslt_1.1.26.bb     |    2 +-
>  meta/recipes-support/neon/neon_0.29.6.bb           |    2 +-
>  meta/recipes-support/pth/pth_2.0.7.bb              |    5 +----
>  meta/recipes-support/taglib/taglib_1.6.3.bb        |    3 +--
>  41 files changed, 83 insertions(+), 69 deletions(-)
>=20
> diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbcl=
ass
> index 3deb541..60012c8 100644
> --- a/meta/classes/binconfig.bbclass
> +++ b/meta/classes/binconfig.bbclass
> @@ -1,3 +1,5 @@
> +FILES_${PN}-dev +=3D "${bindir}/*-config"
> +=20
>  # The namespaces can clash here hence the two step replace
>  def get_binconfig_mangle(d):
>  	s =3D "-e ''"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 7073018..a8485c3 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -253,7 +253,7 @@ SOLIBSDEV_darwin =3D ".dylib"
>  SOLIBSDEV_darwin8 =3D ".dylib"
>  SOLIBSDEV_darwin9 =3D ".dylib"
> =20
> -PACKAGES =3D "${PN}-dbg ${PN}-staticdev ${PN} ${PN}-doc ${PN}-dev ${PN}-=
locale"
> +PACKAGES =3D "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN} ${PN}-doc ${PN}-=
locale"
>  PACKAGES_DYNAMIC =3D "${PN}-locale-*"
>  FILES =3D ""
> =20
> @@ -261,7 +261,7 @@ FILES_${PN} =3D "${bindir}/* ${sbindir}/* ${libexecdi=
r}/* ${libdir}/lib*${SOLIBS}
>              ${sysconfdir} ${sharedstatedir} ${localstatedir} \
>              ${base_bindir}/* ${base_sbindir}/* \
>              ${base_libdir}/*${SOLIBS} \
> -            ${datadir}/${BPN} ${libdir}/${BPN}/* \
> +            ${datadir}/${BPN} ${libdir}/${BPN}/*${SOLIBS} \
>              ${datadir}/pixmaps ${datadir}/applications \
>              ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
>              ${libdir}/bonobo/servers"
> @@ -272,7 +272,9 @@ SECTION_${PN}-doc =3D "doc"
> =20
>  FILES_${PN}-dev =3D "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/=
*.la \
>                  ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
> -                ${datadir}/aclocal ${base_libdir}/*.o"
> +                ${datadir}/aclocal ${base_libdir}/*.o \
> +                ${libdir}/${BPN}/*.la \
> +                ${base_libdir}/*${SOLIBSDEV} ${base_libdir}/*.la"
>  SECTION_${PN}-dev =3D "devel"
>  ALLOW_EMPTY_${PN}-dev =3D "1"
>  RDEPENDS_${PN}-dev =3D "${PN} (=3D ${EXTENDPKGV})"
> diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-b=
sp/pm-utils/pm-utils_1.4.1.bb
> index 92d65c1..098b6d4 100644
> --- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
> +++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
> @@ -6,8 +6,12 @@ LICENSE=3D"GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
>                      file://src/pm-pmu.c;beginline=3D1;endline=3D22;md5=
=3D3c1ddbc54e735fb4a0386e14c78a3147"
> =20
> +<<<<<<< Updated upstream
>  PR =3D "r1"
>  RDEPENDS_${PN} =3D "grep"
> +=3D=3D=3D=3D=3D=3D=3D
> +PR =3D "r2"
> +>>>>>>> Stashed changes
> =20
>  SRC_URI =3D "http://pm-utils.freedesktop.org/releases/pm-utils-${PV}.tar=
=2Egz"
> =20
> @@ -20,5 +24,11 @@ do_configure_prepend () {
>  	autoreconf -f -i -s
>  }
> =20
> +<<<<<<< Updated upstream
>  SRC_URI[md5sum] =3D "1742a556089c36c3a89eb1b957da5a60"
>  SRC_URI[sha256sum] =3D "8ed899032866d88b2933a1d34cc75e8ae42dcde20e1cc218=
36baaae3d4370c0b"
> +=3D=3D=3D=3D=3D=3D=3D
> +FILES_${PN} +=3D "${libdir}/${BPN}/*"
> +FILES_${PN}-dbg +=3D "${libdir}/${BPN}/bin/.debug \
> +		    ${datadir}/doc/pm-utils/README.debugging"
> +>>>>>>> Stashed changes

^ some rebase leftovers

the rest looks ok, but I'm pretty scared from such changes, does your
buildhistory diffs show just *-config file moves or something else too?

When you're at it, does it make sense to move also ${PN}-doc
${PN}-locale before ${PN} in PACKAGES? Both have well defined FILES
patterns, so ${PN} last can be used as catch all.

Cheers,


--p4qYPpj5QlsIQJ0K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+55lEACgkQN1Ujt2V2gBwg8wCdGZ/XGcNRT4ks35VCnEX092eN
DIEAoK7bwpYymNcLmNuLPgayIyymAEzz
=JxzC
-----END PGP SIGNATURE-----

--p4qYPpj5QlsIQJ0K--
