Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web10.6572.1594301104316510580
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 06:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4B2cNY5DFFz5tl9;
	Thu,  9 Jul 2020 15:25:01 +0200 (CEST)
Date: Thu, 9 Jul 2020 15:25:00 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Christian Eggers <ceggers@arri.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libgcc: Set LICENSE for -lic package
Message-ID: <20200709132500.prkhj3xqowdhcavu@qschulz>
References: <20200709131734.30235-1-ceggers@arri.de>
MIME-Version: 1.0
In-Reply-To: <20200709131734.30235-1-ceggers@arri.de>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christian,

On Thu, Jul 09, 2020 at 03:17:34PM +0200, Christian Eggers wrote:
> The default license (GPL-3.0-with-GCC-exception & GPLv3) is not suitable
> for installing libgcc-lic on an image where INCOMPATIBLE_LICENSE is set
> to "GPL-3.0".
> 
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> ---
>  meta/recipes-devtools/gcc/libgcc.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
> index 6d48ec9809..372da46459 100644
> --- a/meta/recipes-devtools/gcc/libgcc.inc
> +++ b/meta/recipes-devtools/gcc/libgcc.inc
> @@ -35,6 +35,7 @@ PACKAGES = "\
>  LICENSE_${PN} = "GPL-3.0-with-GCC-exception"
>  LICENSE_${PN}-dev = "GPL-3.0-with-GCC-exception"
>  LICENSE_${PN}-dbg = "GPL-3.0-with-GCC-exception"
> +LICENSE_${PN}-lic = "GPL-3.0-with-GCC-exception"
>  

Not really directing the question to you but... does this actually makes
sense? Is the license licensed? Can't we just empty LICENSE_${PN}-lic or
not check the license for this package? That might be something that can
be done in the license.bbclass for example.

Nothing else to say though on that particular patch :)

Quentin
