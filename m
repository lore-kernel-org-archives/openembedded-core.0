Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFD8C433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 19:08:52 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.44.1666811327801862193
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 12:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UIEbSbf5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1404EE0002;
	Wed, 26 Oct 2022 19:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666811325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n9Pjm8v+tdXdzVg5zfk3P0JMgnP9K246eFN1piMTzFk=;
	b=UIEbSbf5E2nPgBYLLNq1vIoAjUho1tsxdm2WMB1WLqrtoCIqmTeOhKIIOlaN0sMJkFfffk
	PSeF8bIj86KnSeKYwx/dydWJs7uSktOzSAD7L6mZOisRn75tAbsLlyYZ8J2fAVDnYQTjEY
	4dF+f0bbUDXC7U+Ln7dMrvX9HReqDww/zaoPbWVizWgZQllBvn56UKWURt04ZpsSy7/McQ
	mROj9ILRaimaWiUzOWIVI5qgdtHbbYWYaxTjc4YvyrJ6hnBoCFIqsFdHPIQrrmuM64BA79
	HO6d2T7KS9QB8jBWvsZnAGa7LUf77+j1lnmNjl3pgsM8c5vSSYRvQGEDhlPRtg==
Message-ID: <85790ed4-b392-6728-cdc0-616d87abf59e@bootlin.com>
Date: Wed, 26 Oct 2022 21:08:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] deploy.bbclass: rename DEPLOYDIR to
 DEPLOY_TMP_DIR
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20221026185734.2076455-1-michael.opdenacker@bootlin.com>
 <CANNYZj_X6kj7=uVGpszhPSmmNSxTu0aNJ2w6akMUmcNES3HeoQ@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CANNYZj_X6kj7=uVGpszhPSmmNSxTu0aNJ2w6akMUmcNES3HeoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 19:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172172

Hi Alex,

On 10/26/22 21:05, Alexander Kanavin wrote:
> I'm afraid DEPLOYDIR is used by everything using the deploy class
> across all layers, and this will break all of them. Separating the two
> confusing variables is probably better done from the other end, e.g.
> renaming DEPLOY_DIR to DEPLOY_DIR_ROOT.
>
> Alex


Thanks for the feedback. This sounds like a better idea, indeed, 
avoiding a very costly transition with very little added value.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


