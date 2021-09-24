Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B156C433EF
	for <webhook@archiver.kernel.org>; Fri, 24 Sep 2021 16:13:51 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.1185.1632500030484210143
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 09:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F9NkXFXX;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 d13-20020a17090ad3cd00b0019e746f7bd4so4735228pjw.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 09:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=VC4ota5HYfSlx8A4G/nNZ8LtVTagD/UZkMFmHfRoY48=;
        b=F9NkXFXXNaFhc3v0EzoLqUQlQJZ35kn6Qek2eMnoMeElPDTX1UvekkoyI5mr2/+8N9
         0p3eER5eQSxXtZ/iNXUU0W/GnqToa7e27kOfp1gSfXqXO8ZqCh4GlHoHQeH5aNk7y/Zw
         o20tZBYN9jBR3RFD+ziOrwAXctD2kKhLsx4ZAGrU3Uc2AxT6i10rmOHdZhY7BIOKzPGP
         QCApmAhAjaCsnJVq9+3ES6s6cgAZ2cEqQiu8AigxxD0i+WHRvocOloedTH2jTpaUWvxX
         EY1Zg90RCq+Xo5aMO17BSnARChT42WUoBrcn7b/4h+qHEqSnNbk8JZOCnusznkpYL4j+
         hsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=VC4ota5HYfSlx8A4G/nNZ8LtVTagD/UZkMFmHfRoY48=;
        b=Ijfk10HzPb8lmDMKZhjDe9SVXavZ5pEL3jFf5yGGIqZzafaVs3QG4HMCByNGeK6CLg
         M9FObC+mPsnTMF+PEQIDXO72ekfYxVu4yaVWbkb+NsKnxFdIEzLxbS94Sqv4BQBOQQzY
         Nibi/3aUWSWEzKHsb8es3PffAeW5+7dlvA7LmdWXGwraZO4hfQc5grn45V48UY/HU0MD
         eXHTawCRA5gqI9chmSjNuKV/wICAu8KtVVkY3vap3MZ8ovyCjHBYT/D4MTQ6AaXQiux9
         tuTC+YmOvUWNk5wVdVhTh8+AIw7NjsLte9pzCm00wxTvwqENjJsAk0m3zvLXjxpCv9iL
         nBxg==
X-Gm-Message-State: AOAM530E9uzd2P0TPRKAGbkrYf70ZjMsDrh6qVfE98DHM+TNZJ0hDokH
	kXxtYr/VZgsx1hSw6Sgtr2aJfsEwCQOnZw==
X-Google-Smtp-Source: 
 ABdhPJwPLVjKcbh1YoXGG3sRPab23ay+O2ibtUzub145rK1O5+QYVb8XzkC1w8q1n49v2c7nhxUHbQ==
X-Received: by 2002:a17:90b:3e84:: with SMTP id
 rj4mr3247465pjb.208.1632500029810;
        Fri, 24 Sep 2021 09:13:49 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:1dda:37cf:b1d6:5d51?
 ([2601:646:9200:a0f0:1dda:37cf:b1d6:5d51])
        by smtp.gmail.com with ESMTPSA id
 x8sm2426497pjf.43.2021.09.24.09.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Sep 2021 09:13:49 -0700 (PDT)
Message-ID: <e4219cb9-b82f-9e27-f5f5-957451284564@gmail.com>
Date: Fri, 24 Sep 2021 09:13:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.1
Subject: Re: [OE-core] [PATCH] bzip2: Update soname for libbz2 1.0.8
Content-Language: en-US
To: Tom Pollard <tom.pollard@codethink.co.uk>,
 openembedded-core@lists.openembedded.org
References: <20210924113352.63175-1-tom.pollard@codethink.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210924113352.63175-1-tom.pollard@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 16:13:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156332



On 9/24/21 4:33 AM, Tom Pollard wrote:
> Set shared library name as libbz2.so.1.0.8, version in configure.ac
> already synced via do_configure PV substitution.
> 
> Signed-off-by: Tom Pollard <tom.pollard@codethink.co.uk>
> ---
>   meta/recipes-extended/bzip2/bzip2/Makefile.am | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/bzip2/bzip2/Makefile.am b/meta/recipes-extended/bzip2/bzip2/Makefile.am
> index 7338df03eb..d12d3a45e4 100644
> --- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
> +++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
> @@ -1,6 +1,6 @@
>   
>   lib_LTLIBRARIES = libbz2.la
> -libbz2_la_LDFLAGS = -version-info 1:6:0
> +libbz2_la_LDFLAGS = -version-info 1:8:0
>   

this will need attention everytime upgrade is done and we might forget 
it again, perhaps inserting it via do_configure_prepend might work out 
better.

>   libbz2_la_SOURCES = blocksort.c  \
>                       huffman.c    \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156293): https://lists.openembedded.org/g/openembedded-core/message/156293
> Mute This Topic: https://lists.openembedded.org/mt/85836699/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

