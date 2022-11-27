Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4E5C43217
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 18:42:44 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.98123.1669574559547438463
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 10:42:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nkfcWg46;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C4FD0100004;
	Sun, 27 Nov 2022 18:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669574557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NupYMUUUbvKQonYVLjZyglrlS7XMA9R6q7agcPRwq/M=;
	b=nkfcWg46EaruIP87r29BsevHRxYJy5dPDISk/3qhl2jGiqentElDNY7b8RYCHUjZqlVuI/
	/NB2K9tRqIc4FDa19wkMZsC4h18PHuTntaEzYpYWODTGKYXi79Zg8JpDsVCOIeKUJymN+/
	/SoVBIp3B1Xxr5dP6z815DjmpVAzqmJE5QzyxAJZ1VOHjKLpmLaQdOb7sXlD2QWS5ThphW
	Zq3bWswb/oVCZ7wJDNNYFWAirWa1CSem5LuR2N001RxPuYOHQ/PjHiIzRR4MvtpSipUIoW
	KeDCvPnmS0sk63qNv7mPwCZcxdQinplzUyVar3RMGW2HhZJ0amulhA/3cptfiQ==
Date: Sun, 27 Nov 2022 19:42:36 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Petr Vorel <pevik@seznam.cz>
Cc: openembedded-core@lists.openembedded.org,
	Petr Vorel <petr.vorel@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Daniel =?iso-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>,
	Khem Raj <raj.khem@gmail.com>,
	Changhyeok Bae <changhyeok.bae@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/1] iputils: update to 20221126
Message-ID: <Y4OvnGtP+XQBEjXc@mail.local>
References: <20221127151708.473859-1-pevik@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221127151708.473859-1-pevik@seznam.cz>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 18:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173880

Hello,

You should at least build test your patches

On 27/11/2022 16:17:08+0100, Petr Vorel wrote:
> -PACKAGECONFIG ??= "libcap rarpd \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ninfod', '', d)} \
> +PACKAGECONFIG ??= "libcap \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '', d)} \

This probably doesn't work either


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

