Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E41707D89E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2019 20:02:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44j2bL3mlkzLC;
	Sun, 14 Apr 2019 22:02:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1555272126;
	bh=7UuK7EvOGLsDzB5b9jc4dZTK4jwiRBw+rxcrVlzMST0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fvPQH+SIno5fcX/DZrOtZoCnhWR5ud7B6J1pMrLTj3ljEVIcx0Bamqi9hLN3YIVQI
	UniM1ca6srQm6i6CSGuYq2U58WEz4VYnLOEgePZIDwR+OFTOLZfXwGplqye25e5Rwt
	yv754fPx1ORon7sN/NItBrqaFsySc5QKiPi6PtQR78Sa75orqr0CO3tQRmce+o70Eo
	Ji75GgJcfYp2TBiYTDbLuDTuLgfDmRKQkSrr2qY785uS25TTuBcZQr5xEBkZlJrWQx
	Bq0mpk/Wn4ihEuJb8Ye3zC/Hu+RjG3m8kZs5sbP70zv9KOCi/7SDrfiTYkd/kaddbq
	ZUcetLHJjhr8NxxcbfzjAxv12vmWXHwZf9hA+7SIORba/BgDUti8+WGSrzyIe93SE/
	b5Z4R44LgXwXDHkpOtM9Kl0Naq+5IUc1owjLItZiCOIiCVQsO4qHlm+TzSJp4LYMS5
	uFzMMDg5ezUhi46oZ2/LLmjtxGlG/FBBebtJJBteB5tIrjE63z/0bwdDqC2SlLUj28
	lAhQNusbqIkV+XkE9RzPdtOCp55pqVMwhJsUb2tFlm0iqvHnZPZx0dexh6s5fpVuAA
	skOT8lOJD6UP4d5Y8+/IdprmwcJpfSgHnOsssJQMRVDFLASmKL4LL0PxFQrFnuAeKx
	5EkRCHj8wtOaoN4o9Y68T0OI=
Date: Sun, 14 Apr 2019 23:02:03 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20190414200203.GA15428@localhost>
References: <20190414124701.3530308-1-enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <20190414124701.3530308-1-enrico.scholz@sigma-chemnitz.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dhcp: fix isc_boolean_t patch
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
X-List-Received-Date: Sun, 14 Apr 2019 20:02:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Apr 14, 2019 at 02:47:01PM +0200, Enrico Scholz via Openembedded-core wrote:
> There is a copy & paste error in 5775e9ef2fce1d0b9860602f1065bb1e09bc1b61
> which breaks dhcpd.
> 
> Cc: Armin Kuster <akuster808@gmail.com>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  ...1-dhcpd-fix-Replace-custom-isc_boolean_t-with-C-standa.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-connectivity/dhcp/dhcp/0001-dhcpd-fix-Replace-custom-isc_boolean_t-with-C-standa.patch b/meta/recipes-connectivity/dhcp/dhcp/0001-dhcpd-fix-Replace-custom-isc_boolean_t-with-C-standa.patch
> index d2e57714cd..fa3d9c4e1f 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp/0001-dhcpd-fix-Replace-custom-isc_boolean_t-with-C-standa.patch
> +++ b/meta/recipes-connectivity/dhcp/dhcp/0001-dhcpd-fix-Replace-custom-isc_boolean_t-with-C-standa.patch
> @@ -1816,7 +1816,7 @@ Index: dhcp-4.4.1/common/options.c
>   {
>   	if (universe->save_func)
>  -		(*universe->save_func)(universe, options, oc, ISC_FALSE);
> -+		(*universe->save_func)(universe, options, oc, true);
> ++		(*universe->save_func)(universe, options, oc, false);
>   	else
>   		log_error("can't store options in %s space.", universe->name);
>   }

Nice catch.

The root problem is that OE is carrying an own huge patch,
instead of using the much simpler and shorter upstream fix.

I'll send a patch to replace it with the upstream fix.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


