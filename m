Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id D78C6703A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 06:36:48 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id f8so791910wiw.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 23:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=ykdL/rzQGCTTpEbW8vNDPYWikkn15svbwdDr4+5cSHU=;
	b=cdnmU2gIJ1/z/Jdx26qspgz4jTbhxTqu5YSSu29PKhL4eev1SFDJR65JF1fz7WzEMz
	ZqvN93V0Z4fm4v/dwAFREr9ywDwZxgfzbryvYpBW7hoiTywjV5RhLsXW3zW6fYALnjsx
	EIsj1TE9fIr+c/Z61n9wapdBzOccH4WVQe1M0oAidkOVg+6S/NVluzP7Ik5CaYlNQpCr
	j6j7QfGvpIpJMmewr9ljyZwR2LV9r4braPW4QCyLaO5lLk/JkyAqQHbiRuDvGLj2eW04
	X7FaG5nJ6pAD5M8/RM3LqfMhB5N58z00yDL1u9MiCB5cXVSAdHHkqVnqg9V+AemjG0gK
	3wUg==
X-Gm-Message-State: ALoCoQnUXgWu9qEypakquPQjoD/OXvbivA+6VCHYqeeiRlvlJTftL7bavcfFC2FaEKZ3bYtvDq5Z
X-Received: by 10.180.90.102 with SMTP id bv6mr2533036wib.44.1405060608978;
	Thu, 10 Jul 2014 23:36:48 -0700 (PDT)
Received: from ?IPv6:2001:610:612::25cb:dfe7:6628:4453?
	([2001:610:612:0:25cb:dfe7:6628:4453])
	by mx.google.com with ESMTPSA id ja9sm3823620wic.8.2014.07.10.23.36.47
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Jul 2014 23:36:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20140630164039.GC2437@jama>
Date: Fri, 11 Jul 2014 08:36:45 +0200
Message-Id: <C147EF5C-664D-45FD-BA7C-020B54702266@dominion.thruhere.net>
References: <1404138201-22662-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<20140630164039.GC2437@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] libav: add PACKAGECONFIG for theora, libvorbis, speex and openssl
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
X-List-Received-Date: Fri, 11 Jul 2014 06:36:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 jun. 2014, om 18:40 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:

