Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70928C43334
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 16:44:58 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.608.1656434690552298332
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 09:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ADzIpw2B;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 36BCF1BF204;
	Tue, 28 Jun 2022 16:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656434688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PxMVOduUZFfGa6zfG8Tiv7hv5WqDpR6tf41PdAMT2jQ=;
	b=ADzIpw2BpXM09HBQV+Y4M8Oru++pa+urfZ0JdIPubckttLngeSj7dB8dXksSy7jU9yftXt
	AyWTjelZlAN0iIE0PJByUMV5iODtmYjitvv11sofj4CNdYt/se05aQnPfdswisbtNt7JNt
	FhfoxfhU5QPSHDoY0CV++TVzs8WJaMUU61ceAOR8CR09Ml1dxExa1zfMRY2BtgqshNDOnO
	VUd17R3wfOgVmQ4SfRKmmP34Xfj//xeELDdU6fdbKE1NoVZuinEgwOFFtCwPIBt7PnyWkw
	Tq7xMRjx9gXK/h75OQkNgE00RJqJa1OrzWfbn6gkwblgbeETY1Nv8vkJQHI/Dg==
Message-ID: <d646b29d-e4e8-6ec0-9e8c-238f1dead305@bootlin.com>
Date: Tue, 28 Jun 2022 18:44:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Error building an npm package: npmignore: not found
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 enrico.scholz@sigma-chemnitz.de
References: <d5e6b77b-096d-3dd8-8c42-18c7adbb9fb2@bootlin.com>
 <lyo7yef4fu.fsf@ensc-pc.intern.sigma-chemnitz.de>
 <488fac057190a6378b550763fbcd1faaa9b22cce.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <488fac057190a6378b550763fbcd1faaa9b22cce.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 16:44:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167352

Richard, Enrico,

On 6/27/22 18:47, Richard Purdie wrote:
> On Mon, 2022-06-27 at 18:37 +0200, Enrico Scholz via
> lists.openembedded.org wrote:
>> "Michael Opdenacker via lists.openembedded.org"
>> <michael.opdenacker=bootlin.com@lists.openembedded.org> writes:
>>
>>> I'm testing the Yocto Project Documentation for creating NPM packages
>> npm is broken since kirkstone; see
>> https://patchwork.yoctoproject.org/project/oe-core/list/?series=4303 for
>> patches.
>>
> Thanks for the reminder, we should probably test and merge these. I was
> hoping we'd get some review from someone else but it seems not many
> people are using those code paths :/.


Yessss, the changes now in Poky's master branch allowed me to build my 
recipe and all issues are gone.
What the documentation describes still works.
Many thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


