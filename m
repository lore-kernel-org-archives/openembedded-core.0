Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E55C433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 20:12:47 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web08.498.1652991165874478813
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 13:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout04.t-online.de (Postfix) with SMTP id 6FAA14E0A
	for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 22:12:43 +0200 (CEST)
Received: from [192.168.178.83] ([84.154.174.3]) by fwd78.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nrmVm-1HexQP0; Thu, 19 May 2022 22:12:42 +0200
Message-ID: <d1d9a344-e54d-2418-4a39-95d1eb6882f7@t-online.de>
Date: Thu, 19 May 2022 22:12:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [OE-core] [meta-oe][RFC PATCH 1/2] libdecor: initial add recipe
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220519064312.391164-1-f_l_k@t-online.de>
 <20220519184315.1e91b017@melee>
 <CANNYZj8xWvRMVGjo1qaV0Gah0U9a42SqyFf=C9bZ64DTh8qZuQ@mail.gmail.com>
 <d9dedcbf-0e79-2333-91d1-7938f4fb3865@t-online.de>
 <CANNYZj8eCxa+4xn_F=h608DjJsSep+gxv3CMqMvSwWWGgpZBXw@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <CANNYZj8eCxa+4xn_F=h608DjJsSep+gxv3CMqMvSwWWGgpZBXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1652991162-0000AD4E-FAB1FA8C/0/0 CLEAN NORMAL
X-TOI-MSGID: 3c90489c-2e8a-4873-9bba-e541d71250ba
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 20:12:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165911

To my knowledge libsdl2 is the=C2=A0 only consumer of libdecor right now.=
 If=20
you want to be able to run sdl programs
in windows instead of just having them pasted to the background you=20
would want to enable it by default.
I love libsdl so my answer would be ... of course it should be build=20
with decoration by default for weston.
But on the other hand ... its mostly useful for games and fun stuff so=20
it really depends on your goals.

Markus
> If it is in core, there should be something in core that consumes and
> makes use of it, and preferably automated tests for it. Is this the
> case? Shall weston enable it by default then?
>
> Alex
>
> On Thu, 19 May 2022 at 21:43, Markus Volk <f_l_k@t-online.de> wrote:
>> It doesn't need to be in core, but i would call having window decorati=
on a core component
>> because otherwise things will just not work as expected for weston/gno=
me-shell. I could also
>> send that recipe to meta-oe if you prefer or just store it in meta-way=
land since its wayland related stuff but
>> if you aim to support libsdl in a proper way this recipe should be aro=
und somewhere i think.
>> Personally i prefer sway. It has server side decoration and there is n=
o need for libdecor.
>>
>> Markus
>>
>>   Am 19.05.22 um 18:46 schrieb Alexander Kanavin:
>>
>> Also, does this need to be in core (as opposed to meta-oe)? Why?
>>
>> Alex
>>
>> On Thu, 19 May 2022 at 18:43, Luca Ceresoli via lists.openembedded.org
>> <luca.ceresoli=3Dbootlin.com@lists.openembedded.org> wrote:
>>
>> Hi Markus,
>>
>> Il giorno Thu, 19 May 2022 08:43:11 +0200
>> "Markus Volk" <f_l_k@t-online.de> ha scritto:
>>
>> libdecor is a client-side decoration library for Wayland clients. It
>> is used by libsdl2 for window decoration and is required to provide
>> decoration for shells that use client-side decoration such as
>> gnome-shell or weston.
>>
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>>
>> I'm afraid we're having an issue with this patch as well:
>>
>> AssertionError:
>> The following recipes do not have a maintainer assigned to them. Pleas=
e
>> add an entry to meta/conf/distro/include/maintainers.inc file. libdeco=
r
>> (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-gr=
aphics/libdecor/libdecor_0.1.0.bb)
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3547=
/steps/14/logs/stdio
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3604=
/steps/15/logs/stdio
>>
>> And also this warning:
>>
>> WARNING: Nothing RPROVIDES 'nativesdk-libdecor' (but
>> virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/m=
eta/recipes-graphics/libdecor/libdecor_0.1.0.bb
>> RDEPENDS on or otherwise requires it) No eligible RPROVIDERs exist for
>> 'nativesdk-libdecor' NOTE: Runtime target 'nativesdk-libdecor' is
>> unbuildable, removing... Missing or unbuildable dependency chain was:
>> ['nativesdk-libdecor'] WARNING: Nothing RPROVIDES
>> 'nativesdk-libdecor-dev' (but
>> virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/m=
eta/recipes-graphics/libdecor/libdecor_0.1.0.bb
>> RDEPENDS on or otherwise requires it) No eligible RPROVIDERs exist for
>> 'nativesdk-libdecor-dev' NOTE: Runtime target 'nativesdk-libdecor-dev'
>> is unbuildable, removing... Missing or unbuildable dependency chain
>> was: ['nativesdk-libdecor-dev']
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/5543=
/steps/12/logs/stdio
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/4571=
/steps/12/logs/stdio
>>
>> --
>> Luca Ceresoli, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#165910): https://lists.openembedded.org/g/openembe=
dded-core/message/165910
>> Mute This Topic: https://lists.openembedded.org/mt/91203655/3618223
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[f_l_k@t-online.de]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

