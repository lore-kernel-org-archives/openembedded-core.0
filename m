Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DFD4C27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 07:58:14 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.5995.1692863886043198365
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 00:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZUxYoYux;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CD24E000B;
	Thu, 24 Aug 2023 07:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692863883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2or30nqCUZDHc8iIgW2qqB5hU238VmunyiE8fe5JMN8=;
	b=ZUxYoYux1egKLSUlLQcC+SOqJ0jQ7bSj+eBOBuWzVJLeZ8dnwhYqvPJkGbSCV8ccLmuToh
	eHjTb6Ort+ntlbb88RCENAU2ugh4S9GHu6Pf/aKtD0iXSNVuK9zb0zC3+QR4LRqxK+DHGm
	UDuxwRAwivi+Ok0FWkqzUkuLFIXgy5ADEaVDMPTuTWkE+EGLhjl1+y+maPksO8Oep5yY+0
	RB6igDtrpbDJe+s+s+9YyOmf2xxHzN63C2jMbJXtgVzVzWkDYjLiNywv1EzyqIRBG1w3nj
	R4i/tAT1t3+pgsPuyPoqk+6EAPkJA+kxTay1M9S16cuYVb8UhR9E59t4Rw46Eg==
Date: Thu, 24 Aug 2023 09:58:01 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Adrian Freihofer" <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Adrian Freihofer
 <adrian.freihofer@siemens.com>
Subject: Re: [OE-core] [PATCH v2 00/13] devtool ide plugin
Message-ID: <20230824095801.5a3ca2f4@booty>
In-Reply-To: <20230822192300.3235896-1-adrian.freihofer@siemens.com>
References: <20230822192300.3235896-1-adrian.freihofer@siemens.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 07:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186644

Hello Adrian,

On Tue, 22 Aug 2023 21:20:06 +0200
"Adrian Freihofer" <adrian.freihofer@gmail.com> wrote:

> Changes in comparison to v1:
> - Replace the .vscode config commit by something wich can be merged
> - Improve the commit messages
> - Add missing signed off
> 
> 
> 
> According to https://www.yoctoproject.org/community/yocto-project-engineering-request-for-quotation/
> one of the proposed areas for development of the Yocto project is "VSCode IDE Integration - New developer tooling".
> One aspect of this larger topic is helping application developers configure the IDE to work on a recipe's source code using Yocto's eSDK. This patchset provides a new devtool plugin (devtool ide) that does this fully automatically for recipes inheriting the cmake or the meson bbclass. Support for more programming languages and build tools may be added in the future.

Testing with this series showed some errors on the autobuilders in the
devtool.DevtoolIdeTests.test_devtool_ide_recipe_* tests:

FileNotFoundError: [Errno 2] No such file or directory: '/tmp/devtoolqa4gzuj7fk/.vscode/tasks.json'

Some logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1954/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5592/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5668/steps/14/logs/stdio

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

