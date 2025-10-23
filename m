Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B75CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 12:16:22 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.18656.1761221777428460275
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 05:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=jmfjaDiw;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A2F5DC0C418;
	Thu, 23 Oct 2025 12:15:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F9006062C;
	Thu, 23 Oct 2025 12:16:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0BE5C102F2460;
	Thu, 23 Oct 2025 14:16:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761221775; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=o+bga/BJIvl/OtNszfOl18g4h5fBhYvdFVwiv9UeUSc=;
	b=jmfjaDiwph5x2BlwnPgkJiHTnZtcx/nfCPAV/JLmaEnsSFDz9rZdZYJeCVsIbqx7eQLeYS
	mlaq0cKpkEmjJXfjckL3g4ymX9AYMpByL1F+ESpT/HigGvh1ABeFGXtXiPdc2entYWUPZI
	JyjVixrNuRgqOAcVKTADyx2nmPpqNQDTBe4UWGnfeYH2NZKo/SFR7ePBQmz7eYpjlfY1JX
	/P7lnwtnhe62dx7GgCmun4nqZU0gxkSVH2g2qnkHV8PVkiGc09SYiENv8AjQF83Vw1e6w+
	hbfnNLoiIqS+4y0nfQO7/Yqlbfjhx2a0forccDdtsG6NfBU86H53Ew39wk/fuw==
Message-ID: <e47700e3-0e68-4d0e-9d76-2e748fbb43ff@bootlin.com>
Date: Thu, 23 Oct 2025 14:16:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] libxslt: add ptest support
To: Pratik Farkase <pratik.farkase@est.tech>,
 openembedded-core@lists.openembedded.org
References: <20251022151239.87981-1-pratik.farkase@est.tech>
Content-Language: en-US, fr
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20251022151239.87981-1-pratik.farkase@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 12:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225248

Hello, Pratik

On 10/22/25 17:12, Pratik Farkase wrote:
> Add ptest support for libxslt 1.1.43 including:
> - do_compile_ptest and do_install_ptest
> - test data installation
> - cleanup of buildpath references
> - added run-ptest installation
>=20
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

I know you already sent a v3, but as for this very first version there=20
were some failures detected on SWAT:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2481/s=
teps/13/logs/stdio
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2520/s=
teps/13/logs/stdio
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/662/st=
eps/14/logs/errors

Could you please take a look on those?

--=20
Best regards,
Jo=C3=A3o Marcos Costa

