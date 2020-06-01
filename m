Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.41550.1591029523222032212
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 09:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UtNnUbT7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id d128so181165wmc.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 09:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=R3dekr2ap50mxYmz+0KSjQ92qtiOh9AAKpw6E/GYOEs=;
        b=UtNnUbT7Dl8U/ENCZnkuc+5P4JtuLZhMUMQc7oKQPQAIPoJJ0WnUObOQzMfZ3POUwV
         pDEdk/WI3qnd/hSoQzl+XhOg51G8G2DjR7vXWczf1fhPpJroXyIcdEl+E9e91/OCGg4/
         IQ3o8m95QSPJfd7sbVLe5UKh34h/xOmDcTEXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=R3dekr2ap50mxYmz+0KSjQ92qtiOh9AAKpw6E/GYOEs=;
        b=KcBkRmXsSEOXX2KkJJdtS8O3zn9zxWX8Gr7B0LNuDdo4M13p0uPOh2XxERzll41mIh
         KoKztJ1lUZmYsZadpUybDgzkVGJ/4jj1SayaWPZ2thZBTb0VTfXA5kQ0w91rHJ9+DGCY
         x5o4jfgV9kl5CVakFXh6Eqfl5ZstHDJtWo/lWwZZGcXQlzKYGlEP07xx5D0c0mQpnXOU
         ce9MD4y9ehvR5ULK74AyWTOO7u/n1bYiyOlOeIAyDemLtlWWVEwuASZ7cHLm8gFrNkBc
         Cn35nl2uT8Jc5Itz74yyb1jrcuIXRuVbUhr9Sn2Y0QTA3B2+UwR6d+QwzSDhVotN5X45
         zV9w==
X-Gm-Message-State: AOAM5303NBR0mAe2S7kCuR3KT+YFoBHnHAVIyMVHBk5kUbNGa7SoRtzE
	BxzjJNU+HF/KBxZRdyc+OJH33g==
X-Google-Smtp-Source: ABdhPJwBP1PXmr4nDyiGjGx9iS+BosSk5QQOb/Xmcq2ylsNjaK+Re9LLUi8DhJgAYgR1TolKNeNnSA==
X-Received: by 2002:a1c:7e52:: with SMTP id z79mr195154wmc.104.1591029521588;
        Mon, 01 Jun 2020 09:38:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id y37sm25898197wrd.55.2020.06.01.09.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 09:38:41 -0700 (PDT)
Message-ID: <234ca3dfe01ffa0108e1ee9bc73934ce5fd45141.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 14/16] bitbake.conf: Remove unused DEPLOY_DIR_TOOLS variable
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 01 Jun 2020 17:38:39 +0100
In-Reply-To: <afb301af1cc21c69d6f26f47202d399228406390.1591020366.git.steve@sakoman.com>
References: <cover.1591020366.git.steve@sakoman.com>
	 <afb301af1cc21c69d6f26f47202d399228406390.1591020366.git.steve@sakoman.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-06-01 at 04:11 -1000, Steve Sakoman wrote:
> From: "Robert P. J. Day" <rpjday@crashcourse.ca>
> 
> Variable DEPLOY_DIR_TOOLS was introduced in 2007:
> 
>   commit f751a20152c651a33f08ceda0502fa1d4f11c005
>   Author: Richard Purdie <richard@openedhand.com>
>   Date:   Wed Aug 8 21:02:39 2007 +0000
> 
>       bitbake.conf: Sync with OE.dev
> 
> apparently never used so get rid of it.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit b1f15f651461d07a8cfbd3bdcfea0e89f195212d)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/conf/bitbake.conf | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index bdade79abe..4acf235930 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -410,7 +410,6 @@ DEPLOY_DIR_IPK = "${DEPLOY_DIR}/ipk"
>  DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"
>  DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
>  DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images/${MACHINE}"
> -DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
>  
>  PKGDATA_DIR = "${TMPDIR}/pkgdata/${MACHINE}"

This does cause breakage in meta-oe (single recipe) so probably not
stable material.

Cheers,

Richard

