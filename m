Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id AD87B74743
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 07:42:43 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id v14-v6so16855662wro.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 00:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4Mv4zk3mUx3tq5jUeYF/bpyFSJB0Rh6/1p1+idJ+I+8=;
	b=mvVEcCzg5S+zdoVyxkqYjPtWrxjWP9W7ifFHoThz2FCjAiW89McgZpMiCZfJ9XIWIx
	fUJTfqPnkXK8xWAzCFWsHDfzwiGV/YOeNKLobTwxT4IuQg7L0GodN6KYFDiQqHhgyHVJ
	BswxAwozr4nyaSTrA0e+JyaUMVl1vZGW1MwW3GIWKyt8r33apHIMe+mMoBIeLlyHyhr4
	xEzIRePS587SYABc251I6rlo3FUGUJ7fe7KdSiYQS726fRl3hovth6GIVc/muDGcz0g2
	Byy5Yy+pTSk+lfAjpap6CXRVkyw1L5y5BkJVuJ9go+Qx4n1nSO5qcjMgX6ruOuyAaDRG
	3RPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4Mv4zk3mUx3tq5jUeYF/bpyFSJB0Rh6/1p1+idJ+I+8=;
	b=Itu379K5O6Togw+dewl1mcoLHHbhiyqPQ33R6p8+nZvjH0lAp4vtIS8W3gKGl6Kwjl
	SDJgFTeWGSvpk8Aqt3N85ddEdEuvJy6JgEa8Vt0zNbARjiIo/A+TC08EqGJSdt1Cat/r
	l1laWn4/UrqcZfWZQz2hmwd+NvPNYbLUGKw5/g6u6kLquiSieaX8XFW54zVM3pm9CPiE
	6jlfwKO7shLFvayYVtP32DKfdxnjemLktSRgxBvZUdWHaHa8rwuQXmzB+vgMlnTkG0T0
	nCN49GXMxIEP8Nil9GtJtS/7DxT/60LRxBYmhu5bj+GYD5wPtAIRQPXs02mB+7pRA3yX
	SDBA==
X-Gm-Message-State: AOUpUlFdiOYOLCYGfPBBoaTXDT2CnMkjFK9CmH4gvO0eOXlb3IRcsvvs
	xQpoTWEJsD3QhI4yeSw3TMXzpp2u5fcvDXSrOb6Hww==
X-Google-Smtp-Source: AAOMgpeqFWIlxbOB9ruyQ0NaIOPyKOkQWNH82gwyHmEf2O5wegjGt/CjKvXUPlqDE3COmJQb6DPoa2VtOPTm6M/Zl8Q=
X-Received: by 2002:adf:f50e:: with SMTP id
	q14-v6mr7205737wro.241.1532331764411; 
	Mon, 23 Jul 2018 00:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20180721092402.20271-1-dv@pseudoterminal.org>
	<20180721092402.20271-3-dv@pseudoterminal.org>
In-Reply-To: <20180721092402.20271-3-dv@pseudoterminal.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 23 Jul 2018 09:42:33 +0200
Message-ID: <CA+chaQcf7g82QFVs-gizWtyn84SoLCL02tgFgdOo-A07utynxQ@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 3/6] gstreamer1.0-plugin-bad: Update packageconfigs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jul 2018 07:42:44 -0000
Content-Type: multipart/alternative; boundary="0000000000007ef3120571a5ca56"

--0000000000007ef3120571a5ca56
Content-Type: text/plain; charset="UTF-8"

--disable-neon is already there from neon PACKAGECONFIG you shouldn't add
it in EXTRA_OECONF, the comment about dependency gone would also make more
sense above PACKAGECONFIG not above EXTRA_OECONF.

On Sat, Jul 21, 2018 at 11:24 AM Carlos Rafael Giani <dv@pseudoterminal.org>
wrote:

