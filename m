Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42ABC25B78
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 21:50:06 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.2993.1716414600783952476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 14:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZsrytnRc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0961FF803;
	Wed, 22 May 2024 21:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716414599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/fcTqu4UG+jp3nE0CsSAxKKzSKlTuGyEgnq+JtzHofQ=;
	b=ZsrytnRcchmLWSusTU44cV4ihR/Hn9pG6ZOJRLALWrB0pCds5DwAVcydUpiUlaTvhloBnl
	aE5XaXwwP9wSOjqPLNOKIg6AUVfoR43/5mgH91jK4tgpXnpMBWKAQeTc/HI9F/OAuiN844
	y9dSM7UvkeRdY15I8s7FGumYqr/TaHfxgy6LBJ80PWTpT/Icx5EIDvPPhnI/puomQhw9XV
	u1sLv0HRNlSGRLsbAa0OaZxstegUTvp+Ebi4AiQwPjB0wCVNEXUGDkl1IDsSx1lpFGmwec
	90fyHaIAU3yiMzLyxr3sjMuMl5Lw7alCO2FEBgh/YxgZVCiWs735Ji6IqDPs+Q==
Date: Wed, 22 May 2024 23:49:58 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] gcc-runtime.inc: additionally remove
 libgomp.info-1 and libgomp.info-2
Message-ID: <202405222149588cf3ec42@mail.local>
References: <20240520175706.1840576-1-f_l_k@t-online.de>
 <20240522090622114b300c@mail.local>
 <7MPWDS.UJ5CKB2DU0XR2@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7MPWDS.UJ5CKB2DU0XR2@t-online.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 21:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199775

On 22/05/2024 23:42:07+0200, Markus Volk wrote:
> On Wed, May 22 2024 at 11:06:22 AM +02:00:00, Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> > this doesn't apply on master anymore, can you rebase?
> 
> Hi Alexandre,
> 
> probably this doesn't apply because Richard Purdie added a fix for this
> almost at the same time as I sent this patch.
> So I guess this can be ignored

Ack, I wasn't sure this was fixing the same issue, thanks!

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

