Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1REHPR-0007CI-Um
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 11:17:02 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so306349bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 02:11:20 -0700 (PDT)
Received: by 10.223.17.11 with SMTP id q11mr4926539faa.13.1318497080059;
	Thu, 13 Oct 2011 02:11:20 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id x4sm19012998fad.1.2011.10.13.02.11.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 02:11:19 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <604d642870b01d3eed3c469dc42faf7d73433f52.1318496401.git.kai.kang@windriver.com>
Date: Thu, 13 Oct 2011 11:11:17 +0200
Message-Id: <240A1ACE-3552-4DCF-9A52-EC9267AA6EB8@dominion.thruhere.net>
References: <cover.1318496401.git.kai.kang@windriver.com>
	<604d642870b01d3eed3c469dc42faf7d73433f52.1318496401.git.kai.kang@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 4/4] xinput-calibrator: add touchscreen support
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
X-List-Received-Date: Thu, 13 Oct 2011 09:17:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 okt. 2011, om 11:05 heeft Kang Kai het volgende geschreven:

> Add the xinput_calibrator package to support evdev touchscreens,
> which both programs the xinput settings and writes out xorg.conf
> information that can be used to initialize the touchscreen in
> subsequent X start-ups.
>=20
> Add dependency pointercal-xinput at same time.
>=20
> Signed-off-by: Kang Kai <kai.kang@windriver.com>

If you would have imported the meta-oe version you wouldn't have dragged =
in BSP stuff.

I know I said this before, but I'll say it again: look at the meta-oe =
versions of all this


