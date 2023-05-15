Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8E6C7EE22
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 08:17:51 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.83244.1684138662231057533
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 01:17:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UIjxzxqC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C3131C0006;
	Mon, 15 May 2023 08:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684138660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m0fAEezkUo1nIwYcdh5KOnGFYTX7lVhkka1cbN6q9FQ=;
	b=UIjxzxqCvcynlid3avJ3aPDLbNg/7+ddBQAQXzicudU8eU6tbhFpDdNH2TucSkOA5IKPl1
	50drxFJ6xsmwlh6JhllnzSFJt4xoIH430Y9Lg93RS6TwjHdsluFa31JzrZXvktimxaarQ7
	x4x7v37B+f6VbfQFWft4n29GXzjj+2mbixe/+4GDSVzJidbiO0KYpTYiSey8jEB9FsCZ4Y
	pISzrt6eokMmIFo39dgbv1GeGjFr24z1n+6qqrrXwh71CI7DhkTtBozkjlWEl3byKUMH9k
	o0lsvmWvoc0T84MrsHbHgZx7dke2noTxhPxq1FNnhZoEboCD41UYy9n9dTjWGw==
Message-ID: <12aa7d8d-4207-46d1-e74e-58fb9942a701@bootlin.com>
Date: Mon, 15 May 2023 10:17:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 14 May 2023
 01:00:01 AM HST
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org,
 yocto-security@lists.yoctoproject.org
References: <20230514112915.DBC579603D3@nuc.router0800d9.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230514112915.DBC579603D3@nuc.router0800d9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 08:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181232


On 14.05.23 at 13:29, Steve Sakoman wrote:
> Branch: master
>
> New this week: 3 CVEs
> CVE-2022-21227 (CVSS3: 7.5 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-21227 *
> CVE-2023-2426 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2426 *
> CVE-2023-2610 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2610 *


The number of vulnerabilities coming from vim week after week, year 
after year, is always striking to me. Could it be because of lower code 
quality compared to other projects of similar complexity? Could the 
situation be better if we supported neovim instead?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


