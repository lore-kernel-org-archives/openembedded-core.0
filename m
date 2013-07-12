Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2B72A6AFBA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 13:35:25 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id m14so6444601eaj.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 06:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6RhiP4QowEcEHbjL6HmshRDbAKq2zuQOGU8GbMINHo8=;
	b=Jx9CtVWS8vbQlrhBXqKvU+hZVpytn/uK6AqmCB6svoATqgp6WOQhpj1sR/4LifClMc
	fDH1z96ZoyBkSsKkNzKe+yoCjtBvn4ncHBeFS4O0ph45w+jvWYY1D9M6GWtAle3J42ch
	USk5lu3zWF/kvKMOpVEvuJFV5u0ohwDzWq0jSHy1Oiqv2ArTFJ7E0wgNfyj60pM3e6Cc
	2aImNgjj3tOepgqB9wBYQ2/IDxEjc9yIzUCp+/ET3N8dNJOe1Gid39fg/6JcykWGRGW1
	WNXwvSISbK1qJcIXhoy/4b+GL+fLEFAwyrV6CIlRvU7BfWCtcqA823yHeeScJNEwQw37
	gdQQ==
X-Received: by 10.14.205.72 with SMTP id i48mr47204089eeo.139.1373636125175;
	Fri, 12 Jul 2013 06:35:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n45sm78519097eew.1.2013.07.12.06.35.23 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Jul 2013 06:35:24 -0700 (PDT)
Date: Fri, 12 Jul 2013 15:35:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
Message-ID: <20130712133536.GN3288@jama>
References: <1373635702-22234-1-git-send-email-andrei.adrianx.dinu@intel.com>
MIME-Version: 1.0
In-Reply-To: <1373635702-22234-1-git-send-email-andrei.adrianx.dinu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sudo upgrade to 1.8.7
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
X-List-Received-Date: Fri, 12 Jul 2013 13:35:25 -0000
X-Groupsio-MsgNum: 41866
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fl9V9vFrQUs+59QW"
Content-Disposition: inline

--Fl9V9vFrQUs+59QW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2013 at 04:28:22PM +0300, Andrei Dinu wrote:
> upgrade from 1.8.6p8 -> 1.8.7
>=20
> - removed libtool.patch - contained upstream
> - new files checksum from year change ( 2012 -> 2013 )

Please add PACKAGECONFIG for zlib when you're on it.

now it autodetects zlib from sysroot.


> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> ---
>  meta/recipes-extended/sudo/files/libtool.patch     |   42 --------------=
------
>  meta/recipes-extended/sudo/sudo.inc                |    4 +-
>  .../sudo/{sudo_1.8.6p8.bb =3D> sudo_1.8.7.bb}        |    5 +--
>  3 files changed, 4 insertions(+), 47 deletions(-)
>  delete mode 100644 meta/recipes-extended/sudo/files/libtool.patch
>  rename meta/recipes-extended/sudo/{sudo_1.8.6p8.bb =3D> sudo_1.8.7.bb} (=
81%)
>=20
> diff --git a/meta/recipes-extended/sudo/files/libtool.patch b/meta/recipe=
s-extended/sudo/files/libtool.patch
> deleted file mode 100644
> index 10456d2..0000000
> --- a/meta/recipes-extended/sudo/files/libtool.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 8f89e456b2c23d78646a938ee5d4c5477c06c28d Mon Sep 17 00:00:00 2001
> -From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> -Date: Fri, 25 Jan 2013 16:18:37 +0200
> -Subject: [PATCH] Fix path to libtool scripts so autoreconf can succeed.
> -
> -Upstream-Status: Inappropriate [Other]
> -Workaround is specific to our build system.
> -
> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> -Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> ----
> - aclocal.m4 |   14 +++++++-------
> - 1 file changed, 7 insertions(+), 7 deletions(-)
> -
> -diff --git a/aclocal.m4 b/aclocal.m4
> -index 481ffeb..0c53eeb 100644
> ---- a/aclocal.m4
> -+++ b/aclocal.m4
> -@@ -364,13 +364,13 @@ EOF
> - dnl
> - dnl Pull in libtool macros
> - dnl
> --m4_include([libtool.m4])
> --m4_include([ltoptions.m4])
> --m4_include([ltsugar.m4])
> --m4_include([ltversion.m4])
> --m4_include([lt~obsolete.m4])
> -+m4_include([m4/libtool.m4])
> -+m4_include([m4/ltoptions.m4])
> -+m4_include([m4/ltsugar.m4])
> -+m4_include([m4/ltversion.m4])
> -+m4_include([m4/lt~obsolete.m4])
> - dnl
> - dnl Pull in other non-standard macros
> - dnl
> --m4_include([ax_check_compile_flag.m4])
> --m4_include([ax_check_link_flag.m4])
> -+m4_include([m4/ax_check_compile_flag.m4])
> -+m4_include([m4/ax_check_link_flag.m4])
> ---=20
> -1.7.9.5
> -
> diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/=
sudo/sudo.inc
> index 9dcb677..0632904 100644
> --- a/meta/recipes-extended/sudo/sudo.inc
> +++ b/meta/recipes-extended/sudo/sudo.inc
> @@ -4,8 +4,8 @@ HOMEPAGE =3D "http://www.sudo.ws"
>  BUGTRACKER =3D "http://www.sudo.ws/bugs/"
>  SECTION =3D "admin"
>  LICENSE =3D "ISC & BSD & Zlib"
> -LIC_FILES_CHKSUM =3D "file://doc/LICENSE;md5=3Dd25a8240ca6decdecb9990789=
e593130 \
> -                    file://plugins/sudoers/redblack.c;beginline=3D1;endl=
ine=3D41;md5=3Dfba1c1dca0951819964dfdc618e81724 \
> +LIC_FILES_CHKSUM =3D "file://doc/LICENSE;md5=3D9b2b7976b2182ee9a146710b3=
2a01c7a \
> +                    file://plugins/sudoers/redblack.c;beginline=3D1;endl=
ine=3D41;md5=3De2dbb155fc49beea947515300bab99e0 \
>                      file://compat/fnmatch.c;beginline=3D3;endline=3D27;m=
d5=3D67f83ee9bd456557397082f8f1be0efd \
>                      file://compat/getcwd.c;beginline=3D5;endline=3D27;md=
5=3D449af4cc57fc7d46f42090608ba3e681 \
>                      file://compat/glob.c;beginline=3D6;endline=3D31;md5=
=3D5872733146b9eb0deb79e1f664815b85 \
> diff --git a/meta/recipes-extended/sudo/sudo_1.8.6p8.bb b/meta/recipes-ex=
tended/sudo/sudo_1.8.7.bb
> similarity index 81%
> rename from meta/recipes-extended/sudo/sudo_1.8.6p8.bb
> rename to meta/recipes-extended/sudo/sudo_1.8.7.bb
> index 00602c0..de79110 100644
> --- a/meta/recipes-extended/sudo/sudo_1.8.6p8.bb
> +++ b/meta/recipes-extended/sudo/sudo_1.8.7.bb
> @@ -3,13 +3,12 @@ require sudo.inc
>  PR =3D "r0"
> =20
>  SRC_URI =3D "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
> -           file://libtool.patch \
>             ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', =
'', d)}"
> =20
>  PAM_SRC_URI =3D "file://sudo.pam"
> =20
> -SRC_URI[md5sum] =3D "6dac48c73c8e0932980efcddafa569af"
> -SRC_URI[sha256sum] =3D "c0baaa87f59153967b650a0dde2f7d4147d358fa15f3fdab=
b47e84d0282fe625"
> +SRC_URI[md5sum] =3D "a02367090e1dac8d0c1747de1127b6bf"
> +SRC_URI[sha256sum] =3D "39626cf3d48c4fd5a9139a2627d42bfefac7ce47f470bdba=
3aeb4e3d7c49566a"
> =20
>  DEPENDS +=3D " ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', =
d)}"
>  RDEPENDS_${PN} +=3D " ${@base_contains('DISTRO_FEATURES', 'pam', 'pam-pl=
ugin-limits pam-plugin-keyinit', '', d)}"
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Fl9V9vFrQUs+59QW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHgBigACgkQN1Ujt2V2gBxT0QCgi5K/aEzqUxfyXc+iss8W0VwC
0DUAoJPGckF3C8W5kzr76FD89e1ha0Be
=T8M1
-----END PGP SIGNATURE-----

--Fl9V9vFrQUs+59QW--
