Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C820C433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 19:43:17 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web12.171.1652989389130524057
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 12:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83,
 mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout07.t-online.de (Postfix) with SMTP id D9D334028;
	Thu, 19 May 2022 21:43:06 +0200 (CEST)
Received: from [192.168.178.83] ([84.154.174.3]) by fwd75.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nrm2z-2mz8XB0; Thu, 19 May 2022 21:42:57 +0200
Content-Type: multipart/alternative;
 boundary="------------2R0WiO7bRObyeDcHQDrBQUP8"
Message-ID: <d9dedcbf-0e79-2333-91d1-7938f4fb3865@t-online.de>
Date: Thu, 19 May 2022 21:42:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [OE-core] [meta-oe][RFC PATCH 1/2] libdecor: initial add recipe
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20220519064312.391164-1-f_l_k@t-online.de>
 <20220519184315.1e91b017@melee>
 <CANNYZj8xWvRMVGjo1qaV0Gah0U9a42SqyFf=C9bZ64DTh8qZuQ@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <CANNYZj8xWvRMVGjo1qaV0Gah0U9a42SqyFf=C9bZ64DTh8qZuQ@mail.gmail.com>
X-TOI-EXPURGATEID: 150726::1652989377-000184BD-8E28E40A/0/0 CLEAN NORMAL
X-TOI-MSGID: 01d945e0-6cab-40ed-81d9-e0f4bc7e2c93
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 19:43:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165909

This is a multi-part message in MIME format.
--------------2R0WiO7bRObyeDcHQDrBQUP8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

It doesn't need to be in core, but i would call having window decoration=20
a core component
because otherwise things will just not work as expected for=20
weston/gnome-shell. I could also
send that recipe to meta-oe if you prefer or just store it in=20
meta-wayland since its wayland related stuff but
if you aim to support libsdl in a proper way this recipe should be=20
around somewhere i think.
Personally i prefer sway. It has server side decoration and there is no=20
need for libdecor.

Markus

 =C2=A0Am 19.05.22 um 18:46 schrieb Alexander Kanavin:
> Also, does this need to be in core (as opposed to meta-oe)? Why?
>
> Alex
>
> On Thu, 19 May 2022 at 18:43, Luca Ceresoli via lists.openembedded.org
> <luca.ceresoli=3Dbootlin.com@lists.openembedded.org>  wrote:
>> Hi Markus,
>>
>> Il giorno Thu, 19 May 2022 08:43:11 +0200
>> "Markus Volk"<f_l_k@t-online.de>  ha scritto:
>>
>>> libdecor is a client-side decoration library for Wayland clients. It
>>> is used by libsdl2 for window decoration and is required to provide
>>> decoration for shells that use client-side decoration such as
>>> gnome-shell or weston.
>>>
>>> Signed-off-by: Markus Volk<f_l_k@t-online.de>
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
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#165903):https://lists.openembedded.org/g/openembed=
ded-core/message/165903
>> Mute This Topic:https://lists.openembedded.org/mt/91203655/1686489
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------2R0WiO7bRObyeDcHQDrBQUP8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <font face=3D"Liberation Sans">It doesn't need to be in core, but i
      would call having window decoration a core component</font><br>
    <font face=3D"Liberation Sans">because otherwise things will just not
      work as expected for weston/gnome-shell. I could also</font><br>
    <font face=3D"Liberation Sans">send that recipe to meta-oe if you
      prefer or just store it in meta-wayland since its wayland related
      stuff but</font><br>
    <font face=3D"Liberation Sans">if you aim to support libsdl in a
      proper way this recipe should be around somewhere i think. </font><=
br>
    <font face=3D"Liberation Sans">Personally i prefer sway. It has serve=
r
      side decoration and there is no need for libdecor.</font><br>
    <font face=3D"Liberation Sans"><br>
    </font>
    <p><font face=3D"Liberation Sans">Markus</font></p>
    <div class=3D"moz-cite-prefix">=C2=A0Am 19.05.22 um 18:46 schrieb Ale=
xander
      Kanavin:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CANNYZj8xWvRMVGjo1qaV0Gah0U9a42SqyFf=3DC9bZ64DTh8qZuQ@mail.gm=
ail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">Also, does this need to be i=
n core (as opposed to meta-oe)? Why?

Alex

On Thu, 19 May 2022 at 18:43, Luca Ceresoli via lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:luca.ceresoli=3Dbootlin=
.com@lists.openembedded.org">&lt;luca.ceresoli=3Dbootlin.com@lists.openem=
bedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Hi Markus,

Il giorno Thu, 19 May 2022 08:43:11 +0200
"Markus Volk" <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:f_l_k@t-o=
nline.de">&lt;f_l_k@t-online.de&gt;</a> ha scritto:

</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">libdecor is a client-sid=
e decoration library for Wayland clients. It
is used by libsdl2 for window decoration and is required to provide
decoration for shells that use client-side decoration such as
gnome-shell or weston.

Signed-off-by: Markus Volk <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:f_l_k@t-online.de">&lt;f_l_k@t-online.de&gt;</a>
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
I'm afraid we're having an issue with this patch as well:

AssertionError:
The following recipes do not have a maintainer assigned to them. Please
add an entry to meta/conf/distro/include/maintainers.inc file. libdecor
(/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-graph=
ics/libdecor/libdecor_0.1.0.bb)

<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/80/builds/3547/steps/14/logs/stdio">https://aut=
obuilder.yoctoproject.org/typhoon/#/builders/80/builds/3547/steps/14/logs=
/stdio</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/79/builds/3604/steps/15/logs/stdio">https://aut=
obuilder.yoctoproject.org/typhoon/#/builders/79/builds/3604/steps/15/logs=
/stdio</a>

And also this warning:

WARNING: Nothing RPROVIDES 'nativesdk-libdecor' (but
virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/meta=
/recipes-graphics/libdecor/libdecor_0.1.0.bb
RDEPENDS on or otherwise requires it) No eligible RPROVIDERs exist for
'nativesdk-libdecor' NOTE: Runtime target 'nativesdk-libdecor' is
unbuildable, removing... Missing or unbuildable dependency chain was:
['nativesdk-libdecor'] WARNING: Nothing RPROVIDES
'nativesdk-libdecor-dev' (but
virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/meta=
/recipes-graphics/libdecor/libdecor_0.1.0.bb
RDEPENDS on or otherwise requires it) No eligible RPROVIDERs exist for
'nativesdk-libdecor-dev' NOTE: Runtime target 'nativesdk-libdecor-dev'
is unbuildable, removing... Missing or unbuildable dependency chain
was: ['nativesdk-libdecor-dev']

<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/23/builds/5543/steps/12/logs/stdio">https://aut=
obuilder.yoctoproject.org/typhoon/#/builders/23/builds/5543/steps/12/logs=
/stdio</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/97/builds/4571/steps/12/logs/stdio">https://aut=
obuilder.yoctoproject.org/typhoon/#/builders/97/builds/4571/steps/12/logs=
/stdio</a>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
<a class=3D"moz-txt-link-freetext" href=3D"https://bootlin.com">https://b=
ootlin.com</a>

-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#165903): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/165903">https:/=
/lists.openembedded.org/g/openembedded-core/message/165903</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/91203655/1686489">https://lists.openembedded.org/mt/=
91203655/1686489</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------2R0WiO7bRObyeDcHQDrBQUP8--

