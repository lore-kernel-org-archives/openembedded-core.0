Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2BFEE49A8
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 07:13:56 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.2991.1692688428843356313
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 00:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SjcX+NSn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE2421BF208;
	Tue, 22 Aug 2023 07:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692688426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y2+sP+wOncgBaeIEsbhh0ib977qqB0h7i6fS73DN0WU=;
	b=SjcX+NSn3JYXx5nc1F1nQr2uo8eQlrwVYLoNQY7Wc/zJ/vfm3d7PsZ0HPWk3FOnNUkFXA3
	TP3R3lxelNtKcQs45etKIOMiB+uSLwhjszzelkDNx2QYSs/z93X5utD5IfkqzEA2/Y4yHL
	UKUdTAQJAM5vAQRkCs+6PeCAeeoGvx39BJIRGLElkdy42PVX5HYT+ofkzGMj3IEKdLfNAl
	UfZ+eRQEqOqG7YGssOpdlg9Ypuuv1Rp7/FBaddDMs2iGbFWEo8kgw+VuxPkcGVaMZeW0Af
	pqzl9K8n6lyJmEW63ezNt//5uXEmYZalEW3B9rFBhs95OhqLQ3fbr4XcjiBB0Q==
Date: Tue, 22 Aug 2023 09:13:44 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 00/10] linux-yocto: consolidated pull request
Message-ID: <20230822091344.2301ed50@booty>
In-Reply-To: <cover.1692632563.git.bruce.ashfield@gmail.com>
References: <cover.1692632563.git.bruce.ashfield@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 07:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186494

Hello Bruce,

On Mon, 21 Aug 2023 11:44:35 -0400
"Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Richard,
> 
> While we track down the remaining 6.4 boot issues, here is the
> set of -stable and specific fixes that I've queued in my kernel
> testing tree.
> 
> It is possible that some of the 6.4-stable's have fixes for our
> boot issues, but I didn't see anything obvious.
> 
> In particular we have the -rt warning fix from PaulG and also
> a fixup on our isocpus patch.
> 
> Cheers,
> 
> Bruce

You're probably already aware of the build failure triggered by this
patch series:

  stdio: ERROR: linux-yocto-6.4.11+gitAUTOINC+d9483a24c9_9753b44979-r0 do_fetch: Fetcher failure: Unable to find revision d9483a24c9ee33b6e566baa5233cbd9feaeb5212 in branch yocto-6.4 even from upstream

This one is less visible:

  WARNING: linux-yocto-6.4.11+gitAUTOINC+d9483a24c9_9753b44979-r0 do_kernel_configcheck: [kernel config]: This BSP contains fragments with warnings:

  [INFO]: the following symbols were not found in the active configuration:
       - CONFIG_COMMON_CLK_NPCM8XX

https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/4440/steps/17/logs/stdio

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

