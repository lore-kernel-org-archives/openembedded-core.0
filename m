Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B611EC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 08:31:08 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.4543.1645777867992329736
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 00:31:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XW8HJazN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id v21so3276001wrv.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 00:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=eS4Jk74IVIAWEho4ylGq9jlxCwqEdOP5g/2M+uP9YWg=;
        b=XW8HJazNVwXpUUI/bEAdfH1z0Kqkg+M6qHstjR9AQRSColbYij1STuupNPtRWLXdhJ
         drlFIW3TlECltaMsG6exbB/dnFYwjF1USyGyjzzHNmPw97zEE4N60aUj6RctjBeHtlUB
         UPEV4MaKL4xOMyY7a8gErylS30g3esEPhJ7YI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=eS4Jk74IVIAWEho4ylGq9jlxCwqEdOP5g/2M+uP9YWg=;
        b=JEKhqdkC/eVdNSuIC8IATA+/ZmRajjSl2qyFUZirfAcz9FqcDxgQ5aWTs8oXzcQ4e7
         1uuREH2KyBh8PawROIKkxVWdcvJ2zVKrPhCiANIvT1Z/Fgit1y+SrnEgyUT/jA9m8Ubz
         ElbW61xc7F2CcgAoiC7cjozH10o2r4oGODxHbBC6aIn/iREbhthgu+O5pgkvx/08NhlC
         xqQhKKgfcSfkWxfCyvDdQbfVAcU6jiOWNF3qQtNK1i2ytcx2eG8355cqFyW5XZ2RLXEp
         8xwqphw0GJNEY1rZ70lEniGhwV04aSltcFOyEn+lVM3+gwDrjs/84HX2jFCPwvqJ5iBC
         FSag==
X-Gm-Message-State: AOAM5316XZD+nm9bd7Xs6H4rxLtOHBeGY5uGe4J7Tr1nd6YSb7zD7i+d
	NgLc8YWp4P3QgriHzcP1SYKOZw==
X-Google-Smtp-Source: 
 ABdhPJxrX3m0ETLfwwb6HnKGJE2GOtRBf6ESS3VYlvsPEwHuqBy9zeWgbiPCPlZr46K+c381KrDGuA==
X-Received: by 2002:a05:6000:184f:b0:1e9:e816:3a0a with SMTP id
 c15-20020a056000184f00b001e9e8163a0amr5182740wri.206.1645777866250;
        Fri, 25 Feb 2022 00:31:06 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8c05:a731:3c1:5d08?
 ([2001:8b0:aba:5f3c:8c05:a731:3c1:5d08])
        by smtp.gmail.com with ESMTPSA id
 g17-20020a5d4891000000b001e74e998bf9sm1579630wrq.33.2022.02.25.00.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 00:31:05 -0800 (PST)
Message-ID: 
 <332a5358c9bba5a072d50f3661919dd2968f169d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] license.py: rename variables
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <Saul.Wold@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 25 Feb 2022 08:31:02 +0000
In-Reply-To: <20220224215533.133373-1-saul.wold@windriver.com>
References: <20220224215533.133373-1-saul.wold@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 08:31:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162342

On Thu, 2022-02-24 at 13:55 -0800, Saul Wold wrote:
> Update the comment to reflect new variable names
> 
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
> v2: Update comment and change include -> include_licenses,
>     exclude -> exclude_licenses
>  meta/lib/oe/license.py | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
> index b5d378a549b..b1105f6149c 100644
> --- a/meta/lib/oe/license.py
> +++ b/meta/lib/oe/license.py
> @@ -99,26 +99,29 @@ def flattened_licenses(licensestr, choose_licenses):
>          raise LicenseSyntaxError(licensestr, exc)
>      return flatten.licenses
>  
> -def is_included(licensestr, whitelist=None, blacklist=None):
> -    """Given a license string and whitelist and blacklist, determine if the
> -    license string matches the whitelist and does not match the blacklist.
> -
> -    Returns a tuple holding the boolean state and a list of the applicable
> -    licenses that were excluded if state is False, or the licenses that were
> -    included if the state is True.
> +def is_included(licensestr, include_licenses=None, exclude_licenses=None):
> +    """Given a license a list of list to include and a list of
> +        licenses to exclude, determine if the license string
> +        matches the an include list and does not match the 
> +        exclude list.
> +
> +        Returns a tuple holding the boolean state and a list of
> +        the applicable licenses that were excluded if state is
> +        False, or the licenses that were included if the state
> +        is True.
>      """
>  
>      def include_license(license):
> -        return any(fnmatch(license, pattern) for pattern in whitelist)
> +        return any(fnmatch(license, pattern) for pattern in include_licenses)
>  
>      def exclude_license(license):
> -        return any(fnmatch(license, pattern) for pattern in blacklist)
> +        return any(fnmatch(license, pattern) for pattern in exclude_licenses)
>  
>      def choose_licenses(alpha, beta):
>          """Select the option in an OR which is the 'best' (has the most
>          included licenses and no excluded licenses)."""
>          # The factor 1000 below is arbitrary, just expected to be much larger
> -        # that the number of licenses actually specified. That way the weight
> +        # than the number of licenses actually specified. That way the weight
>          # will be negative if the list of licenses contains an excluded license,
>          # but still gives a higher weight to the list with the most included
>          # licenses.
> @@ -131,11 +134,11 @@ def is_included(licensestr, whitelist=None, blacklist=None):
>          else:
>              return beta
>  
> -    if not whitelist:
> -        whitelist = ['*']
> +    if not include_licenses:
> +        include = ['*']
>  
> -    if not blacklist:
> -        blacklist = []
> +    if not exclude_licenses:
> +        exclude = []
>  

There is a bit of a logic error which causes the selftests to fail.

Cheers,

Richard


