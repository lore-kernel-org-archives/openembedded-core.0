Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web11.655.1592949773887677617
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 15:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FzJLQ8Z/;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id u5so45979pfn.7
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 15:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PERi/P3fZvFn9Mu8O2JrWhCehuFOm7t5TymbyZ9EZWA=;
        b=FzJLQ8Z/PhKm2L0yaGhVjNN/wAwZyl8NNrxekuVyfDqSEUf/A+qezvR4djA1UjJizt
         P8IYD2QhrtnKLhxgKIUL6GWsFwDHf2E9ON/fn4JPN6wbQxFKNb8H4YT78ndvTRt/Kdq8
         sa4GBconW3Tib5/m1SKGm4sNMagqBlZ1c5s6xxYlbHQ7Z2t5AFiTbZTJzjk9srIV09fA
         qx6f/tmD0FNmA7SdRgD9hKAF9OXNPssFzV4KW/Zt1V6Fzcp/6bNLgw1GektxWtqKXImN
         ZYU13GB0c2NqhmNPWZyMNl6ZmibnzLqioJT0kCP68TzhDUZgqRrJzMd6sN9TYyFaI6kc
         3qFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PERi/P3fZvFn9Mu8O2JrWhCehuFOm7t5TymbyZ9EZWA=;
        b=qomKnrkAD8LIeW3Spz2Zdt7R4PRfScbS2ROs6FbACBiguZtESWWu7qbWhwwNaPxpgp
         lJDZllPs5Zc4/BSCpMS5LacQCed8D8RxTxzVzQft4gRq57NjKTYiMNekOqxY5Iyw3T7M
         XcjimipNEzMXvPadj4yLZH6Rf0Cq1iyv+xB3hwwrW/qrLWm6DhSazZQUd+IhIokG1i7r
         3AaR6QAK6nN8zPOZIreHrpa/dQUaqoE4NXbc1Z8mx6cRt+WP3KQVqYx8I47c0yw9AfdS
         nZ19/WVweKlzzXd4WJo27+RBsdd6Y22P9h1JWAqaDtkrst7FRPeBL2F3ysKy0/xzb5Ev
         PvZw==
X-Gm-Message-State: AOAM530iKvx4YvU8f3O/u7TgftK+1/omR/93k9YF//JJIv5NYmoaNnBX
	JSasFAUO5P5ijTtmbUawaR5QNnwwaw4=
X-Google-Smtp-Source: ABdhPJyNRCVtBzzEa2CvGGm4/aogRVoBDL8pPYLygltCCZOsygG0y4lP7h5mSMEuRnduLUINh80RcQ==
X-Received: by 2002:a63:564e:: with SMTP id g14mr2968548pgm.326.1592949772731;
        Tue, 23 Jun 2020 15:02:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::dedc? ([2601:646:9200:4e0::dedc])
        by smtp.gmail.com with ESMTPSA id p16sm14706190pgj.53.2020.06.23.15.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2020 15:02:52 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 2/2] icu: make filtered data generation optional, serial and off by default
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20200623210837.26222-1-alex.kanavin@gmail.com>
 <20200623210837.26222-2-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <19e46f60-469e-d74d-aebc-d56e34da1c4d@gmail.com>
Date: Tue, 23 Jun 2020 15:02:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200623210837.26222-2-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 6/23/20 2:08 PM, Alexander Kanavin wrote:
> icu data generation was found to be racy, and causig AB failures;
> making it serial and leaving it on is not an option as it regresses
> to several minutes.
> 
> The specific bug is that rules.mk has:
> 
> LD_LIBRARY_PATH=../lib:../stubdata:../tools/ctestfw:$LD_LIBRARY_PATH  ../bin/gencnval -s . -d ./out/build/icudt66l mappings/convrtrs.txt
> 
> which creates a file and numerous rules like
> 
> LD_LIBRARY_PATH=../lib:../stubdata:../tools/ctestfw:$LD_LIBRARY_PATH  ../bin/genrb -s ./misc -d ./out/build/icudt67l -i ./out/build/icudt67l -k -q numberingSystems.txt
> 
> which quietly read it. There is no prerequisite for the former to complete first.
> 
> The race is extra complicated to fix as rules.mk is itself
> generated through a custom in-tree python tool.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-support/icu/icu_67.1.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/icu/icu_67.1.bb b/meta/recipes-support/icu/icu_67.1.bb
> index 5814fa41bd..9e8091ba01 100644
> --- a/meta/recipes-support/icu/icu_67.1.bb
> +++ b/meta/recipes-support/icu/icu_67.1.bb
> @@ -120,7 +120,11 @@ UPSTREAM_CHECK_URI = "https://github.com/unicode-org/icu/releases"
>  
>  EXTRA_OECONF_append_libc-musl = " ac_cv_func_strtod_l=no"
>  
> +PACKAGECONFIG ?= ""
> +PACKAGECONFIG[make-icudata] = ",,,"

maybe calling it custom-icudata is appropriate. This option perhaps
should be enabled by default with a minimum filter, which is to enable
en_US perhaps, it helps integrate the external build processes that is
in place where systems depend on icudata and don't want all 20M of it in
image. It would be good for us to offer a tested way to custom build
this data.

but I am ok to live with this workaround until perhaps this issue is
fixed upstream amicably.

> +
>  do_make_icudata_class-target () {
> +    ${@bb.utils.contains('PACKAGECONFIG', 'make-icudata', '', 'exit 0', d)}
>      cd ${S}
>      rm -rf data
>      cp -a ${WORKDIR}/data .
> @@ -135,7 +139,7 @@ do_make_icudata_class-target () {
>      LDFLAGS='${BUILD_LDFLAGS}' \
>      ICU_DATA_FILTER_FILE=${WORKDIR}/filter.json \
>      ./runConfigureICU Linux --with-data-packaging=archive
> -    oe_runmake ${PARALLEL_MAKE}
> +    oe_runmake
>      install -Dm644 ${S}/data/out/icudt${ICU_MAJOR_VER}l.dat ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat
>  }
>  
> 
> 
> 
> 
