Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D69C433EF
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 01:53:35 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web09.2820.1653616412754673664
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 18:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gT8YqhkJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: armccurdy@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id ck4so6030374ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 18:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oBqQ2/od1Nnz9KKl52Rg/xp4IwGyF0O4CoTr1aS5+o8=;
        b=gT8YqhkJq7Eyi5fAl/Zd+AFLeIttcv8q/qBM3PoOXHyc9VKDpuy5M5evJYreGmB02J
         VFqAdcqzOElOMYidKQfLJc1IeSFwb894kgzetkeOv3bfhHj/s/HN3p6amAKHcXUmTsWW
         bsbIbvdxXRRQk/pdIxBZA06R4ml0wLXZA8gJ+5dZj6pekxNBy608InTvje4BJcsO1fLv
         hBcPI0tuVwteX6DPPHdGaMMRnHyDXVB+mX2Do4dFo/G/zPFEI2B65/2L5S48ASgJqiNX
         81Q0+gvrA/5+Jesxdj1FndqYMsMFtBP9AL8qlRn7Y7sFl+zjeVZjWFezq1YKdXeqWbbQ
         5VWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oBqQ2/od1Nnz9KKl52Rg/xp4IwGyF0O4CoTr1aS5+o8=;
        b=WDg1rGmmaq1Jv4kvVykgib33Am2dCgyGObSaS3s3x3HvTO9itxj4xfMHeM2RIBtgfk
         DzOQs74AI53uoZ+LG7WRB5ScQVNVnIcETl2n0NYpwIcb/jEtz47KDfjy++W0go9B6A35
         oP54BlBhNqOUA37kzHspXCfv0m2Yn67raS/XvPqFX3na9KWP9UyFF/59tGhA1KZOeBSZ
         qotbfgsjR+i1dv/S6mQbBcyAEPLsp25lwNCnk/OvPEn/5AvM/VrgnDadO4oxmaE4AX5g
         UlOYtLQRLVSp6Sapgpke0GlCk9tL5gVmY1aP8ZSaoAeSweH9F6z9T1Qjy6FfEDQLNAsE
         VaIQ==
X-Gm-Message-State: AOAM533cbkYOeYh6zSJR7UiWTOmj+ogJWeeNjOzVg3voBDQL7Shzqgav
	83s8KfXb+K70fWeOU6bU1JD15R4ugydcvR1Y1Fg=
X-Google-Smtp-Source: 
 ABdhPJy7xpn7uvakt7pbGLPPcusuWmKH4hPmAv/mWdltUaqE1ZTw/a1uvQjPqaDyOwUFsMid+/oi+Jip2LU+0eBSmZ8=
X-Received: by 2002:a17:906:50b:b0:6ff:3049:946b with SMTP id
 j11-20020a170906050b00b006ff3049946bmr2634959eja.524.1653616411181; Thu, 26
 May 2022 18:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220527000610.648627-1-zach@aquabyte.ai>
In-Reply-To: <20220527000610.648627-1-zach@aquabyte.ai>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 26 May 2022 18:53:14 -0700
Message-ID: 
 <CAJ86T=VL4og2ZXJpTjmzmkzRxdis5hM6q9f2R8PD7XHpcR5WkA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ccache.bbclass: document CCACHE_MAXSIZE
 variable
To: Zach Welch <zach@mandolincreek.net>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Zachary T Welch <zach@aquabyte.ai>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 May 2022 01:53:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166199

On Thu, May 26, 2022 at 5:06 PM Zach Welch <zach@mandolincreek.net> wrote:
>
> Setting this avoids premature cache object eviction during large builds.
>
> Signed-off-by: Zachary T Welch <zach@aquabyte.ai>
> ---
>  meta/classes/ccache.bbclass | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
> index 4532894c57..913304ab35 100644
> --- a/meta/classes/ccache.bbclass
> +++ b/meta/classes/ccache.bbclass
> @@ -12,7 +12,12 @@
>  #   Set CCACHE_TOP_DIR to a shared dir
>  #   CCACHE_TOP_DIR = /path/to/shared_ccache/
>  #
> -# - TO debug ccahe
> +# - Adjust the ccache size limit to avoid overflow during large builds:
> +#   export CCACHE_MAXSIZE = "100G"
> +#   To find a reasonable limit, set this limit to 0 (no limit), then
> +#   observe how large the ccache directory grows.

The default (ie 5GB) would seem safer for most users. Apart from some
potential loss in performance, there's no downside to reaching the
limit (i.e. there's no "overflow" as you describe it) and 5GB of
compressed object code is already quite a lot. Growing much beyond
that risks just filling the cache up with old stuff that's never going
to be reused anyway.

What kind of "large builds" are you seeing issues with?

> +# - To debug ccache:>  #   export CCACHE_DEBUG = "1"
>  #   export CCACHE_LOGFILE = "${CCACHE_DIR}/logfile.log"
>  #   And also set PARALLEL_MAKE = "-j 1" to get make the log in order
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166197): https://lists.openembedded.org/g/openembedded-core/message/166197
> Mute This Topic: https://lists.openembedded.org/mt/91366715/3619030
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [armccurdy@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

