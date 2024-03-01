Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF77C5478C
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 18:34:15 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.31598.1709318054809989753
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 10:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=npLIvtop;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79D97C0004;
	Fri,  1 Mar 2024 18:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709318052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kzmR4iZ5GJ7yizsxOeDGLJOHScVpAWcW06T03XRXUsk=;
	b=npLIvtopXtTKSrXpOiZtmr5IxmAndqtAw6rR4zFyyprDN2m+zwQUu97PbtbmG9rZC8czzG
	aB1pASAELF8eOv0+O7em21jvEcOOS1+URVvqyuxE9d7jyMO5xEtfTh7KNxB53sy04ZHtFq
	/lBfRfNlkOcrUMN56B7Ah9RKzlhKOiDEPBGM4Rm2j2ZglQcB6PQaWSYOAMt2LWWjwIOgbo
	QxWnykZv3KK0Cao6ebAyylLOoq3QZOQSMJlt55XkMkhbWqGULggZsgKUlQqZfgya2PwFlF
	JhHY+yddW1KUYd83aaHsgExJ5YYwJPZer5wVJhcj5VRnIYW9FNjmbe/uPFz5fg==
Message-ID: <1ebfc609-cce2-4bcd-b984-ace1cca1162c@bootlin.com>
Date: Fri, 1 Mar 2024 19:34:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Language: en-US
To: Joshua Watt <JPEWhacker@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Easy way to talk to hashserv or prserv?
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 18:34:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196464

Hi Joshua and all,

I'm going to test changes to the prserv server, to implement 
"passthrough" to another server.

I can make tests by checking the impact of my changes on the build 
results, like checking the revision of generated packages. However, 
would there be an easy way to make a test connection to a server based 
on the bb.asyncrpc.AsyncServer class, such as hashserv or prserv?

Feeling lucky, I tried with a plain "telnet":

telnet 0.0.0.0 8585
Trying 0.0.0.0...
Connected to 0.0.0.0.
Escape character is '^]'.
get-pr ethtool-6.7-r0
Connection closed by foreign host.

The request doesn't look that bad, as the server doesn't complain (in 
the logs) but I don't get the return value.

So, any tip for talking to a server from a terminal, or do I need a 
proper client written in Python?
Cheers
Michael.



-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


