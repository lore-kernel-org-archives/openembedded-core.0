Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5F5C54EBD
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 14:57:58 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.57313.1673535471572569478
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jan 2023 06:57:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=X/9XFUHA;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1673535472;
  x=1705071472;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=PBdoUIejfS8H6cUkt7cosbPORappqXosOPzdc8vS9lY=;
  b=X/9XFUHAJ2UK8/NKCZhrUcFoMxqsw0k8o/tWPt6zrk2v4wwfDnHG8BCK
   PUh+3z+Wb+8kGwAWJvnUJH+F9fvI0f3rD7bbbBxeKpKPnCRYpGfP5VBjh
   a75gMM/9wStwSLRQ1Z8/8cSDBe1NIgQ+ptsomLIuJZn1/w2hc6XdVieeL
   ocMmOuHAodNyfNoR0TOD5EgtCJ0Ul9TtrCEP/9aBvttO0aNGEd9AcLewk
   x9TFtnuO22LN4lgkJg/lrFDGa1jgpvGMtEFFSHIDDOZqNQ6aptPJRc0J0
   iuTnOEpNss7JMWFkIDgP9Qly2C+CpKE8djlJ3CbPMq5NXS2octEEPY3g3
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] recipes, classes: Avoid adding extra whitespace
 to PACKAGESPLITFUNCS
Thread-Topic: [OE-core] [PATCH] recipes, classes: Avoid adding extra
 whitespace to PACKAGESPLITFUNCS
Thread-Index: AQHZIUmGZUKePJ0fgk22qoPosK0cOq6a6dGQ
Date: Thu, 12 Jan 2023 14:57:48 +0000
Message-ID: <5cbe7b87dc2345daad1cc4cdd5bcece8@axis.com>
References: <173785AB93CB2417.1583@lists.openembedded.org>
In-Reply-To: <173785AB93CB2417.1583@lists.openembedded.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 14:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175798

*ping*

//Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 5 januari 2023 22:06
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] recipes, classes: Avoid adding extra whitespac=
e
> to PACKAGESPLITFUNCS
>=20
> This is a follow-up to commit 846ff49465 to remove the extra whitespace
> that is no longer needed after converting :append and :prepend to +=3D an=
d
> =3D+.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/classes-recipe/kernel-module-split.bbclass               | 2 +-
>  meta/classes-recipe/kernel.bbclass                            | 2 +-
>  meta/classes-recipe/systemd.bbclass                           | 2 +-
>  meta/classes-recipe/update-alternatives.bbclass               | 2 +-
>  meta/classes-recipe/update-rc.d.bbclass                       | 4 ++--
>  .../wpa-supplicant/wpa-supplicant_2.10.bb                     | 2 +-
>  meta/recipes-devtools/perl/perl_5.36.0.bb                     | 2 +-
>  meta/recipes-graphics/mesa/mesa.inc                           | 2 +-
>  .../gstreamer/gstreamer1.0-plugins-license.inc                | 2 +-
>  .../gstreamer/gstreamer1.0-plugins-packaging.inc              | 4 ++--
>  meta/recipes-support/libevent/libevent_2.1.12.bb              | 2 +-
>  11 files changed, 13 insertions(+), 13 deletions(-)
>=20
> diff --git a/meta/classes-recipe/kernel-module-split.bbclass
> b/meta/classes-recipe/kernel-module-split.bbclass
> index 4943717487..50882c31a7 100644
> --- a/meta/classes-recipe/kernel-module-split.bbclass
> +++ b/meta/classes-recipe/kernel-module-split.bbclass
> @@ -35,7 +35,7 @@ do_install:append() {
>  }
>=20
>  KERNEL_SPLIT_MODULES ?=3D "1"
> -PACKAGESPLITFUNCS =3D+ "split_kernel_module_packages "
> +PACKAGESPLITFUNCS =3D+ "split_kernel_module_packages"
>=20
>  KERNEL_MODULES_META_PACKAGE ?=3D "${@ d.getVar("KERNEL_PACKAGE_NAME") or
> "kernel" }-modules"
>=20
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-
> recipe/kernel.bbclass
> index c36632b0a7..bd3b6471c6 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -705,7 +705,7 @@ pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {
>  	fi
>  }
>=20
> -PACKAGESPLITFUNCS =3D+ "split_kernel_packages "
> +PACKAGESPLITFUNCS =3D+ "split_kernel_packages"
>=20
>  python split_kernel_packages () {
>      do_split_packages(d, root=3D'${nonarch_base_libdir}/firmware',
> file_regex=3Dr'^(.*)\.(bin|fw|cis|csp|dsp)$',
> output_pattern=3D'${KERNEL_PACKAGE_NAME}-firmware-%s', description=3D'Fir=
mware
> for %s', recursive=3DTrue, extra_depends=3D'')
> diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-
> recipe/systemd.bbclass
> index ae98043d29..f9c92e6c2a 100644
> --- a/meta/classes-recipe/systemd.bbclass
> +++ b/meta/classes-recipe/systemd.bbclass
> @@ -205,7 +205,7 @@ python systemd_populate_packages() {
>          systemd_check_services()
>  }
>=20
> -PACKAGESPLITFUNCS =3D+ "systemd_populate_packages "
> +PACKAGESPLITFUNCS =3D+ "systemd_populate_packages"
>=20
>  python rm_systemd_unitdir (){
>      import shutil
> diff --git a/meta/classes-recipe/update-alternatives.bbclass
> b/meta/classes-recipe/update-alternatives.bbclass
> index ec81763c89..55e0b954d6 100644
> --- a/meta/classes-recipe/update-alternatives.bbclass
> +++ b/meta/classes-recipe/update-alternatives.bbclass
> @@ -265,7 +265,7 @@ def update_alternatives_alt_targets(d, pkg):
>=20
>      return updates
>=20
> -PACKAGESPLITFUNCS =3D+ "populate_packages_updatealternatives "
> +PACKAGESPLITFUNCS =3D+ "populate_packages_updatealternatives"
>=20
>  python populate_packages_updatealternatives () {
>      if not update_alternatives_enabled(d):
> diff --git a/meta/classes-recipe/update-rc.d.bbclass b/meta/classes-
> recipe/update-rc.d.bbclass
> index a61d2c62ab..a19e704741 100644
> --- a/meta/classes-recipe/update-rc.d.bbclass
> +++ b/meta/classes-recipe/update-rc.d.bbclass
> @@ -68,8 +68,8 @@ python __anonymous() {
>      update_rc_after_parse(d)
>  }
>=20
> -PACKAGESPLITFUNCS =3D+ "${@bb.utils.contains('DISTRO_FEATURES', 'sysvini=
t',
> 'populate_packages_updatercd ', '', d)}"
> -PACKAGESPLITFUNCS:remove:class-nativesdk =3D "populate_packages_updaterc=
d "
> +PACKAGESPLITFUNCS =3D+ "${@bb.utils.contains('DISTRO_FEATURES', 'sysvini=
t',
> 'populate_packages_updatercd', '', d)}"
> +PACKAGESPLITFUNCS:remove:class-nativesdk =3D "populate_packages_updaterc=
d"
>=20
>  populate_packages_updatercd[vardeps] +=3D "updatercd_prerm updatercd_pos=
trm
> updatercd_postinst"
>  populate_packages_updatercd[vardepsexclude] +=3D "OVERRIDES"
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-
> supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-
> supplicant_2.10.bb
> index 254cfd3f0c..46604045da 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
> @@ -134,4 +134,4 @@ python split_wpa_supplicant_libs () {
>          d.setVar('RRECOMMENDS:' + pn + '-plugins', '
> '.join(split_packages))
>          d.appendVar('RRECOMMENDS:' + pn + '-dbg', ' ' + '
> '.join(split_dbg_packages))
>  }
> -PACKAGESPLITFUNCS +=3D "split_wpa_supplicant_libs "
> +PACKAGESPLITFUNCS +=3D "split_wpa_supplicant_libs"
> diff --git a/meta/recipes-devtools/perl/perl_5.36.0.bb b/meta/recipes-
> devtools/perl/perl_5.36.0.bb
> index 3458e6a5b0..4d8a919d1e 100644
> --- a/meta/recipes-devtools/perl/perl_5.36.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.36.0.bb
> @@ -302,7 +302,7 @@ ALTERNATIVE_LINK_NAME[Thread.3] =3D
> "${mandir}/man3/Thread.3"
>  ALLOW_EMPTY:${PN}-modules =3D "1"
>  PACKAGES +=3D "${PN}-modules "
>=20
> -PACKAGESPLITFUNCS =3D+ "split_perl_packages "
> +PACKAGESPLITFUNCS =3D+ "split_perl_packages"
>=20
>  python split_perl_packages () {
>      libdir =3D d.expand('${libdir}/perl5/${PV}')
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-
> graphics/mesa/mesa.inc
> index 2535dd403d..77aa97069a 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -291,7 +291,7 @@ python mesa_populate_packages() {
>      do_split_packages(d, pipe_drivers_root, r'^pipe_(.*)\.so$', 'mesa-
> driver-pipe-%s', 'Mesa %s pipe driver', extra_depends=3D'')
>  }
>=20
> -PACKAGESPLITFUNCS =3D+ "mesa_populate_packages "
> +PACKAGESPLITFUNCS =3D+ "mesa_populate_packages"
>=20
>  PACKAGES_DYNAMIC +=3D "^mesa-driver-.*"
>  PACKAGES_DYNAMIC:class-native =3D "^mesa-driver-.*-native"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> license.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> license.inc
> index 03595e7d32..8b1c001111 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-license.inc
> @@ -1,7 +1,7 @@
>  # This .inc file contains functionality for automatically setting
>  # the the license of all plugins according to the GSTREAMER_GPL.
>=20
> -PACKAGESPLITFUNCS +=3D " set_gstreamer_license "
> +PACKAGESPLITFUNCS +=3D "set_gstreamer_license"
>=20
>  python set_gstreamer_license () {
>      import oe.utils
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> packaging.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> packaging.inc
> index 837d5a1a62..d77aeed8a2 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.in=
c
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.in=
c
> @@ -9,8 +9,8 @@
>  # Dynamically generate packages for all enabled plugins
>  PACKAGES_DYNAMIC =3D "^${PN}-.* ^libgst.*"
>=20
> -PACKAGESPLITFUNCS =3D+ " split_gstreamer10_packages "
> -PACKAGESPLITFUNCS +=3D " set_gstreamer10_metapkg_rdepends "
> +PACKAGESPLITFUNCS =3D+ "split_gstreamer10_packages"
> +PACKAGESPLITFUNCS +=3D "set_gstreamer10_metapkg_rdepends"
>=20
>  python split_gstreamer10_packages () {
>      gst_libdir =3D d.expand('${libdir}/gstreamer-1.0')
> diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb
> b/meta/recipes-support/libevent/libevent_2.1.12.bb
> index 88b81fd56e..25388fb4d7 100644
> --- a/meta/recipes-support/libevent/libevent_2.1.12.bb
> +++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
> @@ -41,7 +41,7 @@ PACKAGES_DYNAMIC =3D "^${PN}-.*$"
>  python split_libevent_libs () {
>      do_split_packages(d, '${libdir}', r'^libevent_([a-z]*)-.*\.so\..*',
> '${PN}-%s', '${SUMMARY} (%s)', prepend=3DTrue, allow_links=3DTrue)
>  }
> -PACKAGESPLITFUNCS =3D+ "split_libevent_libs "
> +PACKAGESPLITFUNCS =3D+ "split_libevent_libs"
>=20
>  BBCLASSEXTEND =3D "native nativesdk"
>=20

