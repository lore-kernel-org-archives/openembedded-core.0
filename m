Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3520.1630537208035187020
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 16:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D027F40C5E;
	Wed,  1 Sep 2021 23:00:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lB1crEJ7FGgW; Wed,  1 Sep 2021 23:00:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A122F40C06;
	Wed,  1 Sep 2021 23:00:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BCBC3174673; Wed,  1 Sep 2021 19:00:02 -0400 (EDT)
Date: Wed, 1 Sep 2021 19:00:02 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com,
	saul.wold@windriver.com
Subject: Re: [OE-core][PATCH 19/31] tzdata: Remove BSD License specifier
Message-ID: <20210901230002.GR1528@denix.org>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
 <20210901134510.29561-20-JPEWhacker@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210901134510.29561-20-JPEWhacker@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Can license cleanups in patches 19-31 be submitted as a separate patchset, 
independent from SBoM changes?


On Wed, Sep 01, 2021 at 08:44:58AM -0500, Joshua Watt wrote:
> The code in question is licensed under the BSD-3-Clause license, so
> including the generic "BSD" license is unnecessary.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-extended/timezone/timezone.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
> index a89560b424..c7d4965cb8 100644
> --- a/meta/recipes-extended/timezone/timezone.inc
> +++ b/meta/recipes-extended/timezone/timezone.inc
> @@ -3,7 +3,7 @@ DESCRIPTION = "The Time Zone Database contains code and data that represent \
>  the history of local time for many representative locations around the globe."
>  HOMEPAGE = "http://www.iana.org/time-zones"
>  SECTION = "base"
> -LICENSE = "PD & BSD & BSD-3-Clause"
> +LICENSE = "PD & BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
>  
>  PV = "2021a"
> -- 
> 2.32.0
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
