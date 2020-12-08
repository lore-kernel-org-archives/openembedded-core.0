Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.9036.1607437639912347329
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 06:27:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=rMJFtEkK;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.68, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f68.google.com with SMTP id ga15so24869958ejb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 06:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DlAz2DBj00z/GyAS69NpcaBEhjgzBBx7qeqJbPU+f3c=;
        b=rMJFtEkK6/iyaM3HnqTTwstIcpuLeWB0I4UoRkstmIpF3c75VYpD8jLDbDgeHiTxb3
         8rSAv0TxU4rw/W6RpyY7QYgdFGR7bcPI12snzPumvhLeGGc0g5b1q2AAC20wUtn+XS8C
         TMzfIU4lt+d7a97DcuVofYC57bXOssRVxh0IA2VR1Occ4jBF84f6ssY2iaV3xZDwT98P
         fL1XRKyn+1B3emTl0bI6sYZSrz3lGOwte8yZXEqTwMyg9eO19d19EpAMg8aZ+Rl7tuIn
         1dfSPlddPumoWKdnOmJXy8CXQB9yng+kD0HEshKFVQbkMNCGugJIue+myj65HbXgMbUB
         W19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DlAz2DBj00z/GyAS69NpcaBEhjgzBBx7qeqJbPU+f3c=;
        b=LAowo/WJ7ojaIdRPw7hGppB+RfWgtmM7XdlNioTCW3yB6RzSdl7m/DmTkuSxAQ+bP1
         SMpItjFmX1x9VtAuwNr0pJzJ3tu3qw4xhHJpNE9YNZoZJ8rgzdZ2z9s6cG69AR4yGsB2
         y635p1mRK3HSdq4WuDdZcOUUX9guAHmxxJfi8Cqm32gEcgefkDL8sBp+wc/fnhTbg+bQ
         VTpJa7oz+oJQieLeQJTHT7RmrKyXkhtoVDo+ZVuCj/95y92Eliou0QYp/jh/akXNJgaR
         GmfIpQbNHO9/baScT8LOwUYpIMvdhAtLAjktTNZvwoAE9MyyQmGIFePtSgxPnB7ljJQK
         nFBw==
X-Gm-Message-State: AOAM530psgN0kvLijQlvhbKRIQozYkZjXoNpy7LWj/160cGN7h9qULlm
	VEix0RT95wtDRTemG0AUU2nxM1CblnWKZB/E1kVaA+zKrcZwnw==
X-Google-Smtp-Source: ABdhPJxFSD9Qb4J7vlkYcQpqLwbhzuaXmf/fvMGYUFx0BhTC7B2nxXUCt73b6Q+nxy3UyMQoIz7PoKsKIS2NCcCxQ5Y=
X-Received: by 2002:a17:906:edc8:: with SMTP id sb8mr13577019ejb.247.1607437638179;
 Tue, 08 Dec 2020 06:27:18 -0800 (PST)
MIME-Version: 1.0
References: <20201207155410.1671537-1-ross.burton@arm.com>
In-Reply-To: <20201207155410.1671537-1-ross.burton@arm.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 8 Dec 2020 04:27:07 -1000
Message-ID: <CAOSpxdZ2n8x_Qr3eJz6M-4rhuxB+0dM3nEn1-bv1EgU8+q-kRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] coreutils: add SUSE-specific issues to CVE whitelist
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 7, 2020 at 5:54 AM Ross Burton <ross@burtonini.com> wrote:
>
> CVE-2013-0221 through -223 are all SUSE-specific, so add them to the
> whitelist.

Good for dunfell too (with recipe version change of course)?

Steve

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/coreutils/coreutils_8.32.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-core/coreutils/coreutils_8.32.bb b/meta/recipes-core/coreutils/coreutils_8.32.bb
> index 9d1eceef54..4eb357e310 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.32.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.32.bb
> @@ -199,3 +199,6 @@ do_install_ptest () {
>  }
>
>  FILES_${PN}-ptest += "${bindir}/getlimits"
> +
> +# These are specific to Opensuse
> +CVE_WHITELIST += "CVE-2013-0221 CVE-2013-0222 CVE-2013-0223"
> --
> 2.25.1
>
>
> 
>
