Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QwrR6-0001rS-W5
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 10:06:45 +0200
Received: by wyf19 with SMTP id 19so2372006wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 01:01:56 -0700 (PDT)
Received: by 10.227.196.80 with SMTP id ef16mr636419wbb.27.1314345715764;
	Fri, 26 Aug 2011 01:01:55 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id p18sm1080926wbh.55.2011.08.26.01.01.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Aug 2011 01:01:54 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
Date: Fri, 26 Aug 2011 10:01:53 +0200
Message-Id: <ECC8B268-E890-4F6D-BDA6-9C3CB7A6BA55@dominion.thruhere.net>
References: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH meta-oe 1/9] schroedinger: Imported from OE classic
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
X-List-Received-Date: Fri, 26 Aug 2011 08:06:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 aug. 2011, om 02:28 heeft Joel A Fernandes het volgende =
geschreven:

> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> ---
> .../schroedinger/gst-plugin-schroedinger_1.0.9.bb  |   15 =
+++++++++++++++
> .../schroedinger/schroedinger.inc                  |   19 =
+++++++++++++++++++
> .../schroedinger/schroedinger/configure.ac.patch   |   13 =
+++++++++++++
> .../schroedinger/schroedinger_1.0.9.bb             |   13 =
+++++++++++++
> 4 files changed, 60 insertions(+), 0 deletions(-)
> create mode 100644 =
meta-oe/recipes-multimedia/schroedinger/gst-plugin-schroedinger_1.0.9.bb
> create mode 100644 =
meta-oe/recipes-multimedia/schroedinger/schroedinger.inc
> create mode 100644 =
meta-oe/recipes-multimedia/schroedinger/schroedinger/configure.ac.patch
> create mode 100644 =
meta-oe/recipes-multimedia/schroedinger/schroedinger_1.0.9.bb
>=20
> diff --git =
a/meta-oe/recipes-multimedia/schroedinger/gst-plugin-schroedinger_1.0.9.bb=
 =
b/meta-oe/recipes-multimedia/schroedinger/gst-plugin-schroedinger_1.0.9.bb=

> new file mode 100644
> index 0000000..0a95646
> --- /dev/null
> +++ =
b/meta-oe/recipes-multimedia/schroedinger/gst-plugin-schroedinger_1.0.9.bb=

> @@ -0,0 +1,15 @@
> +require schroedinger.inc
> +PR =3D "r0"
> +

> +DEPENDS +=3D "gstreamer gst-plugins-base"
> +
> +SRC_URI[schroedingertargz.md5sum] =3D =
"d67ec48b7c506db8c8b49156bf409e60"
> +SRC_URI[schroedingertargz.sha256sum] =3D =
"345abcaa72ff0f2e9c1075e22f7141475ee4e6eea23a7f568b69ffc13cc1c723"
> +
> +S =3D "${WORKDIR}/schroedinger-${PV}"
> +
> +PACKAGES =3D "gst-plugin-schroedinger gst-plugin-schroedinger-dev =
gst-plugin-schroedinger-dbg"
> +FILES_gst-plugin-schroedinger +=3D =
"${libdir}/gstreamer-0.10/libgstschro.so"
> +FILES_gst-plugin-schroedinger-dev +=3D =
"${libdir}/gstreamer-0.10/libgstschro.*"
> +FILES_gst-plugin-schroedinger-dbg +=3D =
"${libdir}/gstreamer-0.10/.debug/libgstschro.so"
> +
> diff --git a/meta-oe/recipes-multimedia/schroedinger/schroedinger.inc =
b/meta-oe/recipes-multimedia/schroedinger/schroedinger.inc
> new file mode 100644
> index 0000000..386fc73
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/schroedinger/schroedinger.inc
> @@ -0,0 +1,19 @@
> +HOMEPAGE =3D "http://schrodinger.sourceforge.net/"
> +LICENSE =3D "MPL GPL LGPL MIT"
> +DEPENDS =3D "liboil orc-native orc"
> +
> +INC_PR =3D "r1"

reset that

> +
> +SRC_URI =3D =
"http://www.diracvideo.org/download/schroedinger/${P}.tar.gz;name=3Dschroe=
dingertargz"
> +SRC_URI +=3D "file://configure.ac.patch"
> +
> +EXTRA_OECONF +=3D "STAGING_DIR=3D${STAGING_DIR_NATIVE}"
> +
> +inherit autotools
> +
> +do_configure_append () {
> +        # Fix stupid libtool... handling.=20
> +        # rpath handling can't be disabled and the Makefile's can't =
be regenerated..
> +        # (GNU sed required)
> +        sed -i =
s/^hardcode_libdir_flag_spec/#hardcode_libdir_flag_spec/ ${S}/*-libtool
> +}
> diff --git =
a/meta-oe/recipes-multimedia/schroedinger/schroedinger/configure.ac.patch =
b/meta-oe/recipes-multimedia/schroedinger/schroedinger/configure.ac.patch
> new file mode 100644
> index 0000000..ac5e7ee
> --- /dev/null
> +++ =
b/meta-oe/recipes-multimedia/schroedinger/schroedinger/configure.ac.patch
> @@ -0,0 +1,13 @@
> +Index: schroedinger-1.0.9/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- schroedinger-1.0.9.orig/configure.ac
> ++++ schroedinger-1.0.9/configure.ac
> +@@ -54,7 +54,7 @@ if test "x${HAVE_ORC}" !=3D xyes ; then
> +   AC_ERROR([orc-0.4 >=3D $ORC_VER is required])
> + fi
> + SCHRO_PKG_DEPS=3D"$SCHRO_PKG_DEPS orc-0.4 >=3D $ORC_VER"
> +-ORCC=3D`$PKG_CONFIG --variable=3Dorcc orc-0.4`
> ++ORCC=3D$STAGING_DIR`$PKG_CONFIG --variable=3Dorcc orc-0.4`
> + AC_SUBST(ORCC)
> +=20
> + AC_ARG_WITH([thread],
> diff --git =
a/meta-oe/recipes-multimedia/schroedinger/schroedinger_1.0.9.bb =
b/meta-oe/recipes-multimedia/schroedinger/schroedinger_1.0.9.bb
> new file mode 100644
> index 0000000..2994428
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/schroedinger/schroedinger_1.0.9.bb
> @@ -0,0 +1,13 @@
> +require schroedinger.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +inherit autotools
> +
> +SRC_URI[schroedingertargz.md5sum] =3D =
"d67ec48b7c506db8c8b49156bf409e60"
> +SRC_URI[schroedingertargz.sha256sum] =3D =
"345abcaa72ff0f2e9c1075e22f7141475ee4e6eea23a7f568b69ffc13cc1c723"

Why isn't this in the .inc and why is there a seperate recipe for the =
gst plugin?

> +
> +PACKAGES =3D+ "gst-plugin-schroedinger-dbg =
gst-plugin-schroedinger-dev gst-plugin-schroedinger"
> +FILES_gst-plugin-schroedinger =3D "${libdir}/gstreamer-0.10/*.so"
> +FILES_gst-plugin-schroedinger-dbg =3D =
"${libdir}/gstreamer-0.10/.debug"
> +FILES_gst-plugin-schroedinger-dev =3D "${libdir}/gstreamer-0.10/*.*a"
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



