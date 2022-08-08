Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866A0C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 13:20:08 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.25442.1659964802854356987
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 06:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=o/Jr8aAl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B2FE54000B;
	Mon,  8 Aug 2022 13:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659964801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ySY1ABLaQziUwEjqBw7xj4Snr0SYpt3Vu/mLz8fjDs8=;
	b=o/Jr8aAlI8HsyIL6Iju9X8hp6FZhpJC4A7dhCQ+qrfEDg1MMS8eQWauX4gsMk+fKxU+gbF
	3DVvjxHXN3ndbP2/Y47tE7mcw8QEtYzPihiamjaPsoKYCpAiL/KCKg7l/dhtvkzcSVzO4F
	C4zHNMwLAt+Lop8/qtn/Gfpz+hlPvEBR5f99+ecmfEsGw9ZGo9tqVfnoLM0G2Ioabh4Qyj
	is5ScvjjLcw1eYcK9huHYgFaW4kw0e7UgNmzqz4BXkMNDtAoa8ma8G3dee6Enkh8z0UedU
	Bkf3mC2UuKZo+/G/fhL9X4OqZkhiKR80x2DDS4BJDqd0GbENTHoWSJ11aOQX/g==
Date: Mon, 8 Aug 2022 15:19:59 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Roos, Thomas" <throos@amazon.de>,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] oeqa devtool: Add tests to cover devtool
 handling of various git URL styles
Message-ID: <20220808151959.22790acf@booty>
In-Reply-To: <1659947998632.6878@amazon.de>
References: <20220804134920.167173-1-throos@amazon.de>
	<20220808091813.6a467409@booty>
	<1659947998632.6878@amazon.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 13:20:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169086

Hi Thomas,

On Mon, 8 Aug 2022 08:39:59 +0000
"Roos, Thomas" <throos@amazon.de> wrote:

> Hi Luca,
> thank you for this - will update my patch and try with the sendemail.from parameter.
> The correct procedure will be creating a v3 patch and send as new again?

The correct thing would be to configure your git sendemail.from
parameter, fix the issues I reported, and send a v3 with those fixed.

Thanks!
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

