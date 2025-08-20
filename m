Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11379CA0EF8
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 09:53:51 +0000 (UTC)
Received: from smtp1.emailarray.com (smtp1.emailarray.com [65.39.216.14])
 by mx.groups.io with SMTP id smtpd.web10.16126.1755683623551659598
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 02:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: balister.org, ip: 65.39.216.14, mailfrom: philip@balister.org)
Received: (qmail 54688 invoked by uid 89); 20 Aug 2025 09:53:42 -0000
X-Orig-Sender: philip@balister.org
Received: from unknown (HELO ?192.168.11.199?) (cGhpbGlwQGJhbGlzdGVyLm9yZ0A3My4xNTIuMTM0LjE1Mg==) (POLARISLOCAL)  
  by smtp1.emailarray.com with SMTP; 20 Aug 2025 09:53:42 -0000
Message-ID: <5430a536-ff40-43c3-a2f0-5df8f91d5e0c@balister.org>
Date: Wed, 20 Aug 2025 05:53:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [yocto] Renaming the yocto-security mailing list
To: mhalstead@linuxfoundation.org, rybczynska@gmail.com
Cc: yocto@lists.yoctoproject.org, rudolf.streif@ibeeto.com,
 yocto-security@yoctoproject.org,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: <CAApg2=TZnJGDvBN8LBEoVbRcTJ6k1fGdOXVzss3bQmjZH4WknA@mail.gmail.com>
 <63a28aea-58c9-453b-9b03-3df29118044b@ibeeto.com>
 <CADfgfoZKuU2uMcPZFO3nMrXYJQMA66qL_b3O-1LJhWVdq13sQA@mail.gmail.com>
Content-Language: en-US
From: Philip Balister <philip@balister.org>
In-Reply-To: <CADfgfoZKuU2uMcPZFO3nMrXYJQMA66qL_b3O-1LJhWVdq13sQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 09:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222165

Michael,

Who are the moderators?

Philip

On 8/19/25 6:41 PM, Michael Halstead via lists.openembedded.org wrote:
> I've updated yocto-security@lists.yoctoproject.org to require
> moderator approval for new topics. This should prevent private
> security reports from being posted publicly by mistake.
> security@yoctoproject.org is not a private list but instead forwards
> email received to members of the security team.
> 
> I believe this solves the issue without requiring changes to the list
> name or documentation.
> 
> On Tue, Aug 19, 2025 at 2:50 PM Rudolf J Streif via
> lists.yoctoproject.org
> <rudolf.streif=ibeeto.com@lists.yoctoproject.org> wrote:
>>
>> I don't any specifics about the incident. I suppose security-relevant
>> information was submitted to a public mailing list. A private mailing
>> list may help but in the end it's security-by-obfuscation. A mailing
>> list for submitting CVEs is not the best choice imho. A secure web form
>> should be better. We have a CVE Status page
>> (https://wiki.yoctoproject.org/wiki/CVE_Status) that lists the current
>> acknowledged CVEs but of course reported CVEs should go through an
>> investigative filter and potentially sanitizing first before put on that
>> page.
>>
>> :rjs
>>
>> On 8/19/25 8:08 AM, Marta Rybczynska via lists.yoctoproject.org wrote:
>>> Hello all,
>>> yesterday's incident confirms that yocto-security has a confusing name
>>> that might cause confidential reports to arrive there.
>>>
>>> What about renaming the list to yocto-security-discussion or similar?
>>> And eventually redirect yocto-security to the private security list.
>>>
>>> My reasoning: we shouldn't rename the private list as people might use
>>> old versions of documentation and we want them to address the correct
>>> private list when needed. It is less critical if a message expected
>>> for the public list reaches the private one, than otherwise.
>>>
>>> What do you think? What is the process to do the change?
>>>
>>> Kind regards,
>>> Marta
>>>
>>>
>>>
>>
>>
>>
> 
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222151): https://lists.openembedded.org/g/openembedded-core/message/222151
> Mute This Topic: https://lists.openembedded.org/mt/114790185/384425
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [philip@balister.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


