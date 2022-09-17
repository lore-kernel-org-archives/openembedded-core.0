Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58456C54EE9
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 14:36:00 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.6412.1663425350650896254
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 07:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 28HEZmsJ018538;
	Sat, 17 Sep 2022 09:35:49 -0500
Message-ID: <ab69fff9-bdb5-1a6d-18ce-b22f737e4c07@kernel.crashing.org>
Date: Sat, 17 Sep 2022 09:35:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [OE-core] wic/wks boot using labels instead of partitions
Content-Language: en-US
To: Markus Volk <f_l_k@t-online.de>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <28322394-c2dd-fc69-be32-466d0cf14906@kernel.crashing.org>
 <GACCIR.4ITKNYY5Z8AC3@t-online.de>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <GACCIR.4ITKNYY5Z8AC3@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Sep 2022 14:36:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170836

Thank you, this worked perfectly.

On 9/17/22 1:20 AM, Markus Volk wrote:
> --use-label
> 
> This should do it.
> 
> Am Fr, 16. Sep 2022 um 16:41:48 -0500 schrieb Mark Hatle 
> <mark.hatle@kernel.crashing.org>:
>> Is there a way to tell the _generated_ fstab to use labels to boot and not 
>> hard coded partitions? If I remove the --ondisk <device> attribute from the 
>> wks file it defaults to /dev/sda. What I tried was: part /boot --source 
>> bootimg-partition --fstype=vfat --label boot --active --align 4 size 16 part / 
>> --source rootfs --fstype=ext4 --label root --align 4 If I manually add 
>> --no-fstab-update to the wks entries and add the following to the system 
>> default fstab: LABEL=boot /boot vfat default 0 2 This works. But I'd like to 
>> automate it within the wks. (Alternatively I could use uuid instead of label 
>> booting, but either case, I need to only boot with the uuid or label -- not 
>> the partition as the location of the disk can change.) --Mark
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170825): https://lists.openembedded.org/g/openembedded-core/message/170825
> Mute This Topic: https://lists.openembedded.org/mt/93732744/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