> ---
> .../pointercal-xinput/bug20/pointercal.xinput      |    1 +
> .../pointercal-xinput/iphone3g/pointercal.xinput   |    1 +
> .../pointercal-xinput/nokia900/pointercal.xinput   |    2 +
> .../pointercal-xinput/om-gta01/pointercal.xinput   |    2 +
> .../pointercal-xinput/om-gta02/pointercal.xinput   |    2 +
> .../pointercal-xinput/pointercal.xinput            |    1 +
> .../xinput-calibrator/pointercal-xinput_0.0.bb     |   21 =
+++++++++++++++++
> .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |   24 =
++++++++++++++++++++
> 8 files changed, 54 insertions(+), 0 deletions(-)
> create mode 100644 =
meta/recipes-graphics/xinput-calibrator/pointercal-xinput/bug20/pointercal=
.xinput
> create mode 100644 =
meta/recipes-graphics/xinput-calibrator/pointercal-xinput/iphone3g/pointer=
cal.xinput
> create mode 100644 =
meta/recipes-graphics/xinput-calibrator/pointercal-xinput/nokia900/pointer=
cal.xinput
> create mode 100644 =
meta/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta01/pointer=
cal.xinput
> create mode 100644 =
meta/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta02/pointer=
cal.xinput
> create mode 100644 =
meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinpu=
t
> create mode 100644 =
meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
> create mode 100644 =
meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
>=20
> diff --git =
a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/bug20/pointerc=
al.xinput =
b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/bug20/pointerc=
al.xinput
> new file mode 100644
> index 0000000..50e2632
> --- /dev/null
> +++ =
b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/bug20/pointerc=
al.xinput
> @@ -0,0 +1 @@
> +xinput set-int-prop "TSC2004 Touchscreen" "Evdev Axis Calibration" 32 =
239 10 232 6;
> diff --git =
a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/iphone3g/point=
ercal.xinput =
b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/iphone3g/point=
ercal.xinput
> new file mode 100644
> index 0000000..d6ce56b
> --- /dev/null
> +++ =
b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/iphone3g/point=
ercal.xinput
> @@ -0,0 +1 @@
> +xinput set-int-prop "Touchscreen" "Evdev Axis Calibration" 32 -102 =
4739 6 7321;
> diff --git =
a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/nokia900/point=
ercal.xinput =
b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/nokia900/point=
ercal.xinput
> new file mode 100644
> index 0000000..66bb32c
> --- /dev/null
> +++ =
b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/nokia900/point=
ercal.xinput
> @@ -0,0 +1,2 @@
> +xinput set-int-prop "Touchscreen" "Evdev Axis Calibration" 32 204 =
3897 3763 178;
> +
> diff --git =
a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta01/point=
ercal.xinput =
b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta01/point=
ercal.xinput
> new file mode 100644
> index 0000000..be25da3
> --- /dev/null
> +++ =
b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta01/point=
ercal.xinput
> @@ -0,0 +1,2 @@
> +xinput set-int-prop "Touchscreen" "Evdev Axis Calibration" 32 107 918 =
911 98
> +xinput set-int-prop "Touchscreen" "Evdev Axes Swap" 8 1
> diff --git =
a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta02/point=
ercal.xinput =
b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta02/point=
ercal.xinput
> new file mode 100644
> index 0000000..be25da3
> --- /dev/null
> +++ =
b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta02/point=
ercal.xinput
> @@ -0,0 +1,2 @@
> +xinput set-int-prop "Touchscreen" "Evdev Axis Calibration" 32 107 918 =
911 98
> +xinput set-int-prop "Touchscreen" "Evdev Axes Swap" 8 1
> diff --git =
a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xin=
put =
b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xin=
put
> new file mode 100644
> index 0000000..9633fc5
> --- /dev/null
> +++ =
b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xin=
put
> @@ -0,0 +1 @@
> +# replace with valid machine specific pointercal.xinput
> diff --git =
a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb =
b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
> new file mode 100644
> index 0000000..5b7b967
> --- /dev/null
> +++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION =3D "Touchscreen calibration data from xinput-calibrator"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D =
"file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de2042=
0"
> +
> +SECTION =3D "base"
> +
> +PR =3D "r0"
> +
> +SRC_URI =3D "file://pointercal.xinput"
> +S =3D "${WORKDIR}"
> +
> +do_install() {
> +	# Only install file if it has a contents
> +	if [ -s ${S}/pointercal.xinput ]; then
> +	        install -d ${D}${sysconfdir}/
> +	        install -m 0644 ${S}/pointercal.xinput =
${D}${sysconfdir}/
> +	fi
> +}
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +CONFFILES_${PN} =3D "${sysconfdir}/pointercal.xinput"
> diff --git =
a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb =
b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
> new file mode 100644
> index 0000000..879f7e5
> --- /dev/null
> +++ =
b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION =3D "A generic touchscreen calibration program for X.Org"
> +HOMEPAGE =3D =
"http://www.freedesktop.org/wiki/Software/xinput_calibrator"
> +LICENSE =3D "MIT/X11"
> +LIC_FILES_CHKSUM =3D =
"file://src/calibrator.cpp;endline=3D22;md5=3D998e238a7638a7446eaeb02398f6=
91fc"
> +DEPENDS =3D "virtual/libx11 libxi"
> +
> +inherit autotools
> +
> +RDEPENDS_${PN} =3D "xinput"
> +RRECOMMENDS_${PN} =3D "pointercal-xinput"
> +
> +PR =3D "r0"
> +
> +SRC_URI =3D =
"http://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-${PV=
}.tar.gz"
> +SRC_URI[md5sum] =3D "20da0a2055a5a75962add8c6b44f60fa"
> +SRC_URI[sha256sum] =3D =
"baa4ddca49ec94c27ba4c715bfa26692fec1132103e927213c3169e475d3d971"
> +
> +S =3D "${WORKDIR}/xinput_calibrator-${PV}"
> +
> +do_install_append() {
> +        install -d ${D}${bindir}
> +        install -m 0755 scripts/xinput_calibrator_pointercal.sh =
${D}${bindir}/xinput_calibrator_once.sh
> +        install -m 0755 =
scripts/xinput_calibrator_get_hal_calibration.sh =
${D}${bindir}/xinput_calibrator_get_hal_calibration.sh
> +}
> --=20
> 1.7.5.1.300.gc565c
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



