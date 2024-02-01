Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15D8C47258
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 02:17:08 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.6359.1706753823830727638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 18:17:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 4112FwkQ023362;
	Wed, 31 Jan 2024 20:15:59 -0600
Message-ID: <1784bb31-b573-4fb1-8ab7-6bee719e7071@kernel.crashing.org>
Date: Wed, 31 Jan 2024 20:15:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/4] tune-cortexa78.inc: Add cortexa78 tune,
 based on cortexa77
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <1706743783-10659-1-git-send-email-mark.hatle@kernel.crashing.org>
 <1706743783-10659-2-git-send-email-mark.hatle@kernel.crashing.org>
 <CAMKF1spTk=-ruCfNpxC12skg=KCLF71NbFUY-xa5qRRHX5PkZg@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <CAMKF1spTk=-ruCfNpxC12skg=KCLF71NbFUY-xa5qRRHX5PkZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 4112FwkQ023362
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 02:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194546

It should be the same as the cortexa77.inc file, but say 78..  So I've no=
=20
problems with that change if it's in master.

--Mark

On 1/31/24 8:09 PM, Khem Raj wrote:
> On Wed, Jan 31, 2024 at 3:29=E2=80=AFPM Mark Hatle
> <mark.hatle@kernel.crashing.org> wrote:
>>
>> From: Mark Hatle <mark.hatle@amd.com>
>>
>> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
>> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
>> ---
>>   .../include/arm/armv8-2a/tune-cortexa78.inc      | 16 ++++++++++++++=
++
>>   1 file changed, 16 insertions(+)
>>   create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-corte=
xa78.inc
>>
>> diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78.inc=
 b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78.inc
>> new file mode 100644
>> index 0000000000..8c85d98ef9
>> --- /dev/null
>> +++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78.inc
>> @@ -0,0 +1,16 @@
>> +#
>> +# Tune Settings for Cortex-A78
>> +#
>> +DEFAULTTUNE                                        ?=3D "cortexa78"
>> +
>> +TUNEVALID[cortexa78] =3D "Enable Cortex-A78 specific processor optimi=
zations"
>> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa78', =
' -mcpu=3Dcortex-a78', '', d)}"
>> +
>> +require conf/machine/include/arm/arch-armv8-2a.inc
>> +
>> +# Little Endian base configs
>> +AVAILTUNES                                         +=3D "cortexa78"
>> +ARMPKGARCH:tune-cortexa78                           =3D "cortexa78"
>> +TUNE_FEATURES:tune-cortexa78                        =3D "${TUNE_FEATU=
RES:tune-armv8-2a-crypto} cortexa78"
>=20
> I think this should be set to "aarch64 crypto cortexa78" inline with
> patch I sent last week [1], otherwise it looks ok.
>=20
> [1] https://lore.kernel.org/openembedded-core/20240126233141.1589013-1-=
raj.khem@gmail.com/
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194545): https://lists.openembedded.org/g/openembed=
ded-core/message/194545
> Mute This Topic: https://lists.openembedded.org/mt/104086355/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
mark.hatle@kernel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

