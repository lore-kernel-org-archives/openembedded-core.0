Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22D8C35280
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 17:48:47 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.1294.1650384456508977924
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 09:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HXOJRzE4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 835C46000D;
	Tue, 19 Apr 2022 16:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650384454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UQ46YXKY6ITNXaOhvMgVz7RtBh4RxmNh9Ocv6Y0ziUA=;
	b=HXOJRzE4IVHZcs9jerfVnQkKvWWgfkBRDp7Ud9z/JINTugB513i8cPcoJ+i9Mn4tN9Hs3w
	ZpXns4kIIed3Oe4AsSXl6uuT0ov+2NB08z/mgfMe+Yj2VTm+DE25/NaEP7K2DnVJeX2701
	k7RE1Ajlg0A9wQz5ICnB0QHGkzUIr0MmYWBVLGeLOf3sZ8woXAjkcplor8qXEwNI7bAP5D
	n5+Or+IG8W+FXNb79NTdVyzyrFG37eb3HYmeEULDzSUHBWE35rrpCS+/87iFd9OfXKlBga
	4ekT8WTImEC41jP/KE3bbNHhEA2ciroeG7Qpd19lqjbCDTNwoMcc+ymm4dKzdw==
Date: Tue, 19 Apr 2022 18:07:33 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] sysvinit: upgrade 3.01 -> 3.03
Message-ID: <20220419180733.49d249ff@melee>
In-Reply-To: <1650284814-2432-1-git-send-email-zhengrq.fnst@fujitsu.com>
References: <1650284814-2432-1-git-send-email-zhengrq.fnst@fujitsu.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 17:48:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164635

Hi zhengruoqin,

Il giorno Mon, 18 Apr 2022 20:26:54 +0800
"zhengruoqin" <zhengrq.fnst@fujitsu.com> ha scritto:

> pidof-add-m-option.patch updated for new version.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>

This patch won't apply as sysvinit is already at 3.02. Can you please
send an update patch?

Best regards.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

