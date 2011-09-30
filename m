Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9XbQ-0005dU-45
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 09:33:48 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so1506817bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 00:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rViFsOnlT95YMhrCtglrcbSEcJt17+5hGlnN6FE4wow=;
	b=iolSO/GZcud1WWijdvcdAucIALVEtZZ594PV1mH8c5NdfCXaPVIwhF0genvRFlquIW
	B/1KPsk04Ozx0BNi5D9EQYI14kCmQm8QClFEMeYC8+J5QDX8ZTCpemEBHUm8W4W1i+oC
	yKo7g1Plf2y8fTnASD1oO/EU+BKrIn6eFxPNk=
Received: by 10.204.133.69 with SMTP id e5mr7182227bkt.79.1317367701832;
	Fri, 30 Sep 2011 00:28:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v16sm3934425bkd.6.2011.09.30.00.28.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 00:28:20 -0700 (PDT)
Date: Fri, 30 Sep 2011 09:28:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20110930072814.GC2361@jama.jama.net>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1317367429.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 00/13] Xorg related changes
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
X-List-Received-Date: Fri, 30 Sep 2011 07:33:48 -0000
X-Groupsio-MsgNum: 10248
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L6iaP+gRLNZHKoI4"
Content-Disposition: inline

--L6iaP+gRLNZHKoI4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 09:26:47AM +0200, Martin Jansa wrote:
> Hi,
>=20
> this patchset brings meta-oe and oe-core xorg stuff together and most of=
=20
> xorg recipes will be removed from meta-oe (sending another pull request n=
ow).
>=20
> This step is needed to be able to separate common x11 to meta-x11 or what=
ever later.

I've forgot to mention that this patchest was tested on om-gta02,
nokia900 and spitz..

