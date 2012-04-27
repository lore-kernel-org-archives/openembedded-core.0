Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNe0p-0001gI-BY
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 07:46:35 +0200
Received: by wera1 with SMTP id a1so219284wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2012 22:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=suG3ZOlwhFGuyMSn5S5mb9Ie3/HWvBa9aXeZLygQR8g=;
	b=Nx2KfDxHzXEA+8Qb/CjRY0LBheLIV61CMhNbyykGrBgjutFC5PIYQ2bGQlFhUQVmNW
	3/ulx1DSVCtCXz4WfkwYiBc8RDGekAJYhCw9ePJ/7Q7AVmLb+vQt6CaTsnpCpI5oRdxw
	t+i0w5uOGaGbLUdKKj/HJp7cu8MrlVK0oaCRW4GDEKlpr9tz5XDcNk0rmxbqBLQc9MBk
	68ypU6n41B7aq/dLyjHfd4O4NQm3xseQgoPyup8zA9NXVjYnyYzE+mjC+z9u3qDTriOP
	UJPODL9i+ygQ9cc35wkzy8GOaOYZtglvmbJptZmJICsJB8WoVhWlirJfbx8sIwNvS8qq
	L+kQ==
Received: by 10.216.142.103 with SMTP id h81mr4175195wej.62.1335505017535;
	Thu, 26 Apr 2012 22:36:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h8sm3648387wix.4.2012.04.26.22.36.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 22:36:56 -0700 (PDT)
Date: Fri, 27 Apr 2012 07:36:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120427053659.GA3635@jama.jama.net>
References: <cover.1335498445.git.lianhao.lu@intel.com>
	<87b92e38deaa987f3d0917913a70438b8f404a32.1335498445.git.lianhao.lu@intel.com>
MIME-Version: 1.0
In-Reply-To: <87b92e38deaa987f3d0917913a70438b8f404a32.1335498445.git.lianhao.lu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 6/7] xorg-app: Use ${libdir} for packaging.
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
X-List-Received-Date: Fri, 27 Apr 2012 05:46:35 -0000
X-Groupsio-MsgNum: 21225
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline

