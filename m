Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92E9C77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 20:48:48 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.5392.1685479723569572558
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 13:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=njy9AJIS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685479722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hEbw6sLoBRrvTNAzdNjNtP1EFMnhroCV5SmXH9IQW94=;
	b=njy9AJISxdiSQjZVCU1xEvHQO/oobE5WNXXwaCuIrN6LxfSJWi9Gh5oHHKsj+fmB/vFTOa
	ok/EQmREu3joTiqf/ZXfLkRyK/u60ddXV9a/+zN6XCT7EkVSjoHTVf/eUmF0gufZXwantC
	/HLIjlJ60aOHAqN6Q807WAFO3K8YEaJRPE2z8WA1gMWUB//yxn6LJAJIIpBOwZ4OakrhdW
	nWoUe2mGqSYS7KW+MrOh7UaUjPgRPUFRpxxM6SGZu7ITBmHx5BW2wgEyW+XvHw1xrW6NUs
	wqt+vZjwQfHkc8TYylf6VSCs5bipTSJHE4RJ5y3ZUukTN8NEVWxbYWAOsdJroA==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D0C01BF205;
	Tue, 30 May 2023 20:48:39 +0000 (UTC)
Date: Tue, 30 May 2023 22:48:39 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: randy.macleod@windriver.com
Cc: =?iso-8859-1?Q?Fr=E9d=E9ric?= Martinsons <frederic.martinsons@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Yash Shinde <yashinde145@gmail.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com,
	Sundeep.Kokkonda@windriver.com,
	Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: Re: [OE-core] [PATCH v14] Rust Oe-Selftest implementation
Message-ID: <20230530204839cb0000a8@mail.local>
References: <20230530105125.445622-1-yashinde145@gmail.com>
 <7c9a0a78204958d84c4a3779da7c0f1b0e66dda8.camel@linuxfoundation.org>
 <CA+cAkeoEfQWbQkwYMhAUqQKQXyXcyCYJdoFewWkDKsVW=Mpyeg@mail.gmail.com>
 <c13fb9159ec84ab2bb4710a3e59190db61b54612.camel@linuxfoundation.org>
 <CA+cAkeqPd=5dodJ_mfEv_w-BsvfUCE1JQq1k1oSk+Paegrv3ZQ@mail.gmail.com>
 <d07d99ab-865b-0d1a-1efb-4e8c167415b8@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d07d99ab-865b-0d1a-1efb-4e8c167415b8@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 20:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181951

Hello,

On 30/05/2023 14:28:24-0400, Randy MacLeod via lists.openembedded.org wrote:
> On 2023-05-30 11:05, Fr�d�ric Martinsons wrote:
> > Oh okay, didn't try that personnaly.
> > the class is currently tied to cargo behavior so for performing rust
> > core tests, it will not be suitable (at least in its present form)
> 
> Well, that's good news in that we won't have to change our approach for v15
> !
> 
> 
> On 2023-05-30 09:59, Richard Purdie wrote:
> > I did put this into a build for testing on the autobuilder. It hasn't
> > been running long and I can already see build failures such as:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/6077
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7200
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/7190
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2923
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/7200
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/7217
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/6080
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7146
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/7184
> > 
> > and there will likely be more.
> > 
> > I'm finding this rather frustrating and am not sure how this was
> > tested.
> 
> That's probably my fault. I've been asking Yash to keep pushing and
> suggesting that
> I could help him with testing but the bad news is that we (Wind River)
> have the tail end of a product release cycle happening now.
> 
> I'd like to help out with this, but it'll have to wait for at least 2 months
> and
> that puts us close to the end of M3 so we might have to wait for the
> beginning
> of the fail development cycle.
> 
> Let me talk with Yashe and Sundeep and reply with info on what to expect.

I can run builds on the autobuilders on free cycles as long as it is
clearly communicated that the patch has not been tested so it doesn't
impair other patch testing.



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