> * Add packageconfigs for gl, libde265, lcms2, openh264, tinyalsa, ttml,
>   webrtc, webrtcdsp
> * Add note about neon being dead (and --disable-neon config switch)
> * Remove unnecessary gstglconfig.h line, since that file is no longer
>   part of -bad (it is in -base now)
> * Update EXTRA_OECONF flags, since new plugins got added to -bad
> * Add ttml to the default packageconfigs since its dependencies are
>   all in oe-core
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  .../gstreamer1.0-plugins-bad_1.14.1.bb        | 35 ++++++++++++++-----
>  1 file changed, 26 insertions(+), 9 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.14.1.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.14.1.bb
> index 0e477e5a9c..721df60b8d 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bb
> @@ -27,9 +27,14 @@ PACKAGECONFIG ??= " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}
> \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}
> \
> -    bz2 curl dash dtls hls rsvg sbc smoothstreaming sndfile uvch264 webp \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
> +    bz2 curl dash dtls hls rsvg sbc smoothstreaming sndfile ttml uvch264
> webp \
>  "
>
> +# the gl packageconfig enables OpenGL elements that haven't been ported
> +# to -base yet. They depend on the gstgl library in -base, so we do
> +# not add GL dependencies here, since these are taken care of in -base.
> +
>  PACKAGECONFIG[assrender]       =
> "--enable-assrender,--disable-assrender,libass"
>  PACKAGECONFIG[bluez]           = "--enable-bluez,--disable-bluez,${BLUEZ}"
>  PACKAGECONFIG[bz2]             = "--enable-bz2,--disable-bz2,bzip2"
> @@ -43,13 +48,17 @@ PACKAGECONFIG[faad]            =
> "--enable-faad,--disable-faad,faad2"
>  PACKAGECONFIG[flite]           =
> "--enable-flite,--disable-flite,flite-alsa"
>  PACKAGECONFIG[fluidsynth]      =
> "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
>  PACKAGECONFIG[hls]             = "--enable-hls
> --with-hls-crypto=nettle,--disable-hls,nettle"
> +PACKAGECONFIG[gl]              = "--enable-gl,--disable-gl,"
>  PACKAGECONFIG[kms]             = "--enable-kms,--disable-kms,libdrm"
> +PACKAGECONFIG[libde265]        =
> "--enable-libde265,--disable-libde265,libde265"
>  PACKAGECONFIG[libmms]          = "--enable-libmms,--disable-libmms,libmms"
>  PACKAGECONFIG[libssh2]         =
> "--enable-libssh2,--disable-libssh2,libssh2"
> +PACKAGECONFIG[lcms2]           = "--enable-lcms2,--disable-lcms2,lcms"
>  PACKAGECONFIG[modplug]         =
> "--enable-modplug,--disable-modplug,libmodplug"
>  PACKAGECONFIG[neon]            = "--enable-neon,--disable-neon,neon"
>  PACKAGECONFIG[openal]          =
> "--enable-openal,--disable-openal,openal-soft"
>  PACKAGECONFIG[opencv]          = "--enable-opencv,--disable-opencv,opencv"
> +PACKAGECONFIG[openh264]        =
> "--enable-openh264,--disable-openh264,openh264"
>  PACKAGECONFIG[openjpeg]        =
> "--enable-openjpeg,--disable-openjpeg,openjpeg"
>  # the opus encoder/decoder elements are now in the -base package,
>  # but the opus parser remains in -bad
> @@ -61,28 +70,38 @@ PACKAGECONFIG[sbc]             =
> "--enable-sbc,--disable-sbc,sbc"
>  PACKAGECONFIG[smoothstreaming] =
> "--enable-smoothstreaming,--disable-smoothstreaming,libxml2"
>  PACKAGECONFIG[sndfile]         =
> "--enable-sndfile,--disable-sndfile,libsndfile1"
>  PACKAGECONFIG[srtp]            = "--enable-srtp,--disable-srtp,libsrtp"
> +PACKAGECONFIG[tinyalsa]        =
> "--enable-tinyalsa,--disable-tinyalsa,tinyalsa"
> +PACKAGECONFIG[ttml]            = "--enable-ttml,--disable-ttml,libxml2
> pango cairo"
>  PACKAGECONFIG[uvch264]         =
> "--enable-uvch264,--disable-uvch264,libusb1 libgudev"
>  PACKAGECONFIG[voaacenc]        =
> "--enable-voaacenc,--disable-voaacenc,vo-aacenc"
>  PACKAGECONFIG[voamrwbenc]      =
> "--enable-voamrwbenc,--disable-voamrwbenc,vo-amrwbenc"
>  PACKAGECONFIG[vulkan]          = "--enable-vulkan,--disable-vulkan,vulkan"
>  PACKAGECONFIG[wayland]         =
> "--enable-wayland,--disable-wayland,wayland-native wayland
> wayland-protocols libdrm"
>  PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
> +PACKAGECONFIG[webrtc]          =
> "--enable-webrtc,--disable-webrtc,libnice"
> +PACKAGECONFIG[webrtcdsp]       =
> "--enable-webrtcdsp,--disable-webrtcdsp,webrtc-audio-processing"
>
>  # these plugins have no corresponding library in OE-core or
> meta-openembedded:
>  #   openni2 winks direct3d directsound winscreencap acm apple_media iqa
> -#   android_media avc bs2b chromaprint daala dts fdkaac gme gsm kate
> ladspa libde265
> -#   lv2 mpeg2enc mplex msdk musepack nvenc ofa openh264 opensles
> soundtouch spandsp
> -#   spc teletextdec tinyalsa vdpau wasapi x265 zbar webrtcdsp
> +#   android_media avc bs2b chromaprint daala dts fdkaac gme gsm kate
> ladspa
> +#   lv2 mpeg2enc mplex msdk musepack nvenc ofa openmpt opensles soundtouch
> +#   spandsp spc teletextdec vdpau wasapi x265 zbar
> +
> +# these plugins have been removed from oe-core because their upstream
> dependencies
> +# are no longer maintained or available:
> +#   neon
>
>  EXTRA_OECONF += " \
>      --enable-decklink \
>      --enable-dvb \
>      --enable-fbdev \
> +    --enable-ipcpipeline \
>      --enable-netsim \
>      --enable-shm \
>      --enable-vcd \
>      --disable-acm \
>      --disable-android_media \
> +    --disable-aom \
>      --disable-apple_media \
>      --disable-avc \
>      --disable-bs2b \
> @@ -97,26 +116,25 @@ EXTRA_OECONF += " \
>      --disable-iqa \
>      --disable-kate \
>      --disable-ladspa \
> -    --disable-libde265 \
>      --disable-lv2 \
>      --disable-mpeg2enc \
>      --disable-mplex \
>      --disable-msdk \
>      --disable-musepack \
> +    --disable-neon \
>      --disable-nvenc \
>      --disable-ofa \
>      --disable-openexr \
> -    --disable-openh264 \
> +    --disable-openmpt \
>      --disable-openni2 \
>      --disable-opensles \
>      --disable-soundtouch \
>      --disable-spandsp \
>      --disable-spc \
> +    --disable-srt \
>      --disable-teletextdec \
> -    --disable-tinyalsa \
>      --disable-vdpau \
>      --disable-wasapi \
> -    --disable-webrtcdsp \
>      --disable-wildmidi \
>      --disable-winks \
>      --disable-winscreencap \
> @@ -130,7 +148,6 @@ export OPENCV_PREFIX = "${STAGING_DIR_TARGET}${prefix}"
>  ARM_INSTRUCTION_SET_armv4 = "arm"
>  ARM_INSTRUCTION_SET_armv5 = "arm"
>
> -FILES_${PN}-dev +=
> "${libdir}/gstreamer-${LIBV}/include/gst/gl/gstglconfig.h"
>  FILES_${PN}-freeverb +=
> "${datadir}/gstreamer-${LIBV}/presets/GstFreeverb.prs"
>  FILES_${PN}-opencv += "${datadir}/gst-plugins-bad/${LIBV}/opencv*"
>  FILES_${PN}-voamrwbenc +=
> "${datadir}/gstreamer-${LIBV}/presets/GstVoAmrwbEnc.prs"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000007ef3120571a5ca56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">--disable-neon is already there from neon PACKAGECONFIG yo=
u shouldn&#39;t add it in EXTRA_OECONF, the comment about dependency gone w=
ould also make more sense above PACKAGECONFIG not above EXTRA_OECONF.</div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sat, Jul 21, 2018 at 11:=
24 AM Carlos Rafael Giani &lt;<a href=3D"mailto:dv@pseudoterminal.org">dv@p=
seudoterminal.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">* =
Add packageconfigs for gl, libde265, lcms2, openh264, tinyalsa, ttml,<br>
=C2=A0 webrtc, webrtcdsp<br>
* Add note about neon being dead (and --disable-neon config switch)<br>
* Remove unnecessary gstglconfig.h line, since that file is no longer<br>
=C2=A0 part of -bad (it is in -base now)<br>
* Update EXTRA_OECONF flags, since new plugins got added to -bad<br>
* Add ttml to the default packageconfigs since its dependencies are<br>
=C2=A0 all in oe-core<br>
<br>
Signed-off-by: Carlos Rafael Giani &lt;<a href=3D"mailto:dv@pseudoterminal.=
org" target=3D"_blank">dv@pseudoterminal.org</a>&gt;<br>
---<br>
=C2=A0.../<a href=3D"http://gstreamer1.0-plugins-bad_1.14.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">gstreamer1.0-plugins-bad_1.14.1.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 35 ++++++++++++++-----<br>
=C2=A01 file changed, 26 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-plugins-bad_1.14.1.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0=
-plugins-bad_1.14.1.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D"h=
ttp://gstreamer1.0-plugins-bad_1.14.1.bb" rel=3D"noreferrer" target=3D"_bla=
nk">gstreamer1.0-plugins-bad_1.14.1.bb</a><br>
index 0e477e5a9c..721df60b8d 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-bad_1.14.1.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugin=
s-bad_1.14.1.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-bad_1.14.1.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugin=
s-bad_1.14.1.bb</a><br>
@@ -27,9 +27,14 @@ PACKAGECONFIG ??=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bl=
uetooth&#39;, &#39;bluez&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;dire=
ctfb vulkan&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;wa=
yland&#39;, &#39;wayland&#39;, &#39;&#39;, d)} \<br>
-=C2=A0 =C2=A0 bz2 curl dash dtls hls rsvg sbc smoothstreaming sndfile uvch=
264 webp \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl&=
#39;, &#39;gl&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 bz2 curl dash dtls hls rsvg sbc smoothstreaming sndfile ttml=
 uvch264 webp \<br>
