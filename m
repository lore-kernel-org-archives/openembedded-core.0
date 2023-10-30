Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A50EC4167D
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 20:44:35 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.169572.1698698672482355834
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 13:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PMcvVne+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 238EC1BF203;
	Mon, 30 Oct 2023 20:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698698670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=++Me/NrdQpHrVn5MABMf6PYrZ4YtWDpl+OPugHA4wSo=;
	b=PMcvVne+1eyMCn9QADaSIutIvzV4E2XoeDFuVKVAAT94HOf5ANkdkxAbyYoQZovrSVUhGt
	rVqFfWr24R9xJsEFvDFxA2i2L0eYlc8GgnqVZdiFQR5UQYHL6X4ZAr6sVitF4+6FdQcilj
	Cryd/NZKbRyn2jtT8ox/ouR/5Y7VtfSrLMhco/kFbN6dhMExHdQUORRnOsBtbXOa5kkYmR
	BMBezKks0yaAoH4U+F38i5YBZj6Lwv+j61KCZ6+o92JSd4QGuCK3/fqjxsmq6KZ9ZvH6pl
	AhaoB493ZIS7tg3By9u9PiIIrr0w8QRUsPCezBUZl/omccjdW1sjr/H9/O6/SA==
Message-ID: <ac7b29af-f952-465f-bba8-484940320b99@bootlin.com>
Date: Mon, 30 Oct 2023 21:44:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: YP docs mailing list <docs@lists.yoctoproject.org>,
 Paul Eggleton <paul.eggleton@linux.microsoft.com>,
 Lee Chee Yang <chee.yang.lee@intel.com>
Content-Language: en-US
To: OE-core <openembedded-core@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: All new features advertised in the Nanbield release notes?
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 20:44:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189811

Dear OE-core contributors,

I've reviewed all the commits specific to the Nanbield branch and came 
up with this draft or the release and migration notes for this upcoming 
release:

  * https://docs.yoctoproject.org/next/migration-guides/migration-4.3.html
  * https://docs.yoctoproject.org/next/migration-guides/release-notes-4.3.html

If you made a contribution that is featured in the new release, it would 
be great if you could check whether it's advertised in the release notes 
with sufficient detail. I'm pretty sure some noteworthy changes didn't 
catch my attention.

In particular, I'm pretty sure that the runqemu changes should be 
properly summarized, as well at the CVE management ones.

This way, new users will be aware of your new feature(s)!

Of course, I'm also interested in reviews of the text. Some sections are 
still empty, but some of them will be filled by our usual scripts when 
the release is ready. Some of them are also empty because I haven't 
found any noteworthy changes yet. The latter will be removed if they 
should indeed be empty.

And don't hesitate to send patches against the yocto-docs "master-next" 
branch!
Thanks in advance
Cheers
Michael.


-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


