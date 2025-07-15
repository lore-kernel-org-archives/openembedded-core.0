Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C2EC83F22
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 14:44:18 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.10226.1752590650575307234
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 07:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 56FEi91M800720
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 09:44:09 -0500
Received: from [192.168.2.97] ([192.168.2.97])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 56FEi9vk027357
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 09:44:09 -0500
Message-ID: <509352f6-fd61-4ece-bf43-723a0746520b@kernel.crashing.org>
Date: Tue, 15 Jul 2025 09:44:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] do image recipes need a LICENSE setting?
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <b80cf9f8-38f9-dece-15b9-27cc64f3824e@crashcourse.ca>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <b80cf9f8-38f9-dece-15b9-27cc64f3824e@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 14:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220300

All recipes require a license.  No exceptions.

The license is the 'source code' license of the recipe, if there is no source 
code, it's pretty typical to set it to MIT as that is the license of most layers.

--Mark

On 7/15/25 5:19 AM, Robert P. J. Day wrote:
> 
>    was perusing some of the OE image recipes, and noticed several:
> 
>    LICENSE = "MIT"
> 
> i thought image recipes did not need LICENSE values.
> 
> rday
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220292): https://lists.openembedded.org/g/openembedded-core/message/220292
> Mute This Topic: https://lists.openembedded.org/mt/114164121/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

