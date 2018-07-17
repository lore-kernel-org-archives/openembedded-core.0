Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id F29A5789E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:57:16 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id z13-v6so873934wma.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 02:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QpZA+xe+AyoPvQeaZ7XM4MjbT//zecpKRXcL1Dqs7tI=;
	b=g9sKZyVbrhVRHExAGZcmQ6+bTm7ZwnCT5sUHg2AWCkgkBWd3GTzY/KSbm+byEpqh/G
	hPBbwh4eUaidJ3rfP/lf2W8b2Og8FS0m9k90AxqH3WYsanjb9VCO5Qe2I4/guEMxrhT6
	nU+Eydv8MQR/rcGbhvIPBeQczb9wvxleZj2Oz5ShTR5lMttaTg3uGvbcvcqiNEEV5GIx
	M3sfJQiBjCJKDgcaOpwHWjViPv+uzLFttwf7AigfaxywwAyhuD8nR+2G5NUNX7vzSCYC
	7faK/07yWq0uJRHBlMEd6/kVCDxV8pNEK0hbDo0Xjo0xPzknfuPKuOEXpt1RSracl/+q
	UCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QpZA+xe+AyoPvQeaZ7XM4MjbT//zecpKRXcL1Dqs7tI=;
	b=dD/jpg9v/o2BVGnsYFRkhb4meJHzstsNGVrn8Y88aK4VgdGF96jIRkSMt5UiEOq+Kt
	EgTKuwGBCVyUCIQ2PKZEGBDbxecdyZ8QnH3ROx5DY4/ks095fz4Ny2k16AHBVqCfBOg+
	H92yUx/i/mONrxQrbzGAKmWonIwXS5OnFXFmLKsUhY3NmVt4nCMXoVwFn5EytihteoEC
	b4LGaAo5YicWDI/l/oE8vmKDdYaNXveLWWWTQjKPC3EC8ENGmWHVjolZqU1rgkEvTkli
	3LhlwLs+Cct+IitapnJi1rpZhvlevV7nUBJeLm9xLO2GTjWYg29b8pKNzxIf1zKtGfYq
	dzWw==
X-Gm-Message-State: AOUpUlHVrJilBBmPZLFz4Uv4+WGtMmyWNqcQFkxa+KwrAea7IO6ohLFP
	Qt2IlEgc2wpsIx4JvrE3IaDGLDnV9lncRFr0sgI=
X-Google-Smtp-Source: AAOMgpe/WhEgUXWX0qxcmCJznZMZwZoH6AL3vCCJ32suAlAwougk6z7bkeXCG+5XEFMEeUmfmMh1JMN8AaVHd8mYI/M=
X-Received: by 2002:a1c:8c08:: with SMTP id o8-v6mr843534wmd.60.1531821437548; 
	Tue, 17 Jul 2018 02:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20180717093523.5582-1-dv@pseudoterminal.org>
	<20180717093523.5582-2-dv@pseudoterminal.org>
	<CA+chaQcHrnAFA5wmOx2QAj=-58wR-HUri+VWiXn6FBmm2BVJUw@mail.gmail.com>
	<328d9bf4-dbf8-0f65-7e6d-e0199697625e@pseudoterminal.org>
In-Reply-To: <328d9bf4-dbf8-0f65-7e6d-e0199697625e@pseudoterminal.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 17 Jul 2018 11:57:08 +0200
Message-ID: <CA+chaQe+ZT2Kc-cv3mKz+e9uLkfGpVy1CkwVOv=yZ=Xpdy4cAw@mail.gmail.com>
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
X-List-Received-Date: Tue, 17 Jul 2018 09:57:17 -0000
Content-Type: multipart/alternative; boundary="000000000000a4fbb505712ef8a2"

--000000000000a4fbb505712ef8a2
Content-Type: text/plain; charset="UTF-8"

The PACKAGECONFIG for them is already there, why do you need to remove the
option for someone to disable the support if they want?

On Tue, Jul 17, 2018 at 11:54 AM Carlos Rafael Giani <dv@pseudoterminal.org>
wrote:

