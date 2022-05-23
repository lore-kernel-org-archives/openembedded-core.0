Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84084C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 15:26:55 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web08.29017.1653319608676323558
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 08:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83,
 mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout07.t-online.de (Postfix) with SMTP id A90FA4639;
	Mon, 23 May 2022 17:26:46 +0200 (CEST)
Received: from [192.168.178.83] ([79.219.229.214]) by fwd79.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nt9xG-3wKmJ70; Mon, 23 May 2022 17:26:46 +0200
Message-ID: <87d4367a-e93e-5a8c-a636-200e987792c9@t-online.de>
Date: Mon, 23 May 2022 17:26:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [meta-oe][RFC PATCH 1/2] libdecor: initial add recipe
Content-Language: en-US
To: richard.purdie@linuxfoundation.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220519064312.391164-1-f_l_k@t-online.de>
 <20220519184315.1e91b017@melee>
 <70887c7d-4063-93d5-025f-46c4a17e5940@t-online.de>
 <31d4ac7f1c8db63e0bcc2028c787dc59e30a2781.camel@linuxfoundation.org>
 <1286dfdb-a0ac-67a7-a026-f95da89c35da@t-online.de>
 <f304f84a8bb4bd353898d54cf1378b5c0084498e.camel@linuxfoundation.org>
 <080bfcd8-afeb-39a6-6215-88ed6261cd8e@t-online.de>
 <67fe6127ff98d96cfd225500535c88d2fe8e945b.camel@linuxfoundation.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <67fe6127ff98d96cfd225500535c88d2fe8e945b.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1653319606-00010BFA-9F985F66/0/0 CLEAN NORMAL
X-TOI-MSGID: 31f18b64-79b4-4b63-a8e5-190c175da0ea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 15:26:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166035


Am 22.05.22 um 14:12 schrieb richard.purdie@linuxfoundation.org:
> I'd be interested to know what kind of aborts as that shouldn't have
> happened. I'd be interested to understand what broke as it shouldn't
> have done and none of our testing has shown it.
>
> Cheers,
>
> Richard
>
All-clear for the master branch. All of my issues seem to have been 
homemade. After cleaning tmp and doing a clean rebuild, i didn't have 
any build issues anymore.

Markus



