Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6D5336B368
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 23:22:11 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id d10so573814eaj.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 16:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qrtn6XwZjgXdy3fOSpnAcHXTv6224jrgXHZXQ9OH7p4=;
	b=JLctNwRDL4YScPPN43HEpNGkhnnslHHJzCki+NCUxr6r17QOKprGxBZGkt3B8Pv13l
	3g+caEZJflf5tzdVxZkbeTqbNJh0DMetfCyfdYlvZe+nYyTiIUkC7rRj51htZFV+Txzk
	R7g73RKE0bVjFuT4mwv5sthIqIalNIBacfNEY3EcJJPgx2OA0ILB8vWpr4EjsWMNRr3I
	ntAoQaBU9BZLz8jBrZbuCdfdaWXTrGrvHpkvdRzaRKZfwPOHkdrXfRis2Pw/UQ60MqQG
	tZmXWHfI6bTYJlGYaZ21SVn97POgrMeLpg5hP59kcqDIVBUhlpeBwIjw3pgO32XPwC40
	u8Iw==
X-Received: by 10.15.94.201 with SMTP id bb49mr13589102eeb.23.1377127330697;
	Wed, 21 Aug 2013 16:22:10 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	x47sm13320078eea.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 21 Aug 2013 16:22:10 -0700 (PDT)
Date: Thu, 22 Aug 2013 01:23:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130821232315.GH522@jama>
References: <1377126875-9856-1-git-send-email-sgw@linux.intel.com>
	<1377126875-9856-2-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1377126875-9856-2-git-send-email-sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] libx11: upgrade to 1.6.1
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
X-List-Received-Date: Wed, 21 Aug 2013 23:22:12 -0000
X-Groupsio-MsgNum: 43675
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y0Ed1hDcWxc3B7cn"
Content-Disposition: inline

--y0Ed1hDcWxc3B7cn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2013 at 04:14:32PM -0700, Saul Wold wrote:
> From: Kai Kang <kai.kang@windriver.com>
>=20
> Upgrade libx11 to version 1.6.1.
>=20
> Update:
> * Remove PR and INC_PR.

FWIW: if someone was using this libx11.inc in his layer e.g. to provide
different version or another libx11 variant, removing INC_PR can cause
issues, but I don't have such recipe in my layers and having INC_PR in
=2Einc without including it in PR in recipes is a bit confusing, so it's
fine with me.

> * File Xcms.txt position changes.
> * Drop backport patch keysymdef_include.patch.
> * Update disable_tests.patch.
>=20
> [YOCTO #4973]
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>=20
> [sgw - Removed PR and INC_PR]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-graphics/xorg-lib/libx11.inc                 |  3 +--
>  meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch |  9 +++++++--
>  meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb            | 13 ---------=
----
>  meta/recipes-graphics/xorg-lib/libx11_1.6.1.bb            | 10 ++++++++++
>  4 files changed, 18 insertions(+), 17 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.1.bb
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-gra=
phics/xorg-lib/libx11.inc
> index b4eb7d8..e07d42d 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11.inc
> +++ b/meta/recipes-graphics/xorg-lib/libx11.inc
> @@ -11,7 +11,6 @@ inherit siteinfo
>  FILESPATH =3D "${FILE_DIRNAME}/libx11"
> =20
>  PE =3D "1"
> -INC_PR =3D "r10"
> =20
>  PROVIDES =3D "virtual/libx11"
> =20
> @@ -33,7 +32,7 @@ CPPFLAGS_FOR_BUILD +=3D "-D_GNU_SOURCE"
> =20
>  PACKAGES =3D+ "${PN}-xcb"
> =20
> -FILES_${PN} +=3D "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${lib=
dir}/X11/Xcms.txt"
> +FILES_${PN} +=3D "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${dat=
adir}/X11/Xcms.txt"
>  FILES_${PN}-xcb +=3D "${libdir}/libX11-xcb.so.*"
>  FILES_${PN}-locale +=3D "${datadir}/X11/locale ${libdir}/X11/locale"
> =20
> diff --git a/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch b/=
meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
> index c570e45..c1b6cde 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
> +++ b/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
> @@ -1,6 +1,11 @@
>  Upstream-Status: Inappropriate [disable feature]
> =20
>  Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> +
> +Update for 1.6.1
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
>  diff -Nurd libX11-1.5.0/nls/Makefile.am libX11-1.5.0/nls/Makefile.am
>  --- libX11-1.5.0/nls/Makefile.am	2012-06-02 09:37:18.000000000 +0300
>  +++ libX11-1.5.0/nls/Makefile.am	2013-01-02 16:10:24.960156131 +0200
> @@ -9,8 +14,8 @@ diff -Nurd libX11-1.5.0/nls/Makefile.am libX11-1.5.0/nls=
/Makefile.am
>  	cat locale.dir.l2 locale.dir.l1 > locale.dir
> =20
>  -if HAVE_PERL
> --TESTS_ENVIRONMENT =3D $(PERL)
> --TESTS =3D $(srcdir)/compose-check.pl
> +-LOG_COMPILER =3D $(PERL)
> +-TESTS =3D compose-check.pl
>  -endif HAVE_PERL
>  -
> =20
> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb b/meta/recipe=
s-graphics/xorg-lib/libx11_1.5.0.bb
> deleted file mode 100644
> index 7f18824..0000000
> --- a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -require libx11.inc
> -inherit gettext
> -
> -PR =3D "${INC_PR}.3"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> -
> -SRC_URI +=3D "file://keysymdef_include.patch \
> -            file://disable_tests.patch \
> -           "
> -
> -SRC_URI[md5sum] =3D "78b4b3bab4acbdf0abcfca30a8c70cc6"
> -SRC_URI[sha256sum] =3D "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1=
e697f75502bd4d86"
> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.1.bb b/meta/recipe=
s-graphics/xorg-lib/libx11_1.6.1.bb
> new file mode 100644
> index 0000000..b9fb832
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.1.bb
> @@ -0,0 +1,10 @@
> +require libx11.inc
> +inherit gettext
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +SRC_URI +=3D "file://disable_tests.patch \
> +           "
> +
> +SRC_URI[md5sum] =3D "bc5fc459ec25a50c5a7e27035b89e579"
> +SRC_URI[sha256sum] =3D "10a54fc16b58b4f5a5eed4d080c357a82fd2f42d09af625c=
1f5df50650701892"
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--y0Ed1hDcWxc3B7cn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIVS+MACgkQN1Ujt2V2gBxTdgCgi/OntVIJ+AxmJs/4o+gdAFLf
jZIAmwcQ4iK+Vl6tkwqKpyr8/q1GNrpo
=yOqG
-----END PGP SIGNATURE-----

--y0Ed1hDcWxc3B7cn--
