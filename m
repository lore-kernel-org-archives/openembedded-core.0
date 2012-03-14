Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S7mgQ-000353-31
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 12:47:58 +0100
Received: by wera1 with SMTP id a1so1555371wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 04:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rmQ1Oyxc1jzY23bwgoFPWIRhh8cbUp0HJ2ffXy2ttyI=;
	b=rtXdAEcP3NKj0pyypzJwJiBlFZ4H5N+GTJjKzJoDc3IQIokAsYjfQD0maJWGJrZcft
	Bg3FMXYqwEDkrvBJss89vnD/GGcU8zx/2T0HuhVPUZbaGODBYy079Fe7BmcggxK8mrIE
	iCRmnslkc5Ge6Qjsa5XHeH2gmBpiglvMQpTBFdASEFDn1J/JS2chF0hR4OAH549fbDq9
	Jn8CBtXTSF4/WBhuSmIdkoiIYpwYou+trUTuoNM+UYFeslg6rHrwLsgta8edDJTVmZU4
	oHsfAUx8nERjp3PeZkDEXfPWOZm+h3l0dyLOMXM/rYYkolluGgvVecoqKGAHt73Uiw0A
	Jijg==
Received: by 10.180.80.35 with SMTP id o3mr5615047wix.5.1331725152980;
	Wed, 14 Mar 2012 04:39:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fi4sm10960885wib.4.2012.03.14.04.39.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Mar 2012 04:39:12 -0700 (PDT)
Date: Wed, 14 Mar 2012 12:39:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120314113909.GF3919@jama.jama.net>
References: <cover.1331713807.git.sgw@linux.intel.com>
	<7ccb68ddb9280c18740fe989bf00ebb42f9a1fc6.1331713807.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <7ccb68ddb9280c18740fe989bf00ebb42f9a1fc6.1331713807.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 05/14] qt4: package static libraries correctly to fix warnings
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
X-List-Received-Date: Wed, 14 Mar 2012 11:47:58 -0000
X-Groupsio-MsgNum: 18797
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+jhVVhN62yS6hEJ8"
Content-Disposition: inline

--+jhVVhN62yS6hEJ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 14, 2012 at 01:33:16AM -0700, Saul Wold wrote:
> WARNING: QA Issue: non -staticdev package contains static .a library: qt4=
-demos path '/work/i586-poky-linux/qt4-x11-free-4.7.4-r39.7/packages-split/=
qt4-demos/usr/bin/qt4/demos/shared/libdemo_shared.a'
> WARNING: QA Issue: non -staticdev package contains static .a library: qt4=
-examples path '/work/i586-poky-linux/qt4-x11-free-4.7.4-r39.7/packages-spl=
it/qt4-examples/usr/bin/qt4/examples/tools/plugandpaint/plugins/libpnp_basi=
ctools.a'
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Does this depend on 14/14?

Because even with this patch I still get the first warning about
/libdemo_shared.a (libpnp_basictools.a warning is gone)

WARNING: QA Issue: non -staticdev package contains static .a library:
qt4-demos path '/work/armv4t-oe-linux-gnueabi/qt4-x11-free/qt4-x11-free-4.8=
=2E0-r41.1/packages-split/qt4-demos/usr/bin/qt4/demos/shared/libdemo_shared=
=2Ea'

Or maybe demos dir is missing?
-FILES_${QT_BASE_NAME}-demos-staticdev      =3D "${bindir}/${QT_DIR_NAME}/s=
hared/libdemo_shared.a"
+FILES_${QT_BASE_NAME}-demos-staticdev      =3D "${bindir}/${QT_DIR_NAME}/d=
emos/shared/libdemo_shared.a"

Cheers,

