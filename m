Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B94EC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 13:07:00 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.44394.1681132012939109476
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 06:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Jpj1bm5S;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A74C9E0003;
	Mon, 10 Apr 2023 13:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681132010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cdCV/55O9ohrn9DMO1Af2g9SUvN1n69ZYY8hrL5Iupk=;
	b=Jpj1bm5SY7u1ulbDFQ6uSZgpJsrmdkf2GWCGb0V4wl0deOgASddrzLJOahds6eNbGFYFmy
	WVMf2SrnHCplgLL4dGyrGbzVupXPsfoeWULNJDw6uOlyu/qNkdLR8sdvAiC4ipqwFPHuG2
	MAeP8IHx19+ld4En2qmV/594PqI7/rKPM29P1nx0A2fZ1/+A+6ibV1DJr/dwNqZY6IrRog
	4qPwSoRaA1fMj4bkPIG6uznh3s4KkbHhC6RsB+9lWoeOIimewf2V6ITcTRSGYRNXDywhXM
	iV4DceR5aI2VWXYZSOj+BPJR0C0BROqdH35TCjpBTW1mnJIIEoH0HGyKhW4lLg==
Date: Mon, 10 Apr 2023 15:06:50 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] mesa: upgrade 23.0.0 -> 23.0.2
Message-ID: <20230410130650c07dcf4f@mail.local>
References: <1681117100-24726-1-git-send-email-wangmy@fujitsu.com>
 <1681117100-24726-5-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1681117100-24726-5-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 13:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179888

On 10/04/2023 16:58:20+0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 

You forgot to upgrade mesa-gl:

ERROR: mesa-gl-2_23.0.0-r0 do_fetch: Checksum failure fetching https://mesa.freedesktop.org/archive/mesa-23.0.0.tar.xz
ERROR: mesa-gl-2_23.0.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/mesa-23.0.0.tar.xz\' has sha256 checksum \'01f3cff3763f09e0adabcb8011e4aebc6ad48f6a4dd4bae904fe918707d253e4\' when \'1b7d3399fc6f16f030361f925d33ebc7600cbf98094582f54775b6a1180529e7\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "01f3cff3763f09e0adabcb8011e4aebc6ad48f6a4dd4bae904fe918707d253e4"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://mesa.freedesktop.org/archive/mesa-23.0.0.tar.xz')

Did you build any of the patches you just sent?

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc                           | 2 +-
>  meta/recipes-graphics/mesa/{mesa_23.0.0.bb => mesa_23.0.2.bb} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/mesa/{mesa_23.0.0.bb => mesa_23.0.2.bb} (100%)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 8f72f25c17..babd10a855 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -19,7 +19,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
>             "
>  
> -SRC_URI[sha256sum] = "01f3cff3763f09e0adabcb8011e4aebc6ad48f6a4dd4bae904fe918707d253e4"
> +SRC_URI[sha256sum] = "1b7d3399fc6f16f030361f925d33ebc7600cbf98094582f54775b6a1180529e7"
>  
>  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>  
> diff --git a/meta/recipes-graphics/mesa/mesa_23.0.0.bb b/meta/recipes-graphics/mesa/mesa_23.0.2.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa_23.0.0.bb
> rename to meta/recipes-graphics/mesa/mesa_23.0.2.bb
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179852): https://lists.openembedded.org/g/openembedded-core/message/179852
> Mute This Topic: https://lists.openembedded.org/mt/98171958/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

