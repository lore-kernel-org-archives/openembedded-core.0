Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REHP6-0007CI-Ko
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 11:16:47 +0200
Received: by bkat8 with SMTP id t8so306349bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 02:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IZqCkCk2WYPABEeiFYj2GfB42TGDZrftVI3aMF2LAJQ=;
	b=UrErvUGeL99B1mSF20WOHgNBUNKWJQng485B+MIvipEnK9ywFiJqStOjnq04F6Za3w
	CucPaaV5hC7ihSza+Tn5MIQ+iAtQC+0jQw2mWMhvtg7hDWOTVywEVAEGqBg6YgeZsRO4
	N3LgNHtuAPOY+1wECcQx9JRwn16nd3IynHLFk=
Received: by 10.204.132.199 with SMTP id c7mr1986073bkt.45.1318497052793;
	Thu, 13 Oct 2011 02:10:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm2793613bkv.8.2011.10.13.02.10.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 02:10:51 -0700 (PDT)
Date: Thu, 13 Oct 2011 11:10:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111013091044.GA7661@jama.jama.net>
References: <cover.1318496401.git.kai.kang@windriver.com>
	<604d642870b01d3eed3c469dc42faf7d73433f52.1318496401.git.kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <604d642870b01d3eed3c469dc42faf7d73433f52.1318496401.git.kai.kang@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Thu, 13 Oct 2011 09:16:47 -0000
X-Groupsio-MsgNum: 10904
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2011 at 05:05:36PM +0800, Kang Kai wrote:
> Add the xinput_calibrator package to support evdev touchscreens,
> which both programs the xinput settings and writes out xorg.conf
> information that can be used to initialize the touchscreen in
> subsequent X start-ups.
>=20
> Add dependency pointercal-xinput at same time.
>=20
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>  .../pointercal-xinput/bug20/pointercal.xinput      |    1 +
>  .../pointercal-xinput/iphone3g/pointercal.xinput   |    1 +
>  .../pointercal-xinput/nokia900/pointercal.xinput   |    2 +
>  .../pointercal-xinput/om-gta01/pointercal.xinput   |    2 +
>  .../pointercal-xinput/om-gta02/pointercal.xinput   |    2 +
>  .../pointercal-xinput/pointercal.xinput            |    1 +
>  .../xinput-calibrator/pointercal-xinput_0.0.bb     |   21 ++++++++++++++=
+++
>  .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |   24 ++++++++++++++=
++++++
>  8 files changed, 54 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xi=
nput/bug20/pointercal.xinput
>  create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xi=
nput/iphone3g/pointercal.xinput
>  create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xi=
nput/nokia900/pointercal.xinput
>  create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xi=
nput/om-gta01/pointercal.xinput
>  create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xi=
nput/om-gta02/pointercal.xinput
>  create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xi=
nput/pointercal.xinput
>  create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xi=
nput_0.0.bb
>  create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibr=
ator_0.7.5.bb

those pointercal-xinput files should be in BSP layers and it was already
cleaned in meta-oe so please update this patch..

