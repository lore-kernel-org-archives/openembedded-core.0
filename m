Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web08.8870.1620711722711908599
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 22:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.178.231, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpclient.apple (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 95801100006
	for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 05:41:59 +0000 (UTC)
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [OE-core] [PATCH] epiphany: Update to 40.1
Date: Mon, 10 May 2021 22:41:57 -0700
References: <167DEA4DF9A844FE.28983@lists.openembedded.org>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
In-Reply-To: <167DEA4DF9A844FE.28983@lists.openembedded.org>
Message-Id: <CA7A3388-74FA-440E-A6C1-56F67D130427@redrectangle.org>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Forgot the Signed-off-by, sent a v2.

Thanks,
Robert

> On May 10, 2021, at 9:57 PM, Robert Joslyn <robert.joslyn@redrectangle.o=
rg> wrote:
>=20
> Refresh patch and adjust version directory for new version numbering
> scheme. Add new dependency on libarchive.
> ---
> .../epiphany/{epiphany_3.38.3.bb =3D> epiphany_40.1.bb}     | 7 ++++---
> .../0002-help-meson.build-disable-the-use-of-yelp.patch   | 8 ++++----
> 2 files changed, 8 insertions(+), 7 deletions(-)
> rename meta/recipes-gnome/epiphany/{epiphany_3.38.3.bb =3D> epiphany_40.=
1.bb} (82%)
>=20
> diff --git a/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb b/meta/recip=
es-gnome/epiphany/epiphany_40.1.bb
> similarity index 82%
> rename from meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
> rename to meta/recipes-gnome/epiphany/epiphany_40.1.bb
> index ce24336ace..e1e3ad7868 100644
> --- a/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
> +++ b/meta/recipes-gnome/epiphany/epiphany_40.1.bb
> @@ -8,18 +8,19 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb67=
3463ab874e80d47fae504"
>=20
> DEPENDS =3D "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr g=
nutls \
> =09   gsettings-desktop-schemas libxml2-native \
> -	   glib-2.0 glib-2.0-native json-glib libdazzle libhandy libportal"
> +	   glib-2.0 glib-2.0-native json-glib libdazzle libhandy libportal \
> +	   libarchive"
>=20
> GNOMEBASEBUILDCLASS =3D "meson"
> inherit gnomebase gsettings features_check upstream-version-is-even gett=
ext mime-xdg
> REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
>=20
> -SRC_URI =3D "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNO=
MEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=3Darchive \
> +SRC_URI =3D "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}=
", 1)}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=3Darchive \
>            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
>            file://migrator.patch \
>            file://distributor.patch \
>            "
> -SRC_URI[archive.sha256sum] =3D "ce62c1fa3e442a9d6131fc884a6bc9a65cf0622=
4c30d649c49624c2ebcb0d275"
> +SRC_URI[archive.sha256sum] =3D "696a426b1702774af8d0f056828f5d9ff935050=
7aba7f4c7e3e499f07a581ad0"
>=20
> # Developer mode enables debugging
> PACKAGECONFIG[developer-mode] =3D "-Ddeveloper_mode=3Dtrue,-Ddeveloper_m=
ode=3Dfalse"
> diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-dis=
able-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-me=
son.build-disable-the-use-of-yelp.patch
> index 118b5d1825..a6c4f92c86 100644
> --- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-th=
e-use-of-yelp.patch
> +++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-th=
e-use-of-yelp.patch
> @@ -1,4 +1,4 @@
> -From 3725c254f1d1d8204fa299e71c1e2bfd0ff6a634 Mon Sep 17 00:00:00 2001
> +From 77c9f87dc2b3ad0854a678e234e22dfb31902b82 Mon Sep 17 00:00:00 2001
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Date: Wed, 31 Jan 2018 15:50:38 +0200
> Subject: [PATCH] help/meson.build: disable the use of yelp
> @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail=
.com>
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/help/meson.build b/help/meson.build
> -index 484860c..d9b2e80 100644
> +index ff324dd..f5e421d 100644
> --- a/help/meson.build
> +++ b/help/meson.build
> -@@ -32,7 +32,7 @@ help_media =3D [
> -   'media/epiphany-private-3-36.png'
> +@@ -31,7 +31,7 @@ help_media =3D [
> +   'media/org.gnome.Epiphany.svg'
>  ]
>=20
> -gnome.yelp(meson.project_name(),
> --=20
> 2.26.3
>=20
>=20
>=20
>=20

