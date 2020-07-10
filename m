Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web12.13935.1594395990463611559
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 08:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4B3HTJ0dNvz5tlC;
	Fri, 10 Jul 2020 17:46:28 +0200 (CEST)
Date: Fri, 10 Jul 2020 17:46:26 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-Core][PATCH] u-boot: Upgrade 2020.04 -> 2020.07
Message-ID: <20200710154626.wuge662btikeyfpd@qschulz>
References: <20200710152844.12588-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200710152844.12588-1-alex.kiernan@gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

On Fri, Jul 10, 2020 at 03:28:44PM +0000, Alex Kiernan wrote:
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> 
>  meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
>  .../u-boot/{u-boot-tools_2020.04.bb => u-boot-tools_2020.07.bb} | 0
>  .../recipes-bsp/u-boot/{u-boot_2020.04.bb => u-boot_2020.07.bb} | 0
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-tools_2020.04.bb => u-boot-tools_2020.07.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2020.04.bb => u-boot_2020.07.bb} (100%)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
> index f4790532b4..abd9786c0a 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> @@ -12,7 +12,7 @@ PE = "1"
>  
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "1079ec0a77c3fda510f07860b2549c47f3a46c21"
> +SRCREV = "aaab5b273781646d417a6775bddd46f90031ee92"
>  
>  SRC_URI = "git://git.denx.de/u-boot.git \
>            "
> diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2020.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2020.07.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-tools_2020.04.bb
> rename to meta/recipes-bsp/u-boot/u-boot-tools_2020.07.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2020.04.bb b/meta/recipes-bsp/u-boot/u-boot_2020.07.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot_2020.04.bb
> rename to meta/recipes-bsp/u-boot/u-boot_2020.07.bb

This patch was already sent:
https://lists.openembedded.org/g/openembedded-core/message/140369?p=,,,20,0,0,0::Created,,u-boot,20,2,0,75342392

Though the SRC_REV are different, yours point to the one in the mail I
linked above.

Quentin
