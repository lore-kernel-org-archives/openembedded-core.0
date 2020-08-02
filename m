Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web11.10225.1596379402009273375
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2020 07:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mpQ5b9xF;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id m16so19496068pls.5
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2020 07:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=BuSlodB+Ek33WCJnYs9wdffZji8GbVuoG5qbuUjah2w=;
        b=mpQ5b9xFL00DNblHSjWlWIwXe00EQ+rN+uAqVViAdsWtdZL4ReVaP+ofw052vQpA1V
         5DZjRja1p+thc3lTpPRfFLJj+5d8MmLK4MeLi6semA7Xv5Qr4BSTwl2YjtlcqErJD9v5
         bvT3u37LsArUAMbXX9EZRr4fuREHygGGIDf6Lafzh/jbv4sbs4SZUVVP+ld4MAR5Wt7W
         b3zXqtOqOkECbAqL9v1E+bsS8wOY4v2ZQyiCSJ2bjvvKM6p0iFAVqe+HgXJlBcBITCfR
         f24e1LlZs3JDIkiXNUP54cKyXTGCbBRHPkNvOeNo6I8gC4YhaPMWq2nymgA0FgBkCwEb
         x0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BuSlodB+Ek33WCJnYs9wdffZji8GbVuoG5qbuUjah2w=;
        b=VWEoLr4xnHzdhvt1faEiNGW1wTeMRZCldCenvifxsA6duJ+TL0WJKUB75V+MB8ufgA
         vLSmdKwgiA+mI9tsBO42c/pPCv8c4yu8MrVUncPYYSrsn1qv3PBv7pqGVK8hRK1EOdA4
         93NBcGGS31w9Bq7vsARtIyyn5Puhuxuqz4BUIGlkYAeMYffdOOwz73ImlVT1QGViZaOJ
         9LBlpBfSPtgpNukM/RuXvZYWPmkUAKEHC4RU9nnOGws+yz7mUKO8e0lvWjEidV10CJUR
         cIiBX6F/KzMuVOwVdEChVRU02Ihx2M+dGd80BTnJEYSFQAePlncwHBnjw/S/RVvY1SCm
         omXQ==
X-Gm-Message-State: AOAM531sxt1zYapQ/hPCd+6CNV9liRykpT6lBV8Uaq4lBXOR4lzCcK7W
	9XRDPwZjpJG4Z5RobBgqH/Rqgm+Vp5w=
X-Google-Smtp-Source: ABdhPJzTw2sQMxxsZeTFN8n69qqtAOk8IK8p2R9FKEhYmVKghyLeQ+WsV6399HKFSfOvvrn72YeAkQ==
X-Received: by 2002:a17:90a:d583:: with SMTP id v3mr12911877pju.33.1596379401066;
        Sun, 02 Aug 2020 07:43:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:8956:272e:1bb1:7766? ([2601:646:9200:4e0:8956:272e:1bb1:7766])
        by smtp.gmail.com with ESMTPSA id w187sm8436986pfd.87.2020.08.02.07.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2020 07:43:20 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 07/13] glib-2.0: correct build with latest meson
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20200801212335.14922-1-alex.kanavin@gmail.com>
 <20200801212335.14922-7-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <20986732-cc48-c1af-23f5-eda071268376@gmail.com>
Date: Sun, 2 Aug 2020 07:43:19 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200801212335.14922-7-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 8/1/20 2:23 PM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux b/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux
> index 83596e0efb..adad7e62ee 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux
> @@ -2,4 +2,4 @@
>   have_proc_self_cmdline = true
>   
>   [binaries]
> -env = "/usr/bin/env"
> +env = '/usr/bin/env'
is meson finicky quoting style? If so, perhaps it would be good to call 
it out in commit msg

> 
> 
> 
> 
