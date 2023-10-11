Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06339CD6115
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 08:24:30 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.12013.1697012666550195318
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 01:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZR1UHmYq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 851FCE0002;
	Wed, 11 Oct 2023 08:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697012664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gl/6/SmXhcTuVtaTmkrVlosjdG4BCcOu++fP/DDvXOs=;
	b=ZR1UHmYqCjEQenNt07baqQMwXTVqvD9F0dbGNVrgoCiuXZ0EhmGggxtc/mmRGiDw55IquY
	rJYOQ6VMWlcd6NlhCeCtEoXkelwzSLROm9j/YPoJQY8dC9oj+cxHMBbktfziZM90hY0J1U
	bMYJeJLiEo6kUubb7/czP77vCFoIqQKNmnm5dk62WgkuF7D+NTTtz4Mrh1veVSeQBcOaap
	VdEzXzJd8Csmq+oXobxQj49xi9dCRGxAsJO1C9hVrTGlH2/+ZCX0Er2ISLTFvFM0qvs4KX
	ajtFdKyGjV6DwIbfKU5J4ZMmtCEysiHREX7+M90BVxu+dKl1bfg2eH6EFQrQuA==
Message-ID: <3a4f4400-d5fa-4564-8acc-8b74f7de07bf@bootlin.com>
Date: Wed, 11 Oct 2023 10:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH 0/2] Fix regression reporting for master-next
Content-Language: en-US
To: Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <178CB4FCD987BCAF.24994@lists.openembedded.org>
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <178CB4FCD987BCAF.24994@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 08:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188948

On 10/10/23 11:30, Alexis Lothoré via lists.openembedded.org wrote:
> With those two patches, I have been able to properly generate the
> regression report from [1] with the following command:

It looks like I forgot to paste the relevant command. Here it is, for
documentation purpose:
yocto_testresults_query.py regression-report
561c63e94710a755227357e90004aafa63ec9c7e 2994f51ffc4699970abed42d2e2a6452d04128cd

With 2994f51ffc4699970abed42d2e2a6452d04128cd being the SHA-1 of master-next
HEAD at time of sending this series. But the command may not work anymore
as-it-is, because master-next has likely been force-pushed since then

> [1] https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6025/steps/29/logs/stdio


-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


