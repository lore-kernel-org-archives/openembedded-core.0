Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.1864.1614539098516797544
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 11:04:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JMEOJnyl;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id d2so10194236pjs.4
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 11:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jLVNmcUJKfpsno0sWNkAXzGGPEBRA6L+1nnaiRd+7NQ=;
        b=JMEOJnylx0pIVpiZZ7XGsVuJeQU/aij5KTQSRc3+wnPOyYCPyOTmZGFkVAm7Rksw9p
         Twci1KAISEZriWSFtLupb/WFRwX6fIpuiCddnTMsNiRfC5PNREqpLKB6wpZfhf+TaWFo
         i9ZSnxg0orWi9IFAUMtmA+5xWNT7pVdDlndd33nh6aQIEan6BfF6LQDpyhoZ45kY33iA
         4smOzOZmI0Vjq5A7es9efqq/BsMSKSLY/8kTg3NiXHpxCk5Fcudra1N0UIwTww+xohIF
         pLb9upbdbQ84YaIpbfNTm4/2XCzHlDHFlXuuf8h1oFUEfq1k8Mb7FUulzdMVgyz5LTVi
         odSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jLVNmcUJKfpsno0sWNkAXzGGPEBRA6L+1nnaiRd+7NQ=;
        b=r1T6t/Wa+tKTDwMygH19fGxN25r4ajZ44uz3qjdVzIQrlY0cCZx+89AH1MrzR9HmDZ
         HUg9MRKRt+vWNz0WVOMXzJKzHy7wvg4Zh/8SH5FfzSaaef3EUMUW/g1zOPFXzBdEq1p+
         F1VPTF/3ZDoVuYxIrLng9/NAlJTcOKD7HAabRtR9Yb1EgkgEPm9B1qxJ/HM0Qs9NsgxJ
         Rl7jalT8wo4TUwy0xbcuY2C0M74klHdHPiYYfY7DTCOMom0oNtRBJCrOVRTRmmWLVp5D
         xg2MMdso+CwhLGMffHeQixZWFBxf4tYE0RnqR4tvTLuH3ET9aFDxmlVRSY8ZRGsbVqa/
         2lAw==
X-Gm-Message-State: AOAM533KuBYy5xRraNftMWcU94/88MgUtRzV9K/+luHMKLCp+rD3prV9
	UA72S7g4Ws4V5WILmpV7glB/1hz+M3UZJA==
X-Google-Smtp-Source: ABdhPJzvYNP5yB+nWYSqOAIgN50zMu0vm0aiHYX6rw7i8majFw2BuiefFNFvUOdG52CrtJ6vcsXgqg==
X-Received: by 2002:a17:90a:7108:: with SMTP id h8mr12944559pjk.98.1614539097522;
        Sun, 28 Feb 2021 11:04:57 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::5d43? ([2601:646:9200:a0f0::5d43])
        by smtp.gmail.com with ESMTPSA id q34sm14421124pgl.92.2021.02.28.11.04.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Feb 2021 11:04:57 -0800 (PST)
Subject: Re: [OE-core] [PATCH 08/24] libdnf: update 0.55.2 -> 0.58.0
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
 <20210228153702.498275-8-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <9d7090a0-433c-42e0-98b9-9be7dd0c2cba@gmail.com>
Date: Sun, 28 Feb 2021 11:04:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210228153702.498275-8-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/28/21 7:36 AM, Alexander Kanavin wrote:
> Sdd a patch to fix musl builds.
> 
   ^^^
typo here

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   ...h-include-the-correct-header-on-musl.patch | 31 +++++++++++++++++++
>   .../{libdnf_0.55.2.bb => libdnf_0.58.0.bb}    |  3 +-
>   2 files changed, 33 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-include-the-correct-header-on-musl.patch
>   rename meta/recipes-devtools/libdnf/{libdnf_0.55.2.bb => libdnf_0.58.0.bb} (93%)
> 
> diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-include-the-correct-header-on-musl.patch b/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-include-the-correct-header-on-musl.patch
> new file mode 100644
> index 0000000000..734521bb3f
> --- /dev/null
> +++ b/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-include-the-correct-header-on-musl.patch
> @@ -0,0 +1,31 @@
> +From 8cc7ada0161a7af38351d1e70516975402f3c5c5 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Fri, 26 Feb 2021 18:37:41 +0000
> +Subject: [PATCH] libdnf/config.h: include the correct header on musl
> +
> +Problem reported at https://github.com/rpm-software-management/libdnf/issues/1146,
> +but this patch isn't quite the fix.
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + libdnf/config.h | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/libdnf/config.h b/libdnf/config.h
> +index 16121f6f..51623ce4 100644
> +--- a/libdnf/config.h
> ++++ b/libdnf/config.h
> +@@ -18,7 +18,12 @@
> +  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> +  */
> +
> ++#include <features.h>
> ++#ifdef __GLIBC__
> + #include <bits/wordsize.h>
> ++#else
> ++#include <bits/reg.h>
> ++#endif

It seems __WORDISIZE is what is being used here, a portable way would be

#include <limits.h>
#if (ULONG_MAX == 0xffffffffffffffff)
64bit wordlen stuff
#else
32bit stuff
#endif

if we still want to keep using internal libc internal define __WORDSIZE
then for musl include sys/user.h headers under bits/ dir are usually not 
portable and not meant for direct includes

#include <features.h>
#ifdef __GLIBC__
#include <bits/wordsize.h>
#endif
#include <sys/user.h>


> +
> + #if __WORDSIZE == 32
> + #include "config-32.h"
> diff --git a/meta/recipes-devtools/libdnf/libdnf_0.55.2.bb b/meta/recipes-devtools/libdnf/libdnf_0.58.0.bb
> similarity index 93%
> rename from meta/recipes-devtools/libdnf/libdnf_0.55.2.bb
> rename to meta/recipes-devtools/libdnf/libdnf_0.58.0.bb
> index b34bb5de01..eea410af4c 100644
> --- a/meta/recipes-devtools/libdnf/libdnf_0.55.2.bb
> +++ b/meta/recipes-devtools/libdnf/libdnf_0.58.0.bb
> @@ -11,9 +11,10 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
>              file://0001-Add-WITH_TESTS-option.patch \
>              file://0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch \
>              file://enable_test_data_dir_set.patch \
> +           file://0001-libdnf-config.h-include-the-correct-header-on-musl.patch \
>              "
>   
> -SRCREV = "d2d0ec98fd2e0a2623123fb1ddf8fdd8936c6046"
> +SRCREV = "85278894f21bc1957dc47a2a09ddacf59bc3cda8"
>   UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
>   
>   S = "${WORKDIR}/git"
> 
> 
> 
> 
> 
