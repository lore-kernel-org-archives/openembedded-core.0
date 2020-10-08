Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web10.620.1602115405659803149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 17:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BFd+KptG;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id y14so2672073pgf.12
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 17:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OjpRBxT4Bho4/mpjB2wDTzDFu6PjYNBiLabFu0RhmRk=;
        b=BFd+KptGs9NKfb4xIlC6txeiVMWrnjUuPYpw/lqW972gRJvWNnS905TfnQLdUziw9L
         7zh2N0aEltim3OJvimt/eO+tb9ixeVQnzHv07DSaRghMl58drvvAQK2tViTbrDQd4dT1
         u7NWMjfAyn3O94U17sW5O5ENsKI0uS5zAjWI1L5ItCgDngbESzVLX6fPA22lmcpU/IDX
         3th8p8pzobz9RAdyEWTuOwYXjNRoJG983ZZxWkG9lxNGIATA6apCNY3btQd2vtdDS2LA
         f9r0eJ4tY6wuIbVY6NcPnwpnyEd5N2QIyQcYgfMX/TzZR4OTtXcmBOwOq1/545IGdtBK
         zQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=OjpRBxT4Bho4/mpjB2wDTzDFu6PjYNBiLabFu0RhmRk=;
        b=LTVB/j5aHyFoydJ6cqncqwrekwJ88vHtiy7P6M+3ZCVeFbfsYPSIS1AWBp/dqXmGPi
         mv+eJY5PIEVhuZRn7BF9VSAgNgcgjHPKdIk/oPWrvxKlCW3diiiSi3DnsU6l3SCBt7X5
         0wUyRtSdkpmfc26sp58oRKrp3b7CFhX6A2cLybD7Su41Yc/LgaTB2p/x6V6880pSWcGy
         H4cjsN2i3FaG+8Ai3svm0tiJvytQ10vCPU7578TvPQV8ydwlZO8LEAVS+EBO9tXcg4Do
         uJJjPbPv/64owiY0n3YXqtTPLDEznQTYW2ldX8xv0UAMXALQoQeJueccv0qYuu9tAy8h
         Gi2A==
X-Gm-Message-State: AOAM531/yXTF3eNzdpuXXFfSjR6J4ZMkqPtiqNv/O91efryskC0o1QPK
	WjsmA3ZOYqSoNvmKy7GJt+R7k1p/T8Ul6g==
X-Google-Smtp-Source: ABdhPJxkLrleiwA0DX0a2IjWt10wfs/oVyDzPs3lFkQv/hPz8XU8Cz9vamlF5ZFzHoK353SrLUSRjA==
X-Received: by 2002:a63:f90a:: with SMTP id h10mr4915994pgi.361.1602115404813;
        Wed, 07 Oct 2020 17:03:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:f80d:4abb:99ae:980? ([2601:646:9200:4e0:f80d:4abb:99ae:980])
        by smtp.gmail.com with ESMTPSA id d8sm3850021pjr.46.2020.10.07.17.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 17:03:24 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/2] coreutils: improve coreutils-ptest RDEPENDS
To: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
References: <20201001161111.2889773-1-ross.burton@arm.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <d447e81c-0a31-6a9b-cd70-eb4545a5e9a7@gmail.com>
Date: Wed, 7 Oct 2020 17:03:22 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201001161111.2889773-1-ross.burton@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 10/1/20 9:11 AM, Ross Burton wrote:
> Add perl-modules to the RDEPENDS to avoid having to list all perl
> modules that are required, as this package isn't going to be installed
> outside of testing builds.
> 
> Remove libmodule-build-perl from RDEPENDS, it appears that this isn't
> needed anymore. With and without this package the test results on my
> image are the same: 619 tests, 462 pass, 154 skip, 3 fail.  This
> *drastically* reduces the build impact of enabling ptest as
> packagegroup-core-build-essential (thus target gcc) is in the dependency
> chain.

what changed that helped in removing this dependency

does this mean we dont need [1] now


[1] 
https://git.openembedded.org/openembedded-core/commit/?id=5463971d45b21512210cf20f3902baf95eacd4c6

> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-core/coreutils/coreutils_8.32.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/coreutils/coreutils_8.32.bb b/meta/recipes-core/coreutils/coreutils_8.32.bb
> index f8ae3fd94c..9d1eceef54 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.32.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.32.bb
> @@ -158,7 +158,7 @@ BBCLASSEXTEND = "native nativesdk"
>   
>   inherit ptest
>   
> -RDEPENDS_${PN}-ptest += "bash findutils gawk liberror-perl libmodule-build-perl make perl perl-module-file-stat python3-core sed shadow"
> +RDEPENDS_${PN}-ptest += "bash findutils gawk liberror-perl make perl perl-modules python3-core sed shadow"
>   
>   # -dev automatic dependencies fails as we don't want libmodule-build-perl-dev, its too heavy
>   # may need tweaking if DEPENDS changes
> 
> 
> 
> 
> 
