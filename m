Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B81C4167B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 09:43:34 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.46267.1699004611258646720
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 02:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OhPtNXNj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 544DB40008
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 09:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699004609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/jnkIUFdFUqzOPh4lhUAvN6Ws+UwMsrkFFrk/mIcL4I=;
	b=OhPtNXNjbXv9HvAgbBAQJUd7hZ2CC/Sbz3/iLdti9b/XGgBGwa8QdbExndyyhSORjngFeW
	rvxuyUJ3X41sIVxLEZBgSjvPWj5rWYsPMrsn46fRqzao9JEru00GSscJKGP9uvnHnml3p/
	6JxM3lr7VCwvQqGgAUdP/3aRPBDM6NSgqNg+4sN0t11L0bfXMVFygNeIYNsdnuF8zG3AZq
	47JJjdy54Nf8UTyOienY39/4JNT+29J3/JOH1/cPaKqUl8dmjDh9GuDkD1tON2OXagtS9f
	+2nPfw2QkKK+aMZ+t2ueeUwDbb5p0SrVjOIUeX2v9hEkPz2yOAH7/Yd5k2JqNQ==
Message-ID: <b42f4bae-5096-4a99-ac85-8750396580b8@bootlin.com>
Date: Fri, 3 Nov 2023 10:43:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: OE-core <openembedded-core@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Meaning of the name of the "cml1" class?
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 09:43:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190145

Greetings

I'd like to explain the meaning of the name of the "cml1" class in the 
documentation. This would help to remember this name.
 From what I've seen, it has this name since the beginning of the git 
history.

Do those of you who are veterans remember what the name originally meant?
Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


