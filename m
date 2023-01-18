Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE003C32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 16:46:14 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.20926.1674060373553414590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 08:46:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VKsE6RBf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9F7FF20003;
	Wed, 18 Jan 2023 16:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674060371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XnAvXCBb/1lTIvxHUNFefT2gTQf2zNQJ2PuK/UjyrfM=;
	b=VKsE6RBfV2KTeWDOfb9xa/WBkZ8P7CnI/c9ufqYZeW+Q2V8J6scgeSQwLEUz8Ws4hkZZPE
	ScnK9ykw0ojcGEOn5DKhi8G2UwsB0BRopGfA0r1G12KoEY61d0tmkR0Ou7fl64B6zfjDuO
	E41Ji6sGlDxAcUSruEnWddJ5HHwTJAUoXkTCtmsDRkFmkK8xWAzPns8kUDnupVyHxPK+fQ
	gB97kV4mpSPXXnSXfDNHI0Z2ve/FXELF4eq6dAF3aoFU9P+1ddiInPEbr9mZx91fwjlC0v
	5SknQdnLTG3GBcfnqUr3tXqDYhg6nfWElzG0VYLAF2C8cCr0WMByGhClP+Hg0g==
Date: Wed, 18 Jan 2023 17:46:09 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/3] pseudo: Switch back to the master branch
Message-ID: <20230118174609.6a8fa643@booty>
In-Reply-To: <20230118142221.1926666-3-richard.purdie@linuxfoundation.org>
References: <20230118142221.1926666-1-richard.purdie@linuxfoundation.org>
	<20230118142221.1926666-3-richard.purdie@linuxfoundation.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 16:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176107

Hello Richard,

On Wed, 18 Jan 2023 14:22:21 +0000
"Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:

> OE is the main user of pseudo and we've had the changes in the oe-core branch
> around long enough that we're going to run with them. Swicth back to directly
> using the master branch.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
> index c9386c3f090..553f0254ee4 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -1,6 +1,6 @@
>  require pseudo.inc
>  
> -SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
> +SRC_URI = "git://git.yoctoproject.org/pseudo \

Triggers "URL: ... does not set any branch parameter. The future is
uncertain and the end is always near" ;)

I'm fixing it on my testing branch for the moment.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

