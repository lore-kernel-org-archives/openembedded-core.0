Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 39B9976651
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 16:27:46 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c84so6063793pfc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 09:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=w9It0Ifnx3hE0O/bW94OEwwJmZjH1PC9xHzArIV/xaA=;
	b=naUB4ZnBUPZzAlHzA71615T//toYftSdICEPn/FxMjNUOSOBxDzix2vD4sMq+nArTC
	TCUghiHf1RYARgt7iWUhK90+RAbbEElz62I3o1Er9qtpXZQA7k273+IdCF5drIKHs1NH
	qDuma55Xz8CkBB5QMr6+AXwtY9iXpBN4yZ/NZEjsYUnBUJ9lQ904kpHwoYd7qvKv4ciz
	dIn0fY7WlT3jsQGzkJ+GzMtgrL5lh25ww2vgBzqSFYGhcxGAOn9HlIoFc8Ih9ixC+Sis
	3v52xhIyUJ/67KjJDXfE7/JSdgp8ix+a2TZ19/aaT227cbQThR+dtFaPbbn6W2o3yM+F
	o98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=w9It0Ifnx3hE0O/bW94OEwwJmZjH1PC9xHzArIV/xaA=;
	b=H1fq4XQso8/rs6hGWkkKytHSbdTsK+l0t7vxMuwQ22bXWQ95h0U9Uyid4vMnnJogqs
	b0sTulVDBa3LOhMEeMo8bmPpk5YTjU/xD1MLfomL4t2TO85rT86P25bjLCgiR14Wb6aB
	zRrUHQNR8iCaqnaKEOPSei2JCQc7hMhk9VffrbcV/qyHCJEMEebtoRh4NA40Zd10yrQf
	72VzMJB6xI0AmYoIUgVWmUraHjhr8NrAF8KZKjwFvGT8sHHRydjHHJB0uqALA5ccSf4O
	rOdUL10pq/cOsRNBGlgsoQosYgmLtuQ19sO3KcaED3dMgOaO8k7Sk0IASV9dUMoJFTGV
	yFSg==
X-Gm-Message-State: ALyK8tIapnQAf3jsoXfl0RwUV1kQy3eR56zKFNg5eHQZ1OO5S1nTE8wO7okAMieZxkJkrw==
X-Received: by 10.98.8.130 with SMTP id 2mr23818088pfi.64.1464366467298;
	Fri, 27 May 2016 09:27:47 -0700 (PDT)
