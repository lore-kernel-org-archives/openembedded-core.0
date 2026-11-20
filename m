Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10234.1795193577702858586
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 08:52:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=y851+24k;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7D7E51A1750;
	Fri, 20 Nov 2026 16:52:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 52C5B601B9;
	Fri, 20 Nov 2026 16:52:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC7CB11BC0442;
	Fri, 20 Nov 2026 17:52:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795193570; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=y9MnRGxpoig2Qd2RHNgy3huwpN6NwjpezhaRJOlRWF4=;
	b=y851+24kjlOddK00wyoj2bQmEhyjuJg8e43PV8X2ERFVUk4sbqDOJ34L7UMYondR0hYreR
	sYf6yheG/AxnZivXOmanHLDCbSR6BCgOJ0qY5wT2b7qRzWFSSLD5sEGMa671XLIuptZjGD
	76KCLXTn9Ks485hPNPhaFtwst+tymxX4f8Zk9PgEqKwU0c2lS3OEucL7RoUL46VSEKY/HA
	7bS6GTKWu29qT58mLQsHh2VrX52OMExDewQftZqyKR4ouR1bzKt3Ol/ktvzgTwHvhWYlPq
	WAi+VTq18XyNBstTr+8s37YMwtZTXsoIhHugY/vcGaF0VcUwaWfHQTdJBi90mw==
Message-ID: <f9172023-9722-4549-a2e4-10a693d4198b@bootlin.com>
Date: Fri, 20 Nov 2026 17:52:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH 3/7] curl: fix CVE-2026-87865
To: Bastien Jauny <bastien.jauny@smile.fr>,
 openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, yoann.congal@smile.fr
References: <20261106144134.1370928-1-joaomarcos.costa@bootlin.com>
 <20261106144134.1370928-4-joaomarcos.costa@bootlin.com>
 <18E92C06A5741D4F.1359844@lists.openembedded.org>
 <DMYFZA08GN5O.1NH2ZMPJFRX2B@smile.fr>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <DMYFZA08GN5O.1NH2ZMPJFRX2B@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 16:53:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250817

Hello, Bastien

On 11/18/26 4:29 PM, Bastien Jauny wrote:
> On Wed Nov 18, 2026 at 4:05 PM CET, Bastien Jauny via openembedded-core=
 wrote:
>> On Fri Nov 6, 2026 at 3:41 PM CET, Joao Marcos Costa via openembedded-=
core wrote:
>>> This vulnerability, marked as High [1], was fixed upstream [2] since
>>> v8.23.0.
>>>
>>> Backport the fix to curl v8.7.1.
>>>
>>> [1] https://nvd.nist.gov/vuln/detail/cve-2026-87865
>>> [2] https://curl.se/docs/CVE-2026-87865.html
>>>
>>> Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarco=
s.costa@bootlin.com>
>>> ---
>>>   .../curl/curl/CVE-2026-87865.patch            | 212 +++++++++++++++=
+++
>>>   meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
>>>   2 files changed, 213 insertions(+)
>>>   create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87865.pa=
tch
>>>
>>
>> Hi,
>>
>> According to the versions affected, this should be seen upstream. I se=
e
>> it has been submitted for wrynose but nothing more.
>>
>> Could you please submit this one for blacksail also?
>>
>> Thanks,
>=20
> Sorry for the double mail, I should have reviewed the whole series
> beforehand.
> Patches 3/7, 4/7, 6/7 and 7/7 should be submitted to blacksail
> before going forward.
>=20
> I will drop 5/7 because the CVE is already taken care of in a
> previously submitted patch.
>=20
> Regards,

Sure, I'll be sending a patch series for blacksail soon enough.

--=20
Best regards,
Jo=C3=A3o Marcos Costa

