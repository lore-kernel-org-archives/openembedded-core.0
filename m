Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9B1EE49BF
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 23:12:06 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.37125.1693955518091043374
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 16:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Kgkg0DUB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C444720003;
	Tue,  5 Sep 2023 23:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693955516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V4XR4KHgOa09KTphl40XVOTQUiJMt3jJ7oAXGrn5o0w=;
	b=Kgkg0DUBQhjuRdEVEt7hq8qMgBxc705RlTBGxapTPhIFi2aeCvef7bPD5AIepvOM/Dhwzj
	ALa0lNI2bCIMKqUvx4yEPB+/MnfFasZoXNLU/GBlu89sR7sRonC5sdRjkA1zR3CtJ952iE
	2Bt9UNeVq3RX9yIeWB9OQ6GtXy4i14tpB/keZ8MuLHUVpVOfgCJtyWZmxK3shyo4W9kNSx
	aFlS0v5emhDMsS0Og1HEB5M6yd3RBBjgq7Q0O7umP/ya1TV8AvFcsLkJ+TpQ/vCP94PeFi
	vy+apUk34z2KUwsEOeGEBwQCvjFzPGYBAHwcMCKvvGn7rKB1R0KxO8j5yLfLXA==
Date: Wed, 6 Sep 2023 01:11:55 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Zang Ruochen <xmdy61@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] [OE-core][PATCH] tcf-agent: Disable non-building
 features on loongarch64
Message-ID: <202309052311554c1ba20e@mail.local>
References: <20230905113851.18549-1-xmdy61@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905113851.18549-1-xmdy61@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 23:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187258

Hello,

On 05/09/2023 19:38:51+0800, Zang Ruochen wrote:
> Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>

Your From: and SoB are not matching, either fix you from identity or add
your SoB.

> ---
>  meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> index 4d2ca5f1b0..59b9d7de78 100644
> --- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> +++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> @@ -49,6 +49,7 @@ CFLAGS:append:powerpc64 = " ${LCL_STOP_SERVICES}"
>  CFLAGS:append:powerpc64le = " ${LCL_STOP_SERVICES}"
>  CFLAGS:append:riscv64 = " ${LCL_STOP_SERVICES}"
>  CFLAGS:append:riscv32 = " ${LCL_STOP_SERVICES}"
> +CFLAGS:append:loongarch64 = " ${LCL_STOP_SERVICES}"
>  
>  do_install() {
>  	oe_runmake install INSTALLROOT=${D}
> -- 
> 2.20.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187207): https://lists.openembedded.org/g/openembedded-core/message/187207
> Mute This Topic: https://lists.openembedded.org/mt/101167230/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

