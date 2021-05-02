Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.25584.1619989601220315455
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 May 2021 14:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B8AlX98t;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so4627361pjh.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 May 2021 14:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lekQQotsC1AvAMJsYeGw+R5N1i96Htx8UfZYqY9B9/o=;
        b=B8AlX98tV+6jeRtC+BmR+oDQzjCy2/ID/rPHNq/IjGgcYx5qOuGZIhITqZp5M4uhj7
         awxtR/DF+mVF+iuykGZBRF2iENLbZtDmRGJegTnMt8VpayS47k72xydxURzXZA9oDZ16
         130zUezZA7tY9cgonBN//8NJL5Lz8a/9fk85jpWtpBZDqvmgBg5BtyzWJ915UlzuvN8j
         6/3OmlFBn0CHDSAMhk6F+UNlyvuu+T+aSdUAbDwqG5I2BWQI6vqdRxPZcEaxvm8QMAZe
         LOTJchFW6XxxHwTzb5prgGQDTZCqVZelsoB/7EAytV/JEGeVFI+Tbkxu+uZ3f3JeNmf2
         M3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=lekQQotsC1AvAMJsYeGw+R5N1i96Htx8UfZYqY9B9/o=;
        b=cTbSr3CcLcXDTqALWjjN84R9eeqKI3sg5bDiBF2LjlBuYIcPGWnY1EB7ug+i0U9VGO
         ZjxpayaH8ha9j4kFWr4rycIbwFQ7XGgtbPkcgas0Hc8BPH1DFoRoRbU0JvQTYLcGFeCO
         Pl3j5MbKlt5sasy3WkmDzjyZS9cEeKJHc3zW3NLuIKt8zf8rh0q42TCma72z1/4LLdKP
         D6NVYBO8II6yLiOx+Ga2V38xXxay4fv2JkUV6QqydyuZUDSn39roe3rI/HTRORDOen1H
         Qh7RhqgBwuzNJFs3q3bbPiXNS1unvjmLWqINhyb8HhI4k7GDcPtoZjbMr6NDjziMA5ss
         2x9A==
X-Gm-Message-State: AOAM531CVnBusx2g4hSi7z7xQWmUWlpwIJbp2Tsj4kio38Nuu4kPTERA
	gWIN/eA9uly3E4+gOjIbihGMt+K7Nb3FQA==
X-Google-Smtp-Source: ABdhPJwewUzq+Ku/0LSoEvS1kPzY1R1AVseV9jWYtUJeRN4FIqqkm9rv46/QwmHtsZhwb3T5UUAUtQ==
X-Received: by 2002:a17:90a:f195:: with SMTP id bv21mr27369458pjb.56.1619989600557;
        Sun, 02 May 2021 14:06:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::474f? ([2601:646:9200:a0f0::474f])
        by smtp.gmail.com with ESMTPSA id f135sm7097324pfa.102.2021.05.02.14.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 May 2021 14:06:40 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/3] ptest-runner: libgcc must be installed for pthread_cancel to work
To: Jose Quaresma <quaresma.jose@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210502175441.368688-1-quaresma.jose@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <92a0e558-be52-b9d0-77fe-58c42a308a2d@gmail.com>
Date: Sun, 2 May 2021 14:06:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210502175441.368688-1-quaresma.jose@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/2/21 10:54 AM, Jose Quaresma wrote:
> found on runqemu core-image-minimal with gstreamer ptest-runner
> 
> STOP: ptest-runner
> libgcc_s.so.1 must be installed for pthread_cancel to work
> Aborted
> 
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>   meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
> index 57a3ae005b..fe6ef2a43f 100644
> --- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
> +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
> @@ -26,3 +26,5 @@ do_compile () {
>   do_install () {
>   	install -D -m 0755 ${S}/ptest-runner ${D}${bindir}/ptest-runner
>   }
> +
> +RDEPENDS_${PN} += "libgcc"
> 

this is a workaround needed for glibc systems, we do not need this for 
musl so lets mark it accordingly

RDEPENDS_${PN}_append_libc-glibc = " libgcc"

> 
> 
> 
> 
