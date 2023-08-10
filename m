Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1451C001B0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 14:13:36 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.18144.1691676811442964772
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 07:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ju0IV9o1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C3ADFF806;
	Thu, 10 Aug 2023 14:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691676809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sZiQUYmqLeNDFyUTIUAdkIcDjkg9olCEAK5ak0hJ9tw=;
	b=ju0IV9o1ZCVp/tBssq9ACM1NsoR/WywCnyMqCHw6tUGPC3FZeZoX4oMzyidWFie4VYvMie
	pSuAAZvkennvCFsO8Sj5AJEogdXmJ4WCueFObAfaG9lcsfpix10rrbbuC8q19yuQ77xZD4
	mktNJxVRfZXcti/ipx9ywHcu8kFGNG0OPRAm5n7rYtU61irBfbzITZGVut64dMc/Jh1IgR
	6efFic4fqsflCbjq2NIOGcgHv6FH2nr053CU6zMUDK5wmzrbTv6jGDPjBqSUicMCdHZjnI
	R46xKVeBSjfxC50waaeOBicA8n1NDep/oS6RQi3vUuUOMUyvn+suSfHrpr1r4A==
Message-ID: <a460f22c-a39d-296c-65df-0997b897d7f0@bootlin.com>
Date: Thu, 10 Aug 2023 16:13:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] Keep scripts/create-pull-request and send-pull-request ?
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <3faef71d-caaf-3d10-a894-5dec092d0d3c@bootlin.com>
 <CADkTA4PUSq22Ct4qg50VaAtY79Q9o9FgtDmziry7QwyAqqi3qg@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CADkTA4PUSq22Ct4qg50VaAtY79Q9o9FgtDmziry7QwyAqqi3qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 14:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185751

Hi Bruce

On 10.08.23 at 16:09, Bruce Ashfield wrote:
> On Thu, Aug 10, 2023 at 10:04 AM Michael Opdenacker via
> lists.yoctoproject.org
> <michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
>> Greetings,
>>
>> I'm reviewing
>> https://docs.yoctoproject.org/next/contributor-guide/submit-change.html#using-scripts-to-push-a-change-upstream-and-request-a-pull
>> and trying to simplify it.
>>
>> Do people still use scripts/create-pull-request and send-pull-request? I
>> see some obsolete URLs in the first script, and mostly old commits to
>> their code.
> I use create-pull-request for all my series, so the scripts still do
> work and are in at least in use here.
>
> But I send with git send-email directly.


Good to know, thanks!
So, we need to keep at least the first one. I'll send a patch to it then.

I'm not saying we should keep documenting them though ;-)

Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