Received: from [192.168.18.4] (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.googlemail.com with ESMTPSA id
	vw1sm29332697pab.35.2016.05.27.09.27.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2016 09:27:46 -0700 (PDT)
To: Andrew Shadura <andrew.shadura@collabora.co.uk>,
	openembedded-core@lists.openembedded.org
References: <1464356589-7982-1-git-send-email-andrew.shadura@collabora.co.uk>
From: akuster808 <akuster808@gmail.com>
Message-ID: <57487580.5010501@gmail.com>
Date: Fri, 27 May 2016 09:27:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1464356589-7982-1-git-send-email-andrew.shadura@collabora.co.uk>
Subject: Re: [PATCH] u-boot: Update to 2016.05 release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 May 2016 16:27:47 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 05/27/2016 06:43 AM, Andrew Shadura wrote:
> Upgrade U-Boot to the latest upstream version.
> Add a patch to unbreak build on some toolchains.

Are this changes appropriate for Krogoth?

- armin

> 
> Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>
> ---
>  ...utils_2016.03.bb => u-boot-fw-utils_2016.05.bb} |  4 +-
>  ...kimage_2016.03.bb => u-boot-mkimage_2016.05.bb} |  4 +-
>  .../0000-video-ipu_common-fix-build-error.patch    | 48 ++++++++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot_2016.03.bb          | 10 -----
>  meta/recipes-bsp/u-boot/u-boot_2016.05.bb          | 14 +++++++
>  5 files changed, 66 insertions(+), 14 deletions(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2016.03.bb => u-boot-fw-utils_2016.05.bb} (94%)
>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2016.03.bb => u-boot-mkimage_2016.05.bb} (90%)
>  create mode 100644 meta/recipes-bsp/u-boot/u-boot/0000-video-ipu_common-fix-build-error.patch
>  delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2016.03.bb
>  create mode 100644 meta/recipes-bsp/u-boot/u-boot_2016.05.bb
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb
> similarity index 94%
> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb
> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb
> index 79f1548..94d9c13 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb
> @@ -7,9 +7,9 @@ DEPENDS = "mtd-utils"
>  # This revision corresponds to the tag "v2016.03"
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
> +SRCREV = "aeaec0e682f45b9e0c62c522fafea353931f73ed"
>  
> -PV = "v2016.03+git${SRCPV}"
> +PV = "v2016.05+git${SRCPV}"
>  
>  SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
>  
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.05.bb
> similarity index 90%
> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb
> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2016.05.bb
> index d5921a0..bdfcaf4 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.05.bb
> @@ -8,9 +8,9 @@ DEPENDS = "openssl"
>  # This revision corresponds to the tag "v2016.03"
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
> +SRCREV = "aeaec0e682f45b9e0c62c522fafea353931f73ed"
>  
> -PV = "v2016.03+git${SRCPV}"
> +PV = "v2016.05+git${SRCPV}"
>  
>  SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
>  
> diff --git a/meta/recipes-bsp/u-boot/u-boot/0000-video-ipu_common-fix-build-error.patch b/meta/recipes-bsp/u-boot/u-boot/0000-video-ipu_common-fix-build-error.patch
> new file mode 100644
> index 0000000..452672d
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot/0000-video-ipu_common-fix-build-error.patch
> @@ -0,0 +1,48 @@
> +From c510f2e436008e55a50b063f2180cb1e63984224 Mon Sep 17 00:00:00 2001
> +From: Peng Fan <van.freenix@gmail.com>
> +Date: Thu, 28 Apr 2016 10:07:53 +0800
> +Subject: [PATCH] video: ipu_common: fix build error
> +
> +Some toolchains fail to build
> +"clk->rate = (u64)(clk->parent->rate * 16) / div;"
> +And the cast usage is wrong.
> +
> +Use the following code to fix the issue,
> +"
> +  do_div(parent_rate, div);
> +  clk->rate = parent_rate;
> +"
> +
> +Upstream-Status: Inappropriate [comes from upstream's branch]
> +
> +Reported-by: Peter Robinson <pbrobinson@gmail.com>
> +Signed-off-by: Peng Fan <van.freenix@gmail.com>
> +Cc: Stefano Babic <sbabic@denx.de>
> +Cc: Fabio Estevam <fabio.estevam@nxp.com>
> +Cc: Tom Rini <trini@konsulko.com>
> +Cc: Anatolij Gustschin <agust@denx.de>
> +Cc: Peter Robinson <pbrobinson@gmail.com>
> +Reviewed-by: Tom Rini <trini@konsulko.com>
> +Tested-by: Peter Robinson <pbrobinson@gmail.com>
> +---
> + drivers/video/ipu_common.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/drivers/video/ipu_common.c b/drivers/video/ipu_common.c
> +index 36d4b23..5676a0f 100644
> +--- a/drivers/video/ipu_common.c
> ++++ b/drivers/video/ipu_common.c
> +@@ -352,7 +352,9 @@ static int ipu_pixel_clk_set_rate(struct clk *clk, unsigned long rate)
> + 	 */
> + 	__raw_writel((div / 16) << 16, DI_BS_CLKGEN1(clk->id));
> + 
> +-	clk->rate = (u64)(clk->parent->rate * 16) / div;
> ++	do_div(parent_rate, div);
> ++
> ++	clk->rate = parent_rate;
> + 
> + 	return 0;
> + }
> +-- 
> +2.7.4
> +
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot_2016.03.bb
> deleted file mode 100644
> index 836b0ce..0000000
> --- a/meta/recipes-bsp/u-boot/u-boot_2016.03.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require u-boot.inc
> -
> -DEPENDS += "dtc-native"
> -
> -# This revision corresponds to the tag "v2016.03"
> -# We use the revision in order to avoid having to fetch it from the
> -# repo during parse
> -SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
> -
> -PV = "v2016.03+git${SRCPV}"
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2016.05.bb b/meta/recipes-bsp/u-boot/u-boot_2016.05.bb
> new file mode 100644
> index 0000000..57408e7
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot_2016.05.bb
> @@ -0,0 +1,14 @@
> +require u-boot.inc
> +
> +DEPENDS += "dtc-native"
> +
> +# This revision corresponds to the tag "v2016.05"
> +# We use the revision in order to avoid having to fetch it from the
> +# repo during parse
> +SRCREV = "aeaec0e682f45b9e0c62c522fafea353931f73ed"
> +
> +SRC_URI_append = "\
> +    file://0000-video-ipu_common-fix-build-error.patch \
> +"
> +
> +PV = "v2016.05+git${SRCPV}"
> 

