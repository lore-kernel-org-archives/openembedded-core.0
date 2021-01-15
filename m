Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.37.1610709823716960325
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 03:23:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Du6iXgf7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id e15so888916wme.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 03:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ygJO6iSKOJJ3lHGv2mIOWmZX9ciCTEeLL6ZA03UmQbE=;
        b=Du6iXgf7XTfYkzmVQBZtKzw7Eql/VnAyYfoKjxAfSudbRZ8YmoBeGSjorktO9o1vt2
         RxRyfQbUJtayhPSNJnsMVC/OlG5b+bALhYDeTqYC2NwWZ0T7vlLVaiynWd6k7RKH77b7
         OyxEX7WKe3OGHcumysu6hxSg33+/sUavPfj6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ygJO6iSKOJJ3lHGv2mIOWmZX9ciCTEeLL6ZA03UmQbE=;
        b=Qi1soR6By+hX+nmcozSXqHj5/EEYC6lxksxw+YZT0MACdKOW4DJvL9rTBwbn4Epxef
         feE/uiSGqaXQOPoMEJEspcqjT71uv02S0D+04bf+0J1zjFCBqHCE7ECltJ0lCOgc8xV3
         Z25wSNr2at8ah24zpHZ7tWfvFdjXESm8I92v3fAev86JBEuDL9LwoDNJ7iN6gjUuE2wm
         Lyuwt27CmvUUyjZqgRMHMAetNtxTBebH/P+JHiTxaeX9ilFccxKykG7qPg9h/A4bbrCE
         ZApOwEtUZk+cg9P9AjF0SdRzxz+TgHWDBOQqjL42N+Y//OfxQl94puEDjRDKdO9gqEKT
         jbpQ==
X-Gm-Message-State: AOAM532tCGnEmpsJXXyg+IcS6qVUhnmodCE1Pj/sgY38Og5TW+RqKZDV
	Rcy7yh+CJuiB1fQR61NXn9E0Zw==
X-Google-Smtp-Source: ABdhPJxVJwP/EhBWy21lQQi8huh67wwye3+xBbuwyPXFhRpm4VGziou2CV1gD7DuLlwlcQdIgXksEQ==
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr8390445wmj.148.1610709822197;
        Fri, 15 Jan 2021 03:23:42 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:974a:2423:c71:b423? ([2001:8b0:aba:5f3c:974a:2423:c71:b423])
        by smtp.gmail.com with ESMTPSA id t124sm12066446wmf.2.2021.01.15.03.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 03:23:41 -0800 (PST)
Message-ID: <502f246c4bf113fb8ae4c6c3db0bc5c1b8ee23d4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH][dunfell][gatesgarth][master] cairo: whitelist CVE-2013-0800
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@bmw.de>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 15 Jan 2021 11:23:39 +0000
In-Reply-To: <20210115104714.36449-1-mikko.rapeli@bmw.de>
References: <20210115104714.36449-1-mikko.rapeli@bmw.de>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-01-15 at 12:47 +0200, Mikko Rapeli wrote:
> It affects only cairo embedded into Firefox.
> 
> https://security-tracker.debian.org/tracker/CVE-2013-0800
> 
> "The description is misleading: Firefox embeds a copy of Cairo, the interdiff
> shows the respective change at mozilla-esr17/gfx/cairo/cairo/src/cairo-image-surface.c
> Apparently the forked copy has changed, the code isn't present in vanilla Cairo"
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  meta/recipes-graphics/cairo/cairo_1.16.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> index 8663dec404..29088ab0d6 100644
> --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> +++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> @@ -29,6 +29,9 @@ SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
>             file://CVE-2019-6462.patch \
>            "
>  
> 
> 
> 
> +# Affects only embedded cairo in Firefox
> +CVE_CHECK_WHITELIST += "CVE-2013-0800"
> +

That sounds a lot like we should send a CPE change upstream to classify
it as firefox rather than cairo?

Cheers,

Richard

