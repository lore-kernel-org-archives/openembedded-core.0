Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB4EC433F5
	for <webhook@archiver.kernel.org>; Sun, 22 May 2022 17:26:49 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web08.18482.1653240402922591190
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 10:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20,
 mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout08.t-online.de (Postfix) with SMTP id 9224E13FC4
	for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 19:26:40 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.33.213]) by fwd75.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nspLh-1ufhc90; Sun, 22 May 2022 19:26:37 +0200
Message-ID: <87b1b4e6-f9aa-4fed-f434-74a045cd8b6b@t-online.de>
Date: Sun, 22 May 2022 19:26:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [meta-oe][RFC PATCH 1/2] libdecor: initial add recipe
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
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
X-TOI-EXPURGATEID: 150726::1653240397-000184BD-525F8E49/0/0 CLEAN NORMAL
X-TOI-MSGID: e0212c07-09c1-4cf7-a313-403374928335
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 May 2022 17:26:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165980


Am 22.05.22 um 14:12 schrieb Richard Purdie:
>
> I'd be interested to know what kind of aborts as that shouldn't have
> happened. I'd be interested to understand what broke as it shouldn't
> have done and none of our testing has shown it.
>
I'm running short of time today, but will test a clean master build 
tomorrow.

Markus


