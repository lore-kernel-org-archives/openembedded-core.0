Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F62C27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 09:50:45 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.41718.1674640236171862935
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 01:50:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TNTvlJfw;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CAB33100009;
	Wed, 25 Jan 2023 09:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674640233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g2SVQVP6GDz6Mr2g7gti4E9gZWSXLM3kDE3DSmikKYc=;
	b=TNTvlJfwXQlfxeDmE3OeARTlFPbgCGCEAfukSOH70mewU6Q14xGTYBkwDmlWgmMlQgb8fC
	QII0yParE9Pf+qvWFT0JEH7DJppaszqeHr4vX7DDvssG14lwcUgjvFoyYGxtX7712HWBdE
	HQbIbd5xxMIvs1VVT9Prp6b6XRfVToa4GnYZAZ2xSXQXEO21fB3hGuomwdiy5btZcFNpDU
	717GBf00P7DiVnpmjmzIoDY7hjAwyClygq75Omod7lQu8ElIJrmFbU8DBuYy2UwSsokOnl
	I5AXmBy7hncaqXktWY+jpP1B9k3HsquwaiIsLx/YBILth/F8tHJ2A9qZmLASGg==
Message-ID: <dcb90812-d2b8-d316-b93a-eae1b7f42a92@bootlin.com>
Date: Wed, 25 Jan 2023 10:50:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: michael.opdenacker@bootlin.com,
 OE-core <openembedded-core@lists.openembedded.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: Re: [yocto-security] [OE-core] OE-core CVE metrics for master on Sun
 22 Jan 2023 02:00:01 AM HST
Content-Language: en-US
To: Ross Burton <ross.burton@arm.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230122120427.D9CF696035B@nuc.router0800d9.com>
 <D5C2125C-6245-4E41-9029-6EF99E4AE623@arm.com>
 <CANNYZj-mtOntD4NcfMKd4j5jqzCN6sP_OFrGdVWWBv8ug93=Yw@mail.gmail.com>
 <37CCF635-CA4E-4300-A49C-0F31D9472B6A@arm.com>
 <eac9dcd2a8b0f0916fd373da9f2c3ee198d437ba.camel@linuxfoundation.org>
 <2E81B0F3-3747-46CD-85F2-9BBED3F1CF8E@arm.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <2E81B0F3-3747-46CD-85F2-9BBED3F1CF8E@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 09:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176344


On 23.01.23 at 14:41, Ross Burton wrote:
> On 23 Jan 2023, at 13:35, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>> I’ve started braindumping into
>>> https://wiki.yoctoproject.org/wiki/CVE_Triage, when it’s expanded and
>>> complete we can link to it. Or maybe we should just start a
>>> Maintainers book in the documentation?
>> Lets put it in the manual. The wiki is good to pull together info but
>> I'd like the manual to be definitive. I've thought this about patch
>> submission for a while too, we have too many docs with the useful bits
>> of data spread over two wikis and a few READMEs…
> Copying in Michael and Quentin.
>
> Taking the JFDI approach, I’ve started (another) wiki page to collect a table of contents at least:
>
> https://wiki.yoctoproject.org/wiki/Maintainers_Manual
>
> I’m sure there’s plenty I left out, but that’s a start!


Thanks! I will start working on it in the next days.
It's true the guidelines are scattered in so many places that 
consolidating them all in a central place will help.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


