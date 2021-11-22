Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6ADAC433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 15:49:02 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.8195.1637596140878082935
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 07:49:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id F129D10001C;
	Mon, 22 Nov 2021 15:48:36 +0000 (UTC)
Cc: michael.opdenacker@bootlin.com,
 oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Honister version: ERROR: QA Issue: Files/directories were
 installed but not shipped
To: JH <jupiter.hce@gmail.com>, yocto <yocto@lists.yoctoproject.org>
References: 
 <CAA=hcWQt4W4F16jZpNfj427+Om7EvJMs+-QKbeq1_NkoQSQW_A@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <bdfa8797-6c8d-938c-9eb6-8ab12cfcc7aa@bootlin.com>
Date: Mon, 22 Nov 2021 16:48:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CAA=hcWQt4W4F16jZpNfj427+Om7EvJMs+-QKbeq1_NkoQSQW_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 15:49:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158581

Hi Jupiter,

On 11/22/21 10:51 AM, JH wrote:
> Hi,
>
> I was able to build my package in Zeus, I am now upgrading from Zeus
> to Honister, the same package I could build in Zeus now failed in
> Honister at do_package where I installed my libraries and symbolic
> libraries links to my own RW locations:
>
> ERROR: QA Issue: Files/directories were installed but not shipped
>
> I purposely separate my application libraries and symbolic libraries
> links from traditional system RO library location to my application RW
> locations, I know how to handle it, it works perfectly built in Zeus,
> I don't need the Yocto QA to police it, I tried to add an empty
> do_package_qa() in my receipt, it does not work either. Are there any
> ways to disable package QA?
>
> Appreciate your advice either how to fix it or disable package QA.


These checks can be disabled. See
https://docs.yoctoproject.org/ref-manual/classes.html?highlight=insane#insane-bbclass
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


