Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.4838.1592391108840339776
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 03:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KoWNCbWO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id r7so1848096wro.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 03:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=8QUWq+BB7Idf5I5zWypps8jPG4h3IafiAZOh7zIeFd0=;
        b=KoWNCbWONHTEbfFxRrbCOeZzKCuR1R6x8TpNU0cwBlJG3TSe49HM6wTIk2stZU+fnn
         kS9ttOUVD/wi9IXmZT0DmLt/P2rl613nMji4XHSZJNqUzlUdMmRUQ7ZXmfal0FZh1R85
         9RkGXpB5ZlTQFfZHl68Z3ULXDQiz2tQTcIhls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8QUWq+BB7Idf5I5zWypps8jPG4h3IafiAZOh7zIeFd0=;
        b=CC9ZW+Nwc4z+X3PahxlE+uCcyaek4wC0FxqB/kU+P2UUTrDE26XiddrAo7j1AvepLA
         NxnGQaSTNKwpcJX2sZ1WXuKZeHbY72SWvmCXOwyk51YDfii+sbz61Jq2dDkrNLoPu5rn
         JUL2Xju83pBZu96chjriEX22iDKMcI8KtGcgTbSeicupErYMhr+GqcEXAQSFIfLdHQNm
         zNIghTJlZrz4YfzlwmEhuAzyxM4iof+nd6+WVjiigtLA+Oi7ifonYuF831wKASdAbJyL
         4g1zcHNC2OuxBU1VGlrbUDR6etIddO9AbK4J1rf4yaxzqMlnG/vEZE6FNaQqQrG+yv90
         OviA==
X-Gm-Message-State: AOAM5315Kw3hfIG/51LV9qII/eVHL6+KGHayIrgBMRW4wJKAwDnJxev8
	UEytNGT9gSg9qkm2SlZwZ1t5Yg==
X-Google-Smtp-Source: ABdhPJzqlDj0vl72VZsUSUo3tV9+/PETzMLVk0UbxfvRuzzHQbV8Fz14oGW1wSmZZCzoUtGoYe4rjw==
X-Received: by 2002:a5d:4cd1:: with SMTP id c17mr7791735wrt.199.1592391107376;
        Wed, 17 Jun 2020 03:51:47 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id j14sm659063wrs.75.2020.06.17.03.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 03:51:46 -0700 (PDT)
Message-ID: <c3582a8864dbda0acefd9128f6d6d5cdddf33a85.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] xinit: add xterm to RDEPENDS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2020 11:51:45 +0100
In-Reply-To: <20200617040731.1195528-1-changqing.li@windriver.com>
References: <20200617040731.1195528-1-changqing.li@windriver.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-06-17 at 12:07 +0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> startx RDEPENDS on xterm, fix below error:
> /etc/X11/xinit/xinitrc: line 55: exec: xterm: not found
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-graphics/xorg-app/xinit_1.4.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
> index c9e28d9bba..5f8c370c59 100644
> --- a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
> +++ b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
> @@ -19,4 +19,4 @@ SRC_URI[sha256sum] = "de9b8f617b68a70f6caf87da01fcf0ebd2b75690cdcba9c921d0ef54fa
>  
>  EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
>  
> -RDEPENDS_${PN} += "util-linux-mcookie"
> +RDEPENDS_${PN} += "util-linux-mcookie xterm"

https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/2015

ERROR: Nothing RPROVIDES 'xterm' (but /home/pokybuild/yocto-worker/qemux86-64-x32/build/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb RDEPENDS on or otherwise requires it)

Cheers,

Richard

