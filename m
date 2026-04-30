Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 279B4CD13D2
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 21:30:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1363.1777584591809725658
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 14:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=tCa2oKSb;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B94F34E42B7F;
	Thu, 30 Apr 2026 21:29:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 87D86601DF;
	Thu, 30 Apr 2026 21:29:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7CA911AC9D81;
	Thu, 30 Apr 2026 23:29:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777584588; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=k5a0a8vfiCq6fXhW925Ud8Ylxi4eTrs6ONFhUzsmPR8=;
	b=tCa2oKSbn4V3XkzxpsRTUjyRsCgdE7Y6tOgJeOP/0Kat3oqzk0oYzid3qJ1okhpYTHObRA
	H7K7ttdlbkDl80j4EzTC3I0RN4RTDtxIHw6+cTy4DZublztxJ0nGS2CA5+j9ELE05JkjO8
	TfUlsV8qOvAKzgClSW4YyVvsIv9Fx3vDZfYHcVONHFt8w89lCjgT7aDpZqefDHkg199d2l
	DrKuxaVOGlPZG9P0KvEndsrNV/+V11lgcvdPg1dDoupsk18/7H3K9qvjSR5TZ/NklYqmu7
	+qH/6LrbkyAY/Ovzr67JnfjpXDw7Q4i4g97xGjKocEmRfc0ODRkoZzhUHRovbA==
Message-ID: <6e718e6f-f8c9-4dce-96e4-d37e35bcfce3@bootlin.com>
Date: Thu, 30 Apr 2026 23:29:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 1/1] u-boot-tools: drop yaml in DT validation
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, quentin.schulz@cherry.de,
 marek.vasut@mailbox.org, festevam@gmail.com, khem.raj@oss.qualcomm.com
References: <20260429180631.170081-1-joaomarcos.costa@bootlin.com>
 <18AAE61C950BAD92.2435051@lists.openembedded.org>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <18AAE61C950BAD92.2435051@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 21:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236188

Hello, folks

On 4/29/26 20:06, Joao Marcos Costa via lists.openembedded.org wrote:
> Since yamltree was dropped from upstream dtc (i.e., in Linux), a patch =
was
> sent to U-Boot to backport the corresponding changes.
>=20
> Apply this patch in u-boot's sources.
(...)
> +
> +I tested this patch with a couple Yocto builds: u-boot and u-boot-tool=
s,
> +using the current master branch (rev. "c53b0708f9"), having removed
> +libyaml-native from u-boot-tools's dependencies.
> +
> +[1] https://git.kernel.org/linus/ef8795f3f1ce
> +
> +Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> +
> +Upstream-Status: Submitted [https://lore.kernel.org/u-boot/20260429144=
615.142350-1-joaomarcos.costa@bootlin.com/]
> +---
(...)

Update: the patch was merged into master [1].

[1]=20
https://lore.kernel.org/u-boot/177757652458.1689679.13411123339948819206.=
b4-ty@konsulko.com/

--=20
Best regards,
Jo=C3=A3o Marcos Costa

