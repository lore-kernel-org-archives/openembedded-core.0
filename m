Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037CCC67861
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 00:46:45 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.154235.1712710000657305653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 17:46:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iabijTFN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD41EC0002;
	Wed, 10 Apr 2024 00:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712709998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p5oq1Q+N6fpcs6IBW4h2j1w7vNLDXrFEpBaTZ8VkG4s=;
	b=iabijTFN+9yUajSJdmE/a3Xm9SCNy1DjZLIPd2yvIC5qeUkeo0XWTTI49BannLUthsoNSK
	2driHbuk3kfGCyXssZKCNxJCIPUFA+BwWvGwNIQwZhlfBOhQ7AvWd9IhFs/lKelaI+jFJL
	8svR1cHczWKRiCZAvt7KTqRjAYtA01cogJLXRIRAUbK2/Q4+J83kYIJy5Rol4DFhkE4pAE
	ggLHep1ptkQv2vFQydB1rmmLAmdrZAUzDEuWlc6cfjM8qqnzYHn0pD8kuW50m9dtQQZDcG
	XOnmccvz6DRUqWz5zYRLCyhb4o6VrDEWVnZ3B9T6+uhJhZY3WurtQRcS69v7aQ==
Date: Wed, 10 Apr 2024 02:46:37 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 09/33] ffmpeg: upgrade 6.1.1 -> 7.0
Message-ID: <202404100046376e4211fc@mail.local>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
 <1712646620-16608-9-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1712646620-16608-9-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 00:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198073

| ../gst-libav-1.22.11/ext/libav/gstavviddec.c: In function 'gst_ffmpegvidd=
ec_register':
| ../gst-libav-1.22.11/ext/libav/gstavviddec.c:2573:29: error: 'AV_CODEC_ID=
_AYUV' undeclared (first use in this function); did you mean 'AV_CODEC_ID_C=
YUV'?
|  2573 |         || in_plugin->id =3D=3D AV_CODEC_ID_AYUV
|       |                             ^~~~~~~~~~~~~~~~
|       |                             AV_CODEC_ID_CYUV
| ../gst-libav-1.22.11/ext/libav/gstavviddec.c:2573:29: note: each undeclar=
ed identifier is reported only once for each function it appears in
| [11/13] x86_64-poky-linux-gcc -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -=
mfpmath=3Dsse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -=
Wformat-security -Werror=3Dformat-security --sysroot=3D/home/pokybuild/yoct=
o-worker/reproducible/build/build-st/reproducibleA/tmp/work/core2-64-poky-l=
inux/gstreamer1.0-libav/1.22.11/recipe-sysroot -Iext/libav/libgstlibav.so.p=
 -Iext/libav -I../gst-libav-1.22.11/ext/libav -I. -I../gst-libav-1.22.11 -I=
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleA/tmp/=
work/core2-64-poky-linux/gstreamer1.0-libav/1.22.11/recipe-sysroot/usr/incl=
ude/gstreamer-1.0 -I/home/pokybuild/yocto-worker/reproducible/build/build-s=
t/reproducibleA/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.22.11/rec=
ipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/reproducibl=
e/build/build-st/reproducibleA/tmp/work/core2-64-poky-linux/gstreamer1.0-li=
bav/1.22.11/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yocto=
-worker/reproducible/build/build-st/reproducibleA/tmp/work/core2-64-poky-li=
nux/gstreamer1.0-libav/1.22.11/recipe-sysroot/usr/include/orc-0.4 -fdiagnos=
tics-color=3Dalways -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -fvisibili=
ty=3Dhidden -fno-strict-aliasing -Wmissing-declarations -Wmissing-prototype=
s -Wold-style-definition -Wredundant-decls -Wundef -Wwrite-strings -Wformat=
 -Wformat-nonliteral -Wformat-security -Winit-self -Wmissing-include-dirs -=
