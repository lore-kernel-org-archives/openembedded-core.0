Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34316.1795355988131167125
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Nov 2026 05:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=XpWElT0W;
 dkim=pass header.i=@valla.it header.s=default header.b=egAaxre9;
 spf=pass (domain: valla.it, ip: 185.56.87.7, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-lgmz.prod.antispam.mailspamprotection.com; s=arckey; t=1795355988;
	 b=mPluR6S3ZmWYwE3dblmSzJ2eSY9rOs9iImGFh6B8vl2B8qaWjf3XL7cv3jUdCJILP6b38vM5ra
	  Ni0XR7ZOyK659GDr8GZuwT5cKLTiuCSANKuEgC8gQiXEmCghOkCRnHOJmOcWRYvn8kTZhEMOWK
	  xXhFNuQojCsAAEpYMAlgREiQgU3P6jRCnLQZNbLlguUJoh/q6/PcNzUgw8kB+uuzFGG4zxgtvW
	  QOxzuW5cM8N2KdUybRdBWnqNLoEE5wugToGFj48RyLhsC+TKCH3y1D4+3ILiTvi2aBRjrTh1Q6
	  AKugVQZOKRyS74aNFQ0Gt4ESiJvQhYML4RD3gcVgVG/waA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-lgmz.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-lgmz.prod.antispam.mailspamprotection.com; s=arckey; t=1795355988;
	bh=aG8653TcXSqIzpFZI1Xom8TAD9xaNSrimnbaQeFHsYU=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=iPd/D/pneO6jn1dvecSayKfxcT5xK8ex2HoMuuiDMh1zl7dL0uF0rq8w5fiwEm5wosAz3QeI3E
	  2JhOKTODr4X3AThdCev3FlnKAHwxT1OnytP2pI17cUEfs9dVx4O/ef6SD5qvFEzaw+Et1pTqP5
	  7txNIi+4UOYsqxIQrvXuhPpwiS8Px7PapRVgZ9j4voeG2s7p2u1Ad+kVsM4Xla70FXqTbjTfSR
	  hXY6Ii1RYlbZxOiwY9sU5tHMzGt1FnhSIFpQSSWK9VKB/4hHPs8cigFjym8wFaADE5DM0CLPWW
	  0//701CwZG1pPeePbDt7H4gcj304fCpCoyVXPnHvIRcLVw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=+LVWG7Gai9K2JDodo9Gy49kZ05GhDMzCUAaRMRRskLc=; b=XpWElT0W9HIpV9c5pzWO0+zT9t
	Dg1HuKjdPSQiAUqG6vJqLfEiBIkOmvu9eNXzVHx0W44GJBu39HWVnTJJxsvMMotzXR5ErfjN9wxqh
	m3SXXsYNYPQSR8OCKKFUixfQknHkznBfUM6bHlXEmSSNt6JW0V35i56wQoXvLyT7cSSY=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-lgmz.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xV86b-00000003Pn8-3VrC
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Nov 2026 13:59:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=+LVWG7Gai9K2JDodo9Gy49kZ05GhDMzCUAaRMRRskLc=; b=egAaxre9vN1Tiu4i4h+UOYEg1P
	SvN/J4TLYyX5J3GWba12m/f99XpaGF0gzVZQPFlokXq13DsrxX0lE/zTOBhIH3AXA4pDoElJyXWrm
	+vsWfIqod+AEf1MGwwAlTYWYu0BzvNHlvCI28lTvFIi7v6IIeY0vMA6Nldizz9iGl6Yw=;
Received: from [95.251.96.187] (port=59176 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xV86X-00000000IkU-0OWR;
	Sun, 22 Nov 2026 13:59:41 +0000
Date: Sun, 22 Nov 2026 14:59:39 +0100
From: Francesco Valla <francesco@valla.it>
To: Saeed Nourian <saeednourian82@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com
Subject: Re: [PATCH] image-fitimage: fix typo in FIT_LOADABLE_COMPRESSION
 example
Message-ID: <awL0yFwLXZKpndOn@bywater>
References: <20261122123324.585452-1-saeednourian82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122123324.585452-1-saeednourian82@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: e19f619815d654596cd965058ffad1e3
X-AntiAbuse: ID - e19f619815d654596cd965058ffad1e3
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xV86b-00000003Pn8-3VrC-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-lgmz.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 13:59:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250869

Hi Saeed,

On Sun, Nov 22, 2026 at 04:03:24PM +0330, Saeed Nourian wrote:
> The example sets FIT_LOADABLE_COMPRESSSION[atf], but
> kernel-fit-image.bbclass reads FIT_LOADABLE_COMPRESSION, so the
> setting would be ignored if the example were copied as is.
> 

Oops, my bad, thanks for spotting it and sending this fix.

> Signed-off-by: Saeed Nourian <saeednourian82@gmail.com>
> ---
>  meta/conf/image-fitimage.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
> index a06d30e494..eaf9120bbb 100644
> --- a/meta/conf/image-fitimage.conf
> +++ b/meta/conf/image-fitimage.conf
> @@ -91,7 +91,7 @@ FIT_UBOOT_ENV ?= ""
>  # Example:
>  #   FIT_LOADABLES = "atf"
>  #   FIT_LOADABLE_FILENAME[atf] = "bl31.bin"
> -#   FIT_LOADABLE_COMPRESSSION[atf] = "none"
> +#   FIT_LOADABLE_COMPRESSION[atf] = "none"
>  #   FIT_LOADABLE_DESCRIPTION[atf] = "TF-A firmware image"
>  #   FIT_LOADABLE_TYPE[atf] = "tfa-bl31"
>  #   FIT_LOADABLE_ARCH[atf] = "arm64"
> -- 
> 2.43.0
> 

Reviewed-by: Francesco Valla <francesco@valla.it>

Regards,
Francesco