--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 27, 2012 at 01:04:06PM +0800, Lianhao Lu wrote:
> Used ${libdir} instead of hard coded "/usr/lib" for packaging.
>=20
> Also included INC_PR in PR.
>=20
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb  |    2 +-
>  .../recipes-graphics/xorg-app/mkfontscale_1.1.0.bb |    2 ++
>  meta/recipes-graphics/xorg-app/x11perf_1.5.4.bb    |    2 +-
>  meta/recipes-graphics/xorg-app/xauth_1.0.6.bb      |    2 +-
>  meta/recipes-graphics/xorg-app/xdpyinfo_1.3.0.bb   |    2 +-
>  meta/recipes-graphics/xorg-app/xhost_1.0.4.bb      |    2 +-
>  meta/recipes-graphics/xorg-app/xinit_1.3.2.bb      |    2 +-
>  meta/recipes-graphics/xorg-app/xinput_1.5.3.bb     |    2 +-
>  meta/recipes-graphics/xorg-app/xkbcomp_1.2.3.bb    |    2 ++
>  meta/recipes-graphics/xorg-app/xmodmap_1.0.5.bb    |    2 +-
>  meta/recipes-graphics/xorg-app/xorg-app-common.inc |    4 ++--
>  meta/recipes-graphics/xorg-app/xprop_1.2.1.bb      |    2 +-
>  meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb     |    2 +-
>  meta/recipes-graphics/xorg-app/xset_1.2.2.bb       |    2 +-
>  meta/recipes-graphics/xorg-app/xvinfo_1.1.1.bb     |    1 +
>  meta/recipes-graphics/xorg-app/xwininfo_1.1.2.bb   |    2 +-
>  16 files changed, 19 insertions(+), 14 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb b/meta/rec=
ipes-graphics/xorg-app/mkfontdir_1.0.7.bb
> index db6d2b4..6637326 100644
> --- a/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb
> +++ b/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb
> @@ -9,7 +9,7 @@ The X server and font server use these files to find the =
available font \
>  files."
> =20
>  PE =3D "1"
> -PR =3D "r0"
> +PR =3D "${INC_PR}.0"
> =20
>  RDEPENDS_${PN} +=3D "mkfontscale"
>  RDEPENDS_${PN}_virtclass-native +=3D "mkfontscale-native"
> diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.1.0.bb b/meta/r=
ecipes-graphics/xorg-app/mkfontscale_1.1.0.bb
> index 49706e5..d98057b 100644
> --- a/meta/recipes-graphics/xorg-app/mkfontscale_1.1.0.bb
> +++ b/meta/recipes-graphics/xorg-app/mkfontscale_1.1.0.bb
> @@ -10,6 +10,8 @@ is used by the mkfontdir program."
> =20
>  DEPENDS +=3D " zlib libfontenc freetype virtual/libx11"
> =20
> +PR =3D "${INC_PR}.0"
> +
>  BBCLASSEXTEND =3D "native"
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2e0d129d05305176d1a790e0ac1ac=
b7f"
> diff --git a/meta/recipes-graphics/xorg-app/x11perf_1.5.4.bb b/meta/recip=
es-graphics/xorg-app/x11perf_1.5.4.bb
> index 15fa314..cc0b323 100644
> --- a/meta/recipes-graphics/xorg-app/x11perf_1.5.4.bb
> +++ b/meta/recipes-graphics/xorg-app/x11perf_1.5.4.bb
> @@ -11,7 +11,7 @@ DEPENDS +=3D "libxmu libxrender libxft libxext fontconf=
ig"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D428ca4d67a41fcd4fc3283dce9bbd=
a7e \
>                      file://x11perf.h;endline=3D24;md5=3D29555066baf406a1=
05ff917ac25b2d01"
> =20
> -PR =3D "r0"
> +PR =3D "${INC_PR}.0"
>  PE =3D "1"
> =20
>  FILES_${PN} +=3D "${libdir}/X11/x11perfcomp/*"
> diff --git a/meta/recipes-graphics/xorg-app/xauth_1.0.6.bb b/meta/recipes=
-graphics/xorg-app/xauth_1.0.6.bb
> index f00d30a..c43d0eb 100644
> --- a/meta/recipes-graphics/xorg-app/xauth_1.0.6.bb
> +++ b/meta/recipes-graphics/xorg-app/xauth_1.0.6.bb
> @@ -6,7 +6,7 @@ information used in connecting to the X server."
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5ec74dd7ea4d10c4715a7c44f159a=
40b"
> =20
>  DEPENDS +=3D "libxau libxext libxmu"
> -PR =3D "r0"
> +PR =3D "${INC_PR}.0"
>  PE =3D "1"
> =20
>  SRC_URI[md5sum] =3D "105f5b00bb9293b3db36f7e500d4f950"
> diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.0.bb b/meta/reci=
pes-graphics/xorg-app/xdpyinfo_1.3.0.bb
> index a118d0d..ae3cc8c 100644
> --- a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.0.bb
> +++ b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.0.bb
> @@ -10,7 +10,7 @@ that are available."
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df3d09e6b9e203a1af489e16c708f4=
fb3"
>  DEPENDS +=3D "libxtst libxext libxxf86vm libxxf86dga libxxf86misc libxi =
libxrender libxinerama libdmx libxp libxau"
> -PR =3D "r0"
> +PR =3D "${INC_PR}.0"
>  PE =3D "1"
> =20
>  SRC_URI +=3D "file://disable-xkb.patch"
> diff --git a/meta/recipes-graphics/xorg-app/xhost_1.0.4.bb b/meta/recipes=
-graphics/xorg-app/xhost_1.0.4.bb
> index 9330228..7a78f80 100644
> --- a/meta/recipes-graphics/xorg-app/xhost_1.0.4.bb
> +++ b/meta/recipes-graphics/xorg-app/xhost_1.0.4.bb
> @@ -11,7 +11,7 @@ protocol for passing other authentication data to the s=
erver."
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8fbed71dddf48541818cef8079124=
199"
>  DEPENDS +=3D "libxmu libxau"
> -PR =3D "r0"
> +PR =3D "${INC_PR}.0"
>  PE =3D "1"
> =20
>  SRC_URI[md5sum] =3D "2be663a0afbcc0856c1591477d5bf32a"
> diff --git a/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb b/meta/recipes=
-graphics/xorg-app/xinit_1.3.2.bb
> index cb3e028..2008e79 100644
> --- a/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
> +++ b/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
> @@ -10,7 +10,7 @@ then terminate."
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0d4b5eef75f1584ccbdc5e4a34314=
407"
> =20
> -PR =3D "r0"
> +PR =3D "${INC_PR}.0"
>  PE =3D "1"
> =20
>  SRC_URI[md5sum] =3D "9c0943cbd83e489ad1b05221b97efd44"
> diff --git a/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb b/meta/recipe=
s-graphics/xorg-app/xinput_1.5.3.bb
> index 8f17e9a..6790f60 100644
> --- a/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
> +++ b/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D22c34ea3613640=
7a77702a8b784f9bd0"
> =20
>  DEPENDS +=3D " libxi"
> =20
> -PR =3D "r7"
> +PR =3D "${INC_PR}.7"
> =20
>  SRC_URI[md5sum] =3D "1e2f0ad4f3fa833b65c568907f171d28"
>  SRC_URI[sha256sum] =3D "6aade131cecddaeefc39ddce1dd5e8473f6039c2e4efbfd9=
fbb5ee2a75885c76"
> diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.2.3.bb b/meta/recip=
es-graphics/xorg-app/xkbcomp_1.2.3.bb
> index d8b3e7a..f5f0870 100644
> --- a/meta/recipes-graphics/xorg-app/xkbcomp_1.2.3.bb
> +++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.2.3.bb
> @@ -9,6 +9,8 @@ be read directly by XKB-capable X servers or utilities."
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D08436e4f4476964e2e2dd7e7e41e0=
76a"
> =20
> +PR =3D "${INC_PR}.0"
> +
>  DEPENDS +=3D "libxkbfile"
> =20
>  SRC_URI[md5sum] =3D "35622a497894c1cff9182d42696c3e27"
> diff --git a/meta/recipes-graphics/xorg-app/xmodmap_1.0.5.bb b/meta/recip=
es-graphics/xorg-app/xmodmap_1.0.5.bb
> index e98ed4f..2c9ecde 100644
> --- a/meta/recipes-graphics/xorg-app/xmodmap_1.0.5.bb
> +++ b/meta/recipes-graphics/xorg-app/xmodmap_1.0.5.bb
> @@ -11,7 +11,7 @@ according to personal tastes."
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deef098b27f09d0ac39268df0cc2c0=
0b5"
> =20
> -PR =3D "r0"
> +PR =3D "${INC_PR}.0"
>  PE =3D "1"
> =20
>  SRC_URI[md5sum] =3D "b18850d373f3717dca569377c449d091"
> diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/re=
cipes-graphics/xorg-app/xorg-app-common.inc
> index 890648b..d0b4b65 100644
> --- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
> +++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
> @@ -5,7 +5,7 @@ SECTION =3D "x11/apps"
>  LICENSE =3D "MIT-X"
>  DEPENDS =3D "util-macros-native virtual/libx11"
> =20
> -INC_PR =3D "r7"
> +INC_PR =3D "r8"
> =20
>  SRC_URI =3D "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.bz2"
> =20
> @@ -13,4 +13,4 @@ S =3D "${WORKDIR}/${BPN}-${PV}"
> =20
>  inherit autotools pkgconfig
> =20
> -FILES_${PN} +=3D "  /usr/lib/X11/${BPN} /usr/share/X11/app-defaults/"
> +FILES_${PN} +=3D " ${libdir}/X11/${BPN} /usr/share/X11/app-defaults/"

