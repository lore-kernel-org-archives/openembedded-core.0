Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A58C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 08:08:17 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.2933.1682496489491314427
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 01:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dBhap2PC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0B21560002;
	Wed, 26 Apr 2023 08:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682496487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=waY/qTHpH3ryuKTsnn/1R/lfT1ra10Vc//uv/aUETe4=;
	b=dBhap2PC3l8n6N8lXJumzcCKuS7JVxtAgX9BnKPLeTupRFJk4qa7Z8kR7itLlH1hzbXvLD
	kFFIzCsoBlJt4c472KvwUFq8CGcptW3ohaVsp/093a4iD06R5MyhcznbCYAEIz83hldfYF
	JUFtWNbeRabkXt0dcMiCb5/7J6ZX44ZrMKWtIa+Fc9n3VLDa5diKNpDN1cHbGEATBmu3mZ
	EKvhl4YAM0xsCIS1/Zp7Y07d68WLI4mJtgtc96R+7a7QBYQeccZljVzVDmHcej5SK73Cog
	HkBm6gZcK8v4recmqPe5UHau3rSTOjfe2Kbr/wakSqcB6XOBmFTvwO45hzePUQ==
Date: Wed, 26 Apr 2023 10:08:05 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Tim Orling" <ticotimo@gmail.com>
Cc: dev@loewen-email.de, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] python3targetconfig.bbclass: Extend
 PYTHONPATH instead of overwriting
Message-ID: <20230426100805.4cd812fb@booty>
In-Reply-To: <CANx9H-Cb894ioJArCqsSXeskgc=GsxbB6VCHoZ+Lkq0T-VEnZg@mail.gmail.com>
References: <20230425091532.8086-1-dev@loewen-email.de>
	<CANx9H-Cb894ioJArCqsSXeskgc=GsxbB6VCHoZ+Lkq0T-VEnZg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 08:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180411

Hi Tim, Johannes,

On Tue, 25 Apr 2023 07:25:58 -0700
"Tim Orling" <ticotimo@gmail.com> wrote:

> On Tue, Apr 25, 2023 at 2:15 AM <dev@loewen-email.de> wrote:
> 
> > From: Johannes Schrimpf <dev@loewen-email.de>
> >
> > [YOCTO #15108] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=15108
> >
> > Since the latest change,  
> 
> 
> We should mention the commit where the change was made:
> https://git.openembedded.org/openembedded-core/commit/meta/classes-recipe/python3targetconfig.bbclass?id=c9617c03bceee54dc540318cada392799b137bd5

Good idea. I'm taking this patch for testing and adding a 'Fixes' tag.
No need to resend.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

