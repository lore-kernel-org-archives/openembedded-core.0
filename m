Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.4319.1587641317595189077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 04:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JtB6nov4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id f13so6369930wrm.13
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 04:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Msarm+KBTbTcXpyvdvh6+b8/ban7Z4WkpMLwbqib04E=;
        b=JtB6nov40NBjeGy0KOxkJ82+IbXyl1WhKnUaq6+5R3waOcfashf7B8oXTDhrtDQYkn
         5mu7AIdOx+Bqrte6TLk6ZRf/9fp3GcYa6Sy+DYTbR3qzhQ4mm9pF9R3M8yULQt+0k6uM
         8RoBSY/rWxlJSDFFDkSTj9FKHM9HCr2eSO920=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Msarm+KBTbTcXpyvdvh6+b8/ban7Z4WkpMLwbqib04E=;
        b=mW4ivj1cSt0UokLRTrASaCkTL8q0H0pr0OIKJWfDvG7wNY5WOf6qM4e78wk+P0HLCT
         SE0cUix5VXvdW/WY+Ef8yncu4AaBkN/UI+X88KwkRVJJqsbU5rxo76fK34Lfj18ZcGZG
         Zhl2x/ZLDIxJRevhdBLSCkEOIqcgChpCRTqCz6rEY4yORT+GK53+/ZmL7Zy/QD/phvVe
         9lK5/7+iy8j2maoho6csDVGEPLkh88PpTpRYEaI+xMu+kcihoxamJYRGlmStPNPjOoqB
         8x9iCeBpSsFFffGtn0hw8+ty3sjdVe6BdDlJ2inS9WVsWLCH9g5ado/bH7HR0+/zT/G1
         fcXQ==
X-Gm-Message-State: AGi0PuaXmtx6QdW9vdjPM+AlahEbM33CuLFDvJ6+K1acpM79fDCSLFkg
	BNDWEYrUv6hZlWcChfMhWiyXwA==
X-Google-Smtp-Source: APiQypKFbE14ALK1GTgFzpMpazemE8FCYRWNOSplciwf6m3SxiSq+v+u0INHWLOE8ALn4iBZg0l23A==
X-Received: by 2002:adf:e58e:: with SMTP id l14mr4262743wrm.186.1587641316003;
        Thu, 23 Apr 2020 04:28:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id z1sm3277972wmf.15.2020.04.23.04.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 04:28:35 -0700 (PDT)
Message-ID: <64068ee723a3a7d767ab88efab4378c3c4e0658e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libsolv: upgrade 0.7.10 -> 0.7.11
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2020 12:28:34 +0100
In-Reply-To: <20200422200258.84579-1-wangmy@cn.fujitsu.com>
References: <20200422200258.84579-1-wangmy@cn.fujitsu.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-04-22 at 13:02 -0700, Wang Mingyu wrote:
> From: Wang Mingyu <wangmy@cn.fujitsu.com>
> 
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../libsolv/{libsolv_0.7.10.bb => libsolv_0.7.11.bb}            | 2
> +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-extended/libsolv/{libsolv_0.7.10.bb =>
> libsolv_0.7.11.bb} (94%)
> 
> diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
> b/meta/recipes-extended/libsolv/libsolv_0.7.11.bb
> similarity index 94%
> rename from meta/recipes-extended/libsolv/libsolv_0.7.10.bb
> rename to meta/recipes-extended/libsolv/libsolv_0.7.11.bb
> index 265a27c00d..764eb0df88 100644
> --- a/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
> +++ b/meta/recipes-extended/libsolv/libsolv_0.7.11.bb
> @@ -10,7 +10,7 @@ DEPENDS = "expat zlib"
>  SRC_URI = "git://github.com/openSUSE/libsolv.git \
>  "
>  
> -SRCREV = "605dd2645ef899e2b7c95709476fb51e28d7e378"
> +SRCREV = "102ac552669181d3e43731aa275bdbbc7ddcb94c"
> 
This doesn't work:

https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/1798
https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/701

and many other failures.

Cheers,

Richard

