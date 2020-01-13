Return-Path: <crg7475@mailbox.org>
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	by mail.openembedded.org (Postfix) with ESMTP id 891807F7CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 14:50:16 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 47xGj45nmQzKmMr;
	Mon, 13 Jan 2020 15:50:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-transfer-encoding:content-type
	:content-type:in-reply-to:mime-version:date:date:message-id:from
	:from:references:subject:subject:received; s=mail20150812; t=
	1578927010; bh=K+WXcYKUGPBL4yFHvwXTwHB2NjacuXz4R334GveVKYM=; b=X
	0xFOa2BGhpQAphzM+x/possda7LCFrih5mqme0qLdVFrWcaevRoRGSI7b2mm4rzm
	CWknG5BHEk+9BBa0M/e5jpAUb0es3zfPgBOvjwIWbsMLXGgOrh4uP7pxZehEhcdE
	PXemAnfQMXrCM3t4X1vrOFqlLTnDGegkM53dxLc6c8Dd4s/n5IkUoaTqVYitZ9AP
	GmUkIBJbK37IiUAeOy+OFFMNizAFir2cezWOiKHLthDsOKgD71USTsPVjePKS6Dl
	j7sXUeAGBC6ORgTmCOpvtolBcTcC71PrYpGQLoRBfR/sbtqbaRDEfhEmaLMnY6p5
	uSYySKdD8WqH2U7mG8Eow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1578927014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=rqcL9w057ANFyL44/fSAtVdMOAqvkHiW9+w7eubub9E=;
	b=AcRWVwa4dVHhIX8hgEbbMZwpxpRwiyXJP8leRauzJ35tDjIPbx4XYyybWs814Kor/CMB2f
	de0PcDIndelgS8fjWZGYNloOxp1pj85M+sBAcKxfPxWQ1dF+J008KH+ZZG6AZmLO2nRvS3
	eYbtF1NO/QtjixRfF3qdZ+vCQN7jA8YiQWyLhySOzZlyeC9gpcQY4ojmnVvVyL5sgZr03L
	JaMxGXSsQsXfQA+p38y1BsbM5139l0Uko7mZ1TU7wI8Fo1ioM2M0bqDx4qpsuSNv/+xsRt
	pvfhsSUMTEZgcIYkMEgVr84RyKJoS116GhuvIO8yO3euOuT4lUBb22VJqVrpYg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
	(amavisd-new, port 10030)
	with ESMTP id MXIsZ61jX3dg; Mon, 13 Jan 2020 15:50:10 +0100 (CET)
To: Khem Raj <raj.khem@gmail.com>
References: <20200112135954.23868-1-crg7475@mailbox.org>
	<20200112135954.23868-4-crg7475@mailbox.org>
	<CAMKF1sr_1aR_JZdxfxwO1TzE81E6W9YU_d_08+=DBX=KcniYHA@mail.gmail.com>
From: Carlos Rafael Giani <crg7475@mailbox.org>
Message-ID: <cf1705b2-70a5-14b4-6704-5f9ad3359cd4@mailbox.org>
Date: Mon, 13 Jan 2020 15:50:09 +0100
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr_1aR_JZdxfxwO1TzE81E6W9YU_d_08+=DBX=KcniYHA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/12] gstreamer1.0-plugins-good: Transition to meson based builds
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
X-List-Received-Date: Mon, 13 Jan 2020 14:50:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Actually, you have a point. I seem to have forgotten to fix this in this 
patch. With meson, it appears that the meta-qt5 bbappend is no longer 
necessary, since meson finds the Qt5 moc/rcc/uic tools on its own, so a 
packageconfig could be added right here. However, I'd like to 
investigate that moc/rcc/uic autodetection more to be sure it does not 
bring with it some "surprises" that could bite us in the behind when 
doing production builds.

