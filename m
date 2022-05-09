Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE4DC433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 21:47:18 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.1541.1652132827424779623
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 14:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=o6POFQVJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4E682E0003;
	Mon,  9 May 2022 21:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1652132825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VtFxyBYFeB/OctzwT2iwU3Y5ulDEhzKuNlN1TQDP2MQ=;
	b=o6POFQVJoHjtmjd2doB/4F6MyYDorUA+E4wx9Z72ajAabFS8ZUnLWt1UoYdte0bZY5eaoD
	MZWaGtdl0yqUt9C7ON1zGRAT0U3VvVt3ouokKdd9Tr+MTq1lu2iGEZ41KzEL7F0+Nc562/
	0ly6/SkYILgga87a8xbpJkJP6NjQgBtJjT2CGg0Q0zmjq4POgUFyZdEfj5FbvOAuXW5NnT
	T3odwPAXPNtqiv1AupEt4NYCE3wCaivTJRRMuhDS1xykxryRS42/oh61fpZBpsj1y2HMhR
	ae2A6A54kHGQ0uNJ3to1my/V8F90urbnh0Aj9VFiq550fDDfTCyW7qPCvVRGbQ==
Date: Mon, 9 May 2022 23:46:59 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Stefan Herbrechtsmeier" <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: openembedded-core@lists.openembedded.org, Lukas Funke
 <lukas.funke@weidmueller.com>, Stefan Herbrechtsmeier
 <stefan.herbrechtsmeier@weidmueller.com>
Subject: Re: [OE-core] [PATCH 1/5] recipetool-create: add ensure_native_cmd
 function
Message-ID: <20220509234659.74b95a2c@melee>
In-Reply-To: 
 <20220506065917.1375-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20220506065917.1375-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 21:47:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165406

Hello Stefan,

Il giorno Fri,  6 May 2022 08:59:13 +0200
"Stefan Herbrechtsmeier" <stefan.herbrechtsmeier-oss@weidmueller.com>
ha scritto:

> From: Lukas Funke <lukas.funke@weidmueller.com>
> 
> Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
> Signed-off-by: Stefan Herbrechtsmeier
> <stefan.herbrechtsmeier@weidmueller.com>

Testing builds with your series trigger many build failures related to
recipetool. Can you check these logs?

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3557/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3506/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/3527/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3566/steps/14/logs/stdio



-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

