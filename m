Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.26987.1599589544330926007
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 11:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fg8WPrk5;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.68, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f68.google.com with SMTP id lo4so23951422ejb.8
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2020 11:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1SV3643+iZuI6x1sQThkQFWutvHwt8phDU8udaR07iI=;
        b=fg8WPrk5IwFj4q7e3eSqa6RyxWFp7Ct6wB0vPpxXLspp54kWTnJe9IuihXaGreVY6F
         XleWHu0SnRiFmTHc+632RN1w/vTvioCvN88/yKyMMuOr3HNGnbHgJIlmQr8mTaOTT4nw
         9aqUL12tHpVjH73n6+AUfPTzvpstNjRacojid+2iNAkGcdGZ7asUsu15Ds3PuliYuUB3
         6/kaTsINAiFrlXeewLhSuPvhM3lHlqpJbwl8enjem6BIpWddXdcKRGgKBE9cMQLYDepM
         g8KrgC3ScWB0KgZM51QCJaP3sJvp+LVCRi/UY96zdKraWdvaCOv/15h6TVLQHK2FP6QF
         tEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1SV3643+iZuI6x1sQThkQFWutvHwt8phDU8udaR07iI=;
        b=rDQdbjqNEV4+Tpbm6D4kCEAmQ5br7OmsDUcugIDZQMuWHc9VB4xGJbfWRCKmup6HY7
         JRXj0f+zTuG8DEULrTMZEpJ1MIeseGP/nQAAzQue+Lry/kQZEbOR4BXfQ2MirDHRvMGX
         15BtXoxz39BaVvCca6k1b2E+BNZV625+2uuOSj8qiT/P/60HdmbbUs1tJXjHv14OxQQE
         1CFiPdPzfZLoDGakGwkN43GbZSixrzmsfNHcEA7GzNtLokc8UwkhlHul2w4T8wVYSVZB
         m0ZfY/5znmK8F+lgckF5BTFE0y/oa6qTRieIGV1XhdbaiMJ2kl4lIE7hQCTCgJasEE2b
         G3qg==
X-Gm-Message-State: AOAM531ZLESMvDaZDvpZ/hJ5bbhg/Ng4hHzluBuPXeCwvGGxyLzhQPck
	YN2m5V0Gubjigk7zZOmdRoxDH0qLEAQKyd23e1l4bg==
X-Google-Smtp-Source: ABdhPJzawfyVRHOB6vxl0ZYW+mAqciWGM6vMCh0CcoSJVpPZMgO9iyuTIN6JUmPlF45bo2rIRF3Vs2o5MlfkjD9TbGc=
X-Received: by 2002:a17:906:1484:: with SMTP id x4mr26723900ejc.81.1599589542592;
 Tue, 08 Sep 2020 11:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200908164744.3791001-1-ross.burton@arm.com>
In-Reply-To: <20200908164744.3791001-1-ross.burton@arm.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 8 Sep 2020 08:25:30 -1000
Message-ID: <CAOSpxdbsWa4c9cb9gXHds9W0=mRC0DAhJE+KRw5NGeDicDYqag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cmake: whitelist CVE-2016-10642
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Is this also suitable for dunfell?

Steve

On Tue, Sep 8, 2020 at 6:47 AM Ross Burton <ross@burtonini.com> wrote:
>
> This CVE is specific to the npm package that can install cmake, so isn't
> relevant to our cmake recipe.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/cmake/cmake.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
> index 1334977225..fa1b818ae4 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -25,3 +25,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
>  SRC_URI[sha256sum] = "5d4e40fc775d3d828c72e5c45906b4d9b59003c9433ff1b36a1cb552bbd51d7e"
>
>  UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
> +
> +# This is specific to the npm package that installs cmake, so isn't
> +# relevant to OpenEmbedded
> +CVE_CHECK_WHITELIST += "CVE-2016-10642"
> --
> 2.28.0
>
> 