> The zlib and bz2 switches enable zlib and bzip2 support in the qtdemux and
> matroska plugins. They do not enable some sort of standalone bz2/zlib
> plugins. Is there any reason why these shouldn't be enabled always?
>
> On 2018-07-17 11:50, Martin Jansa wrote:
>
> Why do you remove bz2 and zlib PACKAGECONFIGs instead of just enabling
> them by default?
>
> On Tue, Jul 17, 2018 at 11:45 AM Carlos Rafael Giani <
> dv@pseudoterminal.org> wrote:
>
>> * Always enable bz2 and zlib, since these are part of oe-core, and
>>   dependencies that are in oe-core can be always enabled
>> * There is no twolame recipe in oe-core or in meta-openembedded, so
>>   disable it
>> * Reorder the packageconfigs alphabetically
>>
>> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
>> ---
>>  .../gstreamer1.0-plugins-good_1.14.1.bb         | 17 +++++++++--------
>>  1 file changed, 9 insertions(+), 8 deletions(-)
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/
>> gstreamer1.0-plugins-good_1.14.1.bb b/meta/recipes-multimedia/gstreamer/
>> gstreamer1.0-plugins-good_1.14.1.bb
>> index 36eb3107ae..baeb19ddfe 100644
>> --- a/meta/recipes-multimedia/gstreamer/
>> gstreamer1.0-plugins-good_1.14.1.bb
>> +++ b/meta/recipes-multimedia/gstreamer/
>> gstreamer1.0-plugins-good_1.14.1.bb
>> @@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "
>> file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
>>                      file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607
>> \
>>
>> file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe
>> "
>>
>> -DEPENDS += "gstreamer1.0-plugins-base libcap"
>> +DEPENDS += "gstreamer1.0-plugins-base libcap zlib bzip2"
>>  RPROVIDES_${PN}-pulseaudio += "${PN}-pulse"
>>  RPROVIDES_${PN}-soup += "${PN}-souphttpsrc"
>>
>> @@ -28,7 +28,7 @@ PACKAGECONFIG ??= " \
>>      ${GSTREAMER_ORC} \
>>      ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
>>      ${@bb.utils.contains_any('DISTRO_FEATURES',
>> d.getVar('GTK3DISTROFEATURES'), 'gtk', '', d)} \
>> -    cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib v4l2 bz2
>> zlib mpg123 lame \
>> +    cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 soup speex
>> taglib v4l2 \
>>  "
>>
>>  X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
>> @@ -37,11 +37,14 @@ PACKAGECONFIG[cairo]      =
>> "--enable-cairo,--disable-cairo,cairo"
>>  PACKAGECONFIG[dv1394]     =
>> "--enable-dv1394,--disable-dv1394,libiec61883 libavc1394 libraw1394"
>>  PACKAGECONFIG[flac]       = "--enable-flac,--disable-flac,flac"
>>  PACKAGECONFIG[gdk-pixbuf] =
>> "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
>> +PACKAGECONFIG[gtk]        = "--enable-gtk3,--disable-gtk3,gtk+3"
>>  PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,libgudev"
>>  PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
>>  PACKAGECONFIG[jpeg]       = "--enable-jpeg,--disable-jpeg,jpeg"
>> +PACKAGECONFIG[lame]       = "--enable-lame,--disable-lame,lame"
>>  PACKAGECONFIG[libpng]     = "--enable-libpng,--disable-libpng,libpng"
>>  PACKAGECONFIG[libv4l2]    = "--with-libv4l2,--without-libv4l2,v4l-utils"
>> +PACKAGECONFIG[mpg123]     = "--enable-mpg123,--disable-mpg123,mpg123"
>>  PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
>>  PACKAGECONFIG[soup]       = "--enable-soup,--disable-soup,libsoup-2.4"
>>  PACKAGECONFIG[speex]      = "--enable-speex,--disable-speex,speex"
>> @@ -50,11 +53,6 @@ PACKAGECONFIG[v4l2]       = "--enable-gst_v4l2
>> --enable-v4l2-probe,--disable-gst
>>  PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
>>  PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
>>  PACKAGECONFIG[x11]        = "--enable-x,--disable-x,${X11DEPENDS}"
>> -PACKAGECONFIG[bz2]        = "--enable-bz2,--disable-bz2,bzip2"
>> -PACKAGECONFIG[zlib]       = "--enable-zlib,--disable-zlib,zlib"
>> -PACKAGECONFIG[lame]       = "--enable-lame,--disable-lame,lame"
>> -PACKAGECONFIG[mpg123]     = "--enable-mpg123,--disable-mpg123,mpg123"
>> -PACKAGECONFIG[gtk]        = "--enable-gtk3,--disable-gtk3,gtk+3"
>>
>>  # qt5 support is disabled, because it is not present in OE core, and
>> requires more work than
>>  # just adding a packageconfig (it requires access to moc, uic, rcc, and
>> qmake paths).
>> @@ -62,7 +60,9 @@ PACKAGECONFIG[gtk]        =
>> "--enable-gtk3,--disable-gtk3,gtk+3"
>>  # in a gstreamer1.0-plugins-good bbappend).
>>
>>  EXTRA_OECONF += " \
>> +    --enable-bz2 \
>>      --enable-oss \
>> +    --enable-zlib \
>>      --disable-aalib \
>>      --disable-aalibtest \
>>      --disable-directsound \
>> @@ -71,9 +71,10 @@ EXTRA_OECONF += " \
>>      --disable-oss4 \
>>      --disable-osx_audio \
>>      --disable-osx_video \
>> +    --disable-qt \
>>      --disable-shout2 \
>> +    --disable-twolame \
>>      --disable-waveform \
>> -    --disable-qt \
>>  "
>>
>>  FILES_${PN}-equalizer += "${datadir}/gstreamer-1.0/presets/*.prs"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--000000000000a4fbb505712ef8a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The PACKAGECONFIG for them is already there, why do you ne=
ed to remove the option for someone to disable the support if they want?</d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Jul 17, 2018 at =
11:54 AM Carlos Rafael Giani &lt;<a href=3D"mailto:dv@pseudoterminal.org">d=
v@pseudoterminal.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>The zlib and bz2 switches enable zlib and bzip2 support in the
      qtdemux and matroska plugins. They do not enable some sort of
      standalone bz2/zlib plugins. Is there any reason why these
      shouldn&#39;t be enabled always?<br>
    </p>
    <br>
    <div class=3D"m_-4186692926023383277moz-cite-prefix">On 2018-07-17 11:5=
0, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">Why do you remove bz2 and zlib PACKAGECONFIGs
        instead of just enabling them by default?</div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr">On Tue, Jul 17, 2018 at 11:45 AM Carlos Rafael
          Giani &lt;<a href=3D"mailto:dv@pseudoterminal.org" target=3D"_bla=
nk">dv@pseudoterminal.org</a>&gt; wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">* Always
          enable bz2 and zlib, since these are part of oe-core, and<br>
          =C2=A0 dependencies that are in oe-core can be always enabled<br>
          * There is no twolame recipe in oe-core or in
          meta-openembedded, so<br>
          =C2=A0 disable it<br>
          * Reorder the packageconfigs alphabetically<br>
          <br>
          Signed-off-by: Carlos Rafael Giani &lt;<a href=3D"mailto:dv@pseud=
oterminal.org" target=3D"_blank">dv@pseudoterminal.org</a>&gt;<br>
          ---<br>
          =C2=A0.../<a href=3D"http://gstreamer1.0-plugins-good_1.14.1.bb" =
rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-good_1.14.1.bb</a=
>=C2=A0
          =C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 +++++++++--------<br>
          =C2=A01 file changed, 9 insertions(+), 8 deletions(-)<br>
          <br>
          diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://=
gstreamer1.0-plugins-good_1.14.1.bb" rel=3D"noreferrer" target=3D"_blank">g=
streamer1.0-plugins-good_1.14.1.bb</a>
          b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.=
