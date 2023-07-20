Return-Path: <hayama@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D65AC0015E
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 03:04:43 +0000 (UTC)
Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
 by mx.groups.io with SMTP id smtpd.web10.5163.1689822273518016932
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 20:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lineo.co.jp, ip: 203.141.200.203, mailfrom: hayama@lineo.co.jp)
Received: from [172.31.7.30] (vpn1.lineo.co.jp [203.141.200.204])
	by mail.lineo.co.jp (Postfix) with ESMTPSA id 8150580F7DF0B;
	Thu, 20 Jul 2023 12:04:31 +0900 (JST)
Message-ID: <7572165d-b766-ecf0-842b-4a76278bdf89@lineo.co.jp>
Date: Thu, 20 Jul 2023 12:04:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] systemd service@ bug
Content-Language: en-US
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
References: <3d682b83-f0e8-7add-3dcd-3e850e30f7c6@tibbo.com>
 <80e8328b-6820-28aa-c2fe-6a73ddad3d01@lineo.co.jp>
 <29408a27-b514-2d12-a72a-9389c4f511a0@gmail.com>
From: Yuta Hayama <hayama@lineo.co.jp>
Cc: Dvorkin Dmitry <dvorkin@tibbo.com>,
 openembedded-core@lists.openembedded.org
In-Reply-To: <29408a27-b514-2d12-a72a-9389c4f511a0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 03:04:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184620

Hi,

On 2023/07/19 16:47, Vyacheslav Yurkov wrote:
> Hey,
> Usually Steve Sakoman cherry-picks patches from master. If it's not the case, it was probably not applied clearly or simply overlooked. You can submit a backport with the branch tag.

Thank you! I understood.

I checked git log and it looked like it usually takes around a month to be
backported, so I will wait until then.


Regards,

Yuta Hayama 

> 
> Vyacheslav
> 
> On 19.07.2023 03:48, Yuta Hayama wrote:
>> Hi,
>>
>> This issue has been fixed in master.
>> https://git.openembedded.org/openembedded-core/commit/?id=d18b939fb08b37380ce95934da38e6522392621c
>>
>> But, yes. This patch has not yet been backported to the any stable branch.
>>
>>
>> I don't know about the maintenance process for the stable branch, but I
>> expect that patch will probably be queued and backported to dunfell in
>> a month or so.
>>
>> Please let me know if anyone knows anything about this. Should we simply
>> wait? Or do I have to submit a backport request?
>>
>>
>> Regards,
>>
>> Yuta Hayama
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184567): https://lists.openembedded.org/g/openembedded-core/message/184567
> Mute This Topic: https://lists.openembedded.org/mt/100140897/7729851
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [hayama@lineo.co.jp]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

