Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1661C4828F
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 09:43:10 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.14272.1706953386940770274
 for <Openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 01:43:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=egWY8efv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9010E20009;
	Sat,  3 Feb 2024 09:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706953385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O3aObz6r5ZPCY74LWIQ74t7T47nGRtuUP1ZzR3goUUk=;
	b=egWY8efvwjgV2Z2Xlg3php6UPF8oN0WuAO6GYi3hLde1n/qvWXEdkiA9VLtoR0E8Vpby5B
	X4qLcV58XFaKu+OJ1ukmdcdFh1H7VlLKKDPajm9hSfdHTMCppLNbswNkBXseOJR2vRybwZ
	Znx2Nmq13GAtbagfwv32+vX1rDx6ryX9LkVaaUOc8Xm9iHteGaKQK9NY8jpKsmrW+U+4NV
	p9L0Bj5VhIuTNg0AK+fDoCEMvHPi84JCtYiGeLiQPehv1INqgEokdJe1g13WFnpzqG6RUY
	huYSFmZh/3F+GvIFN2CWBxMDtOzi9tZjO5y7TOwhrrzith1jf4pWcHDwdL2GYA==
Message-ID: <870dd3bf-f7a0-4da6-ba3a-0bf22e911053@bootlin.com>
Date: Sat, 3 Feb 2024 10:43:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH v2 1/2] testimage: move
 TESTIMAGE_FAILED_QA_ARTIFACTS default value to core-image-minimal
To: Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20240203092538.5491-1-alexis.lothore@bootlin.com>
 <17B0501EE0662FAC.13964@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <17B0501EE0662FAC.13964@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 09:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194843

On 2/3/24 10:25, Alexis Lothoré via lists.openembedded.org wrote:
> From: Alexis Lothoré <alexis.lothore@bootlin.com>
> 
> TESTIMAGE_FAILED_QA_ARTIFACTS currently sets a default list of files to be
> saved whenever some tests fail. Unfortunately, this default value is very
> easily discarded, because TESTIMAGE_FAILED_QA_ARTIFACTS is expected to be
> enriched by some core recipes (example: ptest images) which are often
> parsed before testimage.bbclass. Those core recipes could still manage to
> get the default value AND add some files by using override syntax, but then
> it makes it difficult for downstream recipes or bbappend files to tune this
> variable.
> 
> Allow to set this default value and make sure it is not overwritten by
> recipes wanting to tune it, by setting the default value in
> core-image.
> While doing so, set it as a default value instead of a weak default value.

And I realize that I forgot to remove "minimal" from the commit message, which
is not true anymore for this version. I'll wait a bit before resending, it looks
like I have some formatting issues detected by patchtest too

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


