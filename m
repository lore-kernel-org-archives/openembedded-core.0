Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED6C5C433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 21:48:31 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.872.1637272110215833118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 13:48:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id DC0F320007;
	Thu, 18 Nov 2021 21:48:27 +0000 (UTC)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] how to "prune" dead sstate-cache?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 Martin Jansa <martin.jansa@gmail.com>
References: <8ca5808d-1fd6-751-f9c9-b99ab8242cd6@crashcourse.ca>
 <CA+chaQeUB2ew1=odQPwXbsXDL62LoNw3aZOR8x69oeHrksPr5w@mail.gmail.com>
 <ba12a07c-68d7-294b-68f-213240d15f@crashcourse.ca>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <6385fb69-3feb-32d0-3b18-f840e546f28f@bootlin.com>
Date: Thu, 18 Nov 2021 22:48:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ba12a07c-68d7-294b-68f-213240d15f@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 21:48:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158481

Hi Robert,

On 11/18/21 11:43 AM, Robert P. J. Day wrote:
> On Thu, 18 Nov 2021, Martin Jansa wrote:
>
>> openembedded-core/scripts/sstate-cache-management.sh
>   i just now found that script, and noticed that it is not documented
> anywhere in the YP docs. perhaps we need a short section on
> sstate-cache management somewhere in the docs.


This sounds like a good idea. I'll try to propose something.
Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