0-plugins-good_1.14.1.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0=
-plugins-good_1.14.1.bb</a><br>
          index 36eb3107ae..baeb19ddfe 100644<br>
          --- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstream=
er1.0-plugins-good_1.14.1.bb" rel=3D"noreferrer" target=3D"_blank">gstreame=
r1.0-plugins-good_1.14.1.bb</a><br>
          +++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstream=
er1.0-plugins-good_1.14.1.bb" rel=3D"noreferrer" target=3D"_blank">gstreame=
r1.0-plugins-good_1.14.1.bb</a><br>
          @@ -18,7 +18,7 @@ LIC_FILES_CHKSUM =3D
          &quot;<a class=3D"m_-4186692926023383277moz-txt-link-freetext">fi=
le://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37343</a> \<br>
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<a class=3D"m_-4186692926023383277moz-txt-link-freetext">file:=
//common/coverage/</a><a href=3D"http://coverage-report.pl" rel=3D"noreferr=
er" target=3D"_blank">coverage-report.pl</a>;beginline=3D2;endline=3D17;md5=
=3Da4e1830fce078028c8f0974161272607
          \<br>
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0
=C2=A0<a class=3D"m_-4186692926023383277moz-txt-link-freetext">file://gst/r=
eplaygain/rganalysis.c;beginline=3D1;endline=3D23;md5=3Db60ebefd5b2f5a8e0ca=
b6bfee391a5fe</a>&quot;<br>
          <br>
          -DEPENDS +=3D &quot;gstreamer1.0-plugins-base libcap&quot;<br>
          +DEPENDS +=3D &quot;gstreamer1.0-plugins-base libcap zlib bzip2&q=
uot;<br>
          =C2=A0RPROVIDES_${PN}-pulseaudio +=3D &quot;${PN}-pulse&quot;<br>
          =C2=A0RPROVIDES_${PN}-soup +=3D &quot;${PN}-souphttpsrc&quot;<br>
          <br>
          @@ -28,7 +28,7 @@ PACKAGECONFIG ??=3D &quot; \<br>
          =C2=A0 =C2=A0 =C2=A0${GSTREAMER_ORC} \<br>
          =C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;,=
 &#39;pulseaudio x11&#39;,
          d)} \<br>
          =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains_any(&#39;DISTRO_FEATURES=
&#39;,
          d.getVar(&#39;GTK3DISTROFEATURES&#39;), &#39;gtk&#39;, &#39;&#39;=
, d)} \<br>
          -=C2=A0 =C2=A0 cairo flac gdk-pixbuf gudev jpeg libpng soup speex=
 taglib
          v4l2 bz2 zlib mpg123 lame \<br>
          +=C2=A0 =C2=A0 cairo flac gdk-pixbuf gudev jpeg lame libpng mpg12=
3 soup
          speex taglib v4l2 \<br>
          =C2=A0&quot;<br>
          <br>
          =C2=A0X11DEPENDS =3D &quot;virtual/libx11 libsm libxrender libxfi=
xes
          libxdamage&quot;<br>
          @@ -37,11 +37,14 @@ PACKAGECONFIG[cairo]=C2=A0 =C2=A0 =C2=A0 =3D
          &quot;--enable-cairo,--disable-cairo,cairo&quot;<br>
          =C2=A0PACKAGECONFIG[dv1394]=C2=A0 =C2=A0 =C2=A0=3D
          &quot;--enable-dv1394,--disable-dv1394,libiec61883 libavc1394
          libraw1394&quot;<br>
          =C2=A0PACKAGECONFIG[flac]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D
          &quot;--enable-flac,--disable-flac,flac&quot;<br>
          =C2=A0PACKAGECONFIG[gdk-pixbuf] =3D
          &quot;--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf&quot;<b=
