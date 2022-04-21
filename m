Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F16BC83031
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:12 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.19667.1650537126404485243
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 03:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WnSDtkZK;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id h27so7634116lfj.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 03:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=39zO9YIco9KsLwB/LObyk6KhRFGg/UTAd3ctIwlzlWE=;
        b=WnSDtkZKjjJACmw/IEppfNiM2CDyb8AwpWxZphDOiFWW6Ow2ffviYybj1KBFOo/M9A
         SgECim4FqFhGIIE7xdQ2OIqiQkkmIkdjgY3WiaI9EwEoGYf9mh+a/28JWkXYezjP22Pj
         0dq0ThGjMq/2F2IwtnM7+QBP+4bkLLG0Ng+vC3cnc98qt/JF2oPVUplaNyWG/CSl9Y3F
         Hb+UjUV+Mba2hj/UnTni+crddVfzeA2hs7iUl5yAddxDEF8APUOMGEdlVxJQhAAPOs6v
         DrOX6Fl1LjnnZbF8jM4Ogs7EgGOjhy+EfLkq5A9k6mYLbRmGHEjuTfncBNBnAFmcjjDW
         Tglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=39zO9YIco9KsLwB/LObyk6KhRFGg/UTAd3ctIwlzlWE=;
        b=AP8SWeKma8ok35wPvL2XW86CLg0Vzq6cMnRKKNHTJY3BzHuP0DQ/PPxnEi+U+CMhH2
         YcDdPzz32sO7+kHDINWRzcj/eLOSZhAAM8IK1mD2QnTUMizSQc+YXFspTjknl7U8raBL
         w9Bo2XliaTDcppwdcc0nTd6a3ARoeASPEfNT5T7Tb+TKc1bpQmrbZxaSKLFUUeDMpowA
         XqYWfxCMYMz+uZWLxiNydQUBxCOr2/Yzn/CUOTh+FfEzYBt+0pY3yHF6Wl02pGCUIL3u
         4nwwBIz75xjLAFyG76rzwcA/UK1zQq4R9Yz0JFxJx+Qgn6LSaUm9T/0y4hk3NwrhecIx
         m+Eg==
X-Gm-Message-State: AOAM532zLkQlUiOYt5YfyDlsX0K6dZ+vI49nqK9t1j6lfj53GgPygdTJ
	7rswgERKRL3mbxWNZEjMu+4=
X-Google-Smtp-Source: 
 ABdhPJxcTof7/vrMg8urPcsaz4VKevxJYijgUWvhQpPWaLLhj77sKs4+nzE/6yMJFmOADvmc+ZbddQ==
X-Received: by 2002:a05:6512:1516:b0:448:39b8:d603 with SMTP id
 bq22-20020a056512151600b0044839b8d603mr17460023lfb.599.1650537124351;
        Thu, 21 Apr 2022 03:32:04 -0700 (PDT)
Received: from [192.168.10.102] (89-253-118-72.customers.ownit.se.
 [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id
 u26-20020a19ab1a000000b0046b9f6c7228sm2146904lfe.43.2022.04.21.03.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 03:32:03 -0700 (PDT)
Message-ID: <6bdfefb1-694f-9831-4260-ca01980f2c24@gmail.com>
Date: Thu, 21 Apr 2022 12:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] zlib: upgrade to 1.2.12
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
References: <20220329134523.3143527-1-ross.burton@arm.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <20220329134523.3143527-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164758

On 3/29/22 15:45, Ross Burton wrote:
> First upstream release since 2017!
> - Fix a deflate bug when using the Z_FIXED strategy that can result in out-of-bound accesses.
> - Fix a deflate bug when the window is full in deflate_stored().
> - Speed up CRC-32 computations by a factor of 1.5 to 3.
> - Use the hardware CRC-32 instruction on ARMv8 processors.
> - Speed up crc32_combine() with powers of x tables.
> - Add crc32_combine_gen() and crc32_combine_op() for fast combines.
> 
> Drop CVE-2018-25032 as this is in the .12 release.
> 
> Rebase 0001-configure-Pass-LDFLAGS-to-link-tests.patch to apply cleanly.
> 
> Backport cc.patch to fix compilation with our CC.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>

For whatever reason, this breaks building icedtea7-native from meta-java
on my Fedora 35 system.

Jacob

