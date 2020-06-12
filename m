Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1188.1591997159896371902
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 14:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3A50640C06;
	Fri, 12 Jun 2020 21:25:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9plcrA0p14OY; Fri, 12 Jun 2020 21:25:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1641940A35;
	Fri, 12 Jun 2020 21:25:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7280D17320F; Fri, 12 Jun 2020 17:25:56 -0400 (EDT)
Date: Fri, 12 Jun 2020 17:25:56 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Otavio Salvador <otavio.salvador@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [OE-core] [PATCH] mtd-utils: Fix return value of ubiformat
Message-ID: <20200612212556.GT17660@denix.org>
References: <20200612180809.107139-1-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <20200612180809.107139-1-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 12, 2020 at 03:08:09PM -0300, Otavio Salvador wrote:
> This changeset fixes a feature regression in ubiformat.  Older versions
> of ubiformat, when invoked with a flash-image, would return 0 in the
> case no error was encountered.  Upon upgrading to latest, it was
> discovered that ubiformat returned 255 even without encountering an
> error condition.
> 
> This changeset corrects the above issue and causes ubiformat, when given an
> image file, to return 0 when no errors are detected.
> 
> Backport fix from 2.1.2
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
>  ...-utils-Fix-return-value-of-ubiformat.patch | 62 +++++++++++++++++++
>  meta/recipes-devtools/mtd/mtd-utils_git.bb    |  1 +
>  2 files changed, 63 insertions(+)
>  create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-return-value-of-ubiformat.patch

^^^

> diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> index 810fe40f4e..a13240d61c 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> @@ -15,6 +15,7 @@ PV = "2.1.1"
>  SRCREV = "4443221ce9b88440cd9f5bb78e6fe95621d36c8a"
>  SRC_URI = "git://git.infradead.org/mtd-utils.git \
>             file://add-exclusion-to-mkfs-jffs2-git-2.patch \
> +           file://mtd-utils-Fix-return-value-of-ubiformat.patch \

^^^
Was it tested? The patch name doesn't seem to match the file name.

-- 
Denys
