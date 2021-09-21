Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.1898.1632248188683273034
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 11:16:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112 header.b=2Fx8PCYM;
 spf=pass (domain: burtonini.com, ip: 209.85.221.53, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f53.google.com with SMTP id t8so41938799wrq.4
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 11:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oDvdmfkEutXXznjczlMmxPBwqG7J1u4O6clDxvi+gMo=;
        b=2Fx8PCYMhUBYwv0eYotvzXPZTkLa/NNJc4AK1+fR1aE4prfdXz9TQ+2D4jQ93JbW3S
         1bwfDU3BqbqXn0lfbbDNsXfQCpLbBNWpenKk1phd0LX1GqCLciyrP0Rm6lfWKn5aE3dJ
         Egz3MRBaH7auNXtt+t3Q8Saqm3zcJC1cGpMeHya+on+BA7of7h55VFx5/KUk2+5DN956
         B7Xpf1ky7UYpxfizGfC4uAeoWlgyxLy1jnghoW1T3RaCtV6oyI3lJrJZVu/13jLGCjW5
         gZVJ7pyfyq7oHvgp5np5DTWr2JuMfHYmndiJ34MVw0sfRhHHurXW9aPq9hYSe0VAF63q
         sEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oDvdmfkEutXXznjczlMmxPBwqG7J1u4O6clDxvi+gMo=;
        b=WA/Id5GJk+OWTvhCCw8Quphr2EdWTbC2fKTs+r97cTenDRCCE4oDzWld0B+AhPNUYQ
         RKZ8xj3yHSNeQHhYrRhokzFYFc6kW+9OUmjfRwfmCcFWMo/rYevP2MH7PZoo40OPuw+z
         u/8eedjnB/ueQZkzpds9kzhkjUnA/naGlGHb9jP8wfZIAQDo6CCYI0ePzYqSkv3fepDh
         0nLLVLtfErwXNqJoNYyUDkMzMPtGej94mD59XyRqJDvt1uORJflfUlaGBlWcc4NKH5I/
         XzvrfBH7+C4v55c9RF5ZUFCSYGMchEnpg0gGloKrHcoWZkUs9Z1Uixuqj4PVVbwKrpSf
         YsyA==
X-Gm-Message-State: AOAM5307oayTSyBq0d/yU5NMz7Iu/S2Wmi6ZBPDbSu42/OvSiVFGaOBh
	iXGHwAgB0LRZL25UkB5zpWWctmIduVuynwBh8PKy+EzVYkJwTw==
X-Google-Smtp-Source: ABdhPJz8GguvaOC8yoVdIoe1X0Diezzln7a7pBOf0H2445gxQzEpFkuWY+r0vDkG0NvjNoJ9R5i1RYOTfo6asN8qBxQ=
X-Received: by 2002:a1c:4486:: with SMTP id r128mr6173651wma.69.1632248187036;
 Tue, 21 Sep 2021 11:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210921170217.2977601-1-raj.khem@gmail.com>
In-Reply-To: <20210921170217.2977601-1-raj.khem@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 21 Sep 2021 19:16:16 +0100
Message-ID: <CAAnfSTt-jHFt5+927ohyv4mSz5NtBhcAR-VqtAe8cP4zh+dGVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] riscv: Add configure cache entries for libidl
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

libidl was removed long ago, along with ORBit.  Can we just drop these entirely?

Ross

On Tue, 21 Sept 2021 at 18:02, Khem Raj <raj.khem@gmail.com> wrote:
>
> These were hidden in meta-networking
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/site/riscv32-linux | 3 +++
>  meta/site/riscv64-linux | 3 +++
>  2 files changed, 6 insertions(+)
>
> diff --git a/meta/site/riscv32-linux b/meta/site/riscv32-linux
> index 97de628e22..acc32fd03c 100644
> --- a/meta/site/riscv32-linux
> +++ b/meta/site/riscv32-linux
> @@ -9,3 +9,6 @@ glib_cv_uscore=${glib_cv_uscore=no}
>
>  # startup-notification
>  lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
> +
> +# libidl
> +libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
> diff --git a/meta/site/riscv64-linux b/meta/site/riscv64-linux
> index 38bc5f044d..cf78133ee0 100644
> --- a/meta/site/riscv64-linux
> +++ b/meta/site/riscv64-linux
> @@ -9,3 +9,6 @@ glib_cv_uscore=${glib_cv_uscore=no}
>
>  # startup-notification
>  lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
> +
> +# libidl
> +libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
> --
> 2.33.0
>
>
> 
>
