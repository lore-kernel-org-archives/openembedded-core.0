Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25EA9C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 08:04:59 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.68562.1705910695319893415
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 00:04:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pvr5zIyU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1ACBE1C0002;
	Mon, 22 Jan 2024 08:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705910693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uZxs2Lb1E0JbodaC69yV9ObvHx1WjbbILVVwncuFI0c=;
	b=pvr5zIyU6wQRv/w94oH5Hm7Nm9iQ7Uog5DtHmKlesm1CmVSompqb6Sc+u8DevyUAYkoLYd
	Hr0XDxGqmlqVsBKaGvsmukojDHvXCiqsq/WIu3zndHaqzZNAF6Hr7zwS2lRnkxiUIf5dV1
	TSxmvCYGq1PWHsYDlF9XexArt7vUbq/IjoD0CyBfkHv3kPxCVES0f2QGII6F1j6dD6goUq
	5AaZX0WSvDtPmYpOXGiyna3eztHTBdvobm4D8Pu/4AHz+af1aFt4O0bixc43nMd3XegqSW
	6cPLPUYC8Lq6YHkOIQErrkDEE+W3O5iuKbBt/8JuJAWtndj5s3t6q1ir4kKLqA==
Date: Mon, 22 Jan 2024 09:04:52 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 1/3] systemd: upgrade to 255.1
Message-ID: <20240122080452ba0f7ee7@mail.local>
References: <20231227042036.2376255-1-Qi.Chen@windriver.com>
 <2968be9a-c13d-5d98-e1be-d291d0b5b008@windriver.com>
 <2024011918132485b9ba7f@mail.local>
 <202401191814434c0685e2@mail.local>
 <ff3ec5f6-13fc-0468-9a07-09c3226c300b@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff3ec5f6-13fc-0468-9a07-09c3226c300b@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 08:04:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194120

On 22/01/2024 12:38:15+0800, ChenQi wrote:
> On 1/20/24 02:14, Alexandre Belloni wrote:
> > On 19/01/2024 19:13:25+0100, Alexandre Belloni wrote:
> > > On 19/01/2024 11:09:20+0800, Chen Qi via lists.openembedded.org wrote:
> > > > What's the status of this patch series?
> > > > Is there any issue or concern that I missed?
> > > I'm glad you asked, I got this today:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/8466/steps/26/logs/warnings
> > and I know you sent a patch for this but it didn't make it yet.
> 
> I just double checked with the following settings from the "Sysvinit with
> systemd" entry in config.json, there's no warning.
> 
> DISTRO_FEATURES:append = ' systemd usrmerge'
> ROOT_HOME = '/root'
> VIRTUAL-RUNTIME_init_manager = 'sysvinit'
> 
> So I further checked the build's settings.
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/8466
> 
> In the second step, "Fetch yocto-autobuilder-helper", I can see the
> following logs:
> 
> HEAD is now at ebb7e65 config.json: Fix syntax errors
> 
> So the build is not using the latest repo. The latest commit is:

This is not correct, it was using the latest commit at the time, the
patch was applied after my email.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