r>
          +PACKAGECONFIG[gtk]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D
          &quot;--enable-gtk3,--disable-gtk3,gtk+3&quot;<br>
          =C2=A0PACKAGECONFIG[gudev]=C2=A0 =C2=A0 =C2=A0 =3D
          &quot;--with-gudev,--without-gudev,libgudev&quot;<br>
          =C2=A0PACKAGECONFIG[jack]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D
          &quot;--enable-jack,--disable-jack,jack&quot;<br>
          =C2=A0PACKAGECONFIG[jpeg]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D
          &quot;--enable-jpeg,--disable-jpeg,jpeg&quot;<br>
          +PACKAGECONFIG[lame]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D
          &quot;--enable-lame,--disable-lame,lame&quot;<br>
          =C2=A0PACKAGECONFIG[libpng]=C2=A0 =C2=A0 =C2=A0=3D
          &quot;--enable-libpng,--disable-libpng,libpng&quot;<br>
          =C2=A0PACKAGECONFIG[libv4l2]=C2=A0 =C2=A0 =3D
          &quot;--with-libv4l2,--without-libv4l2,v4l-utils&quot;<br>
          +PACKAGECONFIG[mpg123]=C2=A0 =C2=A0 =C2=A0=3D
          &quot;--enable-mpg123,--disable-mpg123,mpg123&quot;<br>
          =C2=A0PACKAGECONFIG[pulseaudio] =3D
          &quot;--enable-pulse,--disable-pulse,pulseaudio&quot;<br>
          =C2=A0PACKAGECONFIG[soup]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D
          &quot;--enable-soup,--disable-soup,libsoup-2.4&quot;<br>
          =C2=A0PACKAGECONFIG[speex]=C2=A0 =C2=A0 =C2=A0 =3D
          &quot;--enable-speex,--disable-speex,speex&quot;<br>
          @@ -50,11 +53,6 @@ PACKAGECONFIG[v4l2]=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D
          &quot;--enable-gst_v4l2 --enable-v4l2-probe,--disable-gst<br>
          =C2=A0PACKAGECONFIG[vpx]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D
          &quot;--enable-vpx,--disable-vpx,libvpx&quot;<br>
          =C2=A0PACKAGECONFIG[wavpack]=C2=A0 =C2=A0 =3D
          &quot;--enable-wavpack,--disable-wavpack,wavpack&quot;<br>
          =C2=A0PACKAGECONFIG[x11]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D
          &quot;--enable-x,--disable-x,${X11DEPENDS}&quot;<br>
          -PACKAGECONFIG[bz2]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D
          &quot;--enable-bz2,--disable-bz2,bzip2&quot;<br>
          -PACKAGECONFIG[zlib]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D
          &quot;--enable-zlib,--disable-zlib,zlib&quot;<br>
          -PACKAGECONFIG[lame]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D
          &quot;--enable-lame,--disable-lame,lame&quot;<br>
          -PACKAGECONFIG[mpg123]=C2=A0 =C2=A0 =C2=A0=3D
          &quot;--enable-mpg123,--disable-mpg123,mpg123&quot;<br>
          -PACKAGECONFIG[gtk]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D
          &quot;--enable-gtk3,--disable-gtk3,gtk+3&quot;<br>
          <br>
          =C2=A0# qt5 support is disabled, because it is not present in OE
          core, and requires more work than<br>
          =C2=A0# just adding a packageconfig (it requires access to moc,
          uic, rcc, and qmake paths).<br>
          @@ -62,7 +60,9 @@ PACKAGECONFIG[gtk]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D
          &quot;--enable-gtk3,--disable-gtk3,gtk+3&quot;<br>
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
          =C2=A0FILES_${PN}-equalizer +=3D
          &quot;${datadir}/gstreamer-1.0/presets/*.prs&quot;<br>
          -- <br>
          2.17.1<br>
          <br>
          -- <br>
          _______________________________________________<br>
          Openembedded-core mailing list<br>
          <a href=3D"mailto:Openembedded-core@lists.openembedded.org" targe=
t=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
          <a href=3D"http://lists.openembedded.org/mailman/listinfo/openemb=
edded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.=
org/mailman/listinfo/openembedded-core</a><br>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div>

--000000000000a4fbb505712ef8a2--