=C2=A0&quot;<br>
<br>
+# the gl packageconfig enables OpenGL elements that haven&#39;t been porte=
d<br>
+# to -base yet. They depend on the gstgl library in -base, so we do<br>
+# not add GL dependencies here, since these are taken care of in -base.<br=
>
+<br>
=C2=A0PACKAGECONFIG[assrender]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable=
-assrender,--disable-assrender,libass&quot;<br>
=C2=A0PACKAGECONFIG[bluez]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quo=
t;--enable-bluez,--disable-bluez,${BLUEZ}&quot;<br>
=C2=A0PACKAGECONFIG[bz2]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 &quot;--enable-bz2,--disable-bz2,bzip2&quot;<br>
@@ -43,13 +48,17 @@ PACKAGECONFIG[faad]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D &quot;--enable-faad,--disable-faad,faad2&quot;<br>
=C2=A0PACKAGECONFIG[flite]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quo=
t;--enable-flite,--disable-flite,flite-alsa&quot;<br>
=C2=A0PACKAGECONFIG[fluidsynth]=C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-flui=
dsynth,--disable-fluidsynth,fluidsynth&quot;<br>
=C2=A0PACKAGECONFIG[hls]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 &quot;--enable-hls --with-hls-crypto=3Dnettle,--disable-hls,nettle&quot;<b=
r>
+PACKAGECONFIG[gl]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quo=
t;--enable-gl,--disable-gl,&quot;<br>
=C2=A0PACKAGECONFIG[kms]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 &quot;--enable-kms,--disable-kms,libdrm&quot;<br>
+PACKAGECONFIG[libde265]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-libd=
e265,--disable-libde265,libde265&quot;<br>
=C2=A0PACKAGECONFIG[libmms]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--e=
nable-libmms,--disable-libmms,libmms&quot;<br>
=C2=A0PACKAGECONFIG[libssh2]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--e=
nable-libssh2,--disable-libssh2,libssh2&quot;<br>
+PACKAGECONFIG[lcms2]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--e=
nable-lcms2,--disable-lcms2,lcms&quot;<br>
=C2=A0PACKAGECONFIG[modplug]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--e=
nable-modplug,--disable-modplug,libmodplug&quot;<br>
=C2=A0PACKAGECONFIG[neon]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quo=
t;--enable-neon,--disable-neon,neon&quot;<br>
=C2=A0PACKAGECONFIG[openal]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--e=
nable-openal,--disable-openal,openal-soft&quot;<br>
=C2=A0PACKAGECONFIG[opencv]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--e=
nable-opencv,--disable-opencv,opencv&quot;<br>
+PACKAGECONFIG[openh264]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-open=
h264,--disable-openh264,openh264&quot;<br>
=C2=A0PACKAGECONFIG[openjpeg]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable=
-openjpeg,--disable-openjpeg,openjpeg&quot;<br>
=C2=A0# the opus encoder/decoder elements are now in the -base package,<br>
=C2=A0# but the opus parser remains in -bad<br>
@@ -61,28 +70,38 @@ PACKAGECONFIG[sbc]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;--enable-sbc,--disable-sbc,sbc&quot;<br>
=C2=A0PACKAGECONFIG[smoothstreaming] =3D &quot;--enable-smoothstreaming,--d=
isable-smoothstreaming,libxml2&quot;<br>
=C2=A0PACKAGECONFIG[sndfile]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--e=
nable-sndfile,--disable-sndfile,libsndfile1&quot;<br>
=C2=A0PACKAGECONFIG[srtp]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quo=
t;--enable-srtp,--disable-srtp,libsrtp&quot;<br>
+PACKAGECONFIG[tinyalsa]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-tiny=
alsa,--disable-tinyalsa,tinyalsa&quot;<br>
+PACKAGECONFIG[ttml]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--e=
nable-ttml,--disable-ttml,libxml2 pango cairo&quot;<br>
=C2=A0PACKAGECONFIG[uvch264]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--e=
nable-uvch264,--disable-uvch264,libusb1 libgudev&quot;<br>
=C2=A0PACKAGECONFIG[voaacenc]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable=
-voaacenc,--disable-voaacenc,vo-aacenc&quot;<br>
=C2=A0PACKAGECONFIG[voamrwbenc]=C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-voam=
rwbenc,--disable-voamrwbenc,vo-amrwbenc&quot;<br>
=C2=A0PACKAGECONFIG[vulkan]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--e=
nable-vulkan,--disable-vulkan,vulkan&quot;<br>
=C2=A0PACKAGECONFIG[wayland]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--e=
nable-wayland,--disable-wayland,wayland-native wayland wayland-protocols li=
bdrm&quot;<br>
=C2=A0PACKAGECONFIG[webp]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quo=
t;--enable-webp,--disable-webp,libwebp&quot;<br>
+PACKAGECONFIG[webrtc]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable=
-webrtc,--disable-webrtc,libnice&quot;<br>
+PACKAGECONFIG[webrtcdsp]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-webr=
tcdsp,--disable-webrtcdsp,webrtc-audio-processing&quot;<br>
<br>
=C2=A0# these plugins have no corresponding library in OE-core or meta-open=
embedded:<br>
=C2=A0#=C2=A0 =C2=A0openni2 winks direct3d directsound winscreencap acm app=
le_media iqa<br>
-#=C2=A0 =C2=A0android_media avc bs2b chromaprint daala dts fdkaac gme gsm =
kate ladspa libde265<br>
-#=C2=A0 =C2=A0lv2 mpeg2enc mplex msdk musepack nvenc ofa openh264 opensles=
 soundtouch spandsp<br>
