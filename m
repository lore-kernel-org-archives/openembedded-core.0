Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C888FC7EE22
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 18:54:57 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.5190.1683831293329771584
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 11:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ouHDQBMf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 07313E0003;
	Thu, 11 May 2023 18:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683831291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oXdW5Q5SkJLmnZj5/T2nAe0kVZ7mNu6tKM+o6MOrnPo=;
	b=ouHDQBMfN6MAZXnuUjHx4ZdXIWU0jmVVuR+v6O/kDvb58fgszMZcDuvPMOXEY7CuTdI2BD
	qGTmsS8OcXFyvwhTdT2FbUyA28RTe0MWz1M+voMKagHqBpMUUqvUg65+T0T96s4H5JTc8O
	28jXfnGv/oPNkDAYwb1pGECr5OcU6mOjI+L5aaR0nmgvLrEQD2GIh/6uXRRpCKpm39M/1Y
	uI4zC19xNM719kqtd4pgj6/XsLJKxdaP4URMHnMZ6zANS1rJm9JGvbRGnZSNMQDJ3qtrjD
	er1Asga5TV40RC8UzX8wjGk1P+yM2lm8A1+i0u7q3VKm1+hNEFohO1zO9R0MrQ==
Date: Thu, 11 May 2023 20:54:50 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: randy.macleod@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] vim: upgrade 9.0.1429 -> 9.0.1527
Message-ID: <2023051118545060b3a027@mail.local>
References: <20230511145915.2513006-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511145915.2513006-1-Randy.MacLeod@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 18:54:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181141

Hello Randy,

This patch is missing your From: ;)
See "Fixing your From identity" here:
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

On 11/05/2023 10:59:15-0400, Randy MacLeod via lists.openembedded.org wrote:
> Fixes: https://nvd.nist.gov/vuln/detail/CVE-2023-2426
> caf642c25 patch 9.0.1499: using uninitialized memory with fuzzy matching
> 
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/recipes-support/vim/vim.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
> index 1e27415288..e1d2563316 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
>             file://no-path-adjust.patch \
>             "
>  
> -PV .= ".1429"
> -SRCREV = "1a08a3e2a584889f19b84a27672134649b73da58"
> +PV .= ".1527"
> +SRCREV = "c28e7a2b2f23dbd246a1ad7ad7aaa6f7ab2e5887"
>  
>  # Remove when 8.3 is out
>  UPSTREAM_VERSION_UNKNOWN = "1"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181137): https://lists.openembedded.org/g/openembedded-core/message/181137
> Mute This Topic: https://lists.openembedded.org/mt/98829205/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