>=20
> The following changes since commit 96241de59fdf548ae0f80cc9e4668f9ba11924=
ef:
>=20
>   Fix flac build on e500mc cores (2011-09-29 19:31:38 +0100)
>=20
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib jansa/x11
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Djansa/x11
>=20
> Martin Jansa (13):
>   xserver-xf86: upgrade to 1.11.0 and move shared definitions to .inc
>     files
>   xserver-xf86-dri-lite: remove COMPATIBLE_HOST
>   libxft, libxrender, renderproto: add native BBCLASSEXTEND
>   libx11: upgrade to 1.4.4
>   default-providers: define PREFERRED_PROVIDER_virtual/libx11-native
>   xorg-app-common: merge some changes from meta-oe
>   xorg-driver: rename .inc files and merge some changes from meta-oe
>   xf86-video-omapfb: bump SRCREV and add patch from meta-oe
>   xserver-nodm-init: merge some changes from meta-oe
>   rgb: import from meta-oe layer
>   libdrm: improve packaging
>   glx-use-tls: add from meta-oe layer
>   mesa: upgrade to 7.11
>=20
>  meta/classes/glx-use-tls.bbclass                   |    7 +
>  meta/conf/distro/include/default-providers.inc     |    1 +
>  meta/recipes-graphics/drm/libdrm.inc               |    7 +-
>  meta/recipes-graphics/drm/libdrm_2.4.26.bb         |    2 +-
>  meta/recipes-graphics/drm/libdrm_git.bb            |    2 +-
>  meta/recipes-graphics/mesa/mesa-7.11.inc           |   15 +
>  meta/recipes-graphics/mesa/mesa-common.inc         |   48 ++-
>  .../mesa/mesa-dri-glsl-native_7.11.bb              |   28 ++
>  .../mesa/mesa-dri-glsl-native_7.8.2.bb             |   27 --
>  meta/recipes-graphics/mesa/mesa-dri.inc            |   27 ++
>  meta/recipes-graphics/mesa/mesa-dri_7.11.bb        |    3 +
>  meta/recipes-graphics/mesa/mesa-xlib.inc           |    5 +
>  meta/recipes-graphics/mesa/mesa-xlib_7.11.bb       |    4 +
>  .../mesa/{mesa-dri =3D> mesa}/uclibc.patch           |    0
>  meta/recipes-graphics/mesa/mesa_7.11.bb            |    6 +
>  .../x11-common/xserver-nodm-init/xserver-nodm      |   30 +--
>  meta/recipes-graphics/xorg-app/rgb_1.0.4.bb        |   10 +
>  meta/recipes-graphics/xorg-app/xorg-app-common.inc |   10 +-
>  .../xorg-driver/xf86-input-evdev_2.6.0.bb          |    4 +-
>  .../xorg-driver/xf86-input-keyboard_1.6.0.bb       |    4 +-
>  .../xorg-driver/xf86-input-keyboard_git.bb         |    3 +-
>  .../xorg-driver/xf86-input-mouse_1.7.0.bb          |    4 +-
>  .../xorg-driver/xf86-input-mouse_git.bb            |    4 +-
>  .../xorg-driver/xf86-input-synaptics_1.4.0.bb      |    4 +-
>  .../xorg-driver/xf86-input-synaptics_git.bb        |    3 +-
>  .../xorg-driver/xf86-input-vmmouse_12.7.0.bb       |    4 +-
>  .../xorg-driver/xf86-video-intel_2.15.0.bb         |    4 +-
>  .../xorg-driver/xf86-video-intel_git.bb            |    4 +-
>  .../0004-Attempt-to-fix-VRFB.patch                 |  325 ++++++++++++++=
++++++
>  .../xorg-driver/xf86-video-omapfb_git.bb           |   20 +-
>  .../xorg-driver/xf86-video-vesa_2.3.0.bb           |    4 +-
>  .../xorg-driver/xf86-video-vmware_11.0.3.bb        |    4 +-
>  ...86-driver-common.inc =3D> xorg-driver-common.inc} |   14 +-
>  ...xf86-input-common.inc =3D> xorg-driver-input.inc} |    3 +-
>  ...xf86-video-common.inc =3D> xorg-driver-video.inc} |    2 +-
>  .../xorg-lib/libx11-1.4.4/keysymdef_include.patch  |   19 ++
>  .../libx11-1.4.4/x11_disable_makekeys.patch        |   29 ++
>  meta/recipes-graphics/xorg-lib/libx11.inc          |   52 ++--
>  meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb     |   14 +
>  meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb     |    2 +
>  meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bb |    2 +-
>  .../xorg-proto/renderproto_0.11.1.bb               |    2 +-
>  .../xorg-xserver/xserver-xf86-1.11.0.inc           |    7 +
>  .../xorg-xserver/xserver-xf86-common.inc           |  114 ++++++-
>  .../xorg-xserver/xserver-xf86-dri-lite.inc         |   37 +--
>  .../xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb   |   20 --
>  .../xorg-xserver/xserver-xf86-dri-lite_1.11.0.bb   |    4 +
>  .../xorg-xserver/xserver-xf86-dri-lite_git.bb      |    8 +-
>  .../xorg-xserver/xserver-xf86-lite.inc             |   32 +--
>  .../xorg-xserver/xserver-xf86-lite_1.10.1.bb       |   12 -
>  .../xorg-xserver/xserver-xf86-lite_1.11.0.bb       |    2 +
>  51 files changed, 750 insertions(+), 248 deletions(-)
>  create mode 100644 meta/classes/glx-use-tls.bbclass
>  create mode 100644 meta/recipes-graphics/mesa/mesa-7.11.inc
>  create mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.=
bb
>  delete mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.8.2=
=2Ebb
>  create mode 100644 meta/recipes-graphics/mesa/mesa-dri.inc
>  create mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.11.bb
>  create mode 100644 meta/recipes-graphics/mesa/mesa-xlib.inc
>  create mode 100644 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
>  rename meta/recipes-graphics/mesa/{mesa-dri =3D> mesa}/uclibc.patch (100=
%)
>  create mode 100644 meta/recipes-graphics/mesa/mesa_7.11.bb
>  create mode 100644 meta/recipes-graphics/xorg-app/rgb_1.0.4.bb
>  create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0=
004-Attempt-to-fix-VRFB.patch
>  rename meta/recipes-graphics/xorg-driver/{xf86-driver-common.inc =3D> xo=
rg-driver-common.inc} (66%)
>  rename meta/recipes-graphics/xorg-driver/{xf86-input-common.inc =3D> xor=
g-driver-input.inc} (81%)
>  rename meta/recipes-graphics/xorg-driver/{xf86-video-common.inc =3D> xor=
g-driver-video.inc} (65%)
>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/keysymdef=
_include.patch
>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disab=
le_makekeys.patch
>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-1.11.=
0.inc
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-l=
ite_1.10.1.bb
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-l=
ite_1.11.0.bb
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_=
1.10.1.bb
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_=
1.11.0.bb
>=20
> --=20
> 1.7.6.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--L6iaP+gRLNZHKoI4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6Fb44ACgkQN1Ujt2V2gBz6TwCfQqhFIk/IKoQHbXf2rZj1Soth
hS4An39D+i/axqYoZo/gyvYm6GxVciX2
=vvpo
-----END PGP SIGNATURE-----

--L6iaP+gRLNZHKoI4--
