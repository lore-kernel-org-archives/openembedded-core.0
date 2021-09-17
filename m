Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.5942.1631837296750874326
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 17:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SXVWEAWN;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id t20so5713568pju.5
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 17:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=auq5+5IAbezmKOxfgbjur9gHGJVYplefmsDhNI/e+5w=;
        b=SXVWEAWNvk6TC/sTZ1EXYHlRsiX91k9KppXoVWPax7BvDQqXfZOaH2eJJlrQE/RJYS
         uf1ZDFYIJDhfld66XP1Dky7fbCYLbH/AYx3nlPZMc4QGs6w4zqHJY7HL1HXTqawWlvzI
         pvo1B/ktcneqQK7d11xARVzW0JkKhGT57fblo22Vx2TVJg9Tqq8kW2bKa/IE1o1wswM5
         bbxI5Lyrybj8AVo/PHroVFTdHH81PnJ8c3mSCUbbd8IBqvwkTzQ+WEXltfdciSSsA+/n
         9MyAtJTqUfJXiDIlcoYFThyKfCQcGaZi+87kQUhcqvJsP1vMYkkhk0iiUzQlC5mdAU83
         rqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=auq5+5IAbezmKOxfgbjur9gHGJVYplefmsDhNI/e+5w=;
        b=2fxcEAbcAJuamIkoeQeKi2AYuykFNSSgaz8kzwDUaNuEM5G81KkrkCENXXV1pQ/I9N
         NKsS1CZdu4OFe0ZLsH6T9tNGo53/0VrQ4JRfYlBEXT2DlT/IJdtp8ds44lR68NwsRN1y
         FwddPwsIax6ubwzlR2H0A9gEf1fULgGwmQrnoUPGN+mWafrrvEzEbOxIomRPXK5yFx9T
         Kv19F2FIdysu6oFMmck6ZVuqOPN6aQfEz8sR9iCHIlWTBzKoFA5BDqAGA3U1YpNUU2s6
         8AC5usrkJZk6rN5YWqfW3/nVyu6buZbRg3eNntFFS7srxUPfuzKmUZ7zX6ZjTJ8svzBu
         xl5w==
X-Gm-Message-State: AOAM530+odrJBsjAxcnkqrW3aDcHMqg0NAMadgHktf1oGx8b3kJCkyoQ
	7a2pgRBfGxd5TKB43cDhqG7MGrT5lA8=
X-Google-Smtp-Source: ABdhPJzZ94fBWhqo+BoXpvSBUWiGsXuBWHkMQGD6z7lLw5ZcMjIw59dVEyYmer5vecUSc7b1d271Sg==
X-Received: by 2002:a17:90a:6c97:: with SMTP id y23mr9131999pjj.117.1631837295932;
        Thu, 16 Sep 2021 17:08:15 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:8e48:889d:1351:d2d2? ([2601:202:4180:a5c0:8e48:889d:1351:d2d2])
        by smtp.gmail.com with ESMTPSA id 21sm3920573pfh.103.2021.09.16.17.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 17:08:15 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 2/3] README: update mailing list address
To: Jon Mason <jdmason@kudzu.us>, openembedded-core@lists.openembedded.org
References: <20210916224010.21213-1-jdmason@kudzu.us>
 <20210916224010.21213-2-jdmason@kudzu.us>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <24d4a049-fe3a-f8c0-54e9-e02b8d03289c@gmail.com>
Date: Thu, 16 Sep 2021 17:08:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210916224010.21213-2-jdmason@kudzu.us>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

If you are updating this, please check with Bruce on which  mail address
he prefers.

It may bounce from windriver.

-armin



On 9/16/21 3:40 PM, Jon Mason wrote:
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  meta-yocto-bsp/README.hardware.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-yocto-bsp/README.hardware.md b/meta-yocto-bsp/README.hardware.md
> index 9803af006ae7..095815e1bca2 100644
> --- a/meta-yocto-bsp/README.hardware.md
> +++ b/meta-yocto-bsp/README.hardware.md
> @@ -37,7 +37,7 @@ variable value corresponding to the board is given in brackets.
>  Reference Board Maintenance
>  ===========================
>  
> -Send pull requests, patches, comments or questions about meta-yocto-bsps to poky@yoctoproject.org
> +Send pull requests, patches, comments or questions about meta-yocto-bsps to poky@lists.yoctoproject.org
>  
>  Maintainers: Kevin Hao <kexin.hao@windriver.com>
>               Bruce Ashfield <bruce.ashfield@windriver.com>
>
> 
>

