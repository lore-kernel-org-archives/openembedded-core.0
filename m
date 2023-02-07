Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7592C636D3
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 17:26:32 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.89691.1675790791911402549
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 09:26:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RTcu/3Bu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 303BC24000B;
	Tue,  7 Feb 2023 17:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675790789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QlgGSg6ElKo93urg9ejvbVHBx+jzVdzmBjEhahN1N9I=;
	b=RTcu/3Buun9yL7/Zangcg777FfA7hJhM7eSJyQiQMQcVtGlTXvZVwUQxGpNA0w96TVxbaJ
	tA5WlKqC5NlZj334iijfnmt4kE9lYhWrCA/qDEVnIiv8QTn22LeeLPETLfhFPluiDWl7X7
	QDYv4TZm3A33sLkBzYZq8XiVOj7qr8KHJBXZWc17o4ZksyE9xMC3cHFm9z0i228nfBkVJY
	wJMT1nawUEb+/hsnOiWanrDABMFO8mzQfxpvWumRibewzADKof35kGsvKW8a3LhN6o8Hqh
	3Izyz2UhAbXvejjLAKOKjI5iUEnCXLRQ2Z8GF9I0u2AcpIvUFtbZDfBuTRiBOA==
Date: Tue, 7 Feb 2023 18:26:27 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Yan Xin Kuan" <yanxk.fnst@fujitsu.com>
Cc: <openembedded-core@lists.openembedded.org>,
 <fnstml-fujitsuten@fujitsu.com>
Subject: Re: [OE-core] [meta-oe][PATCH V1] cpio: add ptest
Message-ID: <20230207182627.0ad409cc@booty>
In-Reply-To: <1667352933-9298-1-git-send-email-yanxk.fnst@fujitsu.com>
References: <1667352933-9298-1-git-send-email-yanxk.fnst@fujitsu.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 17:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176826

Hello Yan,

On Wed, 2 Nov 2022 09:35:33 +0800
        ^^^^^^^^^^

Not sure where this data comes from... :)

"Yan Xin Kuan" <yanxk.fnst@fujitsu.com> wrote:

> From: Yan <yanxk.fnst@fujitsu.com>
> 
> enable the ptest function for cpio.
> 
> cpio takes 1 second maybe less, so it is fast.
> 
> you will get ptest result like this:
> 
> PASS: symlink
> SKIP: symlink-bad-length
> ......
> 
> Signed-off-by: Yan <yanxk.fnst@fujitsu.com>

Autobuilder testing with this patch generated lots of warnings:

  WARNING: cpio-2.13-r0 do_package_qa: QA Issue: File
  /usr/lib/cpio/ptest/tests/atconfig in package cpio-ptest contains reference to TMPDIR

Here are a few logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/4375/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/6685/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/5526/steps/12/logs/stdio

More at:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4894

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

