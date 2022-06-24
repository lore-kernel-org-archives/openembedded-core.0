Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7962C43334
	for <webhook@archiver.kernel.org>; Fri, 24 Jun 2022 10:31:06 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web08.6096.1656066659933970687
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jun 2022 03:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E2JpZfrp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9A7E560006;
	Fri, 24 Jun 2022 10:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656066658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bh7DO1UK0P3o3y3nVfmOdntkCImp9DpUqmZk5rCQe2s=;
	b=E2JpZfrp7rCBH9vpKehGVPldTqPdo7lMKGZ2OAMKNQh/58wTPe1KO/4gmGXv0yv5/KVk22
	RS5AKoXmIuVqCsyO4y3UsI7l01E98Uv/4WHhgP19sA/7lOft2lXawvQftcVSqmfDdRTH6r
	cszK9M4iRK7lZMBKOEsmm6YsTpqqZHPlNf5Bna2o5l5EMtrDgbsR8/Zzh6LL2oys1FJFmn
	xLeAQti4GTCt8w2PRbItNt49me8+AiQ7v03KHcai8W+xgF1zhs/LnYqiiXVOOLJGkCB2PM
	z8TbQEP8iNsQ5Z7NzyqVWfoJv8PXIIZ2AaEeu44snb4olJ7MNRV2gwxbSGKTMA==
Date: Fri, 24 Jun 2022 12:30:54 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "niko.mauno@vaisala.com via lists.openembedded.org"
 <niko.mauno=vaisala.com@lists.openembedded.org>
Cc: niko.mauno@vaisala.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/3] strace: Drop redundant oe_runmake
 parameter
Message-ID: <20220624123054.0f8ee472@booty>
In-Reply-To: <d12df769-ced9-c31d-e3fb-e07858c852a1@vaisala.com>
References: <20220622191615.10168-1-niko.mauno@vaisala.com>
	<20220622191615.10168-2-niko.mauno@vaisala.com>
	<20220623113024.5a49c120@booty>
	<d12df769-ced9-c31d-e3fb-e07858c852a1@vaisala.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jun 2022 10:31:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167286

Hi Niko,

On Thu, 23 Jun 2022 19:53:58 +0300
"niko.mauno@vaisala.com via lists.openembedded.org"
<niko.mauno=vaisala.com@lists.openembedded.org> wrote:

> On 6/23/22 12:30, Luca Ceresoli via lists.openembedded.org wrote:
> > Unfortunately this patch does not apply as strace has been bumped to
> > 5.18 by a recent commit. Could you send a v2 series with this updated
> > please?  
> 
> Hi Luca, new v2 series sent with updated strace version: 
> https://patchwork.yoctoproject.org/project/oe-core/list/?series=5032

Thank you. Yesterday I had already picked patches 1 and 3 for testing
on the autobuilders and all builds succeeded. I'm taking your v2 for my
next testing run today.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

