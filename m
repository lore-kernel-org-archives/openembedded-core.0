Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352D8C54E69
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 08:12:49 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.16289.1710490360738635963
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 01:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aFIBdI+D;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB1711BF208;
	Fri, 15 Mar 2024 08:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710490359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fdeT1uzPJhovV/kaetT2lZ33bLfPPg6UsHWqqivqhMM=;
	b=aFIBdI+DdhAnnuFvz/CJS/hqdV2LCeIaIc0hntGgx697C9aQhTiaQbexlzPZ51iD9g9hMZ
	kgCKXElhmPIT4Rm+iSLdXxWpkPwFZnFUJa4WqmhxDEcGjCWkT+9PPY4w+g2tzcjRzju2kt
	fUQ7g8e8RuGiBc99yydgBgqwR7O6Vd6bL1l6NISIjKs0bgHs/9p1otm+J/udmZ0h2KowLV
	w8IhUvlzDRBX/N4ZBo1qLuJJ6FAkONGcqM5h/5R8Y08OMCnBJEDTNpu4HyJgTHrqiUkJl/
	0wcDGLjTfiZ1/vWnUevLoSgPNxpI8FdXhow64GDBZzSAAo5VnDTNtR+NyhWmSw==
Message-ID: <f53c085e-3d24-42d3-ba62-e1c543311dd1@bootlin.com>
Date: Fri, 15 Mar 2024 09:12:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Language: en-US
To: OE-core <openembedded-core@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Call for contributions to the 5.0 release notes
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 08:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197128

Greetings,

If you contributed new features to the upcoming release, or if you are 
interested in figuring out what's new in 5.0, that would be great if you 
could help us by submitting bits of release notes about them too.

If you are familiar with the Sphinx / ReStructured Text format, you can 
directly send patches against the yocto-docs "master-next" branch 
(https://git.yoctoproject.org/yocto-docs/log/?h=master-next). However, 
I'm also happy to accept raw text as well and format it or even 
elaborate on it by myself.

We may also need proper documentation for the new features, not only 
release notes. I am thinking about documenting the new variables in 
ref-manual/variables.rst, for example.
Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


