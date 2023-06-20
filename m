Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C4AEB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 17:04:18 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.1468.1687280652779888690
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 10:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 35KH4BF4011143;
	Tue, 20 Jun 2023 12:04:11 -0500
Message-ID: <509fb73a-b410-47da-8958-e2ae0de33437@kernel.crashing.org>
Date: Tue, 20 Jun 2023 12:04:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Content-Language: en-US
To: "'steve@sakoman.com'" <steve@sakoman.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: Langdale?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 17:04:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183153

I know there won't be any more releases of langdale (as well as automatic 
backports for security and other things.)  However, I found a bug in the oeqa 
qemurunner (fixed in Mickledore).  Would you be willing to take the backport fix 
(one line) or is the branch closed for further development?

Thanks!
--Mark

