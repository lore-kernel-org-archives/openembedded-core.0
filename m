Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.4361.1610729296647272589
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 08:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VzcwHRX/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id a9so6485477wrt.5
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 08:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=srUdZtW30tjis3xySsZGtZsuM0qA8g1Clzt0toJUXDk=;
        b=VzcwHRX/QQsY616TB0IL/IRdhBd6EPlgzbKNhtjzWKS9k7z3YhsUuOLvEnZprQsAYf
         Ragiszh7TzH4WooyZqOZY7OFEOHi3/4ItlUyQX98bx/QwDU7Zha4SJQ8WdiCFlmSNf9Q
         XkpbPYV83GN/QnygPAkk7XVUd/WI0GybBV9R8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=srUdZtW30tjis3xySsZGtZsuM0qA8g1Clzt0toJUXDk=;
        b=ssylzM3TMkjkW7yhTnVCrFK7FdSPloTpYri++YvfMcDu5tVqpcN+FS8a+5HfyoZkQF
         iCsuhI+y0klzu+YKslHC7H5cnnPf7kHkM0E/t9LybZJRs/Xm3cCwe6qgXKwer8ngmxuQ
         aFF7hWTJsO2JGi3aTBgx0xovoKcGlagce0+kLnFLP+f9qVOigRVtTRE/H6jZSWpIANA+
         ZR23gsxY34IAMF9GKfsEpwFPFo9byPYtK6ySszEea60yhC+jvcdb0cKBvR4O1nfG0WqC
         24M99INACNgkM1pOtYdpgoU2JpG3zzOMkFJfHK2qIS1+koYvMmjswkuJ5iH8aX5Ar9sk
         JWnQ==
X-Gm-Message-State: AOAM533T1PRiqNkNMqU0NZnRlrGlTjzvG1JVwN/8W03VKIs3Ms8mz6Cd
	VfOHGAFQusYLE6MUhIzcflN4XA==
X-Google-Smtp-Source: ABdhPJy4782sHuVdN23X9a/xE4oZe3SN72FEiHWfmhfIDFWDtnFMMu9HwnDOBqng3q89xlC1TT1SrQ==
X-Received: by 2002:adf:f78e:: with SMTP id q14mr14037347wrp.320.1610729295264;
        Fri, 15 Jan 2021 08:48:15 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:974a:2423:c71:b423? ([2001:8b0:aba:5f3c:974a:2423:c71:b423])
        by smtp.gmail.com with ESMTPSA id u17sm12817297wmj.35.2021.01.15.08.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 08:48:14 -0800 (PST)
Message-ID: <49b9decc4cf96646d8bb616931548966ac9f37f6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH][dunfell][gatesgarth][master] zip: whitelist CVE-2018-13410 and CVE-2018-13684
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@bmw.de>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 15 Jan 2021 16:48:13 +0000
In-Reply-To: <20210115104807.40671-1-mikko.rapeli@bmw.de>
References: <20210115104807.40671-1-mikko.rapeli@bmw.de>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-01-15 at 12:48 +0200, Mikko Rapeli wrote:
> https://nvd.nist.gov/vuln/detail/CVE-2018-13410 is disputed and
> also Debian considers it not a vulnerability:
> 
> https://security-tracker.debian.org/tracker/CVE-2018-13410
> 
> http://seclists.org/fulldisclosure/2018/Jul/24
> "Negligible security impact, would involve that a untrusted party controls the -TT value."
> 
> https://nvd.nist.gov/vuln/detail/CVE-2018-13684 is not for zip, also Debian concludes this:
> 
> https://security-tracker.debian.org/tracker/CVE-2018-13684
> 
> "NOT-FOR-US: smart contract implementation for ZIP"
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  meta/recipes-extended/zip/zip_3.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
> index c00a932763..47e6fc5278 100644
> --- a/meta/recipes-extended/zip/zip_3.0.bb
> +++ b/meta/recipes-extended/zip/zip_3.0.bb
> @@ -19,6 +19,9 @@ UPSTREAM_VERSION_UNKNOWN = "1"
>  SRC_URI[md5sum] = "7b74551e63f8ee6aab6fbc86676c0d37"
>  SRC_URI[sha256sum] = "f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369"
> 
> 
> +CVE_CHECK_WHITELIST += "CVE-2018-13410"
> +CVE_CHECK_WHITELIST += "CVE-2018-13684"
> +

Where we're adding these can we put a small comment in as well just
saying why we're whitelisting it?

I appreciate the info is in the commit but I think its important enough
to list in the recipe as a comment too.

Cheers,

Richard

