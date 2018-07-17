Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3BBC5745A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:50:24 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id 69-v6so850295wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 02:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=u7YQf4GwDg7PB/zhjhmA8cBqZ/4br592aSJkj9HeyRo=;
	b=Q0Q1V/oxNzxI+PRtYh7JwVkH/HVd25T1uSiISglW7KRoqZjn9BUCxA7mj2aBi0lmsC
	+Wcq7aTXX0jk1t9lalW8JxHkMyELJA9dT36ScMCqmARQaJh4FHGggnVFljfSktgPl4Vg
	7hWS1xJVzZznwDKHpdBZERKIt4/IhXg22w/Lu+FxGvQhpCbkwzfctT4ANTHzbEbbDJJZ
	0XnpknERVW7Hmgp2qC0P076op9IfHzQGZufm3nMs0VxiSm1++xo8bgIR6gTDq+4XE51/
	gTZdzZcVp4p6qOhGPFa6+RnXXRBGk4eH22K6+fnxLTuAc7nWGs9+fGcTQ8u6oaFnBNIB
	S6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=u7YQf4GwDg7PB/zhjhmA8cBqZ/4br592aSJkj9HeyRo=;
	b=Rwcj8WOYg63tgKPx6ouFoV9eERFTsm6jAff0AYxvxsI3114u1Y9S4/gEkzcodse6nM
	ghubcRLKR+gLwkdKdF7/rUnOa6uJSEHRY3frdhpHngNAviSBgR0aAQQ3D9dVX1lQDXie
	EukhyMS5iPXkWEnKZa4wvG60H/VoSUJvvVCPQc2po72zBjgUOGnpJNeUzwvOJyGfFJDx
	aMtVXkKyeznTBXbQPtBQMu1lrVMmCcFtfOULYAas9XrThRfggGg3pp3bb6t3AVRCOqGg
	AKaAZYi6RkSk1lliGww1BAtc0QgOpIYoCGLYgDwxzRW0SSQWXosgnMeFodlrSoRNsuc4
	uYaA==
X-Gm-Message-State: AOUpUlHqSIPp5auZeAhDPybkFGn0pQKFOyMuuIMgNOFhiMO1xQMbxThL
	89q7ShaHovM3t3NUS4dEbIH1ZJSCXIcvuXzLr74=
X-Google-Smtp-Source: AAOMgpebMtExpENbad/OHfCNf3guzgC64NU8JKog2xy0n+Ip5UfDv12sQDWNkuYq3gobtK4rNnDIG6FB5+KPolnCNNc=
X-Received: by 2002:a1c:8f0e:: with SMTP id r14-v6mr915180wmd.79.1531821024252;
	Tue, 17 Jul 2018 02:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20180717093523.5582-1-dv@pseudoterminal.org>
	<20180717093523.5582-2-dv@pseudoterminal.org>
In-Reply-To: <20180717093523.5582-2-dv@pseudoterminal.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 17 Jul 2018 11:50:15 +0200
Message-ID: <CA+chaQcHrnAFA5wmOx2QAj=-58wR-HUri+VWiXn6FBmm2BVJUw@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] gstreamer1.0-plugin-good: Update packageconfigs
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
X-List-Received-Date: Tue, 17 Jul 2018 09:50:24 -0000
Content-Type: multipart/alternative; boundary="0000000000000297a305712ee006"

--0000000000000297a305712ee006
Content-Type: text/plain; charset="UTF-8"

Why do you remove bz2 and zlib PACKAGECONFIGs instead of just enabling them
by default?

On Tue, Jul 17, 2018 at 11:45 AM Carlos Rafael Giani <dv@pseudoterminal.org>
wrote:

