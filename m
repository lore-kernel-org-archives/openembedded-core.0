Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8502.1794991140352100842
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 00:39:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=td95gs+z;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8EDF0C4CBD9
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 08:39:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBF7B5FE9B;
	Wed, 18 Nov 2026 08:38:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77EBD11BC06A7;
	Wed, 18 Nov 2026 09:38:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794991137; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=pmoSwmLTszZ3Bx+pIkCz2ds943fx1x6zffK+qhq/XtQ=;
	b=td95gs+z+2kXhGaKWPrOBifPBaqGNOI/ueSLpc1T+XC+md12ASHKEiDUwlj+H/VppSBXUz
	DKllCOPge9Y+Vvj3o+3am59YZz5wrxhrFLcGTWNiLVfo0Hjbg1wyesoWETHmBGdvxvbdaZ
	xHiwsvU4nsO1M51pJmZjNTKbNO1RndefE4jb3G9sW1yvI/f7SrZMPdFFv1pNLLExpV0MX+
	Lvo8k3Mma18KvtATF3T7jEDyQq50srpVV/9slKYlcjwheu27JzI7iy4mUmLnEYmC2TUljY
	Iw9PxqTQLwzYZPSxyNLPe7gaNcKDmEZktk05c5+0ZVC9QMK2SYOYKfHqW+jlwA==
Message-ID: <e16b7ad3-7d2a-4573-81fe-84e14999fe57@bootlin.com>
Date: Wed, 18 Nov 2026 09:38:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: fix CVE-2026-84243
To: Fabien Thomas <fabien.thomas@smile.fr>,
 openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
References: <20261104150611.1720587-1-joaomarcos.costa@bootlin.com>
 <DMXJC8MY3ICL.3R9DYAAS6OXEF@smile.fr>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <DMXJC8MY3ICL.3R9DYAAS6OXEF@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 08:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250524

Hello, Fabien

On 11/17/26 2:54 PM, Fabien Thomas wrote:
> On Wed Nov 4, 2026 at 4:06 PM CET, Joao Marcos Costa via openembedded-c=
ore wrote:
>> This vulnerability, marked as High [1], was fixed upstream [2] since
>> 2.45.
>>
>> Backport the fix to glibc v2.39.
>>
>> The only changes not included in the backport are the ones in NEWS fil=
e.
>>
>> [1] https://nvd.nist.gov/vuln/detail/cve-2026-84243
>> [2] https://sourceware.org/bugzilla/show_bug.cgi?id=3D17142
>>
>> Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos=
.costa@bootlin.com>
>> ---
>>   .../glibc/glibc/CVE-2026-84243.patch          | 193 ++++++++++++++++=
++
>>   meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
>>   2 files changed, 194 insertions(+)
>>   create mode 100644 meta/recipes-core/glibc/glibc/CVE-2026-84243.patc=
h
>>
>=20
> Hello Jo=C3=A3o,
>=20
> Thanks for this patch. However, I can't apply it directly in Scarthgap =
until
> Wrynose branch has been updated, as mentionned in this thread [1].
>=20
> I'm putting it on hold until then.
>=20
> [1] https://lore.kernel.org/all/20261112062448.3128219-1-hthakar@cisco.=
com/

Sure, no worries.

--=20
Best regards,
Jo=C3=A3o Marcos Costa

