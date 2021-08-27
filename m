Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.6534.1630061918349643117
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 03:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dBFFtwVY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id u16so9781948wrn.5
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 03:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=sKCmkCvNk71tsuFF3+Vm9ioYNM4TSk7DLKUOhyonx2g=;
        b=dBFFtwVYL4RAPYesxUo6U3Hth4arMTuWgwnObmlPClpsswKMqiNePuprSKL+4sO802
         cdHHzb4Jo0uSp9yjE8tb4NuMtMlw/R0I0ChalWkvaQL6ujOD33VkdUg5DVKJuIP1lJFQ
         6avmCzU4PxVt7tc8QEvU9fKAJhns6/u3j8PSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sKCmkCvNk71tsuFF3+Vm9ioYNM4TSk7DLKUOhyonx2g=;
        b=cOtskvbb2gWaGLYZVVc1ZU3Ww0exrRvzvh1IveWDQj2frJBJEWuBPDSqYD7JXCPvyC
         kStHdvb9X+CcGklmDsb9zMMBXITX/f2A0xWjFq0yEzvy4gIFC3XY3gOWzCXMXqFMebzm
         r4aaOfQeerWrnluBD2qeg6ioKEJuQrkGlJ1rwFhU+azepnlxpu7Rg7cPvJ5ENljOHIgr
         XI7owgR7LZL+xiyNJUM5wYIdnjS8YWY64HfdEAcC3uTzHNPUIJhEfw3gACe8+RoOUS2+
         JvvMT9IvLXlfACZ34YRduk5GACGBwUFdz+xL7pM7tLcFe549MfZ0VnU9iTAm7BO5Hq92
         Z3VA==
X-Gm-Message-State: AOAM531k5zBAspHlQQdfk0EOkZXQPUbXf5mmV6RIMnODWPKSLbLDOksO
	aojjFGG4jPf9PtlJFTF86OSB6g==
X-Google-Smtp-Source: ABdhPJy97jBYi91hC/g0UGTmEiXEFhzxJqC4CwkFSzVIY1VXXaYOHZR/THDeUJFR4meOgocaC09aRw==
X-Received: by 2002:adf:db83:: with SMTP id u3mr9797875wri.363.1630061916756;
        Fri, 27 Aug 2021 03:58:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5262:687a:b257:b6af? ([2001:8b0:aba:5f3c:5262:687a:b257:b6af])
        by smtp.gmail.com with ESMTPSA id l2sm12285086wmi.1.2021.08.27.03.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 03:58:36 -0700 (PDT)
Message-ID: <6c720428bb74edcb0b05825786075d6a0261e1df.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master][PATCH] lz4: remove rest of ptest artifacts
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 27 Aug 2021 11:58:33 +0100
In-Reply-To: <20210827020936.3700558-1-akuster808@gmail.com>
References: <20210827020936.3700558-1-akuster808@gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-08-26 at 19:09 -0700, Armin Kuster wrote:
> Commit: 953f6d9a71 lz4: remove ptest changes
> 
> missed removing the run-ptest file
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
> 
[...]

> diff --git a/meta/recipes-support/lz4/lz4_1.9.3.bb b/meta/recipes-support/lz4/lz4_1.9.3.bb
> index 3905ef7dbc..74f6743b91 100644
> --- a/meta/recipes-support/lz4/lz4_1.9.3.bb
> +++ b/meta/recipes-support/lz4/lz4_1.9.3.bb
> @@ -13,7 +13,7 @@ PE = "1"
>  SRCREV = "d44371841a2f1728a3f36839fd4b7e872d0927d3"
>  
>  SRC_URI = "git://github.com/lz4/lz4.git;branch=release \
> -           file://run-ptest \
> +           file://CVE-2021-3520.patch \
>             "
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
>  

I think the addition should have been in the previous patch. I've tweaked them.

Cheers,

Richard

