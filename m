Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2D2C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 12:17:31 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.10309.1720700248476178781
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 05:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=j3t41pmw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C7FDC0002;
	Thu, 11 Jul 2024 12:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720700246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4uk9+x7Tw9jot3J6UsLRVXIUioZJ92WCeoTzsv3Xukw=;
	b=j3t41pmwkdVGqnUUbfjkAI2jIFvrvWwk7a8bErMNjkI4lf4u1LuSoAWEY1ZQhJIzjXoL+M
	IruWsS+HYVY2C90K5qObrDSIPUi1QMRSa849avyZEUmaOop6uvph4igDmGykQgtA5ZKx98
	OFxSTrY0BiBWTCkEmc2EDJ4mmh/YcaI70eAcroSKvxJfPzvtVsLcoOROC1hgxq1MdRoKED
	7SxSKLqsE4lEhleL2fhuoto3zQI2r6QjS1lfajImEI+hihdj2/B72qMDcNFUftSNCCrMfq
	hcnOKMIM8K9aW0WrgQWOrYlATbmlQuZWcd4YLcxGfHz58920eKVr5qiDo5cluQ==
Date: Thu, 11 Jul 2024 14:17:26 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Alexandre Belloni via lists.openembedded.org" <alexandre.belloni=bootlin.com@lists.openembedded.org>
Cc: openembedded-core@lists.openembedded.org,
	Wang Mingyu <wangmy@fujitsu.com>
Subject: Re: [OE-core] [PATCH] wireless-regdb: upgrade 2024.05.08 ->
 2024.07.04
Message-ID: <202407111217269def9358@mail.local>
References: <17E1274C3C6F7250.25753@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17E1274C3C6F7250.25753@lists.openembedded.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 12:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201779

Forget about this, I sent the wrong patch!

On 11/07/2024 14:08:54+0200, Alexandre Belloni via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  ...ireless-regdb_2024.05.08.bb => wireless-regdb_2024.07.04.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.05.08.bb => wireless-regdb_2024.07.04.bb} (94%)
> 
> diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
> similarity index 94%
> rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
> rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
> index 95e33d9fb1a7..daf5e6dfcd82 100644
> --- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
> +++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
> @@ -5,7 +5,7 @@ LICENSE = "ISC"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
>  
>  SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
> -SRC_URI[sha256sum] = "9aee1d86ebebb363b714bec941b2820f31e3b7f1a485ddc9fcbd9985c7d3e7c4"
> +SRC_URI[sha256sum] = "9832a14e1be24abff7be30dee3c9a1afb5fdfcf475a0d91aafef039f8d85f5eb"
>  
>  inherit bin_package allarch
>  
> -- 
> 2.45.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201777): https://lists.openembedded.org/g/openembedded-core/message/201777
> Mute This Topic: https://lists.openembedded.org/mt/107161052/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

