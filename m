Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50F3C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 09:44:21 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.9040.1661334254416421169
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YLGKZJrf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3AF0FE0002;
	Wed, 24 Aug 2022 09:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661334252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CEz7qTrPHfhTfRNAnhhSrsjJgVYc4suzRhRYn9bXTEI=;
	b=YLGKZJrfxPecBAdfAo56peogD/uYjtqa9TrFSfESL6QD9q8V3kNe1t8/YhdujiYn7tm1/d
	W19oa8JAsjENW02zCacn8/A/T/jVFWbffnM8iq5fWa2OFadyxJhHUReN0sgA9W7e9YwYuM
	kqx6nfbqc1vq18W4vZtD61o06qwE3eJq/bl8oWmi0zMBsYYZ38uTbJOFI/eFH+oYBZrGTD
	FsBQnjYn2ubJKXLn3vYHIkhxREixnJe1COWzaspWjp9PHMP1OC2jFi4M4dAR+hzsP6VG0g
	utxzG77u1JvCAVInLE0+LqsIDcLJUPBM1Nvj6UtCSOoVstYXUn8E/QbyVa6NEw==
Date: Wed, 24 Aug 2022 11:44:10 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 4/7] enable _XOPEN_SOURCE on musl for wchar
 usage in curses
Message-ID: <20220824114410.4c9328aa@booty>
In-Reply-To: <20220824063443.1774094-4-raj.khem@gmail.com>
References: <20220824063443.1774094-1-raj.khem@gmail.com>
	<20220824063443.1774094-4-raj.khem@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 09:44:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169806

Hi Mhem,

On Tue, 23 Aug 2022 23:34:40 -0700
"Khem Raj" <raj.khem@gmail.com> wrote:

> This is defined for glibc automatically with _GNU_SOURCE but not for
> musl
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Missing 'pinentry: ' subject prefix. I added it when taking the patch
on my testing branch, no need to resend.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

