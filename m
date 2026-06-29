Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5ADC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 09:51:42 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34255.1782726698625613077
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 02:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=sS7RiUQ8;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 492A64E40B46;
	Mon, 29 Jun 2026 09:51:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1D39F5FF96;
	Mon, 29 Jun 2026 09:51:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0EAB3106F16C2;
	Mon, 29 Jun 2026 11:51:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782726695; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=lORUxpx8gyaqcgxZeUAkxDGUYZtiUQcTARurbKmmPSQ=;
	b=sS7RiUQ8HDdugzeUePuR+MHvJC+iWFJ6qUFqdaIY8e6fQNGfuHa4/uL1EjWj08iaJWD180
	jFNM8IqnwbDghTA2ECIMEHUluEefrpVSZl537uX+U0/hMtBWvRb5449PUjTUg+9MUNttqq
	+iigxSsOCdIftWtMH9SBhFA00sizaprW+/8ch8IWFMd19+X/6ytk9J9qMVivDn4jPVLR51
	eqZVfqEBiTzH0z83XdzXqwJKZ9zOsZvvlx/HIfbQjbSIv54U182Fa9cvg+RnjYIQrp8hnR
	v0weXFiv3DcBK9LxVdfgflafWQJgz0rFhenxDHE/PqCIFdjNbpGG5L/FFobYYA==
Message-ID: <adbec83f-8441-4bd3-9ad6-0ddaf932c603@bootlin.com>
Date: Mon, 29 Jun 2026 11:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 4/5] llvm-project-source.inc: add vardeps to
 do_preconfigure
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, raj.khem@gmail.com
References: <20260623120818.110754-1-joaomarcos.costa@bootlin.com>
 <20260623120818.110754-5-joaomarcos.costa@bootlin.com>
 <9ec404ced0ab0f4762d9c4e863ffe67de4baa025.camel@linuxfoundation.org>
 <53e5f5cc-f919-4ac1-879d-0d5381bdfc57@bootlin.com>
 <9935cbf2c5c2bfc65207cbe157d166453e477fb4.camel@linuxfoundation.org>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <9935cbf2c5c2bfc65207cbe157d166453e477fb4.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 09:51:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239741

Hello,

On 6/29/26 11:39, Richard Purdie wrote:

> I've merged the first 3 patches, those makes sense on their own. I'm a
> bit more reluctant for the last two as I really would like to fix the
> issue correctly...
>=20
> Cheers,
>=20
> Richard

I'll add that to my to-do list then. Thanks!

--=20
Best regards,
Jo=C3=A3o Marcos Costa

