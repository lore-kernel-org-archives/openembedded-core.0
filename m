Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF652C4332F
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 17:25:39 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web12.26521.1637947538612125038
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 09:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A737320003;
	Fri, 26 Nov 2021 17:25:35 +0000 (UTC)
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [OE-core] [docs] [PATCH] dev-manual: how to purge duplicate
 sstate cache files
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, docs@lists.yoctoproject.org,
 openembedded-core@lists.openembedded.org
References: <16B8C24F834E3318.24748@lists.openembedded.org>
 <16B8FE3872AB92F9.32206@lists.yoctoproject.org>
 <1731b51b-da96-50b2-923b-3ae95b8911d6@bootlin.com>
 <9f19c2c7-0852-013a-4568-e8af7cf60910@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <bba8c5fc-0c1c-eda5-4b0a-309d5553d0b3@bootlin.com>
Date: Fri, 26 Nov 2021 18:25:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <9f19c2c7-0852-013a-4568-e8af7cf60910@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 17:25:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158840

Hi Slava,

On 11/26/21 10:13 AM, Vyacheslav Yurkov wrote:Did anyone have time to
have a look at what I wrote ? There may be
>> better ways to purge the sstate cache files.
>> Thanks in advance
>> Michael.
>
> The description looks good to me. By other ways you mean other usage
> scenarios of sstate-cache-management.sh script or by means of
> something else?


Thanks for the review. I was interested in any advise from real life
experience, with or without this script, to get rid of obsolete sstate
cache files.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


