Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A381DC433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 15:09:27 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web12.6189.1652886557440468975
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 08:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RbmqcD74;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EB88B1C0006;
	Wed, 18 May 2022 15:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1652886555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8W0Dcyz9DevXy+absbJqpZS2AOMoGs3dQ7BF5aH0c1k=;
	b=RbmqcD74ZJuDRuhJzrT2dZAvaW9ftW1rRbMjjkvObqotdQbBpprGoz5FkZmMocBvp5oo6u
	u6q/COmHqhwve+873i0ZebKP+6XV0k/uWBcD32MRcPgNgjZ7xogESQpqoI1lUzqIuaClRg
	4hLFgx04P5n4RKCUGN+bf4LeUWmWfH5UagmyXxmRkrfYpI9x11ISA1TR1Tc2amtmF+sIR6
	Fx3qqXppiOwtrWkW/8xPrHvs64Vbhv/1GYJ+jPlW6AOvIMBgUVeOcEib91KFP85AX3tl6H
	HfZY+DB/1M1yihcD4n/7Iuq74Z8VgyNh1x3N1kBEG2WquFXnH2kGKx5xOWKtBg==
Date: Wed, 18 May 2022 17:09:13 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 30/49] librepo: upgrade 1.14.2 -> 1.14.3
Message-ID: <20220518170913.17d12bcf@melee>
In-Reply-To: <20220518105843.3299331-30-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
	<20220518105843.3299331-30-alex@linutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 15:09:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165854

Hi Alexander,

Il giorno Wed, 18 May 2022 12:58:24 +0200
"Alexander Kanavin" <alex.kanavin@gmail.com> ha scritto:

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../librepo/{librepo_1.14.2.bb => librepo_1.14.3.bb}            | 2
> +- 1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/librepo/{librepo_1.14.2.bb =>
> librepo_1.14.3.bb} (94%)
> 
> diff --git a/meta/recipes-devtools/librepo/librepo_1.14.2.bb
> b/meta/recipes-devtools/librepo/librepo_1.14.3.bb similarity index 94%
> rename from meta/recipes-devtools/librepo/librepo_1.14.2.bb
> rename to meta/recipes-devtools/librepo/librepo_1.14.3.bb
> index 8dece946b4..2c8e592251 100644
> --- a/meta/recipes-devtools/librepo/librepo_1.14.2.bb
> +++ b/meta/recipes-devtools/librepo/librepo_1.14.3.bb
> @@ -10,7 +10,7 @@ SRC_URI =
> "git://github.com/rpm-software-management/librepo.git;branch=master;pr
> file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
> \ " 
> -SRCREV = "3b9a8d17188ba602d139f79b6e61305030f21109"
> +SRCREV = "8fc7950795282d9c7c50071f45973006de5594ab"

wangmy sent an identical patch on May 7th and it is already on my
testing branch. I'm taking the other 48.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

