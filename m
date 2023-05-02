Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E494C77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 14:17:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.842.1683037074728871077
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 07:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hZkDXBiS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3B534FF805;
	Tue,  2 May 2023 14:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683037072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4iyQYyWCl33oE2HTslgkHy5AsoQvkOrikybmP7DWOs=;
	b=hZkDXBiSAQPdmzuOO0z38otyawLIoQbJ4HddeDRJ7105OyC2lbCVhLWaMG9HZtcL3v9Wg3
	d4zsPRqjfUK+slTev/zn3F7Jgs9mgh6RKoDpt2o6jUj2FVU4UUQtsJFqRNPZi6Uos7LHKy
	aA4t/uI79wJd8ziK1QOeFHUt71X+m8Mxxxl4F1N6S4uA9GlvhWKl3UrBmtKtrB62LzO6yL
	Ig7CjguQDnnKP8MWuil/5ivPhKeFdmCVqxtTMlmbhe5mORiNziUmiiEc/fPtF6jGb/wteu
	j9Oy9ibwMUZmdTGXZPFPXzHltajD7rcEA5W24VQMGIkPZ/vFjGGv5DymBU53mQ==
Message-ID: <615f7d43-4c3a-2698-7692-9bfbe7febb04@bootlin.com>
Date: Tue, 2 May 2023 16:17:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: openembedded-core@lists.openembedded.org, docs@lists.yoctoproject.org
Subject: Re: [OE-core] [PATCH] init-manager-none.inc: have no init manager
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <175A0DD84C89F64A.26969@lists.openembedded.org>
 <20230428090602.82995-1-michael.opdenacker@bootlin.com>
 <20230502141402301f77f9@mail.local>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230502141402301f77f9@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 14:17:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180732

Hi Alex,

On 02.05.23 at 16:14, Alexandre Belloni wrote:
> Hello,
>
> This causes the following error:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/7035/steps/12/logs/stdio
>
> This is the expected behaviour of the patch but doesn't fit with what
> this particular build (qemuarm-oecore) is testing as we can't run
> testimage without an init. I'm wondering what should be the proper
> course of action here.


Thanks for the report!
Maybe another option is to remove the "none" option, as someone also 
suggested, as it is currently identical to the "sysvinit" option.

Any further thoughts?
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


