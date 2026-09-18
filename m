Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1165FC88E75
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 08:40:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6776.1789720845052488777
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 01:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=UCNQF0Ps;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C94F04E408C8
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 08:40:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9D03D60649;
	Fri, 18 Sep 2026 08:40:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 85CE3102F1C97;
	Fri, 18 Sep 2026 10:40:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789720842; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=6E7OovoK9uRYSYHzp2vaatjtH53HWux8Z8nIII6AqSI=;
	b=UCNQF0PsMoTnK1BCLecw6pCFIhok6uB3QZHY0RUsgj1PZVANRXkD0lsQnwf58Os05XnYuT
	3S6kWAFunlqxP0QFHWh0RYL/AmZUJFnTigH3Tpp0VOhDZA2ZllFt9PEGTM00GaBAKyzFpX
	zCBVCEJoieQledsBn2l3oPq7CIKSZ2yQ9BNajduPqv+e8Q+U0QqJtqG5fRJMqQpoYf0745
	7ZQkfkhziBdivWSxbL6R7oxUu5IS8u70MBP9OAhK4yf7Sik/VI9HIaCPlPnKyWgQALIPnE
	bCa8NfrRhMxh4D5cvYkQEYTUPicVLTjqq/iKCa9vKTbgqAniVddYCpnryMDwDg==
Message-ID: <4a278e05-60be-4452-85b2-b8d941be8084@bootlin.com>
Date: Fri, 18 Sep 2026 10:40:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] classes/archiver: fix tarball content in
 "original" mode
To: Yoann Congal <yoann.congal@smile.fr>,
 openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, paul@pbarker.dev
References: <20260909170357.2887215-1-joaomarcos.costa@bootlin.com>
 <970d21c2-3b07-4c54-ada5-c9a0eae762dc@bootlin.com>
 <DLIAMJQH6G89.DPW2GDLGDW7B@smile.fr>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <DLIAMJQH6G89.DPW2GDLGDW7B@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 08:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246199

Hello, Yoann

On 9/18/26 10:18 AM, Yoann Congal wrote:
(...)
>=20
> I think there was a mail issue with the patch, it is not on lore (and,
> so, invisible to patchwork and most tools):
> https://lore.kernel.org/all/970d21c2-3b07-4c54-ada5-c9a0eae762dc@bootli=
n.com/
>>   [parent not found: <20260909170357.2887215-1-joaomarcos.costa@bootli=
n.com>]
>=20
> I think you should RESEND it.
>=20
> Regards,

Oh, that's odd. Thanks for the heads up! I'll resend it.

--=20
Best regards,
Jo=C3=A3o Marcos Costa


