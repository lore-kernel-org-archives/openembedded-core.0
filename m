Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88A4FD45F9
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 23:51:06 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59361.1772063458048120099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 15:50:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 61PNouLt1128903;
	Wed, 25 Feb 2026 17:50:57 -0600
Received: from [192.168.2.236] ([192.168.2.236])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 61PNonYw027818;
	Wed, 25 Feb 2026 17:50:49 -0600
Message-ID: <145e7167-d654-4505-bcf2-a481f35258e9@kernel.crashing.org>
Date: Wed, 25 Feb 2026 17:50:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Openembedded-architecture] Recipes which should always be
 upgraded on stable branches
Content-Language: en-US
To: Paul Barker <paul@pbarker.dev>, Yoann Congal <yoann.congal@smile.fr>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "openembedded-architecture@lists.openembedded.org"
 <openembedded-architecture@lists.openembedded.org>
References: <1e6175f982bbd141fcc156113aa6e798a3120bdc.camel@pbarker.dev>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <1e6175f982bbd141fcc156113aa6e798a3120bdc.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 23:51:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231981



On 2/25/26 11:44 AM, Paul Barker wrote:
> Hi all,
> 
> I've been briefly discussing stable branch update policy with Yoann.
> There's a few recipes in openembedded-core which I would like to propose
> that we always update to the latest version on LTS and stable branches.
> These are recipes typically providing data that is expected to change
> over time, with little or no code.
> 
> You could say ca-certificates is already covered by the fact that
> security fixes are acceptable for example, but a clearer policy would be
> better.
> 
> Any policy change will go to the TSC for approval, the goal here is to
> get some review and input so that a concrete proposal can be put
> forward.
> 
> The recipes that come to my mind are:
> 
> - ca-certificates: To allow access to HTTPS resources we need to keep
>    these up-to-date.
> 
>      - Keeping this up-to-date is common practice in other distros.
> 
> - tzdata: To stay up to date with timezone or daylight savings changes.
> 
>      - Debian takes upgrades to this on stable branches
>        (see https://tracker.debian.org/pkg/tzdata).

I agree completely for the above two items.  Keeping these current is really 
important and history has shown that updating them doesn't cause issues.


The one below I don't have any experience with, so no opinion.

> - mobile-broadband-provider-info: To stay up to date with provider
>    changes.
> 
>      - The README file for this project says "The Package contains only
>        informational files so it's safe for distributions to grab updates
>        even during feature freeze and maintenance stages."
> 
> What opinions do other folks have?
> 
> Are there any other recipes we should include in this list?
> 
> Best regards,
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2275): https://lists.openembedded.org/g/openembedded-architecture/message/2275
> Mute This Topic: https://lists.openembedded.org/mt/117998481/3616948
> Group Owner: openembedded-architecture+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-architecture/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

