Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.2644.1630354726636701965
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 13:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xb1d3hah;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id f9-20020a05600c1549b029025b0f5d8c6cso297506wmg.4
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 13:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=iI2yyDdEh5zzpUKf4oqQwpWPQxy+3q7vONm7RVNF+1Y=;
        b=Xb1d3hahaywIeuEyKGIUwGGpw9ItxSkVWuulyDsaLzkL5GtCnLxUC7BFJ/ZE4soNTh
         7pugFd4FSArESOJuE4bBld2YPc2BvZ4CTUkRvdnqQnXeCiOVJ3bw9XcKIu10W4a4esaj
         rYYDEhMbPlbFFaBl3nMllK4byNGVYDRoVE51U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iI2yyDdEh5zzpUKf4oqQwpWPQxy+3q7vONm7RVNF+1Y=;
        b=hvXAl0avndhe2salf3LMTjt1BguRKas/LMfLnep+yEn/ru/sDdX8PgvaSwozW5/7Ul
         SYM/7uWDvTs+4/oZAXqRLonVIK2ePzWRF12an3Z737i9X1i3m1wCqj1IzCCZefMCzyGx
         cqfuxsnrq5Ts36xbvk/6dhg+qKkidngSP5R9EVBLHtxDuHmkAdXQ5L/tJK0spQytERKF
         FB44lJgbIinP9oIbhTHq9U8i0O6m+t9ce1x1dHyAC522sPdixWVCpesVFgtnLde0avIj
         kM/VMgbccKVdh4krKaJlCZ/huw8xs5U5bzjGlYHPd7O30MkJ6q1TyPHjVaQe4v1WaB1N
         EIdA==
X-Gm-Message-State: AOAM532irELdHzXlCOf7B1QvT0EsrEXilkbXRupNJrLr6DqgaPjy9tl0
	BS9ZPgHwpAgWDNy3Sj9p49XTsQ==
X-Google-Smtp-Source: ABdhPJz5PFAkJPlAy7S4fzsPAx3LqlwkOy5ovKOcbr7pKEu+1SZSk3EWIyxREbuGeqeWLakAmm3ONQ==
X-Received: by 2002:a05:600c:4f94:: with SMTP id n20mr755935wmq.110.1630354725009;
        Mon, 30 Aug 2021 13:18:45 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e840:dd4f:b947:28bf? ([2001:8b0:aba:5f3c:e840:dd4f:b947:28bf])
        by smtp.gmail.com with ESMTPSA id h11sm19465764wrx.9.2021.08.30.13.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 13:18:44 -0700 (PDT)
Message-ID: <82b35173ceb0cc5e3a9b82c17c4c2f01730c9998.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] libtool: Only package libltdl for the target
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Saul Wold <Saul.Wold@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 30 Aug 2021 21:18:41 +0100
In-Reply-To: <20210827215743.2027466-1-saul.wold@windriver.com>
References: <20210827215743.2027466-1-saul.wold@windriver.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-08-27 at 14:57 -0700, Saul Wold wrote:
> The libltdl package is not needed for -native or -cross, so make it's
> only packaged for the target class.
> 
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/recipes-devtools/libtool/libtool-2.4.6.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
> index 6748d7468e..38982bf67f 100644
> --- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
> +++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
> @@ -43,7 +43,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_GREP=grep"
>  
>  DEPENDS = "libtool-native"
>  
> -PACKAGES =+ "libltdl"
> +PACKAGES:prepend:class-target =+ "libltdl"
>  FILES:${PN} += "${datadir}/aclocal"
>  
>  FILES:${PN}-dev:remove = "${datadir}/aclocal"

Since native and cross don't generate packages, why do we need to do this?

Rather that what the commit message says, this would seem to cause nativesdk to
be unpackaged?

Cheers,

Richard

