Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.20850.1591294181898156294
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 11:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4535B40BCC;
	Thu,  4 Jun 2020 18:09:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XWiERMSF7AF0; Thu,  4 Jun 2020 18:09:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0AEE240B53;
	Thu,  4 Jun 2020 18:09:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6F7F417320C; Thu,  4 Jun 2020 14:09:37 -0400 (EDT)
Date: Thu, 4 Jun 2020 14:09:37 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Rahul Kumar <rahulk@mvista.com>
Cc: openembedded-core@lists.openembedded.org,
	Armin Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [meta-oe,zeus][PATCH] tremor: update SRC_URI as project moved to gitlab
Message-ID: <20200604180937.GC17660@denix.org>
References: <1591292828-25442-1-git-send-email-rahulk@mvista.com>
MIME-Version: 1.0
In-Reply-To: <1591292828-25442-1-git-send-email-rahulk@mvista.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Why openembedded-core mailing list?

On Thu, Jun 04, 2020 at 11:17:08PM +0530, Rahul Kumar wrote:
> From: Armin Kuster <akuster808@gmail.com>
> 
> It appears Xiph.Org is now on gitlab
> https://gitlab.xiph.org/xiph
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit cc6e59fdff71e47ef5b9b40aab3bcd9438960ea4)
> Signed-off-by: Rahul Kumar <rahulk@mvista.com>
> ---
>  meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
> index beeb23a..d2ad961 100644
> --- a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
> +++ b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
>                      file://os.h;beginline=3;endline=14;md5=5c0af5e1bedef3ce8178c89f48cd6f1f"
>  DEPENDS = "libogg"
>  
> -SRC_URI = "git://git.xiph.org/tremor.git;protocol=https \
> +SRC_URI = "git://gitlab.xiph.org/xiph/tremor.git;protocol=https \
>             file://obsolete_automake_macros.patch;striplevel=0 \
>             file://tremor-arm-thumb2.patch \
>  "
> -- 
> 2.7.4
> 

> 

