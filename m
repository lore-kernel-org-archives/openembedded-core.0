Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.63501.1595877738407195606
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 12:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JzdkB9HL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id g10so14011617wmc.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 12:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=XdLDag98HwUENHYu8095xk1jUj1Fj1gZghmvqLTUDlk=;
        b=JzdkB9HLS7cwmzOMoa5xJTv5wZpxsEd+Lk8PdzE6nQgtul8+11ySOS7jQ7WuybhNQy
         0N30t97jeIU1coWK7yT/SxDVbXvga03VapkUHRwZ6Sctwv5FYqYWt/waNS6nddAKp3s+
         FQvhXoJoy6MiLbLr/sEXGmcKRWNGivNvhT4as=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XdLDag98HwUENHYu8095xk1jUj1Fj1gZghmvqLTUDlk=;
        b=lEJFwC1YOvINlp8UDcF6zOh4W2p2uklCC+efh/h1ByQ8qSmAJZeO31E+S7nkDuSHOC
         PS8p3Erz9KlqpgaH/cx33OIYjxNglEk5gjrLKcYjkSICX8IXchwH8F3ljDgaCH6FA18r
         QwrLwHnaFgLTyhK3y3ki9QK1GdlC3IOCn4/cVMKoAr2XqZu1pReo3RyA+Yb5Dq6Op3YN
         jlxS2GdqqxIfwFI9SE6BdZ+tSizdG1Nob8vrcc1yZHuqehyLqo1lshtY1QqAyS10rLoZ
         gxvBufHvFw9IsrbYNBW+OLmPC8sbQfa3CdHxyHb9UO+jicL1LKnuiUilJXq7LSRn4HUo
         mxiw==
X-Gm-Message-State: AOAM530LQCDhewhcV48LjPtr8xLQ46I2uD4Ith94s3NEy8qLGIEEuwqj
	GFRnJWasai2rZw5WmxlAzW0pkQ==
X-Google-Smtp-Source: ABdhPJx3JWOu4q/31NKJSeCe3Jw0vr81dgiISGqW086e+hP/JqMN7jnTlhQ0Jo6O3U0zQdklQ4D8NQ==
X-Received: by 2002:a7b:c05a:: with SMTP id u26mr642730wmc.134.1595877736956;
        Mon, 27 Jul 2020 12:22:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c1c0:577:97eb:ef04])
        by smtp.gmail.com with ESMTPSA id q4sm684794wmq.33.2020.07.27.12.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 12:22:13 -0700 (PDT)
Message-ID: <ee5491c9de9fba8b39c233b648afd7b55b061eec.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] re2c: update to 2.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2020 20:22:11 +0100
In-Reply-To: <20200726194213.351746-1-open.source@oleksandr-kravchuk.com>
References: <20200726194213.351746-1-open.source@oleksandr-kravchuk.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-07-26 at 21:42 +0200, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  meta/recipes-support/re2c/{re2c_1.3.bb => re2c_2.0.bb} | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>  rename meta/recipes-support/re2c/{re2c_1.3.bb => re2c_2.0.bb} (74%)
> 
> diff --git a/meta/recipes-support/re2c/re2c_1.3.bb b/meta/recipes-support/re2c/re2c_2.0.bb
> similarity index 74%
> rename from meta/recipes-support/re2c/re2c_1.3.bb
> rename to meta/recipes-support/re2c/re2c_2.0.bb
> index e9053acdf6..b73b024072 100644
> --- a/meta/recipes-support/re2c/re2c_1.3.bb
> +++ b/meta/recipes-support/re2c/re2c_2.0.bb
> @@ -5,10 +5,8 @@ SECTION = "devel"
>  LICENSE = "PD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
>  
> -SRC_URI = "https://github.com/skvadrik/re2c/releases/download/${PV}/${BPN}-${PV}.tar.xz \
> -           file://CVE-2020-11958.patch \
> -"
> -SRC_URI[sha256sum] = "f37f25ff760e90088e7d03d1232002c2c2672646d5844fdf8e0d51a5cd75a503"
> +SRC_URI = "https://github.com/skvadrik/re2c/releases/download/${PV}/${BPN}-${PV}.tar.xz"
> +SRC_URI[sha256sum] = "89a9d7ee14be10e3779ea7b2c8ea4a964afce6e76b8dbcd5479940681db46d20"
>  UPSTREAM_CHECK_URI = "https://github.com/skvadrik/re2c/releases"
>  
>  BBCLASSEXTEND = "native nativesdk"

The above patch wasn't git rm'd. I fixed it as I merged it.

Cheers,

Richard

