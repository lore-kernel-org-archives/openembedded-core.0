Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB42BC433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 02:14:58 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.4375.1637028893484464315
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 18:14:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oQ1y0V2A;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id n85so16665370pfd.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 18:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=cQcotF+eJi3td7S76W/8UlFbY9nOKBQ4/lztP3VhNJo=;
        b=oQ1y0V2A3Uuti/ZNyRWsbHC54FbodcMqWaN5oEsE5GAg57Zh5JTgXaXletGOGvzRJO
         BY0URYNfh0loX1RTP70vJNxLhT7CJvXWavrskTvFzCTzAfVI88GcbcikIJs6TuLM904W
         J6CsbvXAgD/J0EbR17hVTzFx1w0V8fvIfb9LjRJR7FeWbRl9lEsYKKB1M9mJ2hwPhnIg
         bdWPtQIlgiqCkNbqbS/1aq5m4reZGUSP+Tk215NXC6vEHYIWBT5Ewma0vRu8TuDQbMBw
         ABzRP8abh/5LjnQHI3ZGq9zYYoMxIZfF66Zrl03H4W5n4tLz7HF0X/ybVj6EKNOphdAG
         Tk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=cQcotF+eJi3td7S76W/8UlFbY9nOKBQ4/lztP3VhNJo=;
        b=ABHMQYKXFKO7k5X07+Fbn9fzfNjiKyu6dNpXwSYc+nH5uE6Aobv5bpiJg9NVWVCzCe
         DcYlzqgbRcy1VcAoiMyW7c7b5bLdWbr4gHPYpEXS3/P/R9ls0oyWLH50GS3RfFzRjXqF
         8ei71xGiKBD27/QnApTnuYr5ThfxKdScuYbRria3MwtDxXVF+iQ5DSgAhjSDCFo+EcXT
         avQu3/gWrvlQClKTGHScvqPjIC6fBNRv7d/bbr0XJwt/h2E/gl2trAWfjQPNsBmT4y0o
         S5Jk81MuBEPuUmykHAtcmp6G21V1/AlXwHvfcDUBYCrCUNHjyndfSNVI9CItWLZKgqN/
         A64g==
X-Gm-Message-State: AOAM530a7eBKOMj2cEihunaoK/oYAIeiZFtbHhTna0gLATvaRJuhy9Wb
	0y/XAdke5FZtdfZRKd1rhZ8=
X-Google-Smtp-Source: 
 ABdhPJwm18tiERclN+W46Ci4VzpDmjGgseOE9eQeKTULU1PDIYlr3/FRBSpsen068SRqB6HP7RNJnA==
X-Received: by 2002:a65:6388:: with SMTP id h8mr2502451pgv.94.1637028892865;
        Mon, 15 Nov 2021 18:14:52 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0::5ede? ([2601:646:9200:a0f0::5ede])
        by smtp.gmail.com with ESMTPSA id
 o22sm11946978pfu.45.2021.11.15.18.14.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 18:14:52 -0800 (PST)
Message-ID: <43d925b8-dc03-21a5-10e1-361b2894373f@gmail.com>
Date: Mon, 15 Nov 2021 18:14:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [OE-core] [PATCH] gdb-common: Add --with-liblzma-prefix in xz
 PACKAGECONFIG.
Content-Language: en-US
To: Jim Wilson <jim.wilson.gcc@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20211116014413.419573-1-jim.wilson.gcc@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211116014413.419573-1-jim.wilson.gcc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 02:14:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158321



On 11/15/21 17:44, Jim Wilson wrote:
> This fixes an arch linux gdb configure error with liblzma installed.
> 
> Without the --with-liblzma-prefix option, when configuring the target
> gdb, gdb configure may find the native liblzma (on a non-multiarch
> system) and try to use it, which gives a configure error.  We already
> use --with-libexpat-prefix for expat, we just need to do the same for
> liblzma.
> 
> This was reported here:
> https://github.com/sifive/meta-sifive/issues/34
> https://github.com/sifive/freedom-u-sdk/issues/148
> 
> Signed-off-by: Jim Wilson <jim.wilson.gcc@gmail.com>
> ---
>   meta/recipes-devtools/gdb/gdb-common.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
> index f3ab3544da..925b0c2f80 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -37,7 +37,7 @@ PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python
>   PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
>   # ncurses is already a hard DEPENDS, but would be added here if it weren't
>   PACKAGECONFIG[tui] = "--enable-tui,--disable-tui"
> -PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
> +PACKAGECONFIG[xz] = "--with-lzma --with-liblzma-prefix=${STAGING_DIR_HOST},--without-lzma,xz"

this looks ok to me. Although I wonder why gdb's configure is not able 
to find it in staging sysroot automatically, I have seen similar 
behavior in gmp and mpfr in past as well.

>   PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod, elfutils"
>   
>   GDBPROPREFIX = "--program-prefix=''"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158320): https://lists.openembedded.org/g/openembedded-core/message/158320
> Mute This Topic: https://lists.openembedded.org/mt/87085648/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

