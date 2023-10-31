Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF31DC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 14:54:07 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.711.1698764046061799243
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 07:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BKajm3dq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B2CEE000A;
	Tue, 31 Oct 2023 14:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698764043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jAgJlS7k5+SfvCWSPGw+M77VheYOfaPAkAKzPKIXXmg=;
	b=BKajm3dqYQHurarU+731bYDD8fXZQCS5jBR1N993f6dOYvbgcb9YD+1AK8O4Lg0PuYBfaG
	01nzuF42KsNq3rxogxEJhF3yZHUrQWTfo+1wNuJLuZPjkvI7FzCf0HNj33Yby2F2mMFeii
	5o7WXrINUdnd9159d0MbsDtcsSYGwLyufP6xNwti3GE80/Oj34c6dQ01IJnBIkq8d7UNMD
	5pob3hwJN3+D0YmTGYLjjm/PODLCvE7OrD1CwzDI3IcvR4FoT8a0rahDkQvE2YKEYTnqv+
	Uu2a8g8yUVvSAPcw12/UtZhQlaTXF/hD1zyvBhmSngje183IdiINVG8NLRSO8w==
Message-ID: <14d60323-c668-411c-b3dd-c6cfe059fc86@bootlin.com>
Date: Tue, 31 Oct 2023 15:54:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Patchtest results for [OE-core][PATCH] patchtest: shorten test
 result outputs
Content-Language: en-US
To: tgamblin@baylibre.com
References: <0101018b861b3b32-256b0c3e-5bb7-40da-83f1-f6717726db5e-000000@us-west-2.amazonses.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <0101018b861b3b32-256b0c3e-5bb7-40da-83f1-f6717726db5e-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 14:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189847

Hi Trevor,

On 31.10.23 at 15:20, Trevor Gamblin wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/patchtest-shorten-test-result-outputs.patch

Thanks for this very useful service!

However, could the replies have an "In-Reply-To" header so that e-mail 
clients can put the reply in the same thread as the patch?

Happy to create an entry in Bugzilla if this helps.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


