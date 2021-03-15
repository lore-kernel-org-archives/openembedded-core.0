Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.9510.1615818721036938959
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 07:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=egBJ4cvt;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.45, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f45.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so16628591wmj.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 07:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RoG0EVIlS0tzuzkgpWfUqKdO/MG4UdcCX/mjplm6mOw=;
        b=egBJ4cvtFLKMVI2CetCo5mYPQwnHy7PWFe2vz1wCwNNM5IesbmvUVEyX3IbKFozm7U
         GFFVESePQIJvAm2/HiPopI83JhWJfAe/+NETyTAaR5gLGMcxlNH6L9d4fzRg8xFEl8G8
         4TOhymPQ8Wt07QhI/7REK+YkBMyyIiiE7W9JkwTeVDsTG0ZlXdqQsdQwAl5mlTtcBR0C
         PjpOTUw3C7EU6GlliQgiyP/SAGA83uOz+hFeWh56vj18ry5NujJXtA2Ap04HPE7mVYWT
         AZAJbbYvDadgq6VdemeY1u5x71Gr3fiAIaoIxiXKZ7t5UCRGTC0d9O326aTme+0WZdPd
         IAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RoG0EVIlS0tzuzkgpWfUqKdO/MG4UdcCX/mjplm6mOw=;
        b=Ym0FEevF9t8YKeHEx7WiXwiGPz2kgoJfg+vtxEskLYcgawELEK8qtDuFdbiytEeLAA
         6esu68GUP6fIu+a5LClbEd9LbRitTo0nKXONWJXZSpAZrvldVIIt6iZJ5BgPbyS6BOND
         es492XhnV0DJCcRfymEDLfeNAeSa4iltg1l4palN1ri1BoHxP4bQJX63FWBca0mkmD/0
         R7jZUpx5rLSfVPiI24EL6mshga7Z58thdgnA4n/BTQJe9o6gBw32WYlW6b0tnk736w4N
         VHb36oUTx3vBLLCo8AfS5NYpDx3Eh2omWD1U8yk7Rc97iqigHws0wK65LYjRRXqnMxfi
         jPmg==
X-Gm-Message-State: AOAM531LeLJUl3bGx1XaJ4MeIh3JFLqasZJk6uRczVlXMDhCxjoj/nte
	nnf34cCkOFsj8GbClYEugr3n4CHRUUeIDVnKsn1Bcw==
X-Google-Smtp-Source: ABdhPJwIFQglj6ilH0cgREigyjBKotMb4dZ9xegMfWF3YiGnxeiRpI1YIcs/XIToLazpPpElsKi1mC5KYvblyUv9vZY=
X-Received: by 2002:a7b:c083:: with SMTP id r3mr26275774wmh.177.1615818719329;
 Mon, 15 Mar 2021 07:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <166ADC759641893A.19014@lists.openembedded.org> <adcf7d11-13c4-f2ce-4616-eb4d961fe296@windriver.com>
In-Reply-To: <adcf7d11-13c4-f2ce-4616-eb4d961fe296@windriver.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 15 Mar 2021 04:31:46 -1000
Message-ID: <CAOSpxdaJj9DnNL1uZHFzauXrHGRToWA-mfRpp9uhJ3c0c-T08A@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] cups: use /run instead /var/run in systemd's unit file
To: kai.kang@windriver.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 14, 2021 at 3:10 PM kai <kai.kang@windriver.com> wrote:
>
> On 3/10/21 11:09 AM, kai wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> /var/run has been deprecated by systemd, so use /run instead,
> as suggested by systemd.
>
> Ping.

This is in the group of patches sent for review on 3/13:

https://lists.openembedded.org/g/openembedded-core/message/149417

Steve


> [Yocto #14152]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 6c3f56020da7a26c2daea73e39c2f324f1f597db)
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-extended/cups/cups.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
> index 12780cf702..acad3c98c1 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -54,6 +54,7 @@ EXTRA_OECONF = " \
>                 --enable-libusb \
>                 --with-system-groups=lpadmin \
>                 --with-cups-group=lp \
> +               --with-domainsocket=/run/cups/cups.sock \
>                 DSOFLAGS='${LDFLAGS}' \
>                 "
>
>
>
>
>
>
> --
> Kai Kang
> Wind River Linux
>
>
> 
>
