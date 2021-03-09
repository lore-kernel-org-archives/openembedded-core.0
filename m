Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.11957.1615308648333307454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 08:50:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QqrnTNTE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id t5-20020a1c77050000b029010e62cea9deso7176336wmi.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 08:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gHS4DCUw7Kq6z90sudjw9Hm5PkKT1GI8X8EYPPGb4xc=;
        b=QqrnTNTEPXbsCcXpKrm/2JevHda2KxG7/t0sdJrgBDwfmmyB0BnlKskESLGEeFJcJ7
         2G0fGIei7/cIAjNGmgZKw38BCVp5K9oN1/qTo9b7lirZNwwFth1yEJdMxJLU3eoTXB97
         YtSk6xZRd/kZ5jegffNNIwJ5XkT34E5IIjUBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gHS4DCUw7Kq6z90sudjw9Hm5PkKT1GI8X8EYPPGb4xc=;
        b=qQAqzAmKj1Nz8O9a7onya/H7xabU8PDeyzGPvFCwikg0ene24u4bWWiwfl7fd9PLtj
         np9w2LGnSm1/mphXRrnEJHCbprPypqMxA46W3hc99nUUWp9ILMBEZHB8o/zQeGUxQHNn
         iPN4iUNbbEVNFGLVHjriiQNPN6ZHngjn5H/LoCS3ODQMQ0Kqh1aRf9z0NVYkEGhD2SeH
         7y+WmTLQkZcNdpvSj4/wbvegTy0h/Z0ggPJTkrX5y98kivhlD3p2pfzj+oTyGCKgFGpz
         jmOEhvweBGjT5Sb83LD1RB/k42omQVlksQTnIG2DpB0a9te22EiQEMdkf5pJUsxyTzuY
         wfcg==
X-Gm-Message-State: AOAM53204CUuAzd0adWqbeD4cWhDXGORtwqI05HjGvmMtaEvTGGkGo2A
	daBK4eyy8tOEPGLlU8bjQ8C43A==
X-Google-Smtp-Source: ABdhPJyfY7uNDeeEK8jNzkKZJ+02NfWy0GMXW6QhrE+eRGpWU9jzZafV6IYV9Nu7E7EHA7lW7fWxZQ==
X-Received: by 2002:a7b:c34a:: with SMTP id l10mr5050652wmj.46.1615308646749;
        Tue, 09 Mar 2021 08:50:46 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e1d9:50e9:2ad6:a226? ([2001:8b0:aba:5f3c:e1d9:50e9:2ad6:a226])
        by smtp.gmail.com with ESMTPSA id a17sm5447755wmj.9.2021.03.09.08.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:50:46 -0800 (PST)
Message-ID: <0169fb3a33bdab139ff206d122cc7db96b829308.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] mingw: Remove 'nativesdk-glibc-utils' for windows sdk
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Anmolbir Mann <anmolbir.mann@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Date: Tue, 09 Mar 2021 16:50:45 +0000
In-Reply-To: <20210308214228.1682-1-anmolbir.mann@windriver.com>
References: <20210308214228.1682-1-anmolbir.mann@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-03-08 at 13:42 -0800, Anmolbir Mann wrote:
> From: amann <anmolbir.mann@windriver.com>
> 
> Certain recipes require the "glibc-utils" recipe to include Glibc utility tools.
> However, the native version is incompatible with the Windows host, and thus these
> recipes will cause the Windows SDK to fail to build, particularly the kernel
> development recipes.
> 
> [YOCTO #14286]
> 
> Signed-off-by: amann <anmolbir.mann@windriver.com>
> Signed-off-by: dreyna <david.reyna@windriver.com>
> ---
>  conf/machine-sdk/include/mingw32-common.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/conf/machine-sdk/include/mingw32-common.inc b/conf/machine-sdk/include/mingw32-common.inc
> index bc6c91e..0109e75 100644
> --- a/conf/machine-sdk/include/mingw32-common.inc
> +++ b/conf/machine-sdk/include/mingw32-common.inc
> @@ -24,6 +24,7 @@ SDK_PACKAGING_FUNC = "do_compile"
>  SDKUSE_NLS = "no"
>  SDKIMAGE_LINGUAS = ""
>  SDK_DEPENDS_remove = "nativesdk-glibc-locale"
> +SDK_DEPENDS_remove = "nativesdk-glibc-utils"
>  
> 
>  SDKPKGSUFFIX = "nativesdk-mingw32"
>  

I think meta-mingw patches need to go to the yocto mailing list with
[meta-mingw] in the subject.

Cheers,

Richard

