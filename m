Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E5D0C77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 18:35:54 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.29880.1684262151152501110
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 11:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EeEKvKpt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3D90BFF802
	for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 18:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684262147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Gtw+qZ4pgAIujG23oYC4vSJItW/y2qCat7c9hkb+c4=;
	b=EeEKvKpt4FIJb+2BPDRLFvHWEOKEXh3svTIyvuIZZbKPpEoBQtrVO1LlI/Hz5/8J5pw84G
	O5x9kNYLEYB7ddFYZbFfcrheILSAcIPcj4MjgkSxU62fsjf/GEHv5CQMCCNwYHtgaWEh5G
	TkdwGHssIFFdRJ9SyUq/r6TDAI4Q4hA8+b4SYQyGQe4bbczmlpmTyv24P3QI4O90SXt7Hh
	Gr9Lmv3xwdfgKLrYpcI41uxloahaPYoA5CCwavERxUqQcl1JlqZ5l2HZnQm9ykpN7pK2xJ
	s67zWITYo0KlD91YK9dO2uLXun8L/ya/Ky4yy1MXxe253biNChlI3lOIzPCEbg==
Message-ID: <ec486022-0d39-73ad-42d9-6fbf8f486573@bootlin.com>
Date: Tue, 16 May 2023 20:35:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [PATCH] bitbake.conf: add "xz" to HOSTTOOLS
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20230516183009.1874105-1-michael.opdenacker@bootlin.com>
 <175FB334169DDB45.20583@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <175FB334169DDB45.20583@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 18:35:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181411


On 16.05.23 at 20:30, Michael Opdenacker via lists.openembedded.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> xz is necessary to extract the uninative binary shims
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>


Oops, forget about this patch. It's an old one, and it has already been 
applied.
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


