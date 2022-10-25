Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBCFC04A95
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 08:41:57 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.4769.1666687309318788971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Oct 2022 01:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bArudf6G;
 spf=pass (domain: konsulko.com, ip: 209.85.218.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f42.google.com with SMTP id d26so10614813eje.10
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 01:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bk3qn6oSh3M6ltA+CmEycDMACdhcpoVZa4whyzQsO5Y=;
        b=bArudf6GWQMkO7rJYM7DhmGZXtqscSFsa/FXdcTgQpGRH+yLf7j87ai+Ll1qvtzRuU
         +wyve3Xqt7bFGFfSj44bCtWk8R0tXWWHAr47/iEdyIMdtxM6LUxpUsIu4kK4XhOwa/xl
         0pBtqjs2WYpdvD5iEd5DiYNEWuS3JsD5ZrBE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bk3qn6oSh3M6ltA+CmEycDMACdhcpoVZa4whyzQsO5Y=;
        b=dDYEUJ3UuHI42iv7YiCmgpDabhERXPcelzZem0MWWixnNGCq5daqq+1roNulq3qoSD
         rb1nzDU0bde/raywjD/OGyzO/T/sjkkuW0YKbIglGBE6iQwWW0Hf4u/UYYFYO1vPNpuX
         PQXA41kSONQRhspKOqnAbbex1+9UQ/uPNc95vBbzTO2InaCWhu7yPKi7afDc5hbNZRpD
         76Rmzpb4ERpsPgmAJ8n4M8A07ANtV+Q+IyO97DYkQTjENYEE3DIYoxhAd4LApHls+5q0
         9DyXU+aKXi3hmyszp5wxBcWBaknQ51Oo1OcHnobOmWgTe9Is1bp+W0s6p36C/I7dZUKf
         SQqA==
X-Gm-Message-State: ACrzQf3SkwEsqPddOtdcIQrgqLLbjAnT/cUdMaJ+SqXjwVqAhSzB8bVb
	kKIS7EaKs8NALeEvNXyGfDq+Od/dA9YQHQ==
X-Google-Smtp-Source: AMsMyM5lHv3nN30C/r21o0IY9GI7bYxuHQXMAFDOLnSKZv2RrUGp5IVHVA4z8UmCvBbEgwWzlqtHaw==
X-Received: by 2002:a17:907:760d:b0:7a9:5281:9eda with SMTP id jx13-20020a170907760d00b007a952819edamr6685027ejc.50.1666687307206;
        Tue, 25 Oct 2022 01:41:47 -0700 (PDT)
Received: from [192.168.5.100] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id g6-20020a170906594600b0072a881b21d8sm1013595ejr.119.2022.10.25.01.41.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 01:41:46 -0700 (PDT)
Message-ID: <e7a8f4c5-0c97-61b2-1167-99456ac26d28@konsulko.com>
Date: Tue, 25 Oct 2022 11:41:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] python3-manifest.json: Move urllib to netclient
Content-Language: en-US
To: openembedded-core <openembedded-core@lists.openembedded.org>
References: <20221011111028.590084-1-leon.anavi@konsulko.com>
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <20221011111028.590084-1-leon.anavi@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 08:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172123

Hi,

It has been 2 weeks since I submitted this patch for openembedded-core. 
I am wondering if it will be merged in master/master-next. Please let me 
know if any changes are needed. Is the patch OK?

Thanks,
Leon

On 11.10.22 г. 14:10 ч., Leon Anavi wrote:
> Move urllib from core to netclient because it imports base64.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>   .../python/python3/python3-manifest.json               | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
> index 2205cf2d2d..02c918d6e5 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -315,8 +315,6 @@
>               "${libdir}/python${PYTHON_MAJMIN}/traceback.py",
>               "${libdir}/python${PYTHON_MAJMIN}/types.py",
>               "${libdir}/python${PYTHON_MAJMIN}/typing.py",
> -            "${libdir}/python${PYTHON_MAJMIN}/urllib",
> -            "${libdir}/python${PYTHON_MAJMIN}/urllib/parse.py",
>               "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
>               "${libdir}/python${PYTHON_MAJMIN}/weakref.py",
>               "${prefix}/lib/python${PYTHON_MAJMIN}/config*/*[!.a]"
> @@ -402,9 +400,7 @@
>               "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__",
>               "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/abc.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/machinery.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/util.*.pyc",
> -            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
> -            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__/parse.*.pyc"
> +            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/util.*.pyc"
>           ]
>       },
>       "crypt": {
> @@ -876,6 +872,8 @@
>               "${libdir}/python${PYTHON_MAJMIN}/secrets.py",
>               "${libdir}/python${PYTHON_MAJMIN}/smtplib.py",
>               "${libdir}/python${PYTHON_MAJMIN}/telnetlib.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/urllib",
> +            "${libdir}/python${PYTHON_MAJMIN}/urllib/parse.py",
>               "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
>           ],
>           "cached": [
> @@ -888,6 +886,8 @@
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/secrets.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtplib.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/telnetlib.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
> +            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__/parse.*.pyc",
>               "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uuid.*.pyc"
>           ]
>       },

-- 
Leon Anavi
Software Engineer
konsulko.com


