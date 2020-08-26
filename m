Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.5772.1598478860566005235
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 14:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ILun6Ymw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id a65so3321823wme.5
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 14:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=CjoGDggd0iYRin59uxFvpO0o4vqmfh7LCLzTp9BY37c=;
        b=ILun6YmwtS6sfuQYBCjEQVqrp0ZiWzWO7fNklUkHIEH+76ocT7NP4MlmZ7v7Lu5jNr
         miCeBDbvgkFSi1eImef/39ELwjwdA1xqVxnPNB0WrEan5f9oxSiWNKT3FCqQy5rsV2jU
         35mPl+TJZdvOBv1RGfh9Eg2uCPzv2FW8Kr/ZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=CjoGDggd0iYRin59uxFvpO0o4vqmfh7LCLzTp9BY37c=;
        b=okwqfCuhv27XzgPPm5SKF4CIX3m79+UsDOGldZQayAGTrNJXzQHWvzY05K879GVIZ7
         OYTP+tEHV2tb7KXiU1yBoPlzM6SGQKe30BESKI0osRsTEgY3AJqgaEQu5PZN9oANZYah
         zZrnqsm9bfXvx1ZExMJe1v3E+VUK6RZ4HdnkWt4k2evZhCudDdWLCnHR1Rjk+AMjuerz
         FGinThdC4xydqjJg3pj8GzrsJ2cnT7c6io/BeDxGCZo6U5zoQpC9opmQKtB4CRizKfpy
         uth+XefZXqArwdWqBxa/Y5vzPQ/225VAtX6wbOCRwKE4EpGYxdXwU9vikk8JADxCWpg7
         VJgQ==
X-Gm-Message-State: AOAM530pSz6J/bmCaWbAaSPGMoHJVHCLWpq1qEc3PsEGuL9ckPdvFuN8
	CE615L9Wy8AC13pTh82UUJVRAA==
X-Google-Smtp-Source: ABdhPJzWPc0YxQ3BWWJARgTAMToYgpBnPIWVonHf27Fxg2M4+QLJUex4yf9wALd6VOoCCeejgrz3zQ==
X-Received: by 2002:a7b:c14e:: with SMTP id z14mr9052445wmi.34.1598478858683;
        Wed, 26 Aug 2020 14:54:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id d7sm942210wra.29.2020.08.26.14.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 14:54:18 -0700 (PDT)
Message-ID: <c4c42c27c9da65d0f10db765d1be67831af3939a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH] util-linux: Set license for pylibmount sub package
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Adrian Freihofer <adrian.freihofer@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Wed, 26 Aug 2020 22:54:16 +0100
In-Reply-To: <20200826161345.1792249-1-adrian.freihofer@siemens.com>
References: <20200826161345.1792249-1-adrian.freihofer@siemens.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-26 at 18:13 +0200, Adrian Freihofer wrote:
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  meta/recipes-core/util-linux/util-linux_2.36.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/util-linux/util-linux_2.36.bb b/meta/recipes-core/util-linux/util-linux_2.36.bb
> index 2fac9793a2..7476e60784 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.36.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.36.bb
> @@ -6,12 +6,13 @@ disk partitioning, kernel message management, filesystem creation, and system lo
>  
>  SECTION = "base"
>  
> -LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
> +LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause & LGPLv3+"
>  LICENSE_${PN}-libblkid = "LGPLv2.1+"
>  LICENSE_${PN}-libfdisk = "LGPLv2.1+"
>  LICENSE_${PN}-libmount = "LGPLv2.1+"
>  LICENSE_${PN}-libsmartcols = "LGPLv2.1+"
>  LICENSE_${PN}-libuuid = "BSD-3-Clause"
> +LICENSE_${PN}-pylibmount = "LGPLv3+"
>  

I have a feeling this resulted in meta-gplv2 breakage:

https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/2371

which we need to figure out before this can merge.

I also wondered how come to not have this license listed in LICENSE in
the first place :(

Cheers,

Richard

