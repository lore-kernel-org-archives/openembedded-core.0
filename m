Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D87CD4855
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 09:17:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71263.1778577424997131170
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 02:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=SfOOthvo;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B41094E40E02;
	Tue, 12 May 2026 09:17:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8375D60646;
	Tue, 12 May 2026 09:17:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1541711AF9DED;
	Tue, 12 May 2026 11:17:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778577422; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=0u7GkxJScZadlWogW/tW5MaF8ehU67zTdRX4MS6S014=;
	b=SfOOthvoKKyrP64NpFjt8oo7+PPfJl2cAg4LT8MxwQyk+KmAtAdQYl2T45WbBacTdIr5vI
	lFntyZXswByuoUCpIXmCaPPjdjDVjhqTsD2cAgqowLHMMpWbFmXlcRhK0h2M64kmAX7aYg
	y90cHvFoe5lNd4/wEiHcJyGXwQ5P2yozz+I5Cz+EK2rJfpheCdWbB65ejhmVjZ/dYJmChp
	Z9ZYx6oSQlsOgpbMjpZd0X1DXuh2I9XOY0sOmT4IL4heOLqhGyU/NN0HuFEAVh9D1rZ9wS
	KaGbtHeFXzIfQk/jnTTcVkkYmSisICYwAAYonQY8MGokvfhUN9Ghuu5Ui2aMag==
Message-ID: <fc44ecfe-7502-457b-9dcf-1f63ac4e5fc1@bootlin.com>
Date: Tue, 12 May 2026 11:17:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/3] ovmf: drop gcc-12 specific BUILD_CFLAGS
 setting
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 quentin.schulz@cherry.de, openembedded-core@lists.openembedded.org
References: <20260511092935.2631121-1-joaomarcos.costa@bootlin.com>
 <20260511092935.2631121-3-joaomarcos.costa@bootlin.com>
 <5f42f257-59fa-4085-a42c-7cbe55472567@cherry.de>
 <708f2321-2420-431e-8b9a-3a5a470228dd@bootlin.com>
 <bf76e336-9a8a-4488-a7fd-c4315303e53b@cherry.de>
 <2558d49d-58e6-4e0b-be28-3d27cf521dc1@bootlin.com>
 <a74ef617f11ddfc139fb23c7d688118de207712e.camel@linuxfoundation.org>
 <03127fae-4d0f-46b1-b740-b6020a10a3e8@bootlin.com>
 <8af0d0102205adfe2e997435e5fae90445c3c88e.camel@linuxfoundation.org>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <8af0d0102205adfe2e997435e5fae90445c3c88e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 09:17:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236871

Hello,

On 5/12/26 11:06, Richard Purdie wrote:
> On Tue, 2026-05-12 at 11:02 +0200, Joao Marcos Costa wrote:
>> Hello,
>>
>> On 5/12/26 10:46, Richard Purdie wrote:
>>> On Mon, 2026-05-11 at 16:00 +0200, Joao Marcos Costa via lists.openem=
bedded.org wrote:
>>>> Hello,
>>>>
>>>> On 5/11/26 15:52, Quentin Schulz via lists.openembedded.org wrote:
>>>> (...)
>>>>>
>>>>> Not necessarily true as I don't think we build GCC for native recip=
es
>>>>> (and ovmf has a native variant), so it depends on the GCC on the ho=
st
>>>>> (unless you have uninative?). I don't know the autobuilder
>>>>> infrastructure, e.g. whether we build patches on multiple workers o=
n
>>>>> different distros to have a big GCC version test matrix.
>>>>>
>>>>> But yes, building with a newer GCC will generally not make warnings=
 from
>>>>> previous versions disappear and I'm hoping upstream has had time to=
 fix
>>>>> warnings returned by GCC12 in the last 4 years :)
>>>>>
>>>>> Cheers,
>>>>> Quentin
>>>>
>>>> Yep, my whole point is based on the the distros in SANITY_TESTED_DIS=
TROS
>>>> being recent enough to ship GCC > 12 :)
>>>>
>>>> I should have made it explicit in my commit message.
>>>
>>> I hate to say this but:
>>>
>>> Alma/Centos/Rocky 8 have gcc 8
>>> Debian 11 has gcc 10
>>>
>>> and we don't use buildtools on debian 11.
>>>
>>> I'm therefore not sure how you concluded that from SANITY_TESTED_DIST=
ROS.
>>>
>>> Cheers,
>>>
>>> Richard
>>
>> Ah, my bad...
>>
>>  =C2=A0From this list here:
>> https://docs.yoctoproject.org/ref-manual/system-requirements.html#supp=
orted-linux-distributions
>>
>> Considering the versions of Fedora and Ubuntu, I presumed the other
>> distros were at least as recent (in terms of packages versions) as
>> Fedora 39 (which ships GCC 13).
>>
>> I will check the results in SWAT to see if this warnings pops up, but
>> the commit message could use a rewording to address this point and als=
o
>> some questions raised by Quentin, so a v2 will be sent later in this w=
eek.
>=20
> We currently support distros with gcc 10, I think that is clear.

It is clear, yes, but my point here is the -Wno-error=3Dstringop-overflow=
=20
already being available upstream in the version of edk2 we currently=20
use, and - as per what I understood in their git history - the flag was=20
added for the very same reason we have it in the recipe.

>=20
> It may or may not show up on the autobuilder due to sstate reuse, so
> relying on that as a way to check this is not appropriate.
>=20
> Also note:
>=20
> https://docs.yoctoproject.org/dev/ref-manual/system-requirements.html#r=
equired-git-tar-python-make-and-gcc-versions
>=20
> Personally I'd love to remove this but we simply can't without changing
> our documented host requirements.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20

--=20
Best regards,
Jo=C3=A3o Marcos Costa