> ---
>  meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
>  meta/recipes-qt/qt4/qt4.inc          |   19 ++++++++++++++++---
>  2 files changed, 17 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/q=
t4-x11-free.inc
> index 56f349a..e1bef64 100644
> --- a/meta/recipes-qt/qt4/qt4-x11-free.inc
> +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> @@ -5,7 +5,7 @@ HOMEPAGE =3D "http://qt.nokia.com"
>  SECTION =3D "x11/libs"
>  DEPENDS +=3D "virtual/libgl virtual/libx11 fontconfig libxft libxext lib=
xrender libxrandr libxcursor"
> =20
> -INC_PR =3D "r39"
> +INC_PR =3D "r40"
> =20
>  QT_GLFLAGS ?=3D "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl'=
, '-no-opengl', d)} "
>  QT_GLFLAGS_qemux86 =3D "-opengl"
> diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
> index 77fb06f..8f2cbd5 100644
> --- a/meta/recipes-qt/qt4/qt4.inc
> +++ b/meta/recipes-qt/qt4/qt4.inc
> @@ -45,30 +45,33 @@ python __anonymous () {
>      lib_packages =3D []
>      dev_packages =3D []
>      dbg_packages =3D []
> +    staticdev_packages =3D []
>      for name in d.getVar("QT_LIB_NAMES", True).split():
>          pkg =3D d.getVar("QT_BASE_LIB", True) + name.lower().replace("qt=
", "").replace("_", "-") + "4"
>          # NOTE: the headers for QtAssistantClient are different
>          incname =3D name.replace("QtAssistantClient", "QtAssistant")
>          d.setVar("FILES_%s" % pkg, "${libdir}/lib%(name)s${QT_LIBINFIX}.=
so.*" % locals())
>          d.setVar("FILES_%s-dev" % pkg, """${libdir}/lib%(name)s${QT_LIBI=
NFIX}.prl
> -                  ${libdir}/lib%(name)s${QT_LIBINFIX}.a
>                    ${libdir}/lib%(name)s${QT_LIBINFIX}.la
>                    ${libdir}/lib%(name)s${QT_LIBINFIX}.so
>                    ${includedir}/${QT_DIR_NAME}/%(incname)s
>                    ${libdir}/pkgconfig/%(name)s${QT_LIBINFIX}.pc""" % loc=
als())
> +        d.setVar("FILES_%s-staticdev" % pkg, "${libdir}/lib%(name)s${QT_=
LIBINFIX}.a" % locals())
>          d.setVar("FILES_%s-dbg" % pkg, "${libdir}/.debug/lib%(name)s${QT=
_LIBINFIX}.so*" % locals())
>          d.setVar("RRECOMMENDS_%s-dbg" % pkg, "${PN}-dbg")
>          lib_packages.append(pkg)
>          dev_packages.append("%s-dev" % pkg)
>          dbg_packages.append("%s-dbg" % pkg)
> +        staticdev_packages.append("%s-staticdev" % pkg)
>      for name in d.getVar("OTHER_PACKAGES", True).split():
>          dbg_packages.append("%s-dbg" % name)
> +        dbg_packages.append("%s-staticdev" % name)
> =20
>      for name in d.getVar("QT_EXTRA_LIBS", True).split():
>          pkg =3D d.getVar("QT_BASE_LIB", True) + name.lower().replace("qt=
", "").replace("_", "-") + "4"
>          d.setVar("FILES_%s" % pkg, "${libdir}/lib%(name)s.so.*" % locals=
())
> +        d.setVar("FILES_%s-staticdev" % pkg, "${libdir}/lib%(name)s.a" %=
 locals())
>          d.setVar("FILES_%s-dev" % pkg, """${libdir}/lib%(name)s.prl
> -                  ${libdir}/lib%(name)s.a
>                    ${libdir}/lib%(name)s.la
>                    ${libdir}/lib%(name)s.so
>                    ${includedir}/${QT_DIR_NAME}/%(incname)s
> @@ -78,10 +81,12 @@ python __anonymous () {
>          lib_packages.append(pkg)
>          dev_packages.append("%s-dev" % pkg)
>          dbg_packages.append("%s-dbg" % pkg)
> +        staticdev_packages.append("%s-staticdev" % pkg)
> =20
>      d.setVar("LIB_PACKAGES", " ".join(lib_packages))
>      d.setVar("DEV_PACKAGES", " ".join(dev_packages))
>      d.setVar("DBG_PACKAGES", " ".join(dbg_packages))
> +    d.setVar("STATICDEV_PACKAGES", " ".join(staticdev_packages))
>  }
> =20
>  OTHER_PACKAGES =3D "\
> @@ -109,7 +114,13 @@ OTHER_PACKAGES =3D "\
> =20
>  #We prepend so ${QT_BASE_NAME}-demos-doc comes before ${PN}-doc,so the p=
ackaging of FILES_ get done before.
>  PACKAGES =3D+ "${QT_BASE_NAME}-demos-doc"
> -PACKAGES +=3D "${LIB_PACKAGES} ${DEV_PACKAGES} ${DBG_PACKAGES} ${OTHER_P=
ACKAGES}"
> +PACKAGES +=3D " \
> +             ${LIB_PACKAGES} \
> +             ${DEV_PACKAGES} \
> +             ${DBG_PACKAGES} \
> +             ${STATICDEV_PACKAGES} \
> +             ${OTHER_PACKAGES}"
> +
>  PACKAGES_DYNAMIC =3D "${QT_BASE_NAME}-plugin-* ${QT_BASE_NAME}-translati=
on-* ${QT_BASE_NAME}-phrasebook-* ${QT_BASE_NAME}-fonts-*"
> =20
>  ALLOW_EMPTY_${PN} =3D "1"
> @@ -153,10 +164,12 @@ FILES_${QT_BASE_NAME}-common-dbg           =3D "${b=
indir}/.debug/qtconfig"
>  FILES_${QT_BASE_NAME}-dbus                 =3D "${bindir}/qdbus ${bindir=
}/qdbusxml2cpp ${bindir}/qdbuscpp2xml ${bindir}/qdbusviewer"
>  FILES_${QT_BASE_NAME}-dbus-dbg             =3D "${bindir}/.debug/qdbus $=
{bindir}/.debug/qdbusxml2cpp ${bindir}/.debug/qdbuscpp2xml ${bindir}/.debug=
/qdbusviewer"
>  FILES_${QT_BASE_NAME}-demos                =3D "${bindir}/qtdemo* ${bind=
ir}/${QT_DIR_NAME}/demos/*"
> +FILES_${QT_BASE_NAME}-demos-staticdev      =3D "${bindir}/${QT_DIR_NAME}=
/shared/libdemo_shared.a"
>  FILES_${QT_BASE_NAME}-demos-dbg            =3D "${bindir}/.debug/qtdemo*=
 ${bindir}/${QT_DIR_NAME}/demos/.debug/*  ${bindir}/${QT_DIR_NAME}/demos/*/=
=2Edebug  ${bindir}/${QT_DIR_NAME}/demos/*/*/.debug  ${bindir}/${QT_DIR_NAM=
E}/demos/*/*/*/.debug"
>  FILES_${QT_BASE_NAME}-designer             =3D "${bindir}/*designer*"
>  FILES_${QT_BASE_NAME}-designer-dbg         =3D "${bindir}/.debug/*design=
er*"
>  FILES_${QT_BASE_NAME}-examples             =3D "${bindir}/${QT_DIR_NAME}=
/examples/*"
> +FILES_${QT_BASE_NAME}-examples-staticdev   =3D "${bindir}/${QT_DIR_NAME}=
/examples/tools/plugandpaint/plugins/libpnp_basictools.a"
>  FILES_${QT_BASE_NAME}-examples-dbg         =3D "${bindir}/${QT_DIR_NAME}=
/examples/.debug ${bindir}/${QT_DIR_NAME}/examples/*/.debug ${bindir}/${QT_=
DIR_NAME}/examples/*/*/.debug ${bindir}/${QT_DIR_NAME}/examples/*/*/*/.debu=
g ${bindir}/${QT_DIR_NAME}/examples/*/*/*/*/.debug ${bindir}/${QT_DIR_NAME}=
/examples/declarative/*/*/*/*/*/.debug/* ${bindir}/${QT_DIR_NAME}/examples/=
declarative/*/*/*/*/.debug/*"
>  FILES_${QT_BASE_NAME}-fonts-ttf-vera       =3D "${libdir}/fonts/Vera*.tt=
f"
>  FILES_${QT_BASE_NAME}-fonts-ttf-dejavu     =3D "${libdir}/fonts/DejaVu*.=
ttf"
> --=20
> 1.7.7.6
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+jhVVhN62yS6hEJ8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9gg10ACgkQN1Ujt2V2gBwrUwCfVf8wpETkadRZDI4HrkGCfsjw
zREAnAwy/7M/MgzEf1cFXNzijxPZRb8H
=q26q
-----END PGP SIGNATURE-----

--+jhVVhN62yS6hEJ8--
