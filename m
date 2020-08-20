Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.119486.1597957650664877815
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 14:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sidebranch-com.20150623.gappssmtp.com header.s=20150623 header.b=HJBZM4MY;
 spf=softfail (domain: sidebranch.com, ip: 209.85.219.68, mailfrom: leon@sidebranch.com)
Received: by mail-qv1-f68.google.com with SMTP id x7so1614909qvi.5
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 14:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7MJB2KpGnWya9BVJAd0pEFjFdYCZPPEY1b8w9fi4syU=;
        b=HJBZM4MYDt1I0yJiw8ZA1HGsTMVo86yV4BPI8PNHq5Iwm4/qvxAE+IMogsb/e5FkOr
         o0+xJB6VREo1/hEOerfI76lVhmO9cFSdmOfwFuq6r3juAaYkGJk8tjTSAG3Q9rsPJ9i5
         9+Orc+55zLxsAtT9YoYNpcRkbgXWxTZzNrWDNvMxX2EPa6+JuuIBFrfxmz/DivqW7Uf9
         B7REBbe/cFx9L0Wj08/DxOlHuXbkitkhSbTVxP6YyaNM7KWkce6UDpMfW8OwaqQdWHZZ
         kIJh7OfH8WGEhgF3PW8jJpV0IWrmP48VE9POsUx5jgCruJfjN57AAbCYiXw2j3ccouy3
         olZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7MJB2KpGnWya9BVJAd0pEFjFdYCZPPEY1b8w9fi4syU=;
        b=l8QCCfGPFOmVpz3mf6m01YxeLm7xxABKCxwGAxVShoiINf4AH/eK8IF2xJNLj6xx6J
         dip3EltL9ELzgUCsOvwEVCnCsvYhKNI+EWs9hE7dM+3qQ4AxY7rYCoEfLGEx/Z/KTfmb
         JaYL7EDKMZ6TF2W8xBmaudxOxWiGyP7Ah6VFx7+iNnJ5LdFLQOUTdtermugbb98FZcs9
         lAF0LQ/6AI7CpLNsOgehbq6DuFCESefe44yxLa7FhOpltvFVYJ8Lns3LfXPTXivmTBDf
         vzBgJaom6/6DyBgTc+IhEplhng8eQgx50WarnEjssvVy9DUS2jp6qccOsrOJduKIifM0
         ytTg==
X-Gm-Message-State: AOAM530U91l0n1F/EkmsIs3Up8m8yx9hmB1UIetq7wKpO5M+fzNnGrSH
	3nth4x0ZFMeTqyjAGCwxlvPAg/RjXeTHX3tgcUG1Tw==
X-Google-Smtp-Source: ABdhPJymbLZaLMbb/9HpoF+1ZOuouX5IdHQaCOUvW4shagToTcoZK277GBIa0gxhRjhsI/7wCeAee/ebHvWzqZhH3jA=
X-Received: by 2002:ad4:4cc9:: with SMTP id i9mr698771qvz.131.1597957649725;
 Thu, 20 Aug 2020 14:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200820080115.2715139-1-raj.khem@gmail.com> <20200820080115.2715139-2-raj.khem@gmail.com>
In-Reply-To: <20200820080115.2715139-2-raj.khem@gmail.com>
From: "Leon Woestenberg" <leon@sidebranch.com>
Date: Thu, 20 Aug 2020 23:07:19 +0200
Message-ID: <CAMjhiJhf9zumg0_uC6xWwSZjqc6fHKh1Tze2jK51bkauwFco-g@mail.gmail.com>
Subject: Re: [PATCH V2 2/3] gcc-cross-canadian: Install gcc/g++ wrappers for musl
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 20, 2020 at 10:01 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> gcc needs -mmusl option to be passed in SDK since we ship crossdk compiler
> configured for glibc by default, this helps in creating correct
> compiler defaults for musl based SDK compilers
>
> [YOCTO #13459]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Leon Woestenberg <leon@sidebranch.com>
> ---
> v2: Delete file before creating wrapper
>
Thanks, v2 works and solves [YOCTO #13459]. We already independently
had the same v1->v2 fix locally,  while we tested your v1 approach
(and ignored the mailing list...)

Tested-by: Leon Woestenberg <leon@sidebranch.com>
Acked-by: Leon Woestenberg <leon@sidebranch.com>
