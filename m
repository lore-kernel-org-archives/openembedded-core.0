Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99771C76195
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 10:43:25 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.63053.1680000202129957397
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 03:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout05.t-online.de (Postfix) with SMTP id 3B2311EC14;
	Tue, 28 Mar 2023 12:43:20 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.35.166]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ph6nP-1fGPi40; Tue, 28 Mar 2023 12:43:19 +0200
Message-ID: <dcc8b4c2-d28c-e312-c2f3-713f8b70fd30@t-online.de>
Date: Tue, 28 Mar 2023 12:43:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [oe-core][PATCH] import libadwaita from meta-gnome
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20230328080156.854975-1-f_l_k@t-online.de>
 <2023032809183607448ce9@mail.local> <BL58SR.DBJ9EGI95SX72@t-online.de>
 <CANNYZj_iXKxNFn6MHBuXY4UoZLGeGsBYeV46x156HmL2TruD4Q@mail.gmail.com>
Content-Language: en-US
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <CANNYZj_iXKxNFn6MHBuXY4UoZLGeGsBYeV46x156HmL2TruD4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1680000199-95FF8C52-EBCB60DB/0/0 CLEAN NORMAL
X-TOI-MSGID: 8c51cc9a-5265-4d21-9c2c-d410c55a66e5
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 10:43:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179227

Too late this time to refer in the cover letter this time but I created 
a branch with that patchset here:

https://github.com/MarkusVolk/openembedded-core/commits/gnome-44

Am 28.03.23 um 11:42 schrieb Alexander Kanavin:
> It can also help if you publish the complete current set in a branch
> somewhere and refer to that in the cover letter.
>
> Alex
>
> On Tue, 28 Mar 2023 at 11:41, Markus Volk <f_l_k@t-online.de> wrote:
>> On Tue, Mar 28 2023 at 11:18:36 AM +0200, Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
>>
>> As you underlined, a build takes 5 to 10 hours, every build failure is also delaying work from others
>>
>>
>> Now thats true. I didn`t send ot unchanged patches so far, because I wanted to avoid mail flood but if it will make things easier I'll send the complete serie again
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#179218): https://lists.openembedded.org/g/openembedded-core/message/179218
>> Mute This Topic: https://lists.openembedded.org/mt/97900769/3618223
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [f_l_k@t-online.de]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

