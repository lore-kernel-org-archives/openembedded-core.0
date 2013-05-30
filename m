Return-Path: <martin.jansa@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1D5426041D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:02:05 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id bv13so403186pdb.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 07:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oZqOmEf3vffhNAngBDWX9z8CHTpaD9GVJ1wyK5Nf5Vk=;
	b=xWa/MHvS0g03vvq5NEiCQ4L1sHlWzv0jdLkjfDNmjlAtTwm/jHSRwLDYoAjTSr3Wrj
	Uxzh0gHeeeThAgVJ0QD8NYWWFiAJjx0mnVomOeY5DXlwpx2fpfIE2zx1G+7fKvDnD7CJ
	GHrvcIGrUF18TL2f9m4PONpJqZ/grcgSHtJkTiiVwZoGmQtYfBhYNGK9CzOXBgIt97u9
	JmHxmtHUPC98oTnxrfLTL704hbIZyvUmuOwFLfMHHsfqzqoKfs9+azGmsqn1CiBVP618
	7tZ9ibRoHyrs0GlaJXQBIBX+QCyikITyEJKKKUYkXfrddAFvg8ZkoL7DAE1+EYbjP4O4
	yHDQ==
X-Received: by 10.66.235.69 with SMTP id uk5mr8559510pac.110.1369922526232;
	Thu, 30 May 2013 07:02:06 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	qi1sm44954738pac.21.2013.05.30.07.02.03 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 30 May 2013 07:02:05 -0700 (PDT)
Date: Thu, 30 May 2013 16:02:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130530140207.GC24725@jama>
References: <cover.1369921759.git.ross.burton@intel.com>
	<22e0a87c5884adff2aa356bc6f02d9cb49ee2376.1369921759.git.ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <22e0a87c5884adff2aa356bc6f02d9cb49ee2376.1369921759.git.ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/14] gdk-pixbuf: upgrade to 2.28.1
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
X-List-Received-Date: Thu, 30 May 2013 14:02:05 -0000
X-Groupsio-MsgNum: 39963
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Content-Disposition: inline

--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2013 at 02:52:38PM +0100, Ross Burton wrote:
> Something along the lines of pngversion.patch was merged upstream, so dro=
p that
> patch.
>=20
> Also use the new trim_version() function for a future-proof SRC_URI.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch  |   23 --------------=
------
>  .../configure_fix.patch                            |    0
>  .../extending-libinstall-dependencies.patch        |    0
>  .../hardcoded_libtool.patch                        |    0
>  .../{gdk-pixbuf_2.26.5.bb =3D> gdk-pixbuf_2.28.1.bb} |   11 +++++-----
>  5 files changed, 5 insertions(+), 29 deletions(-)
>  delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/pngve=
rsion.patch
>  rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 =3D> gdk-pixbuf}=
/configure_fix.patch (100%)
>  rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 =3D> gdk-pixbuf}=
/extending-libinstall-dependencies.patch (100%)
>  rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 =3D> gdk-pixbuf}=
/hardcoded_libtool.patch (100%)
>  rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.26.5.bb =3D> gdk-pixb=
uf_2.28.1.bb} (89%)
>=20
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.p=
atch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch
> deleted file mode 100644
> index 2e7d5af..0000000
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -We now have libpng 1.6. If we build libpng12 as well as libpng 1.6, the =
1.2 version gets=20
> -preferred which is not desirable and does not give deterministic builds.
> -
> -We really do want to use libpng since the item in DEPENDS will provide t=
his so
> -manipulate the search list so the one we DEPEND on gets chosen.
> -
> -RP 2013/4/13
> -
> -Upstream-Status: Pending [worth discussing at least]
> -
> -Index: gdk-pixbuf-2.26.5/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gdk-pixbuf-2.26.5.orig/configure.ac	2013-03-26 15:45:16.594820303 +0=
000
> -+++ gdk-pixbuf-2.26.5/configure.ac	2013-04-13 10:15:19.241433789 +0000
> -@@ -588,7 +588,7 @@
> -=20
> - dnl Test for libpng
> -   if test x$with_libpng !=3D xno && test -z "$LIBPNG"; then
> --    for l in libpng15 libpng14 libpng12 libpng13 libpng10 libpng ; do
> -+    for l in libpng libpng15 libpng14 libpng12 libpng13 libpng10 ; do
> -       AC_MSG_CHECKING(for $l)
> -       if $PKG_CONFIG --exists $l ; then
> -         AC_MSG_RESULT(yes)
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/configure_fi=
x.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/configure_fix.patch
> similarity index 100%
> rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/configure_fix=
=2Epatch
> rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/configure_fix.patch
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/extending-li=
binstall-dependencies.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/exte=
nding-libinstall-dependencies.patch
> similarity index 100%
> rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/extending-lib=
install-dependencies.patch
> rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/extending-libinstall-d=
ependencies.patch
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/hardcoded_li=
btool.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/hardcoded_libtool.pa=
tch
> similarity index 100%
> rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/hardcoded_lib=
tool.patch
> rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/hardcoded_libtool.patch
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb b/meta/re=
cipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.1.bb
> similarity index 89%
> rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
> rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.1.bb
> index b85bbaf..4bf2eb6 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.1.bb
> @@ -11,17 +11,16 @@ SECTION =3D "libs"
>  DEPENDS =3D "libpng glib-2.0 jpeg"
>  DEPENDS_append_linuxstdbase =3D " virtual/libx11"
> =20
> -SRC_URI =3D "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.26/gdk=
-pixbuf-${PV}.tar.xz \
> +MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"

Just for sake of consistency, in many recipes this variable is called
SHRT_VER.

> +SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \

                                                ^ why not ${BP}?

>             file://hardcoded_libtool.patch \
>             file://configure_fix.patch \
>             file://extending-libinstall-dependencies.patch \
> -           file://pngversion.patch \
>             "
> =20
> -SRC_URI[md5sum] =3D "339329e6d619ee3e1cb93979111b04c0"
> -SRC_URI[sha256sum] =3D "77696fd163bca95a130a1883dbd78d0ae4d782de2fc85a9a=
38556d13681f5c84"
> -
> -PR =3D "r1"
> +SRC_URI[md5sum] =3D "5c71cce316d08c559fc5970aa60754ab"
> +SRC_URI[sha256sum] =3D "bea0b743fdb5c3c8e23210f73623ec5f18f9ead252294289=
7fe739d80b50c2bb"
> =20
>  inherit autotools pkgconfig gettext pixbufcache
> =20
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGnW98ACgkQN1Ujt2V2gByvIQCgp4yH5VhC6fZeOFhSFxNw4fWs
ib4AnR2D+iLq177aTFsQKEkexGqZsxyU
=D+Ru
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--
