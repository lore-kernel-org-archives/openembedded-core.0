Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25C0C46467
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 14:41:51 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.65192.1672756910804656992
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 06:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CVN3kjmf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A61456000A;
	Tue,  3 Jan 2023 14:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672756908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jo4+hxNDdBNc7KDttJxRmv+Ow28NihFJ1GqoQxg72N8=;
	b=CVN3kjmfL9QACd7t5jH89TEuNgZ/WTdAj0x6Y3JzqeDS6mSt47Q38GpAms5tS2vafeiUI5
	ctuKIoZvTo5u7bxH9unZsaaS56UsDCV9C4294s7C9oLjGgb69IwgySiBeKAgtRWhYPqdh1
	DaF49IB87imzMXEntXeYNa0ONLLZ0rzC5j50fBqItC1ICZlMYq7IMnWsQH+1I5+PtqSb2Y
	DRyjR68G/1R7gQOAVXYDLWVFlTRFq3uKhACVFnok9c4yS5es1rfeF3wO4WR7t+Sw64o9NG
	tqYc3RC0tdYxzujgxR0dbhuInVm7pcaulUnFjkMpBU2r84GHSPtypN1KfZ137g==
Message-ID: <364c0b27-5d4c-4fb0-8448-04e365c17744@bootlin.com>
Date: Tue, 3 Jan 2023 15:41:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>, "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [OE-core] is "poky" distro defined to use "sysvinit" as
 INIT_MANAGER?
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <2893205d-57e1-e63e-5c12-c57c7bbcb924@crashcourse.ca>
 <CAMKF1spKw-X-JTvdicfBBNNGk93EPL=gqD3jixvJkb7YfT1P0g@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAMKF1spKw-X-JTvdicfBBNNGk93EPL=gqD3jixvJkb7YfT1P0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 14:41:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175358

Hello Richard,

Trying to improve the documentation about the selection of the init 
system, I'm jumping back to this old conversation, following a change 
that you made (https://lists.yoctoproject.org/g/poky/message/12760).

Am 06.07.22 um 18:40 schrieb Khem Raj:
> On Wed, Jul 6, 2022 at 12:38 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>>
>>    not sure why i never noticed this before, but i started a new
>> project from the poky layer (not OE), and realized that poky.conf
>> explicitly sets:
>>
>>    INIT_MANAGER = "sysvinit"
>>
>> which can't be overridden in my local.conf. if i want systemd, i guess
>> i can initialize my project from the OE layer, and i also notice that
>> i could use poky-altcfg.conf.
>>
>>    but is there a reason that the default poky-based project fixes
>> INIT_MANAGER to "sysvinit". perhaps just for simplicity?
>>
> poky defaults to sysvinit.
> poky has poky-alt distro fi you want to use say systemd

But why not setting INIT_MANAGER with "?=" instead of "=" in poky.conf?

This way, we could just override INIT_MANAGER from local.conf.

I checked that the generated system works. This would make things easier 
to document, unless I'm missing other reasons.

Thanks in advance,

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


