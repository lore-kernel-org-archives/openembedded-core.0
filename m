Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com [209.85.161.66])
 by mx.groups.io with SMTP id smtpd.web10.46939.1590481510072480638
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 01:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kDfvIZ+n;
 spf=pass (domain: konsulko.com, ip: 209.85.161.66, mailfrom: paul.barker@konsulko.com)
Received: by mail-oo1-f66.google.com with SMTP id f39so726885ooi.7
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 01:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lgkwQuZmxLa1UjAfljmAoJGANYBk8Zjs41P53O+9/Xc=;
        b=kDfvIZ+nIuvJ611h2bBkXrB2an7kjN+BcLuQq4gYQUxgnWDsDaclQQkBHIqfnqLKcm
         F9BByroafCn6QipG0iL3Hkh/TzJx/Xg+SZ7YKHkS7034cudR7nIjLmuFwbFnRF7+Tids
         7W6U4eVy8DhSuBo2D4hKYr+ni85MClffz0kpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lgkwQuZmxLa1UjAfljmAoJGANYBk8Zjs41P53O+9/Xc=;
        b=MiCTTBy+1w5AzHG8cTbny9T+NrFI8coA++39wHAmb/vGOe1Mlou70rJieSB627/apw
         4EoaNvrJdSAOFimL1pjShMZ/LIXzYTX86seU/GPaND2fbZoiW3h0LsAYeBJ3wRkJctOr
         vrUTGtDv/a6hk0AqCFAWZJzuUxJmzwDQImMHuIZWfKRwsiJNm7P1dx0JvSrRIphdFtbz
         OvkbbVBCLxszA+9HFyDU5GGHArf5qtxPNv4Zok5deJo6w14+wOoZm1tvg9v+3VPzhr3i
         blSBBSIthPMSY4+rz/xFAYfHgT1Aq4LkwpC436SJhqRljthCg4BRkgAlE4I0/2piOioB
         bADA==
X-Gm-Message-State: AOAM530f9GbFJ9soBjG+dyfH5ZUn9H58zU2MjDa/i5Nx64XoekRIm3yy
	OsY6TDcyBlJ2Uj5QeAz1Fvl6ThFKK0hapjqMKnDbDw==
X-Google-Smtp-Source: ABdhPJy+hd8Kiawvo+N5lBBBTZ5NGp9Gx8gVONYeQgqJte86eO/vPi8BsDsDk7BB/+CBPOpojrDyHNCXv/3hmeBIg54=
X-Received: by 2002:a4a:3388:: with SMTP id q130mr16097091ooq.5.1590481509223;
 Tue, 26 May 2020 01:25:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590445868.git.steve@sakoman.com> <dc5babe9472ba7379edbb17b6cbac44604606b26.1590445868.git.steve@sakoman.com>
In-Reply-To: <dc5babe9472ba7379edbb17b6cbac44604606b26.1590445868.git.steve@sakoman.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 26 May 2020 09:24:59 +0100
Message-ID: <CAM9ZRVt4dKEefgQF8xnGVoEbm4hFiPOzc106YPai0D5-DpuWoQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell 09/17] libubootenv: Depend on zlib
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 May 2020 at 23:37, Steve Sakoman <steve@sakoman.com> wrote:
>
> From: Marek Vasut <marex@denx.de>
>
> The libubootenv depends on zlib as it calls at least crc32() from
> there and links against it. Add the DEPENDS entry.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Stefano Babic <sbabic@denx.de>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> (cherry picked from commit db513f9ec59b7ac526b2cdc42b0eb2573e134bc4)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-bsp/u-boot/libubootenv_0.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> index 3251d0f05b..fa90a12bf8 100644
> --- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> @@ -1,5 +1,5 @@
>  SUMMARY = "U-Boot libraries and tools to access environment"
> -DEPENDS += "mtd-utils"
> +DEPENDS += "mtd-utils zlib"
>
>  DESCRIPTION = "This package contains tools and libraries to read \
>  and modify U-Boot environment. \
> --
> 2.17.1

Is this actually needed for the u-boot version in dunfell? My
understanding when I saw the original patch was that this is a new
requirement of the latest u-boot.

Thanks,

-- 
Paul Barker
Konsulko Group
