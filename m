Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39565.1795604012838256457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 02:53:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=H4TsrBsc;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4865A1A17DD;
	Wed, 25 Nov 2026 10:53:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1826C60480;
	Wed, 25 Nov 2026 10:53:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ACADA11E69CE5;
	Wed, 25 Nov 2026 11:53:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795604009; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=kWwHWtKVlkSaFMVYDCCJ1/JGz8WlwmWmnPm2cW6TlkU=;
	b=H4TsrBsc+CbqUmBXouY2/q7VkqevDMkzngLlWd6ks/AMqlA5qsfFl+G4SNdhRr4OBy2pAD
	pmhgpGVnU9nk54skRGxy3tqsveL3LVDBh/rELZIkMSqqIkMuabCQS48vQWRdK6tElRLbAn
	n9YxY7qimQ+HgHE8auTci0vSbKCyBYihCRRpspRa0enc53cExdK5eKkcdGo95VYYp5bF7f
	ll/cIAat4MuN8jfDzA+uxPGu56RNbTizY8e12tdWgtR7P7x1C/u3Omc27tMtXv9zn75x5B
	bibynCGJhSaiE7TgRgI9Qz3HQG42JzlbIOhPR83d4e6K6Rtu8OBT3CqcFfEV8Q==
Message-ID: <8f13c6fd-b9c2-41b6-83d3-6946491a7936@bootlin.com>
Date: Wed, 25 Nov 2026 11:53:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [blacksail][PATCH 3/4] curl: fix CVE-2026-92391
To: Yoann Congal <yoann.congal@smile.fr>,
 openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, bastien.jauny@smile.fr
References: <20261120172126.3187901-1-joaomarcos.costa@bootlin.com>
 <20261120172126.3187901-4-joaomarcos.costa@bootlin.com>
 <DN2RC0R0XR5C.2CL2S4LGW8YOL@smile.fr>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <DN2RC0R0XR5C.2CL2S4LGW8YOL@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 10:53:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251180

Hello, Yoann

On 11/23/26 6:13 PM, Yoann Congal wrote:
> On Fri Nov 20, 2026 at 6:21 PM CET, Jo=C3=A3o Marcos Costa (Schneider E=
lectric) wrote:
>> This vulnerability, marked as High [1], was fixed upstream [2] since
>> v8.23.0.
>>
>> Backport the fix to curl v8.22.0.
>>
>> [1] https://nvd.nist.gov/vuln/detail/cve-2026-92391
>> [2] https://curl.se/docs/CVE-2026-92391.html
>>
>> Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos=
.costa@bootlin.com>
(...)
>> +
>> +diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
>> +index 26c72e5672..9cdc7b2da1 100644
>> +--- a/tests/libtest/Makefile.inc
>> ++++ b/tests/libtest/Makefile.inc
>> +@@ -325,5 +325,4 @@ TESTS_C =3D \
>> +   lib3105.c \
>> +   lib3207.c \
>> +   lib3208.c \
>> +-  lib5000.c \
>> +-  lib5004.c
>=20
> This patch removes lib500{0,4}.c tests but this is not documented nor i=
n
> the upstream patch. A error while solving the conflicts?
>=20
> Regards,

Sadly, yes. I'm preparing a v2.

--=20
Best regards,
Jo=C3=A3o Marcos Costa