> On Mon, Jun 30, 2014 at 04:23:21PM +0200, Matthieu Crapet wrote:
>> Dropped libvorvis dependency because there is already a (better) =
builtin vorbis codec.
>> Don't confuse codec names: "vorbis" (builtin) and "libvorbis" (using =
external library).
>> Changes:
>> - add --enable-nonfree when faac or openssl are used
>> - add DESCRIPTION
>> - sort PACKAGECONFIG entries
>>=20
>> Tested with libav-0.8.11 & libav-9.13.
>>=20
>> Note: Be sure to have a recent version of bitbake (2014-06-11 or =
better) including this:
>> =
http://cgit.openembedded.org/bitbake/commit/?id=3D2e742c03e8dfdfa67899e7f5=
d579ed14bd87e139
>> It affects behavior of bb.utils.contains_any
>>=20
>> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
>> ---
>> meta/recipes-multimedia/libav/libav.inc | 30 =
++++++++++++++++++++++--------
>> 1 file changed, 22 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/meta/recipes-multimedia/libav/libav.inc =
b/meta/recipes-multimedia/libav/libav.inc
>> index a05a2a6..1d617a2 100644
>> --- a/meta/recipes-multimedia/libav/libav.inc
>> +++ b/meta/recipes-multimedia/libav/libav.inc
>> @@ -1,6 +1,12 @@
>> -SUMMARY =3D "A complete, cross-platform solution to record, convert =
and stream audio and video"
>> +SUMMARY =3D "Open source audio and video processing tools and =
librairies"
>> +DESCRIPTION =3D "Libav is a friendly and community-driven effort to =
provide its users \
>> +               with a set of portable, functional and =
high-performance libraries for \
>> +               dealing with multimedia formats of all sorts. It =
originates from the \
>> +               FFmpeg codebase, but goes its own way these days, =
providing its users \
>> +               with reliable releases and a clear vision how to go =
forward."
>> HOMEPAGE =3D "http://libav.org/"
>> SECTION =3D "libs"
>> +
>> LICENSE =3D "GPLv2+"
>> LICENSE_FLAGS =3D "commercial"
>>=20
>> @@ -9,7 +15,7 @@ PROVIDES =3D "ffmpeg"
>>=20
>> ARM_INSTRUCTION_SET =3D "arm"
>>=20
>> -DEPENDS =3D "zlib libogg libvorbis libtheora yasm-native"
>> +DEPENDS =3D "zlib libogg yasm-native"
>>=20
>> INC_PR =3D "r8"
>>=20
>> @@ -23,21 +29,29 @@ BUILD_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"
>> EXTRA_FFCONF_armv7a =3D "--cpu=3Dcortex-a8"
>> EXTRA_FFCONF ?=3D ""
>>=20
>> -PACKAGECONFIG ??=3D "bzip2 x264 =
${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
>> -PACKAGECONFIG[jack] =3D =
"--enable-indev=3Djack,--disable-indev=3Djack,jack"
>> +PACKAGECONFIG ??=3D "bzip2 x264 theora =
${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
>> PACKAGECONFIG[bzip2] =3D "--enable-bzlib,--disable-bzlib,bzip2"
>> -PACKAGECONFIG[schroedinger] =3D =
"--enable-libschroedinger,--disable-libschroedinger,schroedinger"
>> +PACKAGECONFIG[faac] =3D "--enable-libfaac,--disable-libfaac,faac"
>> PACKAGECONFIG[gsm] =3D "--enable-libgsm,--disable-libgsm,libgsm"
>> -PACKAGECONFIG[x264] =3D "--enable-libx264,--disable-libx264,x264"
>> -PACKAGECONFIG[vpx] =3D "--enable-libvpx,--disable-libvpx,libvpx"
>> +PACKAGECONFIG[jack] =3D =
"--enable-indev=3Djack,--disable-indev=3Djack,jack"
>> +PACKAGECONFIG[libvorbis] =3D =
"--enable-libvorbis,--disable-libvorbis,libvorbis"
>> PACKAGECONFIG[mp3lame] =3D =
"--enable-libmp3lame,--disable-libmp3lame,lame"
>> -PACKAGECONFIG[faac] =3D "--enable-libfaac,--disable-libfaac,faac"
>> +PACKAGECONFIG[openssl] =3D =
"--enable-openssl,--disable-openssl,openssl"
>> +PACKAGECONFIG[schroedinger] =3D =
"--enable-libschroedinger,--disable-libschroedinger,schroedinger"
>> +PACKAGECONFIG[speex] =3D =
"--enable-libspeex,--disable-libspeex,speex"
>> +PACKAGECONFIG[theora] =3D =
"--enable-libtheora,--disable-libtheora,libtheora"
>> +PACKAGECONFIG[vpx] =3D "--enable-libvpx,--disable-libvpx,libvpx"
>> PACKAGECONFIG[x11] =3D =
"--enable-x11grab,--disable-x11grab,virtual/libx11 libxfixes libxext =
xproto virtual/libsdl"
>> +PACKAGECONFIG[x264] =3D "--enable-libx264,--disable-libx264,x264"
>> +
>> +# Check codecs that require --enable-nonfree
>> +USE_NONFREE =3D "${@bb.utils.contains_any('PACKAGECONFIG', [ 'faac', =
'openssl' ], 'yes', '', d)}"
>>=20
>> EXTRA_OECONF =3D " \
>>     --enable-shared \
>>     --enable-pthreads \
>>     --enable-gpl \
>> +    ${@bb.utils.contains('USE_NONFREE', 'yes', '--enable-nonfree', =
'', d)} \
>=20
> cannot you just pass --enable-nonfree in faac and openssl =
PACKAGECONFIG?
> In worse case when both are enabled the option will be added twice.

If you have nonfree enabled, you need to change the license as well, it =
won't be GPL anymore.

regards,

Koen


>=20
>>     --enable-avfilter \
>>     \
>>     --cross-prefix=3D${TARGET_PREFIX} \
>> --=20
>> 2.0.0
>>=20
>> --=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


