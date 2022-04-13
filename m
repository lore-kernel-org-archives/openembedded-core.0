Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C92C38A2E
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:07 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.4213.1649842167908215889
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 02:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ThOOn8JC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EDECC240006;
	Wed, 13 Apr 2022 09:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1649842166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SRxtEJE8LwefxDYJp6hIH7eNJp4bIWy8Q4g48sBaoKE=;
	b=ThOOn8JClf5cFH2HkG4xaNmx1P5HDAErdToNtClc0J2M5DolF43vfJFcpY0y1LPlBgnq57
	MTYENcwgIm+PycsJUrBvCDnQBHpggM4Lli8+UGwIZBnl5o1D8VoP+Mdt8HZa0+dcSkPyFV
	Qd4xuriErxyda4HPebZppbewwuvgBPlsdBk93LGl7zbG8/o6W9RPoR0ZjhhiUT6t9Do37v
	ZzD5EF6tFUPLbNAvVAQ0CATmEPvpago62i35iv/p2q4qgiSn9Xedo4GtRyM9cztTAyxph4
	k6mg1Qc/gfW6sFAXajAzoj/nqyrSIQwi8ks8qGIojadyVkETqLbh1ynl4YHSDg==
Date: Wed, 13 Apr 2022 11:29:23 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Alex Kiernan" <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alex Kiernan <alexk@zuma.ai>
Subject: Re: [OE-core] [meta-oe][PATCH] kernel: Delete unused
 KERNEL_LOCALVERSION variable
Message-ID: <20220413112923.0106c0bb@melee>
In-Reply-To: <20220412130818.26000-1-alexk@zuma.ai>
References: <20220412130818.26000-1-alexk@zuma.ai>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164309

Hello Alex,

Il giorno Tue, 12 Apr 2022 14:08:18 +0100
"Alex Kiernan" <alex.kiernan@gmail.com> ha scritto:

> This has been unused since:
> 
>   commit fb61dc1430f81ae2ee59766ffab8404fd79ff1b1
>   Author: Richard Purdie <richard@openedhand.com>
>   Date:   Mon Jan 8 21:05:18 2007 +0000
> 
>       kernel.bbclass: Drop KERNEL_RELEASE variable
> 
>       git-svn-id: https://svn.o-hand.com/repos/poky/trunk@1123
> 311d38ba-8fff-0310-9ca6-ca027cbcb966
> 
> Signed-off-by: Alex Kiernan <alexk@zuma.ai>

This patch has [meta-oe] in the subject line but it is indeed for
oe-core. No need to resend it, I've taken it for autobuilders testing
already, however this is something you should possibly fix in future
patches.

The same applies to the 8-patch series you sent a few minutes earlier.

Best regards
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

