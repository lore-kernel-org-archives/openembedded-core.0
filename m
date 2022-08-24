Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2861C32796
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 09:51:21 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.9087.1661334671995735551
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SKJMDYMK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C9D7D40007;
	Wed, 24 Aug 2022 09:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661334670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+SgSLT3uD65CktsHwSnZlnBOLbBU/YhO8uQNtFtFQgQ=;
	b=SKJMDYMKJT+ZgnSHlvDT9hR2oPe8k5Dgdqwb9XxsI7iinatLixl5mZgfA02whIX/6QKDX6
	SleYrtJ8kf/8TTMNe9MTTdKJqrbXeFomW0hl365ATuV/IYJQYOd4jeNUqBOJKiNOTFgbQB
	oN1VWtLZ2M+qCBU3MjbtQLBNn9yWGBXtdTxZ1su/TPhBtLZcqRyAi+Xb3Nm8x6Ipcbil10
	fIRnPFGm7QghNiC3F6TWWKnDD2LPybvdooj97tJOnBvw14S0yfnEi1yt85bDYzdbrBOgz9
	CPL1AEGH128iRNA+30uvOyTXJAk+PoORcMU9KHEXHAE2/Du+oBC00ZYCIp46vg==
Date: Wed, 24 Aug 2022 11:51:08 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Markus Volk" <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] connman: add PACKAGECONFIG to support iwd
Message-ID: <20220824115108.6eee852c@booty>
In-Reply-To: <UI34HR.PZNATSOSGVWO2@t-online.de>
References: <20220823163809.17214-1-f_l_k@t-online.de>
	<20220824105440.1cdf49a7@booty>
	<UI34HR.PZNATSOSGVWO2@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 09:51:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169807

Hello Markus,

On Wed, 24 Aug 2022 10:56:54 +0200
"Markus Volk" <f_l_k@t-online.de> wrote:

> Hello Luca,
> 
> Am Mi, 24. Aug 2022 um 10:54:40 +0200 schrieb Luca Ceresoli 
> <luca.ceresoli@bootlin.com>:
> > I would think iwd should be an rdepends, not an rrecommends. Any reson
> > for that? Or is it just an unintended extra ','?  
> 
> Only reason for this was the fact, that iwd is not in oe-core so it 
> felt wrong somehow to set it RDEPEND

I see, that's fine, but I wonder whether this should be clarified in a
comment. I'll be taking the patch for testing as is anyway.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

