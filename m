Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DA9B37F2A2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 13:32:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 460Skm3ft2z3J;
	Fri,  2 Aug 2019 15:32:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564752736;
	bh=aKGI0GWeB5Lvj969MIJqDAS8t0Jgg8rTvhjbbQyEuVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fOHuXyyp5wHDRk7Z7hEzKORImuAaUYSnxRBR/fY6K10Fpn0caiX0RMMLGlLlw5mGt
	yMdk9NbPJXuvmFPgSZcAclHS8FItD+g/NIX2oCKMaxe9sgOaOA69hwa1jJB+WbsgDx
	nUfC98B33jUyjkLDxG+9PsK4NpKjhiBseUnf7bsEKUKCua6BxhtNyoV4xqhSmZfaPL
	6L0PSr9t5uEyLKXGbKypkxIjEGXDI6HcF5cSAH4sOZt7UdYYnlPBvuxdc1+cxYZ8+d
	tgtfV/h/t5PN+ltmplcPSKiCIeqNhLGYPbiR4LDc+fRqeeLBMo6pfXKPkgIC9+7hpp
	UyfujCqjNTsICmqqLMk+Tik3bF9VMwpX0Kzf/LEJ6Q1/xMlBl9NFbN8BN5ftU0E2An
	6WBzUWA6GFpsRR5HmH+uVutI1Ygu+yxLYXbrhuGduaoBh6FYtmpKKnILaqXfB05BGL
	BGszq5h3x4ltYjD/KHPNaYxTbTGx8MIII+68iW9EcDNyFdmnUxfpDtDBO2THsQx2QK
	JLLBtCKJWlZ+3Gg/ozIcdF8GBgiwCjreuQy6e8fkYcLiH3V8bP/1R+fg0ZZCMc0Qy4
	T6I6Va5kDnOMYugmnbdfk7K/SfoZWbA9Ct3qW2+WyLj6wAxkknMHfWiiuNDixGXW8o
	thc++DZI1h9sls/OZxlPEDdM=
Date: Fri, 2 Aug 2019 16:32:14 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Message-ID: <20190802133214.GA30586@localhost>
References: <20190802023435.19088-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20190802023435.19088-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libnss-nis:upgrade 3.0 -> 3.1
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
X-List-Received-Date: Fri, 02 Aug 2019 13:32:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Aug 02, 2019 at 10:34:35AM +0800, Zang Ruochen wrote:
> -libnss-nis/0001-nis-hosts-Remove-use-of-RES_USE_INET6.patch
>  Removed since this is included in 3.1.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-extended/libnss-nis/libnss-nis.bb     |   5 +-
>  ...001-nis-hosts-Remove-use-of-RES_USE_INET6.patch | 162 ---------------------
>  2 files changed, 2 insertions(+), 165 deletions(-)
>  delete mode 100644 meta/recipes-extended/libnss-nis/libnss-nis/0001-nis-hosts-Remove-use-of-RES_USE_INET6.patch
> 
> diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis.bb
> index 4fbd4b1..a1d914e 100644
> --- a/meta/recipes-extended/libnss-nis/libnss-nis.bb
> +++ b/meta/recipes-extended/libnss-nis/libnss-nis.bb
> @@ -13,12 +13,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>  SECTION = "libs"
>  DEPENDS += "libtirpc libnsl2"
>  
> -PV = "3.0+git${SRCPV}"
> +PV = "3.1+git${SRCPV}"
>  
> -SRCREV = "d4aea48657a8e90d7922574b8021ee03915a36cb"
> +SRCREV = "062f31999b35393abf7595cb89dfc9590d5a42ad"
>...

This is the actual release and not a git snapshot after 3.0,
please set PV = "3.1".

Thanks
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