Waddress -Wno-multichar -Waggregate-return -Wvla -Wpointer-arith -O2 -pipe =
-g -feliminate-unused-debug-types -fcanon-prefix-map -fmacro-prefix-map=3D/=
home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleA/tmp/w=
ork/core2-64-poky-linux/gstreamer1.0-libav/1.22.11/gst-libav-1.22.11=3D/usr=
/src/debug/gstreamer1.0-libav/1.22.11 -fdebug-prefix-map=3D/home/pokybuild/=
yocto-worker/reproducible/build/build-st/reproducibleA/tmp/work/core2-64-po=
ky-linux/gstreamer1.0-libav/1.22.11/gst-libav-1.22.11=3D/usr/src/debug/gstr=
eamer1.0-libav/1.22.11 -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/re=
producible/build/build-st/reproducibleA/tmp/work/core2-64-poky-linux/gstrea=
mer1.0-libav/1.22.11/build=3D/usr/src/debug/gstreamer1.0-libav/1.22.11 -fde=
bug-prefix-map=3D/home/pokybuild/yocto-worker/reproducible/build/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.22.11/build=
=3D/usr/src/debug/gstreamer1.0-libav/1.22.11 -fdebug-prefix-map=3D/home/pok=
ybuild/yocto-worker/reproducible/build/build-st/reproducibleA/tmp/work/core=
2-64-poky-linux/gstreamer1.0-libav/1.22.11/recipe-sysroot=3D -fmacro-prefix=
-map=3D/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibl=
eA/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.22.11/recipe-sysroot=
=3D -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/reproducible/build/bu=
ild-st/reproducibleA/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.22.1=
1/recipe-sysroot-native=3D -fPIC -pthread -DHAVE_CONFIG_H -MD -MQ ext/libav=
/libgstlibav.so.p/gstavdeinterlace.c.o -MF ext/libav/libgstlibav.so.p/gstav=
deinterlace.c.o.d -o ext/libav/libgstlibav.so.p/gstavdeinterlace.c.o -c ../=
gst-libav-1.22.11/ext/libav/gstavdeinterlace.c
| [12/13] x86_64-poky-linux-gcc -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -=
mfpmath=3Dsse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -=
Wformat-security -Werror=3Dformat-security --sysroot=3D/home/pokybuild/yoct=
o-worker/reproducible/build/build-st/reproducibleA/tmp/work/core2-64-poky-l=
inux/gstreamer1.0-libav/1.22.11/recipe-sysroot -Iext/libav/libgstlibav.so.p=
 -Iext/libav -I../gst-libav-1.22.11/ext/libav -I. -I../gst-libav-1.22.11 -I=
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleA/tmp/=
work/core2-64-poky-linux/gstreamer1.0-libav/1.22.11/recipe-sysroot/usr/incl=
ude/gstreamer-1.0 -I/home/pokybuild/yocto-worker/reproducible/build/build-s=
t/reproducibleA/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.22.11/rec=
ipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/reproducibl=
e/build/build-st/reproducibleA/tmp/work/core2-64-poky-linux/gstreamer1.0-li=
bav/1.22.11/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yocto=
-worker/reproducible/build/build-st/reproducibleA/tmp/work/core2-64-poky-li=
nux/gstreamer1.0-libav/1.22.11/recipe-sysroot/usr/include/orc-0.4 -fdiagnos=
tics-color=3Dalways -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -fvisibili=
ty=3Dhidden -fno-strict-aliasing -Wmissing-declarations -Wmissing-prototype=
s -Wold-style-definition -Wredundant-decls -Wundef -Wwrite-strings -Wformat=
 -Wformat-nonliteral -Wformat-security -Winit-self -Wmissing-include-dirs -=
