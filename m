Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QlhD9-0003cB-DF
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 14:58:11 +0200
Received: by wwi18 with SMTP id 18so416450wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 05:53:58 -0700 (PDT)
Received: by 10.217.4.66 with SMTP id t44mr4921702wes.25.1311684838310;
	Tue, 26 Jul 2011 05:53:58 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id z83sm324008weq.20.2011.07.26.05.53.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jul 2011 05:53:57 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <73ea8ff94e4bda213df1a5a39615f4cd39899589.1311682779.git.edwin.zhai@intel.com>
Date: Tue, 26 Jul 2011 14:53:55 +0200
Message-Id: <C36AA1E0-9A00-4761-9912-A3AC81367446@dominion.thruhere.net>
References: <cover.1311682779.git.edwin.zhai@intel.com>
	<73ea8ff94e4bda213df1a5a39615f4cd39899589.1311682779.git.edwin.zhai@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 2/3] xinput-calibrator: Add 0.7.5 as new recipe
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
X-List-Received-Date: Tue, 26 Jul 2011 12:58:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

This one looks suspicously like the one in meta-oe. Apart from that, is =
it really needed in oe-core?

Op 26 jul. 2011, om 14:30 heeft edwin.zhai@intel.com het volgende =
geschreven:

> From: Zhai Edwin <edwin.zhai@intel.com>
>=20
> Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> ---
> .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |   24 =
++++++++++++++++++++
> 1 files changed, 24 insertions(+), 0 deletions(-)
> create mode 100644 =
meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
>=20
> diff --git =
a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb =
b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
> new file mode 100644
> index 0000000..5a868f7
> --- /dev/null
> +++ =
b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION =3D "A generic touchscreen calibration program for X.Org"
> +HOMEPAGE =3D =
"http://www.freedesktop.org/wiki/Software/xinput_calibrator"
> +
> +LICENSE =3D "MIT/X11"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dd9a6926aaad6b8f38bb4f995fe088466\
> +                    =
file://src/calibrator.cpp;endline=3D22;md5=3D998e238a7638a7446eaeb02398f69=
1fc"
> +
> +DEPENDS =3D "virtual/libx11 libxi"
> +
> +inherit autotools
> +
> +RDEPENDS_${PN} =3D "xinput"
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
> 1.7.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



