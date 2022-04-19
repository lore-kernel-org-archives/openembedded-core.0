Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC600C3527E
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 17:48:47 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web12.1292.1650384449777608406
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 09:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mwfCwIKl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 78318240004;
	Tue, 19 Apr 2022 16:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650384448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=spWrwqK9cCveRpYro54CB4dBir28V1pPxo+dEnRSg/Y=;
	b=mwfCwIKli/1OEbrpRuc4wUpdtrW2z4elyx/A1+2aHMEGCM7RdEjRMTddoArskakbfWglMT
	lvF59edViyTvoVEAcs5FM1CxtbcPkpeyliXDQz8fTRKe1adT0cBR232raay/luW3rb2oqP
	Cy4yeFH6gTW5dCFx5l1IF6frog8ogFF0ueyn8hxNPIzPYqYn1OCqyfslal0GO8ti02PmYn
	FR78rSTU0nFuC6K6RX150Yyq37Y3B5eNBulw4c0TvgBOqm93A7qJHVLRKSv1+M5XfDIC5f
	Koqq3vEKRerSKsrejmFnPwbLEhoBVtA3k/JON6AMDzL9tj73Pf721L2+kDLeRQ==
Date: Tue, 19 Apr 2022 18:07:25 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "wangmy" <wangmy@fujitsu.com>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-hypothesis: upgrade 6.39.5 -> 6.43.2
Message-ID: <20220419180725.59848827@melee>
In-Reply-To: <1650332686-20457-2-git-send-email-wangmy@fujitsu.com>
References: <1650332686-20457-1-git-send-email-wangmy@fujitsu.com>
	<1650332686-20457-2-git-send-email-wangmy@fujitsu.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/164634

Hi wangmy,

Il giorno Tue, 19 Apr 2022 09:44:43 +0800
"wangmy" <wangmy@fujitsu.com> ha scritto:

> Changelog:
> =========
> Fixed a type annotation for "pyright --strict" (issue #3287).
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>

Also this patch won't apply as this package is already at 6.41.0 in
master.

Best regards.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

