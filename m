Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0775DC433EF
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 02:36:22 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.1561.1643423779564504743
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 18:36:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=XIIePZeB;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 85A3D8210D;
	Sat, 29 Jan 2022 03:36:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643423776;
	bh=Azm0z+3PsX/0IgMzeoDxIYVS4RuIsJdf/0JaZdZM5JA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XIIePZeB3Na9M7m/MTqpE0Sqz9hfgdntEUkSSrmjQF1UqFmdHm1tFiupCcGzYrNqG
	 Khh8m+2ZO5m4RtMsPSuBo5xYZy8wc5OHPRbpZ8rT7JOAYUJ66AhZbE/M3KW9je0ah7
	 X7h83tlSwTfiQlan5QnMrkBXP84agdabD1eLV4zpI9xu6wgp3f0e1q2wTfWS7QGNw+
	 JZsNh8ntn7BnKe6ES7J5+WJnQ4MP/cw2KCNMLbX04VdnnxDYTX3o03jxzly2AtCDFi
	 ODE6+ujt58RWCGAeNeXk/m8sLd+n1815nN08572img3dhnRRBGZdQDcxVjFmwVUSPd
	 6KOFLQnEXGWig==
Message-ID: <cd82c692-f11c-0e1d-4b53-950121e0b3bc@denx.de>
Date: Sat, 29 Jan 2022 03:36:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH] Revert "featimage: refactor style"
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: Andrej Valek <andrej.valek@siemens.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20220129002907.84534-1-marex@denx.de>
 <93bb78f01d7c44c1b5918e1576f2a804@axis.com>
 <315161c5-6b68-2b4c-37fc-3d10459fdbf8@denx.de>
 <53514b34002e424584e20150b6b725a7@axis.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <53514b34002e424584e20150b6b725a7@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jan 2022 02:36:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161094

On 1/29/22 03:01, Peter Kjellerstedt wrote:

Hi,

[...]

> Personally I do not see it as inconsistent, it is just the way
> shell handles variables. It is just something to get used to (I
> also had a colleague who would review any shell code changes we
> made and comment on every single unnecessary character so one
> quickly learned to use $foo everywhere possible rather than
> ${foo}...)

On the other hand, once you get burnt ${foo}bar / $foobar , you might 
quickly start putting the {} everywhere. That's my case.

(we should likely stop this ^ discussion thread before it turns into a 
flamewar)

> That said, I have never looked at this code so I
> have no real idea of how bad it is or isn't.

This patch lists pretty much all the vars, so you can get a pretty 
decent idea from just looking at that.

>> third alternative ? I mean, besides rewriting the fitimage
>> generation into python, which might make it more flexible too.
> 
> Replacing shell code that has grown beyond a couple of hundred
> (tens?) lines with something written in a better language is
> almost always a good idea.

It's grown to almost 800 LoC, so maybe it is time to reevaluate the 
python conversion then.

