Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1ReM4A-0002dG-GT
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Dec 2011 08:30:51 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Dec 2011 23:23:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="50269539"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Dec 2011 23:23:40 -0800
Received: from pgsmsx151.gar.corp.intel.com (172.30.236.41) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sat, 24 Dec 2011 15:23:39 +0800
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	PGSMSX151.gar.corp.intel.com (172.30.236.41) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Sat, 24 Dec 2011 15:23:39 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.199]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.38]) with mapi id
	14.01.0355.002; Sat, 24 Dec 2011 15:23:38 +0800
From: "Wang, Shane" <shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 06/14] gst-ffmpeg: upgrade to 0.10.13
Thread-Index: AQHMwZIDWoUNnlAuH0iyUemuqhptOZXqlDgw
Date: Sat, 24 Dec 2011 07:23:37 +0000
Message-ID: <3AB6CE7F274E534CAFD089D127A8A1FC0104A0@SHSMSX102.ccr.corp.intel.com>
References: <b3dad82177ad19a44f06edc4b857cb9697fa3950.1324657801.git.shane.wang@intel.com>
	<4921013d7801b45c81d7063dabeac31cf751c9d4.1324657801.git.shane.wang@intel.com>
	<DE0EAE6B-EBB0-48EC-9B5A-76E6E2420030@dominion.thruhere.net>
In-Reply-To: <DE0EAE6B-EBB0-48EC-9B5A-76E6E2420030@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
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
X-List-Received-Date: Sat, 24 Dec 2011 07:30:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote on=A02011-12-24:

>=20
> Op 23 dec. 2011, om 17:35 heeft Shane Wang het volgende geschreven:
>=20
>> Signed-off-by: Shane Wang <shane.wang@intel.com> ---
>> .../gst-ffmpeg-0.10.13/configure-fix.patch         |   20
>> ++++++++++++++++++++ .../lower-rank.diff                              =20
>> |    0 ...gst-ffmpeg_0.10.11.bb =3D> gst-ffmpeg_0.10.13.bb} |   19
>> ++++++++++++------- 3 files changed, 32 insertions(+), 7 deletions(-)
>> create mode 100644
> meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patc
> h
>> rename meta/recipes-multimedia/gstreamer/{gst-ffmpeg-0.10.11 =3D>
>> gst-ffmpeg-0.10.13}/lower-rank.diff (100%) rename
>> meta/recipes-multimedia/gstreamer/{gst-ffmpeg_0.10.11.bb =3D>
>> gst-ffmpeg_0.10.13.bb} (58%)
>>=20
>> diff --git
> a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.pa
> tch
> b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.pa
> tch
>> new file mode 100644
>> index 0000000..81029ca
>> --- /dev/null
>> +++
> b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.pa
> tch
>> @@ -0,0 +1,20 @@ +Disable yasm for libav when --disable-yasm +
>> +Upstream-Status: Inappropriate [configuration] + +Signed-off-by: Shane
>> Wang <shane.wang@intel.com> + +diff -r f2f8f74c6e30 configure.ac +---
>> a/configure.ac	Thu Dec 22 23:56:09 2011 +0800 ++++ b/configure.ac	Thu
>> Dec 22 23:57:37 2011 +0800 +@@ -325,6 +325,10 @@ +       =20
>> --enable-gpl" +   fi + ++  if test "x$disable_yasm" !=3D "xyes"; then ++=
=20
>>   embffmpeg_configure_args=3D"$embffmpeg_configure_args --disable-yasm"
>> ++  fi ++ +   # if we are cross-compiling, tell ffmpeg so + =20
>> target_os=3D`echo $host_os | sed 's/-gnu//'` +   if test
>> "x$cross_compiling" =3D xyes; then diff --git
> a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.11/lower-rank.diff
> b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/lower-rank.diff
>> similarity index 100% rename from
>> meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.11/lower-rank.diff
>> rename to
>> meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/lower-rank.diff
>> diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.11.bb
>> b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb similarity
>> index 58% rename from
>> meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.11.bb rename to
>> meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb index
>> c3512e1..a1b7cbb 100644 ---
>> a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.11.bb +++
>> b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb @@ -5,11
>> +5,11 @@ LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>>=20
> file://ext/libpostproc/gstpostproc.c;beginline=3D1;endline=3D18;md5=3D589=
6e445
> e41681324381f5869ee33d38 \
>>=20
>> file://COPYING.LIB;md5=3D55ca817ccb7d5b5b66355690e9abc605 \
>>=20
> file://ext/ffmpeg/gstffmpeg.h;beginline=3D1;endline=3D18;md5=3Dff65467b0c=
53cd
> fa98d0684c1bc240a9 \
>> -
> file://gst-libs/ext/ffmpeg/LICENSE;md5=3D524b5ee4bdbbf755ebbb76727ba80
> b0d \
>> -
> file://gst-libs/ext/ffmpeg/COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80fd
> af4a4263 \
>> -
> file://gst-libs/ext/ffmpeg/COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80
> d47fae504 \
>> -
> file://gst-libs/ext/ffmpeg/COPYING.LGPLv2.1;md5=3De344c8fa836c3a41c4cbd
> 79d7bd3a379 \
>> -
> file://gst-libs/ext/ffmpeg/COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d983
> 680233ad02"
>> +
> file://gst-libs/ext/libav/LICENSE;md5=3Dabc3b8cb02856aa7823bbbd162d1623
> 2 \
>> +
> file://gst-libs/ext/libav/COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80fdaf
> 4a4263 \
>> +
> file://gst-libs/ext/libav/COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80d4
> 7fae504 \
>> +
> file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=3De344c8fa836c3a41c4cbd79
> d7bd3a379 \
>> +
> file://gst-libs/ext/libav/COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d98368
> 0233ad02"
>=20
> What changed?
>=20

