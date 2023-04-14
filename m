Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE065C77B70
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 07:44:59 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.3792.1681458297173074173
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Apr 2023 00:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ol1sZQ8O;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E6D89240003;
	Fri, 14 Apr 2023 07:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681458294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nrLgpdFmiWVn9XBkvPvmDmkC8Nu1MqoM3KoWoKh0fag=;
	b=Ol1sZQ8OkPdcIpgpphylR+V/cgUpc1R3VimOO0rFdHnKPsBhJdAAZgRj1+cMMVJEQSwP4z
	nhmBSYHYy0lBqVqnaP2GBrsXe2u5b1/A3mvkA60E6CenI+gVN3QgAQ2mkomO6ogelnktis
	Ad9l8rzmrutdsGHlowVuC2CjhUfB5VefPZzx6RfBLGY8fK8gcwa7wZp9jPGMYGyrRIWHEo
	Y9+ueuvN4DIgO1MsIBqOrjKmhdKmFRQ9oEvsMD3s1LfPdgkDivf3qBIT6eCTb7u9q7ouYp
	EkBfZ3iEB8RoZUu+fNe4caDgyJ8j9ynpjjbXKCm3kSuadGRq8hDZG9Dp9Sgqfg==
Date: Fri, 14 Apr 2023 09:44:52 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Khem Raj" <raj.khem@gmail.com>, Richard Purdie
 <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RFT][PATCH 1/3] autoconf: Test 2.72c
Message-ID: <20230414094452.67b5dda4@booty>
In-Reply-To: <20230412214102.551761-1-raj.khem@gmail.com>
References: <20230412214102.551761-1-raj.khem@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 07:44:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179992

Hello Khem, Richard,

On Wed, 12 Apr 2023 14:41:00 -0700
"Khem Raj" <raj.khem@gmail.com> wrote:

> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

I ran a-full builds on the exact same tree with or without this series,
and the build with this series fails do_compile of two autotools
packages in qemux86-64-x32:

The successful build (without this series):
https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/6846/steps/12/logs/stdio

The failing build (same code + this series):
https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/6849/steps/12/logs/stdio

No other failures at the moment, but the qemux86-world-alt is still in
progress.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

