Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6E2C433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 05:30:08 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web08.7370.1654320605539707568
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 22:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout04.t-online.de (Postfix) with SMTP id 33AEB152C;
	Sat,  4 Jun 2022 07:30:02 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.41.60]) by fwd88.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nxMMG-27TZoH0; Sat, 4 Jun 2022 07:29:56 +0200
Message-ID: <1681e018-9c0e-4d22-6373-ea8f1c5fa51a@t-online.de>
Date: Sat, 4 Jun 2022 07:29:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe-core][PATCH 1/4] xorg-lib-common: allow to build for wayland
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220531190620.186764-1-f_l_k@t-online.de>
 <20220601170035.76ab1bcc@booty>
 <6b5c87ac-3ea0-be92-9439-7cf69d136c9b@t-online.de>
 <20220603221727.1e8c5f6b@booty>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20220603221727.1e8c5f6b@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1654320596-01436587-CDAB42B5/0/0 CLEAN NORMAL
X-TOI-MSGID: 86fcef4a-9cfb-4e35-840c-0bdcbf7fbdbb
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 05:30:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166532

You are certainly right about that. The error message reached me just 
before I had to go to work and so I just quickly changed the file 
without testing anything with it. That's why I hadn't sent out a new 
patchset yet, but I'll make up for that completely this time. Hopefully 
also with a solution for your current problem.
> However I would find it a lot clearer if you instead sent a v2 series
> with all the 5 patches (1 new + 4 as in the previous version). It would
> avoid any confusion.
>
> About the test, unfortunately we are still having failures:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/5316/steps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/5316/steps/14/logs/stdio
>