For the five, ffmpeg doesn't exist, so I used libav, four of them are the s=
ame.
For LICENSE, the diff is:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
1,2c1,2
< FFmpeg:
< -------
---
> Libav:
> ------
4c4
< Most files in FFmpeg are under the GNU Lesser General Public License vers=
ion 2.1
---
> Most files in Libav are under the GNU Lesser General Public License versi=
on 2.1
7c7
< FFmpeg.
---
> Libav.
9c9
< Some optional parts of FFmpeg are licensed under the GNU General Public L=
icense
---
> Some optional parts of Libav are licensed under the GNU General Public Li=
cense
12c12
< configure to activate them. In this case, FFmpeg's license changes to GPL=
 v2+.
---
> configure to activate them. In this case, Libav's license changes to GPL =
v2+.
14c14
< Specifically, the GPL parts of FFmpeg are
---
> Specifically, the GPL parts of Libav are
17,18d16
< - optional MMX optimizations for YUV to RGB colorspace conversion in
<   libswscale/x86/yuv2rgb_template.c
20,21d17
<   libavcodec/x86/h264_deblock_sse2.asm
<   libavcodec/x86/h264_idct_sse2.asm
40c36
< conjunction with FFmpeg. They require --enable-gpl to be passed to config=
ure
---
> conjunction with Libav. They require --enable-gpl to be passed to configu=
re
45c41
< those licenses. So to combine the OpenCORE libraries with FFmpeg, the lic=
ense
---
> those licenses. So to combine the OpenCORE libraries with Libav, the lice=
nse
48c44
< The nonfree external library libfaac can be hooked up in FFmpeg. You need=
 to
---
> The nonfree external library libfaac can be hooked up in Libav. You need =
to
50c46
< as FFmpeg then becomes nonfree and unredistributable.
---
> as Libav then becomes nonfree and unredistributable.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D



>> HOMEPAGE =3D "http://www.gstreamer.net/"
>> DEPENDS =3D "gstreamer gst-plugins-base zlib"
>>=20
>> @@ -17,15 +17,20 @@ inherit autotools pkgconfig
>>=20
>> SRC_URI =3D
> "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
>>            file://lower-rank.diff \
>> +           file://configure-fix.patch \
>> "
>>=20
>> -SRC_URI[md5sum] =3D "0d23197ba7ac06ea34fa66d38469ebe5"
>> -SRC_URI[sha256sum] =3D
> "ff36a138e5af4ed8dcc459d6d6521fe66ed31ec29ba9a924dc3675c6749a692
> e"
>> +SRC_URI[md5sum] =3D "7f5beacaf1312db2db30a026b36888c4"
>> +SRC_URI[sha256sum] =3D
> "76fca05b08e00134e3cb92fa347507f42cbd48ddb08ed3343a912def187fbb6
> 2"
>>=20
>> PR =3D "r0"
>>=20
>> EXTRA_OECONF =3D "--with-ffmpeg-extra-configure=3D\"--target-os=3Dlinux\=
" "
>>=20
>> +# yasm not found, use --disable-yasm for a crippled build for libav
>> +EXTRA_OECONF_append_x86-64 =3D " --disable-yasm "
>> +EXTRA_OECONF_append_x86 =3D " --disable-yasm "
>=20
> Since yasm is x86 only it should be safe go globally disable it, no? And =
a
> related question: why isn't this bulding against an external libav like
> OE-classic does?

Libav recipe in OE doesn't disable yasm globally. So I didn't.
The answer for the second question: the tar bar for the new version of gst-=
ffmpeg contains libav code and its configure in ffmpeg's configure.ac

--
Shane