-#=C2=A0 =C2=A0spc teletextdec tinyalsa vdpau wasapi x265 zbar webrtcdsp<br=
>
+#=C2=A0 =C2=A0android_media avc bs2b chromaprint daala dts fdkaac gme gsm =
kate ladspa<br>
+#=C2=A0 =C2=A0lv2 mpeg2enc mplex msdk musepack nvenc ofa openmpt opensles =
soundtouch<br>
+#=C2=A0 =C2=A0spandsp spc teletextdec vdpau wasapi x265 zbar<br>
+<br>
+# these plugins have been removed from oe-core because their upstream depe=
ndencies<br>
+# are no longer maintained or available:<br>
+#=C2=A0 =C2=A0neon<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0--enable-decklink \<br>
=C2=A0 =C2=A0 =C2=A0--enable-dvb \<br>
=C2=A0 =C2=A0 =C2=A0--enable-fbdev \<br>
+=C2=A0 =C2=A0 --enable-ipcpipeline \<br>
=C2=A0 =C2=A0 =C2=A0--enable-netsim \<br>
=C2=A0 =C2=A0 =C2=A0--enable-shm \<br>
=C2=A0 =C2=A0 =C2=A0--enable-vcd \<br>
=C2=A0 =C2=A0 =C2=A0--disable-acm \<br>
=C2=A0 =C2=A0 =C2=A0--disable-android_media \<br>
+=C2=A0 =C2=A0 --disable-aom \<br>
=C2=A0 =C2=A0 =C2=A0--disable-apple_media \<br>
=C2=A0 =C2=A0 =C2=A0--disable-avc \<br>
=C2=A0 =C2=A0 =C2=A0--disable-bs2b \<br>
@@ -97,26 +116,25 @@ EXTRA_OECONF +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0--disable-iqa \<br>
=C2=A0 =C2=A0 =C2=A0--disable-kate \<br>
=C2=A0 =C2=A0 =C2=A0--disable-ladspa \<br>
-=C2=A0 =C2=A0 --disable-libde265 \<br>
=C2=A0 =C2=A0 =C2=A0--disable-lv2 \<br>
=C2=A0 =C2=A0 =C2=A0--disable-mpeg2enc \<br>
=C2=A0 =C2=A0 =C2=A0--disable-mplex \<br>
=C2=A0 =C2=A0 =C2=A0--disable-msdk \<br>
=C2=A0 =C2=A0 =C2=A0--disable-musepack \<br>
+=C2=A0 =C2=A0 --disable-neon \<br>
=C2=A0 =C2=A0 =C2=A0--disable-nvenc \<br>
=C2=A0 =C2=A0 =C2=A0--disable-ofa \<br>
=C2=A0 =C2=A0 =C2=A0--disable-openexr \<br>
-=C2=A0 =C2=A0 --disable-openh264 \<br>
+=C2=A0 =C2=A0 --disable-openmpt \<br>
=C2=A0 =C2=A0 =C2=A0--disable-openni2 \<br>
=C2=A0 =C2=A0 =C2=A0--disable-opensles \<br>
=C2=A0 =C2=A0 =C2=A0--disable-soundtouch \<br>
=C2=A0 =C2=A0 =C2=A0--disable-spandsp \<br>
=C2=A0 =C2=A0 =C2=A0--disable-spc \<br>
+=C2=A0 =C2=A0 --disable-srt \<br>
=C2=A0 =C2=A0 =C2=A0--disable-teletextdec \<br>
-=C2=A0 =C2=A0 --disable-tinyalsa \<br>
=C2=A0 =C2=A0 =C2=A0--disable-vdpau \<br>
=C2=A0 =C2=A0 =C2=A0--disable-wasapi \<br>
-=C2=A0 =C2=A0 --disable-webrtcdsp \<br>
=C2=A0 =C2=A0 =C2=A0--disable-wildmidi \<br>
=C2=A0 =C2=A0 =C2=A0--disable-winks \<br>
=C2=A0 =C2=A0 =C2=A0--disable-winscreencap \<br>
@@ -130,7 +148,6 @@ export OPENCV_PREFIX =3D &quot;${STAGING_DIR_TARGET}${p=
refix}&quot;<br>
=C2=A0ARM_INSTRUCTION_SET_armv4 =3D &quot;arm&quot;<br>
=C2=A0ARM_INSTRUCTION_SET_armv5 =3D &quot;arm&quot;<br>
<br>
-FILES_${PN}-dev +=3D &quot;${libdir}/gstreamer-${LIBV}/include/gst/gl/gstg=
lconfig.h&quot;<br>
=C2=A0FILES_${PN}-freeverb +=3D &quot;${datadir}/gstreamer-${LIBV}/presets/=
GstFreeverb.prs&quot;<br>
=C2=A0FILES_${PN}-opencv +=3D &quot;${datadir}/gst-plugins-bad/${LIBV}/open=
cv*&quot;<br>
=C2=A0FILES_${PN}-voamrwbenc +=3D &quot;${datadir}/gstreamer-${LIBV}/preset=
s/GstVoAmrwbEnc.prs&quot;<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000007ef3120571a5ca56--
