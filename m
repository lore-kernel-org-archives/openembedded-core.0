Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.25722.1629127911624253425
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 08:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YQxhpBka;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id hv22-20020a17090ae416b0290178c579e424so647561pjb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 08:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=rFIzKocPCYcsuYl7ljylaAylVB1m+gDBVvGC0N6QcKY=;
        b=YQxhpBkaZlFhPAsTEt27IaXc62VX2uDxXrzwMS9uW1bwdd7nZYOTfV6k+GYshUSjoR
         6mwKqw4zmVi9FT6hsCR4wlvyvzvJCVWV0RYNo+RK0U07166BhatRw5aHu7huR8nTbevx
         zD1QLFxJ4dgacecerAbAtIYqVoXQSoom8yMKzlW+kRbNwm6reT0mKX+DLUg5e+0gn3da
         jqSbefeZpbxqIwQS4zih6xVbK+J4GZHCdUGg/994xw/Fgh/YUYXQZ+WwHzyDoMwZ0vqR
         OSfv50vbXnUl7Ar695b8F+UAWRsFVh+hPMAitpTTW8Rzj5oimntqkFOUdx6PaWWWUQ6K
         hCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=rFIzKocPCYcsuYl7ljylaAylVB1m+gDBVvGC0N6QcKY=;
        b=b3YES/bCiCDa+FBgOqW77s7JnTDjDXEyIJGKT0kXXIMABXwrykKpnUK/ywjZe58iCh
         dSWnygj5JWQ+ckIC9knsQTYnB/+755hcVJWlQ/QMwQbhOv+J1Jlb8MiT6A8sF4p3FuXL
         uvSXTuOPZZurEaT0yowcnbrNa4t29KqeWyVBu/b7xHWW6GOKrzIavnOvkvdWnbxEUFa7
         eASyQDjPBf2GItbL5fB2lCT2lK9ZNVPNuvqNRlc6BFHWlyINMeCT8lnkgECmBPTwjJ80
         Df4BhYJ4i6J2CAxmX4LJgibxPnqZ9EbMk1UlA++1tUnXqB1nbOJ4FEe/adPWwQbT1SEW
         1hqg==
X-Gm-Message-State: AOAM530ucbSPdczOtsGSwQvz1RUvvhDlR8d87qRdh8X9d5c4RHv9Nd98
	aiiRhHQ5Zcr0VuNY/+U8K10=
X-Google-Smtp-Source: ABdhPJwbbwhR1JblujoTxqXHYP+OWND5Tm4WSewn7/RKLUUe3O1020o3lMiqWAk5jIrB1VhMkyNJgg==
X-Received: by 2002:a63:510a:: with SMTP id f10mr14622501pgb.249.1629127910947;
        Mon, 16 Aug 2021 08:31:50 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:c078:a19b:8919:aba? ([2601:646:9200:a0f0:c078:a19b:8919:aba])
        by smtp.gmail.com with UTF8SMTPSA id d18sm14228529pgk.24.2021.08.16.08.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 08:31:50 -0700 (PDT)
Message-ID: <47d7912d-814b-5337-067a-06ff95c67f12@gmail.com>
Date: Mon, 16 Aug 2021 08:31:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0
Subject: Re: [OE-core] [PATCH 2/2] man-db: Add compression PACKAGECONFIG entries
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210816085253.3843644-1-richard.purdie@linuxfoundation.org>
 <20210816085253.3843644-2-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210816085253.3843644-2-richard.purdie@linuxfoundation.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/16/21 1:52 AM, Richard Purdie wrote:
> Add PACKAGECONFIG entries for various compression algorithms to ensure
> builds are deterministic.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-extended/man-db/man-db_2.9.4.bb | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/meta/recipes-extended/man-db/man-db_2.9.4.bb b/meta/recipes-extended/man-db/man-db_2.9.4.bb
> index c4cdbcc3b49..2b530fb8a6a 100644
> --- a/meta/recipes-extended/man-db/man-db_2.9.4.bb
> +++ b/meta/recipes-extended/man-db/man-db_2.9.4.bb
> @@ -22,6 +22,13 @@ inherit gettext pkgconfig autotools systemd
>   EXTRA_OECONF = "--with-pager=less --with-systemdsystemunitdir=${systemd_unitdir}/system"
>   EXTRA_AUTORECONF += "-I ${S}/gl/m4"
>   
> +PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
> +PACKAGECONFIG[gzip] = "--with-gzip,--without-gzip,gzip"
> +PACKAGECONFIG[lzip] = "--with-lzip,--without-lzip,lzip"
> +PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,xz"
> +PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
> +PACKAGECONFIG[xz] = "--with-xz,--without-xz,xz"
> +

were there some enabled by default I wonder ? I agree the minimal 
default is a good starting point but just want to understand should we 
need a default compression turned on or not.

>   do_install() {
>   	autotools_do_install
>   
> 
> 
> 
> 
> 
