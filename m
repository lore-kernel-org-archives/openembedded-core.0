Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE611C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 10:42:14 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.48188.1699008126504462617
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 03:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZCg/2cow;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 424141BF204;
	Fri,  3 Nov 2023 10:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699008124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gxxp7b/Go2UCYBdlnBR3gm/RYcAIEIqMV558kK1HKFQ=;
	b=ZCg/2cowKkSC5g1BuRqWDHUcDrMHVKgzOc77BY1tVUEdqzWiCT9qhpuVaKSuydPGBmMC7d
	Cw9CrIs+uWLomeGlBCpt4ZM+Hhgibv7OVDxhGsFCkeFTG12gKtbdp4UAfDSnSJe7+JyKFx
	owv4SslQCZI3Mt+UEDJXGOBWfXhHDvZzdi/v8j0eFz7sOWTsRQpb9uE5b/yHsJ3aD93u2h
	E4Cf19dZKhDNafd7Z1V7o6gDng8pZao8fDzRZwXU6Y8BFOt643+YN8i4R/ZD2JrJam4bB2
	6eEXH0Ad1tXed5RMStLrXoJSVXIIKERkwp6556IXqvFz7We1+H09rLfFc2pILQ==
Message-ID: <136f88cc-8cc7-4a39-a961-4fb21e01e112@bootlin.com>
Date: Fri, 3 Nov 2023 11:42:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Meaning of the name of the "cml1" class?
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>
References: <b42f4bae-5096-4a99-ac85-8750396580b8@bootlin.com>
 <CA+chaQc+cEQxc+HjyRBqXVL0m7718Ffb=XXtaKO2DiShE18dGg@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CA+chaQc+cEQxc+HjyRBqXVL0m7718Ffb=XXtaKO2DiShE18dGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 10:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190152


On 03.11.23 at 10:52, Martin Jansa wrote:
> The answer from 2022-07-18 on #yocto channel:
>
> 20:20 < hushmoney> what does clm1 stand for as in clm1.bbclass?
> 20:20 < hushmoney> s/clm1/cml1/g
> 20:31 < JaMa> hushmoney: interesting question, the bbclass was 
> introduced very long time ago (already included in 2004 
> https://git.openembedded.org/openembedded/commit/?h=master&id=a780643c4b6aa11e1a36965a69df7116477c7b4c 
> <https://git.openembedded.org/openembedded/commit/?h=master&id=a780643c4b6aa11e1a36965a69df7116477c7b4c>) 
> and it was very small until 
> https://git.openembedded.org/openembedded/commit/?h=master&id=f6433e75a047a2d38ab60efea8a7ab7cc3dcd822 
> <https://git.openembedded.org/openembedded/commit/?h=master&id=f6433e75a047a2d38ab60efea8a7ab7cc3dcd822> 
> Don't know what it really stands for
> 20:35 < hushmoney> yes that's what i saw too
> 20:37 < hushmoney> i grepped the linux source for cml1 and only found 
> references to some clock in modules and device trees, don't think 
> that's related
> 20:45 < JaMa> http://www.catb.org/~esr/cml2/ANNOUNCEMENT
> 20:48 < hushmoney> wow, good find! still doesn't answer what cml 
> stands for, but at least i know now to what it refers and that more 
> answers lie outside of yocto history
> 20:50 < hushmoney> here it is. cml = Configuration Menu Language
> 20:50 < hushmoney> JaMa: thanks!
> 20:51 < hushmoney> sort of an odd choice for that bbclass name, but at 
> least now i know where it came from
> 20:56 < kergoth> hushmoney: it's named based on the ocnifguration 
> language it interacts with, as it's common to more than just kernels, 
> it's used by busybox, buildroot, and other projects as well

Great, many thanks. Better than the "Configure My Linux" hypothesis!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


