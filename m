Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79761C433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 09:31:57 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.3761.1665048708029951997
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 02:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UuBTomBa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7EF1720010;
	Thu,  6 Oct 2022 09:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665048706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/CJrHod5LG+fU9CDiNNQe2OFjNkdfAMVT98t0it3+YY=;
	b=UuBTomBafznboD4Bz18AW9hkJXoFR9NDNA5eR2i7MQKGXEZmQhhwXNqccmcPk1UBE4szTe
	xBwSIWZKfNKgVUc1YhnT983WsKwllCfXDKKzTVaYSu9AMI7iplhCNjmPP/c/OZS0jYhVHb
	RrDxbEV5OlBPHZ+FEdUUnUijadGhGFgN/ygeOuWL+sLVztGFvlVXFCSTiU5epXhrfwzEN6
	pKGxN5Ino5xhkcb2aBe2EEuSJCwjF1Asj2cVnpRh2GHb8KbeajQLT/aY9LPJEIzhsAqBmu
	26Z52wUJnAuR5BgZH+uAapxGj0xmAxSubogdxct35NXM/xq8sr1Yb+ky3hkfQQ==
Message-ID: <83545459-d79b-ba6c-ac28-a5a50a0997bc@bootlin.com>
Date: Thu, 6 Oct 2022 11:31:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: John Edward Broadbent <jebr@google.com>,
 Carson Labrado <clabrado@google.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [dunfell] [PATCH] externalsrc: git submodule--helper
 list unsupported
Content-Language: en-US
To: sven@svenschwermer.de
References: <20221006092257.67313-1-sven@svenschwermer.de>
 <171B70EA61BB4E6A.13650@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <171B70EA61BB4E6A.13650@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 09:31:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171485

Hi again Sven

On 06.10.22 11:30, Michael Opdenacker via lists.openembedded.org wrote:
> Hi Seven,


Sorry for the typo on your name!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


