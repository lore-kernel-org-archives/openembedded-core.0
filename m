Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.15185.1625855534245466764
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jul 2021 11:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=AA4HZyct;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.46, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f46.google.com with SMTP id m2so2335646wrq.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jul 2021 11:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=89ZabuSFEhlaBATosCa2h6+uv5fvvH20wBwvKe7KgX4=;
        b=AA4HZyctrSvUOCwsubLmsxGO03lxVdTYtRpcmLnYapmVCV6/DmlACjS9K953jNUJ/C
         B0dhp8T+4HLO4bLETfl7j4sV8Am64pShtLum0fxAMTd2ViV4H1ieit42ijSzXbbGM8Vt
         a5JHQ4UOBKxzsKsdYaZEkRIjwU5oe7cOF7ygznuix6LKIczzNF2JPsmFdyAOpnBIAFOO
         3n7pIruAUkIfiJ79EWt7RLZEI+StzdFGEAGceoGyI6Y3OsCQor31zwIuA9dqSLCSkYSB
         y3NrPxMOLa0gvM9NnbK6kI7sP7bMqoJY/gVL3AZmHF4/ip2vp6W/Ber3nmHL3F0QsoeZ
         3F/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=89ZabuSFEhlaBATosCa2h6+uv5fvvH20wBwvKe7KgX4=;
        b=Bp1fne0qD7LXwOA6RgwLh82zUUvqBe2GD1IaVFsYm4BdVlHdRE1KbbM3YP04FS+HUx
         Gl11+pG+U3wMLm6aT9gfzVMDL/Q6SlbuBH53Cx/WfquodUxmDe+ATCIiCrNwnMyVDKz4
         eV/2ySssGQfJRc4IGI19CwUXVSvp2hjMmY9JghHwcD6FYmw6aq7Qm2zKeSJsHAqd5ppQ
         7ePyUj3ojytHBu8dSRJDwv1YGruCK08E4w7hwDzllLptG4XIMfFOxtALGcFidVp6f+G3
         N2XPrSeVyqb+X/pv0+XM1fRgwz5lGhxFv3WDaLOuYLx+ZYAblTZC7JzxWZj0SZ01qIq7
         23dg==
X-Gm-Message-State: AOAM530jdX1we3Bx8njLvQBX8hPCLQ5IGfkvGz4YfwiT+1qS7DSmqSg3
	gSwSgBNzhuhlcIc4bb8OU+wVysJ+8mP9kXWz0aaBUw==
X-Google-Smtp-Source: ABdhPJyN2hDHYyCupjaKF+oNhDTowURRPkzxTs2d7ffL4LZ6rKAF714ygRCO68ZwutIRs3xnK6g6qt+2P18408a9gNU=
X-Received: by 2002:a05:6000:2c6:: with SMTP id o6mr42880198wry.299.1625855532661;
 Fri, 09 Jul 2021 11:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210709181630.63081-1-marex@denx.de>
In-Reply-To: <20210709181630.63081-1-marex@denx.de>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 9 Jul 2021 08:32:01 -1000
Message-ID: <CAOSpxdayDMfbkBP8bs062Ft=2uvAJ3PHR7bfLunD5NsBDb5osg@mail.gmail.com>
Subject: Re: [PATCH][dunfell] update-rc.d: update SRCREV to pull in fix for non-bash shell support
To: Marek Vasut <marex@denx.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Changqing Li <changqing.li@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

I'll cherry-pick this into dunfell once it hits master.

Steve

On Fri, Jul 9, 2021 at 8:16 AM Marek Vasut <marex@denx.de> wrote:
>
> This pulls in non-bash shell fix for enable/disable command, upstream
> commit 8636cf4 ("update-rc.d: Fix enable/disable command"). This way
> update-rc.d works with e.g. dash shell again.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Changqing Li <changqing.li@windriver.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-core/update-rc.d/update-rc.d_0.8.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
> index 75632d9434..da716674c3 100644
> --- a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
> +++ b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
> @@ -7,7 +7,7 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://update-rc.d;beginline=5;endline=15;md5=d40a07c27f535425934bb5001f2037d9"
>
>  SRC_URI = "git://git.yoctoproject.org/update-rc.d"
> -SRCREV = "4b150b25b38de688d25cde2b2d22c268ed65a748"
> +SRCREV = "8636cf478d426b568c1be11dbd9346f67e03adac"
>
>  UPSTREAM_CHECK_COMMITS = "1"
>
> --
> 2.30.2
>
