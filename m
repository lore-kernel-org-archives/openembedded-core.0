Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9FEC3DA7A
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 18:00:02 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.244.1672941597108018789
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 09:59:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fXmL7JY7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8EB3020002;
	Thu,  5 Jan 2023 17:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672941595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uIpCKYxSm7iIDWtFwvcY37pGY5XSOMYWqTwS5nghPtc=;
	b=fXmL7JY7MSjYvCflDr1XRYdOdjhyyCZs0ZMt2zBGt69cSIw+EsLjMy9KAEC0kG0cTrWwKE
	6Av3br3tkUbDjh6/y1GEDUhac0QosiUTxrRJAiFAVOsIWPIU7ga32K14ALlC0tdWybvtJ6
	SnKStyeeEiHAFZo9WZNAfTWnqSO3uKLQgVIAFhN2/UjwB9MT3pq+T8QrpQh2B1OJxtCi9B
	7waIJmVv4uMKbjo8mB5W/9duPGadVQV18oPskkFtlm/kPThFDWS2fyDa2EeOWqj9eba+4C
	Uu8UOerNEc1BQHhlhczgw7jx1LlczgHb+pqGZjJgF+1ljFIFUscrak3zJudZUw==
Date: Thu, 5 Jan 2023 18:59:54 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] gcr3: update 3.40.0 -> 3.41.1
Message-ID: <Y7cQGj3L0Vcuktps@mail.local>
References: <20230101142414.463881-1-f_l_k@t-online.de>
 <Y7YD1ZgSe7b+UIBt@mail.local>
 <DMR0OR.Q1D80VIV2M3N1@t-online.de>
 <CANNYZj_A=RVVUVu0YQDWMOk=9ZXEQq3=UoR3iA+DAOP-qpe1AA@mail.gmail.com>
 <JWR0OR.6UB8QLRZ7CCN2@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <JWR0OR.6UB8QLRZ7CCN2@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 18:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175546

On 05/01/2023 16:48:19+0100, Markus Volk wrote:
> Am Do, 5. Jan 2023 um 16:46:37 +0100 schrieb Alexander Kanavin
> <alex.kanavin@gmail.com>:
> > 
> 
> I already sent a v2 patch that should fix it
> 

Then please say so in v2, I can't guess why you sent a v2 when there
where no comment on v1

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

