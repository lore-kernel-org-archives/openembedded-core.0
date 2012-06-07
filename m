Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ScZE4-0003lZ-Iq
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 11:41:56 +0200
Received: by bkcjm2 with SMTP id jm2so300061bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2012 02:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LNRV2UY91083fs1EV+uK2xYVqX+FR5NHPNHLJSOJSCM=;
	b=n46kyJDQ61g9lFm3cjmLRkcaQaB/LeqAv7vryVEuLrTO9Xmxqv/IWzACnTKZQQvQIL
	KyG1vpGioUeDlC/88W2z0GFSlQ/BE1gWkEZl/OC0bVpVX2nyiiLCo5a09/ekK1DrJBKa
	Z5EyEshzVJf9RoCOGBy6sSjNiDOWnXqD3amDu3aqMZzyFui0VtAObMpHyt/LTjzQMgjo
	d3pybil/Dgg+UCeATunMMdAQ8htovCoowE3u2Gi2wysoGc/AMLWBGnd84ksk0js6Ug8T
	PnfvAV3W3WPyF29c43cChj9njlKhHbkTyLa6R9W4OV1PTbwnyTdKAp01LUyJlUKW/s8o
	oHpA==
Received: by 10.204.150.76 with SMTP id x12mr869613bkv.97.1339061488330;
	Thu, 07 Jun 2012 02:31:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gm18sm2856369bkc.7.2012.06.07.02.31.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jun 2012 02:31:27 -0700 (PDT)
Date: Thu, 7 Jun 2012 11:31:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120607093144.GF3140@jama.jama.net>
References: <cover.1339051007.git.liezhi.yang@windriver.com>
	<5f256583bca8c2d4225c379cc9b7ca23f374dcdc.1339051007.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5f256583bca8c2d4225c379cc9b7ca23f374dcdc.1339051007.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] opkg 0.1.8: do_fetch failed since no checksum specified
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
X-List-Received-Date: Thu, 07 Jun 2012 09:41:56 -0000
X-Groupsio-MsgNum: 23232
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SxgehGEc6vB0cZwN"
Content-Disposition: inline

--SxgehGEc6vB0cZwN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 07, 2012 at 05:24:39PM +0800, Robert Yang wrote:
> * We use meta/recipes-devtools/opkg/opkg_svn.bb by default, the
>   opkg_0.1.8.bb failed since no checksum specified.
>=20
> * The add_vercmp.patch in both opkg/ and opkg-0.1.8/, remove the one
>   in opkg-0.1.8/
>=20
> This patch doesn't impact the output, so I think that we don't have to
> increment the PR.
>=20
> [YOCTO #2498]
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../opkg/opkg-0.1.8/add_vercmp.patch               |   36 --------------=
------
>  meta/recipes-devtools/opkg/opkg_0.1.8.bb           |    5 ++-
>  2 files changed, 4 insertions(+), 37 deletions(-)
>  delete mode 100644 meta/recipes-devtools/opkg/opkg-0.1.8/add_vercmp.patch
>=20
> diff --git a/meta/recipes-devtools/opkg/opkg-0.1.8/add_vercmp.patch b/met=
a/recipes-devtools/opkg/opkg-0.1.8/add_vercmp.patch
> deleted file mode 100644
> index c3396d5..0000000
> --- a/meta/recipes-devtools/opkg/opkg-0.1.8/add_vercmp.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -Upstream-Status: Inappropriate [other]
> -
> -Index: trunk/libopkg/opkg.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- trunk.orig/libopkg/opkg.c	2010-01-26 20:32:19.000000000 +0000
> -+++ trunk/libopkg/opkg.c	2010-01-26 20:40:34.000000000 +0000
> -@@ -876,3 +876,18 @@
> -=20
> - 	return ret;
> - }
> -+
> -+int
> -+opkg_compare_versions (const char *ver1, const char *ver2)
> -+{
> -+  pkg_t *pkg1, *pkg2;
> -+
> -+  pkg1 =3D pkg_new();
> -+  pkg2 =3D pkg_new();
> -+
> -+  parse_version(pkg1, ver1);
> -+  parse_version(pkg2, ver2);
> -+
> -+  return pkg_compare_versions(pkg1, pkg2);
> -+}
> -+
> -Index: trunk/libopkg/opkg.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- trunk.orig/libopkg/opkg.h	2010-01-26 20:32:19.000000000 +0000
> -+++ trunk/libopkg/opkg.h	2010-01-26 20:35:19.000000000 +0000
> -@@ -58,4 +58,6 @@
> -=20
> - int opkg_repository_accessibility_check(void);
> -=20
> -+int opkg_compare_versions (const char *ver1, const char *ver2);
> -+
> - #endif /* OPKG_H */
> diff --git a/meta/recipes-devtools/opkg/opkg_0.1.8.bb b/meta/recipes-devt=
ools/opkg/opkg_0.1.8.bb
> index c206b37..785b6ca 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.1.8.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.1.8.bb
> @@ -1,8 +1,11 @@
>  require opkg.inc
> =20
>  SRC_URI =3D "http://opkg.googlecode.com/files/opkg-${PV}.tar.gz \
> -           file://add_vercmp.patch \
> +           file://opkg/add_vercmp.patch \

is this "opkg/" really needed?

>             file://headerfix.patch \
>            "
> =20
> +SRC_URI[md5sum] =3D "c714ce0e4863bf1315e3b6913ffe3299"
> +SRC_URI[sha256sum] =3D "ff94bf30bd662d49c4b5057e3a0818d062731adaa555d59a=
bd677ec32a3c1c60"
> +
>  PR =3D "${INC_PR}.0"
> --=20
> 1.7.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SxgehGEc6vB0cZwN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/QdQAACgkQN1Ujt2V2gBy67wCfVmoRcIyroiKW2K64JNCuTQce
SqgAoJejL2EbZOXEIZ5YZ9ipIGTYtAUB
=Q+MG
-----END PGP SIGNATURE-----

--SxgehGEc6vB0cZwN--
