Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.5995.1632221457774357133
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 03:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id BE35BE0005;
	Tue, 21 Sep 2021 10:50:55 +0000 (UTC)
Date: Tue, 21 Sep 2021 12:50:55 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-Core][PATCH 1/2] iproute2: update to 5.14.0
Message-ID: <YUm5D8Nm//lFCLh2@piout.net>
References: <20210921093801.2336-1-changhyeok.bae@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210921093801.2336-1-changhyeok.bae@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On 21/09/2021 11:38:00+0200, Changhyeok Bae wrote:
> Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
> ---
>  .../iproute2/{iproute2_5.13.0.bb => iproute2_5.14.0.bb}         | 2 +-

This is already in kirkstone-next, please check before sending updates.

>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-connectivity/iproute2/{iproute2_5.13.0.bb => iproute2_5.14.0.bb} (75%)
> 
> diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.14.0.bb
> similarity index 75%
> rename from meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb
> rename to meta/recipes-connectivity/iproute2/iproute2_5.14.0.bb
> index 44575bd50c..27fb5c8866 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb
> +++ b/meta/recipes-connectivity/iproute2/iproute2_5.14.0.bb
> @@ -4,7 +4,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
>             file://0001-libc-compat.h-add-musl-workaround.patch \
>             "
>  
> -SRC_URI[sha256sum] = "72a2e53774cac9e65f7b617deebb2059f87e8960d6e9713e4d788cea966f1b36"
> +SRC_URI[sha256sum] = "210fa785a52f3763c4287fd5ae63e246f6311bfaa48c424baab6d383bb7591d4"
>  
>  # CFLAGS are computed in Makefile and reference CCOPTS
>  #
> -- 
> 2.33.0.windows.2
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
