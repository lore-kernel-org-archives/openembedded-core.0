Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1C4C433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 21:13:25 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web12.353.1654031604640935329
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 14:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout09.t-online.de (Postfix) with SMTP id 852AE560A;
	Tue, 31 May 2022 23:13:22 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.46.125]) by fwd87.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nw9B2-0P8bCr0; Tue, 31 May 2022 23:13:20 +0200
Message-ID: <5afc1c44-ad58-85c5-fdf3-c697a009f5ab@t-online.de>
Date: Tue, 31 May 2022 23:13:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe-core][PATCH 4/4] libsdl2: dont mix opengl and gles backends
 for wayland
Content-Language: en-US
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20220531190620.186764-1-f_l_k@t-online.de>
 <20220531190620.186764-4-f_l_k@t-online.de>
 <ee7da03f7988fdfb22e800182644de692adfa59c.camel@linuxfoundation.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <ee7da03f7988fdfb22e800182644de692adfa59c.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1654031600-0142618F-04878AE5/0/0 CLEAN NORMAL
X-TOI-MSGID: 7e9b0ab8-bd25-4660-a2c5-b41dfd206f03
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 21:13:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166336

With x11, wayland and opengl:

-=C2=A0=C2=A0 SDL_OPENGL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Wanted: ON): ON
--=C2=A0=C2=A0 SDL_OPENGLES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Wanted: ON): ON
--=C2=A0=C2=A0 SDL_VULKAN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Wanted: ON): ON
--=C2=A0=C2=A0 SDL_WAYLAND=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Wanted: ON): ON
--=C2=A0=C2=A0 SDL_WAYLAND_LIBDECOR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (Wanted: ON): OFF
--=C2=A0=C2=A0 SDL_WAYLAND_LIBDECOR_SHARED (Wanted: ON): OFF
--=C2=A0=C2=A0 SDL_WAYLAND_QT_TOUCH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (Wanted: ON): ON
--=C2=A0=C2=A0 SDL_WAYLAND_SHARED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (Wanted: ON): ON
--=C2=A0=C2=A0 SDL_X11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Wa=
nted: ON): ON
--=C2=A0=C2=A0 SDL_X11_SHARED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Wanted: ON): ON


wayland and opengl:

--=C2=A0=C2=A0 SDL_OPENGL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Wanted: OFF): OFF
--=C2=A0=C2=A0 SDL_OPENGLES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Wanted: ON): ON
--=C2=A0=C2=A0 SDL_VULKAN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Wanted: ON): ON
--=C2=A0=C2=A0 SDL_WASAPI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Wanted: OFF): OFF
--=C2=A0=C2=A0 SDL_WAYLAND=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Wanted: ON): ON
--=C2=A0=C2=A0 SDL_WAYLAND_LIBDECOR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (Wanted: ON): OFF
--=C2=A0=C2=A0 SDL_WAYLAND_LIBDECOR_SHARED (Wanted: ON): OFF
--=C2=A0=C2=A0 SDL_WAYLAND_QT_TOUCH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (Wanted: ON): ON
--=C2=A0=C2=A0 SDL_WAYLAND_SHARED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (Wanted: ON): ON
--=C2=A0=C2=A0 SDL_X11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Wa=
nted: OFF): OFF
--=C2=A0=C2=A0 SDL_X11_SHARED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Wanted: OFF): OFF

x11 and opengl:

-- =C2=A0 SDL_OPENGL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Wanted: ON): ON
--=C2=A0=C2=A0 SDL_OPENGLES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Wanted: OFF): OFF
--=C2=A0=C2=A0 SDL_VULKAN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Wanted: ON): ON
--=C2=A0=C2=A0 SDL_WASAPI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Wanted: OFF): OFF
--=C2=A0=C2=A0 SDL_WAYLAND=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Wanted: OFF): OFF
--=C2=A0=C2=A0 SDL_WAYLAND_LIBDECOR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (Wanted: OFF): OFF
--=C2=A0=C2=A0 SDL_WAYLAND_LIBDECOR_SHARED (Wanted: OFF): OFF
--=C2=A0=C2=A0 SDL_WAYLAND_QT_TOUCH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (Wanted: OFF): OFF
--=C2=A0=C2=A0 SDL_WAYLAND_SHARED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (Wanted: OFF): OFF
--=C2=A0=C2=A0 SDL_X11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Wa=
nted: ON): ON
--=C2=A0=C2=A0 SDL_X11_SHARED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (Wanted: ON): ON

Looks good to me. I also had no build problems with wayland,x11 and openg=
l


Am 31.05.22 um 22:54 schrieb richard.purdie@linuxfoundation.org:
> On Tue, 2022-05-31 at 21:06 +0200, Markus Volk wrote:
>> This fixes "Could not initialize egl display" in libsdl2 apps for
>> wayland without DISTRO_FEATURE x11
>>
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> ---
>>   meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb b/meta/re=
cipes-graphics/libsdl2/libsdl2_2.0.22.bb
>> index 8519e7f732..e057b5cbbc 100644
>> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
>> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
>> @@ -56,14 +56,16 @@ EXTRA_OECMAKE =3D "-DSDL_OSS=3DOFF -DSDL_ESD=3DOFF=
 -DSDL_ARTS=3DOFF \
>>  =20
>>   # opengl packageconfig factored out to make it easy for distros
>>   # and BSP layers to pick either (desktop) opengl, gles2, or no GL
>> -PACKAGECONFIG_GL ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'opengl'=
, d)}"
>> +PACKAGECONFIG_GL ?=3D " \
>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '=
', d)} \
>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'gles2'=
, '', d)} \
>> +"
>>  =20
>>   PACKAGECONFIG:class-native =3D "x11 ${PACKAGECONFIG_GL}"
>>   PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('DISTRO_FEATUR=
ES', 'x11', d)} ${PACKAGECONFIG_GL}"
>>   PACKAGECONFIG ??=3D " \
>>       ${PACKAGECONFIG_GL} \
>> -    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x=
11', d)} \
>> -    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2=
', '', d)} \
>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x=
11 wayland', d)} \
>>       ${@bb.utils.contains("TUNE_FEATURES", "neon","arm-neon","",d)} \
>>   "
>>   PACKAGECONFIG[alsa]       =3D "-DSDL_ALSA=3DON,-DSDL_ALSA=3DOFF,alsa=
-lib,"
> If you have opengl, x11 and wayland in DISTRO_FEATURES, does that cause
> an issue? It would seem to change the config?
>
> Cheers,
>
> Richard

