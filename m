Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web09.21259.1630929479827707365
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Sep 2021 04:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id EBE78100003;
	Mon,  6 Sep 2021 11:57:55 +0000 (UTC)
Date: Mon, 6 Sep 2021 13:57:34 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-Core][PATCH] iproute2: update to 5.14.0
Message-ID: <YTYCLo3T6uCliJAa@piout.net>
References: <20210905235707.861-1-changhyeok.bae@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210905235707.861-1-changhyeok.bae@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On 06/09/2021 01:57:07+0200, Changhyeok Bae wrote:
> Signed-off-by: Changhyeok <changhyeok.bae@gmail.com>
> ---
>  .../iproute2/{iproute2_5.13.0.bb => iproute2_5.14.0}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-connectivity/iproute2/{iproute2_5.13.0.bb => iproute2_5.14.0} (75%)
> 
> diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.14.0
> similarity index 75%
> rename from meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb
> rename to meta/recipes-connectivity/iproute2/iproute2_5.14.0
> index 44575bd50c..27fb5c8866 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb
> +++ b/meta/recipes-connectivity/iproute2/iproute2_5.14.0
> @@ -4,7 +4,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
>             file://0001-libc-compat.h-add-musl-workaround.patch \
>             "
>  
> -SRC_URI[sha256sum] = "72a2e53774cac9e65f7b617deebb2059f87e8960d6e9713e4d788cea966f1b36"
> +SRC_URI[sha256sum] = "210fa785a52f3763c4287fd5ae63e246f6311bfaa48c424baab6d383bb7591d4"
>  

On the autobuilders, this does result in:

ERROR: Nothing RPROVIDES 'iproute2-ss' (but /home/pokybuild/yocto-worker/check-layer/build/meta/recipes-devtools/elfutils/elfutils_0.185.bb RDEPENDS on or otherwise requires it)

Did you build test this patch?

Regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
