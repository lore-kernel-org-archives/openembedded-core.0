Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11642C48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 09:42:48 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.3273.1707730962632151099
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 01:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=O703s0b7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80FD9C000D;
	Mon, 12 Feb 2024 09:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707730960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aeoDJKTThYgjwVju4XsQo4DvQEDJKCzyMP926mE8bi8=;
	b=O703s0b7lus06AHRHboC+zfhdy3Zu0syzirsECtJHmomWiG4WXX4MGPU1P/h6f/PMDkkea
	y75azbtIcgqngxl54+2P3qxCAttPZADN/H14WFqvkQxPI/j2WuUdsGS9R/CuYOwiiOt9MB
	hJsvIE6l8Hzr06v46n/OE113Yr874cq81NRgPt39HYFUqMEsAtjseya1vHc2oy3koMw74Z
	rgvaKVtqRoj0p8qkKxEJW0pfHpf5oVfh5SGipAzQLiJ8vfruhJbjRIGVuf9Vrdq0jj6Dvw
	8Y6OKTcAw6t514x3T0ALmVU0zJRY0acEbrGo01NSHzdHF7ppgRWlDnembFDD8Q==
Message-ID: <a1fa4422-ec8f-46a6-9167-7d122ec9b157@bootlin.com>
Date: Mon, 12 Feb 2024 10:42:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 2/4] alsa-tools: upgrade 1.2.5 -> 1.2.11
To: Khem Raj <raj.khem@gmail.com>
References: <20240208084406.3621627-1-michael.opdenacker@bootlin.com>
 <20240208084406.3621627-3-michael.opdenacker@bootlin.com>
 <CAMKF1sph=Yz=x8hhykVZqfZOC-ij3LA-cn6U7p8FTDAkrk+fBQ@mail.gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAMKF1sph=Yz=x8hhykVZqfZOC-ij3LA-cn6U7p8FTDAkrk+fBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 09:42:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195304

Hi Khem,

On 2/12/24 at 07:58, Khem Raj wrote:
> FYI this fails to build with clang compiler
> https://errors.yoctoproject.org/Errors/Details/752555/

Interesting, thanks!
Sounds like an opportunity to improve the upstream code, and to use 
meta-clang as well :)
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


