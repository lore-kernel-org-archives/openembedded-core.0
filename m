Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28EF9C6379F
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 16:59:41 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.16221.1677171578478511336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 08:59:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kaVTCn5+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 020861C0004;
	Thu, 23 Feb 2023 16:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677171576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W3TI+DxPCmOhw2fI3Tst4rD8gyiCoiuBuytzsbv6AKU=;
	b=kaVTCn5+lP7IB7gTSXmok2nLDUFwKsvxkBQNPmfT9l3GMqdn6uQ4rhrmlJh46IL49FjCis
	wKxwrqZO01VVRI8yOlrskNVTYYPafOBNnJiEazRN+S6jmDXUzzYUMLTpvECHRmQisRIbl2
	fY/+2STkxI0BFOdZjlJW7Vjjx6j/ST/S+FnGVrY3g2BL+4g/pGtYJDAzUuO2+CFWXOBQ6Z
	APxFJ5Iwc4GwCsyYa8f+Gsr2QGBdYLM0Qsiq1UsRaL+77Ih1OQssm5vHdaKNZ256ZAhnp3
	QGvczFpcVpA9QxkraN7CFdRmm22VuMxDX7oRt8T44mAvQsFCwlEV2c85gPK4NA==
Message-ID: <8a4852e0-7d49-dfc3-7f41-9bf6c0c28016@bootlin.com>
Date: Thu, 23 Feb 2023 17:59:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Language: en-US
To: OE-core <openembedded-core@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [DISTRO|MACHINE]_FEATURES_BACKFILL_CONSIDERED: confusing variable
 names?
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 16:59:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177614

Greetings

Anybody else finding the DISTRO_FEATURES_BACKFILL_CONSIDERED and 
MACHINE_FEATURES_BACKFILL_CONSIDERED variable names confusing?

According to the documentation about "feature backfilling" 
(https://docs.yoctoproject.org/ref-manual/features.html#ref-features-backfill), 
these variables allow to exclude some features from being backfilled.

I'm not a native English speaker, but for me, "considered" carries the 
intention to include a feature, not to exclude one.

Shouldn't we call these variables DISTRO_FEATURES_BACKFILL_EXCLUDED and 
MACHINE_FEATURES_BACKFILL_EXCLUDED instead ?

Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


