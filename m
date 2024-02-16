Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F18C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 07:38:48 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.13953.1708069126141884073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 23:38:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lotiJesU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6F5E240004;
	Fri, 16 Feb 2024 07:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708069124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7DpGcQ6czJkR1BwRUUYKrSMohhxUPrk3ZcQpqJoS5F4=;
	b=lotiJesUwsJtRk9xI6LA2EaUsz1q31hSGw0lPKrpepG5HcJ/nlwg3V77jPz6x8xASCGX09
	Ct/TMsS5OVOuGiHcuYfkqpXFOgDOYxicnbWU2FrcX84BrfeuWfiRf/Xs/tPVvlwMCnNwz6
	CEo0W6X1wFME4u321qwLxi4rYhchkW7l5eWtNWBEQIT1aXKZ1HpIY41n0OlLQ28ZCUTBSN
	LBX2serbFWydJZStpgjjWswR1dKrwjylw0NTX9Wlkt5pJADyqYjZ4pH3OByaQr/95dHjCZ
	UL8o11tp5BuQMiV8r2CguIEgDmw9/riMXEdMWduj69Imh8pyZaDYCdUevoeMtQ==
Message-ID: <5068d266-0b6f-44fc-a074-dc4d35cdc087@bootlin.com>
Date: Fri, 16 Feb 2024 08:38:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Patchtest results for [OE-core][PATCH 1/2] patchtest: Fix grammar
 in log output
Content-Language: en-US
To: Patchtest <patchtest@automation.yoctoproject.org>,
 Trevor Gamblin <tgamblin@baylibre.com>
References: <0101018dae96eaa2-76e3c1d6-04e4-4a08-b782-edfd218350c6-000000@us-west-2.amazonses.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <0101018dae96eaa2-76e3c1d6-04e4-4a08-b782-edfd218350c6-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 07:38:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195739


On 2/15/24 at 22:05, Patchtest wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/1-2-patchtest-Fix-grammar-in-log-output.patch
>
> FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)

Brilliant! Patchtest is now reaching self-awareness :)
Cheers
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


