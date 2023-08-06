Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7478EC0015E
	for <webhook@archiver.kernel.org>; Sun,  6 Aug 2023 13:22:26 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.10977.1691328136035462494
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Aug 2023 06:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LR0hHOVy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D77BD40002;
	Sun,  6 Aug 2023 13:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691328134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZO0ihgufCuyMR4AMJFtQZ0c3xM1oVsZ2KCEZQzdGC8A=;
	b=LR0hHOVyI9jCYzihbHo38WFuetAyHDTCY6Zoh5bIehlpDz6NOw8jNFVW44hpO7P1FTodwc
	SWio6zbdK27+gaSZ5LrxeoIOp2xQ7iM92j6Aoyr+L0J+tkIaPliL/wvh0T8m3XNHM7LEl7
	XWU6oHAa/bDdsYfn9Hlf8YG+I/jxXZaRQei66rsHpsHFj2ugUcKrSk7ZTFhzK2ZzdDgN1n
	3XJwLIbX/enBo59brQsDfSJBYzNb82dH8upOl2jxIczbPEsOod2LQuvCBXsFJWzHUUmG0P
	67XK0zZRmucvs8Gsbo5hLzrw4Ms9jUyohsdAWXZJzgNYjpd9yrvbT8OwqpMoog==
Date: Sun, 6 Aug 2023 15:22:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Subject: Re: [OE-core] [PATCH v8] systemd: update to v254
Message-ID: <20230806132213bed8666e@mail.local>
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230802231615.2106089-1-luca.boccassi@gmail.com>
 <202308061238184bdb334c@mail.local>
 <CAMw=ZnQZ0ZJGjm5DCMza2dfF+xhpAoaPbgeMvJre6NM_qNd6RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMw=ZnQZ0ZJGjm5DCMza2dfF+xhpAoaPbgeMvJre6NM_qNd6RQ@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 13:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185567

On 06/08/2023 14:15:27+0100, Luca Bocassi wrote:
> Where does that objcopy command come from? It looks awfully like it is
> hard-coding VMAs? That cannot possibly work reliably, the actual VMAs
> have to be calculated based on the components being added to the PE.
> I'd recommend to use 'ukify' as that makes it much easier, and
> actually we have an intern working to add a bbclass for that just now.
> But it's not needed, you can do the calculations by hand too, dracut
> used to do something similar and was fixed some months ago iirc.

This is from do_prepare_partition in scripts/lib/wic/plugins/source/bootimg-efi.py


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

