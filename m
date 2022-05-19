Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882C9C433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 13:56:49 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.7880.1652968600374875640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 06:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HXHXjMjl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 155A0FF80A;
	Thu, 19 May 2022 13:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1652968598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eL97liMq/zO0/EUfa+jhm/vCHdCHxI9bHhxXpv2bEHc=;
	b=HXHXjMjl2Tq7DRhouxh/RSFKb7s9lDPjW6rCF980VsY1sy8KHiC03vFh4mlcfp4yyMcART
	ftkOrwV2UsnrjmpemS0jM+XFmdcoSsmsbcSsdWpmWYSr9Ou6duwFBscBRa6dR8HCji1OYw
	FtaC9Ikg1sXPGNAues/d7PW9LwVO/+j09fn+rH2PK04WEbtyUB23uYVqf07ClSug1yyFdI
	g7rXdVeZp30KLZhwD3qaRnyo2LnJhEsTiZt9MBx4CpvwJPeeCkGgVDPgL9RKcrziBoZGui
	fOrtsNGlO7EBl7NZSy/3wtFgvTx6uuT3JHiboNNfDIxPgTKx0yxeGGKanMPN/g==
Date: Thu, 19 May 2022 15:56:36 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Enrico Scholz via lists.openembedded.org"
 <enrico.scholz=sigma-chemnitz.de@lists.openembedded.org>
Cc: enrico.scholz@sigma-chemnitz.de,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 4/6] npm: disable 'audit' + 'fund'
Message-ID: <20220519155636.49e44dc4@melee>
In-Reply-To: 
 <9dd04b7493db380bc08e0346df8083c716e505c3.1652954597.git.enrico.scholz@sigma-chemnitz.de>
References: <cover.1652954597.git.enrico.scholz@sigma-chemnitz.de>
	<9dd04b7493db380bc08e0346df8083c716e505c3.1652954597.git.enrico.scholz@sigma-chemnitz.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 13:56:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165888

Il giorno Thu, 19 May 2022 12:05:54 +0200
"Enrico Scholz via lists.openembedded.org"
<enrico.scholz=sigma-chemnitz.de@lists.openembedded.org> ha scritto:

> 'audit' can cause extra network traffic; 'fund' is not needed.
> 
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  meta/classes/npm.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
> index 11c80a738e..1e41072116 100644
> --- a/meta/classes/npm.bbclass
> +++ b/meta/classes/npm.bbclass
> @@ -53,6 +53,8 @@ def npm_global_configs(d):
>      # Ensure no network access is done
>      configs.append(("offline", "true"))
>      configs.append(("proxy", "http://invalid"))
> +    configs.append(("funds", False))

'fund' or 'funds'?



-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

