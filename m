Return-Path: <christoph.lauer@email.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EF2C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 17:11:53 +0000 (UTC)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by mx.groups.io with SMTP id smtpd.web09.12.1668445908383182301
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 09:11:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@email.de header.s=s29768273 header.b=jQiEIa2S;
 spf=pass (domain: email.de, ip: 217.72.192.78, mailfrom: christoph.lauer@email.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=email.de;
	s=s29768273; t=1668445905;
	bh=rm0kqJ+l+Jy3ZDx3fIaGcxafoBkZ0OQb5blpgvn1hbc=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jQiEIa2SglYhuvkmw8kFZqKTbxtq5oPY4bTuIbu7olZEdA9Od3eiOkw5TjVMmm3zF
	 qKJ3mqs6xDq7VB2ugAsJ256imx69QM9vo6aPhB7NJCQIjeNe5AAJGIBeTUEXAAY1dq
	 OMtwdBjOkWeroCY2ejvGfQ6/0oRILKWLnEO1S02nL5TnN2KzE0E0/qAwG4lBGmoTX9
	 BGXe8Pd+iB2Ecwil/HLnH6u2s71qAWGIHD9D08r3lnX3ifzXIJ3mhGdbx3+Oj9B03g
	 H+P02f+GTnq1RoQKIajdQW5brsLs8lp7BnKr1WGZ3s6nW9JsxlcJepBVZG9LaFGDq9
	 DXPY1SFJbK9rQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [172.18.0.184] ([178.251.90.190]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MNfU1-1oaTXv3dBj-00PEp8; Mon, 14
 Nov 2022 18:11:44 +0100
Message-ID: <95504430-1f2d-fd97-7397-0d94a4141555@email.de>
Date: Mon, 14 Nov 2022 18:11:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [PATCH] initial configs: set initial
 {DISTRO|MACHINE|IMAGE}FEATUREs as weak as possible
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <20221112163103.42796-1-christoph.lauer@email.de>
 <b6ac86a81444402796ff28436add5731@axis.com>
 <CANNYZj-CrvJpLCNFTi9Q__NWBc_25nUJqKwTqpEsHbU8wvCo6A@mail.gmail.com>
Content-Language: en-US
From: Christoph Lauer <Christoph.Lauer@email.de>
In-Reply-To: <CANNYZj-CrvJpLCNFTi9Q__NWBc_25nUJqKwTqpEsHbU8wvCo6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XJd4eUJD+Ec8SqFekylaTjcb1U42WnygoXz0SJwu13IfOG9srzR
 zs65mmI0fz+rumz/hglpc7sDsaNxlN8Olmw4QaSChEvO0XulO/huHlzcYgmweYpZmD5u3dE
 OV/ihsO09U3nY7zrHopkdbFf2809cTjNBIEU2+RZpxqVNE13iWEAQI6+kWG8nzJq0u342ez
 jQMZxS/iZXTUUFigKaEpg==
UI-OutboundReport: notjunk:1;M01:P0:4f+WBv58Nu4=;P0HA4EFmGtecZrCMPFGDA6wsWgC
 ParEoNEprywsxL8BIKnP6ZoySwOYl0CSjDYTNHsSex9JGc+Qpzz4JWhk7FV+wb9AtKcfpafaD
 Eu26Rdl4CvYmF/lpiUbovrQyia8DNfgcm/TIpWK5wpMGHqqaNI//w5Y1skV7rGclJJnCQobYs
 uoTPu+LMbyBTElO1qBh/REfyjF2a0T+huoQ+ApJMODKdNCA2cfiuM1MOPFPGMBe6FlOf95nR3
 I/voQLDiR68KwFRDO2OvT+GpGjDHStcIJQwBzWm+HPyj50+AdV4jhmdWkcoYL4dBKIL+hUOqA
 UWy/Etv6swCJyvKFZdqOkxLOBWCc/acYoDjTRfgJbwPckzEfdQUHCDlLT0yAFWAkw/OZJ+usx
 CO9a/QpatlceXYhUFVnvIygLfDd7H6XhZrGffcxWwoMvlC56rhB9uHMXzk/IrpdgciiVy+PgF
 +uOBgljCy9SHHk8lbe4qxZB2ams5Ng/vmi/lcRWXlbe0HUe8cRd5bRgBKp5HRoU3gHHNiRPr/
 0ekP3pPhUVdM21knnAo6wBMHVqJ+F/23VVwwwO+B4b0OS4kkJ1J02akLB3f7pwmr7RA6IcRt0
 KjnRAiKQMtSn28/8ORqR8EDRYsQXxgS7euRfTnXuePm4O9hwFu1m/8gLl07Ou1mDN1rm1jnLH
 W3lB4OQpHn+mBijD9mQ5lTpNaYkto6FSWY/p2ItmCUjs6yUKJXL55JTV7kD4BbSDyZBZV2LQs
 Ce9kbjXH56NjFpOFt9cfitDFmc5L9lJvA3AYDhzyDm7RKGoGGpg6M/ddpawcaI/q9Kquq3tiO
 +k+TZJldZV2IJcyQoo0YwdAlLELWRhGNBiMpdTktHOhlX5lWcmmBKUzxYll7SjQ0vaMNEweJV
 FLaQn9oShDcJdq+fg09sIb0ZDar281L5/qjeszwAYecgrIlvMprI+OSALCbYvohyOR6B1svq8
 loV2IN1LeXzVrHP2fYzQF1/Rius=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 17:11:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173253

Thank you for looking at the patch. I realized there is no real use case
that would require this. The idea was to initialize new values with the
weakest setting, but I may have underestimated the problems that come
with it.
This patch can be discarded.

Christoph

Am 13.11.22 um 18:48 schrieb Alexander Kanavin:
> It helps if you explain what use case this enables that cannot be
> currently fulfilled. (not a generic 'change features with weak
> defaults' but specific examples of adding and removing and setting
> features).
>
> Alex
>
> On Sun, 13 Nov 2022 at 14:43, Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
>>
>>> -----Original Message-----
>>> From: openembedded-core@lists.openembedded.org <openembedded-core@list=
s.openembedded.org> On Behalf Of Christoph Lauer
>>> Sent: den 12 november 2022 17:31
>>> To: openembedded-core@lists.openembedded.org
>>> Cc: Christoph Lauer <christoph.lauer@xtronic.de>
>>> Subject: [OE-core] [PATCH] initial configs: set initial {DISTRO|MACHIN=
E|IMAGE}FEATUREs as weak as possible
>>>
>>> From: Christoph Lauer <christoph.lauer@xtronic.de>
>>>
>>> This gives BSP creators the flexibility to change features with weak d=
efaults
>>>
>>> Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
>>> ---
>>>   meta-poky/conf/distro/poky.conf               |  2 +-
>>>   meta/conf/bitbake.conf                        | 28 +++++++++--------=
--
>>>   .../distro/include/default-distrovars.inc     |  6 ++--
>>>   meta/conf/machine/include/qemu.inc            |  2 +-
>>>   meta/conf/machine/include/riscv/qemuriscv.inc |  2 +-
>>>   5 files changed, 20 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/p=
oky.conf
>>> index 3e90766349..3a453ef9ed 100644
>>> --- a/meta-poky/conf/distro/poky.conf
>>> +++ b/meta-poky/conf/distro/poky.conf
>>> @@ -18,7 +18,7 @@ POKY_DEFAULT_DISTRO_FEATURES =3D "largefile opengl p=
test multiarch wayland vulkan"
>>>   POKY_DEFAULT_EXTRA_RDEPENDS =3D "packagegroup-core-boot"
>>>   POKY_DEFAULT_EXTRA_RRECOMMENDS =3D "kernel-module-af-packet"
>>>
>>> -DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTR=
O_FEATURES}"
>>> +DISTRO_FEATURES ??=3D "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DIST=
RO_FEATURES}"
>>>
>>>   PREFERRED_VERSION_linux-yocto ?=3D "5.19%"
>>>   PREFERRED_VERSION_linux-yocto-rt ?=3D "5.19%"
>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>> index dea573986d..b2540bb3f5 100644
>>> --- a/meta/conf/bitbake.conf
>>> +++ b/meta/conf/bitbake.conf
>>> @@ -885,31 +885,31 @@ OES_BITBAKE_CONF =3D "1"
>>>   # Machine properties and packagegroup-base stuff
>>>   ##################################################################
>>>
>>> -MACHINE_FEATURES ?=3D ""
>>> -DISTRO_FEATURES ?=3D ""
>>> +MACHINE_FEATURES ??=3D ""
>>> +DISTRO_FEATURES ??=3D ""
>>>
>>> -DISTRO_EXTRA_RDEPENDS ?=3D ""
>>> -DISTRO_EXTRA_RRECOMMENDS ?=3D ""
>>> -MACHINE_EXTRA_RDEPENDS ?=3D ""
>>> -MACHINE_EXTRA_RRECOMMENDS ?=3D ""
>>> -MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?=3D ""
>>> -MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?=3D ""
>>> +DISTRO_EXTRA_RDEPENDS ??=3D ""
>>> +DISTRO_EXTRA_RRECOMMENDS ??=3D ""
>>> +MACHINE_EXTRA_RDEPENDS ??=3D ""
>>> +MACHINE_EXTRA_RRECOMMENDS ??=3D ""
>>> +MACHINE_ESSENTIAL_EXTRA_RDEPENDS ??=3D ""
>>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ??=3D ""
>>>
>>>   EXTRA_IMAGE_FEATURES ??=3D ""
>>>   IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
>>>
>>>   # Native distro features (will always be used for -native, even if t=
hey
>>>   # are not enabled for target)
>>> -DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
>>> -DISTRO_FEATURES_NATIVESDK ?=3D "x11"
>>> +DISTRO_FEATURES_NATIVE ??=3D "x11 ipv6 xattr"
>>> +DISTRO_FEATURES_NATIVESDK ??=3D "x11"
>>>
>>>   # Normally target distro features will not be applied to native buil=
ds:
>>>   # Native distro features on this list will use the target feature va=
lue
>>> -DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginfod open=
gl wayland"
>>> -DISTRO_FEATURES_FILTER_NATIVESDK ?=3D "api-documentation debuginfod o=
pengl wayland"
>>> +DISTRO_FEATURES_FILTER_NATIVE ??=3D "api-documentation debuginfod ope=
ngl wayland"
>>> +DISTRO_FEATURES_FILTER_NATIVESDK ??=3D "api-documentation debuginfod =
opengl wayland"
>>>
>>> -DISTRO_FEATURES_BACKFILL =3D "pulseaudio sysvinit gobject-introspecti=
on-data ldconfig"
>>> -MACHINE_FEATURES_BACKFILL =3D "rtc qemu-usermode"
>>> +DISTRO_FEATURES_BACKFILL ??=3D "pulseaudio sysvinit gobject-introspec=
tion-data ldconfig"
>>> +MACHINE_FEATURES_BACKFILL ??=3D "rtc qemu-usermode"
>>>
>>>   COMBINED_FEATURES =3D "${@oe.utils.set_intersect('DISTRO_FEATURES', =
'MACHINE_FEATURES', d)}"
>>>   COMBINED_FEATURES[vardeps] +=3D "DISTRO_FEATURES MACHINE_FEATURES"
>>> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/co=
nf/distro/include/default-distrovars.inc
>>> index abf48f79f0..3b3d439ad3 100644
>>> --- a/meta/conf/distro/include/default-distrovars.inc
>>> +++ b/meta/conf/distro/include/default-distrovars.inc
>>> @@ -19,9 +19,9 @@ DISTRO_FEATURES_DEFAULT:remove:arc =3D "seccomp"
>>>   # seccomp is not yet ported to microblaze
>>>   DISTRO_FEATURES_DEFAULT:remove:microblaze =3D "seccomp"
>>>
>>> -DISTRO_FEATURES_DEFAULT ?=3D "acl alsa bluetooth debuginfod ext2 ipv4=
 ipv6 pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat=
 seccomp"
