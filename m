Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.5609.1628676463079187534
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Aug 2021 03:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1845BC0005;
	Wed, 11 Aug 2021 10:07:40 +0000 (UTC)
Subject: Re: [OE-core] [PATCH 3/3] docs: update docs with new tune locations
To: Jon Mason <jdmason@kudzu.us>, openembedded-core@lists.openembedded.org
References: <20210810214503.17791-1-jdmason@kudzu.us>
 <20210810214503.17791-4-jdmason@kudzu.us>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <6a5a636f-c049-5385-9f6e-0f88300970d7@bootlin.com>
Date: Wed, 11 Aug 2021 12:07:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810214503.17791-4-jdmason@kudzu.us>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Jon,

On 8/10/21 11:45 PM, Jon Mason wrote:
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  documentation/bsp-guide/bsp.rst        | 4 ++--
>  documentation/ref-manual/variables.rst | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
> index 5f62376d69e8..956d90db1aaa 100644
> --- a/documentation/bsp-guide/bsp.rst
> +++ b/documentation/bsp-guide/bsp.rst
> @@ -1266,7 +1266,7 @@ located in the layer ``poky/meta-yocto-bsp/conf/machine`` and is named
>     EXTRA_IMAGEDEPENDS += "u-boot"
>  
>     DEFAULTTUNE ?= "cortexa8hf-neon"
> -   include conf/machine/include/tune-cortexa8.inc
> +   include conf/machine/include/arm/tune-cortexa8.inc
>  
>     IMAGE_FSTYPES += "tar.bz2 jffs2 wic wic.bmap"
>     EXTRA_IMAGECMD_jffs2 = "-lnp "
> @@ -1344,7 +1344,7 @@ Project Reference Manual.
>     .. note::
>  
>        The include statement that pulls in the
> -      ``conf/machine/include/tune-cortexa8.inc`` file provides many tuning
> +      ``conf/machine/include/arm/tune-cortexa8.inc`` file provides many tuning
>        possibilities.
>  
>  -  :term:`IMAGE_FSTYPES`: The
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 115094013313..1c4897bf65e7 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8245,7 +8245,7 @@ system and gives an overview of their function and contents.
>  
>        These tune-specific package architectures are defined in the machine
>        include files. Here is an example of the "core2-32" tuning as used in
> -      the ``meta/conf/machine/include/tune-core2.inc`` file::
> +      the ``meta/conf/machine/include/x86/tune-core2.inc`` file::
>  
>           TUNE_PKGARCH_tune-core2-32 = "core2-32"
>  


Thanks for the patch!
Indeed, I believe that moving all arm includes to a specific directory
would be more consistent, but that's just from the perspective of
someone looking at the source repositories. I don't know how much
trouble the big change would cause.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

