Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11312.1793805158671751892
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 07:12:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=0E/KfnQg;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5B4994E41403
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2026 15:12:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11D7B60770;
	Wed,  4 Nov 2026 15:12:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74BF1103291F6;
	Wed,  4 Nov 2026 16:12:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793805151; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=cSaIj4OqKEMGOzDRn16ddcCMjiresOajLtShyfK9zm4=;
	b=0E/KfnQgyCFpJpV8xVjrWlOvS/2nnyLLF/HKZ6oMVngehQUyTDfzJ9p0eJBpNU6Nn2s41C
	qMlPTEtunJu7wIMeaFL2Qm2t3+BfvINexQJ9MCv6mzDZNHQYZ7RJaYYh9fg+qi7nxy+XBV
	EbPLcQnqmmYgcB/xzBOQZcFMPBcAn//yrKTUQaCUgRltcbUMaJUgIWS4w98kOuNTp01cFE
	kJZq++qjn150nbpbV9SFNEqeX3bKODgrs9HXF/2PAo9jahj3TeU/NPziwR2kyGF09eY7Ni
	cvrpOtU/aaTJu1tAlYCuhwSTd4dD9kbasx/AsOLM89ASvwnUw9CRMQjYTcY9Dg==
Message-ID: <d7345f9c-3bb6-4b33-b800-c0b116287d3b@bootlin.com>
Date: Wed, 4 Nov 2026 16:12:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] expat: fix CVE-2026-117610
To: Yoann Congal <yoann.congal@smile.fr>,
 openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
References: <20261104142512.1562219-1-joaomarcos.costa@bootlin.com>
 <DMMIRR2WICTU.2CVIAJ7I966Q9@smile.fr>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <DMMIRR2WICTU.2CVIAJ7I966Q9@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 15:12:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249389

Hello, Yoan

On 11/4/26 4:08 PM, Yoann Congal wrote:
> On Wed Nov 4, 2026 at 3:25 PM CET, Joao Marcos Costa via openembedded-c=
ore wrote:
>> This vulnerability, marked as High [1], was fixed upstream [2] since
>> 2.10.0.
>>
>> Backport the fix to expat v2.8.3.
>>
>> This backport is actually partial. PR#1444 adds a second commit provid=
ing a
>> new test case, but the code uses helper functions not yet
>> defined/available. A few other commits would also need to be backporte=
d so
>> that the test compiles at v2.8.3.
>>
>> [1] https://nvd.nist.gov/vuln/detail/cve-2026-117610
>> [2] https://github.com/libexpat/libexpat/pull/1444
>>
>> Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos=
.costa@bootlin.com>
>> ---
>>   .../expat/expat/CVE-2026-117610.patch         | 30 +++++++++++++++++=
++
>>   meta/recipes-core/expat/expat_2.8.3.bb        |  1 +
>>   2 files changed, 31 insertions(+)
>>   create mode 100644 meta/recipes-core/expat/expat/CVE-2026-117610.pat=
ch
>=20
> Hello,
>=20
> You just sent "[scarthgap][PATCH] expat: fix CVE-2026-118370" which
> conflict with this one. Even if I have tooling in place to handle this
> kind of conflict, I'd rather you send conflicting patches as a series.
>=20
> No need of a v2 just for that but something for future series.
>=20
> Thanks!

I considered the series, but for some reason I thought these orthogonal=20
fixes would be easier to review if sent separately. My bad!

--=20
Best regards,
Jo=C3=A3o Marcos Costa

