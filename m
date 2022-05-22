Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1385AC433EF
	for <webhook@archiver.kernel.org>; Sun, 22 May 2022 10:22:17 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web12.14993.1653214934071760537
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 03:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout04.t-online.de (Postfix) with SMTP id 38E0C54A8;
	Sun, 22 May 2022 12:22:12 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.33.213]) by fwd78.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nsiiw-1ihnf70; Sun, 22 May 2022 12:22:10 +0200
Message-ID: <080bfcd8-afeb-39a6-6215-88ed6261cd8e@t-online.de>
Date: Sun, 22 May 2022 12:22:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
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
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <f304f84a8bb4bd353898d54cf1378b5c0084498e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1653214930-0000AD4E-D8A80A7A/0/0 CLEAN NORMAL
X-TOI-MSGID: a326529f-d121-47f9-a48b-d46b615a25dc
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 May 2022 10:22:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165974

Am 22.05.22 um 11:24 schrieb richard.purdie@linuxfoundation.org:

> What kind of issues? :/
During the build of a systemd-based image, eudev was added. Possibly I 
was to blame for this by my own changes ;)

But after updating the master branch yesterday, I also got build aborts 
for some python modules. I didn't investigate this further, but switched 
to the kirkstone branch.

Markus


