Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF559C0032E
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 15:01:58 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.45992.1698246113842615468
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 08:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WX56P40R;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7426E240016;
	Wed, 25 Oct 2023 15:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698246111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gn+uTUG8BlVB22UxFQo7/Pg48uqocxN8J3mjtWNXdMs=;
	b=WX56P40R6PXI4liLjM02lB0cHcXmOaSgs0k14R6X3Kr6WF1Kp8vB5/WRJTmDVcuDvCMrou
	9gg0urJp/DijvD2pwZt9D76OR2Cj0qmpzjtTiGrpWV723amRM8Ai85vFd7nMrLEMMDNs++
	w508R+ufMGL2ugUUFGG/FFKV4oUsAfPGqLqVvP9pL0IEjubGpJZfHkIljJXz0ptolM9B5h
	4F4sUN4llJOrWtnY1sr0UxUKh/Iy3EZdtPcESPS7O+5gWWnDEYk0S11QcAL5UoPZrMANMG
	9mKTv60FitCsEOAgtBK3OTsT65CUl5q0T+2L2VKjjSRHboG2MLVF+ujIUqAnkA==
Date: Wed, 25 Oct 2023 17:01:44 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Julien Stephan" <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RESEND PATCH 2/2] oeqa/selftest/devtool: remove
 spaces on empty line
Message-ID: <20231025170144.70459a2d@booty>
In-Reply-To: <20231024141754.1528786-2-jstephan@baylibre.com>
References: <20231024141754.1528786-1-jstephan@baylibre.com>
	<20231024141754.1528786-2-jstephan@baylibre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 15:01:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189681

Hello Julien,

On Tue, 24 Oct 2023 16:17:54 +0200
"Julien Stephan" <jstephan@baylibre.com> wrote:

> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
> index c36b1efa78b..b5c488be8e8 100644
> --- a/meta/lib/oeqa/selftest/cases/devtool.py
> +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> @@ -575,7 +575,7 @@ class DevtoolAddTests(DevtoolBase):
>          checkvars['S'] = '${WORKDIR}/MarkupSafe-%s' % testver
>          checkvars['SRC_URI'] = url
>          self._test_recipe_contents(recipefile, checkvars, [])
> -
> +

This patch does not apply due to the '-' line above having no spaces
after '-'. Perhaps your mailer mangled the content removing training
whitespace (which, ironically, is what the patch itself aims at doing!).

Using 'git send-email' is usually the best way to send patches without
this sort of issues.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

