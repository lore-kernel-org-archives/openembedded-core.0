Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FFAC43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 07:40:47 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.4822.1655970040717538885
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 00:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=O+Mu+KUk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7D05A6000B;
	Thu, 23 Jun 2022 07:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655970039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P27hKumHQch/9Z6Kpvy+zCRNqVwKMfQXOD0thS4nmL0=;
	b=O+Mu+KUk7O0/Yqa+23LWj2UwzOQrERqNnAEl6ysdOFdpkn09UmRwWeWUnqSKk3C6UMNEOG
	R+VSOsxqxQNYK+P/L/C6laqtgGaW+xWjo5qG7SO9Zr9PB3Hr531hm1FrLh/pvGZhHtj1+k
	Ff+J4QL6PgMZYypItaW4YF041e5SiMCGO3MYEqXlDOVyUGVd8ijNTHbki41AbvgTFEH9sH
	jxL/Y15GbdOXgRI93Ot9owiyId+iVhbb7IQiGxO21Hv6MiZTVAxxslf3PaGpKm/s8NYy06
	YWb0/X2lJU/uLxJplsKPalTD7H+maYfB+EN9N8CAmqDOSpeUwj+2mR5SbKGFuA==
Date: Thu, 23 Jun 2022 09:40:37 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Markus Volk" <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH 1/2] llvm: make LLVM_HAVE_OPT_VIEWER_MODULES
 optional
Message-ID: <20220623094037.2204a89a@booty>
In-Reply-To: <e74c83db-d4fd-8696-d00b-b19c19f9b42e@t-online.de>
References: <20220622173251.478588-1-f_l_k@t-online.de>
	<20220622224440.658ff65c@booty>
	<e74c83db-d4fd-8696-d00b-b19c19f9b42e@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 07:40:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167261

Hi Markus,

On Wed, 22 Jun 2022 23:03:47 +0200
"Markus Volk" <f_l_k@t-online.de> wrote:

> Hi Luca,
> 
> your commit message is way better than mine.
> 
> One suggestion on your patch. I guess to be working on the target it 
> would be needed to add python3-pygment and python3-pyyaml as runtime 
> dependencies as well.
> 
> PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=OFF -DPY_YAML_FOUND=OFF,python3-pygments python3-pyyaml,python3-pygments python3-pyyaml"

Good catch. So if you are OK I will take care of this, send v2, test it
on the autobuilder where it did fail and if there is no surprise send it
to Richard.


-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

