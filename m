Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.13574.1619797472609302714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 08:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JIYIv+qQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id d11so13221220wrw.8
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Apr 2021 08:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=9ofgVjUQPTENWVfEiF4xs+3Gpp7fqiRwF01VrjkPzZM=;
        b=JIYIv+qQ531kXZRkpmu13sHlEzAka4g/j88hE66g6/xvufuK3WFrr3iacTR7apOvFp
         nA+/xCVBI9w40S7XtfThLSVHufG2lhqKdRhZIgl0+JvYiXdgNyC2CAPnSAFeBXXa++8Y
         4l0EhOcFnSFLyytrcXx3cWZ1hDjAt9ZAI3uRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9ofgVjUQPTENWVfEiF4xs+3Gpp7fqiRwF01VrjkPzZM=;
        b=U0HhRgmcVHxR0YXtyjEulUFk4X56c4TMoB6DZnEOhKFeSx6jis/UnnXXu2ZIAzfVL2
         3FEY/c62DeOlRQdrfqLImv2ohESqX0GyJkkasbhEkRY0ikuZuSL8r0BNW0v8VBxbpfaR
         takhyXzjZbUTzCBFTIVxqbIOOEO+WeO0xls+NrximetWzy4IfpQWRdGOXvzTbyY282L3
         /tVK8P1ZX52wuNaQhGeC8C6FqNJWd7iV2vYTYOCfQyM4kOWfi0DGZmDk4jQrGtCF/GUI
         CGbL6//U2NV4oXMeTDROzGatgi29eQhiaemEtLQgfJ3FM+cptYZr/f/8yKy4noAKlSWJ
         dbMQ==
X-Gm-Message-State: AOAM533INt9BD5NQfbybXHPuFzR33BdMUWmLblckbC7tA9xIRjswbIW5
	ooR2fFAqajQXIExLPqC9wZoRFQ==
X-Google-Smtp-Source: ABdhPJyXTWOBFOyyow1ZvFdli9k9ASZHGwlyeMmkDA94cT0ruvSAbI/JvLs9Svb+Ai/G2BVqWwC6Iw==
X-Received: by 2002:adf:b301:: with SMTP id j1mr7817218wrd.301.1619797471102;
        Fri, 30 Apr 2021 08:44:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:38ed:4baa:ed1c:e489? ([2001:8b0:aba:5f3c:38ed:4baa:ed1c:e489])
        by smtp.gmail.com with ESMTPSA id b12sm2799892wro.28.2021.04.30.08.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:44:30 -0700 (PDT)
Message-ID: <01250a308dc7b262963fae41d95c0f1d68b455e6.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 07/12] go: Use dl.google.com for SRC_URI
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 30 Apr 2021 16:44:27 +0100
In-Reply-To: <327b83f6460dc069f22e1ce68f09af12d25ce4bb.1619796615.git.steve@sakoman.com>
References: <cover.1619796615.git.steve@sakoman.com>
	 <327b83f6460dc069f22e1ce68f09af12d25ce4bb.1619796615.git.steve@sakoman.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-04-30 at 05:33 -1000, Steve Sakoman wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> golang.org/dl is resolving to this anyway
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 8470e38ac1d9f9bb6d8a4ee43724af452d080057)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-devtools/go/go-common.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
> index 39a681a712..c368b95b69 100644
> --- a/meta/recipes-devtools/go/go-common.inc
> +++ b/meta/recipes-devtools/go/go-common.inc
> @@ -14,7 +14,7 @@ LICENSE = "BSD-3-Clause"
>  
> 
> 
> 
>  inherit goarch
>  
> 
> 
> 
> -SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main"
> +SRC_URI = "https://dl.google.com/go/go${PV}.src.tar.gz;name=main"
>  S = "${WORKDIR}/go"
>  B = "${S}"
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"


We are seeing autobuilder issues with some go downloads which we may want to
resolve before merging this.

Cheers,

Richard