>>> -DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT}"
>>> -IMAGE_FEATURES ?=3D ""
>>> +DISTRO_FEATURES_DEFAULT ??=3D "acl alsa bluetooth debuginfod ext2 ipv=
4 ipv6 pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfa=
t seccomp"
>>> +DISTRO_FEATURES ??=3D "${DISTRO_FEATURES_DEFAULT}"
>>> +IMAGE_FEATURES ??=3D ""
>>>
>>>   COMMERCIAL_AUDIO_PLUGINS ?=3D ""
>>>   # COMMERCIAL_AUDIO_PLUGINS ?=3D "gst-plugins-ugly-mad gst-plugins-ug=
ly-mpegaudioparse"
>>> diff --git a/meta/conf/machine/include/qemu.inc
>>> b/meta/conf/machine/include/qemu.inc
>>> index d9bed7708d..04ffe55309 100644
>>> --- a/meta/conf/machine/include/qemu.inc
>>> +++ b/meta/conf/machine/include/qemu.inc
>>> @@ -10,7 +10,7 @@ XSERVER ?=3D "xserver-xorg \
>>>               xf86-video-fbdev \
>>>               "
>>>
>>> -MACHINE_FEATURES =3D "alsa bluetooth usbgadget screen vfat"
>>> +MACHINE_FEATURES ??=3D "alsa bluetooth usbgadget screen vfat"
>>>
>>>   MACHINEOVERRIDES =3D. "qemuall:"
>>>
>>> diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf=
/machine/include/riscv/qemuriscv.inc
>>> index 0b399ac1f9..f5f9f89a9f 100644
>>> --- a/meta/conf/machine/include/riscv/qemuriscv.inc
>>> +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
>>> @@ -3,7 +3,7 @@ PREFERRED_PROVIDER_virtual/bootloader ??=3D "u-boot"
>>>   require conf/machine/include/qemu.inc
>>>   require conf/machine/include/riscv/tune-riscv.inc
>>>
>>> -MACHINE_FEATURES =3D "screen keyboard ext2 ext3 serial"
>>> +MACHINE_FEATURES ?=3D "screen keyboard ext2 ext3 serial"
>>>
>>>   KERNEL_IMAGETYPE =3D "Image"
>>>   KERNEL_IMAGETYPES +=3D "uImage"
>>> --
>>> 2.17.1
>>
>> This is a breaking change, which can have a lot of not easily detected
>> consequences, and I would advise against it. Changing ??=3D to ?=3D mea=
ns
>> that you can no longer do, e.g., DISTRO_FEATURES +=3D " foo" in your
>> configuration. For comparison, if you add the following to a recipe or
>> your local.conf:
>>
>> FOOBAR1 ??=3D "foo"
>> FOOBAR1 +=3D "bar"
>> FOOBAR2 ?=3D "foo"
>> FOOBAR2 +=3D "bar"
>>
>> the result will be:
>>
>> FOOBAR1=3D" bar"
>> FOOBAR2=3D"foo bar"
>>
>> If your patch is applied to Poky, this is the resulting change in the
>> configuration:
>>
>> --- a.txt       2022-11-13 14:34:17.882922391 +0100
>> +++ b.txt       2022-11-13 14:34:37.902531305 +0100
>> @@ -7,6 +7,6 @@
>>   DISTRO_FEATURES_NATIVE=3D"x11 ipv6 xattr"
>>   DISTRO_FEATURES_NATIVESDK=3D"x11"
>>   IMAGE_FEATURES=3D" debug-tweaks ptest-pkgs debug-tweaks tools-debug"
>> -MACHINE_FEATURES=3D"alsa bluetooth usbgadget screen vfat x86 pci rtc q=
emu-usermode"
>> +MACHINE_FEATURES=3D" x86 pci rtc qemu-usermode"
>>   MACHINE_FEATURES_BACKFILL=3D"rtc qemu-usermode"
>>   MACHINE_FEATURES_BACKFILL_CONSIDERED=3D" "
>>
>> As can be seen, your change has modified the default configuration for
>> qemux86-64 and you did not notice, even though you were aware that you
>> were changing the variables. Imagine what it would do to others...
>>
>> //Peter
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#173193): https://lists.openembedded.org/g/openembed=
ded-core/message/173193
>> Mute This Topic: https://lists.openembedded.org/mt/94982790/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

