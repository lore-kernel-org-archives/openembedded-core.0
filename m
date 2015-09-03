Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3D1B176F50
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 21:28:21 +0000 (UTC)
Received: by pacwi10 with SMTP id wi10so2049142pac.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 14:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=JsL9nK6Ohqn/LGgvUpJHvlxBlLoSj8sWTJYFnNPEIS8=;
	b=aeOBbXsiqsn85eJ0+w53u3o67HWydEysfGfBgr4NokV69UBebOnK5F+MCJKZpX5xDM
	bYKqYtYZELPTBwJfwhd1myr+EjGExV+7+eM4pNOGhnjPqlQSIbPUzx/cxICi/CloHF52
	xVLctbPB1AYjqMVEgmj9K5MXzEFlrtf4GkwKuUuSk2wyvvn4YOKLhIHMaRHi0Oc0GuOn
	XFIs2/u1iS2pDr6FZzdy3stKgOEzX9i3ZQarWyxdF/e7hGj/B27acTpUchk3lrCyo5PF
	htNylALDnmU2r5rcho9Lt8VV2IfYTbyIpPatJEFgFFGWD+PsZHtOwmwLvws2/d7Nh1Xl
	Eiiw==
X-Received: by 10.68.88.69 with SMTP id be5mr11297pbb.105.1441315702010;
	Thu, 03 Sep 2015 14:28:22 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:5d8c:8e6c:621a:cbb3?
	([2601:646:8601:4580:5d8c:8e6c:621a:cbb3])
	by smtp.gmail.com with ESMTPSA id xf6sm70870pbc.70.2015.09.03.14.28.21
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 03 Sep 2015 14:28:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <f5f4a16fdb097b19fb45e9f667f59f99e9f04ef5.1441293149.git.alexander.kanavin@linux.intel.com>
Date: Thu, 3 Sep 2015 14:28:19 -0700
Message-Id: <B9C7EAB1-4025-474E-8FBB-7DF1BE6C5706@gmail.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
	<cover.1441293149.git.alexander.kanavin@linux.intel.com>
	<f5f4a16fdb097b19fb45e9f667f59f99e9f04ef5.1441293149.git.alexander.kanavin@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/12] gnome-icon-theme: remove the recipe
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
X-List-Received-Date: Thu, 03 Sep 2015 21:28:22 -0000
X-Groupsio-MsgNum: 70614
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FE5F2523-37E8-47E9-B8B6-6C057E7CF4D0";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_FE5F2523-37E8-47E9-B8B6-6C057E7CF4D0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 3, 2015, at 8:34 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> It is not used by anything in oe-core and will be moved to meta-gnome
>=20

OK, please send the patch for meta-gnome as well. So we can merge them =
in more or less in sync

> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
> .../gnome/gnome-icon-theme/pkgconfig-native.patch  | 28 =
----------------------
> .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb | 22 =
-----------------
> 2 files changed, 50 deletions(-)
> delete mode 100644 =
meta/recipes-gnome/gnome/gnome-icon-theme/pkgconfig-native.patch
> delete mode 100644 meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
>=20
> diff --git =
a/meta/recipes-gnome/gnome/gnome-icon-theme/pkgconfig-native.patch =
b/meta/recipes-gnome/gnome/gnome-icon-theme/pkgconfig-native.patch
> deleted file mode 100644
> index 6139eab..0000000
> --- a/meta/recipes-gnome/gnome/gnome-icon-theme/pkgconfig-native.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -icon-naming-utils is a native dependency so we need to use the native =
pkg-config
> -to find it.  Simply perform the old switcheroonie on $PKG_CONFIG so
> -pkg-config-native is used temporarily.
> -
> -Upstream-Status: Inappropriate (OE-specific)
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -diff --git a/configure.ac b/configure.ac
> -index 6074f2c..3d38e49 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -40,6 +40,8 @@ if test "x$enable_mapping" !=3D "xno"; then
> -    UTILS_REQUIRED=3D0.8.7
> -
> -    AC_MSG_CHECKING([icon-naming-utils >=3D $UTILS_REQUIRED])
> -+   save_PKG_CONFIG=3D$PKG_CONFIG
> -+   PKG_CONFIG=3Dpkg-config-native
> -    PKG_CHECK_EXISTS(icon-naming-utils >=3D $UTILS_REQUIRED,
> -                     have_utils=3Dyes, have_utils=3Dno)
> -    if test "x$have_utils" =3D "xyes"; then
> -@@ -51,6 +53,7 @@ if test "x$enable_mapping" !=3D "xno"; then
> -       AC_MSG_ERROR([icon-naming-utils >=3D $UTILS_REQUIRED is =
required to build
> -                     and install gnome-icon-theme])
> -    fi
> -+   PKG_CONFIG=3Dsave_PKG_CONFIG
> - else
> -    ICONMAP=3D"false"
> - fi
> diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb =
b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
> deleted file mode 100644
> index a6a3afa..0000000
> --- a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -SUMMARY =3D "GNOME 2 default icon themes"
> -HOMEPAGE =3D "http://www.gnome.org/"
> -BUGTRACKER =3D "https://bugzilla.gnome.org/"
> -SECTION =3D "x11/gnome"
> -
> -LICENSE =3D "LGPLv3+ | CC-BY-SA-3.0"
> -LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3De7e289d90fc8bdceed5e3f142f98229e"
> -
> -PR =3D "r5"
> -
> -DEPENDS =3D "icon-naming-utils-native intltool-native =
libxml-simple-perl-native"
> -
> -inherit allarch autotools perlnative gtk-icon-cache pkgconfig gettext
> -
> -SRC_URI =3D "${GNOME_MIRROR}/${BPN}/2.31/${BPN}-${PV}.tar.bz2 \
> -           file://pkgconfig-native.patch"
> -
> -SRC_URI[md5sum] =3D "8e727703343d4c18c73c79dd2009f8ed"
> -SRC_URI[sha256sum] =3D =
"ea7e05b77ead159379392b3b275ca0c9cbacd7d936014e447cc7c5e27a767982"
> -
> -FILES_${PN} +=3D "${datadir}/*"
> -RRECOMMENDS_${PN} +=3D "librsvg-gtk"
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_FE5F2523-37E8-47E9-B8B6-6C057E7CF4D0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXou3MACgkQuwUzVZGdMxQRvACfcgBy1yoVgdSmq5iF2tAdVLZh
wy0Anj7Fj5Drv9pQOjsxD2ALDYTg00Z+
=Kw6z
-----END PGP SIGNATURE-----

--Apple-Mail=_FE5F2523-37E8-47E9-B8B6-6C057E7CF4D0--
