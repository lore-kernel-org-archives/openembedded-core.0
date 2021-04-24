Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.1114.1619283519141602756
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Apr 2021 09:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vMdiq3B4;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id u15so18184872plf.10
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Apr 2021 09:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=rwvfgWNWemNDU/wcgooOnONWCR8fg7dUDyoRFYeovbA=;
        b=vMdiq3B4bihBowdTTcp7rhq7VWIfMhv3PsPkBdJC+sr2ge4AAMQ8PyzoJZjAOalapn
         7fd3SJd77m0inhglgKUixiDYqozKFEenxKfz+UD3uUwLdisnIcuw9cFOAsKA1sfMrPH2
         H7csbrzmyNPz67EdlxQxPgEX+//KhR3AhFHVPvEVkYLp3k5JSfGwtDrw/dijVjNGo+Z4
         yydUgFyg1wDPc0z8VEFTmk5F94w+YoYcFhezx2r7CBAUZgIxrTYWSXLilwwH9+jbXG4z
         M01Bg8bD5CTpG/qkh0V4pIgM0HWqcIB+Z+f9Wr6XfgRdDZWyFS/Go4urkwxnf+ya9/XF
         05Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rwvfgWNWemNDU/wcgooOnONWCR8fg7dUDyoRFYeovbA=;
        b=MdHtex+GlAKt3cV+Nav3M8QDRvvWqm5UPVgEQ8D5rdTfu9rPcEVqUu022wghi89pwI
         wcdeBzqZjT/7YzBzHLBByfUZN6WTzuvRwu/z+PD2GlBfOGaq/IQS/Vo0CRR6amZ8MTQZ
         LMA0/HZE4QCa6aoAGI6fHjByMBWtIvJMr5JW32bY2ALqVb6Evp1xXLLwUQcE4WiqH9xL
         vGtWZkz6pgingPqmk5Lvo0K2aEwQa/fyBW0GrS8Uz5pp8cxxBGO7NzBStm/GLKJM0LRl
         YP9BJr8e625nYbhmYRcUHhZknF+ZhqEZ3FP9/4lONlJJ+i7uHyGbu9X+sMiRXfJejyoX
         W4RA==
X-Gm-Message-State: AOAM5339uvFA2J73Kyiu+fd0uMSIKY3Enx8Ypvc6q6HnKD8aX2Jq5dfd
	Ka+v8VR6V/3tf16QSsl3k2v8sP9mFYN/IA==
X-Google-Smtp-Source: ABdhPJxNpqqhf0G8vfneD9nd1Y19ccJJ947bAcvDXHJjtqmQqx97O09DYOC5VqI/wvC6O6CDnhxUVQ==
X-Received: by 2002:a17:90b:198c:: with SMTP id mv12mr10827408pjb.51.1619283518552;
        Sat, 24 Apr 2021 09:58:38 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:9c11:697b:fdac:256e? ([2601:202:4180:a5c0:9c11:697b:fdac:256e])
        by smtp.gmail.com with ESMTPSA id r5sm10049327pjd.38.2021.04.24.09.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Apr 2021 09:58:38 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] libseccomp: Add MAINTAINERS entry and HOMEPAGE
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210424165657.1650447-1-richard.purdie@linuxfoundation.org>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <98a0de85-3a41-3652-6d11-bce58b41c1e3@gmail.com>
Date: Sat, 24 Apr 2021 09:58:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210424165657.1650447-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 4/24/21 9:56 AM, Richard Purdie wrote:
> Add entries for the migrated recipe to passify the various checks.
shoot. You even mentioned it to me.  Man, getting old...

thanks
Armin
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/distro/include/maintainers.inc            | 1 +
>  meta/recipes-support/libseccomp/libseccomp_2.5.1.bb | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index abf1d451045..4eb1dcb0d53 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -378,6 +378,7 @@ RECIPE_MAINTAINER_pn-librepo = "Wang Mingyu <wangmy@fujitsu.com>"
>  RECIPE_MAINTAINER_pn-librsvg = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-libsamplerate0 = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER_pn-libsdl2 = "Yi Zhao <yi.zhao@windriver.com>"
> +RECIPE_MAINTAINER_pn-libseccomp = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-libsecret = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-libsm = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-libsndfile1 = "Unassigned <unassigned@yoctoproject.org>"
> diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> index 667d5da8242..98b2639742b 100644
> --- a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> +++ b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> @@ -1,5 +1,6 @@
>  SUMMARY = "interface to seccomp filtering mechanism"
>  DESCRIPTION = "The libseccomp library provides and easy to use, platform independent,interface to the Linux Kernel's syscall filtering mechanism: seccomp."
> +HOMEPAGE = "https://github.com/seccomp/libseccomp"
>  SECTION = "security"
>  LICENSE = "LGPL-2.1"
>  LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357ceb8e7c37f989f"
>
> 
>