> * Always enable bz2 and zlib, since these are part of oe-core, and
>   dependencies that are in oe-core can be always enabled
> * There is no twolame recipe in oe-core or in meta-openembedded, so
>   disable it
> * Reorder the packageconfigs alphabetically
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  .../gstreamer1.0-plugins-good_1.14.1.bb         | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.14.1.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.14.1.bb
> index 36eb3107ae..baeb19ddfe 100644
> --- a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.14.1.bb
> +++ b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.14.1.bb
> @@ -18,7 +18,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
>                      file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607
> \
>
>  file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
>
> -DEPENDS += "gstreamer1.0-plugins-base libcap"
> +DEPENDS += "gstreamer1.0-plugins-base libcap zlib bzip2"
>  RPROVIDES_${PN}-pulseaudio += "${PN}-pulse"
>  RPROVIDES_${PN}-soup += "${PN}-souphttpsrc"
>
> @@ -28,7 +28,7 @@ PACKAGECONFIG ??= " \
>      ${GSTREAMER_ORC} \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
>      ${@bb.utils.contains_any('DISTRO_FEATURES',
> d.getVar('GTK3DISTROFEATURES'), 'gtk', '', d)} \
> -    cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib v4l2 bz2
> zlib mpg123 lame \
> +    cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 soup speex taglib
> v4l2 \
>  "
>
>  X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
> @@ -37,11 +37,14 @@ PACKAGECONFIG[cairo]      =
> "--enable-cairo,--disable-cairo,cairo"
>  PACKAGECONFIG[dv1394]     = "--enable-dv1394,--disable-dv1394,libiec61883
> libavc1394 libraw1394"
>  PACKAGECONFIG[flac]       = "--enable-flac,--disable-flac,flac"
>  PACKAGECONFIG[gdk-pixbuf] =
> "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
> +PACKAGECONFIG[gtk]        = "--enable-gtk3,--disable-gtk3,gtk+3"
>  PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,libgudev"
>  PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
>  PACKAGECONFIG[jpeg]       = "--enable-jpeg,--disable-jpeg,jpeg"
> +PACKAGECONFIG[lame]       = "--enable-lame,--disable-lame,lame"
>  PACKAGECONFIG[libpng]     = "--enable-libpng,--disable-libpng,libpng"
>  PACKAGECONFIG[libv4l2]    = "--with-libv4l2,--without-libv4l2,v4l-utils"
> +PACKAGECONFIG[mpg123]     = "--enable-mpg123,--disable-mpg123,mpg123"
>  PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
>  PACKAGECONFIG[soup]       = "--enable-soup,--disable-soup,libsoup-2.4"
>  PACKAGECONFIG[speex]      = "--enable-speex,--disable-speex,speex"
> @@ -50,11 +53,6 @@ PACKAGECONFIG[v4l2]       = "--enable-gst_v4l2
> --enable-v4l2-probe,--disable-gst
>  PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
>  PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
>  PACKAGECONFIG[x11]        = "--enable-x,--disable-x,${X11DEPENDS}"
> -PACKAGECONFIG[bz2]        = "--enable-bz2,--disable-bz2,bzip2"
> -PACKAGECONFIG[zlib]       = "--enable-zlib,--disable-zlib,zlib"
> -PACKAGECONFIG[lame]       = "--enable-lame,--disable-lame,lame"
> -PACKAGECONFIG[mpg123]     = "--enable-mpg123,--disable-mpg123,mpg123"
> -PACKAGECONFIG[gtk]        = "--enable-gtk3,--disable-gtk3,gtk+3"
>
>  # qt5 support is disabled, because it is not present in OE core, and
> requires more work than
>  # just adding a packageconfig (it requires access to moc, uic, rcc, and
> qmake paths).
> @@ -62,7 +60,9 @@ PACKAGECONFIG[gtk]        =
> "--enable-gtk3,--disable-gtk3,gtk+3"
>  # in a gstreamer1.0-plugins-good bbappend).
>
>  EXTRA_OECONF += " \
> +    --enable-bz2 \
>      --enable-oss \
> +    --enable-zlib \
>      --disable-aalib \
>      --disable-aalibtest \
>      --disable-directsound \
> @@ -71,9 +71,10 @@ EXTRA_OECONF += " \
>      --disable-oss4 \
>      --disable-osx_audio \
>      --disable-osx_video \
> +    --disable-qt \
>      --disable-shout2 \
> +    --disable-twolame \
>      --disable-waveform \
> -    --disable-qt \
>  "
>
>  FILES_${PN}-equalizer += "${datadir}/gstreamer-1.0/presets/*.prs"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000000297a305712ee006
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why do you remove bz2 and zlib PACKAGECONFIGs instead of j=
ust enabling them by default?</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr">On Tue, Jul 17, 2018 at 11:45 AM Carlos Rafael Giani &lt;<a href=
=3D"mailto:dv@pseudoterminal.org">dv@pseudoterminal.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">* Always enable bz2 and zlib, since the=
se are part of oe-core, and<br>
=C2=A0 dependencies that are in oe-core can be always enabled<br>
* There is no twolame recipe in oe-core or in meta-openembedded, so<br>
=C2=A0 disable it<br>
* Reorder the packageconfigs alphabetically<br>
<br>
Signed-off-by: Carlos Rafael Giani &lt;<a href=3D"mailto:dv@pseudoterminal.=
org" target=3D"_blank">dv@pseudoterminal.org</a>&gt;<br>
---<br>
=C2=A0.../<a href=3D"http://gstreamer1.0-plugins-good_1.14.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">gstreamer1.0-plugins-good_1.14.1.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 +++++++++--------<br>
=C2=A01 file changed, 9 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-plugins-good_1.14.1.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.=
0-plugins-good_1.14.1.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D=
"http://gstreamer1.0-plugins-good_1.14.1.bb" rel=3D"noreferrer" target=3D"_=
blank">gstreamer1.0-plugins-good_1.14.1.bb</a><br>
index 36eb3107ae..baeb19ddfe 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-good_1.14.1.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugi=
ns-good_1.14.1.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-good_1.14.1.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugi=
ns-good_1.14.1.bb</a><br>
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Da6f89e210=
0d9b6cdffcea4f398e37343 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://common/coverage/<a href=3D"http://coverage-report.pl" rel=3D"nore=
ferrer" target=3D"_blank">coverage-report.pl</a>;beginline=3D2;endline=3D17=
;md5=3Da4e1830fce078028c8f0974161272607 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://gst/replaygain/rganalysis.c;beginline=3D1;endline=3D23;md5=3Db60e=
befd5b2f5a8e0cab6bfee391a5fe&quot;<br>
<br>
-DEPENDS +=3D &quot;gstreamer1.0-plugins-base libcap&quot;<br>
+DEPENDS +=3D &quot;gstreamer1.0-plugins-base libcap zlib bzip2&quot;<br>
=C2=A0RPROVIDES_${PN}-pulseaudio +=3D &quot;${PN}-pulse&quot;<br>
=C2=A0RPROVIDES_${PN}-soup +=3D &quot;${PN}-souphttpsrc&quot;<br>
<br>
@@ -28,7 +28,7 @@ PACKAGECONFIG ??=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${GSTREAMER_ORC} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;puls=
eaudio x11&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains_any(&#39;DISTRO_FEATURES&#39;, d.g=
etVar(&#39;GTK3DISTROFEATURES&#39;), &#39;gtk&#39;, &#39;&#39;, d)} \<br>
-=C2=A0 =C2=A0 cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib v4=
l2 bz2 zlib mpg123 lame \<br>
+=C2=A0 =C2=A0 cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 soup spe=
ex taglib v4l2 \<br>
=C2=A0&quot;<br>
<br>
=C2=A0X11DEPENDS =3D &quot;virtual/libx11 libsm libxrender libxfixes libxda=
mage&quot;<br>
@@ -37,11 +37,14 @@ PACKAGECONFIG[cairo]=C2=A0 =C2=A0 =C2=A0 =3D &quot;--en=
able-cairo,--disable-cairo,cairo&quot;<br>
=C2=A0PACKAGECONFIG[dv1394]=C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-dv1394,--=
disable-dv1394,libiec61883 libavc1394 libraw1394&quot;<br>
=C2=A0PACKAGECONFIG[flac]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-flac=
,--disable-flac,flac&quot;<br>
=C2=A0PACKAGECONFIG[gdk-pixbuf] =3D &quot;--enable-gdk_pixbuf,--disable-gdk=
_pixbuf,gdk-pixbuf&quot;<br>
+PACKAGECONFIG[gtk]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-gtk3,--di=
sable-gtk3,gtk+3&quot;<br>
=C2=A0PACKAGECONFIG[gudev]=C2=A0 =C2=A0 =C2=A0 =3D &quot;--with-gudev,--wit=
hout-gudev,libgudev&quot;<br>
=C2=A0PACKAGECONFIG[jack]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-jack=
,--disable-jack,jack&quot;<br>
=C2=A0PACKAGECONFIG[jpeg]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-jpeg=
,--disable-jpeg,jpeg&quot;<br>
+PACKAGECONFIG[lame]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-lame,--di=
sable-lame,lame&quot;<br>
=C2=A0PACKAGECONFIG[libpng]=C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-libpng,--=
disable-libpng,libpng&quot;<br>
=C2=A0PACKAGECONFIG[libv4l2]=C2=A0 =C2=A0 =3D &quot;--with-libv4l2,--withou=
t-libv4l2,v4l-utils&quot;<br>
+PACKAGECONFIG[mpg123]=C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-mpg123,--disab=
le-mpg123,mpg123&quot;<br>
=C2=A0PACKAGECONFIG[pulseaudio] =3D &quot;--enable-pulse,--disable-pulse,pu=
lseaudio&quot;<br>
=C2=A0PACKAGECONFIG[soup]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-soup=
,--disable-soup,libsoup-2.4&quot;<br>
=C2=A0PACKAGECONFIG[speex]=C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-speex,--d=
isable-speex,speex&quot;<br>
@@ -50,11 +53,6 @@ PACKAGECONFIG[v4l2]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;=
--enable-gst_v4l2 --enable-v4l2-probe,--disable-gst<br>
=C2=A0PACKAGECONFIG[vpx]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-vpx,=
--disable-vpx,libvpx&quot;<br>
=C2=A0PACKAGECONFIG[wavpack]=C2=A0 =C2=A0 =3D &quot;--enable-wavpack,--disa=
ble-wavpack,wavpack&quot;<br>
=C2=A0PACKAGECONFIG[x11]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-x,--=
disable-x,${X11DEPENDS}&quot;<br>
-PACKAGECONFIG[bz2]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-bz2,--dis=
able-bz2,bzip2&quot;<br>
-PACKAGECONFIG[zlib]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-zlib,--di=
sable-zlib,zlib&quot;<br>
-PACKAGECONFIG[lame]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-lame,--di=
sable-lame,lame&quot;<br>
-PACKAGECONFIG[mpg123]=C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-mpg123,--disab=
le-mpg123,mpg123&quot;<br>
-PACKAGECONFIG[gtk]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-gtk3,--di=
sable-gtk3,gtk+3&quot;<br>
<br>
=C2=A0# qt5 support is disabled, because it is not present in OE core, and =
requires more work than<br>
=C2=A0# just adding a packageconfig (it requires access to moc, uic, rcc, a=
nd qmake paths).<br>
@@ -62,7 +60,9 @@ PACKAGECONFIG[gtk]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;-=
-enable-gtk3,--disable-gtk3,gtk+3&quot;<br>
=C2=A0# in a gstreamer1.0-plugins-good bbappend).<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot; \<br>
+=C2=A0 =C2=A0 --enable-bz2 \<br>
=C2=A0 =C2=A0 =C2=A0--enable-oss \<br>
+=C2=A0 =C2=A0 --enable-zlib \<br>
=C2=A0 =C2=A0 =C2=A0--disable-aalib \<br>
=C2=A0 =C2=A0 =C2=A0--disable-aalibtest \<br>
=C2=A0 =C2=A0 =C2=A0--disable-directsound \<br>
@@ -71,9 +71,10 @@ EXTRA_OECONF +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0--disable-oss4 \<br>
=C2=A0 =C2=A0 =C2=A0--disable-osx_audio \<br>
=C2=A0 =C2=A0 =C2=A0--disable-osx_video \<br>
+=C2=A0 =C2=A0 --disable-qt \<br>
=C2=A0 =C2=A0 =C2=A0--disable-shout2 \<br>
+=C2=A0 =C2=A0 --disable-twolame \<br>
=C2=A0 =C2=A0 =C2=A0--disable-waveform \<br>
-=C2=A0 =C2=A0 --disable-qt \<br>
=C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-equalizer +=3D &quot;${datadir}/gstreamer-1.0/presets/*.p=
rs&quot;<br>
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

--0000000000000297a305712ee006--
