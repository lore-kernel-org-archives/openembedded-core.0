Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web11.17761.1590168199634813214
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 10:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sXhILdLc;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id v15so5075771qvr.8
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 10:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=d0lEIOayVuik8jU7Lut17krv305CyddCOn7e9V++sLI=;
        b=sXhILdLcA1o9tkC9zV7ZnwLfrPH85QLrG5Z3yOifKcqw566gQziwBRJzo1PT0A+kAd
         BDi5ICRVzYpHVYdk6zf3zzhYNQ6wAhYEMIYtGvSE63QezAYjDt632RNBeccj+NDUqgAU
         NDT2XtmQ78DH9mrXcf7gv/crjy7czVXtWCWAIvXBPwzYn7SWRrwrwiHeEtGS0jKryPey
         4vy4QUnjCC1QxkoJ0XCSify/ZXHG7x5Aj/XMWx020wzAOcj4Vr70RHc9vPcWnYBRReTe
         RO54LXXhYX4LGnCyH9LnVHPaYyn5kAyBRKbrnjqxRcxEbS2a1RtkOdZIHRM6jHx7N8GW
         v0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d0lEIOayVuik8jU7Lut17krv305CyddCOn7e9V++sLI=;
        b=sBY+vny3caKFLaSB0bQPBJ5gai7RK3kcd44DiBqRGCUrNPlaODvJAcFnKjEfkdw9hy
         zImnbaJ6qktmpLKw8UeO6oaBMVcw/EOaBWK2mVHjqmt3FPzYJ2XxjUmWgA46hDibXmEL
         /rNkZdxcBOlqC8CjnLAACz/TkMk7SMxcdNimXP28aBKuA+AmdrTEyHRPc5nKx0mOF9wf
         cSLkEPitZwkMnePXYJMNXSGBTLVdQqUIkC0ankiLJ1iEZzu//8loX8+wdoQWz5mehR5u
         jdSjXgFcB8OnxWsUSX5LeCWKe49ASjyRR+HrBOc1WMGYfy0UtC8nI7XjKK4nhUKPCj8o
         4nfg==
X-Gm-Message-State: AOAM533peJiUyBN2jOcyLKiFyUJQuEjI8ZCZhKkDw89lssM8LHce/c2l
	mG5pnjGufm2OXtpcHOD8NlZeazacQbA=
X-Google-Smtp-Source: ABdhPJyfaxditVF1se5CKxpkTUdfGq2D0m71eT3RoPoFLH/dXYGoEnKay6CwpfNEkHY4jQH/k0m0jA==
X-Received: by 2002:a05:6214:445:: with SMTP id cc5mr4845548qvb.161.1590168198185;
        Fri, 22 May 2020 10:23:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5914:2d44:c49:9698? ([2601:646:9200:4e0:5914:2d44:c49:9698])
        by smtp.gmail.com with ESMTPSA id s55sm8825084qtb.92.2020.05.22.10.23.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 10:23:16 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/4] go-mod.bbclass: Add class for `go mod` support
To: openembedded-core@lists.openembedded.org
References: <20200522022237.3568393-1-otavio@ossystems.com.br>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <cec06eb1-084c-84e6-01f2-eae056f9e47b@gmail.com>
Date: Fri, 22 May 2020 10:23:15 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522022237.3568393-1-otavio@ossystems.com.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/21/20 7:22 PM, Otavio Salvador wrote:
> When using Go Modules, the the current working directory MUST be at or
> below the location of the 'go.mod' file when the go tool is used, and
> there is no way to tell it to look elsewhere.  It will automatically
> look upwards for the file, but not downwards.
> 
> To support this use case, we provide the `GO_WORKDIR` variable, which
> defaults to `GO_IMPORT` but allows for easy override.
> 
> [YOCTO #13883]
> 

This series looks ok

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
>   meta/classes/go-mod.bbclass | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>   create mode 100644 meta/classes/go-mod.bbclass
> 
> diff --git a/meta/classes/go-mod.bbclass b/meta/classes/go-mod.bbclass
> new file mode 100644
> index 0000000000..5871d02506
> --- /dev/null
> +++ b/meta/classes/go-mod.bbclass
> @@ -0,0 +1,20 @@
> +# Handle Go Modules support
> +#
> +# When using Go Modules, the the current working directory MUST be at or below
> +# the location of the 'go.mod' file when the go tool is used, and there is no
> +# way to tell it to look elsewhere.  It will automatically look upwards for the
> +# file, but not downwards.
> +#
> +# To support this use case, we provide the `GO_WORKDIR` variable, which defaults
> +# to `GO_IMPORT` but allows for easy override.
> +#
> +# Copyright 2020 (C) O.S. Systems Software LTDA.
> +

Do you also want to add license on top along with copyrights ?

> +# The '-modcacherw' option ensures we have write access to the cached objects so
> +# we avoid errors during clean task as well as when removing the TMPDIR.
> +export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS} -modcacherw"
> +
> +inherit go
> +
> +GO_WORKDIR ?= "${GO_IMPORT}"
> +do_compile[dirs] += "${B}/src/${GO_WORKDIR}"
> 
> 
> 
> 
