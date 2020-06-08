Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.1852.1591648825070672356
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 13:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NRqqe5DA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id h5so18934655wrc.7
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 13:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=00oGspAC98W5u7WHLBZNywcmwXzGmFiZkt7dVn5cOPM=;
        b=NRqqe5DAf+GaxtEemCI0lkFmjtWI8pohSiSk2qVSK9QbZW/0fRHwrzO+q31eWbh9uu
         MChkuIR3B1V6zRl4rkjCb6tTu0ZO7J+umKFgrhYB5sX0pEZrkYH3IsalSwZpJTYueaOh
         lW1fWW/rY+3Y8b7bLen8lJ8tBjgILG1Elmq1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=00oGspAC98W5u7WHLBZNywcmwXzGmFiZkt7dVn5cOPM=;
        b=M2lwwUr+IGmIrTUbqftnWlhKDRhE6ucXO/7gbqrYFAxR5DLQTDl6OonzrrO8t++3e2
         Auwblp8i6mHu096pJDQ0/Ay6tRZEJb7Fd9x+NPTqF3qySsMf3YmCL2bV8XuK8CkYj99a
         w85YeJu/UpHoHyM0jV0un8NH02UEeIg8SP+fUldZ2EObUooLmJ2pvue30fIMfp0h2t9F
         0hQw7Xiw+MtOYVfYHjf6qJnn+0S/8Tn3v416kwuJUVVLwj7Kqk9YNrx0BKq3KqFVooXk
         b6yyFkQh7RhxeqCVs5kBhyj+3IfkR+VbtreN91HVawjbnP/FZ7hqyCuWL+AEUHFLIFOh
         cMuQ==
X-Gm-Message-State: AOAM533yEajnlCUrz5lepO92ekvrJaOrv/cKLY58UaSFX1UKN2FxFmct
	c+XfuS4j46EPbO0wn9QNvgOOLA==
X-Google-Smtp-Source: ABdhPJyFzxZCEnsIayUAYe8nP0M4lEbmxW6sHlvmanWc+mN9HVQ49xeKKf7D3mX+H5IhDv10CzdrCA==
X-Received: by 2002:a05:6000:1ce:: with SMTP id t14mr599776wrx.300.1591648823488;
        Mon, 08 Jun 2020 13:40:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id d11sm847285wrm.64.2020.06.08.13.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 13:40:21 -0700 (PDT)
Message-ID: <cd5fb3ec7c52462d3669349cf8d6e373519f859f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] encodings: rdepends on mkfontscale
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: kai <kai.kang@windriver.com>, openembedded-core@lists.openembedded.org
Date: Mon, 08 Jun 2020 21:40:20 +0100
In-Reply-To: <20200607071851.24949-1-kai.kang@windriver.com>
References: <20200607071851.24949-1-kai.kang@windriver.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-06-07 at 15:18 +0800, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> It runs mkfontdir and mkfontdir during postinst script which are from
> package mkfontscale. So make encodings rdepends on mkfontscale.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-graphics/xorg-font/encodings_1.0.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
> b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
> index 4d61aed183..a299bf2fb2 100644
> --- a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
> +++ b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
> @@ -10,7 +10,7 @@ PE = "1"
>  PR = "r3"
>  
>  DEPENDS = "mkfontscale-native mkfontdir-native font-util-native"
> -RDEPENDS_${PN} = ""
> +RDEPENDS_${PN} = "mkfontscale"

I suspect the correct fix is that it shouldn't have these postinsts?

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=b8f089512f65a4a131c8096c281c4f3d9cf23718

Cheers,

Richard

