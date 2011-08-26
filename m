Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QwrLv-0001h9-2R
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 10:01:23 +0200
Received: by wyf19 with SMTP id 19so2369192wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 00:56:34 -0700 (PDT)
Received: by 10.227.132.141 with SMTP id b13mr135424wbt.29.1314345394789;
	Fri, 26 Aug 2011 00:56:34 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fb2sm1080403wbb.28.2011.08.26.00.56.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Aug 2011 00:56:34 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1314318504-9524-10-git-send-email-joelagnel@ti.com>
Date: Fri, 26 Aug 2011 09:56:32 +0200
Message-Id: <626CC96B-60D0-4772-B272-CF4668838A70@dominion.thruhere.net>
References: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
	<1314318504-9524-10-git-send-email-joelagnel@ti.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH meta-oe 9/9] xpext: Imported from OE classic
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
X-List-Received-Date: Fri, 26 Aug 2011 08:01:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 aug. 2011, om 02:28 heeft Joel A Fernandes het volgende =
geschreven:

> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> ---
> .../recipes-multimedia/xpext/xpext/auxdir.patch    |   13 +++++++++++
> meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb    |   23 =
++++++++++++++++++++
> 2 files changed, 36 insertions(+), 0 deletions(-)
> create mode 100644 meta-oe/recipes-multimedia/xpext/xpext/auxdir.patch
> create mode 100644 meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/xpext/xpext/auxdir.patch =
b/meta-oe/recipes-multimedia/xpext/xpext/auxdir.patch
> new file mode 100644
> index 0000000..da5841a
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/xpext/xpext/auxdir.patch
> @@ -0,0 +1,13 @@
> +--- configure.ac.old	2005-06-03 12:53:28.000000000 +0200
> ++++ configure.ac	2005-06-03 12:54:29.000000000 +0200
> +@@ -25,9 +25,9 @@
> +=20
> + AC_PREREQ([2.57])
> + AC_INIT([spext], [1.0], [lauri.leukkunen@nokia.com], spext)
> ++AC_CONFIG_AUX_DIR(.)
> + AM_INIT_AUTOMAKE([dist-bzip2])
> + AM_MAINTAINER_MODE
> +-AC_CONFIG_AUX_DIR(.)
> +=20
> + dnl PKG_CHECK_MODULES(FIXESEXT, fixesext)
> +=20

The patch about is lacking a patch header with upstream status.

> diff --git a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb =
b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
> new file mode 100644
> index 0000000..e6c1a5d
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
> @@ -0,0 +1,23 @@
> +PR =3D "r1"

please reset that

> +LICENSE=3D "MIT"
> +DESCRIPTION =3D "X Server Nokia 770 extensions library"
> +SECTION =3D "x11/libs"
> +PRIORITY =3D "optional"
> +DEPENDS =3D "virtual/libx11 libxext"
> +
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Ddb043791349ba57ad1169e1c92477cb6"
> +
> +SRC_URI =3D =
"http://repository.maemo.org/pool/maemo/ossw/source/x/${PN}/${PN}_${PV}.ta=
r.gz \
> +           file://auxdir.patch;striplevel=3D0"
> +S =3D "${WORKDIR}/xpext-1.0"
> +
> +inherit autotools pkgconfig
> +
> +do_configure_prepend () {
> +  cd ${S}
> +  chmod +x ./autogen.sh
> +  ./autogen.sh
> +}
> +
> +SRC_URI[md5sum] =3D "1b0cb67b6f2bd7c4abef17648b062896"
> +SRC_URI[sha256sum] =3D =
"a3b06f5188fd9effd0799ae31352b3cd65cb913b964e2c1a923ffa9d3c08abbe"
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



