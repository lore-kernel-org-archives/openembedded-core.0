Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADDBC4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 09:26:35 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.10471.1707989187423637182
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 01:26:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PcY7xfwF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 465A0240005;
	Thu, 15 Feb 2024 09:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707989185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2G5V9nGKZXHgdvX2RUqzlFWnyOaeyeGR5lS4owgx+34=;
	b=PcY7xfwFLudfOlPCPax82sQ130wd+i56DS1Cng0CuDe55bRb4LiTsCUR0u6lEziFBiAzq+
	nGnSSXGDJkMWNMVRBvdYuxbUmfquPue/8OKQLNy7qP9mjB1AUX/Em5BygQ+wjEwuSUTuBf
	MErFee1OGp3TlOt6Ihkv6jLkXaIigPI8/6wSdkXM+23dIpK1/i8P66tgeYVfYGHyAMAUEm
	OfNG8mZU5svDAuNZMNH1F5MSiOIXIfXUqjpMHMgCOdCvnT2Qg9Ll/HbiyxHk0oQiKunJwz
	W02d0Eq6ROgYLKNQEDHJKg5DfWL5lvO0a6ctnie4mw2lFkvVfb0JRCvT+372Gw==
Date: Thu, 15 Feb 2024 10:26:25 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: belouargamohamed@gmail.com
Cc: openembedded-core@lists.openembedded.org,
	f.lahoudere@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: Re: [OE-core] [PATCH 1/2] create-spdx-2.2: Correct the default value
 of SPDX_NAMESPACE_PREFIX
Message-ID: <202402150926250c40134a@mail.local>
References: <20240214214905.149929-1-m.belouarga@technologyandstrategy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214214905.149929-1-m.belouarga@technologyandstrategy.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 09:26:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195506

Hello,

This is 1/2, but I couldn't find a 2/2.

On 14/02/2024 22:49:05+0100, belouargamohamed@gmail.com wrote:
> From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
> 
> This patch corrects the default value of SPDX_NAMESPACE_PREFIX as the previous
> value is not expected to exist.
> 
> [ YOCTO #15398 ]
> 
> Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
> ---
>  meta/classes/create-spdx-2.2.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
> index 486efadba9..dedaffc043 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -28,7 +28,7 @@ SPDX_ARCHIVE_SOURCES ??= "0"
>  SPDX_ARCHIVE_PACKAGED ??= "0"
>  
>  SPDX_UUID_NAMESPACE ??= "sbom.openembedded.org"
> -SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdoc"
> +SPDX_NAMESPACE_PREFIX ??= "https://spdx.org/spdxdocs"
>  SPDX_PRETTY ??= "0"
>  
>  SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195500): https://lists.openembedded.org/g/openembedded-core/message/195500
> Mute This Topic: https://lists.openembedded.org/mt/104362313/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