>=20
> diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/bu=
g20/pointercal.xinput b/meta/recipes-graphics/xinput-calibrator/pointercal-=
xinput/bug20/pointercal.xinput
> new file mode 100644
> index 0000000..50e2632
> --- /dev/null
> +++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/bug20/poi=
ntercal.xinput
> @@ -0,0 +1 @@
> +xinput set-int-prop "TSC2004 Touchscreen" "Evdev Axis Calibration" 32 23=
9 10 232 6;
> diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/ip=
hone3g/pointercal.xinput b/meta/recipes-graphics/xinput-calibrator/pointerc=
al-xinput/iphone3g/pointercal.xinput
> new file mode 100644
> index 0000000..d6ce56b
> --- /dev/null
> +++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/iphone3g/=
pointercal.xinput
> @@ -0,0 +1 @@
> +xinput set-int-prop "Touchscreen" "Evdev Axis Calibration" 32 -102 4739 =
6 7321;
> diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/no=
kia900/pointercal.xinput b/meta/recipes-graphics/xinput-calibrator/pointerc=
al-xinput/nokia900/pointercal.xinput
> new file mode 100644
> index 0000000..66bb32c
> --- /dev/null
> +++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/nokia900/=
pointercal.xinput
> @@ -0,0 +1,2 @@
> +xinput set-int-prop "Touchscreen" "Evdev Axis Calibration" 32 204 3897 3=
763 178;
> +
> diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/om=
-gta01/pointercal.xinput b/meta/recipes-graphics/xinput-calibrator/pointerc=
al-xinput/om-gta01/pointercal.xinput
> new file mode 100644
> index 0000000..be25da3
> --- /dev/null
> +++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta01/=
pointercal.xinput
> @@ -0,0 +1,2 @@
> +xinput set-int-prop "Touchscreen" "Evdev Axis Calibration" 32 107 918 91=
1 98
> +xinput set-int-prop "Touchscreen" "Evdev Axes Swap" 8 1
> diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/om=
-gta02/pointercal.xinput b/meta/recipes-graphics/xinput-calibrator/pointerc=
al-xinput/om-gta02/pointercal.xinput
> new file mode 100644
> index 0000000..be25da3
> --- /dev/null
> +++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta02/=
pointercal.xinput
> @@ -0,0 +1,2 @@
> +xinput set-int-prop "Touchscreen" "Evdev Axis Calibration" 32 107 918 91=
1 98
> +xinput set-int-prop "Touchscreen" "Evdev Axes Swap" 8 1
> diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/po=
intercal.xinput b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput=
/pointercal.xinput
> new file mode 100644
> index 0000000..9633fc5
> --- /dev/null
> +++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointerca=
l.xinput
> @@ -0,0 +1 @@
> +# replace with valid machine specific pointercal.xinput
> diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.=
0.bb b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
> new file mode 100644
> index 0000000..5b7b967
> --- /dev/null
> +++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION =3D "Touchscreen calibration data from xinput-calibrator"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
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
> +	        install -m 0644 ${S}/pointercal.xinput ${D}${sysconfdir}/
> +	fi
> +}
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +CONFFILES_${PN} =3D "${sysconfdir}/pointercal.xinput"
> diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.=
7.5.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
> new file mode 100644
> index 0000000..879f7e5
> --- /dev/null
> +++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION =3D "A generic touchscreen calibration program for X.Org"
> +HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/xinput_calibrator"
> +LICENSE =3D "MIT/X11"
> +LIC_FILES_CHKSUM =3D "file://src/calibrator.cpp;endline=3D22;md5=3D998e2=
38a7638a7446eaeb02398f691fc"
> +DEPENDS =3D "virtual/libx11 libxi"
> +
> +inherit autotools
> +
> +RDEPENDS_${PN} =3D "xinput"
> +RRECOMMENDS_${PN} =3D "pointercal-xinput"
> +
> +PR =3D "r0"
> +
> +SRC_URI =3D "http://github.com/downloads/tias/xinput_calibrator/xinput_c=
alibrator-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "20da0a2055a5a75962add8c6b44f60fa"
> +SRC_URI[sha256sum] =3D "baa4ddca49ec94c27ba4c715bfa26692fec1132103e92721=
3c3169e475d3d971"
> +
> +S =3D "${WORKDIR}/xinput_calibrator-${PV}"
> +
> +do_install_append() {
> +        install -d ${D}${bindir}
> +        install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bi=
ndir}/xinput_calibrator_once.sh
> +        install -m 0755 scripts/xinput_calibrator_get_hal_calibration.sh=
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

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6WqxQACgkQN1Ujt2V2gBwctQCeKSi3eZRQkBHJ0pQdosIKbqN6
umsAoKhEYy1FPrqu/niSr2zNwYn7rm0m
=Jyzn
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
