Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8AEC433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 17:19:10 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.228.1636996749692170421
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 09:19:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nn9M5l11;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id b4so15106446pgh.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 09:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=bBsVKk0Tnxt3+JJqCIyGN+uUHUcGxC/qGjAyv1i0ekU=;
        b=Nn9M5l11vOYi1kFEUmaLy5tkmzYuVX8TZxyVpME7iT03nQSO6LJJU11jTd9oFCwbrZ
         GxSOCkYZ1bPXUy8GZfk1MCKs/iJJGTITNSejF/kbcvRhQdWF6xtM5Xvp5ISPnC59ZPxt
         TVWd7jkIk/bjjU2KupBNZsLstVYRDUoyYh8w/2k4WqBK+fFkDyY/dSISz8ekWQCZ4xMP
         EtSeo2w/PzhDaP0x7pzfbXORDeAQjRAVkseE9WFbHBh+dqXlkIF2hhdt+BUaVzJ98GSS
         8xBT3Qd4nPw5/7XvUttRkR6UKcXIs95wpV8Qfhbiw4FzxTVTRlFSt3TbUWGzhuSWXG0g
         5h1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=bBsVKk0Tnxt3+JJqCIyGN+uUHUcGxC/qGjAyv1i0ekU=;
        b=LYBI5FcYQuRxGgcaPwUOpOnP4SXSEFGVK171igrXmuPRch2y/rWevU/Ks/Iz40MXpg
         Wm4xky4bCVYFWerZTNF67XQBHZEi4lymLI7kn/Oinly7foZLncufHsmqBBOrUacetD2K
         MieABNgy4ZnAuu2h+jKaIwvBi4vIF+LlEFX+tAQqUaEcBTRMJKubxoJAzffox/sGrWDm
         Ujs2PHP9ywQBdkFGbaJfNTTdY4RSK3R2OYVFfuodck0mvVuNiozRBpP+3Mm98GvbXPgA
         P85uR0HgTVQ7IefdfPQofcqa9WClD4Ll4WxXYGfuoaqODePVYxyLffy9jcMUfWjQRG7d
         n8rw==
X-Gm-Message-State: AOAM530dkUZDKvnMhWPMEnAPoGl8s1jBr3pFMMrtW+s8fl4X+ozdUSUK
	aHisW+xCwu4vx9wovU3UcFI=
X-Google-Smtp-Source: 
 ABdhPJz2lcH8IiiSOXGxK5cS8+H1reMjbNrvi8U7QBRGnyuEZxuVg/oleVwQLsBeMWuWdSKULQeiaQ==
X-Received: by 2002:a63:4542:: with SMTP id u2mr309255pgk.396.1636996749115;
        Mon, 15 Nov 2021 09:19:09 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:bc73:9bbe:f6ac:7062?
 ([2601:646:9200:a0f0:bc73:9bbe:f6ac:7062])
        by smtp.gmail.com with ESMTPSA id
 f16sm12724957pgi.28.2021.11.15.09.19.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 09:19:08 -0800 (PST)
Message-ID: <2cb6e686-7b33-6059-596d-7429d2a796f5@gmail.com>
Date: Mon, 15 Nov 2021 09:19:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [OE-core] [PATCH] gcc: Dropping mips workaround
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20211115112308.3974991-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211115112308.3974991-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 17:19:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158306

lgtm

On 11/15/21 3:23 AM, Richard Purdie wrote:
> I've tested without this and the ptest results for mips are the same with
> and without it so the issue this was fixing in gcc 9 was likely resolved
> by gcc 11.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-devtools/binutils/binutils_2.37.bb | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/meta/recipes-devtools/binutils/binutils_2.37.bb b/meta/recipes-devtools/binutils/binutils_2.37.bb
> index 7430bf13425..12a6fb55776 100644
> --- a/meta/recipes-devtools/binutils/binutils_2.37.bb
> +++ b/meta/recipes-devtools/binutils/binutils_2.37.bb
> @@ -27,10 +27,6 @@ EXTRA_OECONF:class-native = "--enable-targets=all \
>   
>   PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)}"
>   PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod, elfutils"
> -# gcc9.0 end up mis-compiling libbfd.so with O2 which then crashes on target
> -# So remove -O2 and use -Os as workaround
> -SELECTED_OPTIMIZATION:remove:mipsarch = "-O2"
> -SELECTED_OPTIMIZATION:append:mipsarch = " -Os"
>   
>   do_install:class-native () {
>   	autotools_do_install
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158279): https://lists.openembedded.org/g/openembedded-core/message/158279
> Mute This Topic: https://lists.openembedded.org/mt/87066754/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

