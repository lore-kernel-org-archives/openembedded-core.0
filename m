Return-Path: <lkml@jv-coder.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56664C54F3E
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:55 +0000 (UTC)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 by mx.groups.io with SMTP id smtpd.web12.8181.1649913890632759692
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 22:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@jv-coder.de
 header.s=dkim header.b=l2QB1RvC;
 spf=pass (domain: jv-coder.de, ip: 5.9.79.73, mailfrom: lkml@jv-coder.de)
Received: from [192.168.178.40] (unknown [188.192.100.83])
	by mail.jv-coder.de (Postfix) with ESMTPSA id 8804B9FDD8;
	Thu, 14 Apr 2022 05:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
	t=1649913886; bh=7mWqhM6uwwNVEDqBgUJ/dpAUsaC2FRoK8s2XbHWJ2bE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=l2QB1RvCtoesYfdPAa24tNpGtWZbsvTE2/14ndphYzFtzct58qzBJQ0wZ5ifWqWWx
	 0UcUuauPLqyQKtd0nOkQ6mP6Rz5xUV2GAHYLz2so22CBFrnuwrZtoUdzgsH5ujHqp1
	 ogUYlu7tRUiKRe3o/x2UGe1rIa1b4KWYP/QaQhxk=
Message-ID: <c01611bd-8a0b-b91c-ff8a-bae9b877d1ee@jv-coder.de>
Date: Thu, 14 Apr 2022 07:24:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] go: Always pass interpreter to linker
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Joerg Vehlow <joerg.vehlow@aox.de>
References: <20220411123520.95107-1-lkml@jv-coder.de>
 <CANPvuRnKqQaanAZMVWym8K+t3sBm_noNNoCH=kV37RWtb8ncqw@mail.gmail.com>
 <CAMKF1sq2zZigpSpX5AzgTY+7Q0JR1q2pWDOgcioTPeQ6F52nkg@mail.gmail.com>
From: Joerg Vehlow <lkml@jv-coder.de>
In-Reply-To: 
 <CAMKF1sq2zZigpSpX5AzgTY+7Q0JR1q2pWDOgcioTPeQ6F52nkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164388

Hi,

Am 4/11/2022 um 6:04 PM schrieb Khem Raj:
> On Mon, Apr 11, 2022 at 6:30 AM Jose Quaresma <quaresma.jose@gmail.com>=
 wrote:
>>
>>
>>
>> J?rg Vehlow <lkml@jv-coder.de> escreveu no dia segunda, 11/04/2022 =C3=
=A0(s) 13:35:
>>>
>>> From: Joerg Vehlow <joerg.vehlow@aox.de>
>>>
>>> When gos internal linker is used, it uses hardcoded paths to the
>>> interpreter (dynamic linker). For x86_64 this hardcoded path is
>>> /lib64/ld-linux-x86-64.so.2, but yocto's default dynamic linker path
>>> is /lib64/ld-linux-x86-64.so.2.
>>
>>
>> Is this correct? The first path is the seme one of the second.
>=20
> its a typo, Sadly we do differ in baselib naming convention on x86_64
> ( without multilib )
> compared to other distributions which are inherently multilib and use
> /lib64 OE instead uses
> /lib when multilib is not enabled but lib64/ when multilib is enabled.

Any comment on the content of the patch or do I have to send a v2 with a
fixed commit message?

Thanks,
Joerg

