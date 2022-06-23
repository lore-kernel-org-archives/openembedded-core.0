Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBDBC433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 16:41:16 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.34.1656002466186524024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 09:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FEMTnkGs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8B3651C0004;
	Thu, 23 Jun 2022 16:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656002464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LOqyJNM2FdlA6ikoyOdV3PwTq5T997odXyGP+kxH3KQ=;
	b=FEMTnkGsup16XZcwnfBIwvpsq27LsCO0bilzmqIhcyRXgm6DHpehp8IFVDeHfTbf2zMKRE
	Wm3eVJgPiFojH3kzRk2PRNNzXMc8/6SmMORQymb95ycLV9C+dwK7Qt+3wt2UJ58Cv1iTzj
	wEK1eRTSVe29deBd6vVNcwJhc/RcM/vcvsKs98hM0j9leAbuIecaF2LbYz3Bg07SLubKsu
	pVo44IjmvMP1NwQH8WxFaXskmWZUggcgICM+SZ41FOY6SK5jTsQLCw89Zer2ZJqkGBaJPj
	Ab7AYVjZD5GieKrIWw/7rxIPhXfGd5MwACwuAUZBNyWlxy5FhuU7X+QGAWUCSA==
Date: Thu, 23 Jun 2022 18:41:01 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Alexander Kanavin
 <alex@linutronix.de>
Subject: Re: [OE-core] [RFC PATCH 2/6] meta-ide-support: adjust to provide
 (e)SDK experience directly in a yocto build
Message-ID: <20220623184101.206540dd@booty>
In-Reply-To: 
 <CANNYZj-GAsOMpoqC6RWvrWnbNHS4+00d_wZtEWwwPH5-w0bu2Q@mail.gmail.com>
References: <20220622103312.1098389-1-alex@linutronix.de>
	<20220622103312.1098389-3-alex@linutronix.de>
	<20220623120337.28f9cb12@booty>
	<CANNYZj-GAsOMpoqC6RWvrWnbNHS4+00d_wZtEWwwPH5-w0bu2Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 16:41:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167276

Hi Alex,

On Thu, 23 Jun 2022 16:52:55 +0200
Alexander Kanavin <alex.kanavin@gmail.com> wrote:

> Thanks Luca, this was not meant for merging (RFC), but it helps to see
> the issues upfront.

Sure, however Richard asked me to test this on the autobuilders.

Cheers.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

