Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB776C54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 16:55:46 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.93206.1673628941655504298
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 08:55:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ojPspOMv;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 12E5A240002;
	Fri, 13 Jan 2023 16:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673628939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mw91w3zYmrhzRvJfrMK95aHHHAk2RHkWJPlB8m7KjtU=;
	b=ojPspOMvqbOy3loeoQ8qVlt2b2kfrZ0dC3XAP3myTtJ7pC/N98cvMKAWIyS9t4v3tmQdy6
	IVAthSs6/KOMhVZL5AnkDohiJphV+IK6QCksotK8hgvnPh3VsRnsRN8sP9pECHMXirkTsx
	X3Ici/3Wm+jjWeK8up9SiJ6RzuWyAqyCnH5WfAjYDoQnjwFsJjPLZlNJv/m9bQCxuU0hW8
	hIaA0KVwwdl/nE/bHzorBL6uJiespx3AcqlHoRgYyE9hHUJsciw96HCkSS9/4hH4SnZYdU
	ctUfRfG3kIkePcIGqna4qbpnqE0JTOj17LRTfL7ZILxedLUOfZa6J2W1hDjcig==
Message-ID: <da703100-dd85-8ede-3a3d-f7e57d6a4ee7@bootlin.com>
Date: Fri, 13 Jan 2023 17:55:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: michael.opdenacker@bootlin.com
Content-Language: en-US
To: OE-core <openembedded-core@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Is rust-bin.bbclass still in use?
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 16:55:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175839

Greetings,

I can't find any use of the rust-bin class, neither in oe-core, nor in 
Poky, nor in meta-oe?

Is it still in use anywhere?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


