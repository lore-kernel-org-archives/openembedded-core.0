Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id DB0866E660
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 20:11:44 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l68so24696340wml.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 13:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=yGpi9l9u1L/C7O0JsDK/4IDtEaWYJmocmEXLi+wdSHE=;
	b=JHsPQZ/vWRaBC3o1gsYJ4esDvQBxr6NAe2pYyzoH3V11+Pq/ERBJH4W/CPKUok1hM9
	2biGvvmsko6YMv9DOvTG7y0aT6l9orb/KH+6Xr7X1km6AkkjD6uPm00pCdDWEE/c10S9
	OnEIPu43vt0tH5/KPAZYKy5Cz/Du4NByz6uXSck1z8zczNELuniOxXwO/uWx/p1Yzvji
	ujAJdt2LvXg9WQWcM6Rjntx+YShagOvc91+jyXCZ4evSV27a9sJgy6ouaaF5SR19ZhCq
	x0NYOHLeswwZhBm3CagnD4DwjCk+uzd1fGQSx+hfgq+YlEwxW0H1jlYhplMZp+6zzi0O
	35vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=yGpi9l9u1L/C7O0JsDK/4IDtEaWYJmocmEXLi+wdSHE=;
	b=UWSdZZE6IroSjjFJMZPpe7YOiCd8wsB7GpyfPqeFlr4HyL2t7WGqqTQGKITNo3yrBu
	GWlrUfQ2cNrd6QjzcyQ0tOWaIJKfPuhTo/0mJ/zch6x+RYy916yrqk7eO6EilSKs3UoH
	FJed096w9ImqQBhvcF2CK6bR8yUZo92S3dQQH6d6XzhUGEGgzV1PxtsQC7e4rmSKKQ4M
	q6gG75LcCcoXVGLbh6OEXql/OfdIbBxJgW+G1zeQH/kGAaLR0hUUYO+NRGMCZbCY/v57
	8AUsvjmL2Nh5TyYSn8JPfXXzfnh3MHJgzIVggOpseSm1cSSX2bbMnQWbxs3OqktTOAoC
	LiTg==
X-Gm-Message-State: AD7BkJKOFD+m2lPansFjChzCxTDDJlv7dfTyH0pEeHbzUA18iHCjMrPxzYOeGW53JY76Yg==
X-Received: by 10.194.60.145 with SMTP id h17mr34656109wjr.47.1458591105114;
	Mon, 21 Mar 2016 13:11:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	y72sm14033851wmh.21.2016.03.21.13.11.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Mar 2016 13:11:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 21 Mar 2016 21:16:01 +0100
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Message-ID: <20160321201601.GE2562@jama>
References: <cover.1458582024.git.jussi.kukkonen@intel.com>
	<7fc053339242682df1f66a07c0f481acb3313daf.1458582024.git.jussi.kukkonen@intel.com>
MIME-Version: 1.0
In-Reply-To: <7fc053339242682df1f66a07c0f481acb3313daf.1458582024.git.jussi.kukkonen@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] gio-module-cache: Add class for Gio modules
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
X-List-Received-Date: Mon, 21 Mar 2016 20:11:47 -0000
X-Groupsio-MsgNum: 79892
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C94crkcyjafcjHxo"
Content-Disposition: inline