when rebuilding every xorg-app, can we also change ${datadir} here ^^

Cheers,

> diff --git a/meta/recipes-graphics/xorg-app/xprop_1.2.1.bb b/meta/recipes=
-graphics/xorg-app/xprop_1.2.1.bb
> index 6c07230..c74beb4 100644
> --- a/meta/recipes-graphics/xorg-app/xprop_1.2.1.bb
> +++ b/meta/recipes-graphics/xorg-app/xprop_1.2.1.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De226ab8db88a=
c0bc0391673be40c9f91"
> =20
>  DEPENDS +=3D " libxmu virtual/libx11"
> =20
> -PR =3D "r0"
> +PR =3D "${INC_PR}.0"
>  PE =3D "1"
> =20
>  SRC_URI[md5sum] =3D "d5529dc8d811efabd136ca2d8e857deb"
> diff --git a/meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb b/meta/recipe=
s-graphics/xorg-app/xrandr_1.3.5.bb
> index 4410865..da83e8f 100644
> --- a/meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb
> +++ b/meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb
> @@ -10,7 +10,7 @@ LICENSE=3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfe1608bdb33cf8c62a4438f7d3467=
9b3"
>  DEPENDS +=3D "libxrandr libxrender"
>  PE =3D "1"
> -PR =3D "r1"
> +PR =3D "${INC_PR}.1"
> =20
>  SRC_URI[md5sum] =3D "9735173a84dca9b05e06fd4686196b07"
>  SRC_URI[sha256sum] =3D "1059ff7a9ad0df8e00a765ffa4e08a505304c02663112da3=
70ac7082030b980e"
> diff --git a/meta/recipes-graphics/xorg-app/xset_1.2.2.bb b/meta/recipes-=
graphics/xorg-app/xset_1.2.2.bb
> index 7d5ac49..0430f8c 100644
> --- a/meta/recipes-graphics/xorg-app/xset_1.2.2.bb
> +++ b/meta/recipes-graphics/xorg-app/xset_1.2.2.bb
> @@ -8,7 +8,7 @@ preference options of the display."
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbea81cc9827cdf1af0e12c2b8228c=
f8d"
>  DEPENDS +=3D "libxext libxxf86misc libxfontcache libxmu libxp libxau"
> -PR =3D "r0"
> +PR =3D "${INC_PR}.0"
>  PE =3D "1"
> =20
>  SRC_URI +=3D "file://disable-xkb.patch"
> diff --git a/meta/recipes-graphics/xorg-app/xvinfo_1.1.1.bb b/meta/recipe=
s-graphics/xorg-app/xvinfo_1.1.1.bb
> index 7a0b822..66d2561 100644
> --- a/meta/recipes-graphics/xorg-app/xvinfo_1.1.1.bb
> +++ b/meta/recipes-graphics/xorg-app/xvinfo_1.1.1.bb
> @@ -9,6 +9,7 @@ extension."
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db664101ad7a1dc758a4c4109bf978=
e68"
>  DEPENDS +=3D " libxv"
>  PE =3D "1"
> +PR =3D "${INC_PR}.0"
> =20
>  SRC_URI[md5sum] =3D "c88feb501083951a8f47a21aaeb1529d"
>  SRC_URI[sha256sum] =3D "60c74aa190bcf1e244f6f1576dc43869018a8ed5ba319703=
a5c198d3466a3985"
> diff --git a/meta/recipes-graphics/xorg-app/xwininfo_1.1.2.bb b/meta/reci=
pes-graphics/xorg-app/xwininfo_1.1.2.bb
> index cbc4587..c033e2b 100644
> --- a/meta/recipes-graphics/xorg-app/xwininfo_1.1.2.bb
> +++ b/meta/recipes-graphics/xorg-app/xwininfo_1.1.2.bb
> @@ -9,7 +9,7 @@ and a number of other items."
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D78976cd3115f6faf615accc4e094d=
90e"
>  DEPENDS +=3D "libxext libxmu"
> =20
> -PR =3D "r0"
> +PR =3D "${INC_PR}.0"
>  PE =3D "0"
> =20
>  SRC_URI[md5sum] =3D "9e8b58c8aa6172e87ab4f9cf3612fedd"
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+aMHsACgkQN1Ujt2V2gBzpGQCgnWXQXMc4Q8SuYKlui9nXMlye
OFsAn2dNZLx2AiSyjXx+AAt+ncw1ccqn
=O7Vm
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
