Return-Path: <lw@hqv.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68D4C369A6
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 12:54:10 +0000 (UTC)
Received: from amphora.sui-inter.net (amphora.sui-inter.net [80.74.147.33])
 by mx.groups.io with SMTP id smtpd.web11.33759.1744289635080218886
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 05:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: hqv.ch, ip: 80.74.147.33, mailfrom: lw@hqv.ch)
Received: from [192.168.1.129] (localhost [127.0.0.1]) by amphora.sui-inter.net (Postfix) with ESMTPSA id D80699680ED6
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 14:53:51 +0200 (CEST)
Authentication-Results: amphora.sui-inter.net;
        spf=pass (sender IP is 185.132.16.78) smtp.mailfrom=lw@hqv.ch smtp.helo=[192.168.1.129]
Received-SPF: pass (amphora.sui-inter.net: connection is authenticated)
Message-ID: <4459df46-83a7-4845-9638-14dc0eb1d22c@hqv.ch>
Date: Thu, 10 Apr 2025 14:53:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Private: Re: [OE-core] Option to change default optimization
 level of Python
To: openembedded-core@lists.openembedded.org
References: <CANNYZj839xLM-4SrgibZqof_BtBep9=GCJ0s1e7J0PNH2TtTHA@mail.gmail.com>
 <31851.1744285641335320841@lists.openembedded.org>
 <CANNYZj_1OmBvTShfEkN2GX0dYOOiDKQHV8T3A300exv637Zk8w@mail.gmail.com>
Content-Language: en-US
From: Lukas Woodtli <lw@hqv.ch>
In-Reply-To: <CANNYZj_1OmBvTShfEkN2GX0dYOOiDKQHV8T3A300exv637Zk8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 12:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214663


On 10.04.25 13:52, Alexander Kanavin wrote:
> On Thu, 10 Apr 2025 at 13:47, Lukas Woodtli via Lists.Openembedded.Org
> <lw=hqv.ch@lists.openembedded.org> wrote:
>
>> Thank you for your feedback.
>>
>> I think that setting a default optimization level for the Python interpreter is a valid use case for an embedded system (and probably only for an embedded system).
>>
>> But as the way doing it here (with the patch) is not suitable, I'll see if I can achieve something upstream.
> Please do not reply in private. The conversation needs to stay on the
> mailing list.
>
> Alex

Sorry, this was a private message by accident.



