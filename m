Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.10705.1599697447800800925
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 17:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uM3Hs3sg;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id g29so3294165pgl.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 17:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HI+0fwe79G2+kb5e+Jm2WU9fiAgNqT9hs7KiI/bIn9Q=;
        b=uM3Hs3sgZWNc3W5tY01UDBnrIKlgvEfSnpnnjk2pUzS/frSbiw/vTKwa8zL+fWbN9V
         yJ5+rQOpRy/FXDYmK/i/pqGU4XacrRXq7WU+vj6ZBR3iRg1re1bXx+sYstet66ROsjwZ
         OzLq6p+fdQNV9RCfL7VbqG+GnWkIt+Ng6ekoGoCp5DmOZoQKxi8p37Eu01amH/CI5dRJ
         L1JpE1MZrF1qbzpdECBjIF5cVtlECZKhplRDJWUVcVN1P0lFL8l7NOV4kG7T2/yFOtAW
         e2BHpMyt8/idP1pFFLtfk5KL5q3ouxj09+PrqbQyQzzgasozgcgZP94g/7PQ3TC2d0Nt
         9Ycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=HI+0fwe79G2+kb5e+Jm2WU9fiAgNqT9hs7KiI/bIn9Q=;
        b=XXPqf7UXG3vNPdc6RGxnvzkMKovb4IqmgoWDTsvXtVE5ufNn+LsNoLkEbNVivxZNjC
         ng6UA457oVVZHYKR8syPCgJs4T4wr3w2N6mQFr6igLRamxiLgXtE0P2MchgHqSFDAMHY
         O7cUhUtGp4veFEhfs3Fl8iNRTHsBjq8ekfXnGXyPDBZ2XVm3OUd1aLh/KRmRHBQtt4QZ
         nrw+JTtUhqQoXExsK7ua5RZvL9q9/v/2fUxQA5lkvkX8AjFR0tTUdcu2GZXFoNgX9PQX
         mAyQaVEUcOQAL8mxB/L2gm/aKR7Sc7sL5oBGH83Q5KfgL24rNTR0WZEYfcPHWwYrCGtN
         0jlw==
X-Gm-Message-State: AOAM530xlgahO7g7DYQz/FYjxXPNHA3JUO7esqyfohNrgZ9ot4cvbLHA
	ouhWK2lwxRc7BmdKncLv1As=
X-Google-Smtp-Source: ABdhPJxNkCIBhpwawtns3nKj3HabaSo82MNedYh1Qaq+yZlQV5Ro4iCqtdnYu763HbFR9VogsHtnEw==
X-Received: by 2002:a63:6b08:: with SMTP id g8mr2507781pgc.325.1599697447287;
        Wed, 09 Sep 2020 17:24:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::ff6e? ([2601:646:9200:4e0::ff6e])
        by smtp.gmail.com with ESMTPSA id a16sm3193813pgh.48.2020.09.09.17.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2020 17:24:06 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] cryptodev: bump 1 commit past 1.11 to fix 5.9-rc1+
To: Denys Dmytriyenko <denis@denix.org>,
 openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@ti.com>
References: <1599688063-38109-1-git-send-email-denis@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <a1c03ca8-5c09-ee52-7912-42c560ca689c@gmail.com>
Date: Wed, 9 Sep 2020 17:24:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599688063-38109-1-git-send-email-denis@denix.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/9/20 2:47 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> There's one commit on top of 1.11 release that fixes builds against kernel 5.9-rc1+.

since we call the recipe as 1.11, perhaps its better to explcitly apply
this patch via SRC_URI or alter PV to reflect this SRCREV changes,

> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta/recipes-kernel/cryptodev/cryptodev.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
> index 906f4fc..c050eda 100644
> --- a/meta/recipes-kernel/cryptodev/cryptodev.inc
> +++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
>  SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux \
>             "
> -SRCREV = "2299d39475e91392abd050ea09f2d20feecb4adf"
> +SRCREV = "fabe5989a3dc9fba0cd0a40b612247cdde351c01"
>  
>  S = "${WORKDIR}/git"
>  
> 
> 
> 
> 
