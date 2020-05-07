Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web11.3088.1588882046965281629
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 13:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UHX9ZyXN;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id q124so2974291pgq.13
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2020 13:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uPD/LfKwymYsD8MIu6UjDVPdiJdciUYgFtCrQsOVoYc=;
        b=UHX9ZyXNYjT6ePAd578OyX+52Iy9c6vh5ADRGDoz+Yxx6RgjVVoV1gWLs+pawM8IVn
         +eXU7qHlxDkkYi5t2XFl5tbV5J+LtcVQHuo0UJUZja0NVmDYr3X+wbBYVLkLd6E193Um
         rgKwpfhHw288b5IU0jEdoNVU8Co6n7yM1IBB0F/+2xd+mIA90rhMPQbER2dSXV1LtZmS
         S9OvgvXHGLd+xv90HlAlHKFqVeWMTSDaw1wZHsKTTytOdTiU9uU98eHYFMi01oSVT2Gr
         45woqs/A1M0FvGOnKRc/D/LAOQxrcevxPnygGwbeU0/ysMY4SifMmGw49FDlrAAiUlYi
         wh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uPD/LfKwymYsD8MIu6UjDVPdiJdciUYgFtCrQsOVoYc=;
        b=iz1L1eJJ/dxPrIuxDWahWYiQ/tCt8WabNff6+4I7KRJ3VAonhnx7UREMamQzWCuIBP
         lOcfBwdJ3/ZfRKwJPlNWtkMPtl/7afZ6WwrZcJ/acisRrp6+Hdq2Z8kZuWpKy62+SZke
         3eMeYhosKMzHW4hFfYdVJdTzsxv8o9ZjwZnaCJXnj9nSZc015rsygrLimPzoQEj6WEKt
         pKmgUmChCMpSgP+YyCTIJWTE27fDjd0TvWGZP+cYB7cUNSvXj04EvzP0bSvdOP6B98uK
         oqVmGSOB6V+W+G45EFH6zNtM7viO8w0xb4oAaqLQ4564rtftPP/LZ/+KMpxgiwB5RXM9
         Mzhg==
X-Gm-Message-State: AGi0PuaCXFxam8dCxGgzDZbJXZX7RJ3EZ3MH385k9x25VkxEQfCloeOy
	498n88/8L4rmhrPSGscfVMpqn1T23eA=
X-Google-Smtp-Source: APiQypKUezlLYZmHLr0TJOYxb9NRbsqSnWurQx2Z1DprAzLaCRe9WLIu/HTQduPmXBEIpBfkvSuqyw==
X-Received: by 2002:a63:b50b:: with SMTP id y11mr12560350pge.55.1588882045946;
        Thu, 07 May 2020 13:07:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::2691? ([2601:646:9200:4e0::2691])
        by smtp.gmail.com with ESMTPSA id x19sm5702467pfq.137.2020.05.07.13.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 13:07:25 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] insane: Promote warnings into errors
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200506134002.155500-1-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <66e0d1d5-2b72-ce26-4b5b-709fbcfc7274@gmail.com>
Date: Thu, 7 May 2020 13:07:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506134002.155500-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/6/20 6:40 AM, Richard Purdie wrote:
> There are several warnings the build can emit which show real problems
> in the way recipes are being built. Some distros like poky and the Yocto
> Project autobuilder have been fixing the issues these show for some time.
> 
> OE-Core has therefore been clean of these errors and warnings for some time.
> Promote warnings into errors to match the defaults in poky to encourage
> people to fix these real issue and reduce confusion when people switch
> distros or customise.

This is a good change, and I think all settings used in poky in this
regard are worth for OE-core.

> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/insane.bbclass | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 7fc8f33a982..8b19f445f9b 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -22,11 +22,9 @@ QA_SANE = "True"
>  
>  # Elect whether a given type of error is a warning or error, they may
>  # have been set by other files.
> -WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
> -            textrel already-stripped incompatible-license files-invalid \
> -            installed-vs-shipped compile-host-path install-host-path \
> -            pn-overrides infodir build-deps src-uri-bad \
> -            unknown-configure-option symlink-to-sysroot multilib \
> +WARN_QA ?= " libdir xorg-driver-abi \
> +            textrel incompatible-license files-invalid \
> +            infodir build-deps src-uri-bad symlink-to-sysroot multilib \
>              invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
>              mime mime-xdg \
>              "
> @@ -36,6 +34,9 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
>              version-going-backwards expanded-d invalid-chars \
>              license-checksum dev-elf file-rdeps configure-unsafe \
>              configure-gettext perllocalpod shebang-size \
> +            already-stripped installed-vs-shipped ldflags compile-host-path \
> +            install-host-path pn-overrides unknown-configure-option \
> +            useless-rpaths rpaths staticdev \
>              "
>  # Add usrmerge QA check based on distro feature
>  ERROR_QA_append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
> 
> 
> 
> 
