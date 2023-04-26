Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B914C77B60
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 21:18:28 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.4840.1682543899727314507
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 14:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bj+r3RX7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 34036E0005;
	Wed, 26 Apr 2023 21:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682543897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eKAYyLzR6qm9nno9WX8XjfaSKo0XNMzTjeHFAkHRuTw=;
	b=bj+r3RX7Syk8s3O9IIvNFxC8B34gLY4FcpeFBP35PAoEM7PIVD5jA0EgTnDj2aICXC6mkP
	frc+psIjl2m3nvloYf230I+g4ynfdhE3bzeNGCf2/v3VALxJxjDxoSHD9uc0doXj6KdBan
	VSPtRzTMerX5ysubxtmyHpHgkwV61N8KpRFd1iWRQAaIdJbLwGxSogU02v0OnuTC6uxTk+
	XAxGVu4/HA4T4cPz3Z0XlofeQcwewhe4sc04DHjfeGxv1b4JV1zHy00uNts0H58Cj/0OCi
	QEhAbVDaeGDgCT/Z5SWB+LyLzoMB+a7YJ8et+RnFTDeLhCaglvM88uE0Wg9PQg==
Date: Wed, 26 Apr 2023 23:18:15 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 11/11] insane.bbclass: enable 32 bit time API
 check on affected architectures
Message-ID: <20230426231815.546f2ad6@booty>
In-Reply-To: <20230426095036.2632847-11-alex@linutronix.de>
References: <20230426095036.2632847-1-alex@linutronix.de>
	<20230426095036.2632847-11-alex@linutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 21:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180458

Hi Alex,

On Wed, 26 Apr 2023 11:50:36 +0200
"Alexander Kanavin" <alex.kanavin@gmail.com> wrote:

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes-global/insane.bbclass | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
> index 8788f58fc5b..38126d89a58 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -44,7 +44,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
>              already-stripped installed-vs-shipped ldflags compile-host-path \
>              install-host-path pn-overrides unknown-configure-option \
>              useless-rpaths rpaths staticdev empty-dirs \
> -            patch-fuzz patch-status-core\
> +            patch-fuzz patch-status-core 32bit-time \

This line conflicted with another patch you sent earlier and which is
on my branch. You may want to double check whether
lucaceresoli/master-next is still consistent with what you had in mind.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

