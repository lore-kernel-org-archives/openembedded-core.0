Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BBCC4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 15:59:24 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.5106.1670601554626823424
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 07:59:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=aEut+T8m;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.44, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f44.google.com with SMTP id r26so3637324edc.10
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 07:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7RjW4ug1leGO3PZSlok8ehCiRt9qiUxn7E8cXAiFb7M=;
        b=aEut+T8mE3ggvoQ31d0gIFpixX3U3PZpCJ9bHWlxEFXl0TcJgThh3iFhqGwnpQ24rW
         657HGm9OPWMlnbpj3BchAhbR/4vtcUvh2sqT2zf0BtoNxIKdOjgXZowYfKoCN8qN5Ax2
         zkydqHu0f3LGm8p43/N1cbqc8bV+UWnchrWzoHH3HbG4yXzmbDRH9bBeXW+BV7CaO4QT
         DUQDDiSgan/BP0csXchftn33p1QRcNgja+9mFmJMe4eA6ZQeq1qZqotrOk3TTKiZTwq9
         EWcfwf+C/C/fgANVdYZ6LKSLCLCEFFY0mVUwxdMLszcOaQUfC4E4ERfRbltqWEzjKz4p
         CrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7RjW4ug1leGO3PZSlok8ehCiRt9qiUxn7E8cXAiFb7M=;
        b=n6rRt20k18df8jcQMoTfwFEs4XMLIUVodSplK/vVmLAZpUmN+64MmCMsCgKlH0F3V+
         Zw0K1z3j0jwSJ8G22MjI8FygSLWFNudUugOsvQDgKNoDdn/KtuC8FDuIFAouDwbPO54+
         HLPi+PYwjnYpAWDkW5IAZsHnYlCktWz1Ks1uLjewMcdJynpRcn4Rjn4FUKza1i7P/RnD
         JNB3uwE+krnnWofazmLRJGx+18wNRtjaoUQr31ZciXBEyFQuqwZdHkhUGlqkkfPZYlzd
         yqzNPHjg9O3fWM6Qw9IKFujwZf/LlTWFMhfQubqCRIZTYgROLpc2fYGB8PoFOxFwr/Cy
         n96A==
X-Gm-Message-State: ANoB5pnY9rrFkq3ZexeAScaxDAzNhz4R/Ppfh5icCqKWzY6c4GK9Tbpz
	WhtIcU6EnCI8/e3uOCWbLhWPDCbqoWX9jygewkIAVw==
X-Google-Smtp-Source: AA0mqf72gm6J/KEpOiWSmCZOIjtnUsCKdMuFQsICk5zUYxUB9MdYcCSeejnqkgJkTe2XXfc5zz4GcEbCfFxfiGLqfjE=
X-Received: by 2002:a05:6402:14c3:b0:46d:a00e:4361 with SMTP id
 f3-20020a05640214c300b0046da00e4361mr1679596edx.118.1670601552578; Fri, 09
 Dec 2022 07:59:12 -0800 (PST)
MIME-Version: 1.0
References: <20221209152504.2513715-1-mbriand@witekio.com> <20221209152504.2513715-2-mbriand@witekio.com>
In-Reply-To: <20221209152504.2513715-2-mbriand@witekio.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 9 Dec 2022 05:59:01 -1000
Message-ID: <CAOSpxdaEDSkWoQQFTctAY+7wyb6wtqgXKNrio3T-3kX8vWPTqQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH 2/2] dbus: Update to 1.12.24
To: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
Cc: openembedded-core@lists.openembedded.org, Qi.Chen@windriver.com, 
	Mathieu Dubois-Briand <mbriand@witekio.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 15:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174465

I suspect you aren't using the current dunfell head since dbus has
already been bumped to 1.12.24:

https://git.yoctoproject.org/poky/commit/?h=dunfell&id=bff6562223f646404842ae1631a9df17158808b8

Steve

On Fri, Dec 9, 2022 at 5:25 AM Mathieu Dubois-Briand
<mathieu.dubois-briand@hyprua.org> wrote:
>
> Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
> ---
>  .../dbus/{dbus-test_1.12.20.bb => dbus-test_1.12.24.bb}       | 0
>  meta/recipes-core/dbus/dbus.inc                               | 4 ++--
>  meta/recipes-core/dbus/{dbus_1.12.20.bb => dbus_1.12.24.bb}   | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-core/dbus/{dbus-test_1.12.20.bb => dbus-test_1.12.24.bb} (100%)
>  rename meta/recipes-core/dbus/{dbus_1.12.20.bb => dbus_1.12.24.bb} (100%)
>
> diff --git a/meta/recipes-core/dbus/dbus-test_1.12.20.bb b/meta/recipes-core/dbus/dbus-test_1.12.24.bb
> similarity index 100%
> rename from meta/recipes-core/dbus/dbus-test_1.12.20.bb
> rename to meta/recipes-core/dbus/dbus-test_1.12.24.bb
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> index 4eecc6921624..7e2325a0e102 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -10,8 +10,8 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
>             file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
>  "
>
> -SRC_URI[md5sum] = "dfe8a71f412e0b53be26ed4fbfdc91c4"
> -SRC_URI[sha256sum] = "f77620140ecb4cdc67f37fb444f8a6bea70b5b6461f12f1cbe2cec60fa7de5fe"
> +SRC_URI[md5sum] = "2d118d2d29e895eb3b47ccd68670403e"
> +SRC_URI[sha256sum] = "bc42d196c1756ac520d61bf3ccd6f42013617def45dd1e591a6091abf51dca38"
>
>  EXTRA_OECONF = "--disable-xml-docs \
>                  --disable-doxygen-docs \
> diff --git a/meta/recipes-core/dbus/dbus_1.12.20.bb b/meta/recipes-core/dbus/dbus_1.12.24.bb
> similarity index 100%
> rename from meta/recipes-core/dbus/dbus_1.12.20.bb
> rename to meta/recipes-core/dbus/dbus_1.12.24.bb
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174463): https://lists.openembedded.org/g/openembedded-core/message/174463
> Mute This Topic: https://lists.openembedded.org/mt/95562256/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