On 13.01.20 01:52, Khem Raj wrote:
> On Sun, Jan 12, 2020 at 6:33 AM Carlos Rafael Giani <crg7475@mailbox.org> wrote:
>> * Removed autotools/M4 related patch
>>    0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch.
>>
>> * gtk-doc support is handled here, not in gstreamer1.0-plugins-common.inc,
>>      since unlike with autotools, only some plugin set packages use gtk-doc.
>>
>> * zlib is no longer optional, and glib anyway depends on zlib, therefore
>>      it gets added to the DEPENDS list.
>>
>> * gettext handling now part of gstreamer1.0-plugins-common.inc.
>>
>> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
>> ---
>>   .../gstreamer1.0-plugins-good_1.16.1.bb       | 79 +++++++++----------
>>   1 file changed, 38 insertions(+), 41 deletions(-)
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
>> index 0fa7b86ffe..a6eb9986dd 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
>> @@ -1,8 +1,7 @@
>> -require gstreamer1.0-plugins.inc
>> +require gstreamer1.0-plugins-common.inc
>>
>>   SRC_URI = " \
>>               https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
>> -            file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
>>               "
>>
>>   SRC_URI[md5sum] = "515987ee763256840a11bd8ea098f2bf"
>> @@ -15,42 +14,41 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
>>                       file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
>>                       file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
>>
>> -DEPENDS += "gstreamer1.0-plugins-base libcap"
>> +DEPENDS += "gstreamer1.0-plugins-base libcap zlib"
>>   RPROVIDES_${PN}-pulseaudio += "${PN}-pulse"
>>   RPROVIDES_${PN}-soup += "${PN}-souphttpsrc"
>>
>> -inherit gettext
>> -
>>   PACKAGECONFIG ??= " \
>>       ${GSTREAMER_ORC} \
>>       ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
>> -    bz2 cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 soup speex taglib v4l2 zlib \
>> +    bz2 cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 soup speex taglib v4l2 \
>>   "
>>
>>   X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
>> +X11ENABLEOPTS = "-Dximagesrc=enabled -Dximagesrc-xshm=enabled -Dximagesrc-xfixes=enabled -Dximagesrc-xdamage=enabled"
>> +X11DISABLEOPTS = "-Dximagesrc=disabled -Dximagesrc-xshm=disabled -Dximagesrc-xfixes=disabled -Dximagesrc-xdamage=disabled"
>>
>> -PACKAGECONFIG[bz2]        = "--enable-bz2,--disable-bz2,bzip2"
>> -PACKAGECONFIG[cairo]      = "--enable-cairo,--disable-cairo,cairo"
>> -PACKAGECONFIG[dv1394]     = "--enable-dv1394,--disable-dv1394,libiec61883 libavc1394 libraw1394"
>> -PACKAGECONFIG[flac]       = "--enable-flac,--disable-flac,flac"
>> -PACKAGECONFIG[gdk-pixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
>> -PACKAGECONFIG[gtk]        = "--enable-gtk3,--disable-gtk3,gtk+3"
>> -PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,libgudev"
>> -PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
>> -PACKAGECONFIG[jpeg]       = "--enable-jpeg,--disable-jpeg,jpeg"
>> -PACKAGECONFIG[lame]       = "--enable-lame,--disable-lame,lame"
>> -PACKAGECONFIG[libpng]     = "--enable-libpng,--disable-libpng,libpng"
>> -PACKAGECONFIG[libv4l2]    = "--with-libv4l2,--without-libv4l2,v4l-utils"
>> -PACKAGECONFIG[mpg123]     = "--enable-mpg123,--disable-mpg123,mpg123"
>> -PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
>> -PACKAGECONFIG[soup]       = "--enable-soup,--disable-soup,libsoup-2.4"
>> -PACKAGECONFIG[speex]      = "--enable-speex,--disable-speex,speex"
>> -PACKAGECONFIG[taglib]     = "--enable-taglib,--disable-taglib,taglib"
>> -PACKAGECONFIG[v4l2]       = "--enable-gst_v4l2 --enable-v4l2-probe,--disable-gst_v4l2"
>> -PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
>> -PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
>> -PACKAGECONFIG[x11]        = "--enable-x,--disable-x,${X11DEPENDS}"
>> -PACKAGECONFIG[zlib]       = "--enable-zlib,--disable-zlib,zlib"
>> +PACKAGECONFIG[bz2]        = "-Dbz2=enabled,-Dbz2=disabled,bzip2"
>> +PACKAGECONFIG[cairo]      = "-Dcairo=enabled,-Dcairo=disabled,cairo"
>> +PACKAGECONFIG[dv1394]     = "-Ddv1394=enabled,-Ddv1394=disabled,libiec61883 libavc1394 libraw1394"
>> +PACKAGECONFIG[flac]       = "-Dflac=enabled,-Dflac=disabled,flac"
>> +PACKAGECONFIG[gdk-pixbuf] = "-Dgdk-pixbuf=enabled,-Dgdk-pixbuf=disabled,gdk-pixbuf"
>> +PACKAGECONFIG[gtk]        = "-Dgtk3=enabled,-Dgtk3=disabled,gtk+3"
>> +PACKAGECONFIG[gudev]      = "-Dv4l2-gudev=enabled,-Dv4l2-gudev=disabled,libgudev"
>> +PACKAGECONFIG[jack]       = "-Djack=enabled,-Djack=disabled,jack"
>> +PACKAGECONFIG[jpeg]       = "-Djpeg=enabled,-Djpeg=disabled,jpeg"
>> +PACKAGECONFIG[lame]       = "-Dlame=enabled,-Dlame=disabled,lame"
>> +PACKAGECONFIG[libpng]     = "-Dpng=enabled,-Dpng=disabled,libpng"
>> +PACKAGECONFIG[libv4l2]    = "-Dv4l2-libv4l2=enabled,-Dv4l2-libv4l2=disabled,v4l-utils"
>> +PACKAGECONFIG[mpg123]     = "-Dmpg123=enabled,-Dmpg123=disabled,mpg123"
>> +PACKAGECONFIG[pulseaudio] = "-Dpulse=enabled,-Dpulse=disabled,pulseaudio"
>> +PACKAGECONFIG[soup]       = "-Dsoup=enabled,-Dsoup=disabled,libsoup-2.4"
>> +PACKAGECONFIG[speex]      = "-Dspeex=enabled,-Dspeex=disabled,speex"
>> +PACKAGECONFIG[taglib]     = "-Dtaglib=enabled,-Dtaglib=disabled,taglib"
>> +PACKAGECONFIG[v4l2]       = "-Dv4l2=enabled -Dv4l2-probe=true,-Dv4l2=disabled -Dv4l2-probe=false"
>> +PACKAGECONFIG[vpx]        = "-Dvpx=enabled,-Dvpx=disabled,libvpx"
>> +PACKAGECONFIG[wavpack]    = "-Dwavpack=enabled,-Dwavpack=disabled,wavpack"
>> +PACKAGECONFIG[x11]        = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
>>
>>   # qt5 support is disabled, because it is not present in OE core, and requires more work than
>>   # just adding a packageconfig (it requires access to moc, uic, rcc, and qmake paths).
>> @@ -58,19 +56,18 @@ PACKAGECONFIG[zlib]       = "--enable-zlib,--disable-zlib,zlib"
>>   # in a gstreamer1.0-plugins-good bbappend).
>>
>>   EXTRA_OECONF += " \
>> -    --enable-oss \
>> -    --disable-aalib \
>> -    --disable-aalibtest \
>> -    --disable-directsound \
>> -    --disable-libcaca \
>> -    --disable-libdv \
>> -    --disable-oss4 \
>> -    --disable-osx_audio \
>> -    --disable-osx_video \
>> -    --disable-qt \
> Dont disable it explicitly, meta-qt5 will has a packageconfig for it.
>
>> -    --disable-shout2 \
>> -    --disable-twolame \
>> -    --disable-waveform \
>> +    -Daalib=disabled \
>> +    -Ddirectsound=disabled \
>> +    -Ddv=disabled \
>> +    -Dlibcaca=disabled \
>> +    -Doss=enabled \
>> +    -Doss4=disabled \
>> +    -Dosxaudio=disabled \
>> +    -Dosxvideo=disabled \
>> +    -Dqt=disabled \
>> +    -Dshout2=disabled \
>> +    -Dtwolame=disabled \
>> +    -Dwaveform=disabled \
>>   "
>>
>>   FILES_${PN}-equalizer += "${datadir}/gstreamer-1.0/presets/*.prs"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

