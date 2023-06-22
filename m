Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95258EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 13:55:47 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.11994.1687442141477986857
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 06:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iplWlaGV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: luca.ceresoli@bootlin.com)
X-GND-Sasl: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687442138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MywSZYWKuw5VxElSV9Wi7MPUUuv7H864QBIeuGYsHck=;
	b=iplWlaGVG/2OGmVGo61MF7mSzPe81sQhLvsRxS67sQnrCnDmyAoJ7pltX0lUekRUOKXxUf
	5YplHYqHBkwJuJjLyMdxPCraRomV01PDZyvzdm0DfLnDgeIFskvgmQ5zddE1TZ5OE/9SFK
	epawVpNQj2UhsFWN7c2zowb0cta4LJsrwPFbxhs+HUq862/1AvYWhlpadJYVNH9zEdbJJo
	qe9hkny4tHFZJ4Y+aorZ8NSBiy/zrDOjVzcM8J78UC7dEyMeErnXw1j8l3cI9PvPKX4TDt
	FiFcfRl2IJACDaqYkCCHfZ2irkuDwx7UMLoTbn/ViLZkJTizDEtY9d8tmKhz8g==
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 660A3C0006;
	Thu, 22 Jun 2023 13:55:38 +0000 (UTC)
Date: Thu, 22 Jun 2023 15:55:36 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Andrej Valek via lists.openembedded.org"
 <andrej.valek=siemens.com@lists.openembedded.org>
Cc: andrej.valek@siemens.com, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v7 0/3] CVE-check handling
Message-ID: <20230622155536.505adb2d@booty>
In-Reply-To: <66f1327de2d373002e866e0eb05f0f2e5e6bd05d.camel@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
	<20230622065914.37448-1-andrej.valek@siemens.com>
	<20230622144216.18783d4b@booty>
	<66f1327de2d373002e866e0eb05f0f2e5e6bd05d.camel@siemens.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 13:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183243

Hello Andrej,

On Thu, 22 Jun 2023 13:50:32 +0000
"Andrej Valek via lists.openembedded.org"
<andrej.valek=siemens.com@lists.openembedded.org> wrote:

> Hello Luca,
> 
> How can I reproduce it? I've executed "bitbake qemu -c create_spdx" but it
> didn't print any warning. Should I build an image?

I don't know how to reproduce _exactly_ the build environment of the
autobuilders, however the logs have some good hints (click the "stdio"
links in the page at the URL I provided). E.g. for the qemuarm64
builder it says:

Running '. ./oe-init-build-env; bitbake core-image-sato core-image-sato-sdk core-image-minimal core-image-minimal-dev core-image-sato:do_populate_sdk -k' ...
MACHINE = "qemuarm64"
DISTRO = "poky"
...and more settings you might want to put in your local.conf...

So you may try that.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

