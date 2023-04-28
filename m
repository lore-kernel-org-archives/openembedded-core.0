Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824E4C77B60
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 09:03:57 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.14966.1682672633040540601
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 02:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oHYAJ+kj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D2F6C1BF20E;
	Fri, 28 Apr 2023 09:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682672630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mY76xHxGhQMNo3Bo6KbjdsNreEovoi8PzlqHLb0UEHM=;
	b=oHYAJ+kjuUwLJ011MQvQQnYKrf/D7OxqYbRpowbCcJrUPT/VHqNCcm9/mfW9bAuBYBzec9
	DwUfXjjHCFvk5o1ND7biSK/ItOi02P+Q/nQXHhl8B4q5Y1XlnGVTNXJRK/jpfLHe6lhPU4
	Z6HP2E6pnXylfYFKh4GhEqYfC/oTflR7o/YFM0Neh8ww13XVXaAqujOw8z9Lm+fmEfrJPi
	UVooa0R6wqxt3niH4tlT31aOVQoOi2iMtJZH/afiafrd6llLQky9jYV7DIfMIN+dDDymbc
	qxyDLisJsOqmV1zfKO4T1jCqCYSONqS0auGVhwXhkJTBZ9TzPAx15KY23F5N4Q==
Message-ID: <febb64e8-f66a-79dc-3922-50bba3605969@bootlin.com>
Date: Fri, 28 Apr 2023 11:03:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 YP docs mailing list <docs@lists.yoctoproject.org>,
 Paul Eggleton <paul.eggleton@linux.microsoft.com>
Subject: Re: [docs] [OE-core] Difference between INIT_MANAGER="none" and
 INIT_MANAGER="sysvinit"?
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <66b9a05e-00fe-a3f7-82e1-2cb9459d87f8@bootlin.com>
 <CAMKF1srkaS9byR-TmRKxbr3Nka4BJ5VEhwkU6nSmrAD53VLzhA@mail.gmail.com>
 <CANNYZj9v5gskXjCPRvvaixnyZeV4A1mSdACUkME8etUc28BBHg@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CANNYZj9v5gskXjCPRvvaixnyZeV4A1mSdACUkME8etUc28BBHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 09:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180523

Hi Alex,

Getting back to this old thread about setting INIT_MANAGER to "none", 
which currently produces a system based on sysvinit and udev.

On 23.02.23 at 19:22, Alexander Kanavin wrote:
> none is a confusing name though. Should it be dropped and nodistro
> tweaked to use sysvinit?

Indeed, that's confusing. Even Paul Eggleton got it wrong when he 
documented INIT_MANAGER.

I'll send a patch that fixes this on master Poky, but indeed removing 
"none" is another option.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


