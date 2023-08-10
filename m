Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA625C04E69
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 14:04:56 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.17901.1691676288987222914
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 07:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BRuAuCsC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7C09240008;
	Thu, 10 Aug 2023 14:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691676287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hZL0ZdUl+fKAK7Nd9zHBHB1lCdMo0W8FevPLHo23uWY=;
	b=BRuAuCsCf33yynqVRnYl4zAw2y6ed2Rg+Zm7bbxbgmlheIiEbLsprzZp1lqF2YVFMPCJv6
	c4bhyOX0YIzVuIZer3VzH5okN3iCeXWILvP8lCr/pBdfCub9eAGu8eDi5I9x95G0f19x9+
	0wbynpV5eQ0DMRtgNLvnO0/5RHE7zzcMYGoIb+7g9Hi8lSrBir0Wmb/YABdHJWYkpwKg6D
	5zjbWYWKUeUASeNoTWTFoXST96dzlgzfkqpL4CEqn5Xgp5I9eg6dAejzaih555397e+Mum
	8S3fzEwfdYwm/y/Spfr/46LDohf/qS+OWWpjJNriC+4t+CuiLw2kiECQmOYdsA==
Message-ID: <3faef71d-caaf-3d10-a894-5dec092d0d3c@bootlin.com>
Date: Thu, 10 Aug 2023 16:04:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: michael.opdenacker@bootlin.com,
 YP docs mailing list <docs@lists.yoctoproject.org>
Content-Language: en-US
To: OE-core <openembedded-core@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Keep scripts/create-pull-request and send-pull-request ?
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 14:04:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185748

Greetings,

I'm reviewing 
https://docs.yoctoproject.org/next/contributor-guide/submit-change.html#using-scripts-to-push-a-change-upstream-and-request-a-pull 
and trying to simplify it.

Do people still use scripts/create-pull-request and send-pull-request? I 
see some obsolete URLs in the first script, and mostly old commits to 
their code.

I'm also asking because I'm wondering whether it's better to document 
how to create and send pull requests from standard git tools. This way, 
people also learn how to submit pull requests to other upstreams.

What do you think?

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


