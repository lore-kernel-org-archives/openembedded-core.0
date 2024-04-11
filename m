Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD48CD1284
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 09:21:35 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.13252.1712827286782899433
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 02:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fyKsApg3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AEF8940006;
	Thu, 11 Apr 2024 09:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712827285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ny2y5ETO7gLdUKIP+kew9+AHwj4w0PMU+fdZeZ3R9go=;
	b=fyKsApg3a+DyEGe6vAlbFwF0LClzVWU/m58moPr6kOxdlnWD5XSx4MbTI7+mhj8csZ2YtX
	WETLtkrw9B3PXG0/1cj3dMrdkhI9ABqtYp4tqHrleDX7Si250lqzISc3sx2x7cQAOkp7hD
	5PzA+tmuHIGou3WFLPQKwR7C5CP4DMNrjRaCf6jLIMHs63oNeps7WLRruudwbPyW60X8QD
	frRC2uPcsbGT8UBu6dcGRemhjWos0ocTAH8Mz0mw8dPsjDGe/3/gdpc8AoG8/xmOZ2lbVp
	uU3J3lQj7EVO98Al9r5s1c57Zni1rsBuSmuwISrn15mFgs091SAGeq4b+92aLA==
Message-ID: <7313c51e-c87c-4d15-9623-f549196183b1@bootlin.com>
Date: Thu, 11 Apr 2024 11:21:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Paul Eggleton <bluelightning@bluelightning.org>
Content-Language: en-US
To: OE-core <openembedded-core@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Review of 5.0 release notes
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 09:21:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198122

Greetings

For your information, here are the release and migration notes that we 
have gathered for 5.0 so far:
https://docs.yoctoproject.org/next/migration-guides/release-5.0.html

Your reviews are welcome, in particular if you contributed a change or 
new feature during the last development cycle. Note that the detailed 
recipe version updates will be added when the release is actually finalized.

Patches against yocto-docs "master-next" are most welcome, but I can 
also take text descriptions of the changes you'd like to see.
https://git.yoctoproject.org/yocto-docs/log/?h=master-next

Thanks in advance :)
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


