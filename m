Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sv50Q-000144-HH
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 13:16:22 +0200
Received: by wgbdr1 with SMTP id dr1so3109187wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2012 04:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sTWYxUgZKvr40Qi7WRvLoYy8DhDDm47Qjju0ZSTgvBo=;
	b=aJxMMoTJPfSYNAnCks+nibdjO3waXgTNfPttCHvUqf03n1Vv1b4lz+YwM9XfTvzoBV
	Ox8VoOCUx40OKC/ZgoWMWNouPs5sAxY0pXuGsYGjxxi3RCrpngl1Kbjvu840o/0uwUst
	fRyKH0uc2B7GG6BPhXqtAkGqmcNBwNDgMtfvmVaWWfRc9TsAj/G9pHweL15C+P0Sq9ZT
	nfX6cKGwjF6nmVf11hoSUnDAcmSZdPDYgn9g2/FjB3/VkxgkNZgwdkrpDsZ8uoQLKG6y
	RUv6kPSQf1VUBGBWpE/AiZJbHAG24hTyCYnWs6AdW3jZAc8vzoKOrbsM/s99HB97F4YZ
	xOwg==
Received: by 10.180.97.135 with SMTP id ea7mr28919375wib.11.1343473489362;
	Sat, 28 Jul 2012 04:04:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm5434685wix.6.2012.07.28.04.04.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Jul 2012 04:04:47 -0700 (PDT)
Date: Sat, 28 Jul 2012 13:04:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120728110453.GF3742@jama.jama.net>
References: <cover.1342597081.git.sgw@linux.intel.com>
	<036a017187e4d75a994b3eb9c0e5d1a8dd61432c.1342597081.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <036a017187e4d75a994b3eb9c0e5d1a8dd61432c.1342597081.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [CONSOLIDATED PULL 10/18] qt-mobility, xserver-xorg, ofono, bluez4, gst-plugins-good: bump PR to rebuild after libudev0 soname change to libudev1
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
X-List-Received-Date: Sat, 28 Jul 2012 11:16:22 -0000
X-Groupsio-MsgNum: 26434
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4VrXvz3cwkc87Wze"
Content-Disposition: inline

--4VrXvz3cwkc87Wze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 18, 2012 at 12:42:39AM -0700, Saul Wold wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
>=20
> * this patch depends on http://patchwork.openembedded.org/patch/32085/

Hi, this ^ patch was applied
http://git.openembedded.org/meta-openembedded/commit/?id=3D36b68478742d60b3=
f8f49a3f443a28cb6de53158

Please merge this PR bump to fix binary feeds..

Cheers,

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-connectivity/bluez/bluez4_4.101.bb    |    2 +-
>  meta/recipes-connectivity/ofono/ofono_1.8.bb       |    1 +
>  meta/recipes-connectivity/ofono/ofono_git.bb       |    2 +-
>  .../xorg-xserver/xserver-xorg-1.11.2.inc           |    2 +-
>  .../gstreamer/gst-plugins-good_0.10.31.bb          |    2 +-
>  meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    2 +-
>  6 files changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recip=
es-connectivity/bluez/bluez4_4.101.bb
> index 4a360b6..e26d4ea 100644
> --- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
> +++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
> @@ -1,6 +1,6 @@
>  require bluez4.inc
> =20
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  SRC_URI +=3D "file://bluetooth.conf \
>              file://sbc_mmx.patch"
> diff --git a/meta/recipes-connectivity/ofono/ofono_1.8.bb b/meta/recipes-=
connectivity/ofono/ofono_1.8.bb
> index e2d97f0..86767f1 100644
> --- a/meta/recipes-connectivity/ofono/ofono_1.8.bb
> +++ b/meta/recipes-connectivity/ofono/ofono_1.8.bb
> @@ -4,6 +4,7 @@ SRC_URI  =3D "\
>    ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.bz2 \
>    file://ofono \
>  "
> +PR =3D "r1"
> =20
>  SRC_URI[md5sum] =3D "e457ea13db22bb2de77767c867dcc4d3"
>  SRC_URI[sha256sum] =3D "164b413068e810281a5e6c9bb90d5002d80f1c30bef2f3ff=
dbe70f963079524d"
> diff --git a/meta/recipes-connectivity/ofono/ofono_git.bb b/meta/recipes-=
connectivity/ofono/ofono_git.bb
> index a44b411..0a69fff 100644
> --- a/meta/recipes-connectivity/ofono/ofono_git.bb
> +++ b/meta/recipes-connectivity/ofono/ofono_git.bb
> @@ -3,7 +3,7 @@ require ofono.inc
>  S	 =3D "${WORKDIR}/git"
>  SRCREV =3D "14544d5996836f628613c2ce544380ee6fc8f514"
>  PV	 =3D "0.12-git${SRCPV}"
> -PR =3D "r3"
> +PR =3D "r4"
> =20
>  SRC_URI  =3D "git://git.kernel.org/pub/scm/network/ofono/ofono.git;proto=
col=3Dgit \
>  	    file://ofono"
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b=
/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> index 595ab77..017ac91 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> @@ -8,5 +8,5 @@ SRC_URI +=3D "file://crosscompile.patch \
>  SRC_URI[md5sum] =3D "8796fff441e5435ee36a72579008af24"
>  SRC_URI[sha256sum] =3D "fa415decf02027ca278b06254ccfbcceba2a83c274140525=
7ebf749da4a73cf2"
> =20
> -PR =3D "r3"
> +PR =3D "r4"
> =20
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.b=
b b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> index e0eaf7b..ac63f94 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6=
cdffcea4f398e37343 \
> =20
>  DEPENDS +=3D "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3t=
ag flac \
>  	    speex libsoup-2.4 pulseaudio"
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  inherit gettext gconf
> =20
> diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/=
qt4/qt-mobility_1.2.0.inc
> index e612adb..7f0af9f 100644
> --- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> +++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> @@ -16,7 +16,7 @@ SRC_URI =3D "http://get.qt.nokia.com/qt/add-ons/qt-mobi=
lity-opensource-src-${PV}.t
>  SRC_URI[md5sum]=3D"ea5db5a8d3dd4709c2926dceda646bd8"
>  SRC_URI[sha256sum]=3D"ee3c88975e04139ac9589f76d4be646d44fcbc4c8c1cf2db62=
1abc154cf0ba44"
> =20
> -PR =3D "r5"
> +PR =3D "r6"
> =20
>  S =3D "${WORKDIR}/qt-mobility-opensource-src-${PV}"
> =20
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

--4VrXvz3cwkc87Wze
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlATx1UACgkQN1Ujt2V2gBx8PQCgmcg59vyqwqnByxxikbF7MvU3
XpwAoI/G5wj5HuqsQgPxFCURZDfm6wFU
=Vp6y
-----END PGP SIGNATURE-----

--4VrXvz3cwkc87Wze--