--C94crkcyjafcjHxo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 21, 2016 at 08:29:33PM +0200, Jussi Kukkonen wrote:
> The new class uses gio-querymodules tool on postinst and postrm:
> this regenerates the module cache which is useful to avoid loading
> modules that are not neededi at runtime. If a Gio module is not
> listed in the cache file it will always get loaded.
>=20
> * Add a postinst-intercept 'gio-module-cache': it runs
>   gio-querymodules using qemuwrapper. This is required because the tool
>   actually loads the modules to generate the cache.
> * Add a gio-module-cache class that adds postinstall and postrm
>   scripts. In the sysroot population case use the new intercept.
> * Inherit the new class in glib-2.0, glib-networking and gconf.
>=20
> Fixes [YOCTO #9241].
>=20
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta/classes/gio-module-cache.bbclass              | 36 ++++++++++++++++=
++++++
>  meta/recipes-core/glib-2.0/glib.inc                |  2 +-
>  .../glib-networking/glib-networking_2.46.1.bb      |  2 +-
>  meta/recipes-gnome/gnome/gconf_3.2.6.bb            |  2 +-
>  .../postinst-intercepts/update_gio_module_cache    |  7 +++++
>  5 files changed, 46 insertions(+), 3 deletions(-)
>  create mode 100644 meta/classes/gio-module-cache.bbclass
>  create mode 100644 scripts/postinst-intercepts/update_gio_module_cache
>=20
> diff --git a/meta/classes/gio-module-cache.bbclass b/meta/classes/gio-mod=
ule-cache.bbclass
> new file mode 100644
> index 0000000..4d59f5c
> --- /dev/null
> +++ b/meta/classes/gio-module-cache.bbclass
> @@ -0,0 +1,36 @@
> +DEPENDS +=3D "qemu-native"
> +inherit qemu
> +
> +GIO_MODULE_PACKAGES ??=3D "${PN}"
> +
> +gio_module_cache_common() {
> +if [ "x$D" !=3D "x" ]; then
> +	$INTERCEPT_DIR/postinst_intercept update_gio_module_cache ${PKG} \
> +		mlprefix=3D${MLPREFIX} \
> +		libdir=3D${libdir} \
> +                base_libdir=3D${base_libdir} \
> +                bindir=3D${bindir}
> +else
> +        gio-querymodules ${libdir}/gio/modules/
> +fi

Don't mix tabs and spaces.

> +}
> +
> +python populate_packages_append () {
> +    packages =3D d.getVar('GIO_MODULE_PACKAGES', True).split()
> +
> +    for pkg in packages:
> +        bb.note("adding gio-module-cache postinst and postrm scripts to =
%s" % pkg)
> +
> +        postinst =3D d.getVar('pkg_postinst_%s' % pkg, True)
> +        if not postinst:
> +            postinst =3D '#!/bin/sh\n'
> +        postinst +=3D d.getVar('gio_module_cache_common', True)
> +        d.setVar('pkg_postinst_%s' % pkg, postinst)
> +
> +        postrm =3D d.getVar('pkg_postrm_%s' % pkg, True)
> +        if not postrm:
> +            postrm =3D '#!/bin/sh\n'
> +        postrm +=3D d.getVar('gio_module_cache_common', True)
> +        d.setVar('pkg_postrm_%s' % pkg, postrm)
> +}
> +
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
> index c0f9e0d..baba7e5 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -27,7 +27,7 @@ PACKAGES +=3D "${PN}-utils ${PN}-codegen"
>  LEAD_SONAME =3D "libglib-2.0.*"
>  FILES_${PN}-utils =3D "${bindir}/* ${datadir}/glib-2.0/gettext"
> =20
> -inherit autotools gettext gtk-doc pkgconfig ptest-gnome upstream-version=
-is-even bash-completion
> +inherit autotools gettext gtk-doc pkgconfig ptest-gnome upstream-version=
-is-even bash-completion gio-module-cache
> =20
>  S =3D "${WORKDIR}/glib-${PV}"
> =20
> diff --git a/meta/recipes-core/glib-networking/glib-networking_2.46.1.bb =
b/meta/recipes-core/glib-networking/glib-networking_2.46.1.bb
> index 70be87c..749ac98 100644
> --- a/meta/recipes-core/glib-networking/glib-networking_2.46.1.bb
> +++ b/meta/recipes-core/glib-networking/glib-networking_2.46.1.bb
> @@ -22,7 +22,7 @@ PACKAGECONFIG[pkcs11] =3D "--with-pkcs11,--without-pkcs=
11,p11-kit"
> =20
>  EXTRA_OECONF =3D "--without-gnome-proxy"
> =20
> -inherit gnomebase gettext upstream-version-is-even
> +inherit gnomebase gettext upstream-version-is-even gio-module-cache
> =20
>  FILES_${PN} +=3D "${libdir}/gio/modules/libgio*.so ${datadir}/dbus-1/ser=
vices/"
>  FILES_${PN}-dev +=3D "${libdir}/gio/modules/libgio*.la"
> diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome=
/gnome/gconf_3.2.6.bb
> index feaf080..e3af3d0 100644
> --- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
> +++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b=
5b66355690e9abc605"
> =20
>  DEPENDS =3D "glib-2.0 dbus dbus-glib libxml2 intltool-native"
> =20
> -inherit gnomebase gtk-doc gettext gobject-introspection
> +inherit gnomebase gtk-doc gettext gobject-introspection gio-module-cache
> =20
>  SRC_URI =3D "${GNOME_MIRROR}/GConf/${@gnome_verdir("${PV}")}/GConf-${PV}=
=2Etar.xz;name=3Darchive \
>             file://remove_plus_from_invalid_characters_list.patch \
> diff --git a/scripts/postinst-intercepts/update_gio_module_cache b/script=
s/postinst-intercepts/update_gio_module_cache
> new file mode 100644
> index 0000000..c1b6d66
> --- /dev/null
> +++ b/scripts/postinst-intercepts/update_gio_module_cache
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +
> +set -e
> +
> +PSEUDO_UNLOAD=3D1 qemuwrapper -L $D -E LD_LIBRARY_PATH=3D$D/${libdir}:$D=
/${base_libdir} \
> +        $D${bindir}/gio-querymodules $D${libdir}/gio/modules/
> +
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--C94crkcyjafcjHxo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbwVoAACgkQN1Ujt2V2gBxYawCfUF39VzoYirkSX4rr3kr5U2Wg
GkkAoLieRdWzD+6hcEsQmrLT9gPoHfdG
=ZUKS
-----END PGP SIGNATURE-----

--C94crkcyjafcjHxo--
