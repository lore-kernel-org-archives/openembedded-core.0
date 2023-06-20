Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C448EB64DB
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 13:00:26 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.9695.1687266023469662915
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 06:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=n4hVi9Up;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: luca.ceresoli@bootlin.com)
X-GND-Sasl: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687266021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lVH7rOcjLmMgbqoCOMCeMSlcj1ZzLxra0qbOO4YPEvI=;
	b=n4hVi9UpXGYRoeLWo9TSFsSnUnSs2B0ywSCyd8F6O/PvTVrDRpj60i3+veS/DBXYZ7t2wR
	g/eSuT//ehgZ7ipLNdh6C8GuP90uza21upg6ndJ4KLLL/BxazKT3WSvH+Od4NALVZMsoTA
	I5YyFzuBnf4RRWaK4Q92YgnbhDLiMFGlx1U4smdV5/LixdYU7TO9W1/jEeYVbP4IbGn4W9
	TxBQ4JvShH1WDwrfMUJUj0RJqSQnJG08hMAKnUxcv9sfNB4ZL5pNWmSzRCGdAlB3ouh9O2
	xI8A8J5DF7qW1Wc4ArdRahkRbnk9MbYIfm1QSQXZYsSny9qc6VFQ7o0VeyfTCA==
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6841724001B;
	Tue, 20 Jun 2023 13:00:20 +0000 (UTC)
Date: Tue, 20 Jun 2023 15:00:19 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Ross Burton" <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Subject: Re: [OE-core] [PATCH 3/3] sysfstools: don't install to base_libdir
Message-ID: <20230620150019.14645e48@booty>
In-Reply-To: <20230620123404.3854578-3-ross.burton@arm.com>
References: <20230620123404.3854578-1-ross.burton@arm.com>
	<20230620123404.3854578-3-ross.burton@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 13:00:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183136

Hi Ross,

On Tue, 20 Jun 2023 13:34:04 +0100
"Ross Burton" <ross.burton@arm.com> wrote:

> From: Ross Burton <ross.burton@arm.com>

I guess the Subject line should s/sysfstools/sysfsutils/, so I fixed
that locally for my AB testing branch.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

