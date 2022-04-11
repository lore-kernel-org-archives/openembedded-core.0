Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31AD6C636FA
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:01 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.30625.1649688738507256183
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 07:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KDzRm5mg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DD070E000B;
	Mon, 11 Apr 2022 14:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1649688736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9uxrJWrwwaZafZ+fvWsMF9h2+j3kMA7A0va2ST5QaiU=;
	b=KDzRm5mg/B/ArNZQINjtvDus/EiY88folD/8/tnphDDx1asfTHd8DJE8YKFANkeUMuMHG8
	aTXa2OrPFXUNsAU9D6PSqVEDpj2+wMWL6pF2uqwAgec3fprZtNYDduvBqHzRxeIZ2W7U1e
	qYu+3jzf+EcCr1h5U6Sc3846MMIYZIV3NtURPuaNvf+peYjK1RFurEt2aTzvtlbQ7tU3WJ
	lvguvGhTmKX+FYrL1BxYCBgRXMnMptL7bWH+3WlNOsM78iRY9PVkcIcwpikkBsX53T5FeI
	n0ONskZmgZiC/Ijkhbau13LELhjDunVxWEvkVlnGSm/Yy+xDiL4xIUhRbICfjw==
Date: Mon, 11 Apr 2022 16:52:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Davide Gardenal <davidegarde2000@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Davide Gardenal <davide.gardenal@huawei.com>
Subject: Re: [oe-core][master][PATCH v3] libarchive: upgrate from 3.6.0 to
 3.6.1
Message-ID: <YlRAnmJJ1MvR43KO@mail.local>
References: <20220411132145.3603723-1-davide.gardenal@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411132145.3603723-1-davide.gardenal@huawei.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164227

Hello,

I'm already carrying this upgrade from Khem, earlier today.

On 11/04/2022 15:21:45+0200, Davide Gardenal wrote:
> This release contains security fixes
> including CVE-2022-26280 fix.
> 
> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> ---
> Update v3:
>     Instead of backporting the patch upgrade to the latest release with
>     the CVE fix. Thanks Quentin Schulz for the advise.  
> Update v2:
>     Change title from [meta-oe] to [oe-core]
> ---
>  .../libarchive/{libarchive_3.6.0.bb => libarchive_3.6.1.bb}     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-extended/libarchive/{libarchive_3.6.0.bb => libarchive_3.6.1.bb} (96%)
> 
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.0.bb b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
> similarity index 96%
> rename from meta/recipes-extended/libarchive/libarchive_3.6.0.bb
> rename to meta/recipes-extended/libarchive/libarchive_3.6.1.bb
> index f078c8ad03..c795b41628 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.6.0.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
> @@ -35,7 +35,7 @@ EXTRA_OECONF += "--enable-largefile"
>  SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
>  UPSTREAM_CHECK_URI = "http://libarchive.org/"
>  
> -SRC_URI[sha256sum] = "a36613695ffa2905fdedc997b6df04a3006ccfd71d747a339b78aa8412c3d852"
> +SRC_URI[sha256sum] = "c676146577d989189940f1959d9e3980d28513d74eedfbc6b7f15ea45fe54ee2"
>  
>  inherit autotools update-alternatives pkgconfig
>  
> -- 
> 2.32.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164224): https://lists.openembedded.org/g/openembedded-core/message/164224
> Mute This Topic: https://lists.openembedded.org/mt/90394591/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

