Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307EACD54A8
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 08:35:10 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.3375.1695112505762947720
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 01:35:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Xvd1+/CX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CABD320007;
	Tue, 19 Sep 2023 08:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695112503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UDx3rmaPb44VOKdlhaK26SVTLYmq2BMjn5UaqbSmWDI=;
	b=Xvd1+/CXgj3E2qxXx9fsIfrgeRJy80lCXwI8abhmCH0uaowqt0H461Qc2E+omHliF3vi8s
	2eXcirffXF7LCwS90HS5/1qRGDuVQ448PUx24QL7YNlfo/T5H4KI06vyZGITyvaefd1oJ9
	u2wgXynBJnoRBKgQfmOR/wn38iUAJav8MwBg9pTlQdGNnQkxVhyo25PlT+RqGnBgVSoa77
	dxVSrVJfKEA9sTcvFJPAaBQ/I0KYElSpWNgeZdeZPQ11jlcBul3JF7p+yBn/pxio8+Zy+Z
	Qeo2pGDBxmRtyJMJlpQjM7kZI7pT0R8hf8n0aJEQJE3q1nvndEwVBNOIsWdgsg==
Message-ID: <462013a9-6a53-81ab-f10e-c9ec3663ca5a@bootlin.com>
Date: Tue, 19 Sep 2023 10:35:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [AUH] alsa-lib: upgrading to 1.2.10 FAILED
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <0101018a9a36c5d5-dcf81a91-7709-4c49-933d-29b6888c00ba-000000@us-west-2.amazonses.com>
 <071e06cc-37ab-fd55-aac5-a089bc1501b0@bootlin.com>
 <CANNYZj9Sy+vMoOF5s9yHejT2fCbE1LhOtbxMEXqME4sPePyJ+A@mail.gmail.com>
 <1a9a7ce4-821e-4e82-6b55-c0dd5dc9283d@bootlin.com>
 <CANNYZj8T-7y9fJ3rn12mMA4Su-T=GC6Un7M+3Kd62aZP=wYjoA@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CANNYZj8T-7y9fJ3rn12mMA4Su-T=GC6Un7M+3Kd62aZP=wYjoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 08:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187850

Hi Alex

On 18.09.23 at 21:13, Alexander Kanavin wrote:
> On Mon, 18 Sept 2023 at 20:46, Michael Opdenacker
> <michael.opdenacker@bootlin.com> wrote:
>> Ah, right, I should have paid attention to the file name.
>> I could reproduce it too.
>>
>> Thanks a lot Alex :)
>> Michael.
> I think this backport should help:
> https://github.com/alsa-project/alsa-lib/commit/10bd599970acc71c92f85eb08943eb8d3d702a9c


Good catch. Indeed this fixes the issue.
I'll send a patch shortly.

Many thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


