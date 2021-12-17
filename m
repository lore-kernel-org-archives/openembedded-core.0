Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C37FC433F5
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 10:19:48 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.4581.1639736387291801800
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 02:19:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 14ADE2000F;
	Fri, 17 Dec 2021 10:19:44 +0000 (UTC)
Cc: michael.opdenacker@bootlin.com
To: YP docs mailing list <docs@lists.yoctoproject.org>,
 OE-core <openembedded-core@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: What does OEBasic do?
Organization: Bootlin
Message-ID: <01f8e45d-4e08-cbf9-277d-ac09cb3538c2@bootlin.com>
Date: Fri, 17 Dec 2021 11:19:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 10:19:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159819

Greetings,

I'm trying to update the documentation in
https://docs.yoctoproject.org/overview-manual/concepts.html#checksums-signatures.
With OEEquivHash, meta/lib/oe/sstatesig.py now implements 3 signature
handlers instead of 2.

However, I find parts of this document difficult to understand. In
particular, what's OEBasic supposed to do?
I could clarify its description if I could understand it better. We just
know that it doesn't store the task hash into the task stamp, but what else?

Sorry, I looked at the code, but it is not explicit enough (at least for
me) to find the answers by myself.

By the way, this "Checksums (Signatures)" chapter looks like an exact
duplicate of what is found in BitBake's manual
(https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-execution.html).
This is bad because future changes could introduce discrepancies between
both copies and confuse readers. Shouldn't we have a summary in the
Yocto docs instead and refer to BitBake's manual instead? Or the
opposite, as OEBasic, OEBasicHash and OEEquivHash are implemented by
OE-Core and are a nice illustration of what BitBake allows to do?

Thanks in advance for your help and advice.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


