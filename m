Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Re8KA-0005Da-Pr
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 17:50:27 +0100
Received: by wibhq7 with SMTP id hq7so3325551wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 08:43:19 -0800 (PST)
Received: by 10.180.106.165 with SMTP id gv5mr33739996wib.18.1324658598996;
	Fri, 23 Dec 2011 08:43:18 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ff10sm14276728wbb.6.2011.12.23.08.43.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Dec 2011 08:43:18 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Fri, 23 Dec 2011 17:43:16 +0100
In-Reply-To: <4921013d7801b45c81d7063dabeac31cf751c9d4.1324657801.git.shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <b3dad82177ad19a44f06edc4b857cb9697fa3950.1324657801.git.shane.wang@intel.com>
	<4921013d7801b45c81d7063dabeac31cf751c9d4.1324657801.git.shane.wang@intel.com>
Message-Id: <DE0EAE6B-EBB0-48EC-9B5A-76E6E2420030@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 06/14] gst-ffmpeg: upgrade to 0.10.13
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
X-List-Received-Date: Fri, 23 Dec 2011 16:50:27 -0000
X-Groupsio-MsgNum: 14758
Content-Type: multipart/signed;
	boundary="Apple-Mail=_AC0949C5-48F8-4EB0-A70C-C78BFF9F0C75";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_AC0949C5-48F8-4EB0-A70C-C78BFF9F0C75
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 23 dec. 2011, om 17:35 heeft Shane Wang het volgende geschreven:

> Signed-off-by: Shane Wang <shane.wang@intel.com>
> ---
> .../gst-ffmpeg-0.10.13/configure-fix.patch         |   20 =
++++++++++++++++++++
> .../lower-rank.diff                                |    0
> ...gst-ffmpeg_0.10.11.bb =3D> gst-ffmpeg_0.10.13.bb} |   19 =
++++++++++++-------
> 3 files changed, 32 insertions(+), 7 deletions(-)
> create mode 100644 =
meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch
> rename meta/recipes-multimedia/gstreamer/{gst-ffmpeg-0.10.11 =3D> =
gst-ffmpeg-0.10.13}/lower-rank.diff (100%)
> rename meta/recipes-multimedia/gstreamer/{gst-ffmpeg_0.10.11.bb =3D> =
gst-ffmpeg_0.10.13.bb} (58%)
>=20
> diff --git =
a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch=
 =
b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch=

> new file mode 100644
> index 0000000..81029ca
> --- /dev/null
> +++ =
b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch=

> @@ -0,0 +1,20 @@
> +Disable yasm for libav when --disable-yasm
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Shane Wang <shane.wang@intel.com>
> +
> +diff -r f2f8f74c6e30 configure.ac
> +--- a/configure.ac	Thu Dec 22 23:56:09 2011 +0800
> ++++ b/configure.ac	Thu Dec 22 23:57:37 2011 +0800
> +@@ -325,6 +325,10 @@
> +         --enable-gpl"
> +   fi
> +=20
> ++  if test "x$disable_yasm" !=3D "xyes"; then
> ++    embffmpeg_configure_args=3D"$embffmpeg_configure_args =
--disable-yasm"
> ++  fi
> ++
> +   # if we are cross-compiling, tell ffmpeg so
> +   target_os=3D`echo $host_os | sed 's/-gnu//'`
> +   if test "x$cross_compiling" =3D xyes; then
> diff --git =
a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.11/lower-rank.diff =
b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/lower-rank.diff
> similarity index 100%
> rename from =
meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.11/lower-rank.diff
> rename to =
meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/lower-rank.diff
> diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.11.bb =
b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> similarity index 58%
> rename from meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.11.bb
> rename to meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> index c3512e1..a1b7cbb 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.11.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> @@ -5,11 +5,11 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>                     =
file://ext/libpostproc/gstpostproc.c;beginline=3D1;endline=3D18;md5=3D5896=
e445e41681324381f5869ee33d38 \
>                     =
file://COPYING.LIB;md5=3D55ca817ccb7d5b5b66355690e9abc605 \
>                     =
file://ext/ffmpeg/gstffmpeg.h;beginline=3D1;endline=3D18;md5=3Dff65467b0c5=
3cdfa98d0684c1bc240a9 \
> -                    =
file://gst-libs/ext/ffmpeg/LICENSE;md5=3D524b5ee4bdbbf755ebbb76727ba80b0d =
\
> -                    =
file://gst-libs/ext/ffmpeg/COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263 \
> -                    =
file://gst-libs/ext/ffmpeg/COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80d47f=
ae504 \
> -                    =
file://gst-libs/ext/ffmpeg/COPYING.LGPLv2.1;md5=3De344c8fa836c3a41c4cbd79d=
7bd3a379 \
> -                    =
file://gst-libs/ext/ffmpeg/COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d9836802=
33ad02"
> +                    =
file://gst-libs/ext/libav/LICENSE;md5=3Dabc3b8cb02856aa7823bbbd162d16232 =
\
> +                    =
file://gst-libs/ext/libav/COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80fdaf4a=
4263 \
> +                    =
file://gst-libs/ext/libav/COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80d47fa=
e504 \
> +                    =
file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=3De344c8fa836c3a41c4cbd79d7=
bd3a379 \
> +                    =
file://gst-libs/ext/libav/COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d98368023=
3ad02"

What changed?

> HOMEPAGE =3D "http://www.gstreamer.net/"
> DEPENDS =3D "gstreamer gst-plugins-base zlib"
>=20
> @@ -17,15 +17,20 @@ inherit autotools pkgconfig
>=20
> SRC_URI =3D =
"http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
>            file://lower-rank.diff \
> +           file://configure-fix.patch \
> "
>=20
> -SRC_URI[md5sum] =3D "0d23197ba7ac06ea34fa66d38469ebe5"
> -SRC_URI[sha256sum] =3D =
"ff36a138e5af4ed8dcc459d6d6521fe66ed31ec29ba9a924dc3675c6749a692e"
> +SRC_URI[md5sum] =3D "7f5beacaf1312db2db30a026b36888c4"
> +SRC_URI[sha256sum] =3D =
"76fca05b08e00134e3cb92fa347507f42cbd48ddb08ed3343a912def187fbb62"
>=20
> PR =3D "r0"
>=20
> EXTRA_OECONF =3D "--with-ffmpeg-extra-configure=3D\"--target-os=3Dlinux\=
" "
>=20
> +# yasm not found, use --disable-yasm for a crippled build for libav
> +EXTRA_OECONF_append_x86-64 =3D " --disable-yasm "
> +EXTRA_OECONF_append_x86 =3D " --disable-yasm "

Since yasm is x86 only it should be safe go globally disable it, no? And =
a related question: why isn't this bulding against an external libav =
like OE-classic does?=

--Apple-Mail=_AC0949C5-48F8-4EB0-A70C-C78BFF9F0C75
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk70r6QACgkQMkyGM64RGpHX2wCgjyLylsIJRivgBjkQbjqbxgKU
mU4AmgK59mexQ0sfII+tBxErQXzMyazg
=Jv0L
-----END PGP SIGNATURE-----

--Apple-Mail=_AC0949C5-48F8-4EB0-A70C-C78BFF9F0C75--