Waddress -Wno-multichar -Waggregate-return -Wvla -Wpointer-arith -O2 -pipe =
-g -feliminate-unused-debug-types -fcanon-prefix-map -fmacro-prefix-map=3D/=
home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleA/tmp/w=
ork/core2-64-poky-linux/gstreamer1.0-libav/1.22.11/gst-libav-1.22.11=3D/usr=
/src/debug/gstreamer1.0-libav/1.22.11 -fdebug-prefix-map=3D/home/pokybuild/=
yocto-worker/reproducible/build/build-st/reproducibleA/tmp/work/core2-64-po=
ky-linux/gstreamer1.0-libav/1.22.11/gst-libav-1.22.11=3D/usr/src/debug/gstr=
eamer1.0-libav/1.22.11 -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/re=
producible/build/build-st/reproducibleA/tmp/work/core2-64-poky-linux/gstrea=
mer1.0-libav/1.22.11/build=3D/usr/src/debug/gstreamer1.0-libav/1.22.11 -fde=
bug-prefix-map=3D/home/pokybuild/yocto-worker/reproducible/build/build-st/r=
eproducibleA/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.22.11/build=
=3D/usr/src/debug/gstreamer1.0-libav/1.22.11 -fdebug-prefix-map=3D/home/pok=
ybuild/yocto-worker/reproducible/build/build-st/reproducibleA/tmp/work/core=
2-64-poky-linux/gstreamer1.0-libav/1.22.11/recipe-sysroot=3D -fmacro-prefix=
-map=3D/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibl=
eA/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.22.11/recipe-sysroot=
=3D -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/reproducible/build/bu=
ild-st/reproducibleA/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.22.1=
1/recipe-sysroot-native=3D -fPIC -pthread -DHAVE_CONFIG_H -MD -MQ ext/libav=
/libgstlibav.so.p/gstavmux.c.o -MF ext/libav/libgstlibav.so.p/gstavmux.c.o.=
d -o ext/libav/libgstlibav.so.p/gstavmux.c.o -c ../gst-libav-1.22.11/ext/li=
bav/gstavmux.c
| ninja: build stopped: subcommand failed.
| INFO: autodetecting backend as ninja
| INFO: calculating backend command to run: /home/pokybuild/yocto-worker/re=
producible/build/build-st/reproducibleA/tmp/work/core2-64-poky-linux/gstrea=
mer1.0-libav/1.22.11/recipe-sysroot-native/usr/bin/ninja -j 16 -l 75.0 -v
| WARNING: /home/pokybuild/yocto-worker/reproducible/build/build-st/reprodu=
cibleA/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.22.11/temp/run.do_=
compile.1619925:153 exit 1 from 'meson compile -v -j 16 -l 75'
| WARNING: Backtrace (BB generated script):
| 	#1: meson_do_compile, /home/pokybuild/yocto-worker/reproducible/build/bu=
ild-st/reproducibleA/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.22.1=
1/temp/run.do_compile.1619925, line 153
| 	#2: do_compile, /home/pokybuild/yocto-worker/reproducible/build/build-st=
/reproducibleA/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.22.11/temp=
/run.do_compile.1619925, line 148
| 	#3: main, /home/pokybuild/yocto-worker/reproducible/build/build-st/repro=
ducibleA/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.22.11/temp/run.d=
o_compile.1619925, line 157
NOTE: recipe gstreamer1.0-libav-1.22.11-r0: task do_compile: Failed
ERROR: Task (/home/pokybuild/yocto-worker/reproducible/build/meta/recipes-m=
ultimedia/gstreamer/gstreamer1.0-libav_1.22.11.bb:do_compile) failed with e=
xit code '1'

On 09/04/2024 15:09:56+0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - enable gdigrab device to grab a window using the hwnd=3DHANDLER syntax
> - qrencode filter and qrencodesrc source
> - lavu/eval: introduce randomi() function in expressions
> - Change the default bitrate control method from VBR to CQP for QSV encod=
ers.
> - removed deprecated ffmpeg CLI options -psnr and -map_channel
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../ffmpeg/{ffmpeg_6.1.1.bb =3D> ffmpeg_7.0.bb}                   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-multimedia/ffmpeg/{ffmpeg_6.1.1.bb =3D> ffmpeg_7.0.b=
b} (99%)
>=20
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_7.0.bb
> similarity index 99%
> rename from meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
> rename to meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.bb
> index aa59755034..633f32bff0 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.bb
> @@ -24,7 +24,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.GPLv2;md5=3Db234ee=
4d69f5fce4486a80fdaf4a4263 \
> =20
>  SRC_URI =3D "https://www.ffmpeg.org/releases/${BP}.tar.xz"
> =20
> -SRC_URI[sha256sum] =3D "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a=
1f4ac0873616f968"
> +SRC_URI[sha256sum] =3D "4426a94dd2c814945456600c8adfc402bee65ec14a70e8c5=
31ec9a2cd651da7b"
> =20
>  # https://nvd.nist.gov/vuln/detail/CVE-2023-39018
>  # https://github.com/bramp/ffmpeg-cli-wrapper/issues/291
> --=20
> 2.34.1
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198024): https://lists.openembedded.org/g/openembedde=
d-core/message/198024
> Mute This Topic: https://lists.openembedded.org/mt/105417630/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

