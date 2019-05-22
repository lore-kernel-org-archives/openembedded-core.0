Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B9F957E294
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 22:03:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 458RTy0k8cz9W;
	Thu, 23 May 2019 00:03:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558562614;
	bh=1+cBOhWrC0zyr01TA/3dcJNpSwFM6RZzbekVEf+FzfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MSkgQAuEQi2CCySx5mckkWdJrpYGvcOxBATxXzNNO9sdNaKVmWoX10l0s1Y92v5pT
	N2Pz3N29vLjVUIRF5NbB3YX92F2oLxMv1X82B2w6HVBsPfcOj0QdiHj3uhrQ38vfR7
	iRdxPuf1+erNrFKXqhEiu4gj+mCqSHsCURLlH900aTC5FnWn773hjtl50tHGx2Emr4
	M+1NvJ86RzZM1+TwS5KgyTXpUgFe3BVf98o0DtwIxaYIslrlvPMn17k4UbAOfxOERR
	ex0H8wzGfQZyHYsxLJs9SKBMmWo0sNIMKzee2mc80fp5MZP9HQTCFsRXsoSy6T5lps
	QcJ3ZSzpyoGm25LnedLXImQDq8Xvn2QyXkfXIigfTkS2YLL4qzryE/qEmSHRPliWRM
	Cjcr7erNmj6kAaOJb5ao/gQ+/SHhBa6lBMh64YIIL9e+2SQ+eHKF/4/1W+oAY5tIp1
	LbHwA9ILIcGXabFDPVwpf+Pm4sXW5yMGZBCEPXeSRDuEFYd9i1JAn5mImXHFiVTY3L
	bhqMwmt1r7maG27xviuba+kYzj4/siWSN8avHgMj8V52oXrCjcYkQxZE/WpLRwxrtf
	9kXy20JCxu1OWXI+gUfmUoSYNx03N393Tly5fgPI7+/6Ci9lzvnODXnCRkPWqrRief
	rCUZwBc3pQLe1q2a42p1ak6k=
Date: Thu, 23 May 2019 01:03:31 +0300
From: Adrian Bunk <bunk@stusta.de>
To: David Frey <dpfrey@gmail.com>
Message-ID: <20190522220331.GA4681@localhost>
References: <20190522215541.9689-1-dpfrey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190522215541.9689-1-dpfrey@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bluez5: remove udev dependency
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
X-List-Received-Date: Wed, 22 May 2019 22:03:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, May 22, 2019 at 02:55:41PM -0700, David Frey wrote:
> udev is an optional dependency of bluez5, so use PACKAGECONFIG to allow
> users to decide if they want udev support.
> 
> Signed-off-by: David Frey <dpfrey@gmail.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
> index aaf2af975d..568de86d6d 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -6,7 +6,7 @@ LICENSE = "GPLv2+ & LGPLv2.1+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>                      file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
>                      file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e"
> -DEPENDS = "udev dbus-glib glib-2.0"
> +DEPENDS = "dbus-glib glib-2.0"
>  PROVIDES += "bluez-hcidump"
>  RPROVIDES_${PN} += "bluez-hcidump"
>  
> @@ -43,6 +43,7 @@ PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
>  PACKAGECONFIG[deprecated] = "--enable-deprecated,--disable-deprecated"
>  PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c ell"
>  PACKAGECONFIG[btpclient] = "--enable-btpclient,--disable-btpclient, ell"
> +PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
>...

Unless there is a good reason to do otherwise, this should be added to 
the default PACKAGECONFIG so that the set of features enabled by default 
stays the same.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


