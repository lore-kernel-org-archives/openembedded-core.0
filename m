Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.1832.1620243242593093534
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 12:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EtumhQkg;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id y32so2483132pga.11
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 12:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=brzS7aeNI/FdvfIyQfZjWX+QUuVgOcRDdErWwREZUpk=;
        b=EtumhQkgNVHDlW/b5j5IzVQgMqC/lilWT4HiB7PiQWkCd5j2aKe07yRrBfnM7LHZtm
         x3WjAqeiqoyMKnw2xlrGn5Wg1s28coHA3KymGd9Yd7ounuy0irDpyejrKpXcOUnWSbIT
         IMquW7rrq6F14AOWo8XoQg3srEe6ih8awmuu4qz/D+l4BrB7dF/kMCjtTpaasViisMim
         4ofsxD9IoeOLMcMl6rbqEw4n1zMjppwtexvLsL2YgKIGi53VhlkhXEfD2VqT2FDcIZtz
         MiksD86FWrXklclMIqb6fM32gzJR+l2WfgoJSXQOgIUk8efkNebmb07RVwRFqlf8daaU
         l5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=brzS7aeNI/FdvfIyQfZjWX+QUuVgOcRDdErWwREZUpk=;
        b=dp1cB+xNcbhzNZihud9fPD/Plsuwzr4gH32uUgatgdgRdS7IxPwurzhjM/5LMU0Hpe
         +uw6G3TYzK/X+4Z9pPmYN6cTW1/98hySmKNSrR40CNc2zxteqLkcQNJ2ShdgxtQ9q4RR
         IA6Gpb3gWaRpZwVo6IqjqH310QGRWBgYWCc+Yl20IabmQBdvvxfNnNU2kPsvprb0inmo
         byUjSIwVBLWK428/Ss/h9M7OIpQYpRioYKF2Z7utRtoXUIu/hUlNBDEhft4onSRODoOi
         wvktArtb/QWchKt/8s1dywIwlCnbqv+yhqHWYoKBEyebmxRv0pgcjgW+TIbKf59g4c2L
         hKSg==
X-Gm-Message-State: AOAM532bwubs9JOqDT+Rn06dP8GZR+S6MkX1DuArJKrVgJThHoyXUN07
	kMmVV3AB6NEx6goYpSiGdF7TRSqctOX4Nw==
X-Google-Smtp-Source: ABdhPJyJfRhvylwQA25CqfP/3SlPQhn4x+tTCJ4eGGvEUud0p6JI/Wwlx5n6I38RJVyAOZ1JBsCfAQ==
X-Received: by 2002:a65:4106:: with SMTP id w6mr504547pgp.420.1620243241713;
        Wed, 05 May 2021 12:34:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:c0f3:6794:1988:a526? ([2601:646:9200:a0f0:c0f3:6794:1988:a526])
        by smtp.gmail.com with ESMTPSA id g6sm32331pfr.213.2021.05.05.12.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 12:34:01 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 02/61] go: correct upstream version check
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-2-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <d1f5adca-a9b8-f041-9bfe-088ee60477e2@gmail.com>
Date: Wed, 5 May 2021 12:33:59 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210505151850.660512-2-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/5/21 8:17 AM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   meta/recipes-devtools/go/go-common.inc | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
> index c368b95b69..ad77caeea4 100644
> --- a/meta/recipes-devtools/go/go-common.inc
> +++ b/meta/recipes-devtools/go/go-common.inc
> @@ -17,6 +17,7 @@ inherit goarch
>   SRC_URI = "https://dl.google.com/go/go${PV}.src.tar.gz;name=main"
>   S = "${WORKDIR}/go"
>   B = "${S}"
> +UPSTREAM_CHECK_URI = "https://golang.org/dl/"

I think we should revert
https://git.openembedded.org/openembedded-core/commit/?id=8470e38ac1d9f9bb6d8a4ee43724af452d080057

instead. That fix was unnessary, the problem was in AB download mirror 
which has been fixed.

>   UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
>   
>   INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> 
> 
> 
> 
> 
