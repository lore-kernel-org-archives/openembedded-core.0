Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26801CD4855
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 07:55:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70315.1778572492756250092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 00:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=WNZRvo1D;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 887D61A3582;
	Tue, 12 May 2026 07:54:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C26D60646;
	Tue, 12 May 2026 07:54:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DA0411AF9C4E;
	Tue, 12 May 2026 09:54:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778572489; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=toIrx3cW9URk+UEbvrHViG3+erpBkA3YlSaJVMIOOkA=;
	b=WNZRvo1DpR1VM8zTh/F4dISMrhJt8SurJ0aOIFZIy1EmSXU4XUpcWp2kxE0Swjf1ikK31A
	Jn8LhPCehZuQ57vbFQsx+7znErScff2ITFWFQwEcwQl6AqFORDBn+2btSodMseuVwmWt+/
	tgH3OY70U4YVZxGOTUU1+qerdVfT2YVgLKYgDDKBq9wmzEjzMPUAb/jZAgNNscBD3IN7kD
	H37bR8/Ag57RDqZiGyc32hiRoTdDzzY29aHhDM8JrsiXQRtT1h/PqgbBRg13FjJ5gOOi5x
	XzunwugVRQxAosCco2Gkxrl+jfmAqKcPcif1NPepuGlzawQtmezeRO5iUkfIOg==
Message-ID: <8478df14-5948-479e-b47e-d285b138dabe@bootlin.com>
Date: Tue, 12 May 2026 09:54:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/4] vim-xxd: introduce new recipe for xxd
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260508214020.2488025-1-joaomarcos.costa@bootlin.com>
 <20260508214020.2488025-3-joaomarcos.costa@bootlin.com>
 <BED2E5C8-3015-40DC-9609-EC5FF320A0C7@arm.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <BED2E5C8-3015-40DC-9609-EC5FF320A0C7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 07:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236858

Hi, Ross

On 5/11/26 19:04, Ross Burton wrote:
> On 8 May 2026, at 22:40, Joao Marcos Costa via lists.openembedded.org <=
joaomarcos.costa=3Dbootlin.com@lists.openembedded.org> wrote:
>> +SUMMARY =3D "Hex dump and reverse utility from the Vim source tree"
>> +DESCRIPTION =3D "xxd is a small utility usually distributed with Vim =
that creates hex dumps from binary data and can also convert hex dumps ba=
ck to their original form."
>> +SECTION =3D "console/utils"
>> +HOMEPAGE =3D "https://www.vim.org/"
>> +BUGTRACKER =3D "https://github.com/vim/vim/issues=E2=80=9D
>=20
> If we=E2=80=99re being pedantic here, the license of xxd.c is actually =
"X11-MIT or GPL-2.0=E2=80=9D not the Vim license.
>=20
> Ross

Oops! Thanks for spotting this. I will wait for more feedback from=20
others before sending a v2 with this fix.

--=20
Best regards,
Jo=C3=A3o Marcos Costa

