Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.570.1612802447431688791
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 08:40:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GqAzJ7WU;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id m6so10077089pfk.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 08:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fVb/ejybcylz6M4Y2CGpI03+ukJmy1vIb42H1IjhbrA=;
        b=GqAzJ7WUUrGE4rHm5XujWbCi/Zt/Iv265VB/7ywYnlqCgcWKI3Z7pCd0JvlEOga5Z3
         f8rS4rO2JwoCJ9P78v9KQsfvWgNn9A8eK2s5IhQtxxTkZLUPQ9EQotYcXJGkaqYbP0J2
         SVMvtpUa/dlehobTF/CQrqvuBSVVZhLh/JOcMnJ0AkFSoVGdag29rS1uDvVKEgUk7mGF
         8Ec7LOjRIH0KJktNktUYO/zf5RtYc89+0Yv9UOv0bmVX5T4ZMLl4S4ATOgGkQcd1MDjC
         J9VJYMDl//RzHuB9ZtNeBR1hz/9JUhp5zVk1c1Q13vVpSrnXp4hnsUCRDgWpquwcpXU+
         XHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=fVb/ejybcylz6M4Y2CGpI03+ukJmy1vIb42H1IjhbrA=;
        b=L5ruBWAENSfeNPUZ+gNrjAczhya4QzVFY9dbQbqweE8qRT/cyUFCoiwVHbhUT8BNGw
         mSbkZ+Vi/gSivBOSpPxS+Nic1B3vtzP/YAMueHQD6cf6ZshVNM09pCCrRQlTBAgdtLwc
         1Tfqo8S2wA0HczQPBIX5q8WIrEmC3eUwcQI4S8Dv2dl96G9fYWWRk+uj2aslOE55PBO3
         XbSh3w0ts/Kj0sfYmeX6qYETu10Q35vnxLoE5kCC87FpUTjL0egf2HN2CXqqL4WkZ/pO
         LobyeMSUA252Pc6dk1lzodwIv/gdWHby7NYxcdMtM+LB92X4r9/cawZ/2iTk8CZUs9CA
         P0vQ==
X-Gm-Message-State: AOAM530vvwrAAGKTX1YY1eVnxiFStvGjkBO5wYiKEfcvE33xBd08gg8I
	JPl4l35PkSpqtN2Tfkk6/pcF8iCtO8DnVw==
X-Google-Smtp-Source: ABdhPJyHFOOAf5kNQIEmSuMoTeyA00RoGZBAoiOd5tlq8MiJAlj7X88D26nhnQYuidTZQacfbjqG8Q==
X-Received: by 2002:aa7:8d8e:0:b029:1d1:f9c9:cff6 with SMTP id i14-20020aa78d8e0000b02901d1f9c9cff6mr19174619pfr.31.1612802445951;
        Mon, 08 Feb 2021 08:40:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:a0c8:8a08:8518:4b41? ([2601:646:9200:a0f0:a0c8:8a08:8518:4b41])
        by smtp.gmail.com with ESMTPSA id q22sm19806610pgi.66.2021.02.08.08.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Feb 2021 08:40:45 -0800 (PST)
Subject: Re: [OE-core] [meta-oe][PATCH] libhugetlbfs: improve reproducibility
To: oobitots@cisco.com, openembedded-core@lists.openembedded.org
References: <20210208154416.2880-1-oobitots@cisco.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <80aa78c9-a1a8-0dc9-c4d2-9d53f664a80c@gmail.com>
Date: Mon, 8 Feb 2021 08:40:43 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210208154416.2880-1-oobitots@cisco.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksiy

oe-core ml is only for oe-core repo patches. For meta-openembedded 
layers patches they should be sent to oe-devel mailing list.

On 2/8/21 7:44 AM, Oleksiy Obitotskyy via lists.openembedded.org wrote:
> CPPFLAGS was overrided for tests, so we
> missing DEBUG_PREFIX_MAP and got absolute
> path in binary.
> 
> Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
> ---
>   ...Append-CPPFLAGS-rather-then-override.patch | 31 +++++++++++++++++++
>   .../libhugetlbfs/libhugetlbfs_git.bb          |  1 +
>   2 files changed, 32 insertions(+)
>   create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-makefile-Append-CPPFLAGS-rather-then-override.patch
> 
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-makefile-Append-CPPFLAGS-rather-then-override.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-makefile-Append-CPPFLAGS-rather-then-override.patch
> new file mode 100644
> index 000000000..78a4cb0fc
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-makefile-Append-CPPFLAGS-rather-then-override.patch
> @@ -0,0 +1,31 @@
> +From b6dba773491bbb7b4664dacdd87a12af860f1bd8 Mon Sep 17 00:00:00 2001
> +From: Oleksiy Obitotskyy <oobitots@cisco.com>
> +Date: Thu, 28 Jan 2021 05:43:33 -0800
> +Subject: [PATCH] tests/makefile: Append CPPFLAGS rather then override
> +
> +CPPFLAGS overrided and we could miss some options needed.
> +
> +Upstream-Status: Submitted
> +Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
> +---
> + tests/Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/tests/Makefile b/tests/Makefile
> +index 0ca3716..d262932 100644
> +--- a/tests/Makefile
> ++++ b/tests/Makefile
> +@@ -33,8 +33,8 @@ HELPERS = get_hugetlbfs_path compare_kvers
> + HELPER_LIBS = libheapshrink.so
> + BADTOOLCHAIN = bad-toolchain.sh
> +
> +-CFLAGS = -O2 -Wall -g
> +-CPPFLAGS = -I..
> ++CFLAGS += -O2 -Wall -g
> ++CPPFLAGS += -I..
> + STATIC_LIBHUGE = -Wl,--whole-archive -lhugetlbfs -Wl,--no-whole-archive
> + STATIC_LDLIBS = -Wl,--no-as-needed -lpthread
> + LDLIBS = $(STATIC_LDLIBS) -ldl -lhugetlbfs_privutils
> +--
> +2.26.2.Cisco
> +
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> index 2f07c938b..fa63316b0 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> @@ -26,6 +26,7 @@ SRC_URI = " \
>       file://0006-include-limits.h-for-PATH_MAX.patch \
>       file://0001-huge_page_setup_helper-use-python3-interpreter.patch \
>       file://0001-Revert-ld.hugetlbfs-fix-Ttext-segment-argument-on-AA.patch \
> +    file://0001-tests-makefile-Append-CPPFLAGS-rather-then-override.patch \
>   "
>   
>   UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
> 
> 
> 
> 
> 
