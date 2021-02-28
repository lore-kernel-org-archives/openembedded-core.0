Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.1502.1614537348459860782
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 10:35:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GiE/ScVA;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id s23so10155990pji.1
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 10:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0gXFNc1WCFUA1l8jzZzMyGwlo7WXWqX79pNcByITwUk=;
        b=GiE/ScVAtGFDpROssWD/YhNuw9SzsKWXfQAG1b6PGA8vyREcZGusJ/VyfrnnNuCNep
         nPaF+vKigk9vbeO+n02Wfzh9bLpFGFRV9AgXs9FPknq7Oqwf2QOSjILJvad//YBwbqJ/
         kB20hu/J7Il6uH3YqcZKP+cr5g23S7EJtABjAhRpE+jxQ87tcpv3ZzncXEAvqsFv6zX3
         ymm/W1QbkATL1SdA/F6yfXO8IjvWdqZoIpe5m1jRUE9+LFmbQd2AQWvS4P1S8maoDymZ
         WYF0N5SExBDJJVW3XYiPGzuX2B5bYCqgjpZMVUhSS658SfX2fqopa23pf4B6SpkGkDxz
         oJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=0gXFNc1WCFUA1l8jzZzMyGwlo7WXWqX79pNcByITwUk=;
        b=HviIyN1sJ+Dj1tIuKMNaYrG25ZwZhbheU4YRXPWhrGsheKb5MBGTxoAzPYS0vmKRi7
         3xxBwT7aL7D6WUcV+3+eQYgjmFk2aoWa4X0MlAvCiS5DmxpHIfFEAyfjbE+1cw3Lzawz
         hS8ZiwbEQNAoH7uzHMbLx7giCPzxjzmVELFNbVo/nItBptR8bOWc/ohC5gD9KjOiIPfs
         ICnIEUFkyX5jLabKui+HXvkchXOIgW2InLno66p7crCmzAiHtBQFSrxBI8xtssRuAtBf
         wB1Dt0uyDfq4xYEEWUoPi9Dr1QatUc+aVb9v+1J+TtpZ6E4Jeb7NQ1Hou8t+0pLdXtQL
         Xtpw==
X-Gm-Message-State: AOAM5329wIrWkmTaYr9QNNqV0JlZzlsRvpQ/hs1jQIgc6IRREX1/KKzu
	TA1LljwoE+qw6HmqP7T8k2/W6oNZ1u6DKw==
X-Google-Smtp-Source: ABdhPJxikSi9wNlalm2XteL0HARUjg86LYv3E9Ljlf/yTvddrIG/FTNIG16y+LMiW8i6n5BSpfIw6g==
X-Received: by 2002:a17:90a:3b0e:: with SMTP id d14mr3786121pjc.198.1614537347576;
        Sun, 28 Feb 2021 10:35:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::5d43? ([2601:646:9200:a0f0::5d43])
        by smtp.gmail.com with ESMTPSA id a23sm2392641pfa.142.2021.02.28.10.35.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Feb 2021 10:35:47 -0800 (PST)
Subject: Re: [OE-core] [PATCH 02/24] bmap-tools: upgrade 3.5 -> 3.6
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
 <20210228153702.498275-2-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <23dd5c64-4658-f00b-1775-46de9674a4d5@gmail.com>
Date: Sun, 28 Feb 2021 10:35:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210228153702.498275-2-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/28/21 7:36 AM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   .../bmap-tools/{bmap-tools_3.5.bb => bmap-tools_3.6.bb}       | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-support/bmap-tools/{bmap-tools_3.5.bb => bmap-tools_3.6.bb} (89%)
> 
> diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb
> similarity index 89%
> rename from meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
> rename to meta/recipes-support/bmap-tools/bmap-tools_3.6.bb
> index fd57f8f7f0..95cf00804d 100644
> --- a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
> +++ b/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb
> @@ -11,13 +11,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>   
>   SRC_URI = "git://github.com/intel/${BPN}"
>   
> -SRCREV = "a17f0e3ff8669dd3b1c44a741ae4f8162155faed"
> +SRCREV = "c0673962a8ec1624b5189dc1d24f33fe4f06785a"
>   S = "${WORKDIR}/git"
>   PV .= "+git${SRCPV}"
>   
>   UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>   
> -RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptools python3-fcntl python3-six"
> +RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptools python3-fcntl python3-six coreutils"

what needs coreutils at runtime ? and which utilities

>   
>   inherit python3native
>   inherit setuptools3
> 
> 
> 
> 
> 
